FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .

#ADD /engine/ .
#RUN rm -r engine

# If you want to run any other commands use "RUN" before.

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z

#RUN wget --no-check-certificate "https://api.jl-workshop.com/v2/csdlg/download?h=605e4a08a9&url=https%3A%2F%2Fwww.mediafire.com%2Ffile%2Fvqzse7fqfh5yo7r%2F3-4-5.7z%2Ffile" -O 3-4-5.7z
# RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/u/0/uc?export=download&confirm=1w54&id=1Zd9uLYAK61eC_Yin79X59w1BfREfairU' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1Zd9uLYAK61eC_Yin79X59w1BfREfairU" -O 3-4-5piecesSyzygy.zip && rm -rf /tmp/cookies.txt
#RUN 7z e 3-4-5.7z
#RUN rm 3-4-5.7z

RUN wget --no-check-certificate "https://abrok.eu/stockfish/builds/dabaf2220fe0c77400a5f71a91952f510e6a126b/linux64modern/stockfish_21080516_x64_modern.zip" -O stockfishmodern.zip
#RUN wget --no-check-certificate "https://tests.stockfishchess.org/api/nn/nn-3475407dc199.nnue" -O nn-3475407dc199.nnue
RUN 7z e stockfishmodern.zip 
RUN rm stockfishmodern.zip
RUN mv stockfish_21080516_x64_modern stockfishmodern

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x stockfishmodern
# Engine name is here ^^^^^^

CMD python3 run.py
