Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id EE70F6A467
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 12:27:17 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so2037797eaj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zuVy+5TNtuMGZTwI5Qu+IyoXgr1Xya9lyji7Ete7T34=;
	b=FAKETQz7IXlI37yH9wsT+2y5empv4Btt5UZCkQErfoQ4zrcZ1zrYTL9giDWx1V8pys
	S9JFWW1m1kOfpDHalzsr6hufgTrICYsaGapeb1vpnoOOZ4Ii07u7GiaNrIhGYxG4FqyC
	eQYQvm+ISdlsqyR8dvQH4TYDDrCHCR9eTC2O3M0DOlorsdxSwT3+qI1jJAoaPGW1I0nI
	27UocWdHe2xZwBmnxcDCjYQ6QHZwdPB2quUL8/O4mIc5yZiK8abQ3x56POS3Fe///rby
	StjmF9WZfxLc0izgYUhXCzVl6Sy0RR+SpwM32DF+kQjU98c09TREaXxXfxTstBgvSCa+
	UTcg==
X-Received: by 10.14.225.66 with SMTP id y42mr2876981eep.2.1383308839234;
	Fri, 01 Nov 2013 05:27:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a1sm7222749eem.1.2013.11.01.05.27.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 05:27:18 -0700 (PDT)
Date: Fri, 1 Nov 2013 13:27:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20131101122721.GB5768@jama>
References: <1383128859-25223-1-git-send-email-valentin.popa@intel.com>
	<527397FC.5010605@intel.com>
MIME-Version: 1.0
In-Reply-To: <527397FC.5010605@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Fri, 01 Nov 2013 12:27:18 -0000
X-Groupsio-MsgNum: 46510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 02:01:00PM +0200, Valentin Popa wrote:
> Updated mesa patch:

It was already merged, so if there are some changes you'll need to
rebase and send smaller diff.

>=20
> On 10/30/2013 12:27 PM, Valentin Popa wrote:
> > * License is still MIT
> > * removed patches were already merged or
> >    another solution was backported.
> >
> > Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> > ---
> >   ...ate-NativeDisplayType-depending-on-config.patch | 362 ------------=
---------
> >   .../mesa/{mesa-gl_9.1.6.bb =3D> mesa-gl_9.2.2.bb}    |   0
> >   meta/recipes-graphics/mesa/mesa.inc                |   2 +-
> >   ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
> >   ...ate-NativeDisplayType-depending-on-config.patch |  35 +-
> >   ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ---
> >   .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
> >   ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
> >   .../mesa/{mesa_9.1.6.bb =3D> mesa_9.2.2.bb}          |   9 +-
> >   meta/recipes-graphics/mesa/mesa_git.bb             |   8 +-
> >   10 files changed, 24 insertions(+), 553 deletions(-)
> >   delete mode 100644 meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mut=
ate-NativeDisplayType-depending-on-config.patch
> >   rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb =3D> mesa-gl_9.2.=
2.bb} (100%)
> >   delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avo=
id-use-of-AC_CHECK_FILE-for-cross-compi.patch
> >   delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-glsl-fix-buil=
tin_compiler-cross-compilation.patch
> >   delete mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tr=
ee-builds-gallium.patch
> >   rename meta/recipes-graphics/mesa/{mesa-9.1.6 =3D> mesa}/0005-llvmpip=
e-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
> >   rename meta/recipes-graphics/mesa/{mesa_9.1.6.bb =3D> mesa_9.2.2.bb} =
(34%)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-Nati=
veDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9=
=2E1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> > deleted file mode 100644
> > index 30a3d98..0000000
> > --- a/meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDispl=
ayType-depending-on-config.patch
> > +++ /dev/null
> > @@ -1,362 +0,0 @@
> > -From 06c1ba29de8a26fffb73ee99f0fc54c704e9fee4 Mon Sep 17 00:00:00 2001
> > -From: Daniel Stone <daniel@fooishbar.org>
> > -Date: Fri, 24 May 2013 17:20:27 +0100
> > -Subject: [PATCH 3/5] EGL: Mutate NativeDisplayType depending on config
> > -
> > -If we go through ./configure without enabling X11 anywhere, then set t=
he
> > -fallback types for EGL NativeDisplay and friends, rather than assuming
> > -X11/Xlib.
> > -
> > -Upstream-Status: Backport (slightly different solution was applied in =
master
> > -https://bugs.freedesktop.org/show_bug.cgi?id=3D64959)
> > -
> > -Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ----
> > - configure.ac                 |   9 +++
> > - include/EGL/eglplatform.h    | 146 ----------------------------------=
---------
> > - include/EGL/eglplatform.h.in | 146 ++++++++++++++++++++++++++++++++++=
+++++++++
> > - 3 files changed, 155 insertions(+), 146 deletions(-)
> > - delete mode 100644 include/EGL/eglplatform.h
> > - create mode 100644 include/EGL/eglplatform.h.in
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 2b4a374..d4c7a95 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -1565,12 +1565,20 @@ fi
> > -
> > - EGL_PLATFORMS=3D"$egl_platforms"
> > -
> > -+if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> > -+    MESA_EGL_NO_X11_HEADERS=3D0
> > -+else
> > -+    MESA_EGL_NO_X11_HEADERS=3D1
> > -+fi
> > -+
> > - AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x=
11' >/dev/null 2>&1)
> > - AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | gre=
p 'wayland' >/dev/null 2>&1)
> > - AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'd=
rm' >/dev/null 2>&1)
> > - AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep =
'fbdev' >/dev/null 2>&1)
> > - AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep '=
null' >/dev/null 2>&1)
> > -
> > -+AC_SUBST([MESA_EGL_NO_X11_HEADERS])
> > -+
> > - AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" !=
=3D "x")
> > - AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" !=3D=
 "x")
