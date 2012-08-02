Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymR-0006Nv-HY
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:48 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:50:00 -0700
Received: by weyt11 with SMTP id t11so5421675wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=+44PDyIXzNlMz5Rk08XdUOyxuo22k25WjS6RDOwXyZo=;
	b=kFQpiQM/xmJ/O6OHRZ3GocGwrJkGsTcAvzEw/s4hHSinXlH/oWHKlxFR0C5E6iMDHx
	zxd+1/2EnRUPgLOO9dDd4UY75MnNuBAtdOUgrmFXSoH67fhMV8KmghqcnMacrzLPPBc/
	6NLekLl9l0LOcygv9AsqF9hcXP0qgp/+PJdpP4WUQAiBjeGxZsjV7VB5V8mFiKYbX4JQ
	k2Ge7XMFhOuf802rGLHvbgYCpmuijH+O4NAUdCdf0HWkOfHSKF5Tz57Wm0r2Uu5nnqUK
	8OVFa7kKStnWuXEBDuh8XPbthZHGyEu2LjhX+FFpyGipkfLGVAEe8ML+iD7MEUlfg/fT
	xIyg==
Received: by 10.180.78.135 with SMTP id b7mr6172464wix.11.1343926199077;
	Thu, 02 Aug 2012 09:49:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:49:00 +0100
Message-Id: <ac29c3f40397d29d3c69fec79734ac65b30350bb.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmuLSWeHPQnpOmeD59ArcFqtrQu5JlvFIod4zrTCd7c9mcX+KFvnihffBhbRwRjIxN6owMB
Subject: [PATCH V3 06/11] mesa: Update to 8.0.4 (latest stable version)
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:48 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

- The license file has changed, but the project still has the same
  license
