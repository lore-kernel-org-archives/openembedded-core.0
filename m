Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id DF7F97CB90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 21:21:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c189so6415573qke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 14:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=TMmHDW7Kn02GwSwI8MpPV44xk5pyZ/iSel2fckuManc=;
	b=kfaWvjQ+TIpUm9CwokdYWWMFRdvvuozLNaauTh55O6Ew/IX2ZxBBG4heVPF+cnwiL/
	hngBbN5i5xBa9r+bbTO2J2TKQsXAOTlBltnb+cv+QORU5izzMpp3mxdik+b7PsSJstww
	QU1XutTSah9HTF8+8DWHmR2do0lAMLu9cfKVCMprXvsxZUGGztXLzCpCh0XHDk7JAiR7
	xgn5IY+JRB50zVmhpo5+yYem7U7wPtEnCG0yQiWX4YZVjMvVFtOeW+KRTF30NziwsoKt
	0Pj/+dl5xU+YYEzoDbOQ4xaW0CXFMibcAAqb0A/k0pokE4yT/UOoJk+K6hvPWU5PThX4
	1img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=TMmHDW7Kn02GwSwI8MpPV44xk5pyZ/iSel2fckuManc=;
	b=SKD/KuCdaUlsycBsUuszWwa/SoU+hOCqY8LHHmm/mmw+y0F9FeUceo53NxTnL+SegH
	pu2facgBcMMV8L2hihZAGszU7I/hsq9wiTtifFIC1e4hym23DMoj9sX+2WqZlHSbRd6S
	Y3qoHvllJiQqM8LpoJFPQtrkf5NhW6Icb4y3ipAIZzzR52JoKuUDWl9ASDhPyC8VawnF
	ipriVtDoncuAiDrUp6/RoWFaEDlsv6530yJQpmdEl6QJbcoas0lr66BOQv23dNAm2Knt
	OtDEUSYumS5SuG+rA3ZUT1OkUtkDFrz7f88NnUneV/cz2OizJCE2Af+CL/yavA5834Ax
	xI0A==
X-Gm-Message-State: APjAAAWpROqFQz8yCgjC8uSnvZZsIf+7uHXdwaSF7vN/AYDnXg+/s0gT
	3VQ9SL3ZFL9sTKXMtZcBlZ0cUwfDVhDcKA==
X-Google-Smtp-Source: APXvYqyVg+cYEwnNJ0T9JcI/lk/gexi9OoQK+xAX8v1jimezAcdBae2nMVosdOPP4lMU6H65bZHDmw==
X-Received: by 2002:a05:620a:15f5:: with SMTP id
	p21mr4628206qkm.168.1552684919028; 
	Fri, 15 Mar 2019 14:21:59 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	h18sm1814243qkj.50.2019.03.15.14.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 14:21:58 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:21:39 -0300
