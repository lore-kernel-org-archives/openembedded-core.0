Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CF9D57887A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 22:09:55 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a20so28192393wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q5l4Ur/dNiS+lnU4yywJwgKixg0UKbMMrBna68ExNjs=;
	b=INipVG26tBCVbH403cr8Q/hYF87KB7hg4XyVp5tvSAb5b3HlDhbh0dOQJL3dxF4dvO
	Ev8NpIgjppHv8OJj1vCz/dWJ97zCjyD8PF7oyJerBqYlu6SzIrmgJcJf09oy7Tjc2iAR
	rzYZbOzLyJRTtYDbPW0gvxQ0XA6aTwCxykihTsa/B+CO19NtsEGmncTylGYNPw3uFx+h
	6M8KOsmhewVj7H1QVA8NZdo9OtcNbUkTn1BomBzvvOziZvJFs9cPNCIXp9Ai2ZLnU4uf
	PEnNCwhPIZovBEbY+CkihJpbg/E5kEDWtAnB57LB02Y+l9Ql24H5sajCwqj7aAe1va5g
	FEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q5l4Ur/dNiS+lnU4yywJwgKixg0UKbMMrBna68ExNjs=;
	b=Ppy+9YxMUh4Lvs4C0TTS1Uf0GGxDgggAi9aanwAlax7s33e1zOHHzRrQqi2UqDNalI
	DyHuaBUKr3gNASwJovPaDNZcayx7pxkkP2msKNPoYJyK32FY+v64oM63EtfCohBwp0uX
	wpdVwBjmfcFB5C2+oFshEj15nl95HH8Xl2wO8LpTa/geGw05R7yhzAI/7SB1oU8YkiDP
	tRDe/8F56Vfmme5ghwxDOhvNap2LaHoir2Oon5muEiiWawb/mo+4vcMWibeWL8ZHn4CX
	XdVWY7bPfOovxLglyBAiMUPe5gGEQOvzkZ0zEAYdP9INvV2FF8NNqC8a8dHTh7bM7FeU
	jhAw==
X-Gm-Message-State: APf1xPDIokzYn8u/h0vfdVG/3uV+DIsJ7czJYV2RC5a9qIYW9mJ/fDLY
	dbOZLoFB4H5oFuaVxBNgQsIwHXFU
X-Google-Smtp-Source: AG47ELv8wAC2EhRhVZvp7lbZbumMSXRgsFi1hHt0UeYYmY4KglGh/8Fvd+nYD1EKhOhQODsSUVX5Iw==
X-Received: by 10.28.74.199 with SMTP id n68mr21327wmi.83.1519855796347;
	Wed, 28 Feb 2018 14:09:56 -0800 (PST)
Received: from localhost.localdomain ([151.33.14.228])
	by smtp.gmail.com with ESMTPSA id o2sm3376183wro.31.2018.02.28.14.09.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 14:09:55 -0800 (PST)
From: Francesco Giancane <francescogiancane8@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 23:08:45 +0100
Message-Id: <20180228220845.8906-1-francescogiancane8@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH v3] libepoxy: New recipe updated to latest release
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
X-List-Received-Date: Wed, 28 Feb 2018 22:09:57 -0000

libepoxy 1.4.3 did not compile successfully because of
implicit symbol definitions and link-time errors.
A new recipe with latest libepoxy release (1.5.0) which
successfully compiles is provided.

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
 ...sible-to-disable-the-use-of-dlvsym-needed.patch | 26 +++++++++--------
 .../Add-fallback-definition-for-EGL-CAST.patch     | 33 ----------------------
 .../{libepoxy_1.4.3.bb => libepoxy_1.5.0.bb}       | 10 +++----
 4 files changed, 18 insertions(+), 81 deletions(-)
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
index c2a2fa3453..5bddc12033 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
@@ -1,36 +1,38 @@
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
@@ -41,7 +43,7 @@ index 2340fc6..bc4330b 100644
    ]
  
    foreach test: glx_tests
-@@ -108,7 +108,7 @@ if build_glx
+@@ -114,7 +114,7 @@ if build_glx
      endif
    endforeach
  
@@ -51,5 +53,5 @@ index 2340fc6..bc4330b 100644
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


