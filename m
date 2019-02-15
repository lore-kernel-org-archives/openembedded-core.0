Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 539AD7C709
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:10:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f14so10339377wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WUD+86dcmAs/tcAh9inO4jYkezUoZC4mFOYX1IWXFsM=;
	b=ozR7Xi11Osh9tqJWhelWIra/gR0j7FoSJSB3AWPikgPbTbOvQCYL26clCJwJiQZMnr
	7EOWhT7ITpverQhok8E0P3yLOrJ901QlL4Jx4zchkFmecyxqg/yFOHfrSPciFYX+OlFE
	OodMCzE85U/JlyLy/LxfYHVLkhSfZ78fvY+zqxIQKD1MQl3xQ6LQ4ZexqDzd+zZzf2Q8
	ppC+w+MRe+INJhY3NhMbvmrPZ9Di1c+q9ddllTevB/zgzlnOcBhL5v5xwCzSYOA/usTV
	/8LH+Q2r/kezqiymTjZbwZhyGs/8DKD6MNonSNrhs/p3E1lkLs0k6PGVeZnKIqi8oZ7T
	LrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WUD+86dcmAs/tcAh9inO4jYkezUoZC4mFOYX1IWXFsM=;
	b=LTG47nVUplbqnD+YRuIdtyVzIhFDTYfvNmTL9kgTAX3vMWpzoFVxSQkLPfEz8fjhr1
	K7E8Nin8+lOuflr9scn30FrRUaB5Scn0jsLzfcS0DtTjvnhkVIVjbjReau0tjtFBlBF5
	zXz2uQFD4RCxwJjULzolX7Vg/Lnx6KDMDdWc+dgrsdSvxOderNpsT0O2aK6ndgQKJV7n
	GLTmU4H+Vkx5NuU7EtGpMGon5dMMurGssiA6oiSGY60j3gJmSaUan25uYUb+bQvimhlF
	YoFx6tlgIZjkOvYO1L8N2JsY97xpWrRJfvgVVFrlJ0ZGP5GXKuLoH22B/L6/Cyavljdm
	ERDA==
X-Gm-Message-State: AHQUAuamEaJ0VL5faEUz/8Ke5RI68jgbBuEiTNpmPgUshMgsLRtHMizS
	hkm+QUDJ6vsde6BDCid2USMajU3f
X-Google-Smtp-Source: AHgI3IZSQI5Gwub+1v00mNtcmsPYIIkm5QcQtpv9yRuRXMmtcKHRv71eEasA1p3qCcZS/UEjnaE/Vg==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr6851024wru.119.1550236254416; 
	Fri, 15 Feb 2019 05:10:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	n184sm15399531wmf.5.2019.02.15.05.10.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 05:10:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 14:10:47 +0100
Message-Id: <20190215131047.64007-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:10:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

* For changes, see:
https://www.mesa3d.org/relnotes/18.3.3.html

* Convert from using autotools to meson and get rid of unnecessary
patches.

* Include a patch to fix detection of host os combinations that we build
for.

Alex:
* fixed mesa-native failures by correctly setting disabled variants of
PACKAGECONFIGs

