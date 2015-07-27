Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 92DD8605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6R9UoBC008563; Mon, 27 Jul 2015 10:30:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BKSZt0QVaMCc; Mon, 27 Jul 2015 10:30:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6R9Ua3c008547
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2015 10:30:48 +0100
Message-ID: <1437989436.821.221.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 10:30:36 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: gcc 5.2 failures
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
X-List-Received-Date: Mon, 27 Jul 2015 09:30:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've run a gcc 5.2 test build on the autobuilder:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=3628c3c06fa4195003ac655bcc791acfac775173&limit=50

41 errors (with a few more pending).

The good news is that if we tweak the security flags, the poky-lsb gcc,
elfutils, coreutils and iptables issues can be removed and I have a
patch for this. This leaves:

3.14 kernel failures for edgerouter, genericx86-64, qemuarm, beaglebone,
mpc8315e-rdb

openssl issue for p1022ds

u-boot on imx28evk, p1022ds, mpc8315e-rdb

xf86-video-imxfb-vivante on imx6qsabresd

linux-imx issue on imx53qsb

Some kind of "random" qemu runtime issue (4 cases).

At this point I think we likely need to enter bugs into the bugzilla for
each of these. If we want to switch 1.9 to use this (which I think is
desirable), we need to get this fixed as a priority.

Bruce: How do you want to handle the 3.14 issues? Switch to 4.1? or fix
3.14?

Otavio: The freescale machines are looking unwell, can you help us make
sure the right people know about this?

Cheers,

Richard





