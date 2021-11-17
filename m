Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2B8C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:58:54 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.10813.1637171933056995173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EmDVL4Eh;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id g14so14928323edz.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=LU6OzwyjIExyN9aanKm0c5jegCeI/JQYi6HoVwoj9To=;
        b=EmDVL4Ehr+ADM68hJiorSZiT3et0T5o/5kfQ2dwXGBq7IfWrddtB05rfc9UJ0I6OM6
         0YpTFhDdXGdZxE8lxwWzN7VJ3C7VqrymxC9F4HJdqxF/lOy6nvmBxxLA/4nO3/qIh5+x
         MtswlqMgZTyGFN46XmnGda6uEf/jfZI6dmY8zApImxVVZLPq/q47RD2i7BzG0VfI2ZU6
         CBSs4OUNVZVsftPg2MleK2u0WHtqPJFMiKJAFM0UzE+yvYEJfqoltRN9qWEf0is/TaE2
         MX/AgSCA2Dtanp9eNrSsDeyusQWQHxYSzIbN2jKQWQSFgct+G3oc74My9Gs3Mrf85xFK
         H0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=LU6OzwyjIExyN9aanKm0c5jegCeI/JQYi6HoVwoj9To=;
        b=KQmG07MurjP0NFS0+iGsdXWBj4GxaSAc7/QYa7McaiYkTE30lr6o3ibKnTwimVni0E
         gaEmgIv4chx2zBDdo9lODYE9Xfm/D62XjGJ/2gKRW25BXasFFtb+7VOIWtaEs6xiYHwz
         e29JndZOwgTn81UhG/ycjm2SQGEdrMgG/rDjV11G8XIBTlHXB2JttHydlEANGDz7g/x/
         RaXCEZ/7AJnRCOawtxKl7PM20zaUUXratcxyCaYtbGQlReWEfDnsbXHugWQzYfGYA++g
         sAFjoq4QOo6+ygloFXpxkZnCMZz7BM9t1ZYk52l0EONVUZD3mYv7Qdi/Krr2ED5BY4EJ
         kOdQ==
X-Gm-Message-State: AOAM530KkEDhS31hGjZFMOSmLJR+q2HrATJLGjXWQpSB8tSXfsYHldkc
	c+urEh/9E/F6Itk69RX8FuI=
X-Google-Smtp-Source: 
 ABdhPJyUi5G/822Y641ltO6mWGWsMdTDhXiPmgPI4GWi0sqNsE8csnBe9FFuwjozFeEi13OSL80sKg==
X-Received: by 2002:a17:907:7f8b:: with SMTP id
 qk11mr24032516ejc.238.1637171931139;
        Wed, 17 Nov 2021 09:58:51 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id f7sm291693edl.33.2021.11.17.09.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:58:50 -0800 (PST)
Message-ID: <93ea5b14557d6803b7a040c1aa35492674e9944b.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 6/8] kbd: add nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 17:58:49 +0000
In-Reply-To: 
 <0451887421f06e23f56f63a1f0298c6a2aa25c7e.camel@linuxfoundation.org>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-7-luca.boccassi@gmail.com>
	 <0451887421f06e23f56f63a1f0298c6a2aa25c7e.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-N034YTEO5yXCAn81iyf0"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158447


--=-N034YTEO5yXCAn81iyf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 17:43 +0000, Richard Purdie wrote:
> On Wed, 2021-11-17 at 12:31 +0000, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Required to build systemd tools
>=20
> If systemd needs these to build, wouldn't it be depending on kbd-native?
>=20
> Or are you saying that systemd-tools needs something in here at runtime?
>=20
> I don't mind extending the recipe if we really need it but that isn't wha=
t the
> commit message says so at the very least that needs to be clearer.
>=20
> Cheers,
>=20
> Richard
>=20

It's probably indirect, I guess (dependency of a dependency)? This
series was the bare minimum required to get the recipe to build. The
build failed with "nothing provides nativesdk-foobar" without these.

--=20
Kind regards,
Luca Boccassi

--=-N034YTEO5yXCAn81iyf0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVQtkACgkQKGv37813
JB4f6Q/+Pi18/4odnnCZXY7aoT2jjAw7WsU+mxFWmKV2fY8WTO5gmYZHHIc4bDMo
zMeUzGhkXVjWkORPYhlZ7civ76VRLHSP9PAxEZ7mUS0cUPBf1T3lUb/vDEV688mN
jZuw23Nx9OHNsWjJpOtD/hIHoO48++jUDXNTd5V6Kg0LIW9jPDLcRtXZUkPeYJ58
AQoCBe76IbLau/E+lIOkjCiUGIs58BmTqh+HbutB38tv4xU8dtRgkDvJAtTxZBKO
kqCufxXZOXkLJaX1yXHZAq8tzO9Fj2FW9tplO4oBBK6/yT/ZRIWuYI44j7jcwGzX
PnUXvM5GE3EZpYFhFyKMBmW8NjCnTCvq38OWgmjxIq6EeLZId/nosu539MpLXm+V
ZeVRNhRgkVA+G8NfpA2Z7fnFbZBi3Jryl0k2CG7BZFVPuvuN35KoXWkaSAMjWVzi
LM+CyIEDqPHVdolbCMj1wkCs39HAg5Yk+XBNwqpSeWRyW2oYnX3ZodpeMWCUcuQK
GaiQI6DNwAQXkpkWetdNnjNTOLUTOuTdScs91qp/bZMoKwU9N6VtiZhk72aQwqvY
qyDwzNAcspXuNvAejHZnVUsTqfZdB9h4zd+m+tQq607BoBSr04fhqKl97eOZ2Dpx
JKqYSgcDYSbkO4OQ53JbUa/mQmo6paMXkzyU9Tf8XFuZ6OS4ybE=
=gkBD
-----END PGP SIGNATURE-----

--=-N034YTEO5yXCAn81iyf0--


