Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A97478439
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:51:05 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j80-v6so1945676qke.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 09:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=pLJwv9DOTbyYTmkM2LBW+TZgY6e0r1+mu0FOF7cJh5Y=;
	b=rvoaIE9XPUBKJGbzlz219bZHo1FB+xuz7mod7p+oLtvEyomHvI5CTEzTno7Tc8We42
	FQXPAyKRXpqA3HCKNG1mbQyv31hJLYUodSr9+/BwHb+1iot2g5cEemsX05WyMJsXvcjC
	7R20Arx45kMIIv760zBAsYO2hmEHvpPUGe4jHR4Kl7wptHswX6Mb74GBapylgiTsXkKn
	Q7e8/anuk0LnVxY7/Dt78+RIBF5e7CYgazg1HyEiZYi3M2S/yZr9rGl9HsyXNl87xP0d
	ROoLQKmyvj8+TpsdF9KaVroCi2LBzanamjYgjXUNANbQSSv3cGfKJcaajFMYTjgcbCMn
	QW7A==
X-Gm-Message-State: APt69E0S9OxSS3+jvHUqRw6GN5w3q3dXPdMxtijUN5pd6Tp40j5NEGIb
	O7XI0gtU4wDvzVLsjPpbVa8iTw==
X-Google-Smtp-Source: ADUXVKKebIP8Aih1cdoCIhS1wH4NnWgDg5qcpL2AVmyZeonvBPut0czANN38Y32y/zw1PF1/76qcdw==
X-Received: by 2002:a37:bb43:: with SMTP id
	l64-v6mr20407861qkf.414.1528217465883; 
	Tue, 05 Jun 2018 09:51:05 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	m70-v6sm19551119qkl.72.2018.06.05.09.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Jun 2018 09:51:04 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Jun 2018 13:50:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Jun 2018 13:50:55 -0300
Message-Id: <20180605165055.19306-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Update 18.0.2 -> 18.1.1
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
X-List-Received-Date: Tue, 05 Jun 2018 16:51:05 -0000

This includes all bugfixes of 18.0.x series and major new
features. For list of changes check:

