Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA4F67C898
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:58:18 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x6so9993685qki.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=txBlwfzvDAMn3DZbkWeonkCI2vld6rjBgRLW2IBclbQ=;
	b=Bw1fPPIt0HtGyW9Nv0MkPD12jJPn4S23rN21T2MSBEclSgPWh8PJZtvvyJ2srGkM/p
	hoopH+NEp1K2cwll4RxVe9romD+6VIW4dZe/cLm+cSmJXhAA8NlqW3RVwO+W1fTmh5sM
	kF6BNb5w7UdFTJaw6eyY3bU68yTbjLha6XAwRCC3xg3vacXobAtgLzoj0QhwZ/9UqIYC
	wqxe2zn19T6e/zk5fGf+uIndCuj1316VKPIR5kxiLYJurgK9+l3HuevBIKPMD4OGMLLZ
	MV6lYr77Pa9lbJmQdQgAsfpTt8/60+2WCJPY+sDXmKq/IWsUuKZClVzx211BQzp8ffac
	hRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=txBlwfzvDAMn3DZbkWeonkCI2vld6rjBgRLW2IBclbQ=;
	b=MuZxXO/8GNQiSDC1Kk2z99LtO7y5tV2NkVFIxcvfbF6Xc2R0IO6i2HSO9VFVm2qiRa
	B+iQIyh62aMSXqXD0ITnbWXc66WJLou69LFdchsyRqJ2mobUqXnq+IABry/n50mzUvV9
	7FvIuoYi4CnazvM1XNM+Oq13L8rn1yKUR+9DsZfN6aXZ7BwH+lqPzNixcfpn3okS3q7r
	fWiE3idKrO4GK1n5hbnVX3qHNfbmqfAbfxmbR9R+BWk4GjmB2BwrLwLAFJKUbrmFAuyG
	USzaS3x1Fyhn5DRSjOiSyDsiOtMG2jQuhy47Tjydr2ORb9+H3IWsIUGX0oM51HbsXUCF
	rFpw==
X-Gm-Message-State: AHQUAuY1goL1JodZkE7nVKUsIWKmypPBvg/YLFhZBdC29Sa9rw7O2jY+
	WtPhaCVr2oFhfWwBOF80t12la28pRCT3dw==
X-Google-Smtp-Source: AHgI3IbQH93q2dK/dxfMETEBwElcb4IgvxOuo0k19LWXxx0l5XvUpMjASLhGha802530h3RBQ/pjxg==
X-Received: by 2002:a37:3d7:: with SMTP id 206mr16219022qkd.164.1550498299054; 
	Mon, 18 Feb 2019 05:58:19 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id a3sm9049679qta.21.2019.02.18.05.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:58:18 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 10:57:47 -0300
Message-Id: <20190218135747.1228-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC][PATCH v2] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 18 Feb 2019 13:58:18 -0000
Content-Transfer-Encoding: 8bit

  - Remove all non related meson patches

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...0001-Simplify-wayland-scanner-lookup.patch | 43 ---------------
 ...ing-include-stddef.h-in-egldevice.h.patch} |  4 +-
 ...k-for-all-linux-host_os-combinations.patch | 50 +++++++++++++++++
 ...-winsys-svga-drm-Include-sys-types.h.patch | 34 ------------
 ...M-version-when-using-LLVM-Git-releas.patch | 44 ---------------
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 38 -------------
 meta/recipes-graphics/mesa/mesa.inc           | 54 +++++++++----------
 meta/recipes-graphics/mesa/mesa_18.3.3.bb     |  7 +--
 8 files changed, 79 insertions(+), 195 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
 rename meta/recipes-graphics/mesa/files/{0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch => 0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch} (91%)
 create mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
deleted file mode 100644
index e765356fe1..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7338667148cb7fcefee76b27359bc1e11656c132 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 15 Nov 2016 15:20:49 +0200
-Subject: [PATCH 1/5] Simplify wayland-scanner lookup
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
----
- configure.ac | 11 +----------
- 1 file changed, 1 insertion(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index cd9ff259fad..cbc455e130f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1841,16 +1841,7 @@ for plat in $platforms; do
-         fi
-         WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
- 
--        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
--                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
--                          WAYLAND_SCANNER='')
--        PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
--                          AC_SUBST(SCANNER_ARG, 'private-code'),
--                          AC_SUBST(SCANNER_ARG, 'code'))
--
--        if test "x$WAYLAND_SCANNER" = x; then
--            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
--        fi
-+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
- 
-         if test "x$WAYLAND_SCANNER" = "x:"; then
-                 AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch
similarity index 91%
rename from meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
rename to meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch
index 1782576db2..08d128e919 100644
--- a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
+++ b/meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch
@@ -1,7 +1,7 @@
-From f452e30ab664fe608acc107cc03d2efa8731d938 Mon Sep 17 00:00:00 2001
+From d2d5acdcb10465c024c8b0931d49e49660210d2c Mon Sep 17 00:00:00 2001
 From: Gurchetan Singh <gurchetansingh@chromium.org>
 Date: Wed, 28 Nov 2018 08:39:34 -0800
