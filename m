Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 95CC7788B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 16:20:38 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id m5so7180918wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ECmdmWVLiPK3M4Zrkpi6WIlHGI7kPK5h/jSDI5ZUxlI=;
	b=TN+V0UoGhGXKFAp/vi5czzA/lImRvEFrUYoG4fN23/mERj6VaAImnCUw+FzsKuwfC4
	8KO1ihjVce8hEizJE4w7XrSVQhRtxGfXlA14Omv1GRRvXIam6ohoBH+q8spz5SkwL6l5
	+QSZ/URahOg0OKEIvsWTs0VRh4XuKclT8r5kdcu+TLhxylez1J+SeOYbCUj7l9AaWNGe
	brkxEb9LGi808Vov+ZaGmO2lEjnovhYXfXkTmTxCFSyWcm2X75/tJevXbPsz0r+uImhW
	vXFWQoV2rcyxdXnaqMgMg2SVNgI5hCsqhqvEUGm9II20vgxQ/rvJ/DyEOr7zWLQElcmb
	ao0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ECmdmWVLiPK3M4Zrkpi6WIlHGI7kPK5h/jSDI5ZUxlI=;
	b=gn/rH4VcZB+nJSzruK5izhfjYSYlzP0SMM6d3A+Qp4Lxp+AqiKHTB8mXNOPTnRUzu8
	vG0g9bnTDTm+DMOyXzHjXnKm2WcxfV9qpX4M7/HeQpZACkUVcjQk4fn9dlcUc6Qt9wkz
	ogwROe2X4yGe+UJI/mi4pmJm28eFfitomlwJRFVXqtYwQgjDjftb5AWUW0L+kiqOsQSh
	eZv1yA5ctqxlnFdo3j/n0CW6BTEDMgDxOE5ALwL4xTVR0f4lup5u+4ZmpZcq2l/o+USy
	GNLqTI46J9iyL55G8PUv2rJBpeeqXy+X3IIaUjCPM0lzedFJZdds/5bq0QNwRnXUocDy
	ftRg==
X-Gm-Message-State: APf1xPBHuBWHP5cP+KWvHm1KVogcCtpLQdBlYsggYbecia/2WlEFORXY
	0rDng9+W5LG3DO8mgnKL1p5pRxF+
X-Google-Smtp-Source: AG47ELuZ1BnaYKWuZduGAkST+7qSAg6h3wSv3elo9b77lbGB2IEcXIVQncKoX5QTdV9n2GpIQbriXA==
X-Received: by 10.223.145.67 with SMTP id j61mr2423949wrj.152.1519921238704;
	Thu, 01 Mar 2018 08:20:38 -0800 (PST)
Received: from localhost.localdomain ([151.33.14.228])
	by smtp.gmail.com with ESMTPSA id
	i11sm3847075wre.36.2018.03.01.08.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 08:20:37 -0800 (PST)
From: Francesco Giancane <francescogiancane8@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 17:19:22 +0100
Message-Id: <20180301161922.4082-1-francescogiancane8@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta][PATCH v4] libepoxy: update to version 1.5.0
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
X-List-Received-Date: Thu, 01 Mar 2018 16:20:38 -0000

libepoxy 1.4.3 did not compile successfully because of
implicit symbol definitions and link-time errors.

Patch to disable 'dlvsym' has also been forward-ported
to be applicable to version 1.5.0.
The patch 'Add-fallback-definition-for-EGL-CAST.patch' is
mainline now; thus it can be safely removed.
Also, the patch
0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
is no longer required since mainline fixed this too.

Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
---
 ..._EGL_NO_X11_HEADERS-before-including-eglp.patch | 30 --------------------
 ...sible-to-disable-the-use-of-dlvsym-needed.patch | 27 ++++++++++--------
 .../Add-fallback-definition-for-EGL-CAST.patch     | 33 ----------------------
 .../{libepoxy_1.4.3.bb => libepoxy_1.5.0.bb}       | 10 +++----
 4 files changed, 19 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.3.bb => libepoxy_1.5.0.bb} (61%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
deleted file mode 100644
index ebe5754a7a..0000000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 62e178ddae24c7633d2a03b129dc52261e0a15bf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Feb 2018 00:48:03 -0800
-Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including eglplatform.h
- when X11 is disabled
-
-This helps in compiling when GL implementations e.g. mesa use
-this define to exclude X11 headers
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/anholt/libepoxy/pull/153]
-
- src/dispatch_common.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-Index: libepoxy-1.4.3/src/dispatch_common.h
-===================================================================
---- libepoxy-1.4.3.orig/src/dispatch_common.h
-+++ libepoxy-1.4.3/src/dispatch_common.h
-@@ -46,6 +46,9 @@
- #include "epoxy/glx.h"
- #endif
- #if PLATFORM_HAS_EGL
-+#if !PLATFORM_HAS_GLX
-+#define MESA_EGL_NO_X11_HEADERS 1
-+#endif
- #include "epoxy/egl.h"
- #endif
- #if PLATFORM_HAS_WGL
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
index c2a2fa3453..bd49e36314 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
@@ -1,36 +1,39 @@
-From 7bcefd311cd696955376fe2c5298ec85e8f954ce Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 15 Nov 2017 12:48:27 +0200
+From 9c964427656ef71210e2c5b48b279857806574e9 Mon Sep 17 00:00:00 2001
+From: Francesco Giancane <francescogiancane8@gmail.com>
+Date: Wed, 28 Feb 2018 21:32:24 +0100
 Subject: [PATCH] Make it possible to disable the use of dlvsym() (needed for
  musl)
 
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Add a patch to work around absence of dlvsym() on musl
+(wasn't previously a problem as autotools weren't building tests by default)
 
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
 ---
  meson_options.txt | 3 +++
  test/meson.build  | 6 +++---
  2 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/meson_options.txt b/meson_options.txt
