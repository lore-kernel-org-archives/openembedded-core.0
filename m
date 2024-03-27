Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A16C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 18:24:58 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.1203.1711563891832540717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 11:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLlf/M/R;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-22a5df0f789so71784fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711563891; x=1712168691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6JNm/Ljz70+0iRKCWd/XQ5DpobWV6uloC2wlPnwslU=;
        b=gLlf/M/ReSSZ67IIFDZZ9fui/fkIBYKOp+ZCVDu3UuKRc1PpIK9dsQZLQ5zNxd2HZT
         TUzj9tpMe3H1JdsMKVL0z0RZGUXzgCQyKBE8yV1aVhddanR/MHRGZNAA14tR8aZx2ngz
         WQkQSsJX0N7bPYsnBb1zSnauAZPIBGaTxv3ytMD143erNtuWFFmoXKar2Z0LzJUIKAbu
         Yn3FJgp1DA0iBow0L1DF45a5Sa1Htuhxv6YFrhTpRjOKWvTYyg0ZvxTRP/i0gMfycoV5
         +zFzxL8trBIHurkTU1J7QLHZ9UszeBuA6VgLfBO7RyopsIWDyppi6PNxkEfNMPoubW0H
         Dd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711563891; x=1712168691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6JNm/Ljz70+0iRKCWd/XQ5DpobWV6uloC2wlPnwslU=;
        b=eyBYd0HxrlfELYnLEcJokWtWGczZfsKofVe0W/7/cVe6Blyq7Yfih2pyJf/Flj0ekM
         1YcyGYmCNTcSBMUYAGwuxwQBkQK+2d17WRxj2jdulIQZgFz5/d7NDvQoar8lcWyq5fEL
         JyNA+2ee2XBeIa3f1Lh2y6HQo72VsfmctUfCY3SiHuQus7i21AU388hkuQXZgglVkkAo
         Pstmnv579ROn3hHbRmOKEwfFXgoHsoGMUE2Xl4vLW2fFO+U5w7F2sOloybj33Ij2ZD8J
         cZVZs9Ety51a0NnWI6t86yt81x1K/k3gyrAwhR4HR48ZkJvq79f1olyo4iNU5USNmlkY
         D5yA==
X-Gm-Message-State: AOJu0YzNz/3LeOayCXjxE8p4EoP1gKNa+E7ZJhiaYBO+bZGQ7bhIQgSD
	vMW8Mo6kTgy/KD11GWLdtGjh1Ewa8N5J0pg3wlL8i03NyYm8LnJ4xPYqXIpXNQ6AYG6ErGqHbsU
	rFvXTHzkADI6Up1Pe2FGB6A6dj88=
X-Google-Smtp-Source: AGHT+IEg4c5Fz6GTUQ5nSH7PwNtnEgd8rY0SL3o82YiysmQUT3wHvmO4OKQeWKT8b/a6y+bVCVdMxVGvIQtdTj+oeQo=
X-Received: by 2002:a05:6870:c43:b0:22a:5bae:9cd5 with SMTP id
 lf3-20020a0568700c4300b0022a5bae9cd5mr498304oab.48.1711563891060; Wed, 27 Mar
 2024 11:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240327171616.950846-1-omatiush@cisco.com>
In-Reply-To: <20240327171616.950846-1-omatiush@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2024 11:24:25 -0700
Message-ID: <CAMKF1srMxy2TYHq57K++_j3TvWTYggggW-69JzDVAW67txzMiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gmp: improve reproducibility
To: omatiush@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 18:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197566

On Wed, Mar 27, 2024 at 10:16=E2=80=AFAM Oleh Matiusha via
lists.openembedded.org <omatiush=3Dcisco.com@lists.openembedded.org>
wrote:
>
> nativesdk-gmp package contains host references in output packages.
> remove them.
>
> Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> ---
> v2
>  - move common code to separate function
> ---
> ---
>  meta/recipes-support/gmp/gmp_6.3.0.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support=
/gmp/gmp_6.3.0.bb
> index 3dbcd68b5c..fd4aec92fd 100644
> --- a/meta/recipes-support/gmp/gmp_6.3.0.bb
> +++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
> @@ -29,13 +29,21 @@ do_install:append() {
>         oe_multilib_header gmp.h
>  }
>
> -do_install:prepend:class-target() {
> +fix_absolute_paths () {
>          sed -i \
>          -e "s|--sysroot=3D${STAGING_DIR_HOST}||g" \
>          -e "s|${DEBUG_PREFIX_MAP}||g" \
>           ${B}/gmp.h
>  }
>
> +do_install:prepend:class-target() {
> +    fix_absolute_paths
> +}
> +
> +do_install:prepend:class-nativesdk() {
> +    fix_absolute_paths
> +}
> +

why can't we have it in common do_install shared across all
variants of recipes.

>  SSTATE_SCAN_FILES +=3D "gmp.h"
>
>  # Doesn't compile in MIPS16e mode due to use of hand-written
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197565): https://lists.openembedded.org/g/openembedde=
d-core/message/197565
> Mute This Topic: https://lists.openembedded.org/mt/105181617/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

