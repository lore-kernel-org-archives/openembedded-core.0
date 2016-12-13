Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id A76E971DE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 17:55:21 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so7826397vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Sv6mqmGKQJbcevCZtci0LDDJfTyS9bJ0bp2FAdWAkgw=;
	b=AG1c3RYLxvOk6xfB5Aa1KFc/uQHYSw8TljoXkHOvxG1VVoGMxuWHjEqTdCZykQp0da
	b64m377SokYIu4xGxnweGYNiXvxUz0zkJuBCTUzeA8ZQ9GFdB3z0woRX9ZLDCpuHgfQz
	WA6aNtNmvXakXE89kMXmK0xRmZ5XG60rOhobXOV2ficn14M+xdhnqfp9qs1oFhEv2+kw
	Gy0LxdtAEe6cleRPM0fQ0DmwiEGXESQrdRGqGPZ/vALC/NjhoMm1bExfC7cpMTXW9gH4
	i3m+3u59qzovBhSMfpj6RgliqsUKa8IBNdcNh5Rz6D6Ypp7cST1ljiaBpB7snsLFK++o
	kbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Sv6mqmGKQJbcevCZtci0LDDJfTyS9bJ0bp2FAdWAkgw=;
	b=eTIBUATVfJKmIrLcq8163K8xIMZPZ5l6UOYaBGJ1Uyg8LjMW8zDjrQIEdYygreVP/P
	R6edskEt/qFe0+n0B4x8QYAX9k0CK/WGDEKmAqTVJr65dCWaCsBH99KKxp/3NgfLmuGd
	uTYWfFqZ16iTvQ6Z6ENGafwyWZ8itkpDs4AVlsHnrPR4Y0/+XqUSx53eBBQvHzLuI3PK
	NeVpyjnYA3ChjW54enH/Qjl/WnvasXoBXo9S/uJ230E0C5MCToOXePvtkb9VJnm0gWGe
	T0tCTshoah14FjPMiKtAPOekeZki6tNqbMRLTIMkFdrK+ILEKJikQhX5S5tOi8rHAhpi
	xsCA==
X-Gm-Message-State: AKaTC00kJqAv9A2SM+/hqdeTISjBtHj+w1K6x06/piQacMY7vNUShkfs0EyAdLPrepUYMKhz7I6sFTyrZq74WA==
X-Received: by 10.176.0.180 with SMTP id 49mr81580709uaj.32.1481651722525;
	Tue, 13 Dec 2016 09:55:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 13 Dec 2016 09:54:52 -0800 (PST)
In-Reply-To: <1481620141-4369-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481620141-4369-1-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2016 09:54:52 -0800
Message-ID: <CAMKF1srCbFH5g2-RgJyYBqwH12U6zuCSrF7z-sPVqQkGUYQFiQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: move to tip of Emmanuele Bassi's fork
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
X-List-Received-Date: Tue, 13 Dec 2016 17:55:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 1:09 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * fixes starting of kde-plasma for wayland:
>   | No provider of glGenFramebuffers found.  Requires one of:
>   |     Desktop OpenGL 3.0
>   |     GL extension "GL_ARB_framebuffer_object"
>   |     OpenGL ES 2.0
>   |     GL extension "GL_EXT_framebuffer_object"
>   | /usr/bin/startplasmacompositor: line 223:   787 Aborted              =
   (core dumped) /usr/bin/kwin_wayland --xwayland --libinput --exit-with-se=
ssion=3D/usr/libexec/startplasma
> * fixes some strange behavour on kde-plasma for x11: Black screen on logo=
ut /
>   Lock screen does not return.
> * Eric Anholt seems to have passed maintainership of libepoxy over to
>   Yaron Cohen-Tal. I agree that things didn't really turn out well since =
then [1].
> * 0001-select-platforms-based-on-configuration-results.patch and
>   0002-add-an-option-to-disable-glx-support.patch wre replaced by
>   0001-make-x11-support-optional.patch
>
> [1] https://github.com/ebassi/libepoxy/commit/8dead45cb366bf5c08539bef2cc=
aa36b80eb1483

Why do we change to a different fork ? perhaps its worth mentioning in comm=
it

