Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1Tktyk-00033j-RI
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 11:00:58 +0100
Received: by mail-pa0-f43.google.com with SMTP id fb10so403676pad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=2bVEvpRAYzVTo5e6F1S8dBHe5mqY03B6XiHvgGD5yTU=;
	b=MoICg/Dq5GkuBXT+FP02xBKQWyIjoEt5HKRoGHvXrZrJeWKSfP3Bv0+NePtCZ5gcNd
	XyE66xXwFPSUzf2zVL60sz3s40eab+Ys/YlzyFJbhL331tFB0Kb9x136Yz70Xi6aV7Z9
	i4GWkwuJijaSp2DuAejhYvqUv5AVJmNxApAeT60BRnWglc+hkg/stydP4VEKjDRnFzsw
	373rbeHH4xIaNdgeol1yijPbSrbtXXKaW+nV9s86cItUIY5yZ+miiyzUBB8wPlxlZo3j
	nCoTqBHanoY5zTqgyvc6MIMD82fDvVNyK5yRVvVCQfrawzOpkK2LyvrAn1LbgNK1gOwi
	CQig==
X-Received: by 10.68.192.70 with SMTP id he6mr4880208pbc.142.1355823968455;
	Tue, 18 Dec 2012 01:46:08 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.52.85])
	by mx.google.com with ESMTPS id na4sm884594pbc.18.2012.12.18.01.46.06
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2012 01:46:07 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:44:41 +0000
Message-ID: <3685219.sqIRCkcXgY@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.4 (Linux/3.6.9-1-ARCH; KDE/4.9.4; x86_64; ; )
MIME-Version: 1.0
Subject: how to use "meta-toolchain-qte"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 10:01:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi, All!

I'm making a qte image of my own. and when compiling qt app, I can't generate 
the Makefile.

I have made "meta-ide-support", and used the env setup script under 
'<build_dir>/tmp'.

I can only got "qmake2", but no "qmake".

after googled, got the "meta-toolchain-qte", but how to use it?
where is the coressponding env setup script?


Yi Qingliang
Nanjing Jilong


