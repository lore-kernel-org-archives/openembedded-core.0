Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rg6CV-00049d-JY
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 03:58:40 +0100
Received: from mail85-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Dec 2011 02:35:56 +0000
Received: from mail85-am1 (localhost [127.0.0.1])	by mail85-am1-R.bigfish.com
	(Postfix) with ESMTP id A56DE70027C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:35:42 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail85-am1 (localhost.localdomain [127.0.0.1]) by mail85-am1
	(MessageSwitch) id 1325126134658698_17440;
	Thu, 29 Dec 2011 02:35:34 +0000 (UTC)
Received: from AM1EHSMHS012.bigfish.com (unknown [10.3.201.240])	by
	mail85-am1.bigfish.com (Postfix) with ESMTP id F11FA1C005D	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:34:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS012.bigfish.com
	(10.3.207.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Dec 2011 02:35:07 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Wed, 28 Dec 2011 20:35:27 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBT2ZPnI014403;
	Wed, 28 Dec 2011 20:35:26 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Dec 2011 10:39:10 +0800
Message-ID: <1325126350-1560-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 oe-core] valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in RRECOMMENDS
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
X-List-Received-Date: Thu, 29 Dec 2011 02:58:40 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    1. add powerpc into the compatible host list
    2. valgrind requires the non-stripped libraries of ${TCLIBC}, so add
       ${TCLIBC}-dbg into RRECOMMENDS_valgrind

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index 021caa8..2abe173 100644
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
@@ -17,7 +17,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
 SRC_URI[sha256sum] = "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
 
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|ppc|powerpc64|ppc64).*-linux'
 
 inherit autotools
 
@@ -26,3 +26,5 @@ EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
+
+RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
-- 
1.7.0.4




