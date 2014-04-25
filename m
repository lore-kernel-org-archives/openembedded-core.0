Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0144.outbound.protection.outlook.com [207.46.163.144])
	by mail.openembedded.org (Postfix) with ESMTP id E966F65D31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:02:36 +0000 (UTC)
Received: from BLUPR03CA033.namprd03.prod.outlook.com (10.141.30.26) by
	BLUPR03MB245.namprd03.prod.outlook.com (10.255.213.13) with Microsoft
	SMTP Server (TLS) id 15.0.929.12; Fri, 25 Apr 2014 05:02:35 +0000
Received: from BN1BFFO11FD029.protection.gbl (2a01:111:f400:7c10::1:157) by
	BLUPR03CA033.outlook.office365.com (2a01:111:e400:879::26) with
	Microsoft SMTP Server (TLS) id 15.0.934.12 via Frontend Transport;
	Fri, 25 Apr 2014 05:02:35 +0000
Received: from az84smr01.freescale.net (192.88.158.246) by
	BN1BFFO11FD029.mail.protection.outlook.com (10.58.144.92) with
	Microsoft SMTP Server (TLS) id 15.0.929.8 via Frontend Transport;
	Fri, 25 Apr 2014 05:02:35 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s3P52W7l032045;
	Thu, 24 Apr 2014 22:02:33 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Apr 2014 13:01:51 +0800
Message-ID: <1398402111-9683-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.246; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(189002)(199002)(19580395003)(46102001)(87286001)(16601075003)(81542001)(19580405001)(86362001)(74662001)(81342001)(77156001)(74502001)(575784001)(62966002)(31966008)(89996001)(36756003)(50466002)(79102001)(50226001)(48376002)(80976001)(88136002)(44976005)(80022001)(20776003)(47776003)(83072002)(77096999)(4396001)(92726001)(76482001)(87936001)(50986999)(92566001)(99396002)(77982001)(83322001)(6806004)(85852003)(15975445006)(15202345003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB245;
	H:az84smr01.freescale.net;
	FPR:7062CDC5.B30F8E20.BDC91B0C.959EBE4F.2028A; MLV:sfv;
	PTR:gate-az5.freescale.com; MX:1; A:1; LANG:; 
MIME-Version: 1.0
X-Forefront-PRVS: 0192E812EC
Received-SPF: None (: freescale.com does not designate permitted sender hosts)
X-OriginatorOrg: freescale.com
Subject: [PATCH] bumps to remove PRINC use in meta-fsl-ppc
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
X-List-Received-Date: Fri, 25 Apr 2014 05:02:40 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb                | 2 +-
 meta/recipes-core/udev/udev-extraconf_1.0.bb                  | 2 +-
 meta/recipes-core/udev/udev_182.bb                            | 2 +-
 meta/recipes-extended/procps/procps_3.2.8.bb                  | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 34e0a54..5c6bcd0 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r13"
+PR = "r14"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index 3810b28..a0f9dde 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r16"
+PR = "r18"
 
 SRC_URI = " \
        file://automount.rules \
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index a90c289..b216352 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r8"
+PR = "r9"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index e4b82e0..94ac3db 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 3749a1d..54b0885 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r27"
+PR = "r28"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.8.3.2


