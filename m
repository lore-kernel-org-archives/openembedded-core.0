Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3WpG-0003An-BO
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 20:35:46 +0200
Received: from mail50-ch1-R.bigfish.com (10.43.68.225) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.23; Mon, 20 Aug 2012 18:23:43 +0000
Received: from mail50-ch1 (localhost [127.0.0.1])	by mail50-ch1-R.bigfish.com
	(Postfix) with ESMTP id 328BC4200B4	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 18:23:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail50-ch1 (localhost.localdomain [127.0.0.1]) by mail50-ch1
	(MessageSwitch) id 1345487021320982_7293;
	Mon, 20 Aug 2012 18:23:41 +0000 (UTC)
Received: from CH1EHSMHS011.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.231])	by mail50-ch1.bigfish.com (Postfix) with ESMTP id
	4C9EA20046 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 18:23:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS011.bigfish.com
	(10.43.70.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 20 Aug 2012 18:23:40 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Mon, 20 Aug 2012 13:23:40 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7KINdlQ015889 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 11:23:39 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 13:23:37 -0500
Message-ID: <1345487019-931-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [for-denzil 1/3] poky.conf: add distros that work correctly
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
X-List-Received-Date: Mon, 20 Aug 2012 18:35:46 -0000
Content-Type: text/plain

All the builds pass for these distros as well

atom-pc, beagleboard, mpc8513e-rdb, routerstationpro

As well as other powerpc targets:

p1022ds, p4080ds, p5020ds, p5020ds-64b

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta-yocto/conf/distro/poky.conf |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index 6107993..e89697c 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -70,11 +70,13 @@ SANITY_TESTED_DISTROS ?= " \
             Ubuntu 10.04.4 LTS \n \
             Ubuntu 11.10 \n \
             Ubuntu 12.04 LTS \n \
+            Fedora release 13 (Goddard) \n \
             Fedora release 15 (Lovelock) \n \
             Fedora release 16 (Verne) \n \
             Fedora release 17 (Beefy Miracle) \n \
             CentOS release 5.6 (Final) \n \
             CentOS release 5.7 (Final) \n \
+            CentOS release 5.8 (Final) \n \
             CentOS release 6.2 (Final) \n \
             Debian GNU/Linux 6.0.4 (squeeze) \n \
             openSUSE 11.4 \n \
-- 
1.7.9.7




