Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0E67CB6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:09:46 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so1149025qkl.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=muTaU5Sg92GXgx13lASAzm0ZhOo08nuDwSwkfO0uWAo=;
	b=pXQ1sSnaGENEjVjsLPtlRUIFJ4MhtHmXVA62WDc1DoqH5tHJ0sK1am+c81usbXGt1z
	Z9D8ShdbjWoN8hYP4mtd5jY8I66Tr/RpHqKbLi/HOUk+tEn/yhKrUGTmUmQ3yr+VsjLp
	0mHDYTuHjmE8XcYkPuvrvpbaa/qu2NBmrCvDg/kaQLKH12lEgYD09q0MAYbewwueHNni
	U5qhYfd+x+gWGDAobVUPMWTKQ8HUZjBc1UhW63cSwHMIkxO58yjq2Y2lpkz8RoFHjSu6
	pZhrLwMJx5vRAgelE81VIvKzaWB83w2G+vNs9xIeVErdCxZV63Gd4O70u/U0sk1s0Bsg
	21Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=muTaU5Sg92GXgx13lASAzm0ZhOo08nuDwSwkfO0uWAo=;
	b=sH58e+FxFrvlAAIK2SdBlYkvLw3WPDqlNG/390BOWYQNAtoLUOtM76+1LMCLDEb81/
	aawK3GcigIQbmJjz27TxqOxEYkD9GJ6wzyo2taGeBfdbK9UVr8xV9K3rE9X2+BhHUjgA
	gEz1VAfUEL4kuHrBkO1njlXeNg9QczN3yHo/A6cuPR13lWirltg/HvUmslZw2ACUwwbc
	hFk1sSWyCY8eDUUuTP+qu1dNMMJftJdesrSLrYlRfgr8o3IJ8a7hb/QMcRhAzn7lVlcT
	BK+xFlQvp4FIkv5Q1i2z0g83eNjXI+36qfyXei7UP8IOj1JrmIhtAZt586K2SMHTll5J
	qfkw==
X-Gm-Message-State: AHQUAubpn3UqIbkRfs8k1zzXZMLmbwRsDhRG5LD7DjnmLXaDDciBOHWe
	/bxo2G2po/mosZOyVvTlg6ceryHy85ASEg==
X-Google-Smtp-Source: AHgI3IZm8XOnkLq6+/IPX8gIoUg7Rmwq8E11G0vid7o04/JzWOs/hyPSaN3arLsh3jHjctpKaK0J9Q==
X-Received: by 2002:a37:38d4:: with SMTP id f203mr3142559qka.66.1550844586654; 
	Fri, 22 Feb 2019 06:09:46 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id e65sm842867qtb.51.2019.02.22.06.09.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:09:45 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 11:09:29 -0300
