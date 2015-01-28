Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD9572DAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 14:52:14 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so21262851wes.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HyERD8YJw70ZY5BzSTNYgU+WEmWG6NUOkwH4l1nKijE=;
	b=xXANbu8cNWrmvzbzBc0iT7OAnm/JqXVjDq8edhEXu0yIIUG+6TJ+PV2l1mx40PeF9s
	mqUiGrI0370f4SZ1v77k9Slmwa0demqlr2XX0E+pQ7QEEDuVWkjji7DcKW3MmuP5bctS
	BHvFVAyF43oEmmjTr4P2mZTv53ZGhhzLQrklCV473yyFUat8XRCwd92r2uWkQc7nhXXL
	TupZ4CzCmQ6JgX8lac3PLguSgm9/jaxB6chmPRQfWPz+ts6C6KY/2gEhl6XV0NrdbSTv
	2Yassdq7caZb5L1RGjduTFk3V+WEXr2paWrKuyhM6fnHVJDdFNneaYEJoOGkJNLk5bFe
	T8KQ==
X-Received: by 10.180.75.199 with SMTP id e7mr7902696wiw.21.1422456734197;
	Wed, 28 Jan 2015 06:52:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p6sm6416637wjf.39.2015.01.28.06.52.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 06:52:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:52:08 +0100
Message-Id: <14a080496151c8eedbd7de41cc831fc6eb93843a.1422456689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 1/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 28 Jan 2015 14:52:21 -0000

* it's not complete, but recipes depending on virtual/libx11 are easiest
  to spot, I've long list of PNBLACKLIST for all recipes which cannot
  be built in distro without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb           | 4 +++-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                      | 4 ++++
 meta/recipes-graphics/fstests/fstests_git.bb                          | 4 +++-
 meta/recipes-graphics/glew/glew_1.11.0.bb                             | 4 +++-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                 | 4 +++-
 meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb                  | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb     | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb          | 4 +++-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                    | 4 ++++
 .../startup-notification/startup-notification_0.12.bb                 | 4 +++-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb                    | 4 ++++
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                         | 4 +++-
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb      | 4 +++-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                          | 4 +++-
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb                          | 4 +++-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb         | 4 +++-
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb                       | 4 +++-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb                   | 4 +++-
 21 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index af57fac..01a8b43 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -7,7 +7,9 @@ DESCRIPTION = "Packages required to run the build system"
 PR = "r13"
 LICENSE = "MIT"
 
-inherit packagegroup
+inherit packagegroup  distro_features_check
+# rdepends on libx11-dev
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES = "\
     packagegroup-self-hosted \
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
index 18fc893..3427fdf 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
@@ -5,4 +5,8 @@ include eglinfo.inc
 
 DEPENDS += "virtual/libx11"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SUMMARY += "(X11 version)"
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 57ff9f6..95c33f4 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -13,4 +13,6 @@ LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac
 
 S = "${WORKDIR}/git/tests"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/glew/glew_1.11.0.bb b/meta/recipes-graphics/glew/glew_1.11.0.bb
index 4231320..7eb3532 100644
--- a/meta/recipes-graphics/glew/glew_1.11.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.11.0.bb
@@ -18,4 +18,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
 SRC_URI[md5sum] = "f6d72c7426a5f66580ad09e50816450a"
 SRC_URI[sha256sum] = "69bbce306ac281c4fa806a7a7d02c0596281a2d8f9d70690e98126f23ba513d6"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index 4acac39..f2eb675 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -16,7 +16,9 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BP
 SRC_URI[md5sum] = "fc6cc807f55a3e7c752d8013176875d7"
 SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534217b53"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= "jpeg png xft xsettings"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
index d7a8030..670d9fc 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
@@ -28,7 +28,9 @@ SRC_URI[sha256sum] = "f274a4bc969ae192994a856b7f786c6fce96bae77f96c1c2b71dd97599
 
 S = "${WORKDIR}/Xsettings-client-0.10"
 
-inherit autotools gettext
+inherit autotools gettext distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_configure_prepend() {
     # This package doesn't ship with its own COPYING file and
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index 8ee42c3..32e05bb 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -14,7 +14,9 @@ SRC_URI[sha256sum] = "81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506
 
 S = "${WORKDIR}/matchbox-window-manager-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES_${PN} = "${bindir}/* \
 	       ${datadir}/matchbox \
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 154b967..422d255 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -18,7 +18,9 @@ SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 2eff371..17301a0 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -3,7 +3,9 @@ DESCRIPTION = "Packages required to set up a basic working X11 session"
 LICENSE = "MIT"
 PR = "r1"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+# rdepends on matchbox-wm
+REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index 2d68e97..c53f1b7 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -8,7 +8,9 @@ PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+# rdepends on XSERVER
+REQUIRED_DISTRO_FEATURES = "x11"
 
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 XSERVERCODECS ?= ""
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index fde5144..3537d8c 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -5,7 +5,9 @@
 LICENSE = "MIT"
 PR = "r40"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+# rdepends on x11-common
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES = "${PN} ${PN}-utils"
 
diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index fe886f5..0e1a792 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -2,6 +2,10 @@ SUMMARY = "A clock combined with a game of pong"
 LICENSE = "GPLv2+"
 DEPENDS = "virtual/libx11 xdmcp xau"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "file://pong-clock-no-flicker.c"
 
 LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;beginline=1;endline=23;md5=dd248d50f73f746d1ee78586b0b2ebd3"
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index 363bdcd..6c1b93c 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -17,7 +17,9 @@ SECTION = "libs"
 
 DEPENDS = "virtual/libx11 libsm xcb-util"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index a2d8885..156b329 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 PR = "r47"
 
+inherit distro_features_check
+# rdepends on xdypinfo xmodmap xinit
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
 
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 3d98172..ec0241f 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -16,7 +16,9 @@ SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a
 
 DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
 
-inherit autotools-brokensep
+inherit autotools-brokensep distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 562434f..a9de3d7 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -7,7 +7,9 @@ DEPENDS = "virtual/libx11 libxi"
 PV = "0.7.5+git${SRCPV}"
 PR = "r6"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index 20d66be..ce5df03 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -19,4 +19,6 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.
 SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
index 7e01775..4bfddf0 100644
--- a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
+++ b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
@@ -23,7 +23,9 @@ SRC_URI = "${GPE_MIRROR}/xtscal-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "9bcab80b474d5454477d1ca166a68c34"
 SRC_URI[sha256sum] = "27b9dc2203de9b1706ca39fa6ca80ecab8807909ec901c4a345b8e41178800a1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/X11/Xsession.d/
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index bc3e0fd..6fb264f 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -8,7 +8,9 @@ PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+# rdepends on x11vnc
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
 
diff --git a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
index 8d01124..1a1ce6c 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
@@ -11,7 +11,9 @@ SRC_URI[sha256sum] = "eef9660b14fdf0fb1f30d1be7c72d591fa7cbb87b00ca3a444425712f4
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-inherit autotools gtk-doc pkgconfig
+inherit autotools gtk-doc pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--disable-introspection --disable-xevie --with-dbus-daemondir=${bindir}"
 
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index dfbd11c..66a892a 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 DEPENDS = "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
 RDEPENDS_${PN} += "base-files"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
            file://sepbuildfix.patch \
-- 
2.2.1


