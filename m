Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36F8CFA457
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:14:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11292.1729764871504111305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 03:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gf5vcArL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4800555e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729764870; x=1730369670; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBLQ8+wHbpcGL5KaKXwA1jq9RO3CqHKc6H64Srbo148=;
        b=gf5vcArLfqkrtOU+DxFv7h0rk9UhpVAdVxex5g8CGOLLgRqrHzI6UTNqr/g//fNvcP
         fO55Ayo+47viblQdtvDTBXyJGAGEEZVHZXWt38/bhZjyT8jNWh3K1C7mcEJ21Q2lNjVv
         Ob94F1S3anfh8q8/GyXVPlDl3xE61ryAtL58g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764870; x=1730369670;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBLQ8+wHbpcGL5KaKXwA1jq9RO3CqHKc6H64Srbo148=;
        b=gl9SGfZqS/oyZ7L5TNkrr2WjPsmWIuVpJg4Zw+kf1f7fTasLbQcgRvWAJo2ptqVNaw
         /hL76OAuzZsTiWNFSrMve9ylYpLS0QJIIZt5Nmi7gpWYxRgVRUU7tFdI5YWClNFbPcSw
         xQDqCek3mppZ1gTUZwZ2mLxPysXVa7K1XPcfsXIDBPW1enqj4MtpmFRplvCjq7cy1+4h
         AM6iSRKmasR80pc/tz7Nij4JWn4dgkAZsWq4G85RURol5a9L0J9VoueFocFD2EiJZw6x
         qnQGQqwJNmqPmMP2NexYujSzMBoYgGR5R4M/L67xlFjN6aMZ6B1A0viZtsdVa4HVSAXb
         3riw==
X-Forwarded-Encrypted: i=1; AJvYcCU+/IFnm7A0H28oLiMFgWsMgh1sCFx1nXG3IevQKUCwFAv7Si5pXKDTNh9fQYc9YlFqyJiUEPwGTqRq8VNAG1mD9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUQTO5xYtxqSTieTmOWq0LskvRRznHSMQLrA4JzIbUkAIBsgeC
	V5BjV1CxPAdZuvsFkrzSmAcfo+5iHDj2SPUSxgR004al7AmKtYMefECiQtEwXSQ=
X-Google-Smtp-Source: AGHT+IHZMvZzzmgbamgQtHdqutWsIPl+Ka0NQoVGu/JUBgZLPk3G1aOCOvc3Iehartljipz6fyaRzQ==
X-Received: by 2002:a05:600c:4584:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-4318bc8a8a8mr10325135e9.14.1729764869650;
        Thu, 24 Oct 2024 03:14:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c1db2csm40785065e9.40.2024.10.24.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:14:29 -0700 (PDT)
Message-ID: <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org, Steve
 Sakoman <steve@sakoman.com>
Date: Thu, 24 Oct 2024 11:14:28 +0100
In-Reply-To: <180155B44E341F73.23694@lists.openembedded.org>
References: <20241023184829.2216595-1-peter.marko@siemens.com>
	 <180155B44E341F73.23694@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206284

On Thu, 2024-10-24 at 09:19 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2024-10-23 at 20:48 +0200, Peter Marko via
> lists.openembedded.org wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >=20
> > Release information:
> > https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-chang=
es-between-openssl-33-and-openssl-340-22-oct-2024
> >=20
> > Handles CVE-2024-9143
> >=20
> > Refreshed patches.
> >=20
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> > =C2=A0...ke-history-reporting-when-test-fails.patch | 53 ++++++++------=
-
> > ----
> > =C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 4 +-
> > =C2=A0...sysroot-and-debug-prefix-map-from-co.patch |=C2=A0 4 +-
> > =C2=A0.../{openssl_3.3.1.bb =3D> openssl_3.4.0.bb}=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> > =C2=A04 files changed, 28 insertions(+), 35 deletions(-)
> > =C2=A0rename meta/recipes-connectivity/openssl/{openssl_3.3.1.bb =3D>
> > openssl_3.4.0.bb} (99%)
>=20
> Unfortunately this causes a regression in python3's ptest:
>=20
> https://valkyrie.yoctoproject.org/#/builders/73/builds/270
>=20
> I did revert this patch and tested a build and that passes so it is
> definitely from here.
>=20
> I'm trying this in conjunction with the python 3.13 upgrade which
> might
> let us fix this for master but if so, the problem for styhead and
> earlier will probably remain.
>=20
> There was a related python bug:
>=20
> https://github.com/python/cpython/issues/87743
>=20
> Copying Steve so he knows that gremlins lurk here...

The 3.13 upgrade doesn't help so we're going to need to resolve the
ptest issue somehow to merge this...

Cheers,

Richard

