Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1URxzM-0000ZC-Bv
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 06:59:44 +0200
Received: by mail-pa0-f42.google.com with SMTP id kq13so125691pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 21:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=lNqppEs+9IttoAziQVva4tm7+XcSaz6y0jftQLkNCSE=;
	b=Qj5L49NzdgoCVwy5wkDMYud0LhbfGZJizQKKuYP1x59RqrWsl9Qrp4vtO+2Ijn2aC9
	iwyiaXUwAfFJVt2RYSlusPz7FDsm+LHWR/zPxn5IyDs0z1DynWDD8O2qr4607ziaE/n/
	h5OLwrP46VND44SdSJ3JTcY4gU5mCCvmWxRKHDBrwP4rLwG601DzmfZzDHMH3fYxmjZ1
	I48GQof4dui/t4MZQ18ooHdIVxXQqQQ4XxbmJGkolN01qOVJ9l7LBslKbqxIirJVqZtF
	wQoT/NkM2i5PUZ928r9lvS1njCEDdu+s8GaHWtEKIOvfhM0boTqfB/UaeT8DrTUNV60u
	6TzQ==
X-Received: by 10.66.147.103 with SMTP id tj7mr1388574pab.82.1366087317789;
	Mon, 15 Apr 2013 21:41:57 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([180.109.152.45])
	by mx.google.com with ESMTPS id t1sm952910pab.12.2013.04.15.21.41.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 21:41:56 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 12:38:47 +0800
Message-ID: <4914614.5LoTVAGS7p@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.5-1-ARCH; KDE/4.10.2; x86_64; ; )
MIME-Version: 1.0
Subject: gcc compile error
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
X-List-Received-Date: Tue, 16 Apr 2013 04:59:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

hello, i'm using archlinux, the gcc is 4.8.0.

when compiling gcc 4.7.2 in oe, I got the error:

| /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
r19/gcc-4.7.2/libgcc/libgcc2.c: In function '__absvdi2':
| /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
r19/gcc-4.7.2/libgcc/libgcc2.c:273:1: internal compiler error: Segmentation 
fault



-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


