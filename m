Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tgajv-0006Qx-AQ
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:39:43 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 04:25:16 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so6052141fav.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 04:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=W+5YoJO5DRrlNLIBzMo93aA/YIuWpkVgPrIbQJmJoEE=;
	b=Zu47fTr7ywz43etGsrt32soy4z7RvLxJaKuRnnwEEjjwQijwvcp5Gtf9FXva+e9rxK
	QgQRqJ1jsTrRjCODX53kErygt8oXrrDbZK7eH1ffBl6qzEyW5NKHdZFauXGiONBmCuer
	WjoS6PsFggKHaEZQNE+t0zseIRTEdP6dCXapCEjfdToUrate0/AgwyD5oHXokPSA+i5G
	QcSyHTwUzsJU+iD9i8K8YIPSEdgwUy47z6Iy2nqW4xJb0/f08+N1gehYGMsyxJ7U3vUl
	D0S6AigXWWMuGKRPWPdz8hyo1/72HKU4z4nooPJvJ07l6rZEuYOuOhKtPNrFTnGTAgyJ
	1z0g==
Received: by 10.180.94.226 with SMTP id df2mr8766958wib.11.1354796714579;
	Thu, 06 Dec 2012 04:25:14 -0800 (PST)
Received: by 10.180.94.226 with SMTP id df2mr8766920wib.11.1354796714122;
	Thu, 06 Dec 2012 04:25:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm22921211wib.4.2012.12.06.04.25.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 04:25:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:23:33 +0000
Message-Id: <98aea552ba80d099145992525eaed1f1eff93e22.1354796499.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <00c93976db485ebbff0096fe35a57c641ce876c9.1354796499.git.ross.burton@intel.com>
References: <00c93976db485ebbff0096fe35a57c641ce876c9.1354796499.git.ross.burton@intel.com>
In-Reply-To: <cover.1354796499.git.ross.burton@intel.com>
References: <cover.1354796499.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlfrfqOcve6JQFEBzRk1RlQ4GzRcWjDro8+XwORbo7/nDs7Pe1SyUvls0Abt4iDfNyItDM16Nw471b06qguh67YhhA7ZebxsIKnUN5o6/OjRSC0QP9PzTB0M9zDZW2D4Fv557qmbpeF8d4VjiYim4ei4AAk8Q+Pa3aSKNcHcMEbKj2j6fEaGW8aY3Sxn/QX8nKa7wuW
Subject: [PATCH 3/3] mesa-dri: upgrade -git version to current master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 12:39:43 -0000

license.html was reformated so the checksum changed.

The GLSL compiler can be built using CC_FOR_BUILD, so we don't need
mesa-dri-glsl-native.

Update common packaging to include libdricore and the skeleton libgles3, and
remove the driver .la files.

mesa-git/uclibc.patch isn't applied, remove.

x32 support is integrated into mklib, drop 0003-fix-for-x32.patch.