* Added a backported patch to avoid a build failure

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-Simplify-wayland-scanner-lookup.patch | 39 -----------
 ...k-for-all-linux-host_os-combinations.patch | 49 +++++++++++++
 ...M-version-when-using-LLVM-Git-releas.patch | 44 ------------
 ...-Use-Python-3-to-execute-the-scripts.patch | 32 ---------
 ...-dri-i965-Add-missing-time.h-include.patch | 36 ----------
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 37 ----------
 .../mesa/files/fix-NULL-error.patch           | 50 +++++++++++++
 .../{mesa-gl_18.1.9.bb => mesa-gl_18.3.3.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 70 +++++++++----------
 .../mesa/{mesa_18.1.9.bb => mesa_18.3.3.bb}   | 11 ++-
 10 files changed, 136 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
 create mode 100644 meta/recipes-graphics/mesa/files/fix-NULL-error.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_18.1.9.bb => mesa-gl_18.3.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.1.9.bb => mesa_18.3.3.bb} (54%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
deleted file mode 100644
index a50d2a2ba28..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7e8e0f8a8ac2425e19a2f340c9e3da9345f25940 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 15 Nov 2016 15:20:49 +0200
-Subject: [PATCH 1/6] Simplify wayland-scanner lookup
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
- configure.ac | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 14f1af2b2f..916d0bd207 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1825,12 +1825,7 @@ for plat in $platforms; do
-         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
-         WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
- 
--        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
--                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
--                          WAYLAND_SCANNER='')
--        if test "x$WAYLAND_SCANNER" = x; then
--            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
--        fi
-+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
- 
-         if test "x$WAYLAND_SCANNER" = "x:"; then
-                 AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
new file mode 100644
index 00000000000..1147eacdd93
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -0,0 +1,49 @@
+From 8140dc078bcdbc5fbaf1c46c3fd3efbe587a0f29 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Mon, 11 Feb 2019 20:55:27 +0800
+Subject: [PATCH] meson.build: check for all linux host_os combinations
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
+index b934d0bfc76..7cbda909735 100644
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
+2.17.1
+
diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
deleted file mode 100644
index 5e735ca1052..00000000000
--- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 8b42fb47138f91d9378439ab716bac7701e4e326 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 3/6] Properly get LLVM version when using LLVM Git releases
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
-index 916d0bd207..dd172f1ebe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1090,7 +1090,7 @@ strip_unwanted_llvm_flags() {
- 
- llvm_set_environment_variables() {
-     if test "x$LLVM_CONFIG" != xno; then
--        LLVM_VERSION=`$LLVM_CONFIG --version | egrep -o '^[[0-9.]]+'`
-+        LLVM_VERSION=`$LLVM_CONFIG --version | cut -c1-5`
-         LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
-         LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
-         LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2808,7 +2808,7 @@ detect_old_buggy_llvm() {
-     dnl ourselves.
-     dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
-     dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
--    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
-+    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version | cut -c1-5`
-     AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm_have_one_so=yes])
- 
-     if test "x$llvm_have_one_so" = xyes; then
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
deleted file mode 100644
index 8953c4a18ff..00000000000
--- a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ebe6077a1d74e56b28249f71e8760295fa846ed2 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Fri, 29 Dec 2017 10:27:59 -0200
-Subject: [PATCH 4/6] Use Python 3 to execute the scripts
-Organization: O.S. Systems Software LTDA.
-
-The MESA build system uses Python 2 but as OE-Core has moved away from
-it, we change it to use Python 3 instead.
-
-Upstream-Status: Inappropriate [ configuration ]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd172f1ebe..40cac36ac2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -122,7 +122,7 @@ AM_PROG_CC_C_O
- AC_PROG_NM
- AM_PROG_AS
- AX_CHECK_GNU_MAKE
--AC_CHECK_PROGS([PYTHON2], [python2.7 python2 python])
-+AC_CHECK_PROGS([PYTHON2], [python3.5 python3 python])
- AC_PROG_SED
- AC_PROG_MKDIR_P
- 
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
deleted file mode 100644
index d40e7b58558..00000000000
--- a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9e0368af471af3a36e0eb526453f892598120065 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 6 Jun 2018 09:50:35 -0300
-Subject: [PATCH 5/6] dri: i965: Add missing time.h include
-Organization: O.S. Systems Software LTDA.
-
-This fixes a build error when using musl:
-
-,----
-| In file included from .../src/mesa/drivers/dri/i965/intel_upload.c:33:0:
-| .../src/mesa/drivers/dri/i965/brw_bufmgr.h:132:4: error: unknown type name 'time_t'
-|     time_t free_time;
-|     ^~~~~~
-`----
-
-Upstream-Status: Backport [3c288da5eec81ee58b85927df18d9194ead8f5c2]
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- src/mesa/drivers/dri/i965/brw_bufmgr.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/mesa/drivers/dri/i965/brw_bufmgr.h b/src/mesa/drivers/dri/i965/brw_bufmgr.h
-index 68f5e0c2c8..5b60a23763 100644
---- a/src/mesa/drivers/dri/i965/brw_bufmgr.h
-+++ b/src/mesa/drivers/dri/i965/brw_bufmgr.h
-@@ -37,6 +37,7 @@
- #include <stdbool.h>
- #include <stdint.h>
- #include <stdio.h>
-+#include <time.h>
- #include "util/u_atomic.h"
- #include "util/list.h"
- 
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
deleted file mode 100644
index 0212922c5d5..00000000000
--- a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 754ccf89a732fc3da6e9bc62ebd6b28686ff3d26 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 29 Aug 2018 22:10:30 -0300
-Subject: [PATCH 6/6] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
-Organization: O.S. Systems Software LTDA.
-
-This allows to override the wayland-protocols pkgdatadir with the
-WAYLAND_PROTOCOLS_DATADIR from environment.
-
-pkgconfig would return an absolute path in
-/usr/share/wayland-protocols
-for the pkgdatadir value, which is not suitable for cross-compiling.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 40cac36ac2..728bbdcbc4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1823,7 +1823,7 @@ for plat in $platforms; do
-         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
-         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
-         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
--        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-+        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
- 
-         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
- 
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/files/fix-NULL-error.patch b/meta/recipes-graphics/mesa/files/fix-NULL-error.patch
new file mode 100644
index 00000000000..f31b73c3353
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/fix-NULL-error.patch
@@ -0,0 +1,50 @@
+From eb44c36cf1729e7e200b77cf8ea755dff72d1639 Mon Sep 17 00:00:00 2001
+From: Gurchetan Singh <gurchetansingh@chromium.org>
+Date: Wed, 28 Nov 2018 08:39:34 -0800
+Subject: egl: add missing #include <stddef.h> in egldevice.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
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
+(limited to 'src/egl/main/egldevice.h')
+
+diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
+index ddcdcd1..83a47d5 100644
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
+cgit v1.1
+
diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.3.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 66ed649efe5..43ad67a4f4a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
@@ -24,7 +24,8 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit autotools pkgconfig python3native gettext distro_features_check
+inherit meson pkgconfig python3native gettext distro_features_check
+
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -34,56 +35,53 @@ PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
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
+EXTRA_OEMESON = "-Dshared-glapi=true \
+                -Dgallium-opencl=disabled \
+                -Dglx-read-only-text=true \
+                -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
+		"
 
 PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri-native egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
+PACKAGECONFIG_class-native ?= "gbm opengl dri egl"
+PACKAGECONFIG_class-nativesdk ?= "gbm opengl dri egl"
 
 # "gbm" requires "dri", "opengl"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
+PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 
-X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxrandr"
 # "x11" requires "opengl"
-PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
-PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[xvmc] = "-gallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_class-native = "swrast"
+DRIDRIVERS_class-nativesdk = "swrast"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
-PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-# On the native builds we use host's dri drivers
-PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
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
@@ -104,27 +102,25 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS_append = ",virgl"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium]      = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers='' "
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
@@ -219,7 +215,7 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
-FILES_${PN} += "${sysconfdir}/drirc"
+FILES_${PN} += "${sysconfdir}/drirc ${datadir}/drirc.d"
 FILES_mesa-megadriver = "${libdir}/dri/*"
 FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-graphics/mesa/mesa_18.3.3.bb
similarity index 54%
rename from meta/recipes-graphics/mesa/mesa_18.1.9.bb
rename to meta/recipes-graphics/mesa/mesa_18.3.3.bb
index 86d6a6bf3a7..4e26d08e678 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.3.3.bb
@@ -1,16 +1,13 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-Simplify-wayland-scanner-lookup.patch \
            file://0002-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
-           file://0004-Use-Python-3-to-execute-the-scripts.patch \
-           file://0005-dri-i965-Add-missing-time.h-include.patch \
-           file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://fix-NULL-error.patch \
 "
 
-SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
-SRC_URI[sha256sum] = "55f5778d58a710a63d6635f000535768faf7db9e8144dc0f4fd1989f936c1a83"
+SRC_URI[md5sum] = "e9d1a24dbd5ca20efa75b9a29eb4566f"
+SRC_URI[sha256sum] = "2ab6886a6966c532ccbcc3b240925e681464b658244f0cbed752615af3936299"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.17.1


