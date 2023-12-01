Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B6EC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 11:49:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.20821.1701431384855010261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 03:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bW7aDCyk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50bce40bc4aso2268340e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 03:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701431382; x=1702036182; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sl0ULcig6IYh4x5fDK3Roj7cRuLocUkyBAJQc4F/ces=;
        b=bW7aDCykaM+Axnpd/GmkQ1EA0+sLqCFM2qZJCfEw7IFnHuao3PusxiE/RHf8hFqEpI
         967bA9EPhsPvJZOHvhesfAXvVR3SvLb/OFJDvU3qAzhfpCSLV8YSm+EDifycNDoyVs7H
         ONxsZaXI0JAT2JeEed0jFp1RM5MHqapm/taMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701431382; x=1702036182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sl0ULcig6IYh4x5fDK3Roj7cRuLocUkyBAJQc4F/ces=;
        b=pj8NhXdl3GzSeTUmjZj13jkszAHiTbq/aFAqAZpwTKNLX6256qHYjza9S8ayuj602P
         zeJy9DU+KlXnJukGmZZ0BZHGIym+06eMfys7w5DxHWj81+EzWG/yXK35WGhTRciYgkBK
         TZAv3pA4C8t/iNKJG+JP83sb9ZAGuxh7y8emCgqjp8N2puQcByI+fcVDwvejEnD3QW7Y
         xzy6+Nj7M8EtX9qGRYyUs34hI6o4s0Skl8/Kcqj7dTTXQ7ReUBC0Ei/ku4N3KQnQryr0
         KAR1bbgysxscLILz8REjO+nx4nLyRCMtQVmV4OKdcGRr+JPdTsOwcZG4qc2wikD7MSb4
         lhzw==
X-Gm-Message-State: AOJu0YxASJ3NnzUWUX0JuGV85GWuFKpelJnisD5E9l3dEZXnaPqXzpQf
	GbQBUM1de6Z0CkOeTqxbVi85xg==
X-Google-Smtp-Source: AGHT+IFWi7wpXVY9tsJsO/zl+ZfMahfhpsJ4stViU+gsw/woGKk1L2bx5bpliNuCtTofVw2yOLaPgw==
X-Received: by 2002:ac2:4837:0:b0:50b:cbfe:ee67 with SMTP id 23-20020ac24837000000b0050bcbfeee67mr649023lft.27.1701431382523;
        Fri, 01 Dec 2023 03:49:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:201d:dd04:f9b4:3c83? ([2001:8b0:aba:5f3c:201d:dd04:f9b4:3c83])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b0040839fcb217sm5298734wmp.8.2023.12.01.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 03:49:42 -0800 (PST)
Message-ID: <91187fbd5c1bfeb33b7e1bcd8c2afbf324bb3c90.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/19] usbutils: upgrade 015 -> 017
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 01 Dec 2023 11:49:41 +0000
In-Reply-To: <20231127101751.3187950-5-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
	 <20231127101751.3187950-5-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 11:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191567

On Mon, 2023-11-27 at 11:17 +0100, Alexander Kanavin wrote:
> Drop CFLAGS (containing host paths) from installed pkg-config file.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../usbutils/{usbutils_015.bb =3D> usbutils_017.bb}           | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>  rename meta/recipes-bsp/usbutils/{usbutils_015.bb =3D> usbutils_017.bb} =
(86%)
>=20
> diff --git a/meta/recipes-bsp/usbutils/usbutils_015.bb b/meta/recipes-bsp=
/usbutils/usbutils_017.bb
> similarity index 86%
> rename from meta/recipes-bsp/usbutils/usbutils_015.bb
> rename to meta/recipes-bsp/usbutils/usbutils_017.bb
> index a30037b6938..c62c6256fc8 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_015.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_017.bb
> @@ -13,7 +13,7 @@ DEPENDS =3D "libusb1 virtual/libiconv udev"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}=
.tar.gz \
>            "
> -SRC_URI[sha256sum] =3D "2b8140664578f39c3f6f0166a1b950f8655304e63e3d7f89=
899acb99bc5cb8e7"
> +SRC_URI[sha256sum] =3D "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42=
936faaf00814ab00"
> =20
>  inherit autotools pkgconfig update-alternatives
> =20
> @@ -30,3 +30,7 @@ RRECOMMENDS:${PN} =3D "udev-hwdb"
>  PACKAGE_BEFORE_PN =3D+ "${PN}-python"
>  FILES:${PN}-python +=3D "${bindir}/lsusb.py"
>  RDEPENDS:${PN}-python =3D "python3-core"
> +
> +do_install:append() {
> +    sed -i -e "s,${WORKDIR},,g" ${D}/${libdir}/pkgconfig/*.pc
> +}

This looks like it removes WORKDIR, not CFLAGS so it doesn't quite
match the commit message?

I think it might be wise to put a comment in the code here saying
exactly what its doing so we can know in future too.

Cheers,

Richard

