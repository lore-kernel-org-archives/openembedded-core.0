Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF294EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 19:44:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.324.1687895085215090245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 12:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hwsm8dcA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a113so29192525e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 12:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687895083; x=1690487083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkSXPbw0ofnHrFxNStV01eze1uKL7vS3Aoo8v73TvUs=;
        b=hwsm8dcAh3YZyJAA94ayLmSXBZ+HljXyw+N6TdZUcWF0HsHpl+w3gJpUENWCU+7wGR
         Us2w96xe4T9S8jXqMa5GCdSCy7Z0Lz4euyhRCSvUQL15tWWg50uNLHmVqVLXRUy1AiRW
         lRQS9iQt0hW7e+tBxUhgpC6wXvnOoHp4FMLi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687895083; x=1690487083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FkSXPbw0ofnHrFxNStV01eze1uKL7vS3Aoo8v73TvUs=;
        b=RzSOZYguu3TlgqLs0SkNKA9EL4Dazljn9m386bcBldFxDCIVT0uJQY2PnX2cyc02LD
         OgsufcRLtigpni6MzxDyIfziZrGFOsKnUdYquHqsBBgzqezzLYALC0FyQTP35LQUOA5s
         efTxr3OzK3ptHScAnEJOv67sT1IcaJ6olxA58bS7srrtgDafim0qPJPlnI4ql9qKjwlB
         mgSDq33bJOihpqJgMMu0xnwlp/3KZctEPCU9CbQp/LM9mXMuLvpD3peKc4Tb70WvHQb0
         W9tDIA0r5GrxuejgM5c/zATRyjz7VJJudiJ75lEK5cFQ/zVrHllSt/BfHPTVl7Ql23K9
         iX/g==
X-Gm-Message-State: AC+VfDyWhyL41jBGqM4x65TYi3eLk3neMy0D63XjQ5XRhZRj5f9A1pom
	bj8fCwNSu+y15YfNAfmrioxDTIWaYgsLhAoP6T8=
X-Google-Smtp-Source: ACHHUZ6602Ds1FQUY9ysN35Y3alRbHwCRjsD9RsVjTiprlzZGnK1JMTIgKF4V3VqM39Qb3OFT+Fspg==
X-Received: by 2002:adf:e387:0:b0:313:f395:f5a3 with SMTP id e7-20020adfe387000000b00313f395f5a3mr4848205wrm.38.1687895083451;
        Tue, 27 Jun 2023 12:44:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a71a:20d6:74fc:9334? ([2001:8b0:aba:5f3c:a71a:20d6:74fc:9334])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d5682000000b00313ec7dd652sm8434261wrv.44.2023.06.27.12.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 12:44:43 -0700 (PDT)
Message-ID: <57767c7b848e0d060ffd0d7b5a81380971186b91.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCHv2] Upgrade flac 1.4.2 -> 1.4.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Siddharth <sdoshi@mvista.com>, openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2023 20:44:42 +0100
In-Reply-To: <20230627041643.7011-1-sdoshi@mvista.com>
References: <20230627041643.7011-1-sdoshi@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183501

On Tue, 2023-06-27 at 09:46 +0530, Siddharth wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>=20
> License-Update: URL fix
>=20
> Remove PowerPC related options no longer supported upstream.
>=20
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../flac/{flac_1.4.2.bb =3D> flac_1.4.3.bb}              | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename meta/recipes-multimedia/flac/{flac_1.4.2.bb =3D> flac_1.4.3.bb} (=
80%)
>=20
> diff --git a/meta/recipes-multimedia/flac/flac_1.4.2.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.4.3.bb
> similarity index 80%
> rename from meta/recipes-multimedia/flac/flac_1.4.2.bb
> rename to meta/recipes-multimedia/flac/flac_1.4.3.bb
> index d3ece3f3cf..9ef9ca75ef 100644
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
> @@ -28,8 +28,6 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
>      ogg \
>  "
> -PACKAGECONFIG[altivec] =3D "--enable-altivec,--disable-altivec"
> -PACKAGECONFIG[vsx] =3D "--enable-vsx,--disable-vsx"
>  PACKAGECONFIG[avx] =3D "--enable-avx,--disable-avx"
>  PACKAGECONFIG[ogg] =3D "--enable-ogg --with-ogg-libraries=3D${STAGING_LI=
BDIR} --with-ogg-includes=3D${STAGING_INCDIR},--disable-ogg,libogg"
> =20

This needs the altivec piece removing from PACKAGECONFIG else we see
this on qemuppc:


https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4775/ste=
ps/12/logs/warnings

WARNING: flac-1.4.3-r0 do_configure: QA Issue: flac: invalid PACKAGECONFIG:=
 altivec [invalid-packageconfig]

Cheers,

Richard



