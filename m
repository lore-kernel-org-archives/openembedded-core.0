Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web09.9598.1615386793917924410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 06:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HGpvMoEA;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id c131so18028842ybf.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qaleIiBjxh9zinRyPak9KqofHwcjeRoXsuUoTXoEMOk=;
        b=HGpvMoEA7cWsiLOnwW3DpHss0x3nDJJq6EX7XG5XnxBwE7KJDxRBHuo/fdT8bGXsum
         zxHkL+AkYBM5nCr/lAPF8lZvwvtedTCqXYzBdd4GmGIAk6v77QbwFYBoRjcGQf+705d/
         wx495ePrWrWkgaVu0ICr9FPUsEOzdPZP090DXKz2VvkWWoC3rDVOIubAqQWt9mEZa4CS
         etckqzcx9m/YSq6x0avdJfrlu3N63XrdIInrzeTTEYPKeLu0igNsRtKfYavAtvImqGPl
         +dsgz1kdbaxwbUeaOODUl90Jqe84Gvy58m7GPe9AjdCxWp9n0q+vDeHe6Ko2tS4nqDNv
         bzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qaleIiBjxh9zinRyPak9KqofHwcjeRoXsuUoTXoEMOk=;
        b=Tv5TAJFU1DFNcogpailf9qytjgyVMSv1osY2CCy6jOwnzzzuZ3OG8OzSIcHxcGtN9I
         rC8rScsX/7MaXnAFgYfnwD+Ou3DcdpF10RRse7G3QuRWzwZGV+OTT+G7UTKOjLfL9PZF
         NgwHZCM7TZ32KXeW0X5VUpKjOHk2FLKc+xK2/9hfIcX2pLa5NUrmCVxmocmLZ7pY+WEs
         aN5dNt/nLFVoR/BmwSPm53rNgqR4L6yfn6hZT+EPqn7RBV8bvIYEPiCVHL6Yy3rtgTtA
         gELhARV0Fy3zELeSejF8YXnRtAJS6Cm6LvqfaWBYXachu7y39cJ3bnA6cMIjucXi6aLS
         hXBg==
X-Gm-Message-State: AOAM5329up6BAXEIIh6DviZdSwJbZ0wfUzanlh2rZTkNHR6qbLwuKYfY
	4aQvktjp9gOMekiOmgIEGd/a0HAMe26GD8wMe6o=
X-Google-Smtp-Source: ABdhPJzveo4hJkOJcsejLDNqGuEyN1sVlxuc0hMbKbkan/JGi9TZeXP2AFxSxeqeDlcFBelf165sbXjTv7B7006jkCE=
X-Received: by 2002:a25:cb41:: with SMTP id b62mr3998740ybg.284.1615386793082;
 Wed, 10 Mar 2021 06:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 10 Mar 2021 04:33:02 -1000
Message-ID: <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH] xcb-proto: update to 1.14.1
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anibal Limon <anibal.limon@linaro.org>, Richard Leitner <richard.leitner@skidata.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 2:54 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> From: Richard Leitner <richard.leitner@skidata.com>
>
> This fixes [1] the following build error for nativesdk on Fedora 33
> which is caused by the removal of fractions.gcd() in favor of math.gcd()
> in python 3.9 [2]:
>
> ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)
>
> Furthermore the SRC_URI is adapted as the old one doesn't provide the
> 1.14.1 archive.
>
> [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
> [2] https://bugs.python.org/issue39350
>
> It's needed in gatesgarth and possibly dunfell as well to support
> distributions with python-3.9 as we build libxcb-native, which is
> failing with xcb-proto-1.14.
>
> 1.14.1 is a bug fix release:
> https://lists.x.org/archives/xorg-announce/2020-October/003061.html

Dunfell is still at version 1.13, so this wouldn't be a bug fix version bump.

Steve

> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb} (84%)
>
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
> similarity index 84%
> rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
> rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
> index 6de30098d6..52e474a2e9 100644
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
> @@ -11,8 +11,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
>                      file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
>
> -SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
> -SRC_URI[sha256sum] = "186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605"
> +SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
> +SRC_URI[sha256sum] = "f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3"
>
>  inherit autotools pkgconfig python3native
>
> --
> 2.30.1
>
>
> 
>
