Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web12.16499.1592081063395901322
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2020 13:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s0/jbVG9;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id t132so7275633vst.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2020 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vHWIGM3+KHsUfUI1BLafNFseoHuxYrBgkLTB+ReUyA=;
        b=s0/jbVG9pdbaw8yn1kG1r2bSmtfqXwawLqeP+CXp3PsW/yk6YxEL1BKfMDxeejmWjY
         hRbLhPDlekmnqmiqy20idRXhXp4EGJr0u4bBrbzEJ7dGqoZ65j9G8eJN59liAokVMHzg
         7WbQN9tn3KefZLA9oH/6tMREB7mymjIvDMswOVFEWh+KdthNYcVA9eijjknbfaphmS8H
         ah2sBVn71aMPCDD9IXdMwGtjUsAgF11vv9+b3s/m7Q/Bl4bdAR3g2AmQqdSHg6nqcyTu
         bj9uXnE4R8k008tUmxCQ+C0jybSrpH96KYD20JbWvNnI5ZW020/WxXC4iilIqs/7IJAt
         ucxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vHWIGM3+KHsUfUI1BLafNFseoHuxYrBgkLTB+ReUyA=;
        b=kcm6TmcZR2qLBCz7mvllSpYqO6DG5n4cVTzP0oFlyUt5UchptSbuS5PkcmuZgtqUB1
         9UO011K/CBnR02UKoBlqKZH+N+ofzAsoIyZmwBELiM0aiMrPzs6jVOzymS3ks2z14FZS
         a9S9lZc5/XsFx2LxAFCCW6rK8Pq8KBquQDqfTaJusiCMsV8Y0RJoxRQWSEXbYAEiXQcw
         k0qKYlPSkeBTuk3elufam35rm0SRIX91whm2Mrk/bc6jHyO0cdN+LrcU91kuVul3ScEW
         ++Dv7wC/bH1/BNTB88mTzOlyThq1LZ+/w6GhkHteqCkR2kYGN95DIWyX8kJutTzRWhIp
         DLZw==
X-Gm-Message-State: AOAM5302oKdmfnKiQFKPxXSQLZRzPM4a5+GnqAsBgKDfjTFxLBtwr3NS
	lkx2LYuwnhIflKg58O//xga8yfYrd6HTYMWDirY=
X-Google-Smtp-Source: ABdhPJwUtt8WklE9/5ejw4T2Vy0l80U8K45NsM0wbq+hBhnFCIyICoA6qkOoUBxWp94eQ00hj9Dhrb7oBxrDhQlIDB4=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr8534923vsq.123.1592081062508;
 Sat, 13 Jun 2020 13:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200608074659.7051-1-alex.kanavin@gmail.com> <20200608074659.7051-15-alex.kanavin@gmail.com>
In-Reply-To: <20200608074659.7051-15-alex.kanavin@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 13 Jun 2020 22:44:12 +0200
Message-ID: <CAHtQpK4zcKXmF0hfDkVmXy_69UkvEbhYhMWAoS3AgLrm6FGhpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/42] cogl-1.0: upgrade 1.22.6 -> 1.22.8
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Alex,

On Mon, Jun 8, 2020 at 9:48 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb | 6 ------
>  meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb | 5 +++++
>  2 files changed, 5 insertions(+), 6 deletions(-)
>  delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
>  create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
>
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
> deleted file mode 100644
> index 86bbdbff69..0000000000
> --- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require cogl-1.0.inc
> -
> -SRC_URI[archive.md5sum] = "7bcc01edb5462d4d08d01bf893feddb0"
> -SRC_URI[archive.sha256sum] = "6d134bd3e48c067507167c001200b275997fb9c68b08b48ff038211c8c251b75"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> new file mode 100644
> index 0000000000..78f6b0e7a3
> --- /dev/null
> +++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> @@ -0,0 +1,5 @@
> +require cogl-1.0.inc
> +
> +SRC_URI[archive.sha256sum] = "a805b2b019184710ff53d0496f9f0ce6dcca420c141a0f4f6fcc02131581d759"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
> --
> 2.26.2
>

I'm seeing a lot of errors like the one below after this upgrade,
reverting back to 1.22.6 seems to fix those...

In file included from ../../cogl-1.22.8/cogl/cogl-egl-private.h:34,
|                  from ../../cogl-1.22.8/cogl/winsys/cogl-winsys-private.h:48,
|                  from ../../cogl-1.22.8/cogl/cogl-fence-private.h:36,
|                  from ../../cogl-1.22.8/cogl/cogl-journal-private.h:37,
|                  from ../../cogl-1.22.8/cogl/cogl-framebuffer-private.h:36,
|                  from ../../cogl-1.22.8/cogl/cogl-primitive.c:43:
| ./cogl-egl-defines.h:38:10: fatal error: EGL/eglmesaext.h: No such
file or directory
|    38 | #include <EGL/eglmesaext.h>
|       |          ^~~~~~~~~~~~~~~~~~
| compilation terminated.

Do I miss something in my setup? Maybe cogl requires new mesa?

Have you seen those errors as well?

> 



--
Regards,
Andrey.
