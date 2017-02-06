Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E187365CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 23:26:42 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r141so133684869wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 15:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OIz4w47seufchHNJTg+mv+OvBiQOD4yBA0HeJiKTWAA=;
	b=ykZq+isrMLxcZ4MuwaX88Ek8JXhMlnF+Wa5AYAmBwFR4SKs7QN2itncuOv3K8ztWnF
	WUiMcB2mykXqLDOgkTzO+8EYHDp7Ya87n1yXNS6jq29yCaUWKRzr7OQbzbBESCFjua0F
	xh0qFSPrf8s72rZhsUppjeeKihwMSI5jiOHdkliJvJ5i+1d0w5RJ3qZSSDiwTef/CE/X
	v21naH7tKKTMJ1d2WRVoYHp3z0SJQKZLpZfFOgEq2ifjKcMoi1RdCJpaH0L78BD57u8m
	oSr5l9bT578Ty7CxnePaNpGV1MUFA1u9Ax7DwfYigUv3FFIsRh+Y9522V0QPOCq0vXbS
	RTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OIz4w47seufchHNJTg+mv+OvBiQOD4yBA0HeJiKTWAA=;
	b=TD2y1IzhBPzjXSJre8XpZVTUI7VWh4MahvprtOVFdbNrR8f6KrPIGP8G+RHwes4Mld
	bvBpdmRhAxqMBzi+003fPgYNUZl7jfO+gSf+Of4SIteSx0T5Z7RUDpWhRQ9WJYR0BlLY
	bLV+MmsZWBby+Kg6fWydcomkLTjVwbFn03HGQ2wFMG95EofBYtB0XuxYFZxsjnl7KDi6
	+jX2vpXSWJnKVPjKDzdF+YDNgHa3zoT3GehRVpiPPNBsH8ay+J93CWZC3Q862aW2BYlH
	t0lrtEOMC7NYK9bdw7jRWFZcrR7icMi+pcdFZcX7bUzcjS69ULqN6uZFyT0u928BeUEK
	YWpQ==
X-Gm-Message-State: AMke39kOCngBMwBIONJOayagRy14+jIx0vh5+ATcPDzIcaP0ygBUtCbOBTlZ0JsBW/PR6qPz
X-Received: by 10.28.71.133 with SMTP id m5mr9855858wmi.132.1486423602162;
	Mon, 06 Feb 2017 15:26:42 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g71sm15575371wmc.9.2017.02.06.15.26.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 15:26:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 23:26:34 +0000
Message-Id: <1486423594-13790-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libepoxy: upgrade to 1.4.0
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
X-List-Received-Date: Mon, 06 Feb 2017 23:26:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop the two patches that add the ability to disable GLX, this has been added
upstream.

