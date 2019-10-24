Return-Path: <prvs=1938be1ee=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 8697F7F9D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571952662; x=1603488662;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=jdFVmfESvvpiscLpjvmqvuB8c7SEiYf1gz3EFd/Q0II=;
	b=Vd7Jo3HP2GrFlciNMt1+IvbfgMSwo6D8r0eYjkaXh4cnct9xrP5amz29
	aY7R4izeMz2YsAtp7KaPPw2ok/63s0ocFfEiesKF2TycvrW1s9gH22L48
	SexpisL8Ny1YDGo6Utw3Sos0gd1t9mtjCfc4+yID1HOF5ZOyUh4sD2RgG
	GeEygL2wDf9U3ZIKIb2f8bZbf77Gt0cnEWOTupYVZUtHqAMpjN40eB8EW
	edZHkKzOBctbMruU/eWGNDYu8qB/hTlXAl5e0z7dGKr2l24FzNLOBBUGQ
	ERiEhvd/XKNIqb7t8ETywjalRiV3bmaZ+UIGtXmhvsC/Y4NYi4CPlgGuK A==;
IronPort-SDR: uUPd6nhqD6At2OBqlh+8+P6Ftc1YuuSRymXlRe17a/fzZUGeOY3FlV4Y9lOpuG3mP1PuDMmhF6
	YO/Rjh4eCOSYBNJ5SPAjw5RwNhCwMTUNcSpbT3cFRsA5tGLdbEvQNQONizAaZl7X/W/C6vy/e0
	jxQHYbCYxu4Xq39ut5s6kENMHwNn4brGBKILc7jogxVxJo3RroqaoPQr2+UMCPSKyFsPD5aUnc
	GPM4ER9e//E4VyxrAYBZi4qoBpg6TcENfFWd9KZO2ouRhmB0zJddYHkWG7norK1SGYApbqguCS
	BkA=
X-IronPort-AV: E=Sophos;i="5.68,226,1569254400"; d="scan'208";a="125705398"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2019 05:31:00 +0800
IronPort-SDR: HXYtU4wKN1ik5Un/+cThBy4ga3qFgLABI4wmxJ1kWmKOcd4gt51fUU0MIg69hOeWJ+zpKnFlbl
	g32YtFyr71A85E1f2edRo6JLu7Q6FrHN+9y3czp9pw9rTS3+J/C/SYobh/rGRYxSOUd+a2oMlB
	jzbxZzG7BxvjGqCOMcMY/6wu+9/7wTmajnUplicTgk2Vi+CXxYICFoaTJ2UX0H7tCQhnCgJXsP
	Y9dnXQ5iFnpwWU7hv5/ZVwwqj/auRC0Iu/Q8YzWiykoN3Ku2NWhBQO+xB1DIM99S+4OLtLmb4A
	3LsRxDYOAQ66lE2d2vIt+o7f
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	24 Oct 2019 14:26:28 -0700
IronPort-SDR: zLq6gKBz/VQBrUUt5IZtbrzlizpJjAHk8ko659haHygfMXIdW9hOfYsDM6WK7TdsX34oBeUxah
	xMoVuiLZeTZZz8fHO0AL5T2eNNIWMPqerLWNa8D+J8Yc/3hYCoNMpQIW3fXKaTMjJKSMsITvMc
	6Rt6H2U/QJ6GN6jVBM5UaZLowcxOnSL5wmNCxtU65daPwZh8a0UIqGEvbxv16gjU8YBHZOXLnF
	4OzmZouL6oiBuYuQGjvA4/qIVWxD9OwcBaH6NYKxugXGWQloovUi+LHyid4wNDrJLqIkGggCii
	4OU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 Oct 2019 14:31:00 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 14:26:03 -0700
Message-Id: <20191024212603.30505-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024212603.30505-1-alistair.francis@wdc.com>
References: <20191024212603.30505-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 2/2] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Thu, 24 Oct 2019 21:31:01 -0000
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

