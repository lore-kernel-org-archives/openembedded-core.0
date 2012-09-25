Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGVij-0002L8-RW
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 16:02:42 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 25 Sep 2012 06:49:51 -0700
Received: by wiwc10 with SMTP id c10so2325604wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Xl+qQ3tSojz+uv7VsI6sB3Vd+APf4fR5U1QbL86O79I=;
	b=WPWzC/LGNOGbrqVydz6sjZDYRn0uPYAfetrnLv2txQQfJzwM/2C2zkFxqxH+wboz2X
	Bs9tgq6zmE3kYmt30GFpxk93jHFQONOmPtXZDMsJL9KFuGEb69LiDcUlfyaZqMfKCpan
	xg3BJKyYI0Llq5/JTkugoeI1RwffKGX9pcjxL+T3wuXzzaZZqL2I0CLUZpFHLqPJFlhV
	k8u+pL+7tpA8gWFpPgehQFMkywbRuuzz08t1FUiurRdzp2l55tvmDBCdLDWrHO7Abq2w
	hNSeJ3YF3vhw+fgMJCHp5Bih3bNVR0BpK2G5gyDthRPp3IpFOq7HcN7W3nG3DOcCt1MD
	1OGA==
Received: by 10.216.209.150 with SMTP id s22mr7779046weo.49.1348580989058;
	Tue, 25 Sep 2012 06:49:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm707637wix.5.2012.09.25.06.49.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 06:49:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 14:48:53 +0100
Message-Id: <1348580933-30301-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnBaCTDP3UrPpuDt4yJfZ667Aocw15dXaHqBGCqILX7c+NGlPLxvYVa3KrZOfcfq4ap3030
Subject: [PATCH] xserver-xorg: upgrade to 1.11.4
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
X-List-Received-Date: Tue, 25 Sep 2012 14:02:42 -0000

gcc-47-warning.patch was integrated, so drop.

Add pkgconfig-deps.patch, a backport of a commit to fix bad exposed library
dependencies (which resulted in the keyboard driver depending on pixman).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xserver-xorg-1.11.2/crosscompile.patch         |   22 ------
 .../fix_open_max_preprocessor_error.patch          |   15 -----
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ---------
 .../xserver-xorg-1.11.2/macro_tweak.patch          |   25 -------
 .../xserver-xorg-1.11.2/mips64-compiler.patch      |   29 --------
 .../xserver-xorg-1.11.4/crosscompile.patch         |   22 ++++++
 .../fix_open_max_preprocessor_error.patch          |   15 +++++
 .../xserver-xorg-1.11.4/macro_tweak.patch          |   25 +++++++
 .../xserver-xorg-1.11.4/mips64-compiler.patch      |   29 ++++++++
 .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.11.2.bb            |   13 ----
 .../xorg-xserver/xserver-xorg_1.11.4.bb            |   13 ++++
 12 files changed, 174 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/configure.ac b/configure.ac
