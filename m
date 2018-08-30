Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id BB39A7842F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:24:43 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n6-v6so8067282qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 18:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=HVSdyOPl73wqAjt7XWD7bWSPXozNeEkKaFQ1EQ9s3Yw=;
	b=jSlFPxukmhjHwg+5CxROoPIb3gWUT+pPzarg0Je6zSJ1l1kz1ch9RBkaew0Ud1rlsL
	uj+O421SYxUVxBJl6hEsa3M4319HluqUHMsYqvPxuCIey9hT7RsFNJo1IXlZXn+v+Fze
	fzhcUa1lg1sYPcXTTAOtHA2CCvr7u9AutiRhGHky/eDPlGlG+anKMY96cQ4ieKfaAfPF
	gMkAh6QUKe01HD7Mrsa1H1a8SY9ffUMlh1dC9esKRVMAooixKPqwykrN5gQ0MxBhBz1b
	+YBsHtOS4iUGGtapMjQy7NMGfE/dNQcTbewZjEsL0vnR0tNVajjioq4CoKDPRYrZ9l/M
	eqFw==
X-Gm-Message-State: APzg51AbXmRzoVAMLP6wJE0Ou8OWRUQtb4p4SLcBO1Y9WcVBLcHo0sum
	KCbpXvTayLFaHIO/PX1M0oM/FKHzZb0=
X-Google-Smtp-Source: ANB0VdY9vqXD/hxCSPu/qXTwxGesWioEtYZbFR9utScSzDNkIrWM1v2h/yabcDuVFyz/EHx47j3oAw==
X-Received: by 2002:a0c:fb42:: with SMTP id
	b2-v6mr9212002qvq.215.1535592284085; 
	Wed, 29 Aug 2018 18:24:44 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	x189-v6sm3394086qkd.44.2018.08.29.18.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Aug 2018 18:24:43 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 29 Aug 2018 22:24:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 22:24:22 -0300
Message-Id: <20180830012422.7886-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180830012422.7886-1-otavio@ossystems.com.br>
References: <20180830012422.7886-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] mesa: Upgrade 18.1.3 -> 18.1.7
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
X-List-Received-Date: Thu, 30 Aug 2018 01:24:44 -0000

This upgrades mesa to the 18.1.7 stable release.

The changes can be found at:

 https://www.mesa3d.org/relnotes/18.1.4.html
 https://www.mesa3d.org/relnotes/18.1.5.html
 https://www.mesa3d.org/relnotes/18.1.6.html
 https://www.mesa3d.org/relnotes/18.1.7.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...001-Simplify-wayland-scanner-lookup.patch} |  9 ++--
 ...winsys-svga-drm-Include-sys-types.h.patch} |  5 ++-
 ...-version-when-using-LLVM-Git-releas.patch} | 10 ++---
 ...Use-Python-3-to-execute-the-scripts.patch} |  6 +--
 ...dri-i965-Add-missing-time.h-include.patch} |  4 +-
 ...-for-defining-WAYLAND_PROTOCOLS_DAT.patch} | 27 ++++++++----
 .../0008-egl-fix-build-race-in-automake.patch | 41 -------------------
 .../{mesa-gl_18.1.3.bb => mesa-gl_18.1.7.bb}  |  0
 meta/recipes-graphics/mesa/mesa_18.1.3.bb     | 22 ----------
 meta/recipes-graphics/mesa/mesa_18.1.7.bb     | 21 ++++++++++
 10 files changed, 59 insertions(+), 86 deletions(-)
 rename meta/recipes-graphics/mesa/files/{0002-Simplify-wayland-scanner-lookup.patch => 0001-Simplify-wayland-scanner-lookup.patch} (83%)
 rename meta/recipes-graphics/mesa/files/{0003-winsys-svga-drm-Include-sys-types.h.patch => 0002-winsys-svga-drm-Include-sys-types.h.patch} (85%)
 rename meta/recipes-graphics/mesa/files/{0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch => 0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch} (83%)
 rename meta/recipes-graphics/mesa/files/{0006-Use-Python-3-to-execute-the-scripts.patch => 0004-Use-Python-3-to-execute-the-scripts.patch} (82%)
 rename meta/recipes-graphics/mesa/files/{0007-dri-i965-Add-missing-time.h-include.patch => 0005-dri-i965-Add-missing-time.h-include.patch} (88%)
 rename meta/recipes-graphics/mesa/files/{cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch => 0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch} (54%)
 delete mode 100644 meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_18.1.3.bb => mesa-gl_18.1.7.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa_18.1.3.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_18.1.7.bb

