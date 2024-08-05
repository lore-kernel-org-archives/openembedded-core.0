Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEE7C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 09:02:45 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.3856.1722848555658539848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dP6LVYUy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so12490381fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722848554; x=1723453354; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwUrgfiS/0hwdWO7IkeCLZZz4qFVqx5mHpoDFvr+hSs=;
        b=dP6LVYUycVvgeCKtLdvdxd5Pi71ZGJwuzQYs3BKmozSrWrnvV/Ndvr77sUiAiSc4Yt
         3kI4ToUsMKP5jOG4n6FCKfGpoyVsCCEdKKzU2cFUnVvKOfMWVxPY68q2QT373J+EYdXN
         Yatf15/ZDmtFUdcfK2K7WjMfdfbYHHMeYWlAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722848554; x=1723453354;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZwUrgfiS/0hwdWO7IkeCLZZz4qFVqx5mHpoDFvr+hSs=;
        b=wb7DBWroYFN9ZWcFVfWYSoLOkCbmIAswvoDlMQJ2JDqwN7Me517K/XVnEGP+THiy1X
         cNe3tuT954LK8wYhXFbCudVGwqwu1h6Cgg9I/lxZh1mupIeCfk2adSmsn4VkxOdSZe3R
         zXVKMHPLDHnNq/+bYmdNUNHULDtcC93UFYVURVmv5QyutwSPSeTtEYaW0BrMeUcd6elN
         xXbkqOVpAOs7H1XDAignX21OWfkTRBr8cwOTufOQR5prNgQAiPKWCfVCDgPLHow2+2F1
         mGk1FlB1ykvhdwY6rkqJHJtm2SfnsmycpgNj+cMXoaXbvp9hsD88oB9NnGqdm/y9apIf
         EZPg==
X-Forwarded-Encrypted: i=1; AJvYcCUPHb0D6pW6JqM1dHDYC62MhEYOefcuSAQWMycLkkFyOauq7xFEwjxxi4JB76JP2u7KofRpc4UBW65VaG+IibwNjHbKook1nUHwWZlVuro34RXEXqdBMZco
X-Gm-Message-State: AOJu0Yxm9ru6HJX9dUflmXw8Vupx8Dc/EztPPfQVKYBbChMdo+CY+5VR
	a3bMxrE7W0vC+OdCtdyuNIpnrbvhNEidbrBqine9wJ8TxJQhOXjJbMWfRIeaicA=
X-Google-Smtp-Source: AGHT+IGc7pSFKl98fLJ7phQX63X/mcw+N1R6OMoqETODqaQSwjesRCMt12am0sFP+7vV8O6nFnYtOQ==
X-Received: by 2002:a05:651c:107:b0:2f0:1e0a:4696 with SMTP id 38308e7fff4ca-2f15aa833aamr67509911fa.7.1722848553559;
        Mon, 05 Aug 2024 02:02:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d5c:bc31:7e94:c26e? ([2001:8b0:aba:5f3c:2d5c:bc31:7e94:c26e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bba3249sm191387425e9.48.2024.08.05.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:02:33 -0700 (PDT)
Message-ID: <beae104500728cbeeba6b3a3c7f7a21477bd5f92.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap 18/18] rust: Add new varaible
 RUST_ENABLE_EXTRA_TOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "steve@sakoman.com"
	 <steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 05 Aug 2024 10:02:31 +0100
In-Reply-To: <AS1PR10MB56972C3696EF9F76596EABD7FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1722790925.git.steve@sakoman.com>
	 <136a25567499191b23a4d000a06bf83a473224ca.1722790925.git.steve@sakoman.com>
	 <76a9b1972d61073056cfa0b3a181c3b876269eb4.camel@linuxfoundation.org>
	 <AS1PR10MB56972C3696EF9F76596EABD7FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 09:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202988

On Mon, 2024-08-05 at 08:47 +0000, Marko, Peter wrote:
> -----Original Message-----
> From:
> openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.op=
enembedded.org
> > On Behalf Of Richard Purdie via lists.openembedded.org
> Sent: Sunday, August 4, 2024 23:33
> To: steve@sakoman.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][scarthgap 18/18] rust: Add new varaible
> RUST_ENABLE_EXTRA_TOOLS
>=20
> > On Sun, 2024-08-04 at 10:09 -0700, Steve Sakoman via
> > lists.openembedded.org wrote:
> > > From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > >=20
> > > There is a need to enable some extra tools from the rust for the
> > > build
> > > and so this new variable will help for that
> > >=20
> > > This varaible then we can use during do_configure task to add
> > > overall
> > > values as per json format in build -> tools
> > >=20
> > > Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > > =C2=A0meta/recipes-devtools/rust/rust_1.75.0.bb | 6 +++++-
> > > =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > Not sure this is on master?
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> This was already explained here:
> https://lists.openembedded.org/g/openembedded-core/message/202732

Fair enough, thanks!

Cheers,

Richard

