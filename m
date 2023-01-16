Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CB6C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 11:48:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.164496.1673869726207347972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 03:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dFLWRSqv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id ay40so19804751wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 03:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEfRoNb0XjsP7UnyHST4UXS8cT36ajTkCPVGiTCjo9g=;
        b=dFLWRSqva5Zf3RVXktqRhjPjUe4KA40/GEwgt04e/4N7bdYtnEbpxoudKdw3pusugR
         1z8SUSDdRHEq2sMfuoBd83Jorv2R7NPRPASlNJgvGK8eLRmAxTlXSGSfXxFcso/1qpkc
         IzoQJqJ+oOmPxTzvaX/fDCyMRscPsRmx+dxj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEfRoNb0XjsP7UnyHST4UXS8cT36ajTkCPVGiTCjo9g=;
        b=5Tehz4zE8ohuMxUCTgFtx1kOwxQyz3ZRT2xsxoPUPLd2ALIGPLblob/ahi/1RRFuXE
         PPxD4qBihdZEiKvrYGLwYRMmBL+SzxMm/wxWXPhoDshmbMbZ9hHuGY6fgzuFR4AAt7EX
         GXgHH+Pwa7fAy0vj8iw3dzIQG8qkG5SNTV96sOgFefrQ5CQ+ALGumyyx3ti/AP+cIiTb
         J3Rufz0RYoNPmmJ14I/8UMoeKrUQxK4M3QFkDPDUiY+dnH7FvjzP7Ik3Lclkpl3flefo
         cS2WN6thYQhiJGW9GyXpS0gauwtE6tt1iZ1B/knt1Xx0E2+61DWnOdTKVKKqTG58g80G
         SR2w==
X-Gm-Message-State: AFqh2kpmQT31d2DwwtfY8HW+LhHsThHo5w9p7vdE05ZIaCieXRz91YGu
	pNi+h0Kyr0jcSOzr7Sw3a0HBbdghG4yH/fcB
X-Google-Smtp-Source: AMrXdXsKyuO0aP2xXGxZ2BiPsZB/2ZEkQtnyBuWQaEJ9LJm0uVcW6WhXP5sazE546cALqffQTBtLcQ==
X-Received: by 2002:a1c:6a0b:0:b0:3da:fcdc:cafd with SMTP id f11-20020a1c6a0b000000b003dafcdccafdmr2114843wmc.13.1673869724459;
        Mon, 16 Jan 2023 03:48:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003d98438a43asm31901106wmc.34.2023.01.16.03.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:48:44 -0800 (PST)
Message-ID: <a956822a93760093e6ac2693a9d31f2ce079d9f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] webkitgtk: fix perl-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ovidiu Panait <ovidiu.panait@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 11:48:43 +0000
In-Reply-To: <20230111134014.3220014-1-ovidiu.panait@eng.windriver.com>
References: <20230111134014.3220014-1-ovidiu.panait@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 11:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175977

On Wed, 2023-01-11 at 15:40 +0200, Ovidiu Panait wrote:
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
>=20
> Currently, perl-native is missing from DEPENDS for webkitgtk even though
> perlnative bbclass is inherited. This happens because the DEPENDS variabl=
e is
> reassigned right after perlnative class is inherited:
>=20
> inherit perlnative (DEPENDS +=3D "perl-native")
> ...
> DEPENDS =3D " \
>             ..."
>=20
> Move the inherit after DEPENDS reassignment in order to make sure
> perl-native is explicitly added as a dependency.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.38.3.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.38.3.bb
> index e890079dc5..bf2db3c33a 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
> @@ -17,8 +17,6 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
>             "
>  SRC_URI[sha256sum] =3D "41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df=
28504f7410604a5a"
> =20
> -inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
> -
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'w=
ayland', 'opengl', '', d)}"
> =20
> @@ -40,6 +38,8 @@ DEPENDS =3D " \
>            gstreamer1.0-plugins-base \
>            "
> =20
> +inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
> +
>  PACKAGECONFIG_SOUP ?=3D "soup3"
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayl=
and x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl', '', d)} \

Whilst this fix works, it feels fragile to me.

Could we change the problematic DEPENDS line to use +=3D instead?

Cheers,

Richard


