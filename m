Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0098.outbound.protection.outlook.com [157.56.111.98])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0437169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:21:28 +0000 (UTC)
Received: from BL2FFO11FD012.protection.gbl (10.173.160.34) by
	BL2FFO11HUB033.protection.gbl (10.173.161.113) with Microsoft SMTP
	Server (TLS) id 15.1.154.14; Wed, 29 Apr 2015 07:47:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD012.mail.protection.outlook.com (10.173.161.18) with
	Microsoft SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Wed, 29 Apr 2015 07:47:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YnMdI-0004cR-GY
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Apr 2015 00:42:12 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 17:44:34 +1000
X-Mailer: git-send-email 1.7.10.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21510.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <7bcebaed-2d7e-4769-a014-3a62e81391a0@BL2FFO11FD012.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(377424004)(189002)(92566002)(19580405001)(19580395003)(6806004)(31696002)(48376002)(575784001)(86362001)(104016003)(50986999)(2351001)(106466001)(74316001)(50466002)(110136001)(1496007)(450100001)(62966003)(47776003)(87936001)(50226001)(4001150100001)(46102003)(229853001)(77156002)(53416004)(70736001)(107986001)(4001430100001)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB033;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB033;
X-Microsoft-Antispam-PRVS: <BL2FFO11HUB033CC302065E1E760B81070F1D70@BL2FFO11HUB033.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BL2FFO11HUB033; BCL:0;
	PCL:0; RULEID:; SRVR:BL2FFO11HUB033; 
X-Forefront-PRVS: 05610E64EE
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2015 07:47:10.8751 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB033
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH] libart_lgpl: Allow art_config.h to be generated at compile time
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
X-List-Received-Date: Wed, 29 Apr 2015 08:21:30 -0000
Content-Type: text/plain

* Remove patch that prevents the Makefile from generating the
  art_config.h file
* Remove pre-generated art_config.h for various architecture
* Add a do_compile prepend to remove the art_config.h that is provided
  in the source so that the compilation will regenerate the file

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 .../recipes-gnome/gnome/libart-lgpl/Makefile.am.patch |   17 -----------------
 .../gnome/libart-lgpl/aarch64/art_config.h            |   10 ----------
 .../gnome/libart-lgpl/aarch64be/art_config.h          |   10 ----------
 .../gnome/libart-lgpl/aarch64be_32/art_config.h       |   10 ----------
 meta/recipes-gnome/gnome/libart-lgpl/arm/art_config.h |   10 ----------
 .../gnome/libart-lgpl/armeb/art_config.h              |   10 ----------
 .../recipes-gnome/gnome/libart-lgpl/i386/art_config.h |   10 ----------
 .../recipes-gnome/gnome/libart-lgpl/i586/art_config.h |   10 ----------
 .../recipes-gnome/gnome/libart-lgpl/i686/art_config.h |   10 ----------
 .../recipes-gnome/gnome/libart-lgpl/mips/art_config.h |   10 ----------
 .../gnome/libart-lgpl/mips64/art_config.h             |   10 ----------
 .../gnome/libart-lgpl/mips64el/art_config.h           |   10 ----------
 .../gnome/libart-lgpl/mipsel/art_config.h             |   10 ----------
 .../gnome/libart-lgpl/powerpc/art_config.h            |   10 ----------
 .../gnome/libart-lgpl/powerpc64/art_config.h          |   10 ----------
 .../gnome/libart-lgpl/x86_64/art_config.h             |   10 ----------
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb        |   12 +++++-------
 17 files changed, 5 insertions(+), 174 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/arm/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/i386/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/i586/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/i686/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips64/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips64el/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mipsel/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/powerpc/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/powerpc64/art_config.h
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/x86_64/art_config.h

diff --git a/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch b/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch
deleted file mode 100644
index 190ba96..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libart_lgpl-2.3.21/Makefile.am
-===================================================================
---- libart_lgpl-2.3.21.orig/Makefile.am	2009-04-18 05:29:25.000000000 -0700
-+++ libart_lgpl-2.3.21/Makefile.am	2010-11-23 23:12:32.445450075 -0800
-@@ -7,8 +7,8 @@
- 
- BUILT_SOURCES = art_config.h
- 
--art_config.h:
--	./gen_art_config.sh > art_config.h
-+#art_config.h:
-+#	./gen_art_config.sh > art_config.h
- 
- EXTRA_DIST = 			\
- 	libart.def		\
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/aarch64/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/aarch64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/arm/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/arm/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/arm/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/i386/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/i386/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/i386/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/i586/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/i586/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/i586/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/i686/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/i686/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/i686/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/mips/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/mips/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/mips/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/mips64/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/mips64/art_config.h
deleted file mode 100644
index d10cd95..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/mips64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/mips64el/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/mips64el/art_config.h
deleted file mode 100644
index d10cd95..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/mips64el/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/mipsel/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/mipsel/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/mipsel/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/powerpc/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/powerpc/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/powerpc/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/powerpc64/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/powerpc64/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/powerpc64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/x86_64/art_config.h b/meta/recipes-gnome/gnome/libart-lgpl/x86_64/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/x86_64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
index 4966ea4..1384616 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
@@ -4,12 +4,8 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 PR = "r2"
 
-ART_CONFIG = "${HOST_ARCH}/art_config.h"
-
 # can't use gnome.oeclass due to _ in filename
-SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
-       file://${ART_CONFIG} \
-       file://Makefile.am.patch"
+SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
 SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
@@ -23,6 +19,8 @@ FILES_${PN}-dev += "${bindir}/libart2-config"
 
 S = "${WORKDIR}/libart_lgpl-${PV}"
 
-do_configure_prepend() {
-	cp ${WORKDIR}/${ART_CONFIG} ${S}/art_config.h
+do_compile_prepend() {
+	# enforce regeneration of art_config.h
+	rm ${S}/art_config.h
 }
+
-- 
1.7.10.4


