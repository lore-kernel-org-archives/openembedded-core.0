Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D73CF6497
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 21:57:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.41734.1727647073405238593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 14:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=REohJfoz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37cd8972738so1431497f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727647072; x=1728251872; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4Tpl3a7o7QAsm44Dam9pBagXr0SQ/5vGOMpODk9RNY=;
        b=REohJfoz8zy3BaaxQzPXyw/aFX0E9f7FxkYzMR5RC+OYp7deBSp4ps6o3N/FGQ8v2j
         60gYL+m10H1TN49cXOqoIckQAc0zZIv7l/AJooQEVqPqPUXeXD+DiNGwP5pNN54HImw7
         Wr1Ig9kK4yt1+QiX7oZTEEOqLjc+LLZXXM+mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727647072; x=1728251872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4Tpl3a7o7QAsm44Dam9pBagXr0SQ/5vGOMpODk9RNY=;
        b=Z0v1fKwYKz+HKdII4PDQtkXkM58sH9xsfsT7Rn9sDN9IGja+nf7FWBxBnwkXVrq/Q1
         4M3zgH4Ej9b2FP4niLvSZNuRJJOx2xNfy3ivbm1GTak3fL7vlfncFcjzLNWQzcP2g9BU
         QltGu8IH5wfhGE8xJPmS0vKPUF+QCd3BthFaeJgiFm+DZ6BtoL62+Ojr/vmaKx7XIRif
         OWXRRjq6GG4LGJTB6HShyGOH2xJ873Ix+zxMNSNOtTdFaGUE1B9HVJKf25l8akrvQfxl
         ypnUJ0OhswDi0vvRKMC/9feXHxktrfsBKfBAFYzJDTemtcD/wlXVF/cGM/H8Np4pviFt
         +fmg==
X-Forwarded-Encrypted: i=1; AJvYcCV8RQdgFHokFiE41HbdFKnTBjpcCgKRtxrg7NCQIJl1hEjSbMlJWiZomcjjnnSfsD8KyZdsV/6HbXN6AeuefZ0cNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxf1yfu7dOXma1TMicVFK1Z2K1a6WqRU7fPCsw5ARfd7HlkkMzq
	mw974X77kV5mzOXCm6aisLQ7Q8zjncHui6Ay+PTJ3HcAFAh6ZHJqSgZ/o31gZtc=
X-Google-Smtp-Source: AGHT+IECN/9JrZ/fs3/oTYmYSqCGN8n2TYj98C4kZl0zAbiodTVB0+hoGoBZbVYZYCpyM2/DrlF7Uw==
X-Received: by 2002:a5d:6452:0:b0:37c:cdb6:6a8e with SMTP id ffacd0b85a97d-37cd5aaf7a0mr5884841f8f.1.1727647071691;
        Sun, 29 Sep 2024 14:57:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4fc:7d1a:40a4:46e8? ([2001:8b0:aba:5f3c:a4fc:7d1a:40a4:46e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fdb0sm7588084f8f.89.2024.09.29.14.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 14:57:50 -0700 (PDT)
Message-ID: <2bd45ff2788e33784e47a6c3c9d0faab2ca05380.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH] meta-toolchain: inherit nopackages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: atharvanandanwar@outlook.com, openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2024 22:57:49 +0100
In-Reply-To: <SA1P223MB1187C93538CD6219C8C10402CB752@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
References: 
	<SA1P223MB1187C93538CD6219C8C10402CB752@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 21:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205060

On Sun, 2024-09-29 at 13:55 -0500, Atharva Nandanwar via
lists.openembedded.org wrote:
> From: Atharva Nandanwar <atharvanandanwar@outlook.com>
>=20
> - buildhistory emits hard error when no files are present in
> =C2=A0 package-split.
> - meta-toolchain doesn't install/package any files, hence inheriting
> =C2=A0 nopackages should allow building this recipe again
>=20
> Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
> ---
> =C2=A0meta/recipes-core/meta/meta-toolchain.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-
> core/meta/meta-toolchain.bb
> index 260e03934e..c97cc68ad4 100644
> --- a/meta/recipes-core/meta/meta-toolchain.bb
> +++ b/meta/recipes-core/meta/meta-toolchain.bb
> @@ -2,4 +2,4 @@ SUMMARY =3D "Meta package for building a installable
> toolchain"
> =C2=A0LICENSE =3D "MIT"
> =C2=A0
> =C2=A0
> -inherit populate_sdk
> +inherit nopackages populate_sdk

This shouldn't be needed on master since:

meta/classes-recipe/populate_sdk_base.bbclass

has:

inherit image-postinst-intercepts image-artifact-names nopackages

Cheers,

Richard