-index 244476a..071f0b6 100644
+index b5d7c98..aa849c2 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,6 +1,9 @@
- option('enable-docs',
+ option('docs',
         type: 'boolean', value: false,
         description: 'Enable generating the Epoxy API reference (depends on Doxygen)')
 +option('has-dlvsym',
 +       type: 'boolean', value: true,
 +       description: 'Whether dlvsym() is available (it is not when using musl C library)')
- option('enable-glx',
+ option('glx',
         type: 'combo',
         choices: [ 'auto', 'yes', 'no' ],
 diff --git a/test/meson.build b/test/meson.build
-index 2340fc6..bc4330b 100644
+index c5788b4..4c46ae6 100644
 --- a/test/meson.build
 +++ b/test/meson.build
-@@ -86,8 +86,8 @@ if build_glx
+@@ -92,8 +92,8 @@ if build_glx
      [ 'glx_has_extension_nocontext', [ 'glx_has_extension_nocontext.c' ], [], [], true ],
      [ 'glx_static', [ 'glx_static.c' ], [ '-DNEEDS_TO_BE_STATIC'], [ '-static' ], libtype == 'static' ],
      [ 'glx_shared_znow', [ 'glx_static.c', ], [], [ '-Wl,-z,now' ], has_znow ],
@@ -41,7 +44,7 @@ index 2340fc6..bc4330b 100644
    ]
  
    foreach test: glx_tests
-@@ -108,7 +108,7 @@ if build_glx
+@@ -114,7 +114,7 @@ if build_glx
      endif
    endforeach
  
@@ -51,5 +54,5 @@ index 2340fc6..bc4330b 100644
      if build_egl
        glx_egl_sources = [
 -- 
-2.15.0
+2.14.3
 
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
deleted file mode 100644
index b9297257dc..0000000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Add fallback definition for EGL_CAST
-
-The EGL API update from d11104f introduced a dependency on the
-EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
-don't provide eglplatform.h, add a fallback definition for if we're
-building against Mesa 17.0.x or similar.
-
-https://bugs.gentoo.org/show_bug.cgi?id=623926
-
-Upstream-Status: Backport [https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8]
-
-Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
-
-Index: libepoxy-1.4.3/src/gen_dispatch.py
-===================================================================
---- libepoxy-1.4.3.orig/src/gen_dispatch.py	2017-06-06 04:24:13.000000000 -0500
-+++ libepoxy-1.4.3/src/gen_dispatch.py	2017-11-06 12:45:43.594966473 -0600
-@@ -491,6 +491,15 @@
-             self.outln('#include "epoxy/gl.h"')
-             if self.target == "egl":
-                 self.outln('#include "EGL/eglplatform.h"')
-+                # Account for older eglplatform.h, which doesn't define
-+                # the EGL_CAST macro.
-+                self.outln('#ifndef EGL_CAST')
-+                self.outln('#if defined(__cplusplus)')
-+                self.outln('#define EGL_CAST(type, value) (static_cast<type>(value))')
-+                self.outln('#else')
-+                self.outln('#define EGL_CAST(type, value) ((type) (value))')
-+                self.outln('#endif')
-+                self.outln('#endif')
-         else:
-             # Add some ridiculous inttypes.h redefinitions that are
-             # from khrplatform.h and not included in the XML.  We
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
similarity index 61%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
index 8a5cb8f49f..dfdd19248d 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
@@ -6,12 +6,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://Add-fallback-definition-for-EGL-CAST.patch \
            file://0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch \
-           file://0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch \
            "
-SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
-SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
+SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
+SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig distro_features_check
@@ -20,8 +18,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "util-macros"
 
-PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
-PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11"
+PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
+PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
-- 
2.14.3


