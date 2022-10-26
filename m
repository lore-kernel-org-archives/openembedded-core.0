Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AF2C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 11:14:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6370.1666782854986543800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 04:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aJqk3hLU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j15so15220355wrq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 04:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uRF4KNdlqvRi1bcdg+9t8zVbIBabOf5hpiUveSqLhg=;
        b=aJqk3hLUnU0P9IqkQ1Z6Zc51hnOJY7cD/JDhTA4p0EVhNSZXweYbMl/RB1iikSauQY
         1c5tkyf1FuEM4PuAxEhM78EYMl7WTBSky5Sv41HDK+By3fcRZPY/ssZ2JZlf2KoSBB5P
         97qbkpTCpa84MjPseWQZMCx4sD6wwnniOn1KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2uRF4KNdlqvRi1bcdg+9t8zVbIBabOf5hpiUveSqLhg=;
        b=JKRjCYWko6gcPWYc93/Z8DrqCYYkusOOzdPVbquj+VH6OE4d4t/b73QSBYtci0XvNc
         H4TlOYEWyTL81YC4JAeaC4ATA0j54TRzTWiliI+RkIUupk04bZ+ZuHU9dyMERgwSSJvf
         Fb1bnetv5Z8l/1fOL7jP9AIQh4lBdBu2d1U6oDUJ4aGS0PaVTTm/VJ9SGevALIkqxjGU
         MS5iZdbzsaLrzZVyiKlOC1ic12ud40W6h/Gf2UgAMOvIQ6//PHDbf9G7p5e13pvya7/Q
         JLbEpH1F0v2z8E40b8jasMmHXNd+TrvIXWAe13zNRhtfX7qGeiXba/5rWx3zeaq8u5MA
         u2wg==
X-Gm-Message-State: ACrzQf1GwWOVwmp0f013IdL5E+bR1nD19vBOE1v+1nWSlAA6m8hHNlxL
	FCJPqFA4DiJx/R6EfCnAm/b79Q==
X-Google-Smtp-Source: AMsMyM4dZqFT5uUmW4QroiKLMDsyzwQkwFxQZNJ1VSkSJb16QNx1+6wVxl+kd7Gi9DhzfbMLB6JcLw==
X-Received: by 2002:a5d:588c:0:b0:231:891c:6fc1 with SMTP id n12-20020a5d588c000000b00231891c6fc1mr28225024wrf.25.1666782853279;
        Wed, 26 Oct 2022 04:14:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd65:7511:b73b:c094? ([2001:8b0:aba:5f3c:bd65:7511:b73b:c094])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003b4ac05a8a4sm2082161wmo.27.2022.10.26.04.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 04:14:12 -0700 (PDT)
Message-ID: <2e7e3bf799fede599c134d21bed5fca3921cbc6b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.inc: add virtio input in required
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2022 12:14:10 +0100
In-Reply-To: <20221018093227.3753321-1-thomas.perrot@bootlin.com>
References: <20221018093227.3753321-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 11:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172150

On Tue, 2022-10-18 at 11:32 +0200, Thomas Perrot via
lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Otherwise, it isn't possible to interact with the UI of images
> that provide graphic support.
>=20
> This issue only occurs when NO_RECOMMENDATIONS =3D "1" for Qemu
> targets which are kernel-modules in MACHINE_EXTRA_RRECOMMENDS.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/conf/machine/include/qemu.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index 0d71bcbbad0d..dabe7ed8f386 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -10,6 +10,8 @@ XSERVER ?=3D "xserver-xorg \
>              xf86-video-fbdev \
>              "
> =20
> +MACHINE_EXTRA_RDEPENDS +=3D "kernel-module-virtio-input"
> +
>  MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
> =20
>  MACHINEOVERRIDES =3D. "qemuall:"

This will fail if the kernel has the module built in - kernel modules
are always recommends for that reason. We'll have to find a different
solution I'm afraid.

Cheers,

Richard