Message-Id: <20190222140931.13247-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Fri, 22 Feb 2019 14:09:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  - Refresh all patches.

  - Remove "Use Python 3 to execute the scripts" patch
      Commit 986033a2750c1160a4cef3c8418fc7f9e2b4fb5a add support
      for both python 2 and 3.

  - Remove "dri: i965: Add missing time.h include" patch
      Commit 3c288da5eec81ee58b85927df18d9194ead8f5c2 add time.h
      header file.

  - Remove --enable-texture-float.
      Commit 66673bef941af344314fe9c91cad8cd330b245eb remove option to
      unconditionally enable floating-point textures.

  - Commit 30b10dbb7c6f6bdf3e489620f8333c727bd3a6dd moved
    ${sysconfdir}/drirc to ${datadir}/drirc.d/00-mesa-defaults.conf
    Add 00-mesa-defaults.conf to mesa-megadriver package

  - Stop removing ${sysconfdir}/drirc on do_install_append

  - Fix upgrade path from mesa to mesa-megadriver

  - Add patch to fix mesa-native build

  - Add xrandr to X11_DEPS

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...0001-Simplify-wayland-scanner-lookup.patch | 27 +++++-----
 ...-winsys-svga-drm-Include-sys-types.h.patch |  8 +--
 ...M-version-when-using-LLVM-Git-releas.patch | 12 ++---
 ...-Use-Python-3-to-execute-the-scripts.patch | 32 ------------
 ...-for-defining-WAYLAND_PROTOCOLS_DAT.patch} | 28 +++++------
 ...-dri-i965-Add-missing-time.h-include.patch | 36 --------------
 ...sing-include-stddef.h-in-egldevice.h.patch | 49 +++++++++++++++++++
 .../{mesa-gl_18.1.9.bb => mesa-gl_18.3.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 13 +++--
 .../mesa/{mesa_18.1.9.bb => mesa_18.3.4.bb}   |  9 ++--
 10 files changed, 99 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
 rename meta/recipes-graphics/mesa/files/{0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch => 0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch} (55%)
 delete mode 100644 meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_18.1.9.bb => mesa-gl_18.3.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.1.9.bb => mesa_18.3.4.bb} (69%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
index a50d2a2ba2..1c2ded0e60 100644
--- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
@@ -1,7 +1,7 @@
-From 7e8e0f8a8ac2425e19a2f340c9e3da9345f25940 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 15 Nov 2016 15:20:49 +0200
-Subject: [PATCH 1/6] Simplify wayland-scanner lookup
+From 81bcaa1aeecf1e66b4d94181e9a827d68e970b03 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 20 Feb 2019 16:17:00 -0300
+Subject: [PATCH 1/5] Simplify wayland-scanner lookup
 Organization: O.S. Systems Software LTDA.
 
 Don't use pkg-config to lookup the path of a binary that's in the path.
@@ -17,23 +17,26 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 14f1af2b2f..916d0bd207 100644
+index cd9ff259fad..402b4a91946 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1825,12 +1825,7 @@ for plat in $platforms; do
-         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
+@@ -1841,16 +1841,11 @@ for plat in $platforms; do
+         fi
          WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
- 
+
 -        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
 -                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
 -                          WAYLAND_SCANNER='')
+         PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
+                           AC_SUBST(SCANNER_ARG, 'private-code'),
+                           AC_SUBST(SCANNER_ARG, 'code'))
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
-2.18.0
-
+--
+2.20.1
diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
index ffb3bf7a63..12dca61e19 100644
--- a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
@@ -1,7 +1,7 @@
-From 7792f228991744a0396b8bf811e281dca86165d3 Mon Sep 17 00:00:00 2001
+From 34c3d07b67e6c08f555473a86ff158951abb6000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Aug 2017 18:58:20 -0700
-Subject: [PATCH 2/6] winsys/svga/drm: Include sys/types.h
+Subject: [PATCH 2/5] winsys/svga/drm: Include sys/types.h
 Organization: O.S. Systems Software LTDA.
 
 vmw_screen.h uses dev_t which is defines in sys/types.h
@@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/winsys/svga/drm/vmw_screen.h
-index f21cabb51f..4c972fdaa9 100644
+index a87c087d9c5..cb34fec48e7 100644
 --- a/src/gallium/winsys/svga/drm/vmw_screen.h
 +++ b/src/gallium/winsys/svga/drm/vmw_screen.h
 @@ -41,6 +41,7 @@