> > -
> > -@@ -2042,6 +2050,7 @@ CXXFLAGS=3D"$CXXFLAGS $USER_CXXFLAGS"
> > -
> > - dnl Substitute the config
> > - AC_CONFIG_FILES([Makefile
> > -+		include/EGL/eglplatform.h
> > - 		src/Makefile
> > - 		src/egl/Makefile
> > - 		src/egl/drivers/Makefile
> > -diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
> > -deleted file mode 100644
> > -index 17fdc61..0000000
> > ---- a/include/EGL/eglplatform.h
> > -+++ /dev/null
> > -@@ -1,146 +0,0 @@
> > --#ifndef __eglplatform_h_
> > --#define __eglplatform_h_
> > --
> > --/*
> > --** Copyright (c) 2007-2009 The Khronos Group Inc.
> > --**
> > --** Permission is hereby granted, free of charge, to any person obtain=
ing a
> > --** copy of this software and/or associated documentation files (the
> > --** "Materials"), to deal in the Materials without restriction, includ=
ing
> > --** without limitation the rights to use, copy, modify, merge, publish,
> > --** distribute, sublicense, and/or sell copies of the Materials, and to
> > --** permit persons to whom the Materials are furnished to do so, subje=
ct to
> > --** the following conditions:
> > --**
> > --** The above copyright notice and this permission notice shall be inc=
luded
> > --** in all copies or substantial portions of the Materials.
> > --**
> > --** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > --** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > --** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEM=
ENT.
> > --** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR A=
NY
> > --** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRAC=
T,
> > --** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > --** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
> > --*/
> > --
> > --/* Platform-specific types and definitions for egl.h
> > -- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Au=
g 2010) $
> > -- *
> > -- * Adopters may modify khrplatform.h and this file to suit their plat=
form.
> > -- * You are encouraged to submit all modifications to the Khronos grou=
p so that
> > -- * they can be included in future versions of this file.  Please subm=
it changes
> > -- * by sending them to the public Khronos Bugzilla (http://khronos.org=
/bugzilla)
> > -- * by filing a bug against product "EGL" component "Registry".
> > -- */
> > --
> > --#include <KHR/khrplatform.h>
> > --
> > --/* Macros used in EGL function prototype declarations.
> > -- *
> > -- * EGL functions should be prototyped as:
> > -- *
> > -- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
> > -- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
> > -- *
> > -- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatfor=
m.h
> > -- */
> > --
> > --#ifndef EGLAPI
> > --#define EGLAPI KHRONOS_APICALL
> > --#endif
> > --
> > --#ifndef EGLAPIENTRY
> > --#define EGLAPIENTRY  KHRONOS_APIENTRY
> > --#endif
> > --#define EGLAPIENTRYP EGLAPIENTRY*
> > --
> > --/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
> > -- * are aliases of window-system-dependent types, such as X Display * =
or
> > -- * Windows Device Context. They must be defined in platform-specific
> > -- * code below. The EGL-prefixed versions of Native*Type are the same
> > -- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
> > -- *
> > -- * Khronos STRONGLY RECOMMENDS that you use the default definitions
> > -- * provided below, since these changes affect both binary and source
> > -- * portability of applications using EGL running on different EGL
> > -- * implementations.
> > -- */
> > --
> > --#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !=
defined(__SCITECH_SNAP__) /* Win32 and WinCE */
> > --#ifndef WIN32_LEAN_AND_MEAN
> > --#define WIN32_LEAN_AND_MEAN 1
> > --#endif
> > --#include <windows.h>
> > --
> > --typedef HDC     EGLNativeDisplayType;
> > --typedef HBITMAP EGLNativePixmapType;
> > --typedef HWND    EGLNativeWindowType;
> > --
> > --#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
> > --
> > --typedef int   EGLNativeDisplayType;
> > --typedef void *EGLNativeWindowType;
> > --typedef void *EGLNativePixmapType;
> > --
> > --#elif defined(WL_EGL_PLATFORM)
> > --
> > --typedef struct wl_display     *EGLNativeDisplayType;
> > --typedef struct wl_egl_pixmap  *EGLNativePixmapType;
> > --typedef struct wl_egl_window  *EGLNativeWindowType;
> > --
> > --#elif defined(__GBM__)
> > --
> > --typedef struct gbm_device  *EGLNativeDisplayType;
> > --typedef struct gbm_bo      *EGLNativePixmapType;
> > --typedef void               *EGLNativeWindowType;
> > --
> > --#elif defined(ANDROID) /* Android */
> > --
> > --struct ANativeWindow;
> > --struct egl_native_pixmap_t;
> > --
> > --typedef struct ANativeWindow        *EGLNativeWindowType;
> > --typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
> > --typedef void                        *EGLNativeDisplayType;
> > --
> > --#elif defined(__unix__)
> > --
> > --#ifdef MESA_EGL_NO_X11_HEADERS
> > --
> > --typedef void            *EGLNativeDisplayType;
> > --typedef khronos_uint32_t EGLNativePixmapType;
> > --typedef khronos_uint32_t EGLNativeWindowType;
> > --
> > --#else
> > --
> > --/* X11 (tentative)  */
> > --#include <X11/Xlib.h>
> > --#include <X11/Xutil.h>
> > --
> > --typedef Display *EGLNativeDisplayType;
> > --typedef Pixmap   EGLNativePixmapType;
> > --typedef Window   EGLNativeWindowType;
> > --
> > --#endif /* MESA_EGL_NO_X11_HEADERS */
> > --
> > --#else
> > --#error "Platform not recognized"
> > --#endif
> > --
> > --/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
> > --typedef EGLNativeDisplayType NativeDisplayType;
> > --typedef EGLNativePixmapType  NativePixmapType;
> > --typedef EGLNativeWindowType  NativeWindowType;
> > --
> > --
> > --/* Define EGLint. This must be a signed integral type large enough to=
 contain
> > -- * all legal attribute names and values passed into and out of EGL, w=
hether
> > -- * their type is boolean, bitmask, enumerant (symbolic constant), int=
eger,
> > -- * handle, or other.  While in general a 32-bit integer will suffice,=
 if
> > -- * handles are 64 bit types, then EGLint should be defined as a signe=
d 64-bit
> > -- * integer type.
> > -- */
> > --typedef khronos_int32_t EGLint;
> > --
> > --#endif /* __eglplatform_h */
> > -diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.=
in
> > -new file mode 100644
> > -index 0000000..5126c92
> > ---- /dev/null
> > -+++ b/include/EGL/eglplatform.h.in
> > -@@ -0,0 +1,146 @@
> > -+#ifndef __eglplatform_h_
> > -+#define __eglplatform_h_
> > -+
> > -+/*
> > -+** Copyright (c) 2007-2009 The Khronos Group Inc.
> > -+**
> > -+** Permission is hereby granted, free of charge, to any person obtain=
ing a
> > -+** copy of this software and/or associated documentation files (the
> > -+** "Materials"), to deal in the Materials without restriction, includ=
ing
> > -+** without limitation the rights to use, copy, modify, merge, publish,
> > -+** distribute, sublicense, and/or sell copies of the Materials, and to
> > -+** permit persons to whom the Materials are furnished to do so, subje=
ct to
> > -+** the following conditions:
> > -+**
> > -+** The above copyright notice and this permission notice shall be inc=
luded
> > -+** in all copies or substantial portions of the Materials.
> > -+**
> > -+** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > -+** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > -+** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEM=
ENT.
> > -+** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR A=
NY
> > -+** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRAC=
T,
> > -+** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > -+** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
> > -+*/
> > -+
> > -+/* Platform-specific types and definitions for egl.h
> > -+ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Au=
g 2010) $
> > -+ *
> > -+ * Adopters may modify khrplatform.h and this file to suit their plat=
form.
> > -+ * You are encouraged to submit all modifications to the Khronos grou=
p so that
> > -+ * they can be included in future versions of this file.  Please subm=
it changes
> > -+ * by sending them to the public Khronos Bugzilla (http://khronos.org=
/bugzilla)
> > -+ * by filing a bug against product "EGL" component "Registry".
> > -+ */
> > -+
> > -+#include <KHR/khrplatform.h>
> > -+
> > -+/* Macros used in EGL function prototype declarations.
> > -+ *
> > -+ * EGL functions should be prototyped as:
> > -+ *
> > -+ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
> > -+ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
> > -+ *
> > -+ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatfor=
m.h
> > -+ */
> > -+
> > -+#ifndef EGLAPI
> > -+#define EGLAPI KHRONOS_APICALL
> > -+#endif
> > -+
> > -+#ifndef EGLAPIENTRY
> > -+#define EGLAPIENTRY  KHRONOS_APIENTRY
> > -+#endif
> > -+#define EGLAPIENTRYP EGLAPIENTRY*
> > -+
> > -+/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
> > -+ * are aliases of window-system-dependent types, such as X Display * =
or
> > -+ * Windows Device Context. They must be defined in platform-specific
> > -+ * code below. The EGL-prefixed versions of Native*Type are the same
> > -+ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
> > -+ *
> > -+ * Khronos STRONGLY RECOMMENDS that you use the default definitions
> > -+ * provided below, since these changes affect both binary and source
> > -+ * portability of applications using EGL running on different EGL
> > -+ * implementations.
> > -+ */
> > -+
> > -+#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !=
defined(__SCITECH_SNAP__) /* Win32 and WinCE */
> > -+#ifndef WIN32_LEAN_AND_MEAN
> > -+#define WIN32_LEAN_AND_MEAN 1
> > -+#endif
> > -+#include <windows.h>
> > -+
> > -+typedef HDC     EGLNativeDisplayType;
> > -+typedef HBITMAP EGLNativePixmapType;
> > -+typedef HWND    EGLNativeWindowType;
> > -+
> > -+#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
> > -+
> > -+typedef int   EGLNativeDisplayType;
> > -+typedef void *EGLNativeWindowType;
> > -+typedef void *EGLNativePixmapType;
> > -+
> > -+#elif defined(WL_EGL_PLATFORM)
> > -+
> > -+typedef struct wl_display     *EGLNativeDisplayType;
> > -+typedef struct wl_egl_pixmap  *EGLNativePixmapType;
> > -+typedef struct wl_egl_window  *EGLNativeWindowType;
> > -+
> > -+#elif defined(__GBM__)
> > -+
> > -+typedef struct gbm_device  *EGLNativeDisplayType;
> > -+typedef struct gbm_bo      *EGLNativePixmapType;
> > -+typedef void               *EGLNativeWindowType;
> > -+
> > -+#elif defined(ANDROID) /* Android */
> > -+
> > -+struct ANativeWindow;
> > -+struct egl_native_pixmap_t;
> > -+
> > -+typedef struct ANativeWindow        *EGLNativeWindowType;
> > -+typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
> > -+typedef void                        *EGLNativeDisplayType;
> > -+
> > -+#elif defined(__unix__)
> > -+
> > -+#if @MESA_EGL_NO_X11_HEADERS@
> > -+
> > -+typedef void            *EGLNativeDisplayType;
> > -+typedef khronos_uint32_t EGLNativePixmapType;
> > -+typedef khronos_uint32_t EGLNativeWindowType;
> > -+
> > -+#else
> > -+
> > -+/* X11 (tentative)  */
> > -+#include <X11/Xlib.h>
> > -+#include <X11/Xutil.h>
> > -+
> > -+typedef Display *EGLNativeDisplayType;
> > -+typedef Pixmap   EGLNativePixmapType;
> > -+typedef Window   EGLNativeWindowType;
> > -+
> > -+#endif /* MESA_EGL_NO_X11_HEADERS */
> > -+
> > -+#else
> > -+#error "Platform not recognized"
> > -+#endif
> > -+
> > -+/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
> > -+typedef EGLNativeDisplayType NativeDisplayType;
> > -+typedef EGLNativePixmapType  NativePixmapType;
> > -+typedef EGLNativeWindowType  NativeWindowType;
> > -+
> > -+
> > -+/* Define EGLint. This must be a signed integral type large enough to=
 contain
> > -+ * all legal attribute names and values passed into and out of EGL, w=
hether
> > -+ * their type is boolean, bitmask, enumerant (symbolic constant), int=
eger,
> > -+ * handle, or other.  While in general a 32-bit integer will suffice,=
 if
> > -+ * handles are 64 bit types, then EGLint should be defined as a signe=
d 64-bit
> > -+ * integer type.
> > -+ */
> > -+typedef khronos_int32_t EGLint;
> > -+
> > -+#endif /* __eglplatform_h */
> > ---
> > -1.8.2.1
> > -
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes=
-graphics/mesa/mesa-gl_9.2.2.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index afc795c..5cbf56d 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -10,7 +10,7 @@ HOMEPAGE =3D "http://mesa3d.org"
> >   BUGTRACKER =3D "https://bugs.freedesktop.org"
> >   SECTION =3D "x11"
> >   LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D42d77d95cba529a36=
37129be87d6555d"
> > +LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3Df69a4626e9efc40fa=
0d3cc3b02c9eacf"
> >  =20
> >   INC_PR =3D "r9"
> >   PE =3D "2"
> > diff --git a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-o=
f-AC_CHECK_FILE-for-cross-compi.patch b/meta/recipes-graphics/mesa/mesa/000=
1-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
> > deleted file mode 100644
> > index 76b5a18..0000000
> > --- a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CH=
ECK_FILE-for-cross-compi.patch
> > +++ /dev/null
> > @@ -1,65 +0,0 @@
> > -From e21ce89f7ae6964f196086ff325d79e4a3b5acd8 Mon Sep 17 00:00:00 2001
> > -From: Jonathan Liu <net147@gmail.com>
> > -Date: Tue, 4 Jun 2013 06:04:44 -0700
> > -Subject: [PATCH 1/4] configure: Avoid use of AC_CHECK_FILE for cross c=
ompiling
> > -
> > -The AC_CHECK_FILE macro can't be used for cross compiling as it will
> > -result in "error: cannot check for file existence when cross compiling=
".
> > -Replace it with the AS_IF macro.
> > -
> > -Upstream-Status: Submitted
> > -http://lists.freedesktop.org/archives/mesa-dev/2013-June/040168.html
> > -
> > -Signed-off-by: Jonathan Liu <net147@gmail.com>
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ----
> > - configure.ac | 12 ++++++------
> > - 1 file changed, 6 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 70c598e..67b8c40 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -1630,8 +1630,8 @@ if test "x$enable_gallium_llvm" =3D xyes; then
> > -                 CLANG_LIBDIR=3D${LLVM_LIBDIR}
> > -             fi
> > -             CLANG_RESOURCE_DIR=3D$CLANG_LIBDIR/clang/${LLVM_VERSION}
> > --            AC_CHECK_FILE("$CLANG_RESOURCE_DIR/include/stddef.h",,
> > --                AC_MSG_ERROR([Could not find clang internal header st=
ddef.h in $CLANG_RESOURCE_DIR Use --with-clang-libdir to specify the correc=
t path to the clang libraries.]))
> > -+            AS_IF([test ! -f "$CLANG_RESOURCE_DIR/include/stddef.h"],
> > -+                [AC_MSG_ERROR([Could not find clang internal header s=
tddef.h in $CLANG_RESOURCE_DIR Use --with-clang-libdir to specify the corre=
ct path to the clang libraries.])])
> > -         fi
> > -     else
> > - 	MESA_LLVM=3D0
> > -@@ -1861,7 +1861,7 @@ if test "x$MESA_LLVM" !=3D x0; then
> > -     if test "x$with_llvm_shared_libs" =3D xyes; then
> > -         dnl We can't use $LLVM_VERSION because it has 'svn' stripped =
out,
> > -         LLVM_SO_NAME=3DLLVM-`$LLVM_CONFIG --version`
> > --        AC_CHECK_FILE("$LLVM_LIBDIR/lib$LLVM_SO_NAME.so", llvm_have_o=
ne_so=3Dyes,)
> > -+        AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.so"], [llvm_hav=
e_one_so=3Dyes])
> > -
> > -         if test "x$llvm_have_one_so" =3D xyes; then
> > -             dnl LLVM was built using auto*, so there is only one shar=
ed object.
> > -@@ -1869,8 +1869,8 @@ if test "x$MESA_LLVM" !=3D x0; then
> > -         else
> > -             dnl If LLVM was built with CMake, there will be one share=
d object per
> > -             dnl component.
> > --            AC_CHECK_FILE("$LLVM_LIBDIR/libLLVMTarget.so",,
> > --                    AC_MSG_ERROR([Could not find llvm shared librarie=
s:
> > -+            AS_IF([test ! -f "$LLVM_LIBDIR/libLLVMTarget.so"],
> > -+                    [AC_MSG_ERROR([Could not find llvm shared librari=
es:
> > - 	Please make sure you have built llvm with the --enable-shared option
> > - 	and that your llvm libraries are installed in $LLVM_LIBDIR
> > - 	If you have installed your llvm libraries to a different directory y=
ou
> > -@@ -1881,7 +1881,7 @@ if test "x$MESA_LLVM" !=3D x0; then
> > - 		--enable-opencl
> > - 	If you do not want to build with llvm shared libraries and instead w=
ant to
> > - 	use llvm static libraries then remove these options from your config=
ure
> > --	invocation and reconfigure.]))
> > -+	invocation and reconfigure.])])
> > -
> > -            dnl We don't need to update LLVM_LIBS in this case because=
 the LLVM
