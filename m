Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF84BEB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 09:59:32 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.103972.1692007162221717288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 02:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e8deAI4d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9d3dacb33so63540671fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692007160; x=1692611960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Goq9bMXr3GHaPjSEooTMzUXDYtRvOLgvIWMhh8locIk=;
        b=e8deAI4dLEXT11JkQ2X72tAKSD8G1F3RIev62UHtMmI/iv5VndmRf7AP8trygJ2SEp
         0YY9B3BosEFVC484mrr8ngDuTNzfbr+Ph/Cwc1cem9SkouuD0deCbjBnp0Ieg1oLhSQL
         VZ+EADMe2yjVXFgNd6KQuy9mGhnPatwws1Eus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007160; x=1692611960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Goq9bMXr3GHaPjSEooTMzUXDYtRvOLgvIWMhh8locIk=;
        b=Dn1AgWUakjGmsR9Vd4EnzXRo6JKtazeDktfHp3yHxtFppv7bqsXQdsodVopPqIuBhO
         cXFs/i1XbwGFukefVeQxKF8wY+oyBHwCxB4n2h3zpIVZtjTMKNQNzCEWyM7bC7CF1+pZ
         WdCoOyS8V/6l5geI+gaZBZ9kEPhUIN9bdhHdUyOs9stz9qH0EfRq4zUjV+yZUqOndXoi
         u0wAlfdHlc6XMX3w7w967Hxb6K/CQ3tLMfw6Pn7cfbY3ak2Xt+Yod5zQlw9Td8wsVWy0
         UJ1HKSSoAl+j+WSAhxsseCdaMYVEpsy0QgpC39As5Bl0ca1BsjBcYzo3lAhSDCiON3L/
         ZeSw==
X-Gm-Message-State: AOJu0YxB4lb9tzBh41dVOROSB2owynQZDvnTpGjSKnMzqvZ1t1QyDUqf
	TXpsyppdZinA/ft1D6MRbrglPQ==
X-Google-Smtp-Source: AGHT+IE9wCuFy9DFpGcy7pG7XFD5wp9nPw+A1axn6td/CZFqrl44MEGrasH2bAuEhNtlSEX6tj64Vw==
X-Received: by 2002:a2e:b0fc:0:b0:2b9:e053:7a01 with SMTP id h28-20020a2eb0fc000000b002b9e0537a01mr7239134ljl.43.1692007160378;
        Mon, 14 Aug 2023 02:59:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a? ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003fe2696ccfcsm13796595wmi.23.2023.08.14.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 02:59:19 -0700 (PDT)
Message-ID: <7d09ad4f1868a13719928d26046fc69b7a3f887d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Aug 2023 10:59:19 +0100
In-Reply-To: <CA+cAkeoq5z8RA8SPdN3JpuTqgocBnxCQp9rKLO+9Sq3dan_Nzw@mail.gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
	 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
	 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
	 <177AED879B83B027.8497@lists.openembedded.org>
	 <177AF35A822C5F89.12117@lists.openembedded.org>
	 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
	 <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com>
	 <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
	 <CA+cAkeqdLTze+=synu194ezFrQqeCidwmDdwGD-527H3-cb=7g@mail.gmail.com>
	 <a06d63fa5557a0c0274573539aad381656e00890.camel@linuxfoundation.org>
	 <CA+cAkeoq5z8RA8SPdN3JpuTqgocBnxCQp9rKLO+9Sq3dan_Nzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185931

On Mon, 2023-08-14 at 11:39 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>=20
>=20
> Le lun. 14 ao=C3=BBt 2023, 10:46, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit=C2=A0:
> > On Mon, 2023-08-14 at 09:30 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > >=20
> > >=20
> > > On Sun, 13 Aug 2023 at 17:05, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wr=
ote:
> > > > > On Sun, 13 Aug 2023 at 16:53, Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >=20
> > > > > > and a reproducibility failure:
> > > > > >=20
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/bui=
lds/3355/steps/13/logs/stdio
> > > > > >=20
> > > > > > which leads to:
> > > > > >=20
> > > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2023=
0813-z_b2j3ha/packages/diff-html/
> > > > > >=20
> > > > >=20
> > > > >=20
> > > > > Argh, this makes me remember
> > > > > of=C2=A0https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090
> > > > > Do you know if any of cargo based recipe is reproducible ?
> > > > > Should I add EXCLUDE_FROM_WORLD in cargo-c ?
> > > >=20
> > > > At some point we're going to have to dive in and fix the
> > > > reproducibility issues so I'm reluctant to take more patches
> > > > with
> > > > that
> > > > set...
> > > >=20
> > >=20
> > >=20
> > > It will hardly be doable to correct the reproducibility of rust
> > > packages since rust/cargo
> > > itself have issues upstream. I take a look and there are lot of
> > > open
> > > issues
> > > cargo:=C2=A0
> > > https://github.com/rust-lang/cargo/issues?q=3Dis%3Aissue+is%3Aopen+la=
be
> > > l%3AA-reproducibility+
> > > rust:=C2=A0
> > > https://github.com/rust-lang/rust/issues?q=3Dis%3Aissue+is%3Aopen+lab=
el
> > > %3AA-reproducibility
> >=20
> > I believe there is one problematic reference left which causes
> > problems
> > for core rust. Fixing that issue would be the best place to start
> > and
> > then we can work from there.
> >=20
> > We do already have a lot of good reproducibility pieces in the
> > toolchain so not every upstream bug will apply to us.
>=20
> I'm afraid I do not see what is your point, can you elaborate please?
> What is the "problematic reference left which causes problems
> for core rust" you refer to?=C2=A0

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875

There appeared to be one reference left in the binaries we couldn't
track down. If we fix that one reference, at least the main rust recipe
issues *should* be fixed.

> > > There was an RFC accepted back in may
> > > (https://github.com/rust-lang/rfcs/pull/3127) and implementation
> > > progress have a tracking issue in cargo
> > > (https://github.com/rust-lang/cargo/issues/12137) and in rust
> > > (https://github.com/rust-lang/rust/issues/111540).
> > >=20
> > > Don't know if it will fix our root issue
> > > (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875) but I
> > > don't
> > > see how to workaround all of that without this upstream work.
> > >=20
> > > For cargo-c specific issues, I'll try to make things better (the
> > > TMPDIR in debug symbols) but I'm wondering
> > > something, reproducibility is=C2=A0 desirable for all generated
> > > artifacts
> > > or is it only for target ones ?=C2=A0 I mean,=C2=A0
> > > the cargo-c is used in native so I'm wondering if making=C2=A0it
> > > native
> > > only would be acceptable ?
> >=20
> > That would certainly avoid this issue. It would also make on target
> > testing of the functionality not possible.
>=20
> The test I added is on the final binary generated (rust-c-lib-
> examble-bin), not cargo-c itself. So the target test would still be
> valid.

Ok, good.

> I tested a release build with a custom patch that strips debuginfo
> (strip=3D"debug info" in Cargo.toml) and I do not have build path
> leaking in debug symbol anymore. I'll dig this up more and see if I
> can upstream that.=C2=A0

Debug symbols should be relocated correctly if we pass the correct
compiler options. We usually prefer debug symbols to be present so we
can package them into the -dbg packages.

Cheers,

Richard


