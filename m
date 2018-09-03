Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 943847523B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 16:52:11 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n6-v6so1190162qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 09:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3kFtvZqXD+KuQoiLNyahh9jiZbuoZFHhs4wi/URjWvE=;
	b=KEvocKys99WWB/iUEEug/sg86v2lLeMykZNbOrXGe6cKy0vwE7Bu0ImnLHheNMbCBa
	EvAuLuh5RVwBA6xX8zl3PUuW49NtntLgN7G0IubFrvgI4fzoZJzJ8s1/jz2sU7WHFwqk
	XX5vJUdwRKwqBc9YNrDf65ymMcgdCcfZwkI8WGlPwhWp7WBqbAxAK+Ai5uSLj4hgvdDa
	/ALY2as8fvyq6YznpgruQdeiBbe40kt6GdvY5RHSDSZbqCfq7QrCEIWF9p5QCJlK4+hu
	62OZk+V3mmJ3PG3J32P9P3Ou8XWX4Dn4mX+hABm9SOY3GFhHbGplFE9YsMc8oYXDGMxf
	ucug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3kFtvZqXD+KuQoiLNyahh9jiZbuoZFHhs4wi/URjWvE=;
	b=R6YW3iSMxXbH5uP6xzEvunLAeVUGJXhAGotUzMPYUOc8CwuL3ho708Q7Y0N0PusxLv
	0gkEhQtk7HOL5Bv4LiRrgfRBGsuzRMk0YpdX9mRSBS8hT+TmknXoT3ZDHUEXAxMAOP+s
	5dST5PKojdOi36BDWk8qX2RY8PPi/dgNCL09ACzRXXtX2X3AUrG5ZAwPTVEKq0TEzqjd
	ktOuXqUFzOrGpGwGzS5UVCB4zTxvlikyVXOXLRtXav6ccio1SH0EJQ7QXHjRt7M2YsNA
	dpKBWwgoK4hYDdef+7FlzYUdwVrf5M1LXVuvwIxEXiV6VJCdTs0IZU5RjtqGX5QzoPlt
	oCZA==
X-Gm-Message-State: APzg51BFkjRgGV6slZeWdCfMn5sQHg1xbL/YivuG5IG6R0Gtxn08Zh7u
	0kTHreVrFxjHWLoByzVGEENZLKBreqP/2tcAcsc=
X-Google-Smtp-Source: ANB0VdZtW4/nENEJcnRo5Nd9qakN9tVMS431Me901TJaix3zdHJIe1n48pyTJcXkMYCabut4ZnWaAvUAiphWj92F8Q0=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr27684744qtq.161.1535993532189; 
	Mon, 03 Sep 2018 09:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
	<1535967326-32322-2-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1535967326-32322-2-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Sep 2018 09:51:45 -0700
Message-ID: <CAMKF1sqxZetsm-bVzF8CtjWJj8hd6n=rYcB12EmBTS7f9apXoA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] weston: fix build failure with --disable-egl
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
X-List-Received-Date: Mon, 03 Sep 2018 16:52:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 3, 2018 at 2:35 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Backport a patch from upstream to fix build failure
> with --disable-egl
> [snip]
> |weston-4.0.0/clients/simple-dmabuf-drm.c:783:30: error:
> 'EGL_NO_DISPLAY' undeclared (first use in this function)
> [snip]
>

