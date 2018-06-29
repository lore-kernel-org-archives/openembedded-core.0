Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBA36006E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 21:01:50 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id z74-v6so5693438qkb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=oCpezyTM2JG/NZje5WdnUWNulC+RDPfv+BulNyhlMZw=;
	b=n/+FYYB0ez3r8lQwVH8AFWr0LvisghSrzGsbqjQ/Wl8xg+R11uEoct8RyCjDT08N4K
	xDj8GR9ABu8QUiAb1G+Z6jvpc9w8rkDfnIp+PJhvyUeDgyQah/p6HKFmdOhM/53gspi0
	RlbdYKa08WGSF0J3RZN5mdJwlpM7j+HcHvYk6EjeQmr5xZbEkcEmKeuNFYTgy7opLrw5
	6Lt+7s3cj5zKCJ+7NkOMZCZvjxRwc64mrGgQyWX7xeN9uWvnqPnAxRn2q4xFPrnWpdLR
	RUbV52qadwxYlsUiQlMp15j+vf4pJcIWBWMwxZJx6qz/BvvjiO48sWhXgbpMZw/uIb3v
	MQQg==
X-Gm-Message-State: APt69E1YLKhHgT8WnWCivTwAFCfZw+8HZoYQwGzDmF4p25YzFEqPqTq1
	RkJt2BoSXvKTimjzyHoDbFiByQ==
X-Google-Smtp-Source: AAOMgpdO59hq5IpvqHVg7CUKGlGF82+DjNCgi21ukatp5zzE2n9GPB533v/w8+H1ieKVpatjK6UKHg==
X-Received: by 2002:a37:ac06:: with SMTP id
	e6-v6mr6232534qkm.321.1530306110790; 
	Fri, 29 Jun 2018 14:01:50 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	43-v6sm8976734qtx.12.2018.06.29.14.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Jun 2018 14:01:49 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 29 Jun 2018 18:01:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2018 18:01:41 -0300
Message-Id: <20180629210141.23397-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 18.1.2 -> 18.1.3
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
X-List-Received-Date: Fri, 29 Jun 2018 21:01:50 -0000

This upgrades mesa to the 18.1.3 stable release.

The changes can be found at:

https://www.mesa3d.org/relnotes/18.1.3.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...am-explictly-add-lib-expat-to-intel-.patch |  6 ++--
 ...0002-Simplify-wayland-scanner-lookup.patch | 10 +++---
 ...-winsys-svga-drm-Include-sys-types.h.patch |  7 ++---
 .../mesa/files/0004-hardware-gloat.patch      |  6 ++--
 ...M-version-when-using-LLVM-Git-releas.patch | 12 +++----
 ...-Use-Python-3-to-execute-the-scripts.patch |  8 ++---
 ...-dri-i965-Add-missing-time.h-include.patch |  6 ++--
 ...0008-egl-fix-build-race-in-automake.patch} | 31 ++++++++++++++-----
 .../{mesa-gl_18.1.2.bb => mesa-gl_18.1.3.bb}  |  0
 .../mesa/{mesa_18.1.2.bb => mesa_18.1.3.bb}   |  6 ++--
 10 files changed, 53 insertions(+), 39 deletions(-)
 rename meta/recipes-graphics/mesa/files/{parallel-make-race-fix.patch => 0008-egl-fix-build-race-in-automake.patch} (50%)
 rename meta/recipes-graphics/mesa/{mesa-gl_18.1.2.bb => mesa-gl_18.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.1.2.bb => mesa_18.1.3.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
index 822066243b..3529f493e7 100644
--- a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
@@ -1,7 +1,7 @@
-From 327c3dcbfa005f5d1b2fcda07ca1198d65bd23c5 Mon Sep 17 00:00:00 2001
+From b514366df767da9acf991567bbee3eaa0c4ddaa6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 11 Oct 2017 15:40:42 +0800
-Subject: [PATCH 1/7] Makefile.vulkan.am: explictly add lib expat to intel
+Subject: [PATCH 1/8] Makefile.vulkan.am: explictly add lib expat to intel
  libvulkan's lib depends
 Organization: O.S. Systems Software LTDA.
 
@@ -42,5 +42,5 @@ index 4125cb205a..356c4f8452 100644
  
  if HAVE_PLATFORM_ANDROID
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
index e7585060ac..fb3d49b9be 100644
--- a/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
+++ b/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
@@ -1,7 +1,7 @@
-From 135f6ae990df9abe3765ed339f76c55026c86fe5 Mon Sep 17 00:00:00 2001
+From 425c19542f9343e7b6a5b8aea26e1f2897484bc1 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 15 Nov 2016 15:20:49 +0200
-Subject: [PATCH 2/7] Simplify wayland-scanner lookup
+Subject: [PATCH 2/8] Simplify wayland-scanner lookup
 Organization: O.S. Systems Software LTDA.
 
 Don't use pkg-config to lookup the path of a binary that's in the path.
@@ -16,10 +16,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f1fbdcc6c7..7c95598afc 100644
+index 49fa3e8c51..3a8f04bd12 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1796,12 +1796,7 @@ for plat in $platforms; do
+@@ -1810,12 +1810,7 @@ for plat in $platforms; do
          PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
          WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
  
@@ -34,5 +34,5 @@ index f1fbdcc6c7..7c95598afc 100644
          if test "x$WAYLAND_SCANNER" = "x:"; then
                  AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
index e5f4dfc075..669e6558d1 100644
--- a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
@@ -1,7 +1,7 @@
-From edb22b2f4df8dab39559ace867c3c67bc12851ae Mon Sep 17 00:00:00 2001
+From 7701d24b775de9f7b74eaa1ff80c8a6d3fb09c71 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH 3/7] winsys/svga/drm: Include sys/types.h
+Subject: [PATCH 3/8] winsys/svga/drm: Include sys/types.h
 Organization: O.S. Systems Software LTDA.
 
 vmw_screen.h uses dev_t which is defines in sys/types.h