>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ....patch =3D> 0001-make-x11-support-optional.patch} | 87 +++++++++-----=
--------
>  ...0002-add-an-option-to-disable-glx-support.patch | 42 -----------
>  meta/recipes-graphics/libepoxy/libepoxy_git.bb     |  9 +--
>  3 files changed, 40 insertions(+), 98 deletions(-)
>  rename meta/recipes-graphics/libepoxy/libepoxy/{0001-select-platforms-ba=
sed-on-configuration-results.patch =3D> 0001-make-x11-support-optional.patc=
h} (55%)
>  delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-o=
ption-to-disable-glx-support.patch
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platform=
s-based-on-configuration-results.patch b/meta/recipes-graphics/libepoxy/lib=
epoxy/0001-make-x11-support-optional.patch
> similarity index 55%
> rename from meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms=
-based-on-configuration-results.patch
> rename to meta/recipes-graphics/libepoxy/libepoxy/0001-make-x11-support-o=
ptional.patch
> index 674c8e8..7b08fd1 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based=
-on-configuration-results.patch
> +++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-make-x11-support-optio=
nal.patch
> @@ -1,38 +1,52 @@
> -From 3a93150bc0aec86afdb7d053247dc2448925e09a Mon Sep 17 00:00:00 2001
> +From f08cd639eb731c0d8fdbbba9e4beb1041c07e0c2 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Wed, 6 May 2015 10:45:22 +0200
> -Subject: [PATCH 1/2] select platforms based on configuration results
> +Date: Tue, 13 Dec 2016 00:01:47 +0100
> +Subject: [PATCH] make x11 support optional
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> -Upstream-Status: Submitted [1]
> +X11 support is build by default if x11 libs are found. This can be disab=
led
> +by --disable-glx.
> +
> +A similar (bit too overenthusiastic) pull request was sent long time ago=
 [1]
