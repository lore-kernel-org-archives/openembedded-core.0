Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 905B26A464
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 11:49:19 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so2656602eaf.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 04:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EJ73n3PKxt5OonY/v3lK59Hi1Iyd0UHCneISGf4K1Dw=;
	b=Xr74orutQoK+LW5MZbBsbIVMIItEhuft8qpQuZCbehuEIdPKvvT4gyp2HpDWO49nvP
	3Ef03asQm86a6lf8sTz0cF9jhMn3rbNsmtrbCJ2MZpE6y7uhdA7YriDay6ILfKEYmuky
	LKFdFwgZsJu5CVvQ1Y5YOreQxog3Hi3ApL/RgrMnhxIVLTyy3Nlgrpup8jGQkWPX9Spf
	mACkH0NgJ8pJxCDpEpsfZl6gKU+rxoIuufoMNN06RuY1O3JUeA5/BLyjN/PPJ0u6xmn0
	wDa0J11xi5R+DAXing5BfXl6FFQq25UbHmDJbEDpkiF67VhdRI734k9wLDOdPIYIfsry
	zl0Q==
X-Received: by 10.15.31.198 with SMTP id y46mr25912384eeu.135.1372765759819;
	Tue, 02 Jul 2013 04:49:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm36058392eed.9.2013.07.02.04.49.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 04:49:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 13:49:19 +0200
Message-Id: <1372765759-19565-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130702114403.GA3285@jama>
References: <20130702114403.GA3285@jama>
MIME-Version: 1.0
Subject: [PATCHv3] mesa: bump SRCREV in git recipe, refresh patches
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
X-List-Received-Date: Tue, 02 Jul 2013 11:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
  needs to be rebased so move old version for 9.1.3 to
  mesa-9.1.3/ and update the version in mesa/
* add git headers
* 0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
  is already applied in new SRCREV, move it to mesa-9.1.3/
* formal change in license.html with new SRCREV:
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
  -BRIAN PAUL BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
  -AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  -CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  +THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  +SOFTWARE.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ate-NativeDisplayType-depending-on-config.patch | 359 +++++++++++++++++++++
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |  41 +++
 ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  14 +-
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |  42 ---
 ...ate-NativeDisplayType-depending-on-config.patch | 356 ++++++++++++++++++++
 ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ++++
 ...ate-NativeDisplayType-depending-on-config.patch | 358 --------------------
 .../mesa/mesa/fix-glsl-cross.patch                 |  43 ---
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   6 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |  10 +-
 10 files changed, 825 insertions(+), 458 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch

diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
new file mode 100644
index 0000000..7e82b6a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
@@ -0,0 +1,359 @@
+From 06c1ba29de8a26fffb73ee99f0fc54c704e9fee4 Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniel@fooishbar.org>
+Date: Fri, 24 May 2013 17:20:27 +0100
+Subject: [PATCH 3/5] EGL: Mutate NativeDisplayType depending on config
+
+If we go through ./configure without enabling X11 anywhere, then set the
+fallback types for EGL NativeDisplay and friends, rather than assuming
+X11/Xlib.
+
+Signed-off-by: Daniel Stone <daniel@fooishbar.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac                 |   9 +++
+ include/EGL/eglplatform.h    | 146 -------------------------------------------
+ include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 155 insertions(+), 146 deletions(-)
+ delete mode 100644 include/EGL/eglplatform.h
+ create mode 100644 include/EGL/eglplatform.h.in
+
+diff --git a/configure.ac b/configure.ac
+index 2b4a374..d4c7a95 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1565,12 +1565,20 @@ fi
+ 
+ EGL_PLATFORMS="$egl_platforms"
+ 
++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
++    MESA_EGL_NO_X11_HEADERS=0
++else
++    MESA_EGL_NO_X11_HEADERS=1
++fi
++
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'fbdev' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'null' >/dev/null 2>&1)
+ 
++AC_SUBST([MESA_EGL_NO_X11_HEADERS])
++
+ AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" != "x")
+ AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
+ 
+@@ -2042,6 +2050,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
+ 
+ dnl Substitute the config
+ AC_CONFIG_FILES([Makefile
++		include/EGL/eglplatform.h
+ 		src/Makefile
+ 		src/egl/Makefile
+ 		src/egl/drivers/Makefile
+diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
+deleted file mode 100644
+index 17fdc61..0000000
+--- a/include/EGL/eglplatform.h
++++ /dev/null
+@@ -1,146 +0,0 @@
+-#ifndef __eglplatform_h_
+-#define __eglplatform_h_
+-
+-/*
+-** Copyright (c) 2007-2009 The Khronos Group Inc.
+-**
+-** Permission is hereby granted, free of charge, to any person obtaining a
+-** copy of this software and/or associated documentation files (the
+-** "Materials"), to deal in the Materials without restriction, including
+-** without limitation the rights to use, copy, modify, merge, publish,
+-** distribute, sublicense, and/or sell copies of the Materials, and to
+-** permit persons to whom the Materials are furnished to do so, subject to
+-** the following conditions:
+-**
+-** The above copyright notice and this permission notice shall be included
+-** in all copies or substantial portions of the Materials.
+-**
+-** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+-** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+-** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+-** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+-** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+-** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+-** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
+-*/
+-
+-/* Platform-specific types and definitions for egl.h
+- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
+- *
+- * Adopters may modify khrplatform.h and this file to suit their platform.
+- * You are encouraged to submit all modifications to the Khronos group so that
+- * they can be included in future versions of this file.  Please submit changes
+- * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
+- * by filing a bug against product "EGL" component "Registry".
+- */
+-
+-#include <KHR/khrplatform.h>
+-
+-/* Macros used in EGL function prototype declarations.
+- *
+- * EGL functions should be prototyped as:
+- *
+- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
+- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
+- *
+- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
+- */
+-
+-#ifndef EGLAPI
+-#define EGLAPI KHRONOS_APICALL
+-#endif
+-
+-#ifndef EGLAPIENTRY
+-#define EGLAPIENTRY  KHRONOS_APIENTRY
+-#endif
+-#define EGLAPIENTRYP EGLAPIENTRY*
+-
+-/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
+- * are aliases of window-system-dependent types, such as X Display * or
+- * Windows Device Context. They must be defined in platform-specific
+- * code below. The EGL-prefixed versions of Native*Type are the same
+- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
+- *
+- * Khronos STRONGLY RECOMMENDS that you use the default definitions
+- * provided below, since these changes affect both binary and source
+- * portability of applications using EGL running on different EGL
+- * implementations.
+- */
+-
+-#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
+-#ifndef WIN32_LEAN_AND_MEAN
+-#define WIN32_LEAN_AND_MEAN 1
+-#endif
+-#include <windows.h>
+-
+-typedef HDC     EGLNativeDisplayType;
+-typedef HBITMAP EGLNativePixmapType;
+-typedef HWND    EGLNativeWindowType;
+-
+-#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
+-
+-typedef int   EGLNativeDisplayType;
+-typedef void *EGLNativeWindowType;
+-typedef void *EGLNativePixmapType;
+-
+-#elif defined(WL_EGL_PLATFORM)
+-
+-typedef struct wl_display     *EGLNativeDisplayType;
+-typedef struct wl_egl_pixmap  *EGLNativePixmapType;
+-typedef struct wl_egl_window  *EGLNativeWindowType;
+-
+-#elif defined(__GBM__)
+-
+-typedef struct gbm_device  *EGLNativeDisplayType;
+-typedef struct gbm_bo      *EGLNativePixmapType;
+-typedef void               *EGLNativeWindowType;
+-
+-#elif defined(ANDROID) /* Android */
+-
+-struct ANativeWindow;
+-struct egl_native_pixmap_t;
+-
+-typedef struct ANativeWindow        *EGLNativeWindowType;
+-typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
+-typedef void                        *EGLNativeDisplayType;
+-
+-#elif defined(__unix__)
+-
+-#ifdef MESA_EGL_NO_X11_HEADERS
+-
+-typedef void            *EGLNativeDisplayType;
+-typedef khronos_uint32_t EGLNativePixmapType;
+-typedef khronos_uint32_t EGLNativeWindowType;
+-
+-#else
+-
+-/* X11 (tentative)  */
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
+-
+-typedef Display *EGLNativeDisplayType;
+-typedef Pixmap   EGLNativePixmapType;
+-typedef Window   EGLNativeWindowType;
+-
+-#endif /* MESA_EGL_NO_X11_HEADERS */
+-
+-#else
+-#error "Platform not recognized"
+-#endif
+-
+-/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
+-typedef EGLNativeDisplayType NativeDisplayType;
+-typedef EGLNativePixmapType  NativePixmapType;
+-typedef EGLNativeWindowType  NativeWindowType;
+-
+-
+-/* Define EGLint. This must be a signed integral type large enough to contain
+- * all legal attribute names and values passed into and out of EGL, whether
+- * their type is boolean, bitmask, enumerant (symbolic constant), integer,
+- * handle, or other.  While in general a 32-bit integer will suffice, if
+- * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
+- * integer type.
+- */
+-typedef khronos_int32_t EGLint;
+-
+-#endif /* __eglplatform_h */
+diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
+new file mode 100644
+index 0000000..5126c92
+--- /dev/null
++++ b/include/EGL/eglplatform.h.in
+@@ -0,0 +1,146 @@
++#ifndef __eglplatform_h_
++#define __eglplatform_h_
++
++/*
++** Copyright (c) 2007-2009 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++
++/* Platform-specific types and definitions for egl.h
++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
++ *
++ * Adopters may modify khrplatform.h and this file to suit their platform.
++ * You are encouraged to submit all modifications to the Khronos group so that
++ * they can be included in future versions of this file.  Please submit changes
++ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
++ * by filing a bug against product "EGL" component "Registry".
++ */
++
++#include <KHR/khrplatform.h>
++
++/* Macros used in EGL function prototype declarations.
++ *
++ * EGL functions should be prototyped as:
++ *
++ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
++ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
++ *
++ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
++ */
++
++#ifndef EGLAPI
++#define EGLAPI KHRONOS_APICALL
++#endif
++
++#ifndef EGLAPIENTRY
++#define EGLAPIENTRY  KHRONOS_APIENTRY
++#endif
++#define EGLAPIENTRYP EGLAPIENTRY*
++
++/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
++ * are aliases of window-system-dependent types, such as X Display * or
++ * Windows Device Context. They must be defined in platform-specific
++ * code below. The EGL-prefixed versions of Native*Type are the same
++ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
++ *
++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
++ * provided below, since these changes affect both binary and source
++ * portability of applications using EGL running on different EGL
++ * implementations.
++ */
++
++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
++#ifndef WIN32_LEAN_AND_MEAN
++#define WIN32_LEAN_AND_MEAN 1
++#endif
++#include <windows.h>
++
++typedef HDC     EGLNativeDisplayType;
++typedef HBITMAP EGLNativePixmapType;
++typedef HWND    EGLNativeWindowType;
++
++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
++
++typedef int   EGLNativeDisplayType;
++typedef void *EGLNativeWindowType;
++typedef void *EGLNativePixmapType;
++
++#elif defined(WL_EGL_PLATFORM)
++
++typedef struct wl_display     *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
++typedef struct wl_egl_window  *EGLNativeWindowType;
++
++#elif defined(__GBM__)
++
++typedef struct gbm_device  *EGLNativeDisplayType;
++typedef struct gbm_bo      *EGLNativePixmapType;
++typedef void               *EGLNativeWindowType;
++
++#elif defined(ANDROID) /* Android */
++
++struct ANativeWindow;
++struct egl_native_pixmap_t;
++
++typedef struct ANativeWindow        *EGLNativeWindowType;
++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
++typedef void                        *EGLNativeDisplayType;
++
++#elif defined(__unix__)
++
++#if @MESA_EGL_NO_X11_HEADERS@
++
++typedef void            *EGLNativeDisplayType;
++typedef khronos_uint32_t EGLNativePixmapType;
++typedef khronos_uint32_t EGLNativeWindowType;
++
++#else
++
++/* X11 (tentative)  */
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++typedef Display *EGLNativeDisplayType;
++typedef Pixmap   EGLNativePixmapType;
++typedef Window   EGLNativeWindowType;
++
++#endif /* MESA_EGL_NO_X11_HEADERS */
++
++#else
++#error "Platform not recognized"
++#endif
++
++/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
++typedef EGLNativeDisplayType NativeDisplayType;
++typedef EGLNativePixmapType  NativePixmapType;
++typedef EGLNativeWindowType  NativeWindowType;
++
++
++/* Define EGLint. This must be a signed integral type large enough to contain
++ * all legal attribute names and values passed into and out of EGL, whether
++ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
++ * handle, or other.  While in general a 32-bit integer will suffice, if
++ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
++ * integer type.
++ */
++typedef khronos_int32_t EGLint;
++
++#endif /* __eglplatform_h */
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
new file mode 100644
index 0000000..d86421b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
@@ -0,0 +1,41 @@
+From 33098ef45e6035f3348040a25641f95c95266103 Mon Sep 17 00:00:00 2001
+From: Brian Paul <brianp@vmware.com>
+Date: Wed, 6 Mar 2013 16:57:20 -0700
+Subject: [PATCH 5/5] llvmpipe: remove the power of two sizeof(struct
+ cmd_block) assertion
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It fails on 32-bit systems (I only tested on 64-bit).  Power of two
+size isn't required, so just remove the assertion.
+
+Reviewed-by: José Fonseca <jfonseca@vmware.com>
+
+Upstream-Status: Backport
+http://cgit.freedesktop.org/mesa/mesa/commit/?id=9915636fb8afe75ee2e8e013e4f495a4cb937afb
+---
+ src/gallium/drivers/llvmpipe/lp_scene.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/gallium/drivers/llvmpipe/lp_scene.c b/src/gallium/drivers/llvmpipe/lp_scene.c
+index e145391..c88bc95 100644
+--- a/src/gallium/drivers/llvmpipe/lp_scene.c
++++ b/src/gallium/drivers/llvmpipe/lp_scene.c
+@@ -76,13 +76,6 @@ lp_scene_create( struct pipe_context *pipe )
+       assert(maxCommandBytes < LP_SCENE_MAX_SIZE);
+       /* We'll also need space for at least one other data block */
+       assert(maxCommandPlusData <= LP_SCENE_MAX_SIZE);
+-
+-      /* Ideally, the size of a cmd_block object will be a power of two
+-       * in order to avoid wasting space when we allocation them from
+-       * data blocks (which are power of two also).
+-       */
+-      assert(sizeof(struct cmd_block) ==
+-             util_next_power_of_two(sizeof(struct cmd_block)));
+    }
+ #endif
+ 
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch b/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
index 9f7002a..76b5a18 100644
--- a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
+++ b/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
@@ -1,7 +1,7 @@
-From 877b8ea9a79d1d51f8e6b032801731538590d39e Mon Sep 17 00:00:00 2001
+From e21ce89f7ae6964f196086ff325d79e4a3b5acd8 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Tue, 4 Jun 2013 06:04:44 -0700
-Subject: [PATCH] configure: Avoid use of AC_CHECK_FILE for cross compiling
+Subject: [PATCH 1/4] configure: Avoid use of AC_CHECK_FILE for cross compiling
 
 The AC_CHECK_FILE macro can't be used for cross compiling as it will
 result in "error: cannot check for file existence when cross compiling".
@@ -17,10 +17,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 36065f1..2b4a374 100644
+index 70c598e..67b8c40 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1694,8 +1694,8 @@ if test "x$enable_gallium_llvm" = xyes; then
+@@ -1630,8 +1630,8 @@ if test "x$enable_gallium_llvm" = xyes; then
                  CLANG_LIBDIR=${LLVM_LIBDIR}
              fi
              CLANG_RESOURCE_DIR=$CLANG_LIBDIR/clang/${LLVM_VERSION}
@@ -31,7 +31,7 @@ index 36065f1..2b4a374 100644
          fi
      else
  	MESA_LLVM=0
-@@ -1912,7 +1912,7 @@ if test "x$MESA_LLVM" != x0; then
+@@ -1861,7 +1861,7 @@ if test "x$MESA_LLVM" != x0; then
      if test "x$with_llvm_shared_libs" = xyes; then
          dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
          LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
@@ -40,7 +40,7 @@ index 36065f1..2b4a374 100644
  
          if test "x$llvm_have_one_so" = xyes; then
              dnl LLVM was built using auto*, so there is only one shared object.
-@@ -1920,8 +1920,8 @@ if test "x$MESA_LLVM" != x0; then
+@@ -1869,8 +1869,8 @@ if test "x$MESA_LLVM" != x0; then
          else
              dnl If LLVM was built with CMake, there will be one shared object per
              dnl component.
@@ -51,7 +51,7 @@ index 36065f1..2b4a374 100644
  	Please make sure you have built llvm with the --enable-shared option
  	and that your llvm libraries are installed in $LLVM_LIBDIR
  	If you have installed your llvm libraries to a different directory you
-@@ -1932,7 +1932,7 @@ if test "x$MESA_LLVM" != x0; then
+@@ -1881,7 +1881,7 @@ if test "x$MESA_LLVM" != x0; then
  		--enable-opencl
  	If you do not want to build with llvm shared libraries and instead want to
  	use llvm static libraries then remove these options from your configure
diff --git a/meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
deleted file mode 100644
index b74fddc..0000000
--- a/meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9915636fb8afe75ee2e8e013e4f495a4cb937afb Mon Sep 17 00:00:00 2001
-From: Brian Paul <brianp@vmware.com>
-Date: Wed, 6 Mar 2013 16:57:20 -0700
-Subject: [PATCH] llvmpipe: remove the power of two sizeof(struct cmd_block)
- assertion
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-It fails on 32-bit systems (I only tested on 64-bit).  Power of two
-size isn't required, so just remove the assertion.
-
-Reviewed-by: José Fonseca <jfonseca@vmware.com>
-
-Upstream-Status: Backport
-http://cgit.freedesktop.org/mesa/mesa/commit/?id=9915636fb8afe75ee2e8e013e4f495a4cb937afb
-
----
- src/gallium/drivers/llvmpipe/lp_scene.c | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/src/gallium/drivers/llvmpipe/lp_scene.c b/src/gallium/drivers/llvmpipe/lp_scene.c
-index dd0943e..a0912eb 100644
---- a/src/gallium/drivers/llvmpipe/lp_scene.c
-+++ b/src/gallium/drivers/llvmpipe/lp_scene.c
-@@ -76,13 +76,6 @@ lp_scene_create( struct pipe_context *pipe )
-       assert(maxCommandBytes < LP_SCENE_MAX_SIZE);
-       /* We'll also need space for at least one other data block */
-       assert(maxCommandPlusData <= LP_SCENE_MAX_SIZE);
--
--      /* Ideally, the size of a cmd_block object will be a power of two
--       * in order to avoid wasting space when we allocation them from
--       * data blocks (which are power of two also).
--       */
--      assert(sizeof(struct cmd_block) ==
--             util_next_power_of_two(sizeof(struct cmd_block)));
-    }
- #endif
-
---
-1.8.3
-
diff --git a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
new file mode 100644
index 0000000..d6ddd9a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
@@ -0,0 +1,356 @@
+From 8d31ae23683394617c49301b039b3a069b9ea436 Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniel@fooishbar.org>
+Date: Fri, 24 May 2013 17:20:27 +0100
+Subject: [PATCH 3/4] EGL: Mutate NativeDisplayType depending on config
+
+If we go through ./configure without enabling X11 anywhere, then set the
+fallback types for EGL NativeDisplay and friends, rather than assuming
+X11/Xlib.
+
+Signed-off-by: Daniel Stone <daniel@fooishbar.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac                 |   5 ++
+ include/EGL/eglplatform.h    | 146 -------------------------------------------
+ include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 151 insertions(+), 146 deletions(-)
+ delete mode 100644 include/EGL/eglplatform.h
+ create mode 100644 include/EGL/eglplatform.h.in
+
+diff --git a/configure.ac b/configure.ac
+index 67b8c40..afc3217 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1499,6 +1499,9 @@ EGL_PLATFORMS="$egl_platforms"
+ 
+ if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
+     NEED_WINSYS_XLIB=yes
++    MESA_EGL_NO_X11_HEADERS=0
++else
++    MESA_EGL_NO_X11_HEADERS=1
+ fi
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
+@@ -1512,6 +1515,7 @@ AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
+ AC_SUBST([EGL_NATIVE_PLATFORM])
+ AC_SUBST([EGL_PLATFORMS])
+ AC_SUBST([EGL_CFLAGS])
++AC_SUBST([MESA_EGL_NO_X11_HEADERS])
+ 
+ AC_ARG_WITH([egl-driver-dir],
+     [AS_HELP_STRING([--with-egl-driver-dir=DIR],
+@@ -1991,6 +1995,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
+ 
+ dnl Substitute the config
+ AC_CONFIG_FILES([Makefile
++		include/EGL/eglplatform.h
+ 		src/Makefile
+ 		src/egl/Makefile
+ 		src/egl/drivers/Makefile
+diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
+deleted file mode 100644
+index 17fdc61..0000000
+--- a/include/EGL/eglplatform.h
++++ /dev/null
+@@ -1,146 +0,0 @@
+-#ifndef __eglplatform_h_
+-#define __eglplatform_h_
+-
+-/*
+-** Copyright (c) 2007-2009 The Khronos Group Inc.
+-**
+-** Permission is hereby granted, free of charge, to any person obtaining a
+-** copy of this software and/or associated documentation files (the
+-** "Materials"), to deal in the Materials without restriction, including
+-** without limitation the rights to use, copy, modify, merge, publish,
+-** distribute, sublicense, and/or sell copies of the Materials, and to
+-** permit persons to whom the Materials are furnished to do so, subject to
+-** the following conditions:
+-**
+-** The above copyright notice and this permission notice shall be included
+-** in all copies or substantial portions of the Materials.
+-**
+-** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+-** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+-** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+-** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+-** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+-** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+-** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
+-*/
+-
+-/* Platform-specific types and definitions for egl.h
+- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
+- *
+- * Adopters may modify khrplatform.h and this file to suit their platform.
+- * You are encouraged to submit all modifications to the Khronos group so that
+- * they can be included in future versions of this file.  Please submit changes
+- * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
+- * by filing a bug against product "EGL" component "Registry".
+- */
+-
+-#include <KHR/khrplatform.h>
+-
+-/* Macros used in EGL function prototype declarations.
+- *
+- * EGL functions should be prototyped as:
+- *
+- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
+- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
+- *
+- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
+- */
+-
+-#ifndef EGLAPI
+-#define EGLAPI KHRONOS_APICALL
+-#endif
+-
+-#ifndef EGLAPIENTRY
+-#define EGLAPIENTRY  KHRONOS_APIENTRY
+-#endif
+-#define EGLAPIENTRYP EGLAPIENTRY*
+-
+-/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
+- * are aliases of window-system-dependent types, such as X Display * or
+- * Windows Device Context. They must be defined in platform-specific
+- * code below. The EGL-prefixed versions of Native*Type are the same
+- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
+- *
+- * Khronos STRONGLY RECOMMENDS that you use the default definitions
+- * provided below, since these changes affect both binary and source
+- * portability of applications using EGL running on different EGL
+- * implementations.
+- */
+-
+-#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
+-#ifndef WIN32_LEAN_AND_MEAN
+-#define WIN32_LEAN_AND_MEAN 1
+-#endif
+-#include <windows.h>
+-
+-typedef HDC     EGLNativeDisplayType;
+-typedef HBITMAP EGLNativePixmapType;
+-typedef HWND    EGLNativeWindowType;
+-
+-#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
+-
+-typedef int   EGLNativeDisplayType;
+-typedef void *EGLNativeWindowType;
+-typedef void *EGLNativePixmapType;
+-
+-#elif defined(WL_EGL_PLATFORM)
+-
+-typedef struct wl_display     *EGLNativeDisplayType;
+-typedef struct wl_egl_pixmap  *EGLNativePixmapType;
+-typedef struct wl_egl_window  *EGLNativeWindowType;
+-
+-#elif defined(__GBM__)
+-
+-typedef struct gbm_device  *EGLNativeDisplayType;
+-typedef struct gbm_bo      *EGLNativePixmapType;
+-typedef void               *EGLNativeWindowType;
+-
+-#elif defined(ANDROID) /* Android */
+-
+-struct ANativeWindow;
+-struct egl_native_pixmap_t;
+-
+-typedef struct ANativeWindow        *EGLNativeWindowType;
+-typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
+-typedef void                        *EGLNativeDisplayType;
+-
+-#elif defined(__unix__)
+-
+-#ifdef MESA_EGL_NO_X11_HEADERS
+-
+-typedef void            *EGLNativeDisplayType;
+-typedef khronos_uint32_t EGLNativePixmapType;
+-typedef khronos_uint32_t EGLNativeWindowType;
+-
+-#else
+-
+-/* X11 (tentative)  */
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
+-
+-typedef Display *EGLNativeDisplayType;
+-typedef Pixmap   EGLNativePixmapType;
+-typedef Window   EGLNativeWindowType;
+-
+-#endif /* MESA_EGL_NO_X11_HEADERS */
+-
+-#else
+-#error "Platform not recognized"
+-#endif
+-
+-/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
+-typedef EGLNativeDisplayType NativeDisplayType;
+-typedef EGLNativePixmapType  NativePixmapType;
+-typedef EGLNativeWindowType  NativeWindowType;
+-
+-
+-/* Define EGLint. This must be a signed integral type large enough to contain
+- * all legal attribute names and values passed into and out of EGL, whether
+- * their type is boolean, bitmask, enumerant (symbolic constant), integer,
+- * handle, or other.  While in general a 32-bit integer will suffice, if
+- * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
+- * integer type.
+- */
+-typedef khronos_int32_t EGLint;
+-
+-#endif /* __eglplatform_h */
+diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
+new file mode 100644
+index 0000000..5126c92
+--- /dev/null
++++ b/include/EGL/eglplatform.h.in
+@@ -0,0 +1,146 @@
++#ifndef __eglplatform_h_
++#define __eglplatform_h_
++
++/*
++** Copyright (c) 2007-2009 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++
++/* Platform-specific types and definitions for egl.h
++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
++ *
++ * Adopters may modify khrplatform.h and this file to suit their platform.
++ * You are encouraged to submit all modifications to the Khronos group so that
++ * they can be included in future versions of this file.  Please submit changes
++ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
++ * by filing a bug against product "EGL" component "Registry".
++ */
++
++#include <KHR/khrplatform.h>
++
++/* Macros used in EGL function prototype declarations.
++ *
++ * EGL functions should be prototyped as:
++ *
++ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
++ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
++ *
++ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
++ */
++
++#ifndef EGLAPI
++#define EGLAPI KHRONOS_APICALL
++#endif
++
++#ifndef EGLAPIENTRY
++#define EGLAPIENTRY  KHRONOS_APIENTRY
++#endif
++#define EGLAPIENTRYP EGLAPIENTRY*
++
++/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
++ * are aliases of window-system-dependent types, such as X Display * or
++ * Windows Device Context. They must be defined in platform-specific
++ * code below. The EGL-prefixed versions of Native*Type are the same
++ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
++ *
++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
++ * provided below, since these changes affect both binary and source
++ * portability of applications using EGL running on different EGL
++ * implementations.
++ */
++
++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
++#ifndef WIN32_LEAN_AND_MEAN
++#define WIN32_LEAN_AND_MEAN 1
++#endif
++#include <windows.h>
++
++typedef HDC     EGLNativeDisplayType;
++typedef HBITMAP EGLNativePixmapType;
++typedef HWND    EGLNativeWindowType;
++
++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
++
++typedef int   EGLNativeDisplayType;
++typedef void *EGLNativeWindowType;
++typedef void *EGLNativePixmapType;
++
++#elif defined(WL_EGL_PLATFORM)
++
++typedef struct wl_display     *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
++typedef struct wl_egl_window  *EGLNativeWindowType;
++
++#elif defined(__GBM__)
++
++typedef struct gbm_device  *EGLNativeDisplayType;
++typedef struct gbm_bo      *EGLNativePixmapType;
++typedef void               *EGLNativeWindowType;
++
++#elif defined(ANDROID) /* Android */
++
++struct ANativeWindow;
++struct egl_native_pixmap_t;
++
++typedef struct ANativeWindow        *EGLNativeWindowType;
++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
++typedef void                        *EGLNativeDisplayType;
++
++#elif defined(__unix__)
++
++#if @MESA_EGL_NO_X11_HEADERS@
++
++typedef void            *EGLNativeDisplayType;
++typedef khronos_uint32_t EGLNativePixmapType;
++typedef khronos_uint32_t EGLNativeWindowType;
++
++#else
++
++/* X11 (tentative)  */
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++typedef Display *EGLNativeDisplayType;
++typedef Pixmap   EGLNativePixmapType;
++typedef Window   EGLNativeWindowType;
++
++#endif /* MESA_EGL_NO_X11_HEADERS */
++
++#else
++#error "Platform not recognized"
++#endif
++
++/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
++typedef EGLNativeDisplayType NativeDisplayType;
++typedef EGLNativePixmapType  NativePixmapType;
++typedef EGLNativeWindowType  NativeWindowType;
++
++
++/* Define EGLint. This must be a signed integral type large enough to contain
++ * all legal attribute names and values passed into and out of EGL, whether
++ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
++ * handle, or other.  While in general a 32-bit integer will suffice, if
++ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
++ * integer type.
++ */
++typedef khronos_int32_t EGLint;
++
++#endif /* __eglplatform_h */
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch b/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
new file mode 100644
index 0000000..460a274
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
@@ -0,0 +1,54 @@
+From ab38c97f057f739533a4e1fc9de51ea5f4e6242d Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Sat, 29 Jun 2013 11:37:20 +0200
+Subject: [PATCH 4/4] glsl: fix builtin_compiler cross-compilation
+
+The target libtool is used when building host binaries, which predictably
+doesn't work.
+
+Upstream-Status: Submitted https://bugs.freedesktop.org/show_bug.cgi?id=44618
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/glsl/builtin_compiler/Makefile.am | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
+index e11a17f..8ebe0a2 100644
+--- a/src/glsl/builtin_compiler/Makefile.am
++++ b/src/glsl/builtin_compiler/Makefile.am
+@@ -64,6 +64,8 @@ AM_CXXFLAGS = $(AM_CFLAGS)
+ include ../Makefile.sources
+ 
+ noinst_PROGRAMS = builtin_compiler
++
++if !CROSS_COMPILING
+ noinst_LTLIBRARIES = libglslcore.la libglcpp.la
+ 
+ libglcpp_la_SOURCES =					\
+@@ -73,6 +75,7 @@ libglcpp_la_SOURCES =					\
+ libglslcore_la_SOURCES =				\
+ 	$(BUILTIN_COMPILER_GENERATED_CXX_FILES)		\
+ 	$(LIBGLSL_FILES)
++endif
+ 
+ builtin_compiler_SOURCES = \
+ 	$(top_srcdir)/src/mesa/main/hash_table.c	\
+@@ -81,4 +84,14 @@ builtin_compiler_SOURCES = \
+ 	$(top_srcdir)/src/mesa/program/symbol_table.c	\
+ 	$(BUILTIN_COMPILER_CXX_FILES)			\
+ 	$(GLSL_COMPILER_CXX_FILES)
++
++if CROSS_COMPILING
++builtin_compiler_SOURCES += \
++	$(LIBGLCPP_GENERATED_FILES) \
++	$(LIBGLCPP_FILES) \
++	$(BUILTIN_COMPILER_GENERATED_CXX_FILES) \
++	$(LIBGLSL_FILES)
++builtin_compiler_CPPFLAGS = $(AM_CPPFLAGS)
++else
+ builtin_compiler_LDADD = libglslcore.la libglcpp.la
++endif
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
deleted file mode 100644
index 47ba167..0000000
--- a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
+++ /dev/null
@@ -1,358 +0,0 @@
-From d52a7ec5dcdf3936bd727b854831efb90acfd2ba Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniel@fooishbar.org>
-Date: Fri, 24 May 2013 17:20:27 +0100
-Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config
-
-If we go through ./configure without enabling X11 anywhere, then set the
-fallback types for EGL NativeDisplay and friends, rather than assuming
-X11/Xlib.
-
-Signed-off-by: Daniel Stone <daniel@fooishbar.org>
----
- configure.ac                 |    9 +++
- include/EGL/eglplatform.h    |  146 ------------------------------------------
- include/EGL/eglplatform.h.in |  146 ++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 155 insertions(+), 146 deletions(-)
- delete mode 100644 include/EGL/eglplatform.h
- create mode 100644 include/EGL/eglplatform.h.in
-
-diff --git a/configure.ac b/configure.ac
-index 4a98996..6fa77da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1576,12 +1576,20 @@ fi
- 
- EGL_PLATFORMS="$egl_platforms"
- 
-+if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
-+    MESA_EGL_NO_X11_HEADERS=0
-+else
-+    MESA_EGL_NO_X11_HEADERS=1
-+fi
-+
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'fbdev' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'null' >/dev/null 2>&1)
- 
-+AC_SUBST([MESA_EGL_NO_X11_HEADERS])
-+
- AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" != "x")
- AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
- 
-@@ -2053,6 +2061,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
- 
- dnl Substitute the config
- AC_CONFIG_FILES([Makefile
-+                include/EGL/eglplatform.h
- 		src/Makefile
- 		src/egl/Makefile
- 		src/egl/drivers/Makefile
-diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
-deleted file mode 100644
-index 17fdc61..0000000
---- a/include/EGL/eglplatform.h
-+++ /dev/null
-@@ -1,146 +0,0 @@
--#ifndef __eglplatform_h_
--#define __eglplatform_h_
--
--/*
--** Copyright (c) 2007-2009 The Khronos Group Inc.
--**
--** Permission is hereby granted, free of charge, to any person obtaining a
--** copy of this software and/or associated documentation files (the
--** "Materials"), to deal in the Materials without restriction, including
--** without limitation the rights to use, copy, modify, merge, publish,
--** distribute, sublicense, and/or sell copies of the Materials, and to
--** permit persons to whom the Materials are furnished to do so, subject to
--** the following conditions:
--**
--** The above copyright notice and this permission notice shall be included
--** in all copies or substantial portions of the Materials.
--**
--** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
--** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
--** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
--** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
--** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
--** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
--** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
--*/
--
--/* Platform-specific types and definitions for egl.h
-- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
-- *
-- * Adopters may modify khrplatform.h and this file to suit their platform.
-- * You are encouraged to submit all modifications to the Khronos group so that
-- * they can be included in future versions of this file.  Please submit changes
-- * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
-- * by filing a bug against product "EGL" component "Registry".
-- */
--
--#include <KHR/khrplatform.h>
--
--/* Macros used in EGL function prototype declarations.
-- *
-- * EGL functions should be prototyped as:
-- *
-- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
-- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
-- *
-- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
-- */
--
--#ifndef EGLAPI
--#define EGLAPI KHRONOS_APICALL
--#endif
--
--#ifndef EGLAPIENTRY
--#define EGLAPIENTRY  KHRONOS_APIENTRY
--#endif
--#define EGLAPIENTRYP EGLAPIENTRY*
--
--/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
-- * are aliases of window-system-dependent types, such as X Display * or
-- * Windows Device Context. They must be defined in platform-specific
-- * code below. The EGL-prefixed versions of Native*Type are the same
-- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
-- *
-- * Khronos STRONGLY RECOMMENDS that you use the default definitions
-- * provided below, since these changes affect both binary and source
-- * portability of applications using EGL running on different EGL
-- * implementations.
-- */
--
--#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
--#ifndef WIN32_LEAN_AND_MEAN
--#define WIN32_LEAN_AND_MEAN 1
--#endif
--#include <windows.h>
--
--typedef HDC     EGLNativeDisplayType;
--typedef HBITMAP EGLNativePixmapType;
--typedef HWND    EGLNativeWindowType;
--
--#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
--
--typedef int   EGLNativeDisplayType;
--typedef void *EGLNativeWindowType;
--typedef void *EGLNativePixmapType;
--
--#elif defined(WL_EGL_PLATFORM)
--
--typedef struct wl_display     *EGLNativeDisplayType;
--typedef struct wl_egl_pixmap  *EGLNativePixmapType;
--typedef struct wl_egl_window  *EGLNativeWindowType;
--
--#elif defined(__GBM__)
--
--typedef struct gbm_device  *EGLNativeDisplayType;
--typedef struct gbm_bo      *EGLNativePixmapType;
--typedef void               *EGLNativeWindowType;
--
--#elif defined(ANDROID) /* Android */
--
--struct ANativeWindow;
--struct egl_native_pixmap_t;
--
--typedef struct ANativeWindow        *EGLNativeWindowType;
--typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
--typedef void                        *EGLNativeDisplayType;
--
--#elif defined(__unix__)
--
--#ifdef MESA_EGL_NO_X11_HEADERS
--
--typedef void            *EGLNativeDisplayType;
--typedef khronos_uint32_t EGLNativePixmapType;
--typedef khronos_uint32_t EGLNativeWindowType;
--
--#else
--
--/* X11 (tentative)  */
--#include <X11/Xlib.h>
--#include <X11/Xutil.h>
--
--typedef Display *EGLNativeDisplayType;
--typedef Pixmap   EGLNativePixmapType;
--typedef Window   EGLNativeWindowType;
--
--#endif /* MESA_EGL_NO_X11_HEADERS */
--
--#else
--#error "Platform not recognized"
--#endif
--
--/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
--typedef EGLNativeDisplayType NativeDisplayType;
--typedef EGLNativePixmapType  NativePixmapType;
--typedef EGLNativeWindowType  NativeWindowType;
--
--
--/* Define EGLint. This must be a signed integral type large enough to contain
-- * all legal attribute names and values passed into and out of EGL, whether
-- * their type is boolean, bitmask, enumerant (symbolic constant), integer,
-- * handle, or other.  While in general a 32-bit integer will suffice, if
-- * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
-- * integer type.
-- */
--typedef khronos_int32_t EGLint;
--
--#endif /* __eglplatform_h */
-diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
-new file mode 100644
-index 0000000..5126c92
---- /dev/null
-+++ b/include/EGL/eglplatform.h.in
-@@ -0,0 +1,146 @@
-+#ifndef __eglplatform_h_
-+#define __eglplatform_h_
-+
-+/*
-+** Copyright (c) 2007-2009 The Khronos Group Inc.
-+**
-+** Permission is hereby granted, free of charge, to any person obtaining a
-+** copy of this software and/or associated documentation files (the
-+** "Materials"), to deal in the Materials without restriction, including
-+** without limitation the rights to use, copy, modify, merge, publish,
-+** distribute, sublicense, and/or sell copies of the Materials, and to
-+** permit persons to whom the Materials are furnished to do so, subject to
-+** the following conditions:
-+**
-+** The above copyright notice and this permission notice shall be included
-+** in all copies or substantial portions of the Materials.
-+**
-+** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-+** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-+** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-+** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-+** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
-+*/
-+
-+/* Platform-specific types and definitions for egl.h
-+ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
-+ *
-+ * Adopters may modify khrplatform.h and this file to suit their platform.
-+ * You are encouraged to submit all modifications to the Khronos group so that
-+ * they can be included in future versions of this file.  Please submit changes
-+ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
-+ * by filing a bug against product "EGL" component "Registry".
-+ */
-+
-+#include <KHR/khrplatform.h>
-+
-+/* Macros used in EGL function prototype declarations.
-+ *
-+ * EGL functions should be prototyped as:
-+ *
-+ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
-+ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
-+ *
-+ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
-+ */
-+
-+#ifndef EGLAPI
-+#define EGLAPI KHRONOS_APICALL
-+#endif
-+
-+#ifndef EGLAPIENTRY
-+#define EGLAPIENTRY  KHRONOS_APIENTRY
-+#endif
-+#define EGLAPIENTRYP EGLAPIENTRY*
-+
-+/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
-+ * are aliases of window-system-dependent types, such as X Display * or
-+ * Windows Device Context. They must be defined in platform-specific
-+ * code below. The EGL-prefixed versions of Native*Type are the same
-+ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
-+ *
-+ * Khronos STRONGLY RECOMMENDS that you use the default definitions
-+ * provided below, since these changes affect both binary and source
-+ * portability of applications using EGL running on different EGL
-+ * implementations.
-+ */
-+
-+#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
-+#ifndef WIN32_LEAN_AND_MEAN
-+#define WIN32_LEAN_AND_MEAN 1
-+#endif
-+#include <windows.h>
-+
-+typedef HDC     EGLNativeDisplayType;
-+typedef HBITMAP EGLNativePixmapType;
-+typedef HWND    EGLNativeWindowType;
-+
-+#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
-+
-+typedef int   EGLNativeDisplayType;
-+typedef void *EGLNativeWindowType;
-+typedef void *EGLNativePixmapType;
-+
-+#elif defined(WL_EGL_PLATFORM)
-+
-+typedef struct wl_display     *EGLNativeDisplayType;
-+typedef struct wl_egl_pixmap  *EGLNativePixmapType;
-+typedef struct wl_egl_window  *EGLNativeWindowType;
-+
-+#elif defined(__GBM__)
-+
-+typedef struct gbm_device  *EGLNativeDisplayType;
-+typedef struct gbm_bo      *EGLNativePixmapType;
-+typedef void               *EGLNativeWindowType;
-+
-+#elif defined(ANDROID) /* Android */
-+
-+struct ANativeWindow;
-+struct egl_native_pixmap_t;
-+
-+typedef struct ANativeWindow        *EGLNativeWindowType;
-+typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
-+typedef void                        *EGLNativeDisplayType;
-+
-+#elif defined(__unix__)
-+
-+#if @MESA_EGL_NO_X11_HEADERS@
-+
-+typedef void            *EGLNativeDisplayType;
-+typedef khronos_uint32_t EGLNativePixmapType;
-+typedef khronos_uint32_t EGLNativeWindowType;
-+
-+#else
-+
-+/* X11 (tentative)  */
-+#include <X11/Xlib.h>
-+#include <X11/Xutil.h>
-+
-+typedef Display *EGLNativeDisplayType;
-+typedef Pixmap   EGLNativePixmapType;
-+typedef Window   EGLNativeWindowType;
-+
-+#endif /* MESA_EGL_NO_X11_HEADERS */
-+
-+#else
-+#error "Platform not recognized"
-+#endif
-+
-+/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
-+typedef EGLNativeDisplayType NativeDisplayType;
-+typedef EGLNativePixmapType  NativePixmapType;
-+typedef EGLNativeWindowType  NativeWindowType;
-+
-+
-+/* Define EGLint. This must be a signed integral type large enough to contain
-+ * all legal attribute names and values passed into and out of EGL, whether
-+ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
-+ * handle, or other.  While in general a 32-bit integer will suffice, if
-+ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
-+ * integer type.
-+ */
-+typedef khronos_int32_t EGLint;
-+
-+#endif /* __eglplatform_h */
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch b/meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
deleted file mode 100644
index 34226ea..0000000
--- a/meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-The target libtool is used when building host binaries, which predictably
-doesn't work.
-
-Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=44618)
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
-index e11a17f..8ebe0a2 100644
---- a/src/glsl/builtin_compiler/Makefile.am
-+++ b/src/glsl/builtin_compiler/Makefile.am
-@@ -64,6 +64,8 @@ AM_CXXFLAGS = $(AM_CFLAGS)
- include ../Makefile.sources
- 
- noinst_PROGRAMS = builtin_compiler
-+
-+if !CROSS_COMPILING
- noinst_LTLIBRARIES = libglslcore.la libglcpp.la
- 
- libglcpp_la_SOURCES =					\
-@@ -73,6 +75,7 @@ libglcpp_la_SOURCES =					\
- libglslcore_la_SOURCES =				\
- 	$(BUILTIN_COMPILER_GENERATED_CXX_FILES)		\
- 	$(LIBGLSL_FILES)
-+endif
- 
- builtin_compiler_SOURCES = \
- 	$(top_srcdir)/src/mesa/main/hash_table.c	\
-@@ -81,4 +84,14 @@ builtin_compiler_SOURCES = \
- 	$(top_srcdir)/src/mesa/program/symbol_table.c	\
- 	$(BUILTIN_COMPILER_CXX_FILES)			\
- 	$(GLSL_COMPILER_CXX_FILES)
-+
-+if CROSS_COMPILING
-+builtin_compiler_SOURCES += \
-+	$(LIBGLCPP_GENERATED_FILES) \
-+	$(LIBGLCPP_FILES) \
-+	$(BUILTIN_COMPILER_GENERATED_CXX_FILES) \
-+	$(LIBGLSL_FILES)
-+builtin_compiler_CPPFLAGS = $(AM_CPPFLAGS)
-+else
- builtin_compiler_LDADD = libglslcore.la libglcpp.la
-+endif
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
index bbeacd3..a7ccbe6 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
@@ -1,11 +1,11 @@
 require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
-           file://fix-glsl-cross.patch \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
-           file://0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
+           file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
+           file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
 SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 09a9531..52d3d81 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -2,17 +2,17 @@ require ${BPN}.inc
 
 DEFAULT_PREFERENCE = "-1"
 
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
+
 PR = "${INC_PR}.0"
-# 9.1.3 commit
-SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
+SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
 PV = "9.1.3+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
-           file://fix-glsl-cross.patch \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
-           file://0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
+           file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.8.2.1


