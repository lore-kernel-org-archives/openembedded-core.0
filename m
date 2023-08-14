Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63406EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 08:47:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.103249.1692002816178306604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 01:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OspKASKK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe8c3b5ca0so6449303e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692002814; x=1692607614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=seLLGmazcDxdpLeyvCteLmLxDV0jvnnTVcHUYR3h0Is=;
        b=OspKASKK8qGlMLkTRnnMOlHfMoFNAcXK+tXkiCBzxxwUeH2A/icjl7/OhA0tqh3wsq
         t2Vz9hMHpwzDC8TPQC+IK7mMb/ijKWOrL+XFhbpqMhtay+iYUOEO2fXqty1ZZxZc25E2
         qL6L74ZaCnGoXwB1HmvC5Q4dNakHLbVF3QFE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002814; x=1692607614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=seLLGmazcDxdpLeyvCteLmLxDV0jvnnTVcHUYR3h0Is=;
        b=aTtG6ZKqkt3fayXFxD/eaB7ObqmErUjzfWcUpUz9wUfuZ76gkQigEUITh1Rd/+YcDJ
         CM0nv7yA7ZHgwJB24gd6zn/b88mxws3m6aj3z/QYJ/SGmPz6+qPXzF8Ghndh8DwRsGrP
         iAxsUPuXTsazENcgx3VDaXwUq79AlI8uWuE5AmBfLo/1ekOQMOO0g/+rZWNozZG0ndZP
         Y21QKQXFAQIUUKTbPV0mZAc5gcjvvLNuGkYr1e9OFjNYYFQVaWzxSzLQec53iDPiTPNj
         A4kqh5DXtnL6dvyQqgKVyin0/s8AWsXoNJzigDz7u+CiNm76Kevk7iJEtOP/XzS5dgM1
         V5LA==
X-Gm-Message-State: AOJu0YwwQKbsDzJbz7at1fyy2UOKdlCE+Op0oSl2CH78Lg7im7MCrdR4
	tXqAW+1v5lsf9KKM6lwvxt8gHLAGKSiCJaODFME=
X-Google-Smtp-Source: AGHT+IHncFUo02urk5ONtRTqYJVn6IBXQYdbhO2RnmQy8Lvg9EZFf5D/Jb6hcaJKei5OFx08QCoXyQ==
X-Received: by 2002:a19:655d:0:b0:4f9:69af:9857 with SMTP id c29-20020a19655d000000b004f969af9857mr5132219lfj.51.1692002814306;
        Mon, 14 Aug 2023 01:46:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a? ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c00cb00b003fe29f6b61bsm13594092wmm.46.2023.08.14.01.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:46:53 -0700 (PDT)
Message-ID: <a06d63fa5557a0c0274573539aad381656e00890.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Aug 2023 09:46:52 +0100
In-Reply-To: <CA+cAkeqdLTze+=synu194ezFrQqeCidwmDdwGD-527H3-cb=7g@mail.gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
	 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
	 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
	 <177AED879B83B027.8497@lists.openembedded.org>
	 <177AF35A822C5F89.12117@lists.openembedded.org>
	 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
	 <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com>
	 <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
	 <CA+cAkeqdLTze+=synu194ezFrQqeCidwmDdwGD-527H3-cb=7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 08:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185925

On Mon, 2023-08-14 at 09:30 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>=20
>=20
> On Sun, 13 Aug 2023 at 17:05, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > > On Sun, 13 Aug 2023 at 16:53, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > and a reproducibility failure:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/=
3355/steps/13/logs/stdio
> > > >=20
> > > > which leads to:
> > > >=20
> > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813=
-z_b2j3ha/packages/diff-html/
> > > >=20
> > >=20
> > >=20
> > > Argh, this makes me remember
> > > of=C2=A0https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090
> > > Do you know if any of cargo based recipe is reproducible ?
> > > Should I add EXCLUDE_FROM_WORLD in cargo-c ?
> >=20
> > At some point we're going to have to dive in and fix the
> > reproducibility issues so I'm reluctant to take more patches with
> > that
> > set...
> >=20
>=20
>=20
> It will hardly be doable to correct the reproducibility of rust
> packages since rust/cargo
> itself have issues upstream. I take a look and there are lot of open
> issues
> cargo:=C2=A0
> https://github.com/rust-lang/cargo/issues?q=3Dis%3Aissue+is%3Aopen+labe
> l%3AA-reproducibility+
> rust:=C2=A0
> https://github.com/rust-lang/rust/issues?q=3Dis%3Aissue+is%3Aopen+label
> %3AA-reproducibility

I believe there is one problematic reference left which causes problems
for core rust. Fixing that issue would be the best place to start and
then we can work from there.

We do already have a lot of good reproducibility pieces in the
toolchain so not every upstream bug will apply to us.

> There was an RFC accepted back in may
> (https://github.com/rust-lang/rfcs/pull/3127) and implementation
> progress have a tracking issue in cargo
> (https://github.com/rust-lang/cargo/issues/12137) and in rust
> (https://github.com/rust-lang/rust/issues/111540).
>=20
> Don't know if it will fix our root issue
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875) but I don't
> see how to workaround all of that without this upstream work.
>
> For cargo-c specific issues, I'll try to make things better (the
> TMPDIR in debug symbols) but I'm wondering
> something, reproducibility is=C2=A0 desirable for all generated artifacts
> or is it only for target ones ?=C2=A0 I mean,=C2=A0
> the cargo-c is used in native so I'm wondering if making=C2=A0it native
> only would be acceptable ?

That would certainly avoid this issue. It would also make on target
testing of the functionality not possible.

Cheers,

Richard