> +before we saw cmake trouble. There was a follow up PR in [2] but I canno=
t test
> +it so took only very common parts.
> +
> +Upstream-Status: Submitted [3]
>
>  [1] https://github.com/anholt/libepoxy/pull/52
> +[2] https://github.com/anholt/libepoxy/pull/81
> +[3] https://github.com/ebassi/libepoxy/pull/1
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>  ---
> - configure.ac          | 13 +++++--------
> - src/dispatch_common.c |  9 ++++++---
> - src/dispatch_common.h |  9 +++++----
> - 3 files changed, 16 insertions(+), 15 deletions(-)
> + configure.ac          | 18 ++++++++++--------
> + src/dispatch_common.c |  5 ++++-
> + src/dispatch_common.h |  3 ++-
> + 3 files changed, 16 insertions(+), 10 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index a52fc58..bdd70da 100644
> +index 2d67726..3df9966 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -58,6 +58,10 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
> +@@ -58,6 +58,15 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
>   # uintptr_t to a void *") by default.  Kill that.
>   XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
>
> -+PKG_CHECK_MODULES(X11, [x11], [x11=3Dyes], [x11=3Dno])
> ++AC_ARG_ENABLE([glx],
> ++                [AS_HELP_STRING([--disable-glx],
> ++                [disable if you do not want x11/glx support])],
> ++                [enable_glx=3D$enableval],
> ++                [enable_glx=3Dyes]
> ++             )
>  +
> -+AM_CONDITIONAL(HAVE_X11, test x$x11 =3D xyes)
> ++PKG_CHECK_MODULES(X11, [x11], [x11=3D$enable_glx], [x11=3Dno])
>  +
>   has_znow=3Dyes
>
>   case $host_os in
> -@@ -86,7 +90,7 @@ case $host_os in
> +@@ -86,7 +95,7 @@ case $host_os in
>           ;;
>       *)
>           build_egl=3Dyes
> @@ -41,7 +55,7 @@ index a52fc58..bdd70da 100644
>           build_wgl=3Dno
>           # On platforms with dlopen, we load everything dynamically and
>           # don't link against a specific window system or GL implementat=
ion.
> -@@ -144,13 +148,6 @@ esac
> +@@ -144,13 +153,6 @@ esac
>
>   AC_SUBST([VISIBILITY_CFLAGS])
>
> @@ -56,10 +70,10 @@ index a52fc58..bdd70da 100644
>
>   AC_CONFIG_FILES([
>  diff --git a/src/dispatch_common.c b/src/dispatch_common.c
> -index 4e34d6e..2ab84ed 100644
> +index c0c7156..a2699d2 100644
>  --- a/src/dispatch_common.c
>  +++ b/src/dispatch_common.c
> -@@ -615,10 +615,13 @@ epoxy_get_proc_address(const char *name)
> +@@ -643,9 +643,12 @@ epoxy_get_proc_address(const char *name)
>   #elif defined(__APPLE__)
>       return epoxy_gl_dlsym(name);
>   #else
> @@ -69,29 +83,15 @@ index 4e34d6e..2ab84ed 100644
>  -    } else {
>  +    } else
>  +#endif /* PLATFORM_HAS_GLX */
> - #if PLATFORM_HAS_EGL
>  +    {
> + #if PLATFORM_HAS_EGL
>           GLenum egl_api =3D epoxy_egl_get_current_gl_context_api();
>
> -         switch (egl_api) {
> -@@ -628,10 +631,10 @@ epoxy_get_proc_address(const char *name)
> -         case EGL_NONE:
> -             break;
> -         }
> --#endif
> -     }
> -+#endif /* PLATFORM_HAS_EGL */
> -     errx(1, "Couldn't find current GLX or EGL context.\n");
> --#endif
> -+#endif /* _WIN32 | __APPLE__*/
> - }
> -
> - void
>  diff --git a/src/dispatch_common.h b/src/dispatch_common.h
> -index 6b8503a..82681e4 100644
> +index 676a4d5..1c487eb 100644
>  --- a/src/dispatch_common.h
>  +++ b/src/dispatch_common.h
> -@@ -21,12 +21,13 @@
> +@@ -21,6 +21,7 @@
>    * IN THE SOFTWARE.
>    */
>
> @@ -99,30 +99,15 @@ index 6b8503a..82681e4 100644
>   #include <stdbool.h>
>
>   #ifdef _WIN32
> - #define PLATFORM_HAS_EGL 0
> - #define PLATFORM_HAS_GLX 0
> --#define PLATFORM_HAS_WGL 1
> -+#define PLATFORM_HAS_WGL BUILD_WGL
> - #define EPOXY_IMPORTEXPORT __declspec(dllexport)
> - #elif defined(__APPLE__)
> - #define PLATFORM_HAS_EGL 0
> -@@ -34,13 +35,13 @@
> - #define PLATFORM_HAS_WGL 0
> - #define EPOXY_IMPORTEXPORT
> - #elif defined(ANDROID)
> --#define PLATFORM_HAS_EGL 1
> -+#define PLATFORM_HAS_EGL BUILD_EGL
> - #define PLATFORM_HAS_GLX 0
> - #define PLATFORM_HAS_WGL 0
> +@@ -40,7 +41,7 @@
>   #define EPOXY_IMPORTEXPORT
>   #else
> --#define PLATFORM_HAS_EGL 1
> + #define PLATFORM_HAS_EGL 1
>  -#define PLATFORM_HAS_GLX 1
> -+#define PLATFORM_HAS_EGL BUILD_EGL
>  +#define PLATFORM_HAS_GLX BUILD_GLX
>   #define PLATFORM_HAS_WGL 0
>   #define EPOXY_IMPORTEXPORT
>   #endif
>  --
> -1.9.3
> +2.5.5
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-t=
o-disable-glx-support.patch b/meta/recipes-graphics/libepoxy/libepoxy/0002-=
add-an-option-to-disable-glx-support.patch
> deleted file mode 100644
> index 262d684..0000000
> --- a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disab=
le-glx-support.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 24868cbfb9dda5f6929dd277c47d35df016e8754 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Wed, 6 May 2015 11:05:48 +0200
> -Subject: [PATCH 2/2] add an option to disable glx support
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -this option would help us in yocto to get deterministic build results
> -
> -Upstream-Status: Submitted [1]
> -
> -[1] https://github.com/anholt/libepoxy/pull/52
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - configure.ac | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index bdd70da..6c7153d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -58,7 +58,14 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
> - # uintptr_t to a void *") by default.  Kill that.
> - XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
> -
> --PKG_CHECK_MODULES(X11, [x11], [x11=3Dyes], [x11=3Dno])
> -+AC_ARG_ENABLE([glx],
> -+                [AS_HELP_STRING([--disable-glx],
> -+                              [disable if you don't want x11/glx suppor=
t])],
> -+                [],
> -+                [enable_glx=3Dyes]
> -+             )
> -+
> -+PKG_CHECK_MODULES(X11, [x11], [x11=3D$enable_glx], [x11=3Dno])
> -
> - AM_CONDITIONAL(HAVE_X11, test x$x11 =3D xyes)
> -
> ---
> -1.9.3
> -
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipe=
s-graphics/libepoxy/libepoxy_git.bb
> index 6c247cc..54f9ef9 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> @@ -7,13 +7,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D58ef4c80d401=
e07bd9ee8b6b58cf464b"
>
>
>  SRC_URI =3D " \
> -    git://github.com/anholt/libepoxy.git \
> -    file://0001-select-platforms-based-on-configuration-results.patch \
> -    file://0002-add-an-option-to-disable-glx-support.patch \
> +    git://github.com/ebassi/libepoxy.git \
> +    file://0001-make-x11-support-optional.patch \
>      file://no-need-for-python3.patch \
>  "
> -SRCREV=3D"e2c33af5bfcfc9d168f9e776156dd47c33f428b3"
> -PV =3D "1.3.1"
> +SRCREV=3D"269b4690b9222f53f24c3b97becebab8f8f6bbcb"
> +PV =3D "1.3.1+git${SRCPV}"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