LGTM

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ple-dmabuf-drm-fix-build-with-disable-egl.patch | 71 ++++++++++++++++++++++
>  meta/recipes-graphics/wayland/weston_4.0.0.bb      |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-simple-dmabuf-drm-fix-build-with-disable-egl.patch
>
> diff --git a/meta/recipes-graphics/wayland/weston/0001-simple-dmabuf-drm-fix-build-with-disable-egl.patch b/meta/recipes-graphics/wayland/weston/0001-simple-dmabuf-drm-fix-build-with-disable-egl.patch
> new file mode 100644
> index 0000000..4820124
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-simple-dmabuf-drm-fix-build-with-disable-egl.patch
> @@ -0,0 +1,71 @@
> +From 2b2d911ef088c430e9bdd135daadf1123d474b24 Mon Sep 17 00:00:00 2001
> +From: Emilio Pozuelo Monfort <pochu27@gmail.com>
> +Date: Mon, 3 Sep 2018 15:42:10 +0800
> +Subject: [PATCH] simple-dmabuf-drm: fix build with --disable-egl
> +
> +Just rely on getting the supported formats through the dmabuf
> +extension.
> +
> +Signed-off-by: Emilio Pozuelo Monfort <emilio.pozuelo@collabora.co.uk>
> +Reviewed-by: Daniel Stone <daniels@collabora.com>
> +
> +Upstream-Status: Backport [https://anongit.freedesktop.org/git/wayland/weston.git]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + clients/simple-dmabuf-drm.c | 11 -----------
> + configure.ac                |  2 +-
> + 2 files changed, 1 insertion(+), 12 deletions(-)
> +
> +diff --git a/clients/simple-dmabuf-drm.c b/clients/simple-dmabuf-drm.c
> +index 2975f3a..88ec451 100644
> +--- a/clients/simple-dmabuf-drm.c
> ++++ b/clients/simple-dmabuf-drm.c
> +@@ -53,7 +53,6 @@
> +
> + #include <wayland-client.h>
> + #include "shared/zalloc.h"
> +-#include "shared/platform.h"
> + #include "xdg-shell-unstable-v6-client-protocol.h"
> + #include "fullscreen-shell-unstable-v1-client-protocol.h"
> + #include "linux-dmabuf-unstable-v1-client-protocol.h"
> +@@ -763,7 +762,6 @@ static struct display *
> + create_display(int opts, int format)
> + {
> +       struct display *display;
> +-      const char *extensions;
> +
> +       display = malloc(sizeof *display);
> +       if (display == NULL) {
> +@@ -776,15 +774,6 @@ create_display(int opts, int format)
> +       display->req_dmabuf_immediate = opts & OPT_IMMEDIATE;
> +       display->req_dmabuf_modifiers = (format == DRM_FORMAT_NV12);
> +
> +-      /*
> +-       * hard code format if the platform egl doesn't support format
> +-       * querying / advertising.
> +-       */
> +-      extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
> +-      if (extensions && !weston_check_egl_extension(extensions,
> +-                              "EGL_EXT_image_dma_buf_import_modifiers"))
> +-              display->xrgb8888_format_found = 1;
> +-
> +       display->registry = wl_display_get_registry(display->display);
> +       wl_registry_add_listener(display->registry,
> +                                &registry_listener, display);
> +diff --git a/configure.ac b/configure.ac
> +index 48cf5cb..e6e9a3f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -386,7 +386,7 @@ AC_ARG_ENABLE(simple-dmabuf-drm-client,
> +                              [do not build the simple dmabuf drm client]),,
> +               enable_simple_dmabuf_drm_client="auto")
> + if ! test "x$enable_simple_dmabuf_drm_client" = "xno"; then
> +-  PKG_CHECK_MODULES(SIMPLE_DMABUF_DRM_CLIENT, [wayland-client libdrm egl], [have_simple_dmabuf_libs=yes],
> ++  PKG_CHECK_MODULES(SIMPLE_DMABUF_DRM_CLIENT, [wayland-client libdrm], [have_simple_dmabuf_libs=yes],
> +                   [have_simple_dmabuf_libs=no])
> +
> +   PKG_CHECK_MODULES(LIBDRM_PLATFORM_FREEDRENO, [libdrm_freedreno],
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/wayland/weston_4.0.0.bb b/meta/recipes-graphics/wayland/weston_4.0.0.bb
> index 3d192cf..61e2881 100644
> --- a/meta/recipes-graphics/wayland/weston_4.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_4.0.0.bb
> @@ -11,6 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-make-error-portable.patch \
>             file://xwayland.weston-start \
>             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> +           file://0001-simple-dmabuf-drm-fix-build-with-disable-egl.patch \
>  "
>  SRC_URI[md5sum] = "33709aa4d5916f89643fca0fc0064b39"
>  SRC_URI[sha256sum] = "a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58"
> --
> 2.7.4
>

