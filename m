Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rj3Pm-0002On-K1
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 07:36:35 +0100
Received: from mail66-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jan 2012 06:29:10 +0000
Received: from mail66-tx2 (localhost [127.0.0.1])	by mail66-tx2-R.bigfish.com
	(Postfix) with ESMTP id 1E60B600346	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 06:29:10 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail66-tx2 (localhost.localdomain [127.0.0.1]) by mail66-tx2
	(MessageSwitch) id 1325831341522959_6413;
	Fri,  6 Jan 2012 06:29:01 +0000 (UTC)
Received: from TX2EHSMHS037.bigfish.com (unknown [10.9.14.243])	by
	mail66-tx2.bigfish.com (Postfix) with ESMTP id 79791580093	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 06:29:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS037.bigfish.com
	(10.9.99.137) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jan 2012 06:29:01 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 6 Jan 2012 00:29:00 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id q066SwnU022524;
	Fri, 6 Jan 2012 00:28:59 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jan 2012 14:33:22 +0800
Message-ID: <1325831602-1623-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH oe-core v2] valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in RRECOMMENDS-powerpc
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
X-List-Received-Date: Fri, 06 Jan 2012 06:36:35 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    1. add powerpc/powerpc64 into the compatible host list
    2. valgrind requires the non-stripped libraries of ${TCLIBC}, so add
       ${TCLIBC}-dbg into RRECOMMENDS for powerpc

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index f4f3131..d2c4467 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=aee56014c1dd64260a59fd4df38752f6 \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 DEPENDS = "virtual/libx11"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
@@ -19,7 +19,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
 
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
 
 inherit autotools
 
@@ -28,3 +28,5 @@ EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
+RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
+RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
-- 
1.7.0.4




