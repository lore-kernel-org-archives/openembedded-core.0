Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D167E72B3E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 16:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBLGqI7E009100; Sun, 21 Dec 2014 16:52:18 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X216vvPt5LQn; Sun, 21 Dec 2014 16:52:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBLGq4jF009096
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 21 Dec 2014 16:52:16 GMT
Message-ID: <1419180761.13316.61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Otavio
	Salvador <otavio@ossystems.com.br>
Date: Sun, 21 Dec 2014 16:52:41 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: linux-imx issues with make 3.82
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Dec 2014 16:53:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Otavio,

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/133/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/builds/133/steps/BuildImages/logs/stdio

It seems linux-imx is continuing to fail on some autobuilders but not
others (hence I thought we'd fixed it). It seems the problem is old
kernels with make 3.82. Would you be able to apply something like the
patch in:

http://www.gossamer-threads.com/lists/linux/kernel/1263151

to linux-imx so it works with make 3.82?

Cheers,

Richard


