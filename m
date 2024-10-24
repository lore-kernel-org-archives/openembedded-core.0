Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FE9D0BB6E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 08:19:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9662.1729757964355715781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 01:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NLu1RAyQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47eff9acso404556f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729757962; x=1730362762; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7CboMkyNp8r1UKBEfI0Kr9LU0xlYRi9wsQXTnK17S4=;
        b=NLu1RAyQoKiJbVzXx58iA0HSynvAhb/abWzWdAe+x2AWyBVZDJoQdPKhBlAz5Y3SiT
         pMQo/3tbWePBRLLNSMmxP8JJmPWu4Psdv2a6HJ4gRhF8AJS+mUKOEhnBG0JnWXLA39F9
         33BcAI+AYn357VTd/k7ZZnXspwNwvhjzzkWl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757962; x=1730362762;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7CboMkyNp8r1UKBEfI0Kr9LU0xlYRi9wsQXTnK17S4=;
        b=fh0mZpq8XEfPc1nqHKwKBV/z+XZGKjrP/hKf19MdI2QSDx8tatIericDK6k77OiabG
         gLekQWATfKFBbPY87d+GbIHyNB4LKZV8/gG/2BK+0AnZSkepRlXmhnYPaUHSx/E1S3bB
         pnWJv7UFTLInXR7DdbXUJXgCNSCTlaRedpkShpRO3b5Y/TqEshGy9PWknPKTcdleVwuw
         Iuyakbp9oT/mRNaffleZD1Rp4NW5plleeTJevgXHUlGJxbxI7KNFlAmSJDnZ6mfTS74D
         U9jz64+SLNMQagb4LBuzLv9en/w88pVJ8Nn0FvV6JiCznIMRcxblLeUmxX4Zq5koFS/t
         Ugpg==
X-Forwarded-Encrypted: i=1; AJvYcCWKVW93eB3BsCgxvpr3gbgUe0Dikt7SuSIMo/waILatcH3rgZemEQxmZf6clkaG6O7HhB3OPAD3McyqN7eUbPrK9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxN3sI2Hk58OwuPb79JOtHF9F25yUksJ2tSF2DLztWEICenRmK4
	2yzRkW5x+lP0l60XWUnad7yAkvDMLlaAI0wcTU7ql1y+ZxmXF9pSMpUJlpnB55g=
X-Google-Smtp-Source: AGHT+IErGuaqa0hTotVsmPlbCm048ZKqH3A3q/4ORklDprq3azlMs/d2dbI26LaFBahghdAEk0UwDQ==
X-Received: by 2002:a05:6000:d0b:b0:37d:32ba:ee76 with SMTP id ffacd0b85a97d-37efcfacfecmr3470765f8f.57.1729757962447;
        Thu, 24 Oct 2024 01:19:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b35sm10794491f8f.2.2024.10.24.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:19:22 -0700 (PDT)
Message-ID: <d51cd8af63e7187d735d8ad7a6d72ded7fcf81a8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org, Steve
 Sakoman <steve@sakoman.com>
Date: Thu, 24 Oct 2024 09:19:21 +0100
In-Reply-To: <20241023184829.2216595-1-peter.marko@siemens.com>
References: <20241023184829.2216595-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 08:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206279

On Wed, 2024-10-23 at 20:48 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Release information:
> https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-changes=
-between-openssl-33-and-openssl-340-22-oct-2024
>=20
> Handles CVE-2024-9143
>=20
> Refreshed patches.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0...ke-history-reporting-when-test-fails.patch | 53 ++++++++--------=
---
> =C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 4 +-
> =C2=A0...sysroot-and-debug-prefix-map-from-co.patch |=C2=A0 4 +-
> =C2=A0.../{openssl_3.3.1.bb =3D> openssl_3.4.0.bb}=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A04 files changed, 28 insertions(+), 35 deletions(-)
> =C2=A0rename meta/recipes-connectivity/openssl/{openssl_3.3.1.bb =3D> ope=
nssl_3.4.0.bb} (99%)

Unfortunately this causes a regression in python3's ptest:

https://valkyrie.yoctoproject.org/#/builders/73/builds/270

I did revert this patch and tested a build and that passes so it is definit=
ely from here.

I'm trying this in conjunction with the python 3.13 upgrade which might
let us fix this for master but if so, the problem for styhead and
earlier will probably remain.

There was a related python bug:

https://github.com/python/cpython/issues/87743

Copying Steve so he knows that gremlins lurk here...

Cheers,

Richard

