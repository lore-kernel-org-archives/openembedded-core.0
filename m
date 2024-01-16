Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F479C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 04:40:12 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.4647.1705380002792771449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 20:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=laJQX2R0;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2046c724383so3408411fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705380002; x=1705984802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU2f2IrdL0SqmS/rTv6+GMehSLQKngLJYDa4oZiZfyQ=;
        b=laJQX2R0ggq3CxvlLOvGBDe4kOcr0QlTi+9AbkUQb+vxy500wg18T4yIo9zKO6ojBE
         8M8dpVMv76Li9aeyuZPCS3AEgAuYfAxmrYfEIgKrqmNB9aMQ0+sdqGc9gYcnQ92v4jCM
         FgABEdFBlEdtwcTry3Z8ikbV2d0MY9AYdz9C7+CesaROVzAPkArDWh9qa/WNHUuin90B
         4LQAckezKAXGBtUJfrq6Btkm5oAEvn01Cyv1WTIrl/5awxBfVF1JH+0/HZGN/oM8pIHr
         EFTRDW6GY/3bDqXQ4XOQJ8wFXoxMTQ/YehzrY6E3h02eeIIkTiMwtsFXI9kZX38CXJSB
         iU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705380002; x=1705984802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XU2f2IrdL0SqmS/rTv6+GMehSLQKngLJYDa4oZiZfyQ=;
        b=mz2ej3qddLDw1creQYxSBGdyg9G4ci2iyxkOYSEAQrZzGuoiX5gaZCB4mZ6F0oFf08
         AoWh0hgixBNPT41GgjVeg3Bg9fTN5eZyX7HV0tJaDOxRgje2gWsQGCnQYWHKg1zuytyr
         ZNSyxFZMnlNSalUvWoslNneiqjBhFROXT4iusCPYuA9aZBNbar1nfHEVpxEZJF1zOq9z
         mjZ0Q/dguAEG6t+RKVBBc+jdDX0GN48hjN4fgl408yNdA2b3TjfWM4WadQN6+urNEOTG
         g1VdkcKMr1cPVVtZN6qO1+MVM+gwEyztmnkpDP3lpRx+8IxpdI33jAYeBT26PTumnTqf
         Fdxg==
X-Gm-Message-State: AOJu0YznNpWOrOg2Vn6t9d9cBejN3p+4Q6THuBmk/K4M4PL7YzZVnkVh
	dA9zrgi+iXgkEz4bZ0VuKYIV/961sGwnlPzphM8=
X-Google-Smtp-Source: AGHT+IE5ZyHORb/IByQ3XTIeUArBP8HXNUFJjaEaHnLUz5QTXTf3qy8ZrfjNCdBl2iNFxhRqxvOq8hqqpGjpWIrrf14=
X-Received: by 2002:a05:6871:4d2:b0:203:90ab:c19 with SMTP id
 n18-20020a05687104d200b0020390ab0c19mr4076408oai.48.1705380001817; Mon, 15
 Jan 2024 20:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20240116032529.3321994-1-festevam@gmail.com>
In-Reply-To: <20240116032529.3321994-1-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 20:39:35 -0800
Message-ID: <CAMKF1spvV5J80YahV6RP2Q05fgjHqD4bu9ueNUn87gVTpoHHCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston: Update to 13.0.0
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 04:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193816

On Mon, Jan 15, 2024 at 7:25=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Update to Weston 13.0.0.
>
> Remove the following options that were no longer exist in 13.0.0:
> launcher-libseat and launcher-libseat.

I think one of them should be launcher-logind
>
> Add seatd as a required dependency for kms.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../wayland/{weston_12.0.2.bb =3D> weston_13.0.0.bb}       | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>  rename meta/recipes-graphics/wayland/{weston_12.0.2.bb =3D> weston_13.0.=
0.bb} (93%)
>
> diff --git a/meta/recipes-graphics/wayland/weston_12.0.2.bb b/meta/recipe=
s-graphics/wayland/weston_13.0.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/wayland/weston_12.0.2.bb
> rename to meta/recipes-graphics/wayland/weston_13.0.0.bb
> index cfcaaca9c7..c74f471f07 100644
> --- a/meta/recipes-graphics/wayland/weston_12.0.2.bb
> +++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wes=
ton/-/releases/${PV}/downlo
>             file://systemd-notify.weston-start \
>             "
>
> -SRC_URI[sha256sum] =3D "eb686a7cf00992a23b17f192fca9a887313e92c346ee35d8=
575196983d656b4a"
> +SRC_URI[sha256sum] =3D "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd=
4aaf145d36fc795a"
>
>  UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
>  UPSTREAM_CHECK_REGEX =3D "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> @@ -38,7 +38,6 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'wayland', 'kms wayla
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland'=
, 'xwayland', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', =
d)} \
>                     ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland =
x11', '', 'headless', d)} \
> -                   launcher-libseat \
>                     image-jpeg \
>                     screenshare \
>                     shell-desktop \
> @@ -54,7 +53,7 @@ SIMPLECLIENTS ?=3D "all"
>  # Compositor choices
>  #
>  # Weston on KMS
> -PACKAGECONFIG[kms] =3D "-Dbackend-drm=3Dtrue,-Dbackend-drm=3Dfalse,drm u=
dev virtual/egl virtual/libgles2 virtual/libgbm mtdev"
> +PACKAGECONFIG[kms] =3D "-Dbackend-drm=3Dtrue,-Dbackend-drm=3Dfalse,drm u=
dev seatd virtual/egl virtual/libgles2 virtual/libgbm mtdev"
>  # Weston on Wayland (nested Weston)
>  PACKAGECONFIG[wayland] =3D "-Dbackend-wayland=3Dtrue,-Dbackend-wayland=
=3Dfalse,virtual/egl virtual/libgles2"
>  # Weston on X11
> @@ -93,10 +92,6 @@ PACKAGECONFIG[shell-ivi] =3D "-Dshell-ivi=3Dtrue,-Dshe=
ll-ivi=3Dfalse"
>  PACKAGECONFIG[shell-kiosk] =3D "-Dshell-kiosk=3Dtrue,-Dshell-kiosk=3Dfal=
se"
>  # JPEG image loading support
>  PACKAGECONFIG[image-jpeg] =3D "-Dimage-jpeg=3Dtrue,-Dimage-jpeg=3Dfalse,=
 jpeg"
> -# support libseat based launch
> -PACKAGECONFIG[launcher-libseat] =3D "-Dlauncher-libseat=3Dtrue,-Dlaunche=
r-libseat=3Dfalse,seatd"
> -# deprecated and superseded by libseat launcher
> -PACKAGECONFIG[launcher-logind] =3D "-Ddeprecated-launcher-logind=3Dtrue,=
-Ddeprecated-launcher-logind=3Dfalse,"
>  # screencasting via PipeWire
>  PACKAGECONFIG[pipewire] =3D "-Dbackend-pipewire=3Dtrue,-Dbackend-pipewir=
e=3Dfalse,pipewire"
>  # VNC remote screensharing
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193815): https://lists.openembedded.org/g/openembedde=
d-core/message/193815
> Mute This Topic: https://lists.openembedded.org/mt/103755579/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

