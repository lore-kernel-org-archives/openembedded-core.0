Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfxaR-0000Lc-Iw
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 20:19:03 +0200
Received: by wgbdr1 with SMTP id dr1so3612715wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=z8Riqp0lMsKrpdQh9gvX1noXyZ418cBVQK2G2eciEyY=;
	b=xAGcZ+ifwvqM9Vm+OjrMZJGkqDYr8IATMIoOTnkN6iPwLKJNZK5vrtlP8zKJx3CVN+
	SwbkuNpS/kmKfRaxVhlvap3cmcPNuCuna0jm/8K2d/kxpl+gX/DlYW3PCzAyCl4VCS8f
	jj98tC9qeBTTdG07q1gMZbm0t4QOOHV0JHvw4r1K2GhvgiAGyf736mSGS27WEsicGU+N
	1ySwlGEuAADxY1wWDnL2EVbEkbjDCgkOTN/g8syg6ocMn3BUZXtPG40ReIiKUKG+mi4X
	TJODXl3hR3yib5sZ/hStwxVkH3NflCArfGuUvT9+1kbCc9qw/H3xcqhGBt+D5pI4cHwx
	mo9w==
Received: by 10.216.213.143 with SMTP id a15mr5711338wep.156.1339870103806;
	Sat, 16 Jun 2012 11:08:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm21176714wiz.9.2012.06.16.11.08.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 11:08:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 20:08:18 +0200
Message-Id: <1339870099-24648-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120508180256.GB3138@jama.jama.net>
References: <20120508180256.GB3138@jama.jama.net>
Subject: [PATCH 1/2] recipes: replace CONFLICTS with RCONFLICTS_${PN}
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
X-List-Received-Date: Sat, 16 Jun 2012 18:19:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    4 ++--
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 ++--
 .../xorg-proto/compositeproto_0.4.2.bb             |    4 ++--
 .../xorg-proto/damageproto_1.2.1.bb                |    4 ++--
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    4 ++--
 .../xorg-proto/randrproto_1.3.2.bb                 |    4 ++--
 .../xorg-proto/recordproto_1.14.2.bb               |    4 ++--
 .../xorg-proto/renderproto_0.11.1.bb               |    4 ++--
 .../xorg-proto/resourceproto_1.2.0.bb              |    4 ++--
 .../xorg-proto/xf86dgaproto_2.1.bb                 |    4 ++--
 .../xorg-proto/xf86vidmodeproto_2.3.1.bb           |    4 ++--
 .../matchbox-desktop-sato_git.bb                   |    4 ++--
 meta/recipes-support/db/db_5.3.15.bb               |    4 ++--
 13 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 04fd6a9..376023c 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -7,14 +7,14 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 RPROVIDES = "ssh sshd"
 
-CONFLICTS_${PN} = "dropbear"
+RCONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 253ea43..7dd8844 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,12 +5,12 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r13"
+PR = "r14"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = "virtual/gettext-native"
-CONFLICTS_${PN} = "proxy-libintl"
+RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
           "
diff --git a/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb b/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
index 093ee99..adfee26 100644
--- a/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
+++ b/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
@@ -10,10 +10,10 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2c4bfe136f4a4418ea2f2a96b7c8f3c5 \
                     file://composite.h;endline=43;md5=cbd44d4079053aa75930ed2f02b92926"
 
-CONFLICTS = "compositeext"
+RCONFLICTS_${PN} = "compositeext"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRC_URI[md5sum] = "98482f65ba1e74a08bf5b056a4031ef0"
diff --git a/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
index de2d69c..75d0268 100644
--- a/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
@@ -11,9 +11,9 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d5f5a2de65c3a84cbde769f07a769608 \
                     file://damagewire.h;endline=23;md5=4a4501a592dbc7de5ce89255e50d0296"
 
