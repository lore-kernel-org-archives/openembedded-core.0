Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com (unknown
	[207.46.163.206])
	by mail.openembedded.org (Postfix) with ESMTP id E5CC265E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 06:08:26 +0000 (UTC)
Received: from BLUPR03CA035.namprd03.prod.outlook.com (10.141.30.28) by
	BLUPR03MB293.namprd03.prod.outlook.com (10.141.48.11) with Microsoft
	SMTP Server (TLS) id 15.0.949.11; Fri, 23 May 2014 06:08:12 +0000
Received: from BL2FFO11FD049.protection.gbl (2a01:111:f400:7c09::129) by
	BLUPR03CA035.outlook.office365.com (2a01:111:e400:879::28) with
	Microsoft SMTP Server (TLS) id 15.0.949.11 via Frontend Transport;
	Fri, 23 May 2014 06:08:12 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.1) by
	BL2FFO11FD049.mail.protection.outlook.com (10.173.161.211) with
	Microsoft
	SMTP Server (TLS) id 15.0.949.9 via Frontend Transport; Fri, 23 May 2014
	06:08:12 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.193.20.90])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s4N689wA012327; Thu, 22 May 2014 23:08:10 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 May 2014 14:08:57 +0800
Message-ID: <1400825337-3955-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.1; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(89996001)(92726001)(46102001)(87936001)(88136002)(4396001)(93916002)(36756003)(92566001)(21056001)(79102001)(6806004)(83072002)(85852003)(77982001)(49486002)(76482001)(575784001)(86152002)(87286001)(74502001)(19580395003)(19580405001)(80022001)(81542001)(83322001)(44976005)(81342001)(64706001)(74662001)(77156001)(50226001)(15975445006)(20776003)(99396002)(15202345003)(62966002)(33646001)(26826002)(77096999)(47776003)(50986999)(48376002)(102836001)(31966008)(50466002);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB293;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:gate-tx3.freescale.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 0220D4B98D
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.1
	as permitted sender) receiver=; client-ip=192.88.168.1;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.1)
	smtp.mailfrom=Zongchun.Yu@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: [PATCH 1/2][v2] doxygen-native: add recipe
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
X-List-Received-Date: Fri, 23 May 2014 06:08:30 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 .../doxygen/doxygen-native_1.8.6.bb                |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb

diff --git a/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
new file mode 100644
index 0000000..eac4c9b
--- /dev/null
+++ b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Utilities for generating documentation from source code"
+HOMEPAGE = "http://www.stack.nl/~dimitri/doxygen/index.html"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz"
+
+SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
+SRC_URI[sha256sum] = "6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
+
+inherit native
+
+EXTRA_OECONF = "--prefix ${prefix}"
+
+do_configure () {
+    ./configure ${EXTRA_OECONF}
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
+}
-- 
1.7.0.4