https://www.mesa3d.org/relnotes/18.1.0.html
https://www.mesa3d.org/relnotes/18.1.1.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...am-explictly-add-lib-expat-to-intel-.patch | 18 ++++----
 ...0001-Use-wayland-scanner-in-the-path.patch | 34 ---------------
 ...0002-Simplify-wayland-scanner-lookup.patch | 38 +++++++++++++++++
 ...winsys-svga-drm-Include-sys-types.h.patch} | 12 +++---
 ...-gloat.patch => 0004-hardware-gloat.patch} | 15 +++----
 ...-version-when-using-LLVM-Git-releas.patch} | 13 +++---
 ...Use-Python-3-to-execute-the-scripts.patch} | 12 +++---
 .../mesa/files/disable-asm-on-non-gcc.patch   | 29 -------------
 .../mesa/files/vulkan-mkdir.patch             | 41 -------------------
 .../{mesa-gl_18.0.2.bb => mesa-gl_18.1.1.bb}  |  0
 .../mesa/{mesa_18.0.2.bb => mesa_18.1.1.bb}   | 18 ++++----
 11 files changed, 84 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
 rename meta/recipes-graphics/mesa/files/{0001-winsys-svga-drm-Include-sys-types.h.patch => 0003-winsys-svga-drm-Include-sys-types.h.patch} (80%)
 rename meta/recipes-graphics/mesa/files/{0002-hardware-gloat.patch => 0004-hardware-gloat.patch} (80%)
 rename meta/recipes-graphics/mesa/files/{llvm-config-version.patch => 0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch} (77%)
 rename meta/recipes-graphics/mesa/files/{Use-Python-3-to-execute-the-scripts.patch => 0006-Use-Python-3-to-execute-the-scripts.patch} (76%)
 delete mode 100644 meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_18.0.2.bb => mesa-gl_18.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.0.2.bb => mesa_18.1.1.bb} (54%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
index f908d46550..c4157483d9 100644
--- a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
@@ -1,8 +1,9 @@
-From 342311dbb190735b7b32ab20f81c1d8dbcfe717a Mon Sep 17 00:00:00 2001
+From 327c3dcbfa005f5d1b2fcda07ca1198d65bd23c5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 11 Oct 2017 15:40:42 +0800
-Subject: [PATCH] Makefile.vulkan.am: explictly add lib expat to intel
+Subject: [PATCH 1/6] Makefile.vulkan.am: explictly add lib expat to intel
  libvulkan's lib depends
+Organization: O.S. Systems Software LTDA.
 
 While built with "-fvisibility=default"
 ...
@@ -28,11 +29,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/intel/Makefile.vulkan.am | 1 +
  1 file changed, 1 insertion(+)
 
-Index: mesa-17.3.6/src/intel/Makefile.vulkan.am
-===================================================================
---- mesa-17.3.6.orig/src/intel/Makefile.vulkan.am
-+++ mesa-17.3.6/src/intel/Makefile.vulkan.am
-@@ -144,6 +144,7 @@ VULKAN_LIB_DEPS = \
+diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
+index 4125cb205a..356c4f8452 100644
+--- a/src/intel/Makefile.vulkan.am
++++ b/src/intel/Makefile.vulkan.am
+@@ -161,6 +161,7 @@ VULKAN_LIB_DEPS = \
  	$(LIBDRM_LIBS) \
  	$(PTHREAD_LIBS) \
  	$(DLOPEN_LIBS) \
@@ -40,3 +41,6 @@ Index: mesa-17.3.6/src/intel/Makefile.vulkan.am
  	-lm
  
  if HAVE_PLATFORM_ANDROID
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
deleted file mode 100644
index 2444b2846b..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c908f0c13ac81a3a52140f129a13b2bc997ff4ee Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 15 Nov 2016 15:20:49 +0200
-Subject: [PATCH] Simplify wayland-scanner lookup
-
-Don't use pkg-config to lookup the path of a binary that's in the path.
-
-Alternatively we'd have to prefix the path returned by pkg-config with
-PKG_CONFIG_SYSROOT_DIR.
-
-Upstream-Status: Pending
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-Index: mesa-17.3.6/configure.ac
-===================================================================
---- mesa-17.3.6.orig/configure.ac
-+++ mesa-17.3.6/configure.ac
-@@ -1694,12 +1694,7 @@ if test "x$with_platforms" = xauto; then
-     with_platforms=$with_egl_platforms
- fi
- 
--PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
--        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
--        WAYLAND_SCANNER='')
--if test "x$WAYLAND_SCANNER" = x; then
--    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
--fi
-+AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
- 
- PKG_CHECK_EXISTS([wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], [have_wayland_protocols=yes], [have_wayland_protocols=no])
- if test "x$have_wayland_protocols" = xyes; then
diff --git a/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
new file mode 100644
index 0000000000..18b69269cd
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-Simplify-wayland-scanner-lookup.patch
@@ -0,0 +1,38 @@
+From 135f6ae990df9abe3765ed339f76c55026c86fe5 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 15 Nov 2016 15:20:49 +0200
+Subject: [PATCH 2/6] Simplify wayland-scanner lookup
+Organization: O.S. Systems Software LTDA.
+
+Don't use pkg-config to lookup the path of a binary that's in the path.
+
+Alternatively we'd have to prefix the path returned by pkg-config with
+PKG_CONFIG_SYSROOT_DIR.
+
+Upstream-Status: Pending
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f1fbdcc6c7..7c95598afc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1796,12 +1796,7 @@ for plat in $platforms; do
+         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
+         WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
+ 
+-        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
+-                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
+-                          WAYLAND_SCANNER='')
+-        if test "x$WAYLAND_SCANNER" = x; then
+-            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
+-        fi
++        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
+ 
+         if test "x$WAYLAND_SCANNER" = "x:"; then
+                 AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
similarity index 80%
rename from meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch
rename to meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
index 549b8671ab..e5246f55c0 100644
--- a/meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
@@ -1,7 +1,8 @@
-From d8750776404b1031d762966d0f551d13d2fe05a7 Mon Sep 17 00:00:00 2001
+From edb22b2f4df8dab39559ace867c3c67bc12851ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH] winsys/svga/drm: Include sys/types.h
+Subject: [PATCH 3/6] winsys/svga/drm: Include sys/types.h
+Organization: O.S. Systems Software LTDA.
 
 vmw_screen.h uses dev_t which is defines in sys/types.h
 this header is required to be included for getting dev_t