Upgrade mesa and mesa-gl to 19.2.1.

The license hash change was a trivial new line removal.

The glx-tls option was removed as it isn't included in the meson.build
file. It has been replaced with 'use-elf-tls' instead.

The -Dasm=false was removed as it also is no longer included.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
v4:
 - Add a patch (first patch in the series) to fix libsdl2 build
v3:
 - Fix missing Upstream-Status
v2:
 - Add back "make TLS ELF optional" patch

 ...02-meson.build-make-TLS-ELF-optional.patch | 48 +++++++++++++++++
 ...on.build-make-TLS-GLX-optional-again.patch | 52 -------------------
 .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 15 +++---
 .../mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb}   |  6 +--
 5 files changed, 57 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb} (77%)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
new file mode 100644
index 0000000000..c3b5e14cd6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -0,0 +1,48 @@
+From edd03b8ea66ccf81b0c1d27868756d06e2d177ab Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 23 Oct 2019 09:46:28 -0700
+Subject: [PATCH] meson.build: make TLS ELF optional
+
+USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
+TLS GLX optional again" patch updated to the latest mesa.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 7992734..06653fe 100644
+--- a/meson.build
++++ b/meson.build
+@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
+ endif
+ 
+ # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
+-if not with_platform_android or get_option('platform-sdk-version') >= 29
++if (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
+   pre_args += '-DUSE_ELF_TLS'
+ endif
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index 188e132..ddd47b7 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -339,6 +339,12 @@ option(
+   value : true,
+   description : 'Enable direct rendering in GLX and EGL for DRI',
+ )
++option(
++  'elf-tls',
++  type : 'boolean',
++  value : true,
++  description : 'Enable TLS support in ELF',
++)
+ option(
+   'I-love-half-baked-turnips',
+   type : 'boolean',
+-- 
+2.23.0
+
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
deleted file mode 100644
index 641bacf1d9..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 12 Jun 2019 14:15:57 -0300
-Subject: [PATCH] meson.build: make TLS GLX optional again
-Organization: O.S. Systems Software LTDA.
-
-This was optional with autotools, and needs to be disabled
-when using musl C library, for instance.
-
-Upstream-Status: Pending
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- meson.build       | 4 +++-
- meson_options.txt | 7 +++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b33b430aed4..0e50bb26c0a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
-   endif
- endif
- 
--pre_args += '-DGLX_USE_TLS'
-+if get_option('glx-tls')
-+  pre_args += '-DGLX_USE_TLS'
-+endif
- if with_glx != 'disabled'
-   if not (with_platform_x11 and with_any_opengl)
-     error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
-diff --git a/meson_options.txt b/meson_options.txt
-index 1f72faabee8..fcd49efea27 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -339,6 +339,13 @@ option(
-   value : true,
-   description : 'Enable direct rendering in GLX and EGL for DRI',
- )
-+option(
-+  'glx-tls',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Enable TLS support in GLX',
-+)
-+
- option(
-   'I-love-half-baked-turnips',
-   type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e5808ee27..cccc64f0b6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
 
 PE = "2"
 
@@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-                   glx-tls \
+                   elf-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls"
 
-PACKAGECONFIG_remove_libc-musl = "glx-tls"
+PACKAGECONFIG_remove_libc-musl = "elf-tls"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
@@ -70,7 +70,7 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
+PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
 PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
@@ -140,9 +140,6 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
 
-# mesa tries to run cross-built gen_matypes on build machine to get struct size information
-EXTRA_OEMESON_append = " -Dasm=false"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_19.2.1.bb
index 19221e9e25..7543e4ffb1 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
@@ -2,12 +2,12 @@ require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
-SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
+SRC_URI[md5sum] = "8f9c05cfbf7b357c60a5345bb87a92c7"
+SRC_URI[sha256sum] = "4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.23.0


