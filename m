Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DA7C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 16:36:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.22720.1721666214761840077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 09:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1BVN13k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-427edcc207cso102425e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721666213; x=1722271013; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8EulSyKCAVQIYNhBKjgucYGW0KyRN6i4bEj/xRDze54=;
        b=c1BVN13kw+Me52scnEI/WiI15lmFSeD+VoIX4LeqvcoAj5x77a2BFw3N4DTxxktil2
         jsywcsDZEHzLMi4PSb+baPZhj/bfc5Y3aGNVSmhIuHNyXq696eRkdZx7+jKzcCuaHmRo
         lNthbihBbfiPr7S3vn941IATIaJeRQk6NrU0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721666213; x=1722271013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EulSyKCAVQIYNhBKjgucYGW0KyRN6i4bEj/xRDze54=;
        b=GJY/YFavbaj2yAhduDWbxi+0GdfW9MxuAHsgChSDHM1dwXpkC+l0Z8saiBF4rqFgGU
         gHpkEu6+mr0yNQiZX6jzbP2ASrv4nfI79OheUDT+8Th3It4/2yaxCFEuOREkZZi6EQ9/
         0L2AoHCTZ2ydtA3ihbNUAuNNhH9DUwlcdF/D5HJaK/pVq72qweQV8qnFPyTpJnnwCirh
         T2R//Vy6vui/9a+fgz3zD3NgnUGPnUW8a2W73dgw+/3rSSSOU/KUva3nLq9dLFHTQNQA
         s9h/fCPqrhe97Ts3I1GKnWbY0WT1TW5WY6Zq9r+FrQaV9b69ks2nCZeUCxFFAPey4NzZ
         C05A==
X-Gm-Message-State: AOJu0YwPD29hZDASq+6vxd7+kfjkzQubfuYP429wWi5oi6u0lGqEd5iX
	uwP8aDgZA2OUKDI9UewZq25My+Zck4g0kzB78OZtuEAxBuaHzG9zLcWFiuEc194=
X-Google-Smtp-Source: AGHT+IHOIPSQiNnjxg6xeqKq7xo0bnSAnM+NpzIV2A5E+egOMHQm4ze0hMk1H6mHWrKJT249v7Go3w==
X-Received: by 2002:a05:600c:1e10:b0:427:9dad:e6ac with SMTP id 5b1f17b1804b1-427ed06158fmr3541105e9.34.1721666213124;
        Mon, 22 Jul 2024 09:36:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ff2:149f:b661:e63c? ([2001:8b0:aba:5f3c:1ff2:149f:b661:e63c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878684767sm9033970f8f.8.2024.07.22.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 09:36:52 -0700 (PDT)
Message-ID: <90ef6669ed9ada15d6db57cdb24059178bf86207.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFT][PATCH 1/2] glibc: Upgrade to 2.40
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2024 17:36:52 +0100
In-Reply-To: <CAMKF1sroJs_73HtyVYszWog2dr3zrUgsJqmF5+SourfUcg9+ow@mail.gmail.com>
References: <20240721180336.2642270-1-raj.khem@gmail.com>
	 <f4d52025ba8c00ceaf60819d21ebf62532e8b535.camel@linuxfoundation.org>
	 <CAMKF1sroJs_73HtyVYszWog2dr3zrUgsJqmF5+SourfUcg9+ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 16:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202318

On Mon, 2024-07-22 at 07:18 -0700, Khem Raj wrote:
>=20
>=20
> On Mon, Jul 22, 2024 at 2:22=E2=80=AFAM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > On Sun, 2024-07-21 at 11:03 -0700, Khem Raj via lists.openembedded.org =
wrote:
> >=20
> > Thanks Khem. I ran this through the autobuilder and there were only two
> > failures. One expected as it tests the buildtools libc which doesn't
> > work until we upgrade uninative. The other looks to be an intermittent
> > qemuarm failure. From my perspective I think we're looking good to
> > merge this!
> >=20
>=20
>=20
>=20
> Cool yeah and today the release also came out so I am not expecting to ma=
ke any more changes to the RFT series=C2=A0
>=20

I've gone ahead and merged it which lets us proceed with a uninative
build/release.

Cheers,

Richard


