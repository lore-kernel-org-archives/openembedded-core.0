Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85B4C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 20:22:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2778.1718310172385806010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 13:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LsAo/jgt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f123bf735so1047960f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718310171; x=1718914971; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Ex/bpMQg6QL2eKhGgfttKV1Qtjglm/N+11ECurfQ20=;
        b=LsAo/jgtC7kxAahz9jHEgw22DQFg9hjZRkhSvFNrCmed7lrlilR1mSu1zuNTsDkx9C
         Da7nyig3uhsIXZVL0VltR4JYxA73Q1Lj7wuzw7HAnqIV5CGpyc14tOoQ5laAFk2AAjA1
         hyxaqTSgNQopUgIx6q7GKdSVo4cpiKph4R9pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718310171; x=1718914971;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ex/bpMQg6QL2eKhGgfttKV1Qtjglm/N+11ECurfQ20=;
        b=Q7LUGSpF269kvXM8zQYPHl1ei5iRa3t0ijrrJiirJ7bv4gjmmnlid+w44fq0IFMLOf
         XCQSPMycrlyxUDSj5jQGaPMqefic0h2cdaLpJR57ITUaqd/0g+UpmHfcnmBgC+tKwXm3
         k1dP/vywOYuFtx7HvqC+QItjEcP3CgVO3xP3BMftavR5VK6yokC1ex4xynrtHymca1CG
         /kTKtuKQZnlxGlsCg49yBV4GxPxxPPhd2e+OwJWO0X2VECMtZQMzQUV7+GzvNZcyG0PF
         987T/2GuQsj6LVWhOqCEe9mtQUIawNYQdh5jMNFDev6Rt2n2+f2XytvImT9sgbkI96Gh
         4Osw==
X-Gm-Message-State: AOJu0YxLcEciAS5XpsTNBpcD6YUxGUtJAyRWuhcdS1mWZUaCCPRmIKzO
	DvqZOn5RxrizNQa8FdaTToURoM9rSb+pWwy/yccAc9x0u6/DbiMlWe8TYDRTCYk=
X-Google-Smtp-Source: AGHT+IEmc9eAKDrPjfgVPE1knDdqtmf5cNUBqSCTKOwpH/l7YyR9HmG3ca81G4/NiKjvTcHXXJpecQ==
X-Received: by 2002:a5d:6750:0:b0:35f:320e:e697 with SMTP id ffacd0b85a97d-3607a7c2fbemr460210f8f.34.1718310170877;
        Thu, 13 Jun 2024 13:22:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6937:7920:d:ef6c? ([2001:8b0:aba:5f3c:6937:7920:d:ef6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f2407sm2616602f8f.72.2024.06.13.13.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:22:50 -0700 (PDT)
Message-ID: <81dc7b8327a4e18655db76ffaed23e3ca8d073d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gcc: remove g77/f77
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2024 21:22:48 +0100
In-Reply-To: <CAMKF1sqKt13o1DbyVmw3OARQu5u=CP4z76PKdidfPqfridvYJw@mail.gmail.com>
References: <20240613115159.3660790-1-kai.kang@windriver.com>
	 <20240613115159.3660790-2-kai.kang@windriver.com>
	 <CAMKF1sqKt13o1DbyVmw3OARQu5u=CP4z76PKdidfPqfridvYJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 20:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200638

On Thu, 2024-06-13 at 09:58 -0700, Khem Raj via lists.openembedded.org
wrote:
> On Thu, Jun 13, 2024 at 4:53=E2=80=AFAM Kai Kang via lists.openembedded.o=
rg
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> >=20
> > From: Kai Kang <kai.kang@windriver.com>
> >=20
> > g77/f77 has been removed from gcc 4.0.0 via commit:
> >=20
> > * b4117c30610 Makefile.def, [...]: Remove all mention of libf2c.
> >=20
> > When set
> >=20
> > =C2=A0=C2=A0=C2=A0 FORTRAN =3D ",f77"
> >=20
> > it complains with error:
> >=20
> > > The following requested languages could not be built: f77
> > > Supported languages are: c,c,c++,fortran,go,lto,m2,objc,obj-c++
> >=20
> > So remove g77/f77 from gcc recipes.
>=20
> Looks fine to me.

Agreed, this looks like good cleanup thanks!

I'll queue for testing.

Cheers,

Richard