Message-Id: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Eric Engestrom <eric.engestrom@intel.com>, Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/2] mesa: Update 18.3.4 -> 19.0.0
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
X-List-Received-Date: Fri, 15 Mar 2019 21:21:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  - Patch 0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
    was applied on commit e68777c87ceed02ab199b32f941778c3cf97c794.
  - Refresh all patches
  - mesa 19.0.0 deprecated the use of autotools and we need to add
    --enable-autotools flag. For details see mesa commit:
    e68777c87ceed02ab199b32f941778c3cf97c794

  The complete change log can be found here:
    https://www.mesa3d.org/relnotes/19.0.0.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...0001-Simplify-wayland-scanner-lookup.patch | 20 ++++----
 ...-winsys-svga-drm-Include-sys-types.h.patch |  7 +--
 ...M-version-when-using-LLVM-Git-releas.patch | 13 ++---
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 11 +++--
 ...sing-include-stddef.h-in-egldevice.h.patch | 49 -------------------
 .../{mesa-gl_18.3.4.bb => mesa-gl_19.0.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  4 +-
 .../mesa/{mesa_18.3.4.bb => mesa_19.0.0.bb}   |  5 +-
 8 files changed, 34 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_18.3.4.bb => mesa-gl_19.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.3.4.bb => mesa_19.0.0.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
index 1c2ded0e60..d065e2285c 100644
--- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
@@ -1,7 +1,7 @@
-From 81bcaa1aeecf1e66b4d94181e9a827d68e970b03 Mon Sep 17 00:00:00 2001
+From e53837ad7b01364f34a533b95f4817c1795789de Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Wed, 20 Feb 2019 16:17:00 -0300
-Subject: [PATCH 1/5] Simplify wayland-scanner lookup
+Subject: [PATCH 1/4] Simplify wayland-scanner lookup
 Organization: O.S. Systems Software LTDA.
 
 Don't use pkg-config to lookup the path of a binary that's in the path.
@@ -12,31 +12,33 @@ PKG_CONFIG_SYSROOT_DIR.
 Upstream-Status: Pending
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  configure.ac | 7 +------
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cd9ff259fad..402b4a91946 100644
+index 1ef68fe68e6..1816a4cd475 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1841,16 +1841,11 @@ for plat in $platforms; do
+@@ -1854,16 +1854,11 @@ for plat in $platforms; do
          fi
          WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-
+ 
 -        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
 -                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
 -                          WAYLAND_SCANNER='')
          PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
                            AC_SUBST(SCANNER_ARG, 'private-code'),
                            AC_SUBST(SCANNER_ARG, 'code'))
-
+ 
 -        if test "x$WAYLAND_SCANNER" = x; then
 -            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
 -        fi
 +        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
-
+ 
          if test "x$WAYLAND_SCANNER" = "x:"; then
                  AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
---
-2.20.1
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
index 12dca61e19..aaeb0f11ba 100644
--- a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
@@ -1,7 +1,7 @@
-From 34c3d07b67e6c08f555473a86ff158951abb6000 Mon Sep 17 00:00:00 2001
+From f212b6bed4bf265aec069c21cdc4b7c2d9cb32df Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH 2/5] winsys/svga/drm: Include sys/types.h
+Subject: [PATCH 2/4] winsys/svga/drm: Include sys/types.h
 Organization: O.S. Systems Software LTDA.
 
 vmw_screen.h uses dev_t which is defines in sys/types.h
@@ -13,6 +13,7 @@ system headers
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Backport [7dfdfbf8c37e52e7b9b09f7d1d434edad3ebc864]
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
  1 file changed, 1 insertion(+)
@@ -30,5 +31,5 @@ index a87c087d9c5..cb34fec48e7 100644
  #define VMW_GMR_POOL_SIZE (16*1024*1024)
  #define VMW_QUERY_POOL_SIZE (8192)
 -- 
-2.20.1
+2.21.0
 
diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
index 59b118d9f4..96edc2172b 100644
--- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
@@ -1,7 +1,7 @@
-From c5b5bf6c31be1823be1d0317eabe16558a4f0762 Mon Sep 17 00:00:00 2001
+From ce7b9ff6517fda089f296b2af2c1c49604872514 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 3/5] Properly get LLVM version when using LLVM Git releases
+Subject: [PATCH 3/4] Properly get LLVM version when using LLVM Git releases
 Organization: O.S. Systems Software LTDA.
 
 $ llvm-config-host --version