- Patches have been rebased on top of the 8.0 branch. crossfix.patch
  and crossfix-mklib.patch have been merged as they address the same
  problem

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   13 +++--
 meta/recipes-graphics/mesa/mesa-common.inc         |    4 +-
 ...ative_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} |    4 +-
 .../mesa/{mesa-dri_7.11.bb => mesa-dri_8.0.4.bb}   |    0
 meta/recipes-graphics/mesa/mesa-git.inc            |    9 ++--
 .../mesa/{mesa-xlib_7.11.bb => mesa-xlib_8.0.4.bb} |    0
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++++++++
 ...ossfix-mklib.patch => 0002-cross-compile.patch} |   39 ++++++++++++---
 ...sa_fix_for_x32.patch => 0003-fix-for-x32.patch} |   30 +++++++----
 meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
 meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 ----------------
 11 files changed, 118 insertions(+), 93 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (67%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} (84%)
 rename meta/recipes-graphics/mesa/{mesa-dri_7.11.bb => mesa-dri_8.0.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa-xlib_7.11.bb => mesa-xlib_8.0.4.bb} (100%)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch => 0002-cross-compile.patch} (68%)
 rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch => 0003-fix-for-x32.patch} (59%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch

diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
similarity index 67%
rename from meta/recipes-graphics/mesa/mesa-7.11.inc
rename to meta/recipes-graphics/mesa/mesa-8.0.4.inc
index 7c4a690..d9d17bb 100644
--- a/meta/recipes-graphics/mesa/mesa-7.11.inc
+++ b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
@@ -1,16 +1,15 @@
 DEPENDS += "mesa-dri-glsl-native"
 
-
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \ 
-           file://uclibc.patch \
-           file://crossfix.patch \
-           file://crossfix-mklib.patch \
-           file://mesa_fix_for_x32.patch \
+           file://0001-Compile-with-uclibc.patch \
+           file://0002-cross-compile.patch \
+           file://0003-fix-for-x32.patch \
            "
+
 S = "${WORKDIR}/Mesa-${PV}"
 
-SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
-SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
+SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
 
 do_configure_prepend() {
   #check for python not python2, because python-native does not stage python2 binary/link
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index ff9f882..aac3bbe 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -10,9 +10,9 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r18"
+INC_PR = "r0"
 PE = "2"
 
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
rename to meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
index 9194595..a81fb6d 100644
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc
 DEPENDS = "makedepend-native"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
-SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
+SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
 
 S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri_7.11.bb
rename to meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 1b4c0a6..32b1d96 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -1,14 +1,15 @@
 DEPENDS += "mesa-dri-glsl-native"
 
-SRCREV = "983fa4ad523535debf2e94cf6ac1fd4c5630c0d2"
-PV = "7.11+gitr${SRCPV}"
+SRCREV = "c1f4867c89adb1a6b19d66ec8ad146115909f0a7"
+PV = "8.0.4+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://uclibc.patch \
-           file://crossfix.patch \
+           file://0001-Compile-with-uclibc.patch \
+           file://0002-cross-compile.patch \
+           file://0003-fix-for-x32.patch \
            "
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
rename to meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch b/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
new file mode 100644
index 0000000..d39270a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
@@ -0,0 +1,52 @@
+Compile with uclibc
+
+Upstream-Status: Pending
+---
+ configure.ac            |    3 +++
+ src/glsl/strtod.c       |    2 +-
+ src/mesa/main/imports.c |    2 +-
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fbaa376..454dad2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -543,6 +543,9 @@ AC_SUBST([DLOPEN_LIBS])
+ dnl See if posix_memalign is available
+ AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
+ 
++dnl See if newlocale is available
++AC_CHECK_FUNCS_ONCE(newlocale)
++
+ dnl SELinux awareness.
+ AC_ARG_ENABLE([selinux],
+     [AS_HELP_STRING([--enable-selinux],
+diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
+index a876e13..9fce7e9 100644
+--- a/src/glsl/strtod.c
++++ b/src/glsl/strtod.c
+@@ -45,7 +45,7 @@ double
+ glsl_strtod(const char *s, char **end)
+ {
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-   !defined(__HAIKU__)
++   !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
+index d3727ef..363bf32 100644
+--- a/src/mesa/main/imports.c
++++ b/src/mesa/main/imports.c
+@@ -767,7 +767,7 @@ float
+ _mesa_strtof( const char *s, char **end )
+ {
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-   !defined(ANDROID) && !defined(__HAIKU__)
++   !defined(ANDROID) && !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch b/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
similarity index 68%
rename from meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch
rename to meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
index dc08228..dc8e994 100644
--- a/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch
+++ b/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
@@ -1,4 +1,7 @@
-This patch is ported from WindRiver linux and to fix cross compile failure.
+cross compile
+
+This patch is ported from WindRiver linux and to fix cross compile
+failure.
 
 And original commits are:
 commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
@@ -7,10 +10,15 @@ commit 5c4212084b871a0c0fb7d174280ec9a634637deb
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
+---
+ bin/mklib |   24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
 
---- Mesa-7.10.2/bin/mklib.orig	2011-09-28 16:15:34.170000074 +0800
-+++ Mesa-7.10.2/bin/mklib	2011-09-28 16:15:42.370000073 +0800
-@@ -49,8 +49,8 @@
+diff --git a/bin/mklib b/bin/mklib
+index 9bac29e..b33aa90 100755
+--- a/bin/mklib
++++ b/bin/mklib
+@@ -49,8 +49,8 @@ expand_archives() {
                      /*) ;;
                      *)  FILE="$ORIG_DIR/$FILE" ;;
                  esac
@@ -21,7 +29,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
                  for MEMBER in $MEMBERS ; do
                      NEWFILES="$NEWFILES $DIR/$MEMBER"
                  done
-@@ -77,7 +77,7 @@
+@@ -77,7 +77,7 @@ expand_archives() {
  make_ar_static_lib() {
      OPTS=$1
      shift;
@@ -30,7 +38,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
      shift;
      LIBNAME=$1
      shift;
-@@ -87,11 +87,11 @@
+@@ -87,11 +87,11 @@ make_ar_static_lib() {
      rm -f ${LIBNAME}
  
      # make static lib
@@ -45,7 +53,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
      fi
  
      echo ${LIBNAME}
-@@ -313,9 +313,9 @@
+@@ -313,9 +313,9 @@ case $ARCH in
  	if [ "x$LINK" = "x" ] ; then
  	    # -linker was not specified so set default link command now
              if [ $CPLUSPLUS = 1 ] ; then
@@ -57,7 +65,19 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
              fi
  	fi
  
-@@ -531,9 +531,9 @@
+@@ -535,9 +535,9 @@ case $ARCH in
+ 	if [ "x$LINK" = "x" ] ; then
+ 	    # -linker was not specified so set default link command now
+             if [ $CPLUSPLUS = 1 ] ; then
+-                LINK=g++
++                LINK=$CXX
+             else
+-                LINK=gcc
++                LINK=$CC
+             fi
+ 	fi
+ 
+@@ -903,9 +903,9 @@ case $ARCH in
  	if [ "x$LINK" = "x" ] ; then
  	    # -linker was not specified so set default link command now
              if [ $CPLUSPLUS = 1 ] ; then
@@ -69,3 +89,6 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
              fi
  	fi
  
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch b/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
similarity index 59%
rename from meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
rename to meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
index f072c34..2d6a150 100644
--- a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
+++ b/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
@@ -1,16 +1,19 @@
 Upstream-Status: Pending
 
-Using uname like this when cross compiling is a really bad idea. We 
-provide the correct linker flags, lets just assume we can get this 
+Using uname like this when cross compiling is a really bad idea. We
+provide the correct linker flags, lets just assume we can get this
 right ourselves.
 
 RP 2012/04/26
+---
+ bin/mklib |   16 ----------------
+ 1 file changed, 16 deletions(-)
 
-Index: Mesa-7.11/bin/mklib
-===================================================================
---- Mesa-7.11.orig/bin/mklib	2012-04-26 19:43:20.729150109 +0000
-+++ Mesa-7.11/bin/mklib	2012-04-26 20:30:22.421086163 +0000
-@@ -330,13 +330,7 @@
+diff --git a/bin/mklib b/bin/mklib
+index b33aa90..16cb017 100755
+--- a/bin/mklib
++++ b/bin/mklib
+@@ -330,15 +330,7 @@ case $ARCH in
  	    ;;
  	    esac
  
@@ -18,13 +21,15 @@ Index: Mesa-7.11/bin/mklib
 -	    # environment.  If so, pass -m32 flag to linker.
  	    set ${OBJECTS}
 -	    ABI32=`file $1 | grep 32-bit`
--	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-	    ARM=`file $1 | grep ARM`
+-	    # Do not add "-m32" option for arm.
+-            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` = "x86_64" ] ; then
 -		OPTS="-m32 ${OPTS}"
 -	    fi
  
              if [ "${ALTOPTS}" ] ; then
                  OPTS=${ALTOPTS}
-@@ -387,13 +381,7 @@
+@@ -389,15 +381,7 @@ case $ARCH in
  		# exptmp is removed below
  	    fi
  
@@ -32,9 +37,14 @@ Index: Mesa-7.11/bin/mklib
 -	    # environment.  If so, pass -m32 flag to linker.
  	    set ${OBJECTS}
 -	    ABI32=`file $1 | grep 32-bit`
--	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-            ARM=`file $1 | grep ARM`
+-	    # Do not add "-m32" option for arm.
+-            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` = "x86_64" ] ; then
 -		OPTS="-m32 ${OPTS}"
 -	    fi
              if [ "${ALTOPTS}" ] ; then
                  OPTS=${ALTOPTS}
              fi
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/crossfix.patch b/meta/recipes-graphics/mesa/mesa/crossfix.patch
deleted file mode 100644
index d300e2f..0000000
--- a/meta/recipes-graphics/mesa/mesa/crossfix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Index: Mesa-7.5/bin/mklib
-===================================================================
---- Mesa-7.5.orig/bin/mklib	2009-08-12 13:01:34.000000000 +0100
-+++ Mesa-7.5/bin/mklib	2009-08-12 13:04:19.000000000 +0100
-@@ -234,9 +234,9 @@
- 	if [ "x$LINK" = "x" ] ; then
- 	    # -linker was not specified so set default link command now
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK=g++
-+                LINK=$CXX
-             else
--                LINK=gcc
-+                LINK=$CC
-             fi
- 	fi
- 
diff --git a/meta/recipes-graphics/mesa/mesa/uclibc.patch b/meta/recipes-graphics/mesa/mesa/uclibc.patch
deleted file mode 100644
index 49d0234..0000000
--- a/meta/recipes-graphics/mesa/mesa/uclibc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-Index: Mesa-7.10.2/src/mesa/main/imports.c
-===================================================================
---- Mesa-7.10.2.orig/src/mesa/main/imports.c	2011-03-01 12:57:29.000000000 -0800
-+++ Mesa-7.10.2/src/mesa/main/imports.c	2011-07-20 19:08:49.441785510 -0700
-@@ -757,7 +757,7 @@
- float
- _mesa_strtof( const char *s, char **end )
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined (HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-Index: Mesa-7.10.2/src/glsl/strtod.c
-===================================================================
---- Mesa-7.10.2.orig/src/glsl/strtod.c	2011-01-03 16:45:51.000000000 -0800
-+++ Mesa-7.10.2/src/glsl/strtod.c	2011-07-20 19:10:21.441785488 -0700
-@@ -44,7 +44,7 @@
- double
- glsl_strtod(const char *s, char **end)
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined (HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-Index: Mesa-7.10.2/configure.ac
-===================================================================
---- Mesa-7.10.2.orig/configure.ac	2011-07-20 19:09:02.000000000 -0700
-+++ Mesa-7.10.2/configure.ac	2011-07-20 19:09:57.121785492 -0700
-@@ -450,6 +450,9 @@
- dnl See if posix_memalign is available
- AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
- 
-+dnl See if newlocale is available
-+AC_CHECK_FUNCS_ONCE(newlocale)
-+
- dnl SELinux awareness.
- AC_ARG_ENABLE([selinux],
-     [AS_HELP_STRING([--enable-selinux],
-- 
1.7.10



