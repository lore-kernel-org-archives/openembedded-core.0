Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 323837CC0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 21:22:01 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w5so3454059qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 14:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:organization:content-transfer-encoding;
	bh=1bpwUmqYY1nDZR32HRs8brzlnFF7AuPC4x/YSad0sTw=;
	b=OA1PVFVOLKQvXz89lVArZmgFZjtO3zXpnwZHTWw065sgOfE7yb+w26ORAVMjpFLyD3
	PUfjImm7moUo4xRIVe6a/Z2d6j1snkpFsAed0cRy8TesJ4xvr13iOszsXfH7PszSZkGU
	sqr3BflYuNJSUxBVACHRIvXZLZAJgqet8VMlL9XcTYFW81saIr78Cx6rJQYd4a+nYBLn
	SF5iup15IPYGlm/qZRMKhaLA2dit8WgM9o4n8WX8GXcOthvzi9qE0NS9jwF2lPdiJJgQ
	l3hQOZthFrqL0A7O4bJ8YJfRG9AIrTluIz0XO7jLoPM9fV5hUMZCnV/xpuBuYmJ1FiG9
	D26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=1bpwUmqYY1nDZR32HRs8brzlnFF7AuPC4x/YSad0sTw=;
	b=KapIYJA2K0UcNRzONt9EjaTdfkUdTmJ9/T8GCXmbSP5LmhA9ZFU34329wLuOzaXrSG
	1B/JQzCSFmahlkvT0vINyKZLreX3RDbBBlYMNZt6xHkqS3TnoKZaAEEkat671+gcHdhk
	0Od4rEvVPzFSc2ytlA5xk4eEGccvSYfY6tH46I4iOTEtzqqmvkY2oDJBvf8lPLjquPJF
	mgBsnIu7ziUZCUhVDplGE4Zz4vzB3Qtjt3NOosi4sgyQry+amLgzsinZYwPMt8ijh/aN
	W1OLhxyCNoZGBPtI5TieGOF46kcuUiw2M7ohiOR87aCqLn3ifBLJAPZXSjAb6ARPZila
	8OSw==
X-Gm-Message-State: APjAAAV3st84dilS4naVBYSCDW/ls2els+QxniV+jERnitZWHg/ezygs
	N5OutbQRN4ie1ZeLlyBgtkpzmMqDusOj+Q==
X-Google-Smtp-Source: APXvYqwzlb2To6H/d+4yYkxtsDYXUk9I5aqFOxDVYCEAF6QSdiHnMVzfpydswrA2aS4lCIaLeZVqLg==
X-Received: by 2002:a0c:b049:: with SMTP id l9mr4272692qvc.16.1552684921446;
	Fri, 15 Mar 2019 14:22:01 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	h18sm1814243qkj.50.2019.03.15.14.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 14:22:00 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:21:40 -0300
Message-Id: <20190315212140.9597-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
References: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Fri, 15 Mar 2019 21:22:01 -0000
Content-Transfer-Encoding: 8bit

  - Remove all non related meson patches
  - Change radeon driver to r100

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...0001-Simplify-wayland-scanner-lookup.patch | 44 --------------
 ...k-for-all-linux-host_os-combinations.patch | 41 +++++++++++++
 ...-winsys-svga-drm-Include-sys-types.h.patch | 35 ------------
 ...M-version-when-using-LLVM-Git-releas.patch | 45 ---------------
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 38 -------------
 meta/recipes-graphics/mesa/mesa.inc           | 57 +++++++++----------
 meta/recipes-graphics/mesa/mesa_19.0.0.bb     |  5 +-
 7 files changed, 68 insertions(+), 197 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
