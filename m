Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=VA3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rfnht-0000CL-V4
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 08:13:50 +0100
Received: from mail199-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Dec 2011 06:51:08 +0000
Received: from mail199-va3 (localhost [127.0.0.1])	by
	mail199-va3-R.bigfish.com (Postfix) with ESMTP id 999C45C0073	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 06:50:28 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail199-va3 (localhost.localdomain [127.0.0.1]) by mail199-va3
	(MessageSwitch) id 1325055028469774_25800;
	Wed, 28 Dec 2011 06:50:28 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.254])	by
	mail199-va3.bigfish.com (Postfix) with ESMTP id 6D7153A005C	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 06:50:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS022.bigfish.com
	(10.7.99.32) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Dec 2011 06:51:08 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Wed, 28 Dec 2011 00:51:27 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id pBS6pPsP002872;
	Wed, 28 Dec 2011 00:51:25 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Dec 2011 14:55:08 +0800
Message-ID: <1325055308-17731-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 28 Dec 2011 07:13:50 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    1. add powerpc into the compatible host list
    2. valgrind requires the non-stripped eglibc libraries, so add eglibc-dbg
       into RDEPENDS

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index 021caa8..f3cf5b2 100644
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
+RDEPENDS += "eglibc-dbg"
-- 
1.7.0.4




