Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.408.1602001811462516028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PtAljKUi;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id dt13so9150467ejb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OnfMQ5JVxn8k96Zh1Qb/8qP+TiFk+tPbrsu+aexh68I=;
        b=PtAljKUiQ9GXnR7fmibNQ+9+Tp2cC8N3rw3P7djRyfQp+ok79/W7v9aHyW7X31Ya7l
         mGFvIuIKGazeDEqSvQ/mFmjAvoVwjJRgyRsbD0g3dkUO7/mSCPYeYm7pKckUkmZF1ixj
         8a0GX9cnSbBL4481csnOebKW57QFAsHxO6VIy6TwyIta5rl2o/JOSshoWZhmtsGI4ctf
         M7A7PICdZcU1uN+XZp7//w5cW/TTTrlPQe5GkIC0kGYX6Ofb5FMVv0Ba301QUVEQZH43
         eQZbmiqOw84ju/lDa6kmJEF7TN0FjV/11XR4quEQ7vJGkerdccxv8CKwVD6ob881y9oP
         UgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OnfMQ5JVxn8k96Zh1Qb/8qP+TiFk+tPbrsu+aexh68I=;
        b=Re5wyTmp4Zu0d2QrNmo5o2NIYG2byZ7Oyruc+4mOacLANp/RvYzq7jQirJ4/eCLtwe
         gsJmeSmayrRtLzMxbUal1KCssWiGHSNEl9+h02dcH3QnVf07CbM1rHbW1+VVO7v+R0dq
         YlEl/mq7nE6LYw6j85fijiJUm/9cvuUb2R1dox93jL/XMdOFZtWUn6mYTv82FMa0x0aM
         NIZNDPZknie4lMRmw7/n5InWAlCcGAlv5Dkcm+SfyCGaFrCc0Hlp1Xjs/vuhjOQ1oLde
         xTtYYmpPuSqaWpKA0KfVcmvIkFb+cQpgb8WYyFKbmtByOEQ2HNZc/HPMxIMSHvSsZmrk
         9jtw==
X-Gm-Message-State: AOAM53022krBbR/lgO/5SvIQVWRW5IIVfS2iTGHS//SgE/wBr3eLiqMf
	V3QZVr+Pje+g7uiQ1SjLmInzZoCcpsXf4+E6QfHyQw==
X-Google-Smtp-Source: ABdhPJz8GoxrhC4udDDXXDBewholbW0bSupORu9HC5tIpIAQuaiyv3kDkFKKMjUL7n6pdyKeTq/Kya8NPL3x3RtiB8I=
X-Received: by 2002:a17:906:4811:: with SMTP id w17mr288056ejq.431.1602001809710;
 Tue, 06 Oct 2020 09:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201006121105.94671-1-marex@denx.de>
In-Reply-To: <20201006121105.94671-1-marex@denx.de>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 6 Oct 2020 06:29:56 -1000
Message-ID: <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
>
> Update to latest available.

Have you tested these patches with kernel versions 5.4.62+ ?

IIRC, Bruce said that the 2.11.x tree did not have the necessary
patches to build with recent 5.4 kernels.

See his patch "lttng-modules: backport writeback.h changes from 2.12.x
to fix kernel 5.4.62+"

https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=348c666b2dca230308c8462dac2117b04cca6ae7

Steve

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (92%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> similarity index 92%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> index 6fff096a37..a38d8afb7a 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> @@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>             "
>
> -SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
> -SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
> +SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
> +SRC_URI[sha256sum] = "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c663ff3875ba9c8566"
>
>  export INSTALL_MOD_DIR="kernel/lttng-modules"
>
> --
> 2.28.0
>
>
> 
>
