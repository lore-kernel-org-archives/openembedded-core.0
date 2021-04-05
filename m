Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.1200.1617602190622510950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 22:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FPci3b/O;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id j7so7799396qtx.5
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Apr 2021 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkfOABkL+WCFKWwHUjzHbJ7ac+YFouJgr/bjIzfiBYw=;
        b=FPci3b/ObssMrwWRv4RovPTkCrl/xKZWH1l5/kpXnO0Ck8tpAicbl3fvCXqpoXYDri
         vM5W1YOItP17ma70P2FnBahNq7pMWeK0n84uPdKUU5m8B8TP7RE8IqUwmZmTlJvKqJ+k
         OT/QCpuo9wwr3KuAm/uIPBlDAmNLJTYuAksPxf6uCEtuodrZYTM5krFr/DgybjhGpwgi
         5TBfdsnA1VaIHbN9PMd4M1Lok9/PpgXONJcgwVG0OE0R9C6REb/uG22CYVHYVG29bQVk
         hoVGDlUD8xIrVt/X0o3KT3ruXfbSjSjMq7JwrcOMXcVJTVu7YHTJ05c9ejyP7XGyRY3x
         iyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkfOABkL+WCFKWwHUjzHbJ7ac+YFouJgr/bjIzfiBYw=;
        b=MwMtCBfOX1lJgvVOFSrdRRy7NNU76H11dG47vqq8xK8rOJEtg6sAG1H+kxjAVVbyQ5
         ER4tsBtk6Qydu4XHQI3RIfDQLvBbkIY1EzO4F/8Yg5Itn4IUjWtqGY8ijUxCzk4rr6Dz
         VcQ8SjxI9Q9nsXos2Ry6APEfgO+UFtIHD8dxrfYfyGlwvoPu1mu3byeTcVap+K+0S7K7
         11TkfCD0Wvz1lQCz14HwjjR5KQxWI/babVraUaIdbK0iUXgFOIpY1WTwL6Mu3EAIfVa0
         3Mn0J0jwOxr2rLiwPISwpobR5i7akDVIq3KxFtYatbexefb6iN9bmdLbOgEh6q3CluXa
         Jclg==
X-Gm-Message-State: AOAM5318QAeoU525cxSCIdp5biNrFftMLeXEc2C02rbBpl78jeN+L8RE
	U4hijTvWHa4fXr/dhS5kvGQAwPZtfVdY/5P9x/k=
X-Google-Smtp-Source: ABdhPJzZWM92o5CB0evjdwKgxVrY9qF/h3XPBg8ReyKqs5BVqgoMQXJYttxBF44JuvEdOIrk7fMRh3KAk/MbfutbxbA=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr20447578qtv.299.1617602189705;
 Sun, 04 Apr 2021 22:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com> <1617200547-62088-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1617200547-62088-4-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 4 Apr 2021 22:56:02 -0700
Message-ID: <CAMKF1so7TnQm5Ei6oyvFZHpGya8nKJAYunqP2Y1wgopR=OowVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ell: upgrade 0.38 -> 0.39
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

iwd fails to build with this upgrade, its expecting some bult sources
from ell and they dont exist. Please take a look

https://errors.yoctoproject.org/Errors/Details/575442/

even 1.13 upgrade fails,

On Wed, Mar 31, 2021 at 7:22 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)
>
> diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
> similarity index 90%
> rename from meta/recipes-core/ell/ell_0.38.bb
> rename to meta/recipes-core/ell/ell_0.39.bb
> index 7d3a339978..68ec4cb4a4 100644
> --- a/meta/recipes-core/ell/ell_0.38.bb
> +++ b/meta/recipes-core/ell/ell_0.39.bb
> @@ -17,7 +17,7 @@ inherit autotools pkgconfig
>  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
>             file://0001-pem.c-do-not-use-rawmemchr.patch \
>             "
> -SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
> +SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
>
>  do_configure_prepend () {
>      mkdir -p ${S}/build-aux
> --
> 2.25.1
>
>
> 
>
