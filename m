Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866B3C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 22:15:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4402.1654121713282187140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 15:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mn1mWirU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so1824729wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Et5F59DznywION2LHjpzEKIXaWVJb7nODV/XdiyV97k=;
        b=Mn1mWirU/skeZPXUzM4YyM7NV3/qKUSB733PFQjfS78DU9TA0Y+80ux3CUgIRHyNnT
         +OE4VaSm+BLKc/MPZ3+p4GJz3ER5n63bO7AL6kqPf53svswkVpyEpQf77RK49jHdsERa
         tQehYK8xdtXtiSSbXA2DHZ+szz0qTPGfeeb5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Et5F59DznywION2LHjpzEKIXaWVJb7nODV/XdiyV97k=;
        b=ROyDG3MNk2AnFY44cgCSauaKGuwvKullJJBgrQMbgMDTX7Gzpt3fZSbQemaxkRQF/p
         mR4I7FLGXJe35Y/hzwLlh7zmR8SKe7TFhqtvcpwMCF+WLQMIV5+rhSePGMXKm6vn0dK0
         LaJHPAkHwybS1RC8s6ho6QH1iKGQOp4poPDU9hWqlveXZjzpPG+Lrp15WCtoDElZP4hr
         pYlhh5wPHaVb/UZ5mIrgeYs6mwvazEXkreZR8t5Qx/QAKw+OHQZ1ZJwdSH80DbgcINoc
         fyEwi8G6Mfh6ym5Bp1yPMVojWVgVAGF3zyxipj6zH/CyBAf2IZcaFTcZqi7mfNmfodOD
         MgGw==
X-Gm-Message-State: AOAM530JHTsL/RT39vGbLHqbxISK9VOn4k0kRKvM65atQCgYKGqNcljO
	l+NgbsEqhz/NSw7YaMzvn2y5Cw==
X-Google-Smtp-Source: 
 ABdhPJwv0jkTBl7c5OFTOMlkhV3li0+/ZVWCar+n9wXNdpr5aeEEfA6V0W6pI/Y6Iom6yOeiNM5YHA==
X-Received: by 2002:a05:600c:3646:b0:397:326d:eac7 with SMTP id
 y6-20020a05600c364600b00397326deac7mr1307767wmq.43.1654121711538;
        Wed, 01 Jun 2022 15:15:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:31df:3763:186e:409f?
 ([2001:8b0:aba:5f3c:31df:3763:186e:409f])
        by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003942a244f33sm6566972wma.12.2022.06.01.15.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 15:15:10 -0700 (PDT)
Message-ID: 
 <17046dccfb415c1afa9851ab45b90fe04114798a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: depend on zstd-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Jun 2022 23:15:10 +0100
In-Reply-To: <20220601205504.3464879-1-jpuhlman@mvista.com>
References: <20220601205504.3464879-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 22:15:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166443

On Wed, 2022-06-01 at 16:55 -0400, Jeremy Puhlman wrote:
> Sharing sstate cache binaries between two systems, one with libzstd insta=
lled
> and the other without, leads to various gcc components being linked again=
st
> the system libzstd and failing to run on the system with out it installed=
.
>=20
> Make zstd-native from our system available.
>=20
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.2.inc
> index 68e0d203fc..e2a28468f5 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -11,7 +11,7 @@ BINV =3D "11.2.0"
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> =20
>  DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> -NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex-na=
tive"
> +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex-na=
tive zstd-native"
> =20
>  LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"

Does master have that issue?

Cheers,

Richard

