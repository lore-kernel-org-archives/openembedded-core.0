Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D24157C85D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 16:22:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w8so179033wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0rYFljQ4kO6E6eMBoNx/RIx8VPBU2S+xqI/7WVt+5MY=;
	b=fFZQ75ee845RGPdHDpLQGaZbfIVrjJSlaG8IQUMvN8y41XhLqnsbfjgP7BnS3snvfS
	WLMIa1lGje8tNlpXqxiS6NXPswAOcCoJZu4caJlk6ThSRR0jAqGeAt8ywS10TY0pHgfE
	7WDNf4Cd5Y2eD7OCP3h5iDGF+Q2JqCBCjEJ27riTBP7am9F26y8LtZRzMQikio+PQKO8
	sBf0Hm/sOqaG+pd+giY83lX1FX/Zr//nEK2PXUImAT4iTTSMqr8qhzbfbXbn9Ht/uORN
	NOdEOjyb6oqpX5oKr8FlaoEw1UECuHv35cmdZyxEPks8o2BYOEidhdJtgs2Az8sizD3/
	x+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0rYFljQ4kO6E6eMBoNx/RIx8VPBU2S+xqI/7WVt+5MY=;
	b=HZ3pJH+q4quoTwSXIhZLDnKvaQhvtz00ynhaaUizlz+THe9JgpChWgXyrW+Ct514Nq
	7pYX92LQ9ou7FaUqV4tgfl2JpkkMz6nNuAcNOdkBlP3aF4GfqQDMD9NAIbQ55t3Exros
	52DgXZOkx667PN3bMhVIQkb+UhNdBypkLoVEe1nEQ0CQo5LlrxGu6+DZY9DZDafzvzsT
	dB/fR099qq3EuZwb+yDU+Y7pEZBRHX7+XtFtq2YdfWMHk2mfuCo8cATbVsAJfuGjyumr
	gyGrmsV6g+BLAAuvFuJ41vArpcjlAK4dlSJIXcWX+iq+myCB03B6CH0S3k1KfkyBdHJ4
	kGYw==
X-Gm-Message-State: APjAAAVyLTJ7DJgcBNHyxODdGGzzhHYwoEOoAEuDlDx+H5djTWibM/Aj
	GIUsbgjqkyAwRzo0XpfyqX+Tg+I1
X-Google-Smtp-Source: APXvYqxTZtzqaK1az+QoY3Lnecnk8DKcg/jjRU5BysTZAm8hfN97fH3sp1sVMujVjnsba3rQ1nJtQA==
X-Received: by 2002:adf:dc4a:: with SMTP id m10mr25575576wrj.0.1557937370707; 
	Wed, 15 May 2019 09:22:50 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g3sm2864469wmf.9.2019.05.15.09.22.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 09:22:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 18:22:43 +0200
Message-Id: <20190515162243.70692-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Wed, 15 May 2019 16:22:51 -0000

From: Fabio Berton <fabio.berton@ossystems.com.br>

  - Remove all non related meson patches
  - Change radeon driver to r100
  - Add python3-mako-native gettext-native to DEPENDS

Based on https://patchwork.openembedded.org/patch/158748/

Alex: added a patch to restore glx-tls option, which
addresses the musl runtime issue.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-Simplify-wayland-scanner-lookup.patch | 44 -------------
 ...k-for-all-linux-host_os-combinations.patch | 51 +++++++++++++++
 ...on.build-make-TLS-GLX-optional-again.patch | 44 +++++++++++++
 ...-winsys-svga-drm-Include-sys-types.h.patch | 35 ----------
 ...M-version-when-using-LLVM-Git-releas.patch | 45 -------------
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 38 -----------
 meta/recipes-graphics/mesa/mesa.inc           | 64 +++++++++----------
 meta/recipes-graphics/mesa/mesa_19.0.3.bb     |  8 +--
 8 files changed, 129 insertions(+), 200 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
deleted file mode 100644
index d065e2285c6..00000000000
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
index 00000000000..61e24c6e9fa
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -0,0 +1,51 @@
+From 498f230c9446fc7a1b4dc77ff6b84ee1a3b53bf4 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 24 Apr 2019 17:01:24 -0300
+Subject: [PATCH] meson.build: check for all linux host_os combinations
+Organization: O.S. Systems Software LTDA.
+
+Make sure that we are also looking for our host_os combinations like
+linux-musl etc. when assuming support for DRM/KMS.
+
+Also delete a duplicate line.
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 53d02e31097..c41f6b4e402 100644
+--- a/meson.build
++++ b/meson.build
+@@ -34,6 +34,8 @@ cpp = meson.get_compiler('cpp')
+ 
+ null_dep = dependency('', required : false)
+ 
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
++
+ # Arguments for the preprocessor, put these in a separate array from the C and
+ # C++ (cpp in meson terminology) arguments since they need to be added to the
+ # default arguments for both C and C++.
+@@ -89,8 +91,6 @@ if (with_gles1 or with_gles2) and not with_opengl
+   error('building OpenGL ES without OpenGL is not supported.')
+ endif
+ 
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'linux'].contains(host_machine.system())
+-
+ _drivers = get_option('dri-drivers')
+ if _drivers.contains('auto')
+   if system_has_kms_drm
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
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch
new file mode 100644
index 00000000000..8fabafcb35f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch
@@ -0,0 +1,44 @@
+From 48318f1a5c9042a8e1bb4456c2584362b25c4a59 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 15 May 2019 17:21:51 +0200
+Subject: [PATCH] meson.build: make TLS GLX optional again
+
+This was optional with autotools, and needs to be disabled
+when using musl C library, for instance.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c41f6b4..8843f3c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -336,7 +336,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless)
+   endif
+ endif
+ 
+-pre_args += '-DGLX_USE_TLS'
++if get_option('glx-tls')
++  pre_args += '-DGLX_USE_TLS'
++endif
+ if with_glx != 'disabled'
+   if not (with_platform_x11 and with_any_opengl)
+     error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
+diff --git a/meson_options.txt b/meson_options.txt
+index ccf7065..0f1e800 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -324,3 +324,9 @@ option(
+   value : true,
+   description : 'Enable direct rendering in GLX and EGL for DRI',
+ )
++option(
++  'glx-tls',
++  type : 'boolean',
++  value : true,
++  description : 'Enable TLS support in GLX',
++)
diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
deleted file mode 100644
index aaeb0f11ba3..00000000000
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
index 96edc2172b0..00000000000
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
index 45bcd466a30..00000000000
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
index ece74974b51..c52adbbb214 100644
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
 
@@ -34,57 +34,59 @@ PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
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
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
+                   glx-tls \
 		   "
 PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
 PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
+PACKAGECONFIG_remove_libc-musl = "glx-tls"
+
 # "gbm" requires "dri", "opengl"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
+PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
-PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
-PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
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
@@ -104,28 +106,25 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
 GALLIUMDRIVERS_append = ",virgl"
 
-# keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium] = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
 MESA_LLVM_RELEASE ?= "8.0.0"
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
@@ -158,7 +157,6 @@ do_install_append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-    rmdir --ignore-fail-on-non-empty ${D}${libdir}/pkgconfig
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.3.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
index 585c3ede23b..36faa4a99d7 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -1,11 +1,9 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-Simplify-wayland-scanner-lookup.patch \
-           file://0002-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
-           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
-"
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://0001-meson.build-make-TLS-GLX-optional-again.patch \
+           "
 
 SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
 SRC_URI[sha256sum] = "f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5"
-- 
2.17.1