uclibc is checked for upstream, drop 0001-Compile-with-uclibc.patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc         |   13 ++++-
 .../mesa/mesa-dri-glsl-native_git.bb               |   23 --------
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |   17 ++----
 meta/recipes-graphics/mesa/mesa-git/uclibc.patch   |   57 --------------------
 5 files changed, 17 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-git/uclibc.patch

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index e661eee..c11d402 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r6"
+INC_PR = "r7"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -40,15 +40,20 @@ EXCLUDE_FROM_WORLD = "1"
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
+             libdricore libdricore-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
+             libgles3-mesa libgles3-mesa-dev \
             "
 
 do_install_append () {
     # GLU is now in libglu (this shouldn't be required in Mesa 9.x)
     rm -f ${D}${includedir}/GL/glu*
+
+    # Drivers never need libtool .la files
+    rm -f ${D}${libdir}/dri/*.la
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
@@ -56,7 +61,8 @@ do_install_append () {
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     for p in (("libegl", "libegl1"), ("libgl", "libgl1"),
-              ("libgles1", "libglesv1-cm1"), ("libgles2", "libglesv2-2")):
+              ("libgles1", "libglesv1-cm1"), ("libgles2", "libglesv2-2"),
+              ("libgles3",)):
         fullp = p[0] + "-mesa"
         pkgs = " ".join(p)
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
@@ -74,6 +80,7 @@ python __anonymous() {
 }
 
 FILES_${PN} = "${sysconfdir}/drirc"
+FILES_libdricore = "${libdir}/libdricore*.so.*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
@@ -83,12 +90,14 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
+FILES_libdricore-dev = "${libdir}/libdricore*.*"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
+FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
deleted file mode 100644
index 4611f80..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require mesa-dri-glsl-native.inc
-
-LIC_FILES_CHKSUM = "file://../../docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
-
-SRCREV = "c1f4867c89adb1a6b19d66ec8ad146115909f0a7"
-PV = "8.0.4+git${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git"
-S = "${WORKDIR}/git/src/glsl"
-
-inherit native
-
-# use default config for native build
-do_configure_prepend() {
-	ln -sf ${S}/../../configs/default ${S}/../../configs/current
-}
-
-do_install() {
-	install -d ${D}/${bindir}/glsl
-	install -m 755 ${S}/builtin_compiler ${D}/${bindir}/glsl/builtin_compiler
-	install -m 755 ${S}/glsl_compiler ${D}/${bindir}/glsl/glsl_compiler
-}
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index e9e4a88..69a433e 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -5,4 +5,4 @@ require mesa-dri.inc
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index b907931..d558d0b 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -1,21 +1,14 @@
-DEPENDS += "mesa-dri-glsl-native"
+# Current pre-9.1 commit
+SRCREV = "1665af3066f3d58c42e9d5b13098f13615a7672c"
+PV = "9.1~git${SRCPV}"
 
-SRCREV = "c1f4867c89adb1a6b19d66ec8ad146115909f0a7"
-PV = "8.0.4+git${SRCPV}"
-
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
 FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://0001-Compile-with-uclibc.patch \
            file://0002-cross-compile.patch \
-           file://0003-fix-for-x32.patch \
            "
+
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
 
 S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
-  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
-}
diff --git a/meta/recipes-graphics/mesa/mesa-git/uclibc.patch b/meta/recipes-graphics/mesa/mesa-git/uclibc.patch
deleted file mode 100644
index 0b031f9..0000000
--- a/meta/recipes-graphics/mesa/mesa-git/uclibc.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Pending
-
-From 904bd5127bd88f45abf4a376676e0a487cfb018a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 13 Oct 2011 12:46:53 +0200
-Subject: [PATCH] configure: add check HAVE_NEWLOCALE to fix build with uclibc
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac            |    3 +++
- src/glsl/strtod.c       |    2 +-
- src/mesa/main/imports.c |    2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 49e81ad..468cfd7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -507,6 +507,9 @@ AC_SUBST([DLOPEN_LIBS])
- dnl See if posix_memalign is available
- AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
- 
-+dnl See if newlocale is available
-+AC_CHECK_FUNCS_ONCE(newlocale)
-+
- dnl SELinux awareness.
- AC_ARG_ENABLE([selinux],
-     [AS_HELP_STRING([--enable-selinux],
-diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
-index ff34591..88aa5ef 100644
---- a/src/glsl/strtod.c
-+++ b/src/glsl/strtod.c
-@@ -44,7 +44,7 @@
- double
- glsl_strtod(const char *s, char **end)
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined (HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
-index 345a1c5..493e0fb 100644
---- a/src/mesa/main/imports.c
-+++ b/src/mesa/main/imports.c
-@@ -767,7 +767,7 @@ float
- _mesa_strtof( const char *s, char **end )
- {
- #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
--    !defined(ANDROID)
-+    !defined(ANDROID) && defined (HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
--- 
-1.7.7
-
-- 
1.7.10



