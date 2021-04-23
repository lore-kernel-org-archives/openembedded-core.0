Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.5747.1619155899212435433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IzSWAAfp;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id 18so22216516qtz.6
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 22:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgrqEWSBrjY2CTtMIWGTAUQY4zK1B0zjKPvBVkVnpjA=;
        b=IzSWAAfpOlBEip8vh4cZSqTGp0OI5hxjwpQCIZeTXNaFtPD4oIEGl+J9xgqnzwADKc
         PPdD1JRlrCReuwkisug8FFHerOtadQxbUJHeqwxryPASYw0sHoqWoAw6xPIDlHPK1oTj
         NmSHQZRkC+lCgkoaBMs6OoDBAFmuRDd4yxgCpgNgZaTM811PX1Nu7+H90B/mX8jgg6w1
         eRATSdGeO3ic5JMIrzofOh3PRrXm4W3JLwbERKeGYPSsaz6eJxtafmd2UjiWvRNdyUBI
         aZ+EsnSlfu1WPhJhm5yjjDsOTT2SKJAl2dM6QZJZkN3bmR6aO5ya3pfGhzOsDI/WiZu2
         95Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgrqEWSBrjY2CTtMIWGTAUQY4zK1B0zjKPvBVkVnpjA=;
        b=jFkhCLmGP2vR2BhB6epteYmFxFSJSb0f7B16r5v9x8/qKV5my4GuToAtOzsxy0YddR
         mrt9Vr+HEUlA0gT3kbUChoEfjnEt/nfwu9eOxwW1A6SBO25HVQ4DJ65bzwgZIZCTzzKn
         IxFV0A0NRaxRknV8Yka8GEibOE3frAc5wkMqLU/hoBx+ZFBQbfKljOBynkJ7L7gnj2zP
         BkOSN0M2qz6T79HibRoAqo0TJdV2m4YfTTMz/5VzxjCq91/0RKCh6HIB6BuriyZ9wAU2
         5FxNTXIYqyFZX2iBS5SwTx1wBQPO16mAv0GSpWXO6cRKOKGO5SoCkD0LlWLsq/rGFZwL
         WjRQ==
X-Gm-Message-State: AOAM530DaePNo1MwqURTnHKtwF2yMW3y2Yoi9ddToXERCe4zM27f3ovE
	mmF+i9ofs9nT5q1QCd+2z4Bldc1argwvmf8GTMk=
X-Google-Smtp-Source: ABdhPJxt6vZ9aoMugidsPGJcT61MOejj5UGD755l6CoEETZN/D6K2EL+/UPCgc7L7Z9jk4cuyf2UI1CG8bvZ0TTj43Y=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr2073615qta.289.1619155898354;
 Thu, 22 Apr 2021 22:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com> <1619078047-5587-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1619078047-5587-5-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Apr 2021 22:31:12 -0700
Message-ID: <CAMKF1sq9OEK=LYu7oo8=LwmT0Z5piunXeiad0KF-rVWMnN6G_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tiff: upgrade 4.2.0 -> 4.3.0
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this breaks gd package in meta-oe see

https://errors.yoctoproject.org/Errors/Details/577264/

On Thu, Apr 22, 2021 at 12:54 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-multimedia/libtiff/{tiff_4.2.0.bb => tiff_4.3.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/libtiff/{tiff_4.2.0.bb => tiff_4.3.0.bb} (95%)
>
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> similarity index 95%
> rename from meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
> rename to meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> index ea8580a25e..abf0a67740 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> @@ -10,7 +10,7 @@ CVE_PRODUCT = "libtiff"
>
>  SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>            "
> -SRC_URI[sha256sum] = "eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb"
> +SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
>
>  # exclude betas
>  UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.25.1
>
>
> 
>