diff --git a/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
similarity index 83%
rename from meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
rename to meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
index fb3d49b9be..a50d2a2ba2 100644
--- a/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
@@ -1,7 +1,7 @@
-From 425c19542f9343e7b6a5b8aea26e1f2897484bc1 Mon Sep 17 00:00:00 2001
+From 7e8e0f8a8ac2425e19a2f340c9e3da9345f25940 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 15 Nov 2016 15:20:49 +0200
-Subject: [PATCH 2/8] Simplify wayland-scanner lookup
+Subject: [PATCH 1/6] Simplify wayland-scanner lookup
 Organization: O.S. Systems Software LTDA.
 
 Don't use pkg-config to lookup the path of a binary that's in the path.
@@ -11,15 +11,16 @@ PKG_CONFIG_SYSROOT_DIR.
 
 Upstream-Status: Pending
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  configure.ac | 7 +------
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 49fa3e8c51..3a8f04bd12 100644
+index 14f1af2b2f..916d0bd207 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1810,12 +1810,7 @@ for plat in $platforms; do
+@@ -1825,12 +1825,7 @@ for plat in $platforms; do
          PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
          WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
  
diff --git a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
similarity index 85%
rename from meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
rename to meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
index 545752274e..ffb3bf7a63 100644
--- a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
@@ -1,7 +1,7 @@
-From 7701d24b775de9f7b74eaa1ff80c8a6d3fb09c71 Mon Sep 17 00:00:00 2001
+From 7792f228991744a0396b8bf811e281dca86165d3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH 3/8] winsys/svga/drm: Include sys/types.h
+Subject: [PATCH 2/6] winsys/svga/drm: Include sys/types.h
 Organization: O.S. Systems Software LTDA.
 
 vmw_screen.h uses dev_t which is defines in sys/types.h