> > -            dnl install uses a shared object for each compoenent and w=
e have
> > ---
> > -1.8.2.1
> > -
> > diff --git a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisp=
layType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/0003-EG=
L-Mutate-NativeDisplayType-depending-on-config.patch
> > index 8a83f4b..30a3d98 100644
> > --- a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType=
-depending-on-config.patch
> > +++ b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType=
-depending-on-config.patch
> > @@ -1,7 +1,7 @@
> > -From 8d31ae23683394617c49301b039b3a069b9ea436 Mon Sep 17 00:00:00 2001
> > +From 06c1ba29de8a26fffb73ee99f0fc54c704e9fee4 Mon Sep 17 00:00:00 2001
> >   From: Daniel Stone <daniel@fooishbar.org>
> >   Date: Fri, 24 May 2013 17:20:27 +0100
> > -Subject: [PATCH 3/4] EGL: Mutate NativeDisplayType depending on config
> > +Subject: [PATCH 3/5] EGL: Mutate NativeDisplayType depending on config
> >  =20
> >   If we go through ./configure without enabling X11 anywhere, then set =
the
> >   fallback types for EGL NativeDisplay and friends, rather than assuming
> > @@ -13,36 +13,39 @@ https://bugs.freedesktop.org/show_bug.cgi?id=3D6495=
9)
> >   Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> >   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >   ---
> > - configure.ac                 |   5 ++
> > + configure.ac                 |   9 +++
> >    include/EGL/eglplatform.h    | 146 ---------------------------------=
----------
> >    include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++=
++++++++++
> > - 3 files changed, 151 insertions(+), 146 deletions(-)
> > + 3 files changed, 155 insertions(+), 146 deletions(-)
> >    delete mode 100644 include/EGL/eglplatform.h
> >    create mode 100644 include/EGL/eglplatform.h.in
> >  =20
> >   diff --git a/configure.ac b/configure.ac
> > -index 67b8c40..afc3217 100644
> > +index 2b4a374..d4c7a95 100644
> >   --- a/configure.ac
> >   +++ b/configure.ac
> > -@@ -1499,6 +1499,9 @@ EGL_PLATFORMS=3D"$egl_platforms"
> > +@@ -1565,12 +1565,20 @@ fi
> >   =20
> > - if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> > -     NEED_WINSYS_XLIB=3Dyes
> > + EGL_PLATFORMS=3D"$egl_platforms"
> > +
> > ++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> >   +    MESA_EGL_NO_X11_HEADERS=3D0
> >   +else
> >   +    MESA_EGL_NO_X11_HEADERS=3D1
> > - fi
> > ++fi
> > ++
> >    AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep '=
x11' >/dev/null 2>&1)
> >    AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | gr=
ep 'wayland' >/dev/null 2>&1)
> > -@@ -1512,6 +1515,7 @@ AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE=
_EGL_DRIVER_GLX" !=3D "x")
> > - AC_SUBST([EGL_NATIVE_PLATFORM])
> > - AC_SUBST([EGL_PLATFORMS])
> > - AC_SUBST([EGL_CFLAGS])
> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'd=
rm' >/dev/null 2>&1)
> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep =
'fbdev' >/dev/null 2>&1)
> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep '=
null' >/dev/null 2>&1)
> > +
> >   +AC_SUBST([MESA_EGL_NO_X11_HEADERS])
> > ++
> > + AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" !=
=3D "x")
> > + AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" !=3D=
 "x")