-CONFLICTS = "damageext"
+RCONFLICTS_${PN} = "damageext"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRC_URI[md5sum] = "998e5904764b82642cc63d97b4ba9e95"
diff --git a/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
index 2c05cf7..39fb88d 100644
--- a/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
+++ b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
@@ -12,8 +12,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=262a7a87da56e66dd639bf7334a110c6 \
                     file://xfixesproto.h;endline=43;md5=c3a9ee6db3532ed0d44dea266cfc97f4"
 
-CONFLICTS = "fixesext"
-PR = "r0"
+RCONFLICTS_${PN} = "fixesext"
+PR = "r1"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
index e4fe37b..17b709f 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
@@ -10,8 +10,8 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fa3f85d9eefaa3a945071485be11343 \
                     file://randrproto.h;endline=30;md5=3885957c6048fdf3310ac8ba54ca2c3f"
 
-CONFLICTS = "randrext"
-PR = "r0"
+RCONFLICTS_${PN} = "randrext"
+PR = "r1"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb b/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
index 24404a7..ad2317c 100644
--- a/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
+++ b/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
@@ -10,8 +10,8 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=575827a0f554bbed332542976d5f3d40 \
                     file://recordproto.h;endline=19;md5=1cbb0dd45a0b060ff833901620a3e738"
 
-CONFLICTS = "recordext"
-PR = "r0"
+RCONFLICTS_${PN} = "recordext"
+PR = "r1"
 PE = "1"
 
 SRC_URI[md5sum] = "1b4e5dede5ea51906f1530ca1e21d216"
diff --git a/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb b/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
index 5eb06cb..ff800ec 100644
--- a/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
+++ b/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
@@ -10,8 +10,8 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f826d99765196352e6122a406cf0d024 \
                     file://renderproto.h;beginline=4;endline=24;md5=3e5e2851dad240b0a3a27c4776b4fd1f"
 
-CONFLICTS = "renderext"
-PR = "r0"
+RCONFLICTS_${PN} = "renderext"
+PR = "r1"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb b/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
index 92c37c6..08b610a 100644
--- a/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
@@ -9,9 +9,9 @@ see and monitor X resource usage of various clients."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=604859305e662503077240fee8c77d97"
 
-CONFLICTS = "resourceext"
+RCONFLICTS_${PN} = "resourceext"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRC_URI[md5sum] = "cfdb57dae221b71b2703f8e2980eaaf4"
diff --git a/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb b/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
index f70d79d..86f3ce3 100644
--- a/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
@@ -10,8 +10,8 @@ reporting."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
 
-CONFLICTS = "xxf86dgaext"
-PR = "r1"
+RCONFLICTS_${PN} = "xxf86dgaext"
+PR = "r2"
 PE = "1"
 
 SRC_URI[md5sum] = "a036dc2fcbf052ec10621fd48b68dbb1"
diff --git a/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb b/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
index 721e7b0..0f31900 100644
--- a/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
@@ -9,9 +9,9 @@ and set video mode timings."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=499be2ff387a42f84628c35f311f1502"
 
-CONFLICTS = "xxf86vmext"
+RCONFLICTS_${PN} = "xxf86vmext"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRC_URI[md5sum] = "e793ecefeaecfeabd1aed6a01095174e"
diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
index 5daeb72..e1a7e0e 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SECTION = "x11"
 DEPENDS = ""
-CONFLICTS = "matchbox-common"
+RCONFLICTS_${PN} = "matchbox-common"
 
 SRCREV = "810b0b08eb79e4685202da2ec347b990bb467e07"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
diff --git a/meta/recipes-support/db/db_5.3.15.bb b/meta/recipes-support/db/db_5.3.15.bb
index 9d2bbe5..a34ad24 100644
--- a/meta/recipes-support/db/db_5.3.15.bb
+++ b/meta/recipes-support/db/db_5.3.15.bb
@@ -13,8 +13,8 @@ DESCRIPTION = "Berkeley DB v5."
 HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
-CONFLICTS = "db3"
-PR = "r5"
+RCONFLICTS_${PN} = "db3"
+PR = "r6"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
-- 
1.7.8.6



