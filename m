Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FBFC6370C
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.32150.1650904922756774303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mpRe6/p5;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id f14so10710189qtq.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=faJ8BFNDZ/ttZ14SXVelUCMRCCEH50bfMdpyyYII+Oc=;
        b=mpRe6/p53jh6v6iaTLNVfT9wKuDhb5qjr4MuGpds8wUqpg0NnLdKP3eLp6U3rngcHU
         4KZyaj5S9UHu/RPA9H8IGOB9b1/CiAiPlwElF8qBLcvQebekuQDycRIiCi6W6So9gtLL
         UvXiDr5CddaE/4/XQUIUzIVgnSG3ErOq/xWbyLGCr7Am87B8Urmj7m9YXxQt25UOwXGQ
         A1GILs4UxkaAJwYf43KcJBr6f68VxFZpg/6bIIFxWqlb7p2zWiksSlEO7R0GFWNI/iES
         YpLgQjcuuJIqXJ9z9UI9lkA+1VMM5QUpW3uPv8JWb+kxrn7H9aEcpmvN2l65WqMh3yCb
         poBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=faJ8BFNDZ/ttZ14SXVelUCMRCCEH50bfMdpyyYII+Oc=;
        b=38bPGTCvqFA1F0Olw1/EXbBiy04/EZBnQd8PKl3be/ZJI/it8LHTKcjK+90U6Rbvgb
         TyMrcKIwiaxJ0kSzYnZnLE+APItSpnp4iosui46hZqOoXuBw7rPzz1edpl9mGUB83MDL
         xriI1eT11K2Cs/InnTce//qHKwymDXCZQEjTnLDIdzZ7dYNdGc08MiH4qe9TeTjPZNEH
         CSsPxPbtfV6dzkFF7uuWaNC4qquYZKHI78dw8E+YRUlgRb5Zx0wJXNIJnQG0nu2paVV3
         Fj74d8Xa1iuqxn57eO3iAjdTlVC+O8ANYXIcdYCuVZQ92zG0+webwVjcPeaa6ppgp4rn
         zjKA==
X-Gm-Message-State: AOAM532SS5Bj26JKQRz6NWJmcVPAxPOu90A+gzethQoW+3iSDOANM7a5
	YQ9QXy8zHCaRUsn0eMN2ZwiJgY5NFjOU490sphPfqdkcvUw=
X-Google-Smtp-Source: 
 ABdhPJyTqOMvmruHaD9whZQhhNpWX4Nkl97wOPHXCEENSlt736R7Mt+3ZdI+wo0P2cOZeS47otIhhlNcXBhw4BOSahY=
X-Received: by 2002:a05:622a:390:b0:2f3:64a5:d452 with SMTP id
 j16-20020a05622a039000b002f364a5d452mr5348901qtx.330.1650904921800; Mon, 25
 Apr 2022 09:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220425150104.1001838-1-crg7475@mailbox.org>
 <d250366a-40fe-0476-971d-4ff125559eb1@gmail.com>
 <1bd6d4e0-f62f-086c-6668-899037221a7d@mailbox.org>
In-Reply-To: <1bd6d4e0-f62f-086c-6668-899037221a7d@mailbox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Apr 2022 09:41:35 -0700
Message-ID: 
 <CAMKF1spSAeSD0Mk_uFR=s+zdSjzNdF6wu0swF8B394tgLDsk6A@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] gstreamer1.0-plugins-good:
 Fix libsoup dependency
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164835

On Mon, Apr 25, 2022 at 9:19 AM Carlos Rafael Giani via
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
wrote:
>
> According to https://gstreamer.freedesktop.org/releases/1.20/ , libsoup 3 support isn't stable:
>
> > Runtime compatibility support for libsoup2 and libsoup3 (libsoup3 support experimental)
>
> So I wouldn't add it just yet.

fair enough.
>
>
> On 25.04.22 17:39, Khem Raj wrote:
>
>
>
> On 4/25/22 8:01 AM, Carlos Rafael Giani via lists.openembedded.org wrote:
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>   .../gstreamer/gstreamer1.0-plugins-good_1.20.1.bb          | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
> index 08ff5a0bb5..1f61d9a10e 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
> @@ -49,7 +49,12 @@ PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-
>   PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
>   PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
>   PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> -PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
> +# Starting with version 1.20, the GStreamer soup plugin loads libsoup with dlopen()
> +# instead of linking to it. And instead of using the default libsoup C headers, it
> +# uses its own stub header. Consequently, objdump will not show the libsoup .so as
> +# a dependency, and libsoup won't be added to an image. Fix this by setting libsoup
> +# as RDEPEND instead of DEPEND.
> +PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,,libsoup-2.4"
>
>
> We have soup3 as well. I wonder if that should also be an option ?
>
>   PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
>   PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
>   PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164834): https://lists.openembedded.org/g/openembedded-core/message/164834
> Mute This Topic: https://lists.openembedded.org/mt/90686912/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

