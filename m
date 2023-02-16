Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64215C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:23:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.14433.1676564607172995938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 08:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vz06H2W4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r2so2383751wrv.7
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O42p1RY5EN7LwwctdHzWBanHqH72JRyMahpjapw6250=;
        b=Vz06H2W433slBGmPrtsSWDiDWyoPXJt25H5pY3QzhX868w/MV1ZMrQaBf2N8j9/kNO
         3X7uV4o6fA14pzKkvkaCXzv42/IfRGZXLyz2JhGXH3FfwlwpeA/1eTQsqIswK0BwdHsG
         +n6Ts8K5FnLIe7GhNmfULF17lhyCbsAW1NQcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O42p1RY5EN7LwwctdHzWBanHqH72JRyMahpjapw6250=;
        b=G3G6JctVCWGdOz2olaRypKtX0znRZxlWJUYM61Z73nQ8MYX7JoxweVIvCEfRvVOEJB
         gxuU7Yq9IsfPEl6C+S2nRkqWD35Itxb1z0JR3MVptXgGAhT0ODiRnfju107GCGkt/kMw
         I3wJI6dwBY53my0Alzb7LkXjG9lQ6z3RQrNAALVvbCt0Vj2yz2WOY/rnpAifKCpfG9zU
         BX0Ptx25vzmq2fK8nbu2cM8ZXdEGNOfkcECngpojnR0J9Wh3l/6YtGyzCTQiqzQp5//G
         S5llz+Tl6x3yfUjcegztQJFM5aFQ0l+BpRYRmZRUWxy8MGIu5ACListxdrZhrqFhl7/P
         Z5IQ==
X-Gm-Message-State: AO0yUKUy7z5ytV0JRnQfrcnBVCd5FGsJrDqOAZxAANFhK76u1SdRlKBc
	5y5AxkiIWwUWQfeT/ajC32KA8Q==
X-Google-Smtp-Source: AK7set9/WOIju5OipDVNWy3sKlIY5Z4sBswENdxT7ebaFFKA5pYhwozUDpNNctzfK7asJPpqXbSZ7Q==
X-Received: by 2002:adf:e401:0:b0:2c5:4cd0:4b86 with SMTP id g1-20020adfe401000000b002c54cd04b86mr4824996wrm.68.1676564605627;
        Thu, 16 Feb 2023 08:23:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d39a:5560:699e:2da6? ([2001:8b0:aba:5f3c:d39a:5560:699e:2da6])
        by smtp.gmail.com with ESMTPSA id x10-20020adff0ca000000b002c54c9bd71fsm1919388wro.93.2023.02.16.08.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:23:25 -0800 (PST)
Message-ID: <fcf9689ec798d36681dcc55012605ba45c66355c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] python3-atomicwrites: add BBCLASSEXTEND
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Thu, 16 Feb 2023 16:23:24 +0000
In-Reply-To: <20230216151005.3469200-1-ross.burton@arm.com>
References: <20230216151005.3469200-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 16:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177296

On Thu, 2023-02-16 at 15:10 +0000, Ross Burton wrote:

You can do better than this :)

*Why*?

I can tell from 3/3 but it would be nice to see it explained here.

Cheers,

Richard


> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb b=
/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
> index d4d15cea509..9f58a4bf1ff 100644
> --- a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
> +++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
> @@ -22,3 +22,5 @@ do_install_ptest() {
>  }
> =20
>  RDEPENDS:${PN} =3D "${PYTHON_PN}-misc"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177291): https://lists.openembedded.org/g/openembedde=
d-core/message/177291
> Mute This Topic: https://lists.openembedded.org/mt/97007312/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


