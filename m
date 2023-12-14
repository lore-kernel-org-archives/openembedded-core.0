Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD862C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:11:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.20483.1702555913161552225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KD+rnbjy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3364a5ccbb1so305905f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702555911; x=1703160711; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RYnYKpnLGJU42/z46PtcPLnpgBRf5hybeGu9EcrrJpc=;
        b=KD+rnbjyQ0cy6evinA0Wjhpq3dEa8X0C0i2Yhahtr9iVpz7wOr4R66tHamQhPeYrC5
         ZNV0gJqzCeVPONN9QmVOvib2ILXFoz7Po1IJeUZJ85PhxcME7/79dZXZDhVsqoBhRjbZ
         RbJY0yFMiEiwU3CRFc8MZ8qSptIOU2H5emOgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702555911; x=1703160711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYnYKpnLGJU42/z46PtcPLnpgBRf5hybeGu9EcrrJpc=;
        b=uFj8d6g1l9ra8kt2eZeiOEFdTogGbRBsmwVk8QHT1Vjbse1XWPPvd2phnJqnTiYAun
         Wp1dvAnMvz/plk7CypVuT4KrCTB8kUfb9AKiEd806RydyP8EwPGfIujIrLW2q2JxTtz5
         +t89tjMUDG2dFBdI/rINCx6FbTFrQkAdBUE81SDF8xU8aL0UJcQil6FhDDhJ3ZBvcCws
         j5MGVnpKOrWbW3p1E6ttPdOdR+OLfzztvz5q0ZlLds+y7b7i+UsRb8pRg5W6pc1XE6ue
         VzDeb7+hSmlZpXIISJWV87tl7iV3Udb9fngqdEDQ0rdmrY/BClMZGyIgqCXAmjqqk+qm
         Q8hQ==
X-Gm-Message-State: AOJu0Yx9itBy8i+gpTu4dWb+t46sXVC0QOBhpPpQHyO/IxUormoGY1BN
	m/wkQMWj7aTNhhZhtYXerFbfwA==
X-Google-Smtp-Source: AGHT+IHSUkxTfTjuGVBSzex5d8VqmCUr/xqzZ8xR0esz4ZUPOBpzg5pRqV4iBELS59Dt52beziRNyg==
X-Received: by 2002:a5d:4dc8:0:b0:333:42dc:d42c with SMTP id f8-20020a5d4dc8000000b0033342dcd42cmr5342678wru.80.1702555911546;
        Thu, 14 Dec 2023 04:11:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id x15-20020adfec0f000000b00336468b986esm1782033wrn.96.2023.12.14.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:11:51 -0800 (PST)
Message-ID: <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
 Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 14 Dec 2023 12:11:50 +0000
In-Reply-To: <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
	 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
	 <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
	 <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192360

On Thu, 2023-12-14 at 13:03 +0100, Alexander Kanavin wrote:
> On Thu, 14 Dec 2023 at 10:50, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Once a given build has run through the system, things do run much
> > faster but this is basically the performance issue I've been mentioning
> > in the weekly status reports. Even the above packageconfig change in
> > this patch would actually speed a lot of these up, but you're objecting
> > to that.
>=20
> I no longer object :) the above explanations are fine with me. I did
> run the benchmarks though, so for the sake of having a fuller picture:
>=20
> default poky, core-image-minimal:
> 5134 tasks
> real    26m26.874s
>=20
> poky with this patch, core-image-minimal
> 4051 tasks
> real    25m53.513s
>=20
>=20
> poky without ptests, core-image-minimal
> 2997 tasks
> real    21m23.684s

Thanks, that is useful data to have,

>=20
> > The tests themselves are actually quite valuable as we're way beyond
> > the point I can work out which patch will break which features. Some of
> > the tests could undoubtedly be improved. If we disable the ptests for
> > the selftests, we run the risk of not reusing sstate so a better
> > question might be, why are all the tests not reusing sstate more
> > efficiently?
>=20
> Looking at that a-full again, it was abelloni's master-next which had
> something that triggered a mass rebuild, e.g. qemux86-64:
>=20
> Sstate summary: Wanted 8139 Local 2083 Mirrors 0 Missed 6056 Current 0
> (25% match, 0% complete)
> (and that took over 5 hours to fulfil:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/8224
> )
>=20
> My theory is that when all of the builders start at the same time in
> that situation, they will all rebuild the same things, and become very
> slow and overloaded. Including image builds in selftest as well, as
> it's parallelized in itself.

Maybe, maybe not. By that theory if you run the selftests in series
they should be quite fast as they reuse previously built artefacts.
Experience suggests there are quite a few slow on the first run.

> I have a proposal: splitting a-full into stages. First, run the build
> steps from qemux86-64 and qemuarm64 (and arm64 on armhost), which
> would serve two purposes:
>=20
> - pre-populate sstate for all the the builders that will run in the
> next stage, accelerating them. It's possible some of the builders
> would still do full rebuilds, but then it becomes possible to look
> separately at why they can't reuse the sstate from the first stage.
>=20
> - do a quick, lightweight smoke check on the changes under test: if
> something breaks the build really badly, it will be caught there and
> then, the build will stop, and unneeded AB overload will be avoided.
> Which will in turn speed up everything else that's running at the same
> time.

I've wondered about this. The "prebuild" ends up quite slow as it would
involve rust for example and when I last tried this, it ended up being
a pain and just increased overall testing times even of the overall
load on the AB might have been lower. So I'm really not sure. I suspect
it wouldn't help the pain points as much as you think as there are
other sstate reuse issues at play too.

Cheers,

Richard



