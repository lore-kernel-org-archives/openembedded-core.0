Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED82C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 21:02:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.192616.1703970157210486702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 13:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D5/iP/Uh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d60a96533so34074435e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 13:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703970155; x=1704574955; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aEjikGgEmz/W4/Tu9MQaxE1iUQ9epS0Rl7rJ06qUBuo=;
        b=D5/iP/UhPA2bCP7BgwaKfxW1LObJI0GV9Q03+QqvBue8x5n4s/0Ron7kjejAP44Kib
         MAA22DTjBAXXr+/r9p9CAvMd8NT+EsrsOYsqe1iXXlxPAvFR4xdBBLzjfzURZ1SKpJ5j
         vyRdicFhwx39DBu2gGYyx6BcVLIzn3kydx/Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703970155; x=1704574955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEjikGgEmz/W4/Tu9MQaxE1iUQ9epS0Rl7rJ06qUBuo=;
        b=YUTH/WzzRT7fnExUrlZqcJAjwUZbvn2Ru/lS0p9k+avYlj3+ZZD2R3qib2tGzWYLom
         aZkwgFYczai43IzBdVjbINf2F/BXj9P8NBifg4OR8xKuIsId5rkJ80ryeH7Izp/KDtHo
         hD7tTj4GJsSmSrPjozlNwxc685ityUNeNQBr4MBGVWS7nA5+8+9+mj9seQEQkDInNq+9
         zF5CYInYKw6cZcnwVKgoz4wSBK1QSTg/BIWyn3hEmt4GVE1rElq72WSLmefAa6p9xsno
         yREMBEL53EVJS9qJJafs5gtj4qqZ6jkMCWuMnyAAiI4zrZzyR1xFMucx92X1+8Lubr5X
         ACaQ==
X-Gm-Message-State: AOJu0YxG05tX9HXP3lf63B3p5hHFhUOM9467O6oo32lldRnQ73ZomwH5
	jkOq+2JHLDm3kQFrC2E3j5Lp4a1ISoBOXw==
X-Google-Smtp-Source: AGHT+IG1hVrih8pSX7aodOA08KOqpN9j42LulDBtNNrry7FS1vzmMqpUyqHg9ODVvTJMshDeBdE2DA==
X-Received: by 2002:a05:600c:5187:b0:40d:6116:d54c with SMTP id fa7-20020a05600c518700b0040d6116d54cmr2809402wmb.57.1703970155361;
        Sat, 30 Dec 2023 13:02:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d13:c281:7606:c2e7? ([2001:8b0:aba:5f3c:6d13:c281:7606:c2e7])
        by smtp.gmail.com with ESMTPSA id az39-20020a05600c602700b0040d8543a861sm1475392wmb.24.2023.12.30.13.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 13:02:34 -0800 (PST)
Message-ID: <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: =?ISO-8859-1?Q?Zolt=E1n_B=F6sz=F6rm=E9nyi?= <zboszor@gmail.com>
Date: Sat, 30 Dec 2023 21:02:28 +0000
In-Reply-To: <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
	 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 21:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193084

On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>=20
> Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
> (newer one). Extend the "opencl" package config to include both
> implementations into the libopencl-mesa (-dev) packages. As the Clover
> implementation is in maintenance mode and is expected to be removed at
> some point, it doesn't make sense to split the packages or to provide
> two config options.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> [DB: reworked rust class inheritance]
> [DB: merged "rusticl" and "clover" back to "opencl"]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index efbce5caade5..a192562a7935 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -48,6 +48,12 @@ PROVIDES =3D " \
> =20
>  inherit meson pkgconfig python3native gettext features_check
> =20
> +# We can not include rust conditionally, otherwise it can not be overrid=
en by
> +# the bbappends.  Instead always include it, but remove the dependencies=
 by
> +# default.
> +inherit rust
> +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', '', '1', d)}"
> +

I'd really prefer not to have the rust inherit unconditionally. I have
some ideas about how we could fix this in bitbake so we may need to
wait for that if we can't avoid the PACKAGECONFIG issue from appends...

Cheers,

Richard


