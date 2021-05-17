Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.21513.1621268835651444328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 09:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dKEdD2Xu;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id m13so5233302qtk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wg8SevVfQDzkHTwT0E7YtE+FtmrBX8e6W4bR+IZLkz4=;
        b=dKEdD2Xu/Ko1rp8s5ReH2sB/Sbk2KEQRt0Lx9lC2zzC0mT2bZp/jNvhucuYGHYgKQg
         wqCkXbVQ2FbIs68eXBPF1uG65xhB8g1FSCqr6j4FRlPSJGy8PShF+WIkY+GnwIf+UU/R
         OCVC0M7EhnMKD3tShuO84kek49XJuMVIACZdfQxi4WHatMwgU9gXG4daj6unjWR5AwDM
         hbS43p0UlLOXT4W9qqOwTsUJO3wHCI6S1DtL/tS/NoyWS8lE5IHAOpdaPe8bN0w0oViU
         VZQLSjcOi51M5Qn5/LIG4+gTDbuXht57bwZfSfdh+aRYpvABiQpm/2Y0ckQlHOVjxLuB
         mu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wg8SevVfQDzkHTwT0E7YtE+FtmrBX8e6W4bR+IZLkz4=;
        b=Z0QAcpZZaPJspZakkF6TJ4q51QbG/K4JJ4C7SYVaNI9Qe4egyb6qYRrhoZLd/CBcbx
         4cVamLDOP8/iM09tANcvLOgNd+/XmE+7giW8g3DuUOwV0nn1WSdzxWR+iz7X7L9uGIGg
         4LtvXGNAqosVzSVEDYH/FE8D4cX6mZjsstqtyis9B+ZQcYZR6a6xGf1ehx7fNn7qM0pV
         MDhGu4EFCunnzRwrEBvnT1TOjL+WOuewpxduzH2vcs0f0TvmtAyL0jziceMFZ72gftLK
         Iji2XTQC5CwYyATcWwfUgu11tdBSvvOQiENzLQg9JOP0RWOSRuKr/j4JnSs0tHkZQFqx
         m4aA==
X-Gm-Message-State: AOAM532BCLO+qV3nzjMx6mw5h4DBTtU54JY5Kytnu6rx8PG9VBCAZj5B
	iptuedbyDGfdgjgB4Ik/x279xdSpSQHOTAvN56k=
X-Google-Smtp-Source: ABdhPJwFXqjk8zSOsVZBqOVNSxBf5zLGbGcIwgB/gq4PiCAbRQPI1xZHLXlXbQZ/2E/bzm+7FpMmzikap8h9cZ0U2Lw=
X-Received: by 2002:ac8:5d93:: with SMTP id d19mr295067qtx.289.1621268834726;
 Mon, 17 May 2021 09:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org> <20210516223247.2401235-11-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210516223247.2401235-11-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 17 May 2021 09:26:48 -0700
Message-ID: <CAMKF1spmyAgfPgASqQkU9GhLNdjB2FrGXQFR3bjs2EGHzD_9Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/27] python3-setuptools: upgrade 56.0.0 -> 56.2.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

I am seeing a failure in meta-python with core/master-next

https://errors.yoctoproject.org/Errors/Details/581298/

is this related to this upgrade ?

On Sun, May 16, 2021 at 3:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
>  ...hon3-setuptools_56.0.0.bb => python3-setuptools_56.2.0.bb} | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_56.0.0.bb => python3-setuptools_56.2.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> index 680edbe704b..59e278d1aed 100644
> --- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> +++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> @@ -1,4 +1,4 @@
> -From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
> +From d6339e6b3de0f3be5ca50541d82f99d827700f45 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 17 Jul 2018 10:13:38 +0800
>  Subject: [PATCH] conditionally do not fetch code by easy_install
> @@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 5 insertions(+)
>
>  diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
> -index eeb21b5..eca1edd 100644
> +index 45adb6a..9ac3342 100644
>  --- a/setuptools/command/easy_install.py
>  +++ b/setuptools/command/easy_install.py
>  @@ -636,6 +636,11 @@ class easy_install(Command):
> diff --git a/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
> index 07a82ad21be..bb852d06522 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
> @@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>
>  SRC_URI += "file://0001-change-shebang-to-python3.patch"
>
> -SRC_URI[sha256sum] = "08a1c0f99455307c48690f00d5c2ac2c1ccfab04df00454fef854ec145b81302"
> +SRC_URI[sha256sum] = "7bb5652625e94e73b9358b7ed8c6431b732e80cf31f4e0972294c64f0e5b849e"
>
>  DEPENDS += "${PYTHON_PN}"
>
> --
> 2.30.2
>
>
> 
>