-Subject: [PATCH 5/5] egl: add missing #include <stddef.h> in egldevice.h
+Subject: [PATCH 1/2] egl: add missing #include <stddef.h> in egldevice.h
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-check-for-all-linux-host_os-combinations.patch
new file mode 100644
index 0000000000..f4650adf0f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -0,0 +1,50 @@
+From a4f6630f4563c2f3f619003706f541c380b49027 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Mon, 11 Feb 2019 20:55:27 +0800
+Subject: [PATCH 2/2] meson.build: check for all linux host_os combinations
+Organization: O.S. Systems Software LTDA.
+
+Make sure that we are also looking for our host_os combinations like
+linux-musl etc. when assuming support for DRM/KMS.
+
+Also delete a duplicate line.
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ meson.build | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index f11c556d359..e5f9b8a24be 100644
+--- a/meson.build
++++ b/meson.build
+@@ -34,7 +34,7 @@ cpp = meson.get_compiler('cpp')
+ 
+ null_dep = dependency('', required : false)
+ 
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'linux'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+ 
+ # Arguments for the preprocessor, put these in a separate array from the C and
+ # C++ (cpp in meson terminology) arguments since they need to be added to the
+@@ -92,8 +92,6 @@ if (with_gles1 or with_gles2) and not with_opengl
+   error('building OpenGL ES without OpenGL is not supported.')
+ endif
+ 
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'linux'].contains(host_machine.system())
+-
+ _drivers = get_option('dri-drivers')
+ if _drivers.contains('auto')
+   if system_has_kms_drm
+@@ -799,7 +797,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
+ endif
+ 
+ # TODO: this is very incomplete
+-if ['linux', 'cygwin', 'gnu'].contains(host_machine.system())
++if ['cygwin', 'gnu'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+   pre_args += '-D_GNU_SOURCE'
+ endif
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
deleted file mode 100644
index 12dca61e19..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 34c3d07b67e6c08f555473a86ff158951abb6000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH 2/5] winsys/svga/drm: Include sys/types.h
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
-2.20.1
-
diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
deleted file mode 100644
index 59b118d9f4..0000000000
--- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c5b5bf6c31be1823be1d0317eabe16558a4f0762 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 3/5] Properly get LLVM version when using LLVM Git releases
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
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index cbc455e130f..0065376f4b7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1111,7 +1111,7 @@ strip_unwanted_llvm_flags() {
- 
- llvm_set_environment_variables() {
-     if test "x$LLVM_CONFIG" != xno; then
--        LLVM_VERSION=`$LLVM_CONFIG --version | egrep -o '^[[0-9.]]+'`
-+        LLVM_VERSION=`$LLVM_CONFIG --version | cut -c1-5`
-         LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
-         LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
-         LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2860,7 +2860,7 @@ detect_old_buggy_llvm() {
-     dnl ourselves.
-     dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
-     dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
--    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
-+    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version | cut -c1-5`
-     AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm_have_one_so=yes])
- 
-     if test "x$llvm_have_one_so" = xyes; then
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
deleted file mode 100644
index d4f1d9dcf4..0000000000
--- a/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From f48b8f073f921ce5be859130313e9d392ef3e78e Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Fri, 15 Feb 2019 10:57:06 -0200
-Subject: [PATCH 4/5] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
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
-index 0065376f4b7..b21fb2210c6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1839,7 +1839,7 @@ for plat in $platforms; do
-         if test "x$enable_egl" = xyes; then
-           PKG_CHECK_MODULES([WAYLAND_EGL], [wayland-egl-backend >= $WAYLAND_EGL_BACKEND_REQUIRED])
-         fi
--        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-+        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
- 
-         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 233de8eb27..128dd80295 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
@@ -24,7 +24,7 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit autotools pkgconfig python3native gettext distro_features_check
+inherit meson pkgconfig python3native gettext distro_features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -34,15 +34,14 @@ PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
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
-                --with-platforms='${PLATFORMS}'"
+EXTRA_OEMESON = " \
+    -Dshared-glapi=true \
+    -Dgallium-opencl=disabled \
+    -Dglx-read-only-text=true \
+    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
+"
 
 PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
@@ -53,12 +52,12 @@ PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
 PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
 # "gbm" requires "dri", "opengl"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
+PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 # "x11" requires "opengl"
-PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
-PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[xvmc] = "-gallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 DRIDRIVERS_class-native = "swrast"
@@ -66,23 +65,23 @@ DRIDRIVERS_class-nativesdk = "swrast"
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
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
@@ -103,27 +102,25 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
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
@@ -157,7 +154,6 @@ do_install_append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-    rmdir --ignore-fail-on-non-empty ${D}${libdir}/pkgconfig
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
diff --git a/meta/recipes-graphics/mesa/mesa_18.3.3.bb b/meta/recipes-graphics/mesa/mesa_18.3.3.bb
index fac175aaed..f58aa2a55f 100644
--- a/meta/recipes-graphics/mesa/mesa_18.3.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.3.3.bb
@@ -1,11 +1,8 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-Simplify-wayland-scanner-lookup.patch \
-           file://0002-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
-           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
-           file://0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch \
+           file://0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch \
+           file://0002-meson.build-check-for-all-linux-host_os-combinations.patch \
 "
 
 SRC_URI[md5sum] = "e9d1a24dbd5ca20efa75b9a29eb4566f"
-- 
2.20.1


