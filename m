Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjCxX-00081G-7O
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 18:52:37 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Dec 2012 09:37:57 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so1646696wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 09:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=bU5BG09VPrbuZKwp/ACdERlNM+YOk+lZNGYXOaTcrfM=;
	b=D3Bx+LdfCDQJvvij2bwB0kyCVVUwcLCa7yc+9Ruyjq6WuM4LfRRAqXW4P6blBjwQvz
	58Bf5JEXeykXwMAQzljzMXVj7oaartjh1r2lDxTt94VbZoBtdxVr6KYldHrP1sbOxVJ2
	gwET+SXb1yS0Z1Z5CzPomnTDyPderpAY2fG57eo1IvTUE5O1aHCLPx07G5Tt++mCmgdF
	aWz5lIRnIKTXe+/y2He6dc+g/hFPZwgCuRdPdxLRN2xIG0dWC1kSGvReQ6XWzKpPy9VD
	SoLnpIcKQHHbDqg0mH+1sSLxKnj+lpNbnStVN3pDf6TkYgnbaUHX2/EfYb58r/7cJrtd
	ZRpw==
Received: by 10.194.88.98 with SMTP id bf2mr9881449wjb.49.1355420272361;
	Thu, 13 Dec 2012 09:37:52 -0800 (PST)
Received: by 10.194.88.98 with SMTP id bf2mr9881438wjb.49.1355420272256;
	Thu, 13 Dec 2012 09:37:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id d9sm8991002wiw.0.2012.12.13.09.37.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 09:37:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 17:36:09 +0000
Message-Id: <1355420169-10533-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355420169-10533-1-git-send-email-ross.burton@intel.com>
References: <1355420169-10533-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlADljNqQtb4CkzizMZugjvm1MCGS702vhsUfEe2geCxqrBLdocGZe5l/OkbGmYkNZe7b2zvScBPVudG7klacEMy799cdGr4Y55ShSlIav/gambwbjDI8VdZMsf4ouUDcoLgyfKAzRTA9LWGWsx+K6lu8VICmaNLPfWils/MNJsq62kYmuWdJ/G7lJXdrrlUyUnsTlA
Subject: [PATCH 2/2] mesa: bump to 9.0.1
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
X-List-Received-Date: Thu, 13 Dec 2012 17:52:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade Mesa to 9.01, backporting a patch from master to build without needing
mesa-dri-glsl-native.

Several patches have been merged upstream, so drop them.

License checksums updated as the file was re-formated.

Drop mesa-dri-glsl-native as we don't need it anymore.

Tested with Piglit's "quick" test suite, pass rate remains constant compared to
8.0.5 at 87%.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-8.0.5.inc          |   18 -
 meta/recipes-graphics/mesa/mesa-9.0.1.inc          |   11 +
 meta/recipes-graphics/mesa/mesa-common.inc         |    1 -
 .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |    7 -
 .../mesa/mesa-dri-glsl-native_8.0.5.bb             |   22 -
 meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb       |    4 -
 meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb       |    4 +
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 --
 .../mesa/mesa/0003-fix-for-x32.patch               |   50 --
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 -
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  673 ++++++++++++++++++++
 11 files changed, 688 insertions(+), 183 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-8.0.5.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-9.0.1.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch

diff --git a/meta/recipes-graphics/mesa/mesa-8.0.5.inc b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
deleted file mode 100644
index b39b011..0000000
--- a/meta/recipes-graphics/mesa/mesa-8.0.5.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DEPENDS += "mesa-dri-glsl-native"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://0001-Compile-with-uclibc.patch \
-           file://0002-cross-compile.patch \
-           file://0003-fix-for-x32.patch \
-           "
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
-
-S = "${WORKDIR}/Mesa-${PV}"
-
-SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
-SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
-
-do_configure_prepend() {
-  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
-  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
-}
diff --git a/meta/recipes-graphics/mesa/mesa-9.0.1.inc b/meta/recipes-graphics/mesa/mesa-9.0.1.inc
new file mode 100644
index 0000000..9b639da
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-9.0.1.inc
@@ -0,0 +1,11 @@
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://0002-cross-compile.patch \
+           file://cross-glsl.patch \
+           "
+
+SRC_URI[md5sum] = "97d6554c05ea7449398afe3a0ede7018"
+SRC_URI[sha256sum] = "57a7ba83bace3f3a7dc0929fe026ef5f0ad454234ec4ad8a3e0d31650a75db6f"
+
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=012f69938d81b766472fd0d240df38a4"
+
+S = "${WORKDIR}/Mesa-${PV}"
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 70957eb..120b2f6 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -10,7 +10,6 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
 INC_PR = "r9"
 PE = "2"
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc b/meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
deleted file mode 100644
index c8b80e8..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "gl shader language specific build from mesa-dri"
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "GPLv3+"
-
-DEPENDS = "makedepend-native"
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
deleted file mode 100644
index 842d492..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require mesa-dri-glsl-native.inc
-
-LIC_FILES_CHKSUM = "file://glsl_parser.yy;beginline=2;endline=23;md5=a12a9c0208ee64a07ce314dfed4c81eb"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
-SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
-
-S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
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
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
deleted file mode 100644
index 26b56e4..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require mesa-common.inc
-require mesa-${PV}.inc
-require mesa-dri.inc
-PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb b/meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb
new file mode 100644
index 0000000..26b56e4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch b/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
deleted file mode 100644
index d39270a..0000000
--- a/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Compile with uclibc
-
-Upstream-Status: Pending
----
- configure.ac            |    3 +++
- src/glsl/strtod.c       |    2 +-
- src/mesa/main/imports.c |    2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fbaa376..454dad2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -543,6 +543,9 @@ AC_SUBST([DLOPEN_LIBS])
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
-index a876e13..9fce7e9 100644
---- a/src/glsl/strtod.c
-+++ b/src/glsl/strtod.c
-@@ -45,7 +45,7 @@ double
- glsl_strtod(const char *s, char **end)
- {
- #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
--   !defined(__HAIKU__)
-+   !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
-index d3727ef..363bf32 100644
---- a/src/mesa/main/imports.c
-+++ b/src/mesa/main/imports.c
-@@ -767,7 +767,7 @@ float
- _mesa_strtof( const char *s, char **end )
- {
- #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
--   !defined(ANDROID) && !defined(__HAIKU__)
-+   !defined(ANDROID) && !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch b/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
deleted file mode 100644
index 2d6a150..0000000
--- a/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Pending
-
-Using uname like this when cross compiling is a really bad idea. We
-provide the correct linker flags, lets just assume we can get this
-right ourselves.
-
-RP 2012/04/26
----
- bin/mklib |   16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/bin/mklib b/bin/mklib
-index b33aa90..16cb017 100755
---- a/bin/mklib
-+++ b/bin/mklib
-@@ -330,15 +330,7 @@ case $ARCH in
- 	    ;;
- 	    esac
- 
--	    # Check if objects are 32-bit and we're running in 64-bit
--	    # environment.  If so, pass -m32 flag to linker.
- 	    set ${OBJECTS}
--	    ABI32=`file $1 | grep 32-bit`
--	    ARM=`file $1 | grep ARM`
--	    # Do not add "-m32" option for arm.
--            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` = "x86_64" ] ; then
--		OPTS="-m32 ${OPTS}"
--	    fi
- 
-             if [ "${ALTOPTS}" ] ; then
-                 OPTS=${ALTOPTS}
-@@ -389,15 +381,7 @@ case $ARCH in
- 		# exptmp is removed below
- 	    fi
- 
--	    # Check if objects are 32-bit and we're running in 64-bit
--	    # environment.  If so, pass -m32 flag to linker.
- 	    set ${OBJECTS}
--	    ABI32=`file $1 | grep 32-bit`
--            ARM=`file $1 | grep ARM`
--	    # Do not add "-m32" option for arm.
--            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` = "x86_64" ] ; then
--		OPTS="-m32 ${OPTS}"
--	    fi
-             if [ "${ALTOPTS}" ] ; then
-                 OPTS=${ALTOPTS}
-             fi
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
deleted file mode 100644
index cf9dee2..0000000
--- a/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-gross hack to prevent from install libgl
-
-This patch is not suitable for upstream. This is only needed for the 8.0.x
-branch, master (8.1.x) has a largely different build system (using automake)
-and does not need it. It is fully expected to drop the patch with the next bump
-to a stable version based on 8.1.x.
-
-Upstream-Status: Inappropriate
-
----
- src/mesa/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mesa/Makefile b/src/mesa/Makefile
-index 0e15d61..a0a2cb5 100644
---- a/src/mesa/Makefile
-+++ b/src/mesa/Makefile
-@@ -166,7 +166,7 @@ install: default $(DRICORE_INSTALL_TARGET)
- 	            else \
- 	              $(MAKE) install-osmesa || exit 1 ; \
- 	            fi ;; \
--	    dri)    $(MAKE) install-libgl install-dri || exit 1 ;; \
-+	    dri)    $(MAKE) install-dri || exit 1 ;; \
- 	    *)      $(MAKE) install-libgl || exit 1 ;; \
- 	  esac ; \
- 	done
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/cross-glsl.patch b/meta/recipes-graphics/mesa/mesa/cross-glsl.patch
new file mode 100644
index 0000000..9c3c9b8
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/cross-glsl.patch
@@ -0,0 +1,673 @@
+Respect CC_FOR_BUILD when building glsl_compiler, so we don't need a
+mesa-dri-glsl-native anymore.
+
+Upstream-Status: Backport (from master)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index b46f897..3765cd3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,7 +10,7 @@ AC_INIT([Mesa], [9.0.1],
+     [https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa])
+ AC_CONFIG_AUX_DIR([bin])
+ AC_CONFIG_MACRO_DIR([m4])
+-AC_CANONICAL_HOST
++AC_CANONICAL_SYSTEM
+ AM_INIT_AUTOMAKE([foreign])
+ 
+ dnl http://people.gnome.org/~walters/docs/build-api.txt
+@@ -24,9 +24,6 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+-LT_PREREQ([2.2])
+-LT_INIT([disable-static])
+-
+ dnl Set internal versions
+ OSMESA_VERSION=8
+ AC_SUBST([OSMESA_VERSION])
+@@ -45,7 +42,9 @@ LIBKMS_XORG_REQUIRED=1.0.0
+ dnl Check for progs
+ AC_PROG_CPP
+ AC_PROG_CC
++AX_PROG_CC_FOR_BUILD
+ AC_PROG_CXX
++AX_PROG_CXX_FOR_BUILD
+ AM_PROG_CC_C_O
+ AM_PROG_AS
+ AC_CHECK_PROGS([MAKE], [gmake make])
+@@ -54,6 +53,9 @@ AC_PROG_SED
+ AC_PROG_MKDIR_P
+ AC_PATH_PROG([MKDEP], [makedepend])
+ 
++LT_PREREQ([2.2])
++LT_INIT([disable-static])
++
+ if test "x$MKDEP" = "x"; then
+     AC_MSG_ERROR([makedepend is required to build Mesa])
+ fi
+@@ -155,6 +157,21 @@ dnl Cache LDFLAGS and CPPFLAGS so we can add to them and restore later
+ _SAVE_LDFLAGS="$LDFLAGS"
+ _SAVE_CPPFLAGS="$CPPFLAGS"
+ 
++dnl build host compiler macros
++DEFINES_FOR_BUILD=""
++AC_SUBST([DEFINES_FOR_BUILD])
++case "$build_os" in
++linux*|*-gnu*|gnu*)
++    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD -D_GNU_SOURCE"
++    ;;
++solaris*)
++    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD -DSVR4"
++    ;;
++cygwin*)
++    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD"
++    ;;
++esac
++
+ dnl Compiler macros
+ DEFINES=""
+ AC_SUBST([DEFINES])
+@@ -172,6 +189,7 @@ esac
+ 
+ dnl Add flags for gcc and g++
+ if test "x$GCC" = xyes; then
++    CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -Wall -std=c99"
+     CFLAGS="$CFLAGS -Wall -std=c99"
+ 
+     # Enable -Werror=implicit-function-declaration and
+@@ -199,13 +217,16 @@ if test "x$GCC" = xyes; then
+     CFLAGS=$save_CFLAGS
+ 
+     # Work around aliasing bugs - developers should comment this out
++    CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -fno-strict-aliasing"
+     CFLAGS="$CFLAGS -fno-strict-aliasing"
+ 
+     # gcc's builtin memcmp is slower than glibc's
+     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43052
++    CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -fno-builtin-memcmp"
+     CFLAGS="$CFLAGS -fno-builtin-memcmp"
+ fi
+ if test "x$GXX" = xyes; then
++    CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -Wall"
+     CXXFLAGS="$CXXFLAGS -Wall"
+ 
+     # Enable -fvisibility=hidden if using a gcc that supports it
+@@ -222,10 +243,12 @@ if test "x$GXX" = xyes; then
+     CXXFLAGS=$save_CXXFLAGS
+ 
+     # Work around aliasing bugs - developers should comment this out
++    CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -fno-strict-aliasing"
+     CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
+ 
+     # gcc's builtin memcmp is slower than glibc's
+     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43052
++    CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -fno-builtin-memcmp"
+     CXXFLAGS="$CXXFLAGS -fno-builtin-memcmp"
+ fi
+ 
+@@ -309,6 +332,14 @@ AC_ARG_ENABLE([debug],
+     [enable_debug=no]
+ )
+ if test "x$enable_debug" = xyes; then
++    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD -DDEBUG"
++    if test "x$GCC_FOR_BUILD" = xyes; then
++        CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -g"
++    fi
++    if test "x$GXX_FOR_BUILD" = xyes; then
++        CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -g"
++    fi
++
+     DEFINES="$DEFINES -DDEBUG"
+     if test "x$GCC" = xyes; then
+         CFLAGS="$CFLAGS -g"
+@@ -1960,6 +1991,7 @@ AC_CONFIG_FILES([configs/current
+ 		src/gbm/Makefile
+ 		src/gbm/main/gbm.pc
+ 		src/glsl/Makefile
++		src/glsl/builtin_compiler/Makefile
+ 		src/glsl/glcpp/Makefile
+ 		src/glsl/tests/Makefile
+ 		src/glx/Makefile
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+new file mode 100644
+index 0000000..08095a8
+--- /dev/null
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -0,0 +1,140 @@
++# ===========================================================================
++#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_PROG_CC_FOR_BUILD
++#
++# DESCRIPTION
++#
++#   This macro searches for a C compiler that generates native executables,
++#   that is a C compiler that surely is not a cross-compiler. This can be
++#   useful if you have to generate source code at compile-time like for
++#   example GCC does.
++#
++#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
++#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BUILD).
++#   The value of these variables can be overridden by the user by specifying
++#   a compiler with an environment variable (like you do for standard CC).
++#
++#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and object
++#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' if
++#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD are
++#   substituted in the Makefile.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 5
++
++AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
++AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
++AC_REQUIRE([AC_PROG_CC])dnl
++AC_REQUIRE([AC_PROG_CPP])dnl
++AC_REQUIRE([AC_EXEEXT])dnl
++AC_REQUIRE([AC_CANONICAL_SYSTEM])dnl
++dnl
++pushdef([AC_TRY_COMPILER], [
++cat > conftest.$ac_ext << EOF
++#line __oline__ "configure"
++#include "confdefs.h"
++[$1]
++EOF
++# If we can't run a trivial program, we are probably using a cross
++compiler.
++# Fail miserably.
++if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} && (./conftest;
++exit) 2>/dev/null; then
++  [$2]=yes
++else
++  echo "configure: failed program was:" >&AC_FD_CC
++  cat conftest.$ac_ext >&AC_FD_CC
++  [$2]=no
++fi
++[$3]=no
++rm -fr conftest*])dnl
++
++dnl Use the standard macros, but make them use other variable names
++dnl
++pushdef([cross_compiling], [#])dnl
++pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
++pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
++pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
++pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
++pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_exeext], ac_build_exeext)dnl
++pushdef([ac_objext], ac_build_objext)dnl
++pushdef([CC], CC_FOR_BUILD)dnl
++pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
++pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
++pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
++pushdef([host], build)dnl
++pushdef([host_alias], build_alias)dnl
++pushdef([host_cpu], build_cpu)dnl
++pushdef([host_vendor], build_vendor)dnl
++pushdef([host_os], build_os)dnl
++pushdef([ac_cv_host], ac_cv_build)dnl
++pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
++pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
++pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
++pushdef([ac_cv_host_os], ac_cv_build_os)dnl
++pushdef([ac_cpp], ac_build_cpp)dnl
++pushdef([ac_compile], ac_build_compile)dnl
++pushdef([ac_link], ac_build_link)dnl
++pushdef([ac_tool_prefix], [#])dnl
++
++AC_PROG_CC
++AC_PROG_CPP
++AC_EXEEXT
++
++dnl Restore the old definitions
++dnl
++popdef([AC_TRY_COMPILER])dnl
++popdef([ac_tool_prefix])dnl
++popdef([ac_link])dnl
++popdef([ac_compile])dnl
++popdef([ac_cpp])dnl
++popdef([ac_cv_host_os])dnl
++popdef([ac_cv_host_vendor])dnl
++popdef([ac_cv_host_cpu])dnl
++popdef([ac_cv_host_alias])dnl
++popdef([ac_cv_host])dnl
++popdef([host_os])dnl
++popdef([host_vendor])dnl
++popdef([host_cpu])dnl
++popdef([host_alias])dnl
++popdef([host])dnl
++popdef([CPPFLAGS])dnl
++popdef([CFLAGS])dnl
++popdef([CPP])dnl
++popdef([CC])dnl
++popdef([ac_objext])dnl
++popdef([ac_exeext])dnl
++popdef([ac_cv_objext])dnl
++popdef([ac_cv_exeext])dnl
++popdef([ac_cv_prog_cc_g])dnl
++popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_cross])dnl
++popdef([ac_cv_prog_gcc])dnl
++popdef([cross_compiling])dnl
++
++dnl Finally, set Makefile variables
++dnl
++BUILD_EXEEXT=$ac_build_exeext
++BUILD_OBJEXT=$ac_build_objext
++AC_SUBST(BUILD_EXEEXT)dnl
++AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([CFLAGS_FOR_BUILD])dnl
++AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
++AC_SUBST([LDFLAGS_FOR_BUILD])dnl
++])
+diff --git a/m4/ax_prog_cxx_for_build.m4 b/m4/ax_prog_cxx_for_build.m4
+new file mode 100644
+index 0000000..4a099f9
+--- /dev/null
++++ b/m4/ax_prog_cxx_for_build.m4
+@@ -0,0 +1,123 @@
++# ===========================================================================
++#   http://www.gnu.org/software/autoconf-archive/ax_prog_cxx_for_build.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_PROG_CXX_FOR_BUILD
++#
++# DESCRIPTION
++#
++#   This macro searches for a C++ compiler that generates native executables,
++#   that is a C++ compiler that surely is not a cross-compiler. This can be
++#   useful if you have to generate source code at compile-time like for
++#   example GCC does.
++#
++#   The macro sets the CXX_FOR_BUILD and CXXCPP_FOR_BUILD macros to anything
++#   needed to compile or link (CXX_FOR_BUILD) and preprocess (CXXCPP_FOR_BUILD).
++#   The value of these variables can be overridden by the user by specifying
++#   a compiler with an environment variable (like you do for standard CXX).
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
++#   Copyright (c) 2012 Avionic Design GmbH
++#
++#   Based on the AX_PROG_CC_FOR_BUILD macro by Paolo Bonzini.
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 5
++
++AU_ALIAS([AC_PROG_CXX_FOR_BUILD], [AX_PROG_CXX_FOR_BUILD])
++AC_DEFUN([AX_PROG_CXX_FOR_BUILD], [dnl
++AC_REQUIRE([AX_PROG_CC_FOR_BUILD])dnl
++AC_REQUIRE([AC_PROG_CXX])dnl
++AC_REQUIRE([AC_PROG_CXXCPP])dnl
++AC_REQUIRE([AC_CANONICAL_SYSTEM])dnl
++dnl
++pushdef([AC_TRY_COMPILER], [
++cat > conftest.$ac_ext << EOF
++#line __oline__ "configure"
++#include "confdefs.h"
++[$1]
++EOF
++# If we can't run a trivial program, we are probably using a cross
++compiler.
++# Fail miserably.
++if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} && (./conftest;
++exit) 2>/dev/null; then
++  [$2]=yes
++else
++  echo "configure: failed program was:" >&AC_FD_CC
++  cat conftest.$ac_ext >&AC_FD_CC
++  [$2]=no
++fi
++[$3]=no
++rm -fr conftest*])dnl
++
++dnl Use the standard macros, but make them use other variable names
++dnl
++pushdef([cross_compiling], [#])dnl
++pushdef([ac_cv_prog_CXXCPP], ac_cv_build_prog_CXXCPP)dnl
++pushdef([ac_cv_prog_gxx], ac_cv_build_prog_gxx)dnl
++pushdef([ac_cv_prog_cxx_works], ac_cv_build_prog_cxx_works)dnl
++pushdef([ac_cv_prog_cxx_cross], ac_cv_build_prog_cxx_cross)dnl
++pushdef([ac_cv_prog_cxx_g], ac_cv_build_prog_cxx_g)dnl
++pushdef([CXX], CXX_FOR_BUILD)dnl
++pushdef([CXXCPP], CXXCPP_FOR_BUILD)dnl
++pushdef([CXXFLAGS], CXXFLAGS_FOR_BUILD)dnl
++pushdef([CXXCPPFLAGS], CXXCPPFLAGS_FOR_BUILD)dnl
++pushdef([host], build)dnl
++pushdef([host_alias], build_alias)dnl
++pushdef([host_cpu], build_cpu)dnl
++pushdef([host_vendor], build_vendor)dnl
++pushdef([host_os], build_os)dnl
++pushdef([ac_cv_host], ac_cv_build)dnl
++pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
++pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
++pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
++pushdef([ac_cv_host_os], ac_cv_build_os)dnl
++pushdef([ac_cxxcpp], ac_build_cxxcpp)dnl
++pushdef([ac_compile], ac_build_compile)dnl
++pushdef([ac_link], ac_build_link)dnl
++pushdef([ac_tool_prefix], [#])dnl
++
++AC_PROG_CXX
++AC_PROG_CXXCPP
++
++dnl Restore the old definitions
++dnl
++popdef([AC_TRY_COMPILER])dnl
++popdef([ac_tool_prefix])dnl
++popdef([ac_link])dnl
++popdef([ac_compile])dnl
++popdef([ac_cxxcpp])dnl
++popdef([ac_cv_host_os])dnl
++popdef([ac_cv_host_vendor])dnl
++popdef([ac_cv_host_cpu])dnl
++popdef([ac_cv_host_alias])dnl
++popdef([ac_cv_host])dnl
++popdef([host_os])dnl
++popdef([host_vendor])dnl
++popdef([host_cpu])dnl
++popdef([host_alias])dnl
++popdef([host])dnl
++popdef([CXXCPPFLAGS])dnl
++popdef([CXXFLAGS])dnl
++popdef([CXXCPP])dnl
++popdef([CXX])dnl
++popdef([ac_cv_prog_cxx_g])dnl
++popdef([ac_cv_prog_cxx_works])dnl
++popdef([ac_cv_prog_cxx_cross])dnl
++popdef([ac_cv_prog_gxx])dnl
++popdef([cross_compiling])dnl
++
++dnl Finally, set Makefile variables
++dnl
++AC_SUBST([CXXFLAGS_FOR_BUILD])dnl
++AC_SUBST([CXXCPPFLAGS_FOR_BUILD])dnl
++])
+diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
+index 1ecc003..6fb3d2d 100644
+--- a/src/glsl/Makefile.am
++++ b/src/glsl/Makefile.am
+@@ -19,9 +19,7 @@
+ # FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ # IN THE SOFTWARE.
+ 
+-
+-# builtin_compiler is built before libglsl to generate builtin_function.cpp for libglsl.
+-# For this to work, a dummy version of builtin_function.cpp, builtin_stubs.cpp, is used.
++SUBDIRS = builtin_compiler glcpp
+ 
+ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/include \
+@@ -38,32 +36,23 @@ AM_LFLAGS = --nounistd -o$(LEX_OUTPUT_ROOT).c
+ 
+ include Makefile.sources
+ 
+-noinst_LTLIBRARIES = libglslcommon.la libglsl.la
+-noinst_PROGRAMS = glsl_compiler glsl_test builtin_compiler
++noinst_LTLIBRARIES = libglsl.la
++noinst_PROGRAMS = glsl_compiler glsl_test
+ 
+-# common sources for builtin_compiler and libglsl
+-libglslcommon_la_SOURCES = \
++libglsl_la_SOURCES = \
+ 	glsl_lexer.ll \
+ 	glsl_parser.cc \
+ 	$(LIBGLSL_FILES) \
+-	$(LIBGLSL_CXX_FILES)
+-
+-libglslcommon_la_LIBADD = glcpp/libglcpp.la
+-
+-# common sources for builtin_compiler and glsl_compiler
+-GLSL2_SOURCES = \
+-	$(top_srcdir)/src/mesa/program/hash_table.c \
+-	$(top_srcdir)/src/mesa/program/symbol_table.c \
+-	$(GLSL_COMPILER_CXX_FILES)
+-
+-libglsl_la_SOURCES = \
++	$(LIBGLSL_CXX_FILES) \
+ 	builtin_function.cpp
+ 
+-libglsl_la_LIBADD = libglslcommon.la
++libglsl_la_LIBADD = glcpp/libglcpp.la
+ libglsl_la_LDFLAGS =
+ 
+ glsl_compiler_SOURCES = \
+-	$(GLSL2_SOURCES)
++	$(top_srcdir)/src/mesa/program/hash_table.c \
++	$(top_srcdir)/src/mesa/program/symbol_table.c \
++	$(GLSL_COMPILER_CXX_FILES)
+ 
+ glsl_compiler_LDADD = libglsl.la
+ 
+@@ -76,12 +65,6 @@ glsl_test_SOURCES = \
+ 
+ glsl_test_LDADD = libglsl.la
+ 
+-builtin_compiler_SOURCES = \
+-	$(GLSL2_SOURCES) \
+-	builtin_stubs.cpp
+-
+-builtin_compiler_LDADD = libglslcommon.la
+-
+ # automake <=1.11 and automake >=1.12 have different conventions for naming C++ header files
+ # made by yacc.  To work with both, we write our own rule rather than using automake's.
+ # When (if) we require automake >=1.12 in configure.ac, this can be removed, and we can use
+@@ -89,16 +72,11 @@ builtin_compiler_LDADD = libglslcommon.la
+ glsl_parser.cc glsl_parser.h: glsl_parser.yy
+ 	$(AM_V_GEN) $(YACC) -v -o glsl_parser.cc -p "_mesa_glsl_" --defines=glsl_parser.h $<
+ 
+-BUILT_SOURCES = glsl_parser.h builtin_function.cpp
+-CLEANFILES = glsl_lexer.cc glsl_parser.cc $(BUILT_SOURCES)
+-
+-builtin_function.cpp: $(srcdir)/builtins/profiles/* $(srcdir)/builtins/ir/* $(srcdir)/builtins/glsl/* $(srcdir)/builtins/tools/generate_builtins.py $(srcdir)/builtins/tools/texture_builtins.py builtin_compiler$(EXEEXT)
+-	$(AM_V_GEN) $(PYTHON2) $(PYTHON_FLAGS) $(srcdir)/builtins/tools/generate_builtins.py ./builtin_compiler > builtin_function.cpp || rm -f builtin_function.cpp
+-
+-glcpp/libglcpp.la:
+-	cd glcpp ; $(MAKE) $(AM_MAKEFLAGS)
++BUILT_SOURCES = glsl_parser.h
++CLEANFILES = glsl_lexer.cc glsl_parser.cc $(BUILT_SOURCES) builtin_function.cpp
+ 
+-SUBDIRS = glcpp
++builtin_function.cpp: $(srcdir)/builtins/profiles/* $(srcdir)/builtins/ir/* $(srcdir)/builtins/glsl/* $(srcdir)/builtins/tools/generate_builtins.py $(srcdir)/builtins/tools/texture_builtins.py builtin_compiler/builtin_compiler$(BUILD_EXEEXT)
++	$(AM_V_GEN) $(PYTHON2) $(PYTHON_FLAGS) $(srcdir)/builtins/tools/generate_builtins.py builtin_compiler/builtin_compiler$(BUILD_EXEEXT) > builtin_function.cpp || rm -f builtin_function.cpp
+ 
+ # Provide compatibility with scripts for the old Mesa build system for
+ # a while by putting a link to the library in the current directory.
+diff --git a/src/glsl/builtin_compiler/.gitignore b/src/glsl/builtin_compiler/.gitignore
+new file mode 100644
+index 0000000..40c551b
+--- /dev/null
++++ b/src/glsl/builtin_compiler/.gitignore
+@@ -0,0 +1,6 @@
++builtin_compiler
++glcpp-lex.c
++glcpp-parse.c
++glcpp-parse.h
++glcpp-parse.output
++/Makefile
+diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
+new file mode 100644
+index 0000000..72032b5
+--- /dev/null
++++ b/src/glsl/builtin_compiler/Makefile.am
+@@ -0,0 +1,68 @@
++# Copyright © 2012 Jon TURNEY
++# Copyright © 2012 Thierry Reding
++#
++# Permission is hereby granted, free of charge, to any person obtaining a
++# copy of this software and associated documentation files (the "Software"),
++# to deal in the Software without restriction, including without limitation
++# the rights to use, copy, modify, merge, publish, distribute, sublicense,
++# and/or sell copies of the Software, and to permit persons to whom the
++# Software is furnished to do so, subject to the following conditions:
++#
++# The above copyright notice and this permission notice (including the next
++# paragraph) shall be included in all copies or substantial portions of the
++# Software.
++#
++# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++# IN THE SOFTWARE.
++
++CC = @CC_FOR_BUILD@
++CFLAGS = @CFLAGS_FOR_BUILD@
++CPP = @CPP_FOR_BUILD@
++CPPFLAGS = @CPPFLAGS_FOR_BUILD@
++CXX = @CXX_FOR_BUILD@
++CXXFLAGS = @CXXFLAGS_FOR_BUILD@
++LD = @LD_FOR_BUILD@
++LDFLAGS = @LDFLAGS_FOR_BUILD@
++
++AM_CFLAGS = \
++	-I $(top_srcdir)/include \
++	-I $(top_srcdir)/src/mapi \
++	-I $(top_srcdir)/src/mesa \
++	-I $(GLSL_SRCDIR) \
++	-I $(GLSL_SRCDIR)/glcpp \
++	$(DEFINES_FOR_BUILD)
++
++AM_CXXFLAGS = $(AM_CFLAGS)
++
++AM_YFLAGS = -v -d -p "glcpp_parser_"
++AM_LFLAGS = --nounistd -o$(LEX_OUTPUT_ROOT).c
++
++include ../Makefile.sources
++
++noinst_PROGRAMS = builtin_compiler
++
++builtin_compiler_SOURCES = \
++	$(GLSL_SRCDIR)/glcpp/glcpp-lex.l \
++	$(GLSL_SRCDIR)/glcpp/glcpp-parse.y \
++	$(LIBGLCPP_FILES) \
++	$(GLSL_SRCDIR)/glsl_lexer.ll \
++	$(GLSL_SRCDIR)/glsl_parser.cc \
++	$(LIBGLSL_FILES) \
++	$(LIBGLSL_CXX_FILES) \
++	$(top_srcdir)/src/mesa/program/hash_table.c \
++	$(top_srcdir)/src/mesa/program/symbol_table.c \
++	$(GLSL_COMPILER_CXX_FILES) \
++	builtin_stubs.cpp
++
++BUILT_SOURCES = \
++	glcpp-lex.c \
++	glcpp-parse.c \
++	glcpp-parse.h \
++	glsl_lexer.cc
++
++CLEANFILES = $(BUILT_SOURCES)
+diff --git a/src/glsl/builtin_compiler/builtin_stubs.cpp b/src/glsl/builtin_compiler/builtin_stubs.cpp
+new file mode 100644
+index 0000000..dfa5d32
+--- /dev/null
++++ b/src/glsl/builtin_compiler/builtin_stubs.cpp
+@@ -0,0 +1,39 @@
++/*
++ * Copyright © 2010 Intel Corporation
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ */
++
++#include <stdio.h>
++#include "glsl_parser_extras.h"
++
++/* A dummy file.  When compiling prototypes, we don't care about builtins.
++ * We really don't want to half-compile builtin_functions.cpp and fail, though.
++ */
++void
++_mesa_glsl_release_functions(void)
++{
++}
++
++void
++_mesa_glsl_initialize_functions(_mesa_glsl_parse_state *state)
++{
++   (void) state;
++}
+diff --git a/src/glsl/builtin_stubs.cpp b/src/glsl/builtin_stubs.cpp
+deleted file mode 100644
+index dfa5d32..0000000
+--- a/src/glsl/builtin_stubs.cpp
++++ /dev/null
+@@ -1,39 +0,0 @@
+-/*
+- * Copyright © 2010 Intel Corporation
+- *
+- * Permission is hereby granted, free of charge, to any person obtaining a
+- * copy of this software and associated documentation files (the "Software"),
+- * to deal in the Software without restriction, including without limitation
+- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+- * and/or sell copies of the Software, and to permit persons to whom the
+- * Software is furnished to do so, subject to the following conditions:
+- *
+- * The above copyright notice and this permission notice (including the next
+- * paragraph) shall be included in all copies or substantial portions of the
+- * Software.
+- *
+- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+- * DEALINGS IN THE SOFTWARE.
+- */
+-
+-#include <stdio.h>
+-#include "glsl_parser_extras.h"
+-
+-/* A dummy file.  When compiling prototypes, we don't care about builtins.
+- * We really don't want to half-compile builtin_functions.cpp and fail, though.
+- */
+-void
+-_mesa_glsl_release_functions(void)
+-{
+-}
+-
+-void
+-_mesa_glsl_initialize_functions(_mesa_glsl_parse_state *state)
+-{
+-   (void) state;
+-}
-- 
1.7.10