> >   =20
> > - AC_ARG_WITH([egl-driver-dir],
> > -     [AS_HELP_STRING([--with-egl-driver-dir=3DDIR],
> > -@@ -1991,6 +1995,7 @@ CXXFLAGS=3D"$CXXFLAGS $USER_CXXFLAGS"
> > +@@ -2042,6 +2050,7 @@ CXXFLAGS=3D"$CXXFLAGS $USER_CXXFLAGS"
> >   =20
> >    dnl Substitute the config
> >    AC_CONFIG_FILES([Makefile
> > diff --git a/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_comp=
iler-cross-compilation.patch b/meta/recipes-graphics/mesa/mesa/0004-glsl-fi=
x-builtin_compiler-cross-compilation.patch
> > deleted file mode 100644
> > index 460a274..0000000
> > --- a/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cr=
oss-compilation.patch
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -From ab38c97f057f739533a4e1fc9de51ea5f4e6242d Mon Sep 17 00:00:00 2001
> > -From: Jonathan Liu <net147@gmail.com>
> > -Date: Sat, 29 Jun 2013 11:37:20 +0200
> > -Subject: [PATCH 4/4] glsl: fix builtin_compiler cross-compilation
> > -
> > -The target libtool is used when building host binaries, which predicta=
bly
> > -doesn't work.
> > -
> > -Upstream-Status: Submitted https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D44618
> > -Signed-off-by: Jonathan Liu <net147@gmail.com>
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ----
> > - src/glsl/builtin_compiler/Makefile.am | 13 +++++++++++++
> > - 1 file changed, 13 insertions(+)
> > -
> > -diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_=
compiler/Makefile.am
> > -index e11a17f..8ebe0a2 100644
> > ---- a/src/glsl/builtin_compiler/Makefile.am
> > -+++ b/src/glsl/builtin_compiler/Makefile.am
> > -@@ -64,6 +64,8 @@ AM_CXXFLAGS =3D $(AM_CFLAGS)
> > - include ../Makefile.sources
> > -
> > - noinst_PROGRAMS =3D builtin_compiler
> > -+
> > -+if !CROSS_COMPILING
> > - noinst_LTLIBRARIES =3D libglslcore.la libglcpp.la
> > -
> > - libglcpp_la_SOURCES =3D					\
> > -@@ -73,6 +75,7 @@ libglcpp_la_SOURCES =3D					\
> > - libglslcore_la_SOURCES =3D				\
> > - 	$(BUILTIN_COMPILER_GENERATED_CXX_FILES)		\
> > - 	$(LIBGLSL_FILES)
> > -+endif
> > -
> > - builtin_compiler_SOURCES =3D \
> > - 	$(top_srcdir)/src/mesa/main/hash_table.c	\
> > -@@ -81,4 +84,14 @@ builtin_compiler_SOURCES =3D \
> > - 	$(top_srcdir)/src/mesa/program/symbol_table.c	\
> > - 	$(BUILTIN_COMPILER_CXX_FILES)			\
> > - 	$(GLSL_COMPILER_CXX_FILES)
> > -+
> > -+if CROSS_COMPILING
> > -+builtin_compiler_SOURCES +=3D \
> > -+	$(LIBGLCPP_GENERATED_FILES) \
> > -+	$(LIBGLCPP_FILES) \
> > -+	$(BUILTIN_COMPILER_GENERATED_CXX_FILES) \
> > -+	$(LIBGLSL_FILES)
> > -+builtin_compiler_CPPFLAGS =3D $(AM_CPPFLAGS)
> > -+else
> > - builtin_compiler_LDADD =3D libglslcore.la libglcpp.la
> > -+endif
> > ---
> > -1.8.2.1
> > -
> > diff --git a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-build=
s-gallium.patch b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-buil=
ds-gallium.patch
> > deleted file mode 100644
> > index 8c5984f..0000000
> > --- a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-galli=
um.patch
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -Upstream-Status: Submitted
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From 9e31e15ebb0adbf3cc0394c30cbc1ccd2b35a27f Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Fri, 28 Jun 2013 11:44:58 +0100
> > -Subject: [PATCH] build: fix out-of-tree builds in gallium/auxiliary
> > -
> > -The rules were writing files to e.g. util/u_indices_gen.py, but in an
> > -out-of-tree build this directory doesn't exist in the build directory.=
  So,
> > -create the directories just in case.
> > -
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ----
> > - src/gallium/auxiliary/Makefile.am |    4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/gallium/auxiliary/Makefile.am b/src/gallium/auxiliary=
/Makefile.am
> > -index f14279b..0c3e7ba 100644
> > ---- a/src/gallium/auxiliary/Makefile.am
> > -+++ b/src/gallium/auxiliary/Makefile.am
> > -@@ -38,13 +38,17 @@ libgallium_la_SOURCES +=3D \
> > - endif
> > -
> > - indices/u_indices_gen.c: $(srcdir)/indices/u_indices_gen.py
> > -+	mkdir --parents indices
> > - 	$(AM_V_GEN) $(PYTHON2) $< > $@
> > -
> > - indices/u_unfilled_gen.c: $(srcdir)/indices/u_unfilled_gen.py
> > -+	mkdir --parents indices
> > - 	$(AM_V_GEN) $(PYTHON2) $< > $@
> > -
> > - util/u_format_srgb.c: $(srcdir)/util/u_format_srgb.py
> > -+	mkdir --parents util
> > - 	$(AM_V_GEN) $(PYTHON2) $< > $@
> > -
> > - util/u_format_table.c: $(srcdir)/util/u_format_table.py $(srcdir)/uti=
l/u_format_pack.py $(srcdir)/util/u_format_parse.py $(srcdir)/util/u_format=
=2Ecsv
> > -+	mkdir --parents util
> > - 	$(AM_V_GEN) $(PYTHON2) $(srcdir)/util/u_format_table.py $(srcdir)/ut=
il/u_format.csv > $@
> > ---
> > -1.7.10.4
> > -
> > diff --git a/meta/recipes-graphics/mesa/mesa-9.1.6/0005-llvmpipe-remove=
-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/me=
sa/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-9.1.6/0005-llvmpipe-remove-=
the-power-of-two-sizeof-struct-cmd_b.patch
> > rename to meta/recipes-graphics/mesa/mesa/0005-llvmpipe-remove-the-powe=
r-of-two-sizeof-struct-cmd_b.patch
> > diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-gr=
aphics/mesa/mesa_9.2.2.bb
> > similarity index 34%
> > rename from meta/recipes-graphics/mesa/mesa_9.1.6.bb
> > rename to meta/recipes-graphics/mesa/mesa_9.2.2.bb
> > index b55fa02..60eba01 100644
> > --- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_9.2.2.bb
> > @@ -1,16 +1,11 @@
> >   require ${BPN}.inc
> >  =20
> >   SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.t=
ar.bz2 \
> > -           file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-=
compi.patch \
> >              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-w=
hen-HA.patch \
> > -           file://0003-EGL-Mutate-NativeDisplayType-depending-on-confi=
g.patch \
> > -           file://0004-glsl-fix-builtin_compiler-cross-compilation.pat=
ch \
> > -           file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-=
cmd_b.patch \
> > -           file://0005-fix-out-of-tree-builds-gallium.patch \
> >              file://0006-fix-out-of-tree-egl.patch \
> >              "
> >  =20
> > -SRC_URI[md5sum] =3D "443a2a352667294b53d56cb1a74114e9"
> > -SRC_URI[sha256sum] =3D "e632dff0acafad0a59dc208d16dedb37f7bd58f94c5d58=
c4b51912e41d005e3d"
> > +SRC_URI[md5sum] =3D "20887f8020db7d1736a01ae9cd5d8c38"
> > +SRC_URI[sha256sum] =3D "c78a5035233672844cf2492fe82dc10877e12026be227d=
04469d6ca6ac656a3d"
> >  =20
> >   S =3D "${WORKDIR}/Mesa-${PV}"
> > diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-grap=
hics/mesa/mesa_git.bb
> > index 6397ece..19d3e70 100644
> > --- a/meta/recipes-graphics/mesa/mesa_git.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> > @@ -5,15 +5,11 @@ DEFAULT_PREFERENCE =3D "-1"
> >   LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3Df69a4626e9efc40f=
a0d3cc3b02c9eacf"
> >  =20
> >   PR =3D "${INC_PR}.0"
> > -SRCREV =3D "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
> > -PV =3D "9.1.3+git${SRCPV}"
> > +SRCREV =3D "8f0742051e8501e737affb392996aef172034ca8"
> > +PV =3D "9.2.2+git${SRCPV}"
> >  =20
> >   SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa \
> > -           file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-=
compi.patch \
> >              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-w=
hen-HA.patch \
> > -           file://0003-EGL-Mutate-NativeDisplayType-depending-on-confi=
g.patch \
> > -           file://0004-glsl-fix-builtin_compiler-cross-compilation.pat=
ch \
> > -           file://0005-fix-out-of-tree-builds-gallium.patch \
> >              file://0006-fix-out-of-tree-egl.patch \
> >              "
> >  =20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJznikACgkQN1Ujt2V2gBwAawCdFyUvRoFfgbk82P4ByvESBU8G
wnwAn1GKn/11cBuyO+ls7VGq9ghOxAnb
=8YTd
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