-index b3b752c..600500b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
- dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
- dnl compiling, assume default font path uses standard FONTROOTDIR directories.
- DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
--if test "$cross_compiling" != yes; then
--	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
--		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
--		[case $host_os in
-+		case $host_os in
- 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
--		esac])
--fi
-+		esac
- AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
- 				[ FONTPATH="$withval" ],
- 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
deleted file mode 100644
index 2f62972..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/os/osdep.h
-===================================================================
---- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
-+++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
-@@ -92,7 +92,7 @@
-  * like sysconf(_SC_OPEN_MAX) is not supported.
-  */
- 
--#if OPEN_MAX <= 256
-+#if 0
- #define MAXSOCKS (OPEN_MAX - 1)
- #else
- #define MAXSOCKS 256
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
deleted file mode 100644
index ed4eaac..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-This patch fixes errors on powerpc like below
-
-| lnx_video.c: In function 'unmapVidMem':
-| lnx_video.c:472:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
-
-Its in 1.12 branch 
-
-http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.12-branch&id=eb3377ffb8a7baa26c9831e56ed782d48b28fa71
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
-===================================================================
---- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:32:34.186489019 -0700
-+++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:49:14.926537452 -0700
-@@ -469,11 +469,11 @@
- static void
- unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
- {
--    memType alignOff = (memType)Base 
--	- ((memType)Base & ~(getpagesize() - 1));
-+    uintptr_t alignOff = (uintptr_t)Base 
-+	- ((uintptr_t)Base & ~(getpagesize() - 1));
- 
--    DebugF("alignment offset: %lx\n",alignOff);
--    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
-+    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
-+    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
- }
- 
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
deleted file mode 100644
index ec0eea6..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-This is the revised version of files/macro_tweak.patch for
-xorg-server 1.8.99.904 and newer.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/xorg-server.m4 b/xorg-server.m4
-index bdecf62..040fdb8 100644
---- a/xorg-server.m4
-+++ b/xorg-server.m4
-@@ -28,10 +28,12 @@ dnl
- # Checks for the $1 define in xorg-server.h (from the sdk).  If it
- # is defined, then add $1 to $REQUIRED_MODULES.
- 
-+m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
-+
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
deleted file mode 100644
index e6bc95b..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
-so we end up with incompatible conversion errors
-
-This patch choses the right values for mips64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
-===================================================================
---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
-+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
-@@ -104,6 +104,7 @@
- 
- #  if !defined(__arm__)
- #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
-+      && !defined(__mips64) \
-       && !(defined(__alpha__) && defined(linux)) \
-       && !(defined(__ia64__) && defined(linux)) \
- 
-@@ -708,7 +709,7 @@
- }
- 
- #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#    ifdef __arm32__
-+#    if defined (__arm32__) || defined (__mips64)
- #     define PORT_SIZE long
- #    else
- #     define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
new file mode 100644
index 0000000..2f98bb8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/configure.ac b/configure.ac
+index b3b752c..600500b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
+ dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
+ dnl compiling, assume default font path uses standard FONTROOTDIR directories.
+ DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
+-if test "$cross_compiling" != yes; then
+-	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
+-		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
+-		[case $host_os in
++		case $host_os in
+ 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
+-		esac])
+-fi
++		esac
+ AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
+ 				[ FONTPATH="$withval" ],
+ 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
new file mode 100644
index 0000000..2f62972
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Index: git/os/osdep.h
+===================================================================
+--- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
++++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
+@@ -92,7 +92,7 @@
+  * like sysconf(_SC_OPEN_MAX) is not supported.
+  */
+ 
+-#if OPEN_MAX <= 256
++#if 0
+ #define MAXSOCKS (OPEN_MAX - 1)
+ #else
+ #define MAXSOCKS 256
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
new file mode 100644
index 0000000..ec0eea6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
@@ -0,0 +1,25 @@
+This is the revised version of files/macro_tweak.patch for
+xorg-server 1.8.99.904 and newer.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/xorg-server.m4 b/xorg-server.m4
+index bdecf62..040fdb8 100644
+--- a/xorg-server.m4
++++ b/xorg-server.m4
+@@ -28,10 +28,12 @@ dnl
+ # Checks for the $1 define in xorg-server.h (from the sdk).  If it
+ # is defined, then add $1 to $REQUIRED_MODULES.
+ 
++m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
++
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
new file mode 100644
index 0000000..e6bc95b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
@@ -0,0 +1,29 @@
+on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
+so we end up with incompatible conversion errors
+
+This patch choses the right values for mips64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
+===================================================================
+--- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
++++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
+@@ -104,6 +104,7 @@
+ 
+ #  if !defined(__arm__)
+ #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
++      && !defined(__mips64) \
+       && !(defined(__alpha__) && defined(linux)) \
+       && !(defined(__ia64__) && defined(linux)) \
+ 
+@@ -708,7 +709,7 @@
+ }
+ 
+ #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
+-#    ifdef __arm32__
++#    if defined (__arm32__) || defined (__mips64)
+ #     define PORT_SIZE long
+ #    else
+ #     define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
new file mode 100644
index 0000000..fee8d76
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
@@ -0,0 +1,70 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+commit 41d903918a5721e53ed694880eab44170f9717cc
+Author: Jeremy Huddleston <jeremyhu@apple.com>
+Date:   Wed Sep 14 13:45:18 2011 -0500
+
+    xorg-server.pc.in: Remove libpciaccess and pixman-1 from Requires
+    
+    Every module building against xorg-server does not *Require* pixman nor
+    libpciaccess.  If such modules need pixman or pciaccess, they should be
+    depending on them directly rather than inheriting a dependency from
+    xorg-server.  To do this, they should use PKG_CHECK_MODULES in configure.ac
+    to check for pixman-1 or pciaccess and include the apporpriate _LIBS variable
+    to the appropriate _LDFLAGS variable in Makefile.am
+    
+    This also moves pixman-1 to Requires.private, so CPPFLAGS is set right to
+    to satisfy include dependencies but avoid linking needlessly.
+    
+    Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
+    Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
+
+diff --git a/configure.ac b/configure.ac
+index 50beb01..4bfa82c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -780,11 +780,6 @@ VIDMODEPROTO="xf86vidmodeproto >= 2.2.99.1"
+ WINDOWSWMPROTO="windowswmproto"
+ APPLEWMPROTO="applewmproto >= 1.4"
+ 
+-dnl Core modules for most extensions, et al.
+-SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.9.99.902] [kbproto >= 1.0.3] fontsproto"
+-# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
+-AC_SUBST(SDK_REQUIRED_MODULES)
+-
+ dnl List of libraries that require a specific version
+ LIBAPPLEWM="applewm >= 1.4"
+ LIBDMX="dmx >= 1.0.99.1"
+@@ -806,6 +801,11 @@ dnl specific modules against it
+ PKG_CHECK_MODULES(PIXMAN, $LIBPIXMAN)
+ REQUIRED_LIBS="$REQUIRED_LIBS $LIBPIXMAN $LIBXFONT xau"
+ 
++dnl Core modules for most extensions, et al.
++SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.99.99.902] [kbproto >= 1.0.3] fontsproto $LIBPIXMAN"
++# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
++AC_SUBST(SDK_REQUIRED_MODULES)
++
+ REQUIRED_MODULES="[fixesproto >= 5.0] [damageproto >= 1.1] [xcmiscproto >= 1.2.0] [xtrans >= 1.2.2] [bigreqsproto >= 1.1.0] $SDK_REQUIRED_MODULES"
+ 
+ if test "x$CONFIG_UDEV" = xyes &&
+@@ -1583,6 +1583,7 @@ if test "x$XORG" = xyes; then
+ 	if test "x$PCI" = xyes; then
+ 
+ 	PKG_CHECK_MODULES([PCIACCESS], $LIBPCIACCESS)
++	SDK_REQUIRED_MODULES="$SDK_REQUIRED_MODULES $LIBPCIACCESS"
+	SAVE_LIBS=$LIBS
+	SAVE_CFLAGS=$CFLAGS
+	CFLAGS=$PCIACCESS_CFLAGS
+diff --git a/xorg-server.pc.in b/xorg-server.pc.in
+index fb238b5..a98eca8 100644
+--- a/xorg-server.pc.in
++++ b/xorg-server.pc.in
+@@ -15,7 +15,6 @@ abi_extension=@abi_extension@
+ Name: xorg-server
+ Description: Modular X.Org X Server
+ Version: @PACKAGE_VERSION@
+-Requires: pixman-1 pciaccess
+ Requires.private: @SDK_REQUIRED_MODULES@
+ Cflags: -I${sdkdir} @symbol_visibility@
+ Libs: -L${libdir}
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
deleted file mode 100644
index c707567..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xserver-xorg.inc
-
-# Misc build failure for master HEAD
-SRC_URI += "file://crosscompile.patch \
-            file://fix_open_max_preprocessor_error.patch \
-            file://gcc-47-warning.patch \
-	    file://mips64-compiler.patch \
-           "
-
-SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
-SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
-
-PR = "r8"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
new file mode 100644
index 0000000..d81e0a6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
@@ -0,0 +1,13 @@
+require xserver-xorg.inc
+
+# Misc build failure for master HEAD
+SRC_URI += "file://crosscompile.patch \
+            file://fix_open_max_preprocessor_error.patch \
+	    file://mips64-compiler.patch \
+            file://pkgconfig-deps.patch \
+           "
+
+SRC_URI[md5sum] = "256325e9b17dff479d92bed97f6b0adb"
+SRC_URI[sha256sum] = "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2893092500358a4366fc"
+
+PR = "r0"
-- 
1.7.10



