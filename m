Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.15600.1593286323047671150
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 12:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u73L5HQk;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id x14so4090867uao.7
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQnDwXu6fPNKr5zkahVjXSbve3COcKZ8MB4qEyZAKoo=;
        b=u73L5HQkSse7z4LmnQHILCYlNTly56NbKTXyBvzW2OqMOJlpPba6TfQWINsQry+442
         ubZRsIkaA6/2A/1mgU6K0sdQchJNLaOrDv5NnjWBodyURVU5LEizj6YPB14BpNgjwcuJ
         wGbhGLxDaYIV54NrnwCG3xk/eL8jsVkw+2uSLJNVlo9OStbGuEpu3v8g2Nth95ALq+4W
         QgfXnlX8E0m+SJgIb9z6Ww1XNrrSSSc4bxBXNHVNOaUOMl5XoVyBGfSpfXY80XAMAxpe
         v6JvUbCexAwgwwCpvJH23GJyPukok3gffr1LKX2Aw05uqC+hXHJe2uOzIMWNloVZSJ9T
         uILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQnDwXu6fPNKr5zkahVjXSbve3COcKZ8MB4qEyZAKoo=;
        b=kjx5msM52iQtd8OaDEJ4uiurrue+xeKOGqZf61oPcIMVrSEO7OGboVQxmO1zX1QJxH
         AHAqVXDhKT1hokG4x0e7vXQB8hIRpSosktQ4AHha2DOFiauRn4zsExDIbRyHaUW9emvn
         Vn07zH1EoN3/rgMUKseltcfKG7BbfLG6rF3EBPir1xRHf8KlUZmRmnHXNIobvwYkIhHh
         u/pENvqw5d9G4jBU/CCPpHZFgA4FmxLhAA8EOJbPGuXaE7vqsig9tl+hUCUyjVaf/wmd
         2AFu9Gt8C3LtPR9XgKtFLgdrTKxRme8LKzGmRc+DHOOOQZKEpjVcQkwlFqfD3yus7ZLv
         6fhg==
X-Gm-Message-State: AOAM533S9L+WcwMekDCfji1bHFnE/l53FKtwYOBhJC4q+3I0imQS/QRp
	1PDmQSwPI96GQABYKlvmXBdBFWjbNgvUWb4iyb8=
X-Google-Smtp-Source: ABdhPJz7WpHtvulAaxwKp8cJwxSVmUv3BaITbytd+uYY6m/oSSFjALpVCcbpJCwSPMEaJ9D8b0PzdfjdE2T036+cN8o=
X-Received: by 2002:ab0:69c4:: with SMTP id u4mr6263809uaq.5.1593286322080;
 Sat, 27 Jun 2020 12:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200627113417.25595-1-max.krummenacher@toradex.com>
In-Reply-To: <20200627113417.25595-1-max.krummenacher@toradex.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 27 Jun 2020 21:31:52 +0200
Message-ID: <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com>
Subject: Re: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Hello Max,

On Sat, Jun 27, 2020 at 1:35 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
> Change configure.ac so that eglmesaext.h is only included if it actually
> exists.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  ...figure.ac-don-t-require-eglmesaext.h.patch | 77 +++++++++++++++++++
>  meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb |  1 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
>
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
> new file mode 100644
> index 0000000000..16ab2d7797
> --- /dev/null
> +++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
> @@ -0,0 +1,77 @@
> +From ca94946110f4aaeeb0cbc75e11a619b21f295056 Mon Sep 17 00:00:00 2001
> +From: Max Krummenacher <max.krummenacher@toradex.com>
> +Date: Thu, 25 Jun 2020 11:27:40 +0000
> +Subject: [PATCH] configure.ac: don't require eglmesaext.h
> +
> +E.g. the Vivante EGL implementation does not provide eglmesaext.h.
> +
> +The commit moves the check for header file existence outside of the
> +check for existence of a egl packageconfig and makes the existence
> +of eglmesaext.h optional.
> +
> +fixes commit fb1acfec ("Fix building against libglvnd-provided EGL headers")
> +Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cogl/-/merge_requests/28]
> +Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> +---
> + configure.ac | 36 +++++++++++++++++-------------------
> + 1 file changed, 17 insertions(+), 19 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 12798e9f..f7fa40e2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1212,22 +1212,6 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
> +         PKG_CHECK_EXISTS([egl],
> +           [COGL_PKG_REQUIRES="$COGL_PKG_REQUIRES egl"],
> +           [
> +-            AC_CHECK_HEADERS(
> +-              [EGL/egl.h],
> +-              [],
> +-              [AC_MSG_ERROR([Unable to locate required EGL headers])])
> +-            AC_CHECK_HEADERS(
> +-              [EGL/eglext.h],
> +-              [],
> +-              [AC_MSG_ERROR([Unable to locate required EGL headers])],
> +-              [#include <EGL/egl.h>])
> +-            AC_CHECK_HEADERS(
> +-              [EGL/eglmesaext.h],
> +-              [],
> +-              [AC_MSG_ERROR([Unable to locate required EGL headers])],
> +-              [#include <EGL/egl.h>
> +-#include <EGL/eglext.h>])
> +-
> +             AC_CHECK_LIB(EGL, [eglInitialize],
> +               [COGL_EXTRA_LDFLAGS="$COGL_EXTRA_LDFLAGS -lEGL"],
> +               [AC_MSG_ERROR([Unable to locate required EGL library])])
> +@@ -1236,9 +1220,23 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
> +           ]
> +           )
> +
> +-        COGL_EGL_INCLUDES="#include <EGL/egl.h>
> +-#include <EGL/eglext.h>
> +-#include <EGL/eglmesaext.h>"
> ++        AC_CHECK_HEADERS(
> ++          [EGL/egl.h],
> ++          [COGL_EGL_INCLUDES="#include <EGL/egl.h>"],
> ++          [AC_MSG_ERROR([Unable to locate required EGL headers])])
> ++        AC_CHECK_HEADERS(
> ++          [EGL/eglext.h],
> ++          [COGL_EGL_INCLUDES="$COGL_EGL_INCLUDES
> ++#include <EGL/eglext.h>"],
> ++          [AC_MSG_ERROR([Unable to locate required EGL headers])],
> ++          [$COGL_EGL_INCLUDES])
> ++        AC_CHECK_HEADERS(
> ++          [EGL/eglmesaext.h],
> ++          [COGL_EGL_INCLUDES="$COGL_EGL_INCLUDES
> ++#include <EGL/eglmesaext.h>"],
> ++          [],
> ++          [$COGL_EGL_INCLUDES])
> ++
> +         AC_SUBST([COGL_EGL_INCLUDES])
> +       ])
> +
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> index 78f6b0e7a3..b9446fab38 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> +++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> @@ -1,5 +1,6 @@
>  require cogl-1.0.inc
>
> +SRC_URI += "file://0001-configure.ac-don-t-require-eglmesaext.h.patch"
>  SRC_URI[archive.sha256sum] = "a805b2b019184710ff53d0496f9f0ce6dcca420c141a0f4f6fcc02131581d759"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
> --
> 2.20.1
>

This patch fails to build with following errors in do_configure:

| checking for wayland-egl >= 1.0.0 wayland-client >= 1.0.0... yes
| checking EGL/egl.h usability... no
| checking EGL/egl.h presence... no
| checking for EGL/egl.h... no
| configure: error: Unable to locate required EGL headers
| WARNING: exit code 1 from a shell command.


> 


-- 
Regards,
Andrey.
