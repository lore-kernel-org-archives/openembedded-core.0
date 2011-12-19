Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rccey-0006t9-PW
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:51:41 +0100
Received: from mail149-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.23; Mon, 19 Dec 2011 12:24:13 +0000
Received: from mail149-ch1 (localhost [127.0.0.1])	by
	mail149-ch1-R.bigfish.com (Postfix) with ESMTP id 37D9D2C01A1	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:24:35 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail149-ch1 (localhost.localdomain [127.0.0.1]) by mail149-ch1
	(MessageSwitch) id 1324297473126115_13776;
	Mon, 19 Dec 2011 12:24:33 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail149-ch1.bigfish.com (Postfix) with ESMTP id
	167BD400043	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:24:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 19 Dec 2011 12:24:11 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 19 Dec 2011 06:24:15 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBJCOD9S002544;
	Mon, 19 Dec 2011 06:24:14 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 20:27:11 +0800
Message-ID: <1324297631-11187-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH oe-core v2] valgrind: remove COMPATIBLE_HOST to extend the supported arch
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
X-List-Received-Date: Mon, 19 Dec 2011 12:51:41 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index 021caa8..0a09ea1 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=13a71cedba99112334d8596162aec37e \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 DEPENDS = "virtual/libx11"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
@@ -17,8 +17,6 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
 SRC_URI[sha256sum] = "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
 
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-
 inherit autotools
 
 EXTRA_OECONF = "--enable-tls"
-- 
1.7.0.4




