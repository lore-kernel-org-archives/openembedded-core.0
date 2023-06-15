Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37C0EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 09:05:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.13777.1686819914710862384
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 02:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WPKCTTYi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b448470602so3243501fa.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686819913; x=1689411913;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2rLNIjD2WGTQ7aXcESlXT9jhV5JxezWDguKlK1F+4Js=;
        b=WPKCTTYiBcUOehWEqwrfhu1WYbPykJ4+0Wr8jHTaASoEE4fboY7AYN8CD03wFJMdC8
         MBaHwEp0dAPNxGLivZvwdPliJFSEVWcm154h6GYaoUmTfnIwdIy9Zi1T3u2Bm7ZB48Xx
         p2MJhFPav2e8a63vbsh38ypveFpaznhtNAMbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686819913; x=1689411913;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2rLNIjD2WGTQ7aXcESlXT9jhV5JxezWDguKlK1F+4Js=;
        b=lLO7WgM7oYjEgJboNeh1S9LGdJVVlrmHcu9SSgQfr1Xhbrw91pf+ZZmGRo1qQrwXPG
         L9lm4sXElXdYWmEBlv1ferSK8D8fKaaHgfn76qVQ9Td02QD/C2hFr+rU4Zc3SzP+E8kU
         PNSU3v2DDePcHGHoAw5WFn5DaXqVeKHgMYIstm/gNpBvoEE01CuLEYgPDkny8rVN/nUR
         3pXkdIVsxlAZBtGcGlTpKWCVscZ02VC1oaMgMGYFwImTXDA/KWSqbVHhOyUEByC93F6M
         U6Nl1P/vlTzffxm0iUVdHk4tphVI2xoonczTkQMzPbhbfapUmFUiuF7ygoBRSwZVmJXy
         jP2A==
X-Gm-Message-State: AC+VfDzcFXibZeCr5uv3llmHArcB8u9e70F4iKniylV6Ya90YTtJeB+A
	qol3PYDAHtHeU6FLi+xI8VoqPQ==
X-Google-Smtp-Source: ACHHUZ7bhRIGqV8/1SR8E4S5iCCv8upZIW2wVSyC9cLSHLpohjT9bJ70p4nto2ukc7GH9wP0zdRk7Q==
X-Received: by 2002:a05:651c:d1:b0:2b1:eb62:ffc8 with SMTP id 17-20020a05651c00d100b002b1eb62ffc8mr8354446ljr.6.1686819912771;
        Thu, 15 Jun 2023 02:05:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1? ([2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d620e000000b0030ae4350212sm20499201wru.66.2023.06.15.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 02:05:12 -0700 (PDT)
Message-ID: <05e4d2a9d9f343a8ae08c7db327dc1dd96e89ef9.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest
 directory to artifacts list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, alexis.lothore@bootlin.com, 
	Openembedded-core@lists.openembedded.org, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Thu, 15 Jun 2023 10:05:11 +0100
In-Reply-To: <ZIrNMt5IcnBhTzF9@nuoska>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
	 <20230609064802.11777-5-alexis.lothore@bootlin.com>
	 <ZILME/DYo6hUkXv0@nuoska>
	 <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com>
	 <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
	 <2ab334cad37a96bfa119acd45a7e760c3ba3c429.camel@linuxfoundation.org>
	 <ZIrNMt5IcnBhTzF9@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 09:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182842

On Thu, 2023-06-15 at 11:34 +0300, Mikko Rapeli wrote:
> Hi Richard,
>=20
> On Thu, Jun 15, 2023 at 08:03:44AM +0100, Richard Purdie wrote:
> > On Sun, 2023-06-11 at 17:16 +0200, Alexander Kanavin wrote:
> > > Doesn't +=3D override the earlier ?=3D
> >=20
> > It depends. If ?=3D is parsed first, +=3D will append. If the ?=3D is p=
arsed
> > after +=3D, the ?=3D will not happen as the variable has a value.
> >=20
> > >  (or ??=3D),=C2=A0
> >=20
> > +=3D would override ??=3D
>=20
> In which kind of cases would ??=3D be preferred?
>=20
> For basic recipes in oe-core and other layers, setting variables with
> basic assignment and then appending it with +=3D should be enough unless =
machine
> or other override specific qualifiers are needed :append:machine.
>=20
> Using plain :append without any qualifiers is annoying in downstream laye=
rs which
> try to fine tune upstream open source meta layers and recipes and still r=
emain compatible
> to apply security and other updates, including full version/branch upgrad=
es.=20
>=20
> I see some, for me, bad examples of ??=3D to set initial PACKAGECONFIG, f=
or example.

This is all a big problem area and I've talked about it before. We
can't make one recommendation which will work for every person in every
scenario.

The original intent was that ??=3D would be widely used and solve some of
the problems. That plan was flawed but we (I?) didn't realise until too
late.

I'd not call ??=3D with PACKAGECONFIG as bad, it just doesn't do what you
want in some scenarios.

> Downstream layers would need to use PACKAGECONFIG:append to add some feat=
ure
> to upstream defaults since +=3D would require to fully control the PACKAG=
ECONFIG
> in a bbappend. I would prefer ?=3D for that so that a +=3D could be used =
to add an
> extra non-default feature but keep all the rest in upstream defaults.
>=20
> This gets even more tricky with intermediate layers which might want to e=
nable
> features across recipes and layers, e.g. "selinux". Now they'd have to us=
e use :append
> to make sure "selinux" is added to PACKAGECONFIG everywhere and no other =
upstream defaults
> are changed. And then product layers who 'know better' to for example dro=
p some features
> would need to :remove them explicitly and can't fully overwrite the PACKA=
GECONFIG with a simple
> assignment in a bbappend. Messy. Staring a lot of "bitbake -e" ouput need=
ed.

I wish I had a magic answer. ?=3D has it's own set of issues too last
time I sat and thought about all this :( I think the issues come if
someone uses distro overrides from a config file instead of a bbappend.

It needs time spending on it by someone willing to look at all the
different use cases, including the ones they don't use themselves and
come up with some kind of proposal. Personally, I'm willing but I can't
even get through the patch review backlog or autobuilder intermittent
bug queue at the moment :(.

Cheers,

Richard

