Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com (unknown
	[207.46.163.241])
	by mail.openembedded.org (Postfix) with ESMTP id 776BD65FE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 08:59:37 +0000 (UTC)
Received: from DM2PR03CA010.namprd03.prod.outlook.com (10.141.52.158) by
	DM2PR03MB304.namprd03.prod.outlook.com (10.141.54.26) with Microsoft
	SMTP Server (TLS) id 15.0.939.12; Fri, 16 May 2014 08:59:37 +0000
Received: from BN1AFFO11FD009.protection.gbl (2a01:111:f400:7c10::174) by
	DM2PR03CA010.outlook.office365.com (2a01:111:e400:2414::30) with
	Microsoft SMTP Server (TLS) id 15.0.944.11 via Frontend Transport;
	Fri, 16 May 2014 08:59:37 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD009.mail.protection.outlook.com (10.58.52.69) with Microsoft
	SMTP Server (TLS) id 15.0.939.9 via Frontend Transport;
	Fri, 16 May 2014 08:59:37 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.193.20.90])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s4G8xYL0020390;
	Fri, 16 May 2014 01:59:35 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 16:59:51 +0800
Message-ID: <1400230791-5863-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(6009001)(199002)(189002)(68736004)(92566001)(77982001)(69596002)(74662001)(102836001)(31966008)(76482001)(44976005)(86152002)(85852003)(6806004)(74502001)(83072002)(15202345003)(33646001)(19580405001)(20776003)(36756003)(83322001)(19580395003)(4396001)(79102001)(88136002)(50466002)(80022001)(81156002)(87936001)(77156001)(84676001)(64706001)(81542001)(92726001)(46102001)(97736001)(77096999)(47776003)(48376002)(93916002)(575784001)(50226001)(99396002)(50986999)(89996001)(81342001)(21056001)(87286001)(49486002)(62966002)(15975445006);
	DIR:OUT; SFP:; SCL:1; SRVR:DM2PR03MB304;
	H:az84smr01.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 02135EB356
Received-SPF: Fail (: domain of freescale.com does not designate
	192.88.158.2 as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
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
X-List-Received-Date: Fri, 16 May 2014 08:59:40 -0000
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