Drop the Python3 patch as the code generator works with Py3 now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-platforms-based-on-configuration-results.patch | 128 ---------------------
 ...0002-add-an-option-to-disable-glx-support.patch |  42 -------
 .../libepoxy/libepoxy/no-need-for-python3.patch    |  20 ----
 .../{libepoxy_git.bb => libepoxy_1.4.0.bb}         |  16 +--
 4 files changed, 4 insertions(+), 202 deletions(-)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
 rename meta/recipes-graphics/libepoxy/{libepoxy_git.bb => libepoxy_1.4.0.bb} (58%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
deleted file mode 100644
index 674c8e8..0000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 3a93150bc0aec86afdb7d053247dc2448925e09a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 6 May 2015 10:45:22 +0200
-Subject: [PATCH 1/2] select platforms based on configuration results
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/anholt/libepoxy/pull/52
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac          | 13 +++++--------
- src/dispatch_common.c |  9 ++++++---
- src/dispatch_common.h |  9 +++++----
- 3 files changed, 16 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a52fc58..bdd70da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,6 +58,10 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
- # uintptr_t to a void *") by default.  Kill that.
- XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- 
-+PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
-+
-+AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
-+
- has_znow=yes
- 
- case $host_os in
-@@ -86,7 +90,7 @@ case $host_os in
-         ;;
-     *)
-         build_egl=yes
--        build_glx=yes
-+        build_glx=$x11
-         build_wgl=no
-         # On platforms with dlopen, we load everything dynamically and
-         # don't link against a specific window system or GL implementation.
-@@ -144,13 +148,6 @@ esac
- 
- AC_SUBST([VISIBILITY_CFLAGS])
- 
--PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
--if test x$x11 = xno -a x$build_glx = xyes; then
--    AC_MSG_ERROR([libX11 headers (libx11-dev) required to build with GLX support])
--fi
--
--AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
--
- PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
- 
- AC_CONFIG_FILES([
-diff --git a/src/dispatch_common.c b/src/dispatch_common.c
-index 4e34d6e..2ab84ed 100644
---- a/src/dispatch_common.c
-+++ b/src/dispatch_common.c
-@@ -615,10 +615,13 @@ epoxy_get_proc_address(const char *name)
- #elif defined(__APPLE__)
-     return epoxy_gl_dlsym(name);
- #else
-+#if PLATFORM_HAS_GLX
-     if (epoxy_current_context_is_glx()) {
-         return glXGetProcAddressARB((const GLubyte *)name);
--    } else {
-+    } else
-+#endif /* PLATFORM_HAS_GLX */
- #if PLATFORM_HAS_EGL
-+    {
-         GLenum egl_api = epoxy_egl_get_current_gl_context_api();
- 
-         switch (egl_api) {
-@@ -628,10 +631,10 @@ epoxy_get_proc_address(const char *name)
-         case EGL_NONE:
-             break;
-         }
--#endif
-     }
-+#endif /* PLATFORM_HAS_EGL */
-     errx(1, "Couldn't find current GLX or EGL context.\n");
--#endif
-+#endif /* _WIN32 | __APPLE__*/
- }
- 
- void
-diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index 6b8503a..82681e4 100644
---- a/src/dispatch_common.h
-+++ b/src/dispatch_common.h
-@@ -21,12 +21,13 @@
-  * IN THE SOFTWARE.
-  */
- 
-+#include <config.h>
- #include <stdbool.h>
- 
- #ifdef _WIN32
- #define PLATFORM_HAS_EGL 0
- #define PLATFORM_HAS_GLX 0
--#define PLATFORM_HAS_WGL 1
-+#define PLATFORM_HAS_WGL BUILD_WGL
- #define EPOXY_IMPORTEXPORT __declspec(dllexport)
- #elif defined(__APPLE__)
- #define PLATFORM_HAS_EGL 0
-@@ -34,13 +35,13 @@
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #elif defined(ANDROID)
--#define PLATFORM_HAS_EGL 1
-+#define PLATFORM_HAS_EGL BUILD_EGL
- #define PLATFORM_HAS_GLX 0
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #else
--#define PLATFORM_HAS_EGL 1
--#define PLATFORM_HAS_GLX 1
-+#define PLATFORM_HAS_EGL BUILD_EGL
-+#define PLATFORM_HAS_GLX BUILD_GLX
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #endif
--- 
-1.9.3
-
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch b/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
deleted file mode 100644
index 262d684..0000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 24868cbfb9dda5f6929dd277c47d35df016e8754 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 6 May 2015 11:05:48 +0200
-Subject: [PATCH 2/2] add an option to disable glx support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this option would help us in yocto to get deterministic build results
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/anholt/libepoxy/pull/52
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index bdd70da..6c7153d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,7 +58,14 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
- # uintptr_t to a void *") by default.  Kill that.
- XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- 
--PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
-+AC_ARG_ENABLE([glx],
-+                [AS_HELP_STRING([--disable-glx],
-+				[disable if you don't want x11/glx support])],
-+                [],
-+                [enable_glx=yes]
-+             )
-+
-+PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
- 
- AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
- 
--- 
-1.9.3
-
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
deleted file mode 100644
index 4b8fea5..0000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-There is no need to use python3 by this package (the python scripts
-that are using during configuration only need python2.7+)
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -40,7 +40,7 @@ m4_ifndef([XORG_MACROS_VERSION],
- XORG_MACROS_VERSION(1.8)
- XORG_DEFAULT_OPTIONS
- 
--AC_CHECK_PROGS([PYTHON], [python3 python2 python])
-+AC_CHECK_PROGS([PYTHON], [python2 python])
- 
- # Initialize libtool
- AC_DISABLE_STATIC
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb
similarity index 58%
rename from meta/recipes-graphics/libepoxy/libepoxy_git.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb
index 6c247cc..4d52f12 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb
@@ -5,20 +5,12 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-
-SRC_URI = " \
-    git://github.com/anholt/libepoxy.git \
-    file://0001-select-platforms-based-on-configuration-results.patch \
-    file://0002-add-an-option-to-disable-glx-support.patch \
-    file://no-need-for-python3.patch \
-"
-SRCREV="e2c33af5bfcfc9d168f9e776156dd47c33f428b3"
-PV = "1.3.1"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/anholt/${BPN}/releases/download/v1.4/${BP}.tar.xz"
+SRC_URI[md5sum] = "d8d8cbf2beb64975d424fcc5167a2a38"
+SRC_URI[sha256sum] = "25a906b14a921bc2b488cfeaa21a00486fe92630e4a9dd346e4ecabeae52ab41"
 
 inherit autotools pkgconfig distro_features_check
-# depends on virtual/egl
+
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "util-macros virtual/egl"
-- 
2.8.1


