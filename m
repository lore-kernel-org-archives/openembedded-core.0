Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C721AC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 17:32:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.46539.1655832725949985204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 10:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IVfPC+zY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so7642111wme.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=x4IkM3PVB4/obY+jE7Qq20MmNVJ+glAj/pXsIKX8j+A=;
        b=IVfPC+zY29Ieg+BJkI0QOilu4GMbOU/PK3BxwwHdu1wLwYhhn8rMOK9TDb+SV9QWf8
         lNUSDfao6LR/yi7H4bTDzBoJBcUJcJKez2q3x1VlTzr0rWV5K4TJIw+U0aoXbUxRdfnI
         foe66mfRwjw22YiIAY/UrywOK3ex54opd9/vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=x4IkM3PVB4/obY+jE7Qq20MmNVJ+glAj/pXsIKX8j+A=;
        b=EnZMy7qSr/fg5sTuLGPKR/3mSHTkl5o6RIQ51l4OQ8umCEDmk+WcAg4iNeCb3we4Cr
         Y3e6KC4MCypvFgcEsXcyWgb7/FQ/4zV+c8Lt9zZgOmzR4dpvJt+9uAr7rDfUC3w/Brvx
         eXmsu/SBVLt4/YrBemqdLvvNXKuEhoC+RBDbcUkHBgRQ8n4OkbEZ8atxH7q6vuAOWJoO
         JUK9DLZsWXdkjDoN7ucB5omdUfCla8pRm6ljmQunt07uYTSBMLsbAUjXu2HnqMXNHSY5
         l5RBbuMVVFGte4WJUNEcc2OG+BqRCfKflXZXqcmzSzD6vSDVMYSmpeRcXxnYea37zDUn
         EWBA==
X-Gm-Message-State: AJIora8DbCeWBi3aJ2BDRhp2chQuPYgbwZc39etqgd7ZttJ4LHDEpQZ/
	HGYdmFDO0Wcfhl37Ebp6IZs7YA==
X-Google-Smtp-Source: 
 AGRyM1uN5TwEJt/bMyGFtiH5oQo3GxDtAuCwNzejC56889vtbRO7Kmlw3RiOKJIKkWr8CKR2kMgELg==
X-Received: by 2002:a05:600c:3c9c:b0:39e:e76a:7f1f with SMTP id
 bg28-20020a05600c3c9c00b0039ee76a7f1fmr24138979wmb.43.1655832724389;
        Tue, 21 Jun 2022 10:32:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:47af:4062:8031:47d4?
 ([2001:8b0:aba:5f3c:47af:4062:8031:47d4])
        by smtp.gmail.com with ESMTPSA id
 x5-20020a5d54c5000000b0021b88ec99cesm9552695wrv.94.2022.06.21.10.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 10:32:03 -0700 (PDT)
Message-ID: 
 <d0bd217004d6ff8fb860cd61eb23c6eab1ee39c3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [oecore][PATCH] bc: add missing bison-native
 dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2022 18:32:03 +0100
In-Reply-To: <20220618175258.4655-1-f_l_k@t-online.de>
References: <20220618175258.4655-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 17:32:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167168

On Sat, 2022-06-18 at 19:52 +0200, Markus Volk wrote:
> this fixes an error i encountered building for raspberrypi4 32bit:
>=20
> prefix-map=3D/home/flk/build/poky/build-raspi/tmp/work/cortexa7t2hf-neon-=
vfpv4-poky-linux-gnueabi/bc/1.07.1-r0/recipe-sysroot-native=3D  -Wall -funs=
igned-char -c -o warranty.o ../../bc-1.07.1/bc/warranty.c
> > ../../bc-1.07.1/ylwrap: line 176: yacc: command not found
> > make[2]: *** [Makefile:429: bc.c] Error 127
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extende=
d/bc/bc_1.07.1.bb
> index 1bec76bb2a..67453de822 100644
> --- a/meta/recipes-extended/bc/bc_1.07.1.bb
> +++ b/meta/recipes-extended/bc/bc_1.07.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504 \
>                      file://lib/number.c;endline=3D20;md5=3Dcf43068cc88f8=
37731dc53240456cfaf"
> =20
>  SECTION =3D "base"
> -DEPENDS =3D "flex-native"
> +DEPENDS =3D "flex-native bison-native"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://no-gen-libmath.patch \


The question is why you see that and nobody else has, including our
autobuilder.

I'm guessing something in your build is being rebuilt, hence the need
for bison whereas in most other builds that isn't rebuilding and hence
isn't needed.

Are you using a different configuration or extra patches or something?

I'm worried there is a reproducibility issue somewhere in here.

Cheers,

Richard

