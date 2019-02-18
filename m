Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 700717C87D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:32:45 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id y195so9908285qka.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=mcKCb0+cjU8H8M0dOvlZgyhyZpvp3mSWUZ26fnNHqJs=;
	b=dTbPNXoNooqygze1oR6IiIcCdJ1u8473eSf4qsQR9TbtFkqFG/ctNZA1BqpdpCWNew
	QOm0Z8f3tzznIG7hagpTLf6OBbxROztzArC86NfvHiEtOJa2GFmaHT7ouCinEPqbiDEt
	5jAJBSlYWwqE1mHJHd2LFTt1t+tNQ1lnmmLbBP0Sai+vC5WI+TIxaCuPVO30/kc+VMzR
	TxJbQ4eU5zfBT50oEeiP8pVDmoudG1AwP/S61vo8WLSAo8cLxN8+xANdPYjo2v8k8SLV
	kjnqebOclk/CvHmRYsMeG75tKOvLEMjidnyvIRo6eNP/vceXTSkClr/j2V0FElLfbsF9
	McTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=mcKCb0+cjU8H8M0dOvlZgyhyZpvp3mSWUZ26fnNHqJs=;
	b=mxtO5AlzPTDckN2/0sYNQHprDGRP+nwyio/4XyZP8ClMFoMHcPPjRLkaSgK/WYHYL2
	z+GyUFaIbZuHxGvUkkL/l7z2wrO0QazIEKUvBs91PGxM/KvSbxzUHDg604z7BJ3cy4DX
	p/MuaH1HXo/LIqQqLl4HJKLsJWQb88plP0FJ9NcsoX+EV/0ozZUKddjiClI4Xuibt+tJ
	qwce8YgvHYinFhdbMzIXVithqEX4IL3LpbNlMiHkh9Zn8rd1/Qh+WWNwmdTppUDLiKUT
	fCepJz4HyvTyN2c5QEnQkImtkaDvT60ruU9R52/xuJ12yj2vvtoU5lIo4FbPDEccEzgL
	sxgg==
X-Gm-Message-State: AHQUAuaolDp9men1n1Na6qoe7/3/BEktGCCNkxUKHXEew91X7t1e2nUL
	K7OJI6BrL3x7phUoC7ucbiqzB65kowPcbQ==
X-Google-Smtp-Source: AHgI3IanOe2uUJrvJtvwpb6bQXa9dOT1CmUrZ9Liwg6m5wAzQk7Ff82CsiNIVU3ufdmM23KT3ApAMg==
X-Received: by 2002:a37:cfdd:: with SMTP id v90mr13280256qkl.193.1550496765872;
	Mon, 18 Feb 2019 05:32:45 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id 81sm7080174qkg.75.2019.02.18.05.32.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:32:45 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 10:32:31 -0300
Message-Id: <20190218133231.27989-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [RFC][PATCH] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 18 Feb 2019 13:32:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  - Remove all non related meson patches

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...sing-include-stddef.h-in-egldevice.h.patch | 49 +++++++++++++++++
 ...k-for-all-linux-host_os-combinations.patch | 50 +++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 54 +++++++++----------
 meta/recipes-graphics/mesa/mesa_18.3.3.bb     |  7 +--
 4 files changed, 126 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-check-for-all-linux-host_os-combinations.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch
new file mode 100644
index 0000000000..08d128e919
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stddef.h-in-egldevice.h.patch
@@ -0,0 +1,49 @@
+From d2d5acdcb10465c024c8b0931d49e49660210d2c Mon Sep 17 00:00:00 2001
+From: Gurchetan Singh <gurchetansingh@chromium.org>
+Date: Wed, 28 Nov 2018 08:39:34 -0800
+Subject: [PATCH 1/2] egl: add missing #include <stddef.h> in egldevice.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Organization: O.S. Systems Software LTDA.
+
+Otherwise, I get this error:
+
+main/egldevice.h:54:13: error: ‘NULL’ undeclared (first use in this function)
+       dev = NULL;
+             ^~~~
+with this config:
+
+./autogen.sh --enable-gles1 --enable-gles2 --with-platforms='surfaceless' --disable-glx
+             --with-dri-drivers="i965" --with-gallium-drivers="" --enable-gbm
+
+v3: Use stddef.h (Matt)
+v4: Modify commit message (Eric)
+
+Reviewed-by: Matt Turner <mattst88@gmail.com>
+Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/commit/?id=eb44c36cf1729e7e200b77cf8ea755dff72d1639]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/egl/main/egldevice.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
+index ddcdcd17f5a..83a47d5eacc 100644
+--- a/src/egl/main/egldevice.h
++++ b/src/egl/main/egldevice.h
+@@ -31,9 +31,9 @@
+ 
+ 
+ #include <stdbool.h>
++#include <stddef.h>
+ #include "egltypedefs.h"
+ 
+-
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-- 
+2.20.1
+
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