@@ -30,5 +30,5 @@ index f21cabb51f..4c972fdaa9 100644
  #define VMW_GMR_POOL_SIZE (16*1024*1024)
  #define VMW_QUERY_POOL_SIZE (8192)
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
index 5e735ca105..59b118d9f4 100644
--- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
@@ -1,7 +1,7 @@
-From 8b42fb47138f91d9378439ab716bac7701e4e326 Mon Sep 17 00:00:00 2001
+From c5b5bf6c31be1823be1d0317eabe16558a4f0762 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Tue, 5 Jun 2018 11:11:10 -0300
-Subject: [PATCH 3/6] Properly get LLVM version when using LLVM Git releases
+Subject: [PATCH 3/5] Properly get LLVM version when using LLVM Git releases
 Organization: O.S. Systems Software LTDA.
 
 $ llvm-config-host --version
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 916d0bd207..dd172f1ebe 100644
+index cbc455e130f..0065376f4b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1090,7 +1090,7 @@ strip_unwanted_llvm_flags() {
+@@ -1111,7 +1111,7 @@ strip_unwanted_llvm_flags() {
  
  llvm_set_environment_variables() {
      if test "x$LLVM_CONFIG" != xno; then
@@ -30,7 +30,7 @@ index 916d0bd207..dd172f1ebe 100644
          LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
          LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
          LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2808,7 +2808,7 @@ detect_old_buggy_llvm() {
+@@ -2860,7 +2860,7 @@ detect_old_buggy_llvm() {
      dnl ourselves.
      dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
      dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
@@ -40,5 +40,5 @@ index 916d0bd207..dd172f1ebe 100644
  
      if test "x$llvm_have_one_so" = xyes; then
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-scripts.patch
deleted file mode 100644
index 8953c4a18f..0000000000
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
diff --git a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
similarity index 55%
rename from meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
rename to meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
index 0212922c5d..8c91790249 100644
--- a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
+++ b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -1,7 +1,7 @@
-From 754ccf89a732fc3da6e9bc62ebd6b28686ff3d26 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 29 Aug 2018 22:10:30 -0300
-Subject: [PATCH 6/6] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+From f48b8f073f921ce5be859130313e9d392ef3e78e Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Fri, 15 Feb 2019 10:57:06 -0200
+Subject: [PATCH 4/5] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
 Organization: O.S. Systems Software LTDA.
 
 This allows to override the wayland-protocols pkgdatadir with the
@@ -11,27 +11,25 @@ pkgconfig would return an absolute path in
 /usr/share/wayland-protocols
 for the pkgdatadir value, which is not suitable for cross-compiling.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 40cac36ac2..728bbdcbc4 100644
+index 0065376f4b7..b21fb2210c6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1823,7 +1823,7 @@ for plat in $platforms; do
-         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
-         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
-         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
+@@ -1839,7 +1839,7 @@ for plat in $platforms; do
+         if test "x$enable_egl" = xyes; then
+           PKG_CHECK_MODULES([WAYLAND_EGL], [wayland-egl-backend >= $WAYLAND_EGL_BACKEND_REQUIRED])
+         fi
 -        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
 +        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
  
-         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
- 
--- 
-2.18.0
-
+         PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
+                           AC_SUBST(SCANNER_ARG, 'private-code'),
diff --git a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-include.patch
deleted file mode 100644
index d40e7b5855..0000000000
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
diff --git a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
new file mode 100644
index 0000000000..1782576db2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
@@ -0,0 +1,49 @@
+From f452e30ab664fe608acc107cc03d2efa8731d938 Mon Sep 17 00:00:00 2001
+From: Gurchetan Singh <gurchetansingh@chromium.org>
+Date: Wed, 28 Nov 2018 08:39:34 -0800
+Subject: [PATCH 5/5] egl: add missing #include <stddef.h> in egldevice.h
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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 66ed649efe..0ce7e4d626 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -55,7 +55,7 @@ PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
@@ -104,7 +104,7 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS_append = ",virgl"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium] = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "8.0"
 PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
@@ -152,7 +152,6 @@ do_install_append () {
     rm -f ${D}${libdir}/gbm/*.la
 
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
-    rm -f ${D}${sysconfdir}/drirc
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -219,8 +218,7 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
-FILES_${PN} += "${sysconfdir}/drirc"
-FILES_mesa-megadriver = "${libdir}/dri/*"
+FILES_mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
 FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
@@ -243,3 +241,8 @@ FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}
 FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
+
+# Fix upgrade path from mesa to mesa-megadriver
+RREPLACES_mesa-megadriver = "mesa"
+RCONFLICTS_mesa-megadriver = "mesa"
+RPROVIDES_mesa-megadriver = "mesa"
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-graphics/mesa/mesa_18.3.4.bb
similarity index 69%
rename from meta/recipes-graphics/mesa/mesa_18.1.9.bb
rename to meta/recipes-graphics/mesa/mesa_18.3.4.bb
index 86d6a6bf3a..27f4f0241f 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.3.4.bb
@@ -4,13 +4,12 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Simplify-wayland-scanner-lookup.patch \
            file://0002-winsys-svga-drm-Include-sys-types.h.patch \
            file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
-           file://0004-Use-Python-3-to-execute-the-scripts.patch \
-           file://0005-dri-i965-Add-missing-time.h-include.patch \
-           file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           file://0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch \
 "
 
-SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
-SRC_URI[sha256sum] = "55f5778d58a710a63d6635f000535768faf7db9e8144dc0f4fd1989f936c1a83"
+SRC_URI[md5sum] = "6f2a5e01dd5cb91d05a9534f5a80c35d"
+SRC_URI[sha256sum] = "32314da4365d37f80d84f599bd9625b00161c273c39600ba63b45002d500bb07"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