@@ -13,15 +13,16 @@ doing
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cbc455e130f..0065376f4b7 100644
+index 1816a4cd475..13fed9daf59 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1111,7 +1111,7 @@ strip_unwanted_llvm_flags() {
+@@ -1124,7 +1124,7 @@ strip_unwanted_llvm_flags() {
  
  llvm_set_environment_variables() {
      if test "x$LLVM_CONFIG" != xno; then
@@ -30,7 +31,7 @@ index cbc455e130f..0065376f4b7 100644
          LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
          LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
          LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2860,7 +2860,7 @@ detect_old_buggy_llvm() {
+@@ -2870,7 +2870,7 @@ detect_old_buggy_llvm() {
      dnl ourselves.
      dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
      dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
@@ -40,5 +41,5 @@ index cbc455e130f..0065376f4b7 100644
  
      if test "x$llvm_have_one_so" = xyes; then
 -- 
-2.20.1
+2.21.0
 
diff --git a/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
index 8c91790249..45bcd466a3 100644
--- a/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
+++ b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -1,7 +1,7 @@
-From f48b8f073f921ce5be859130313e9d392ef3e78e Mon Sep 17 00:00:00 2001
+From 5489e1d22e18740a1924628c5c97096d48dcfbf8 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Fri, 15 Feb 2019 10:57:06 -0200
-Subject: [PATCH 4/5] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+Subject: [PATCH 4/4] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
 Organization: O.S. Systems Software LTDA.
 
 This allows to override the wayland-protocols pkgdatadir with the
@@ -21,10 +21,10 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0065376f4b7..b21fb2210c6 100644
+index 13fed9daf59..6cff8afb7cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1839,7 +1839,7 @@ for plat in $platforms; do
+@@ -1852,7 +1852,7 @@ for plat in $platforms; do
          if test "x$enable_egl" = xyes; then
            PKG_CHECK_MODULES([WAYLAND_EGL], [wayland-egl-backend >= $WAYLAND_EGL_BACKEND_REQUIRED])
          fi
@@ -33,3 +33,6 @@ index 0065376f4b7..b21fb2210c6 100644
  
          PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
                            AC_SUBST(SCANNER_ARG, 'private-code'),
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
deleted file mode 100644
index 1782576db2..0000000000
--- a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f452e30ab664fe608acc107cc03d2efa8731d938 Mon Sep 17 00:00:00 2001
-From: Gurchetan Singh <gurchetansingh@chromium.org>
-Date: Wed, 28 Nov 2018 08:39:34 -0800
-Subject: [PATCH 5/5] egl: add missing #include <stddef.h> in egldevice.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Organization: O.S. Systems Software LTDA.
-
-Otherwise, I get this error:
-
-main/egldevice.h:54:13: error: ‘NULL’ undeclared (first use in this function)
-       dev = NULL;
-             ^~~~
-with this config:
-
-./autogen.sh --enable-gles1 --enable-gles2 --with-platforms='surfaceless' --disable-glx
-             --with-dri-drivers="i965" --with-gallium-drivers="" --enable-gbm
-
-v3: Use stddef.h (Matt)
-v4: Modify commit message (Eric)
-
-Reviewed-by: Matt Turner <mattst88@gmail.com>
-Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/commit/?id=eb44c36cf1729e7e200b77cf8ea755dff72d1639]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/egl/main/egldevice.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
-index ddcdcd17f5a..83a47d5eacc 100644
---- a/src/egl/main/egldevice.h
-+++ b/src/egl/main/egldevice.h
-@@ -31,9 +31,9 @@
- 
- 
- #include <stdbool.h>
-+#include <stddef.h>
- #include "egltypedefs.h"
- 
--
- #ifdef __cplusplus
- extern "C" {
- #endif
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 59e8a204c7..54818d7e0d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -42,7 +42,9 @@ EXTRA_OECONF = "--enable-shared-glapi \
                 --enable-glx-read-only-text \
                 PYTHON2=python2 \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
-                --with-platforms='${PLATFORMS}'"
+                --with-platforms='${PLATFORMS}' \
+                --enable-autotools \
+"
 
 PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
diff --git a/meta/recipes-graphics/mesa/mesa_18.3.4.bb b/meta/recipes-graphics/mesa/mesa_19.0.0.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_18.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.0.bb
index 27f4f0241f..024acdad0b 100644
--- a/meta/recipes-graphics/mesa/mesa_18.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.0.bb
@@ -5,11 +5,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-winsys-svga-drm-Include-sys-types.h.patch \
            file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
-           file://0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch \
 "
 
-SRC_URI[md5sum] = "6f2a5e01dd5cb91d05a9534f5a80c35d"
-SRC_URI[sha256sum] = "32314da4365d37f80d84f599bd9625b00161c273c39600ba63b45002d500bb07"
+SRC_URI[md5sum] = "d0d76cd8b00bc1308e37985d4a45d3c5"
+SRC_URI[sha256sum] = "5a549dfb40ec31e5c36c47aadac04554cb2e2a8d144a046a378fc16da57e38f8"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


