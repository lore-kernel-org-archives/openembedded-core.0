Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAFCEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 09:56:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.12339.1687946202044034958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 02:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=EVdOlI9e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fa9850bfebso31284805e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687946200; x=1690538200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+Q83S9Qb32fdBRP0lau/wFnJ//A9dttLrjqNLNvF4Y=;
        b=EVdOlI9euufxABjiPNaRx44Q/dUsmfsp1x/D1yMGKBDThntFBota7bCnVbDmCiFakv
         JWWfNEV0ZmG0qcCz3pExLC8rOXl1Z26vr28awHb3hYVojPTETUntuhpMVOCU7covNOFe
         oRjkWAztj8ci81Ix+MOOIR7sFd00kJ1bOOhBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687946200; x=1690538200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+Q83S9Qb32fdBRP0lau/wFnJ//A9dttLrjqNLNvF4Y=;
        b=RTRSn7MDIQOSnkxlouOgUWjs+Rf/ZKOtpJCKoppF9mulnBb+K9OxqfX80RhRRdvnF6
         1acxpveeECVCYdljXbHmtzBACsP/TKSVrOZl1Zj7FNZFIbyhBk4Ebq2oXq+XMYOgDD2M
         d/Y3dceGymqD6rM9DKBOD665SX2Dj7cFTjhgC8939eZkrogPia3A901EseLMUautgsqo
         6a40dl18sGmW2jJnp8PO9CYTC+yO3wuw4gyRk0y/UA5a3G9aLjVQupHEwPYMrU9UZ2Lz
         T65+/DzZgibSHdLsHGFVdErXoi2JgvJI+WL6BJryUp4/oUumTB60Olvus7UNwvOhzLyz
         e+1A==
X-Gm-Message-State: AC+VfDzv12zhmA3T96lP0DUNBw2utrJNW5EOtcMVCMd+4eOU+Hz3ptSS
	OLzor3l5M9ukhlD39D6Kg16Vrg==
X-Google-Smtp-Source: ACHHUZ4FBDvQvdSSRo6Aqw24+OK6KLsFRZ9UCkkJrfOrsgFFGlqC834rHgDg/hsxzyKqW24ZHeWLBA==
X-Received: by 2002:a05:600c:2288:b0:3fb:403d:90c5 with SMTP id 8-20020a05600c228800b003fb403d90c5mr4595068wmf.39.1687946200423;
        Wed, 28 Jun 2023 02:56:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a71a:20d6:74fc:9334? ([2001:8b0:aba:5f3c:a71a:20d6:74fc:9334])
        by smtp.gmail.com with ESMTPSA id r13-20020adfe68d000000b0030fb4b55c13sm12853062wrm.96.2023.06.28.02.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 02:56:39 -0700 (PDT)
Message-ID: <8987cd39705f1b2ae8ba56f5c18491da2592f909.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCHv3] Flac: upgrade 1.4.2 -> 1.4.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Siddharth <sdoshi@mvista.com>, openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2023 10:56:38 +0100
In-Reply-To: <20230628075628.146803-1-sdoshi@mvista.com>
References: <20230628075628.146803-1-sdoshi@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 09:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183550

On Wed, 2023-06-28 at 13:26 +0530, Siddharth wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>=20
> License-Update: URL fix
>=20
> Remove PowerPC related options no longer supported upstream.
>=20
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../flac/{flac_1.4.2.bb =3D> flac_1.4.3.bb}            | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>  rename meta/recipes-multimedia/flac/{flac_1.4.2.bb =3D> flac_1.4.3.bb} (=
76%)
>=20
> diff --git a/meta/recipes-multimedia/flac/flac_1.4.2.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.4.3.bb
> similarity index 76%
> rename from meta/recipes-multimedia/flac/flac_1.4.2.bb
> rename to meta/recipes-multimedia/flac/flac_1.4.3.bb
> index d3ece3f3cf..badb43db89 100644
> --- a/meta/recipes-multimedia/flac/flac_1.4.2.bb
> +++ b/meta/recipes-multimedia/flac/flac_1.4.3.bb
> @@ -5,15 +5,15 @@ BUGTRACKER =3D "https://github.com/xiph/flac/issues"
>  SECTION =3D "libs"
>  LICENSE =3D "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Cla=
use"
>  LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3Dad1419ecc56e060eccf8184a8=
7c4285f \
> -                    file://src/Makefile.am;beginline=3D1;endline=3D17;md=
5=3D146d2c8c2fd287545cc1bd81f31e8758 \
> +                    file://src/Makefile.am;beginline=3D1;endline=3D17;md=
5=3Db1dab2704be7f01bfbd9b7f6d5f000a9 \
>                      file://COPYING.GPL;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
> -                    file://src/flac/main.c;beginline=3D1;endline=3D18;md=
5=3D893456854ce6bf14a1a7ea77266eebab \
> +                    file://src/flac/main.c;beginline=3D1;endline=3D18;md=
5=3D23099119c034d894bd1bf7ef5bd22101 \
>                      file://COPYING.LGPL;md5=3Dfbc093901857fcd118f065f900=
982c24 \
> -                    file://COPYING.Xiph;md5=3D3d6da238b5b57a0965d6730291=
119f65 \
> +                    file://COPYING.Xiph;md5=3D0c90e41ab2fa7e69ca9391330d=
870221 \
>                      file://include/FLAC/all.h;beginline=3D65;endline=3D7=
0;md5=3D39aaf5e03c7364363884c8b8ddda8eea"
> =20
>  SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
> -SRC_URI[sha256sum] =3D "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5=
f57fcaa83eb5a8e4"
> +SRC_URI[sha256sum] =3D "6c58e69cd22348f441b861092b825e591d0b822e106de6eb=
0ee4d05d27205b70"
> =20
>  CVE_PRODUCT =3D "libflac flac"
> =20
> @@ -25,11 +25,9 @@ EXTRA_OECONF =3D "--disable-oggtest \
>                  "
> =20
>  PACKAGECONFIG ??=3D " \
> -    ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
> +    ${@bb.utils.filter("TUNE_FEATURES", " ", d)} \

If vsx and altivec are no longer needed, you should remove that line
entirely as it is pointless if it is empty.

The reason you didn't see an issue in testing is that you probably
didn't try MACHINE=3Dqemuppc which uses altivec.

Cheers,

Richard


>      ogg \
>  "
> -PACKAGECONFIG[altivec] =3D "--enable-altivec,--disable-altivec"
> -PACKAGECONFIG[vsx] =3D "--enable-vsx,--disable-vsx"
>  PACKAGECONFIG[avx] =3D "--enable-avx,--disable-avx"
>  PACKAGECONFIG[ogg] =3D "--enable-ogg --with-ogg-libraries=3D${STAGING_LI=
BDIR} --with-ogg-includes=3D${STAGING_INCDIR},--disable-ogg,libogg"
> =20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183547): https://lists.openembedded.org/g/openembedde=
d-core/message/183547
> Mute This Topic: https://lists.openembedded.org/mt/99826072/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


