Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9Sgz-00037N-66
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 04:19:13 +0200
Received: from mail48-ch1-R.bigfish.com (216.32.181.175) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 01:58:36 +0000
Received: from mail48-ch1 (localhost.localdomain [127.0.0.1])	by
	mail48-ch1-R.bigfish.com (Postfix) with ESMTP id 828A611D0366	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 01:58:36 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail48-ch1 (localhost.localdomain [127.0.0.1]) by mail48-ch1
	(MessageSwitch) id 1317347856618883_26086;
	Fri, 30 Sep 2011 01:57:36 +0000 (UTC)
Received: from CH1EHSMHS024.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail48-ch1.bigfish.com (Postfix) with ESMTP id
	EF818A4009D for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 01:56:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS024.bigfish.com
	(10.43.70.24) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 01:56:19 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Thu, 29 Sep 2011 20:56:18 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8U1uHff017688	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 20:56:18 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 20:56:17 -0500
Message-ID: <1317347777-10288-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Add bash as RDEPENDS for gstreamer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 02:19:13 -0000
Content-Type: text/plain

This fixes the following build issue:

| error: Failed dependencies:
| 	/bin/sh is needed by gstreamer-0.10.32-r1.ppce500v2

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Not sure how to say we just depend on /bin/sh instead of requiring
the full blown version of bash

 .../gstreamer/gstreamer_0.10.32.bb                 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
index 1713755..63ed7cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
@@ -8,8 +8,9 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
+RDEPENDS = "bash"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
-- 
1.7.6.1




