Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07BAD13577
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 17:20:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.33776.1730049609793951389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 10:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFNm4DRC;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fbbadf83so4540502e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730049608; x=1730654408; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5x6K/It7FAxzwcizBN8WVnxngqTtXOyVz09mav+qqU=;
        b=VFNm4DRClPIFhGcRnssYPRxAPdyyjbjaFOVpLD+N++ZEHTQdVZJ+vrMpdF2PyQwlk+
         8o6JArsREdJr3sdRmYIl44FqP3PC5t0A4pTBx5JaU2QgCDrtC85/ya0Wi526vdxARnJI
         +qvtPx9VVfYsovGE2z4hiCXZQjv6qR7i0Si2eYJVDGVxxsQObCCGgyW+UrK9yeiemoB3
         lMj+kRxj0RxGR4ek9f5Uug01ukPYKBOy7VI9yeBcgk8M8XNe7E3Rm+JJhMllDHWxx+7u
         OLy98OrfoDG2xFDRRHU90sJmU2mnhZkkk/fy+yICEltilDK1HiMh67HQ2hrX99L3hX60
         wR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730049608; x=1730654408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5x6K/It7FAxzwcizBN8WVnxngqTtXOyVz09mav+qqU=;
        b=ESZ3Y85Em82ewZla1vd6NM72tGAS+DDeO7K4va/4mZ+nWOl4va3UAeBNVJh3A222MK
         rHArj90X34+zkXNh0UeQKw+dUoVv2shLF6f7xG/ef5JK2nE5+p7PI1oLDANt00sV2ri6
         haZAf/VLgeEjxN/0Rozsn3nwX7/zLe7DPAf7uXT61ppcOF5rf4Io+lPecQpFisqB9zH9
         YJmG4bevem2eaBmHptJr24fQau2wQIU2EKrf/YU/V3LUPEzuWjP/leSuXQXx+DeBHn33
         woYa3nDGcX3FDce/xvFhO+xHW+NKlZQgGrykks0UlnRsdALHT0ceZd3I6Hm5OmmeynXd
         FNSw==
X-Gm-Message-State: AOJu0YzRi2G7pYnCvhsis+Un5bp2gc0o+SBrss2l6ASHIJxhLErQYgPb
	egfJzTbv6SuAuCQ+08QjwAkpqRQcs/kjxn0p35AQIEmqlTXdNpLAnYfNWqwVkah/l6ms7BPzex+
	0Gx3jFXTN2yEL2ReEbJ7ltcK+o7iFieRO
X-Google-Smtp-Source: AGHT+IHf0I82PScX1D5jRLFZz5aYrxsl54PR81y1Vdak8BE2I8Y07UPpfnOZ/Tl/3ijQXUl8o6NTuH+Er0PM//1dm3k=
X-Received: by 2002:a05:6512:2211:b0:53a:40e:d54f with SMTP id
 2adb3069b0e04-53b347c0d7bmr1835138e87.8.1730049607333; Sun, 27 Oct 2024
 10:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240827090212.2192055-1-olani@axis.com>
In-Reply-To: <20240827090212.2192055-1-olani@axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 27 Oct 2024 18:19:54 +0100
Message-ID: <CA+chaQfU4r3funtCDVafY67z3CM-wkMYQ7jXH9F+sD5Pi06fvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Package example files in ffmpeg-examples
To: olani@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206411

Wasn't very future proof for multilib :) please review:
https://lists.openembedded.org/g/openembedded-core/message/206410

On Tue, Aug 27, 2024 at 11:02=E2=80=AFAM Ola x Nilsson via
lists.openembedded.org <olani=3Daxis.com@lists.openembedded.org> wrote:
>
> From: Ola x Nilsson <olani@axis.com>
>
> The most future proof way to not always ship the example files is to
> package them separately.
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> index fe34b87ccf..55313cc583 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> @@ -170,7 +170,8 @@ PACKAGES =3D+ "libavcodec \
>               libavutil \
>               libpostproc \
>               libswresample \
> -             libswscale"
> +             libswscale \
> +             ${PN}-examples"
>
>  FILES:libavcodec =3D "${libdir}/libavcodec${SOLIBS}"
>  FILES:libavdevice =3D "${libdir}/libavdevice${SOLIBS}"
> @@ -180,6 +181,7 @@ FILES:libavutil =3D "${libdir}/libavutil${SOLIBS}"
>  FILES:libpostproc =3D "${libdir}/libpostproc${SOLIBS}"
>  FILES:libswresample =3D "${libdir}/libswresample${SOLIBS}"
>  FILES:libswscale =3D "${libdir}/libswscale${SOLIBS}"
> +FILES:${PN}-examples =3D "${datadir}/${PN}/examples"
>
>  # ffmpeg disables PIC on some platforms (e.g. x86-32)
>  INSANE_SKIP:${MLPREFIX}libavcodec =3D "textrel"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203818): https://lists.openembedded.org/g/openembedde=
d-core/message/203818
> Mute This Topic: https://lists.openembedded.org/mt/108120002/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