@@ -11,7 +11,6 @@ on glibc since sys/types.h is included through another
 system headers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted
 ---
  src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
  1 file changed, 1 insertion(+)
@@ -29,5 +28,5 @@ index f21cabb51f..4c972fdaa9 100644
  #define VMW_GMR_POOL_SIZE (16*1024*1024)
  #define VMW_QUERY_POOL_SIZE (8192)
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch b/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
index f23b9875cd..b676b078a3 100644
--- a/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
+++ b/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
@@ -1,7 +1,7 @@
-From 52468545daa0c2d205312e06304d8fb374e0bbf0 Mon Sep 17 00:00:00 2001
+From 9bc2dad0257b778faf30edd5bc8f5c19ddf27351 Mon Sep 17 00:00:00 2001
 From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
 Date: Sun, 20 Mar 2016 13:27:04 +0100
-Subject: [PATCH 4/7] hardware gloat
+Subject: [PATCH 4/8] hardware gloat
 Organization: O.S. Systems Software LTDA.
 
 Upstream-Status: Inappropriate [not author]
@@ -48,5 +48,5 @@ index 25f6f74f36..61629ef2ff 100644
        return FALSE;
  
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
index 94189ac714..bffe8c5b8a 100644
--- a/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ b/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
@@ -1,7 +1,7 @@
-From 33025fb1650768a0b923f3c824c270628eef83db Mon Sep 17 00:00:00 2001
+From a240a803529225dda630b8f57ca7dfcad61ccd85 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 5/7] Properly get LLVM version when using LLVM Git releases
+Subject: [PATCH 5/8] Properly get LLVM version when using LLVM Git releases
 Organization: O.S. Systems Software LTDA.
 
 $ llvm-config-host --version
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7c95598afc..c248248c6b 100644
+index 3a8f04bd12..59226823ca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1075,7 +1075,7 @@ strip_unwanted_llvm_flags() {
+@@ -1089,7 +1089,7 @@ strip_unwanted_llvm_flags() {
  
  llvm_set_environment_variables() {
      if test "x$LLVM_CONFIG" != xno; then
@@ -30,7 +30,7 @@ index 7c95598afc..c248248c6b 100644
          LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
          LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
          LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2776,7 +2776,7 @@ detect_old_buggy_llvm() {
+@@ -2793,7 +2793,7 @@ detect_old_buggy_llvm() {
      dnl ourselves.
      dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
      dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
@@ -40,5 +40,5 @@ index 7c95598afc..c248248c6b 100644
  
      if test "x$llvm_have_one_so" = xyes; then
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch b/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
index 72ce0a33a0..3aebb1119d 100644
--- a/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
+++ b/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
@@ -1,7 +1,7 @@
-From 2c6f0c6f83d2012d2ffb64f1caff966497de8f72 Mon Sep 17 00:00:00 2001
+From 66b512e72e164a0da13c1cfffe988188cc2b4988 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Fri, 29 Dec 2017 10:27:59 -0200
-Subject: [PATCH 6/7] Use Python 3 to execute the scripts
+Subject: [PATCH 6/8] Use Python 3 to execute the scripts
 Organization: O.S. Systems Software LTDA.
 
 The MESA build system uses Python 2 but as OE-Core has moved away from
@@ -15,7 +15,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c248248c6b..10f199d63c 100644
+index 59226823ca..711cb8b82c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -122,7 +122,7 @@ AM_PROG_CC_C_O
@@ -28,5 +28,5 @@ index c248248c6b..10f199d63c 100644
  AC_PROG_MKDIR_P
  
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch b/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
index e56d1588fd..e559027c3d 100644
--- a/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
+++ b/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
@@ -1,7 +1,7 @@
-From 9a25f6e7a0eb8825ab089fdd166dbaee778a4c81 Mon Sep 17 00:00:00 2001
+From 23305c16e4444f5aa289f126f040ed061de292c0 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 6 Jun 2018 09:50:35 -0300
-Subject: [PATCH 7/7] dri: i965: Add missing time.h include
+Subject: [PATCH 7/8] dri: i965: Add missing time.h include
 Organization: O.S. Systems Software LTDA.
 
 This fixes a build error when using musl:
@@ -32,5 +32,5 @@ index 68f5e0c2c8..5b60a23763 100644
  #include "util/list.h"
  
 -- 
-2.17.1
+2.18.0
 
diff --git a/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch b/meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch
similarity index 50%
rename from meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
rename to meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch
index d212a55cbb..f594233206 100644
--- a/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
+++ b/meta/recipes-graphics/mesa/files/0008-egl-fix-build-race-in-automake.patch
@@ -1,22 +1,34 @@
+From b2aae4b8c6661424c1809d3e7b43f266e35385a6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 28 Jun 2018 23:01:59 +0100
+Subject: [PATCH 8/8] egl: fix build race in automake
+Organization: O.S. Systems Software LTDA.
+
 There is a parallel make build issue in src/egl/drivers/dri2/
 for wayland builds. Can be reproduced with:
 
 $ rm src/egl/drivers/dri2/*.h src/egl/drivers/dri2/platform_wayland.lo
 $ make -C src/egl/ drivers/dri2/platform_wayland.lo
-
 ../../../mesa-18.1.2/src/egl/drivers/dri2/platform_wayland.c:50:10: fatal error: linux-dmabuf-unstable-v1-client-protocol.h: No such file or directory
 
 This patch adds the missing dependency.
 
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Fixes: 02cc359372773800de817 "egl/wayland: Use linux-dmabuf interface for buffers"
+Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
 
-Upstream-Status: Submitted (https://lists.freedesktop.org/archives/mesa-dev/2018-June/198889.html)
+Upstream-Status: Backport [18.2.0]
 
-Index: mesa-18.1.2/src/egl/Makefile.am
-===================================================================
---- mesa-18.1.2.orig/src/egl/Makefile.am
-+++ mesa-18.1.2/src/egl/Makefile.am
-@@ -80,6 +80,7 @@ drivers/dri2/linux-dmabuf-unstable-v1-cl
+[Eric: fixed up the commit title]
+Signed-off-by: Eric Engestrom <eric.engestrom@intel.com>
+---
+ src/egl/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/egl/Makefile.am b/src/egl/Makefile.am
+index 086a4a1e63..116ed4ebf5 100644
+--- a/src/egl/Makefile.am
++++ b/src/egl/Makefile.am
+@@ -80,6 +80,7 @@ drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h: $(WL_DMABUF_XML)
  if HAVE_PLATFORM_WAYLAND
  drivers/dri2/linux-dmabuf-unstable-v1-protocol.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
  drivers/dri2/egl_dri2.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
@@ -24,3 +36,6 @@ Index: mesa-18.1.2/src/egl/Makefile.am
  
  AM_CFLAGS += $(WAYLAND_CLIENT_CFLAGS)
  libEGL_common_la_LIBADD += $(WAYLAND_CLIENT_LIBS)
+-- 
+2.18.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.2.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.1.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.2.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_18.1.2.bb
rename to meta/recipes-graphics/mesa/mesa_18.1.3.bb
index 9a9a2b2562..c47c57e9d8 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
@@ -8,11 +8,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
-           file://parallel-make-race-fix.patch \
+           file://0008-egl-fix-build-race-in-automake.patch \
 "
 
-SRC_URI[md5sum] = "a2d4f031eb6bd6111d44d84004476918"
-SRC_URI[sha256sum] = "070bf0648ba5b242d7303ceed32aed80842f4c0ba16e5acc1a650a46eadfb1f9"
+SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
+SRC_URI[sha256sum] = "54f08deeda0cd2f818e8d40140040ed013de7852573002453b7f50da9ea738ce"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.18.0