deleted file mode 100644
index d065e2285c..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e53837ad7b01364f34a533b95f4817c1795789de Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 20 Feb 2019 16:17:00 -0300
-Subject: [PATCH 1/4] Simplify wayland-scanner lookup
-Organization: O.S. Systems Software LTDA.
-
-Don't use pkg-config to lookup the path of a binary that's in the path.
-
-Alternatively we'd have to prefix the path returned by pkg-config with
-PKG_CONFIG_SYSROOT_DIR.
-
-Upstream-Status: Pending
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- configure.ac | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1ef68fe68e6..1816a4cd475 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1854,16 +1854,11 @@ for plat in $platforms; do
-         fi
-         WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
- 
--        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
--                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
--                          WAYLAND_SCANNER='')
-         PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
-                           AC_SUBST(SCANNER_ARG, 'private-code'),
-                           AC_SUBST(SCANNER_ARG, 'code'))
- 
--        if test "x$WAYLAND_SCANNER" = x; then
--            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
--        fi
-+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
- 
-         if test "x$WAYLAND_SCANNER" = "x:"; then
-                 AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
new file mode 100644
index 0000000000..23e207aebf
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -0,0 +1,41 @@
+From 021c24931367c83b62c550d1a296b0e9676726c0 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Fri, 15 Mar 2019 17:42:50 -0300
+Subject: [PATCH] meson.build: check for all linux host_os combinations
+Organization: O.S. Systems Software LTDA.
+
+Make sure that we are also looking for our host_os combinations like
+linux-musl etc. when assuming support for DRM/KMS.
+
+Also delete a duplicate line.
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 9272590201d..56465513da9 100644
+--- a/meson.build
++++ b/meson.build
+@@ -89,7 +89,7 @@ if (with_gles1 or with_gles2) and not with_opengl
+   error('building OpenGL ES without OpenGL is not supported.')
+ endif
+ 
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'linux'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+ 
+ _drivers = get_option('dri-drivers')
+ if _drivers.contains('auto')
+@@ -792,7 +792,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
+ endif
+ 
+ # TODO: this is very incomplete
+-if ['linux', 'cygwin', 'gnu'].contains(host_machine.system())
++if ['cygwin', 'gnu'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+   pre_args += '-D_GNU_SOURCE'
+ endif
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
deleted file mode 100644
index aaeb0f11ba..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f212b6bed4bf265aec069c21cdc4b7c2d9cb32df Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH 2/4] winsys/svga/drm: Include sys/types.h
-Organization: O.S. Systems Software LTDA.
-
-vmw_screen.h uses dev_t which is defines in sys/types.h
-this header is required to be included for getting dev_t
-definition. This issue happens on musl C library, it is hidden
-on glibc since sys/types.h is included through another
-system headers
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [7dfdfbf8c37e52e7b9b09f7d1d434edad3ebc864]
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/winsys/svga/drm/vmw_screen.h
-index a87c087d9c5..cb34fec48e7 100644
---- a/src/gallium/winsys/svga/drm/vmw_screen.h
-+++ b/src/gallium/winsys/svga/drm/vmw_screen.h
-@@ -41,6 +41,7 @@
- #include "svga_winsys.h"
- #include "pipebuffer/pb_buffer_fenced.h"
- #include <os/os_thread.h>
-+#include <sys/types.h>
- 
- #define VMW_GMR_POOL_SIZE (16*1024*1024)
- #define VMW_QUERY_POOL_SIZE (8192)
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
deleted file mode 100644
index 96edc2172b..0000000000
--- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ce7b9ff6517fda089f296b2af2c1c49604872514 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 3/4] Properly get LLVM version when using LLVM Git releases
-Organization: O.S. Systems Software LTDA.
-
-$ llvm-config-host --version
-5.0.0git-9a5c333388c
-
-We need to ignore everything after 5.0.0 which is what the cut cmd is
-doing
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1816a4cd475..13fed9daf59 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1124,7 +1124,7 @@ strip_unwanted_llvm_flags() {
- 
- llvm_set_environment_variables() {
-     if test "x$LLVM_CONFIG" != xno; then
--        LLVM_VERSION=`$LLVM_CONFIG --version | egrep -o '^[[0-9.]]+'`
-+        LLVM_VERSION=`$LLVM_CONFIG --version | cut -c1-5`
-         LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
-         LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
-         LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2870,7 +2870,7 @@ detect_old_buggy_llvm() {
-     dnl ourselves.
-     dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
-     dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
--    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
-+    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version | cut -c1-5`
-     AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm_have_one_so=yes])
- 
-     if test "x$llvm_have_one_so" = xyes; then
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
deleted file mode 100644
index 45bcd466a3..0000000000
--- a/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5489e1d22e18740a1924628c5c97096d48dcfbf8 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Fri, 15 Feb 2019 10:57:06 -0200
-Subject: [PATCH 4/4] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
-Organization: O.S. Systems Software LTDA.
-
-This allows to override the wayland-protocols pkgdatadir with the
-WAYLAND_PROTOCOLS_DATADIR from environment.
-
-pkgconfig would return an absolute path in
-/usr/share/wayland-protocols
-for the pkgdatadir value, which is not suitable for cross-compiling.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 13fed9daf59..6cff8afb7cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1852,7 +1852,7 @@ for plat in $platforms; do
-         if test "x$enable_egl" = xyes; then
-           PKG_CHECK_MODULES([WAYLAND_EGL], [wayland-egl-backend >= $WAYLAND_EGL_BACKEND_REQUIRED])
-         fi
--        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-+        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
- 
-         PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
-                           AC_SUBST(SCANNER_ARG, 'private-code'),
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 54818d7e0d..a677feaa40 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit autotools pkgconfig python3native gettext distro_features_check
+inherit meson pkgconfig python3native gettext distro_features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -34,16 +34,14 @@ PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
                surfaceless"
 
-export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
-EXTRA_OECONF = "--enable-shared-glapi \
-                --disable-opencl \
-                --enable-glx-read-only-text \
-                PYTHON2=python2 \
-                --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
-                --with-platforms='${PLATFORMS}' \
-                --enable-autotools \
+
+EXTRA_OEMESON = " \
+    -Dshared-glapi=true \
+    -Dgallium-opencl=disabled \
+    -Dglx-read-only-text=true \
+    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
 
 PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
@@ -55,36 +53,36 @@ PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
 PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
 # "gbm" requires "dri", "opengl"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
+PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
-PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
-PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 DRIDRIVERS_class-native = "swrast"
 DRIDRIVERS_class-nativesdk = "swrast"
-DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
-PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
+PACKAGECONFIG[dri] = "-Ddri-drivers=${DRIDRIVERS}, -Ddri-drivers='', xorgproto libdrm"
+PACKAGECONFIG[dri3] = "-Ddri3=true, -Ddri3=false, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
 # radeon could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
 VULKAN_DRIVERS_append_x86_class-target = ",intel"
 VULKAN_DRIVERS_append_x86-64_class-target = ",intel"
-PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=${VULKAN_DRIVERS}, --without-vulkan-drivers, python3-mako-native"
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${VULKAN_DRIVERS}, -Dvulkan-drivers='',"
 
-PACKAGECONFIG[opengl] = "--enable-opengl, --disable-opengl"
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
 # "gles" requires "opengl"
-PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
+PACKAGECONFIG[gles] = "-Dgles1=true -Dgles2=true, -Dgles1=false -Dgles2=false"
 
 # "egl" requires "dri", "opengl"
-PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
+PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[imx] = ""
@@ -105,27 +103,25 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS_append = ",virgl"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium] = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
 MESA_LLVM_RELEASE ?= "8.0"
-PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
+PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
 
-OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-osmesa', 'osmesa', d)}"
-PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
+OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', 'classic', d)}"
+PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
-PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
 
-EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
-EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
-EXTRA_OECONF_append_libc-musl_x86 = " --disable-asm"
+# mesa tries to run cross-built gen_matypes on build machine to get struct size information
+EXTRA_OEMESON_append = " -Dasm=false"
 
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
-EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
 
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
@@ -158,7 +154,6 @@ do_install_append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-    rmdir --ignore-fail-on-non-empty ${D}${libdir}/pkgconfig
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.0.bb b/meta/recipes-graphics/mesa/mesa_19.0.0.bb
index 024acdad0b..20aaa6e501 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.0.bb
@@ -1,10 +1,7 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-Simplify-wayland-scanner-lookup.patch \
-           file://0002-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
-           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
 "
 
 SRC_URI[md5sum] = "d0d76cd8b00bc1308e37985d4a45d3c5"
-- 
2.20.1