@@ -12,6 +12,7 @@ system headers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Backport [7dfdfbf8c37e52e7b9b09f7d1d434edad3ebc864]
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
similarity index 83%
rename from meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
rename to meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
index bffe8c5b8a..5e735ca105 100644
--- a/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
@@ -1,7 +1,7 @@
-From a240a803529225dda630b8f57ca7dfcad61ccd85 Mon Sep 17 00:00:00 2001
+From 8b42fb47138f91d9378439ab716bac7701e4e326 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 5/8] Properly get LLVM version when using LLVM Git releases
+Subject: [PATCH 3/6] Properly get LLVM version when using LLVM Git releases
 Organization: O.S. Systems Software LTDA.
 
 $ llvm-config-host --version
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3a8f04bd12..59226823ca 100644
+index 916d0bd207..dd172f1ebe 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1089,7 +1089,7 @@ strip_unwanted_llvm_flags() {
+@@ -1090,7 +1090,7 @@ strip_unwanted_llvm_flags() {
  
  llvm_set_environment_variables() {
      if test "x$LLVM_CONFIG" != xno; then
@@ -30,7 +30,7 @@ index 3a8f04bd12..59226823ca 100644
          LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
          LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
          LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2793,7 +2793,7 @@ detect_old_buggy_llvm() {
+@@ -2808,7 +2808,7 @@ detect_old_buggy_llvm() {
      dnl ourselves.
      dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
      dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
diff --git a/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
similarity index 82%
rename from meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
rename to meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
index 3aebb1119d..8953c4a18f 100644
--- a/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
+++ b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
@@ -1,7 +1,7 @@
-From 66b512e72e164a0da13c1cfffe988188cc2b4988 Mon Sep 17 00:00:00 2001
+From ebe6077a1d74e56b28249f71e8760295fa846ed2 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Fri, 29 Dec 2017 10:27:59 -0200
-Subject: [PATCH 6/8] Use Python 3 to execute the scripts
+Subject: [PATCH 4/6] Use Python 3 to execute the scripts
 Organization: O.S. Systems Software LTDA.
 
 The MESA build system uses Python 2 but as OE-Core has moved away from
@@ -15,7 +15,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 59226823ca..711cb8b82c 100644
+index dd172f1ebe..40cac36ac2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -122,7 +122,7 @@ AM_PROG_CC_C_O
diff --git a/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
similarity index 88%
rename from meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
rename to meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
index 5b55b8a1fd..d40e7b5855 100644
--- a/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
+++ b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
@@ -1,7 +1,7 @@
-From 23305c16e4444f5aa289f126f040ed061de292c0 Mon Sep 17 00:00:00 2001
+From 9e0368af471af3a36e0eb526453f892598120065 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 6 Jun 2018 09:50:35 -0300
-Subject: [PATCH 7/8] dri: i965: Add missing time.h include
+Subject: [PATCH 5/6] dri: i965: Add missing time.h include
 Organization: O.S. Systems Software LTDA.
 
 This fixes a build error when using musl:
diff --git a/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch b/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
similarity index 54%
rename from meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
rename to meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
index b4e3c4995f..0212922c5d 100644
--- a/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
+++ b/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -1,19 +1,29 @@
-use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+From 754ccf89a732fc3da6e9bc62ebd6b28686ff3d26 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 29 Aug 2018 22:10:30 -0300
+Subject: [PATCH 6/6] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+Organization: O.S. Systems Software LTDA.
 
 This allows to override the wayland-protocols pkgdatadir with the
 WAYLAND_PROTOCOLS_DATADIR from environment.
 
-pkgconfig would return an absolute path in /usr/share/wayland-protocols
+pkgconfig would return an absolute path in
+/usr/share/wayland-protocols
 for the pkgdatadir value, which is not suitable for cross-compiling.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: mesa-18.1.2/configure.ac
-===================================================================
---- mesa-18.1.2.orig/configure.ac
-+++ mesa-18.1.2/configure.ac
-@@ -1808,7 +1808,7 @@ for plat in $platforms; do
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 40cac36ac2..728bbdcbc4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1823,7 +1823,7 @@ for plat in $platforms; do
          PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
          PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
          PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
@@ -22,3 +32,6 @@ Index: mesa-18.1.2/configure.ac
  
          AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
  
+-- 
+2.18.0
+
diff --git a/meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch b/meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch
deleted file mode 100644
index f594233206..0000000000
--- a/meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b2aae4b8c6661424c1809d3e7b43f266e35385a6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 28 Jun 2018 23:01:59 +0100
-Subject: [PATCH 8/8] egl: fix build race in automake
-Organization: O.S. Systems Software LTDA.
-
-There is a parallel make build issue in src/egl/drivers/dri2/
-for wayland builds. Can be reproduced with:
-
-$ rm src/egl/drivers/dri2/*.h src/egl/drivers/dri2/platform_wayland.lo
-$ make -C src/egl/ drivers/dri2/platform_wayland.lo
-../../../mesa-18.1.2/src/egl/drivers/dri2/platform_wayland.c:50:10: fatal error: linux-dmabuf-unstable-v1-client-protocol.h: No such file or directory
-
-This patch adds the missing dependency.
-
-Fixes: 02cc359372773800de817 "egl/wayland: Use linux-dmabuf interface for buffers"
-Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
-
-Upstream-Status: Backport [18.2.0]
-
-[Eric: fixed up the commit title]
-Signed-off-by: Eric Engestrom <eric.engestrom@intel.com>
----
- src/egl/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/egl/Makefile.am b/src/egl/Makefile.am
-index 086a4a1e63..116ed4ebf5 100644
---- a/src/egl/Makefile.am
-+++ b/src/egl/Makefile.am
-@@ -80,6 +80,7 @@ drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h: $(WL_DMABUF_XML)
- if HAVE_PLATFORM_WAYLAND
- drivers/dri2/linux-dmabuf-unstable-v1-protocol.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
- drivers/dri2/egl_dri2.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
-+drivers/dri2/platform_wayland.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
- 
- AM_CFLAGS += $(WAYLAND_CLIENT_CFLAGS)
- libEGL_common_la_LIBADD += $(WAYLAND_CLIENT_LIBS)
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.3.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
deleted file mode 100644
index 0b49793c9d..0000000000
--- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0002-Simplify-wayland-scanner-lookup.patch \
-           file://0003-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
-           file://0006-Use-Python-3-to-execute-the-scripts.patch \
-           file://0007-dri-i965-Add-missing-time.h-include.patch \
-           file://0008-egl-fix-build-race-in-automake.patch \
-           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
-"
-
-SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
-SRC_URI[sha256sum] = "54f08deeda0cd2f818e8d40140040ed013de7852573002453b7f50da9ea738ce"
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
-}
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.7.bb b/meta/recipes-graphics/mesa/mesa_18.1.7.bb
new file mode 100644
index 0000000000..ca6e6685b5
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_18.1.7.bb
@@ -0,0 +1,21 @@
+require ${BPN}.inc
+
+SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+           file://0001-Simplify-wayland-scanner-lookup.patch \
+           file://0002-winsys-svga-drm-Include-sys-types.h.patch \
+           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
+           file://0004-Use-Python-3-to-execute-the-scripts.patch \
+           file://0005-dri-i965-Add-missing-time.h-include.patch \
+           file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+"
+
+SRC_URI[md5sum] = "17d8a7e7ecbe146a7dc439e8b6eb02e9"
+SRC_URI[sha256sum] = "655e3b32ce3bdddd5e6e8768596e5d4bdef82d0dd37067c324cc4b2daa207306"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
-- 
2.18.0


