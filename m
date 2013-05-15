Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1UcVOu-0007Sr-SK
	for Openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 08:42:13 +0200
Received: by mail-pa0-f51.google.com with SMTP id ld10so1198861pab.38
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=bM7vQ+EF0ihnxBqUBkwUDbKCpXVH47QyNRCngJBU9sQ=;
	b=ZmaGTs623Vpp4MH64ddKyEl0OZZCMhGbFYY5fAH45M/N9d6M5xN4S3V9nMKG6OKcKP
	axBfc8XgVoax3pSWEaKK5PsBBbftt5UxJSeFbgWZov5pkbOnYxz4m2p7zt6kHYMcbTmj
	7jU7uTyvzloH61vXkjNINDDdu+kOQYGRW/S3pDHfqEMI2wKhXPtVR47uJpEDR+GTNK1v
	gPyGUun8Pc0CIHwQ4q4yovxEGdhm3A155qRhm0dBVy3qy0azf6yU3rjipOYO+RJmbd6l
	IcIFiQAzvamAk01mqjDe3LL1zOSX7YjOKT1cFbRE+HPnaVx4uxZAa61lmMHcVJjVsCYb
	nQsw==
X-Received: by 10.68.0.199 with SMTP id 7mr10492491pbg.105.1368598987124;
	Tue, 14 May 2013 23:23:07 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.237.163.165])
	by mx.google.com with ESMTPSA id
	ea15sm1999405pad.16.2013.05.14.23.23.04
	for <Openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 23:23:06 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Date: Wed, 15 May 2013 14:19:20 +0800
Message-ID: <3388285.jCfN1Lj2u9@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.11-1-ARCH; KDE/4.10.2; x86_64; ; )
MIME-Version: 1.0
Subject: qt keyboard problem
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
X-List-Received-Date: Wed, 15 May 2013 06:42:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello, all.

I'm running qt application on yocto's qt image. cpu is s3c2442, like mini2440.

the problem is:

key event issued by pressing gpio-key eat by 'getty' (from busybox), 
my application can't receive input event,
if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.

any idea?


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


