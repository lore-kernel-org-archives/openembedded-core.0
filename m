Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1ToyHE-00017K-SL
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 16:24:45 +0100
Received: by mail-pb0-f53.google.com with SMTP id jt11so6366933pbb.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Dec 2012 07:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=r4+RcLfU8P0IQBavnGZWM1HUY67kT9RhEl5kc/npIeU=;
	b=o7Mrz5I7E8ZEttoxisqkPz40zEFm4RYe3jaRyULLSOhuzJFTaByREKD12I8QlwUocy
	9/1k0NNWjW2gfK2eR/P5WSNj2Mn3faBDpofPkFC43BurvQXk/UC24fEpg5GpLt5jgkvK
	i8uID3TwxPEdGaVsdbIFM8jfmtkgmoLdrBYHnOikcLG6dZJpyjp5xkI+gVBMPHrcr7le
	zNna2w9sY1RkQy7cfWnn8ztLPEAaEhwoN2YJEPEYS2bphLQvz1QyAYsK2EcaTvPgQ41j
	K7zUZAXvf8X9E7TjFUI9e5XTM2QJa4caDpgERxqRd5D1GU+WpTzY2l9I7wsVKyNT5Kk/
	UNKA==
X-Received: by 10.68.241.232 with SMTP id wl8mr113119347pbc.144.1356793787075; 
	Sat, 29 Dec 2012 07:09:47 -0800 (PST)
Received: from ll-pc.localnet ([183.209.43.246])
	by mx.google.com with ESMTPS id is6sm21578405pbc.55.2012.12.29.07.09.44
	(version=SSLv3 cipher=OTHER); Sat, 29 Dec 2012 07:09:45 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Dec 2012 23:09:06 +0800
Message-ID: <14597559.apOXRQSfRu@ll-pc>
User-Agent: KMail/4.9.4 (Linux/3.6.10-1-ARCH; KDE/4.9.4; x86_64; ; )
MIME-Version: 1.0
Subject: disk space problem
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
X-List-Received-Date: Sat, 29 Dec 2012 15:24:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"


When using poky,  I got following problem:

WARNING: The free inode of /dev/md127 is running low (0.000K left)
ERROR: Immediately abort since the disk space monitor action is 
"ABORT"!
ERROR: Unknown event: <bb.event.DiskFull object at 0x47dbed0>

the disk is  a raid partition, and fs format is reiserfs, the 'statvfs' call 
in bitbake got a zero f_favail.

I don't know it is feature of reiserfs, or bug of reiserfs driver, or python's 
problem.

Any idea?

Yi Qingliang
Nanjing Jilong