@@ -11,14 +12,11 @@ system headers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-
-Upstream-Status: Submitted
-
  src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/winsys/svga/drm/vmw_screen.h
-index 0ef8e84..2eda97e 100644
+index f21cabb51f..4c972fdaa9 100644
 --- a/src/gallium/winsys/svga/drm/vmw_screen.h
 +++ b/src/gallium/winsys/svga/drm/vmw_screen.h
 @@ -41,6 +41,7 @@
@@ -30,5 +28,5 @@ index 0ef8e84..2eda97e 100644
  #define VMW_GMR_POOL_SIZE (16*1024*1024)
  #define VMW_QUERY_POOL_SIZE (8192)
 -- 
-2.14.1
+2.17.1
 
diff --git a/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch b/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
similarity index 80%
rename from meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch
rename to meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
index 0e014dcc80..09db192b57 100644
--- a/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch
+++ b/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
@@ -1,7 +1,8 @@
-From 00bcd599310dc7fce4fe336ffd85902429051a0c Mon Sep 17 00:00:00 2001
+From 52468545daa0c2d205312e06304d8fb374e0bbf0 Mon Sep 17 00:00:00 2001
 From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
 Date: Sun, 20 Mar 2016 13:27:04 +0100
-Subject: [PATCH 2/4] hardware gloat
+Subject: [PATCH 4/6] hardware gloat
+Organization: O.S. Systems Software LTDA.
 
 Upstream-Status: Inappropriate [not author]
 Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
@@ -11,10 +12,10 @@ Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
  2 files changed, 14 insertions(+)
 
 diff --git a/src/gallium/drivers/llvmpipe/lp_screen.c b/src/gallium/drivers/llvmpipe/lp_screen.c
-index 4f61de8..3b0ec77 100644
+index 3f5d0327bf..86808e016b 100644
 --- a/src/gallium/drivers/llvmpipe/lp_screen.c
 +++ b/src/gallium/drivers/llvmpipe/lp_screen.c
