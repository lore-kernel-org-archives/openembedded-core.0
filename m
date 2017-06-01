Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 993806093B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:30:02 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id f55so32460054qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=EVgmwgnoK5yUK/oI4tTx8KHRzTQL1gS96Aob2jcRlws=;
	b=j6guYSWjPwK/Ohp9oXvh4ri/yq05F9WAfq1T+/AUCV+jzf1xazNkQHCe1drZL9Nipt
	W9lZCUI/T5uIHXqLYBGvguSTtTJGZcwcZkmNLzSqOyUXx6OdJoInLTCSGog6XGm5I2vx
	ZJ4WahIRfkdx7Ddr0mMYD8kuHSOxn/YAkstPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EVgmwgnoK5yUK/oI4tTx8KHRzTQL1gS96Aob2jcRlws=;
	b=MMKfEqjZ0c4nthfZvt9kJZVnzjNR7WQNgytvf/+QpxiWTBvggj4Bv/zX0bzWh8Ozf+
	4ygOBFEJm/zucrbbPHq+VgrUjq3dL5yG8RIhnTleHAbEmnxxQ5Cva9rXWkKJRvOYadwa
	X+OG2T/JZF1v3ifI+Jq2ngtDpMQfQ3NCQfyZyGFBp5k9EEx4/K6hUr84TFMvJqB7R7L1
	Nhcf2ij6HscZbw0BbP3TZ9uZGNbhofLfXXWcirdGP2cZPG2AwXy6NJLnyn88YGkV21KK
	LSGc8BANH+LFU7ZbW2to7+AIjUT0FeOVAwU8AaccNRHk8avwp2Fl9DN0klglK433/PvG
	i9Ng==
X-Gm-Message-State: AODbwcA2TT6j86lhxpcmqQNnRgvu8WVP7EyPKvcYsd1QtHRDV/SOTwWY
	GWgU12gzMx2oPQy1VeSoQQ==
X-Received: by 10.237.33.183 with SMTP id l52mr715702qtc.165.1496313004057;
	Thu, 01 Jun 2017 03:30:04 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	d27sm12658713qtc.50.2017.06.01.03.30.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jun 2017 03:30:02 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 12:29:45 +0200
Message-Id: <20170601102945.18190-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] mesa: upgrade to 17.1.1
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
X-List-Received-Date: Thu, 01 Jun 2017 10:30:03 -0000

* Costmetic changes in license.html file required new MD5 hash
* Add PACKAGECONFIG option for libunwind support (new feature, disable by default)
* Rebased 0001-Use-wayland-scanner-in-the-path.patch
* Added zlib in DEPENDS, otherwise mesa no longer builds.
* Added 0001-util-rand_xor-add-missing-include-statements.patch, sent upstream

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../0001-Use-wayland-scanner-in-the-path.patch     | 12 ++++----
 ...l-rand_xor-add-missing-include-statements.patch | 35 ++++++++++++++++++++++
 .../mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  6 ++--
 .../mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb}        |  5 ++--
 5 files changed, 48 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb} (76%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
index e49695bf85..eb6ff4ff04 100644
--- a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
@@ -1,4 +1,4 @@
-From 2f68fcaaf4964e7feeb383f5c26851965cda037c Mon Sep 17 00:00:00 2001
+From c908f0c13ac81a3a52140f129a13b2bc997ff4ee Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 15 Nov 2016 15:20:49 +0200
 Subject: [PATCH] Simplify wayland-scanner lookup
@@ -15,23 +15,23 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e56e35a..a92005a 100644
+index 2c7e636fac..d2b2350739 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2020,12 +2020,7 @@ if test "x$with_egl_platforms" != "x" -a "x$enable_egl" != xyes; then
-     AC_MSG_ERROR([cannot build egl state tracker without EGL library])
+@@ -2174,12 +2174,7 @@ if test "x$with_platforms" != xauto; then
+     with_egl_platforms=$with_platforms
  fi
  
 -PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
 -        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
 -        WAYLAND_SCANNER='')
 -if test "x$WAYLAND_SCANNER" = x; then
--    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
 -fi
 +AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
  
  # Do per-EGL platform setups and checks
  egl_platforms=`IFS=', '; echo $with_egl_platforms`
 -- 
-2.1.4
+2.13.0
 
diff --git a/meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch b/meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
new file mode 100644
index 0000000000..ffe8b96163
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
@@ -0,0 +1,35 @@
+From a8a1081ec05634e667d6670ab7c128d536cc60a9 Mon Sep 17 00:00:00 2001
+From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
+Date: Thu, 1 Jun 2017 11:59:42 +0200
+Subject: [PATCH] util/rand_xor: add missing include statements
+
+Fixes for:
+
+src/util/rand_xor.c:60:13: error: implicit declaration of function 'open' [-Werror=implicit-function-declaration]
+    int fd = open("/dev/urandom", O_RDONLY);
+             ^~~~
+src/util/rand_xor.c:60:34: error: 'O_RDONLY' undeclared (first use in this function)
+    int fd = open("/dev/urandom", O_RDONLY);
+                                  ^~~~~~~~
+
+Upstream-Status: Submitted [ https://lists.freedesktop.org/archives/mesa-dev/2017-June/157542.html ]
+Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
+---
+ src/util/rand_xor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/rand_xor.c b/src/util/rand_xor.c
+index de05fa64b3..de04bbc284 100644
+--- a/src/util/rand_xor.c
++++ b/src/util/rand_xor.c
+@@ -25,6 +25,7 @@
+ #if defined(__linux__)
+ #include <sys/file.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #else
+ #include <time.h>
+ #endif
+-- 
+2.13.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.6.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.0.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 447fd6d0df..67039a9962 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,11 +10,11 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=899fbe7e42d494c7c8c159c7001693d5"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
@@ -74,6 +74,8 @@ PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-osmesa', 'osmesa', d)}"
 PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 
+PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_17.0.6.bb b/meta/recipes-graphics/mesa/mesa_17.1.1.bb
similarity index 76%
rename from meta/recipes-graphics/mesa/mesa_17.0.6.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.1.bb
index 3f98271f21..060a279015 100644
--- a/meta/recipes-graphics/mesa/mesa_17.0.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.1.bb
@@ -4,10 +4,11 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
+           file://0001-util-rand_xor-add-missing-include-statements.patch \
 "
 
-SRC_URI[md5sum] = "77ea38dc0ab899864b06ea2941ac31a4"
-SRC_URI[sha256sum] = "89ecf3bcd0f18dcca5aaa42bf36bb52a2df33be89889f94aaaad91f7a504a69d"
+SRC_URI[md5sum] = "a4844bc6052578574f9629458bcbb749"
+SRC_URI[sha256sum] = "aed503f94c0c1630a162a3e276f4ee12a86764cee4cb92338ea2dea99a04e7ef"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.11.0


