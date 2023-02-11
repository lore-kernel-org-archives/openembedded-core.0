Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0682EC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 09:05:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6157.1676106308814771803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 01:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f17EmtFi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso7873253wms.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6k/5m8pyrNMSCgKaJ7WZOwuCGmf9fhlqG+KaZ3OSsUM=;
        b=f17EmtFiddmesWbYrd9MrAXonrVH0Egy0sJQV5DGpVc3Ej7x3q7GMHBwUyG2kw/7Kz
         NOqDez9Umg+qDjLO+IKN+XfVOkXSo2Cgd8LnvlToSk+DHvYGbKLoi3VhXVzbL5R2AjTG
         uYDlykX9pd7lxsth3qmLtFuKPRRXjelmOsTJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6k/5m8pyrNMSCgKaJ7WZOwuCGmf9fhlqG+KaZ3OSsUM=;
        b=X1my5ikkatqLqFDXQeBClrpwyA0CrY/F1qpEiur6MqbAB83GJfzuqpM2tUd5imT24y
         Q1EXIPAp8pi1DAhedvtLfo2Q6IYIu2wKfmAUujRpFLy1UKoOkj+X4ZlGcGkki0JPTP4h
         y0ogxFCPM1hyNrOqrc4mNdSkCR3GN+ktqzLXG5iYjIfw23JwwqPpvGyirIlBVJdSvxA1
         HRoQvHnWaFXDyLfLBCOkqwyeURvdQmTOLQG5GO2CkUjDzFbeEd0zgdwNR9F/ZlePyyEE
         xermTnE0HQCa6D/nYgAApkqo+mwCfFpk1dKUVAm32un2YSW4zhB9+d5dxrzejUNUaO6I
         TVVA==
X-Gm-Message-State: AO0yUKXOkHUdv1Jz5/Hh6eeRnTgSAgC+T1jbqcsYXHGECFeHA9tphUG4
	p+af3diAdwJN+KsBWFSkQyzWvA==
X-Google-Smtp-Source: AK7set+Gt43ffrC7zesgeA1/u9wTMGJnUOKNCuWpwAl5UWgyjXwZKm0VyfcVkW5jNVA1koyY+IvvXQ==
X-Received: by 2002:a05:600c:4b28:b0:3df:eecc:de2b with SMTP id i40-20020a05600c4b2800b003dfeeccde2bmr18396516wmp.11.1676106307131;
        Sat, 11 Feb 2023 01:05:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8831:de2d:784e:9e37? ([2001:8b0:aba:5f3c:8831:de2d:784e:9e37])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c5445000000b003dc492e4430sm7500291wmi.28.2023.02.11.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 01:05:06 -0800 (PST)
Message-ID: <99d270db661ec96c2e6f5a864962aaade7fd7887.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] graphene: disable neon support on arm 32bits
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Feb 2023 09:05:05 +0000
In-Reply-To: <20230211082609.6471-1-f_l_k@t-online.de>
References: <20230211082609.6471-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 09:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177002

On Sat, 2023-02-11 at 09:26 +0100, Markus Volk wrote:
> From: Pablo Saavedra <psaavedra@igalia.com>
>=20
> This disables neon support on arm devices only because it crashes otherwi=
se.
>=20
> Upstream-status: Reported [https://github.com/ebassi/graphene/issues/215]
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
> index 813ff74adf..1bbe7ecca1 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -17,6 +17,9 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
> =20
>  EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
> =20
> +# Disable ARM NEON support
> +EXTRA_OEMESON:append:arm =3D " -Darm_neon=3Dfalse"
> +
>  FILES:${PN} +=3D "${libdir}/graphene-1.0"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"

Can we tweak the comment to say why? Saying what it does isn't that
useful, saying why it does it helps to understand when it may be
removed in future. An example of how to crash it would be even better.
Was this just some some subset of 32 bit arm or all 32 bit arm?

Cheers,

Richard