-@@ -411,6 +411,13 @@ llvmpipe_is_format_supported( struct pipe_screen *_screen,
+@@ -449,6 +449,13 @@ llvmpipe_is_format_supported( struct pipe_screen *_screen,
     if (!format_desc)
        return FALSE;
  
@@ -29,10 +30,10 @@ index 4f61de8..3b0ec77 100644
            target == PIPE_TEXTURE_1D ||
            target == PIPE_TEXTURE_1D_ARRAY ||
 diff --git a/src/gallium/drivers/softpipe/sp_screen.c b/src/gallium/drivers/softpipe/sp_screen.c
-index 031602b..c279120 100644
+index 25f6f74f36..61629ef2ff 100644
 --- a/src/gallium/drivers/softpipe/sp_screen.c
 +++ b/src/gallium/drivers/softpipe/sp_screen.c
-@@ -358,6 +358,13 @@ softpipe_is_format_supported( struct pipe_screen *screen,
+@@ -397,6 +397,13 @@ softpipe_is_format_supported( struct pipe_screen *screen,
     if (!format_desc)
        return FALSE;
  
@@ -47,5 +48,5 @@ index 031602b..c279120 100644
        return FALSE;
  
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta/recipes-graphics/mesa/files/llvm-config-version.patch b/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
similarity index 77%
rename from meta/recipes-graphics/mesa/files/llvm-config-version.patch
rename to meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
index fd79991aab..1664f0610f 100644
--- a/meta/recipes-graphics/mesa/files/llvm-config-version.patch
+++ b/meta/recipes-graphics/mesa/files/0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
@@ -1,5 +1,8 @@
+From 33025fb1650768a0b923f3c824c270628eef83db Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
-Subject: [PATCH] Properly get LLVM version when using LLVM Git releases
+Date: Tue, 5 Jun 2018 11:11:10 -0300
+Subject: [PATCH 5/6] Properly get LLVM version when using LLVM Git releases
+Organization: O.S. Systems Software LTDA.
 
 $ llvm-config-host --version
 5.0.0git-9a5c333388c
@@ -15,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a02173f244..b107f04c2e 100644
+index 7c95598afc..c248248c6b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -995,7 +995,7 @@ strip_unwanted_llvm_flags() {
+@@ -1075,7 +1075,7 @@ strip_unwanted_llvm_flags() {
  
  llvm_set_environment_variables() {
      if test "x$LLVM_CONFIG" != xno; then
@@ -27,7 +30,7 @@ index a02173f244..b107f04c2e 100644
          LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
          LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
          LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2644,7 +2644,7 @@ detect_old_buggy_llvm() {
+@@ -2776,7 +2776,7 @@ detect_old_buggy_llvm() {
      dnl ourselves.
      dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
      dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
@@ -37,5 +40,5 @@ index a02173f244..b107f04c2e 100644
  
      if test "x$llvm_have_one_so" = xyes; then
 -- 
-2.15.1
+2.17.1
 
diff --git a/meta/recipes-graphics/mesa/files/Use-Python-3-to-execute-the-scripts.patch b/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
similarity index 76%
rename from meta/recipes-graphics/mesa/files/Use-Python-3-to-execute-the-scripts.patch
rename to meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
index 0b4aabf979..d32a967159 100644
--- a/meta/recipes-graphics/mesa/files/Use-Python-3-to-execute-the-scripts.patch
+++ b/meta/recipes-graphics/mesa/files/0006-Use-Python-3-to-execute-the-scripts.patch
@@ -1,7 +1,7 @@
-From 18c3e684a8259a0644214f88c7ead7fa31573fd9 Mon Sep 17 00:00:00 2001
+From 2c6f0c6f83d2012d2ffb64f1caff966497de8f72 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Fri, 29 Dec 2017 10:27:59 -0200
-Subject: [PATCH] Use Python 3 to execute the scripts
+Subject: [PATCH 6/6] Use Python 3 to execute the scripts
 Organization: O.S. Systems Software LTDA.
 
 The MESA build system uses Python 2 but as OE-Core has moved away from
@@ -15,11 +15,11 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b107f04c2e..055546142d 100644
+index c248248c6b..10f199d63c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -114,7 +114,7 @@ AC_PROG_CXX
- AM_PROG_CC_C_O
+@@ -122,7 +122,7 @@ AM_PROG_CC_C_O
+ AC_PROG_NM
  AM_PROG_AS
  AX_CHECK_GNU_MAKE
 -AC_CHECK_PROGS([PYTHON2], [python2.7 python2 python])
@@ -28,5 +28,5 @@ index b107f04c2e..055546142d 100644
  AC_PROG_MKDIR_P
  
 -- 
-2.15.1
+2.17.1
 
diff --git a/meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch b/meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch
deleted file mode 100644
index d2d67558b6..0000000000
--- a/meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Configure checks for compiler to be gcc and then it enables asm_offsets
-generation. see
-
-https://cgit.freedesktop.org/mesa/mesa/commit/?id=73c9b4b0e05fc66629ba250846948dc55c0e7a0d
-
-However, we missed the check when enabling this on cross compilation
-when architecture for both host and target is x86
-
-Fixes errors like
-./gen_matypes > matypes.h
-/bin/bash: ./gen_matypes: No such file or directory
-
--Khem
-
-Upstream-Status: Submitted
-
-Index: mesa-12.0.1/configure.ac
-===================================================================
---- mesa-12.0.1.orig/configure.ac
-+++ mesa-12.0.1/configure.ac
-@@ -732,7 +732,7 @@ test "x$enable_asm" = xno && AC_MSG_RESU
- if test "x$enable_asm" = xyes -a "x$cross_compiling" = xyes; then
-     case "$host_cpu" in
-     i?86 | x86_64 | amd64)
--        if test "x$host_cpu" != "x$target_cpu"; then
-+        if test "x$host_cpu" != "x$target_cpu" -o "x$acv_mesa_CLANG" = xyes; then
-             enable_asm=no
-             AC_MSG_RESULT([no, cross compiling])
-         fi
diff --git a/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch b/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
deleted file mode 100644
index 9922a55b40..0000000000
--- a/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 4854c72bc21486f81712c8693588f7af6c64cf93 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 9 May 2018 20:41:36 +0100
-Subject: [PATCH] src/intel/Makefile.vulkan.am: add missing MKDIR_GEN
-
-Out of tree builds can try to write into a directory that doesn't exist yet:
-
-| Traceback (most recent call last):
-|   File "../../../mesa-18.0.2/src/intel/vulkan/anv_icd.py", line 46, in <module>
-|     with open(args.out, 'w') as f:
-| IOError: [Errno 2] No such file or directory: 'vulkan/intel_icd.x86_64.json'
-| Makefile:4882: recipe for target 'vulkan/intel_icd.x86_64.json' failed
-
-Add missing MKDIR_GEN calls to solve this.
----
- src/intel/Makefile.vulkan.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
-index 0bcbf0419c..4125cb205a 100644
---- a/src/intel/Makefile.vulkan.am
-+++ b/src/intel/Makefile.vulkan.am
-@@ -64,10 +64,12 @@ EXTRA_DIST += \
- 	vulkan/TODO
- 
- vulkan/dev_icd.json : vulkan/anv_extensions.py vulkan/anv_icd.py
-+	$(MKDIR_GEN)
- 	$(AM_V_GEN)$(PYTHON2) $(srcdir)/vulkan/anv_icd.py \
- 		--lib-path="${abs_top_builddir}/${LIB_DIR}" --out $@
- 
- vulkan/intel_icd.@host_cpu@.json : vulkan/anv_extensions.py vulkan/anv_icd.py
-+	$(MKDIR_GEN)
- 	$(AM_V_GEN)$(PYTHON2) $(srcdir)/vulkan/anv_icd.py \
- 		--lib-path="${libdir}" --out $@
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_18.0.2.bb b/meta/recipes-graphics/mesa/mesa_18.1.1.bb
similarity index 54%
rename from meta/recipes-graphics/mesa/mesa_18.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_18.1.1.bb
index f2ac38e919..7aeb28bda3 100644
--- a/meta/recipes-graphics/mesa/mesa_18.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.1.bb
@@ -1,18 +1,16 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://disable-asm-on-non-gcc.patch \
-	   file://Use-Python-3-to-execute-the-scripts.patch \
-           file://0001-Use-wayland-scanner-in-the-path.patch \
-           file://0002-hardware-gloat.patch \
-           file://llvm-config-version.patch \
-           file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
-           file://vulkan-mkdir.patch \
-           "
+           file://0002-Simplify-wayland-scanner-lookup.patch \
+           file://0003-winsys-svga-drm-Include-sys-types.h.patch \
+           file://0004-hardware-gloat.patch \
+           file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
+           file://0006-Use-Python-3-to-execute-the-scripts.patch \
+"
 
-SRC_URI[md5sum] = "3c303da98ec2ce37c795baeba5aee31e"
-SRC_URI[sha256sum] = "98fa159768482dc568b9f8bf0f36c7acb823fa47428ffd650b40784f16b9e7b3"
+SRC_URI[md5sum] = "063468c930ff61d211ece0191874fa95"
+SRC_URI[sha256sum] = "d3312a2ede5aac14a47476b208b8e3a401367838330197c4588ab8ad420d7781"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.17.1


