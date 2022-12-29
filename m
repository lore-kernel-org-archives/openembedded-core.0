Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEA0C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 12:53:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.203137.1672318414944056669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 04:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LI/BR4p2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so10639374wmb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 04:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MrDGXniGoXqMfwZ7lybwi3sxZDE9xxgJ8Gk7vIAa7hw=;
        b=LI/BR4p2Fjq4ucd0v/MwSkgfIXw1wELtbvVLvsGk5jCG4m1SxPHzG32cTBK6WZOgEl
         b1RFzVuV7jC7oDhwGLRzi558IXhBHVcuVwXhLud3ptONOsOCYUrlfktvLQtrHa3egizI
         UL2Rvoo6Wua2r4cJClDRh9RITadQGOJ1Ruujs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrDGXniGoXqMfwZ7lybwi3sxZDE9xxgJ8Gk7vIAa7hw=;
        b=aS1vBESunTRfhZJGvvaIld0rE9Mahx3AYj5chPVIY94iJIEIDxKC+Xo1DN2HV00A4B
         N8A3+MppaSvW/MLCMvjB/dG+gEoR66ntaTshwYQHys4q9gmpHirNY9nSz+Voc+z+lURt
         LU3Z7vdVxOp9TlNN/zNmO9Lqo2SdOdDer4KVvjvOB/d4982oCq0TMiEAXvYlQIGzUgOA
         ZqLxfs0pYLksA1lBo1/qJOeg1WJtB8KkinU1ohpHzlO+GUjzoa7wurdzKthk26okWnIJ
         +M3dWeFSHe9xDzyDVaxd+Pzp0caTqlCyjaPunKrdWUFOGH5RyLEvftaU3QBt4GIDDxT2
         NMuw==
X-Gm-Message-State: AFqh2kq8lrZKQ3dIx2/uySx4ydywChVvlh03bq/P5azgD1RXzovAr8o8
	FSKrBmb08t2CK3czlQmat4OtGg==
X-Google-Smtp-Source: AMrXdXs3xLBgF+M/jv+9OI30GUfOy+FX9MncmbuOGt7BAT9tzmA12gs0qkz//cFMPg6rqtOHU5PSsg==
X-Received: by 2002:a05:600c:ace:b0:3d1:fe0a:f134 with SMTP id c14-20020a05600c0ace00b003d1fe0af134mr19948214wmr.19.1672318413267;
        Thu, 29 Dec 2022 04:53:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:43af:59a1:5bcf:54fb? ([2001:8b0:aba:5f3c:43af:59a1:5bcf:54fb])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003d359aa353csm23996851wmb.45.2022.12.29.04.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 04:53:32 -0800 (PST)
Message-ID: <98901e74ee915574e306c3c0896354d8a4565778.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>, Randy MacLeod
 <randy.macleod@windriver.com>
Date: Thu, 29 Dec 2022 12:53:32 +0000
In-Reply-To: <CAO5Uq5S1MvMr1rM36ovf-+_xPmUq8q6BzBiY20=SYsztj6i9VA@mail.gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
	 <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
	 <CAO5Uq5RdKixvptDjxb4GqxSgFMosT+-Gf0=gjw3o=HXCpJCYcA@mail.gmail.com>
	 <2da2bcbfa690802a5dd68e7def0b7b07d1c9c277.camel@linuxfoundation.org>
	 <CAO5Uq5S1MvMr1rM36ovf-+_xPmUq8q6BzBiY20=SYsztj6i9VA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 12:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175096

On Wed, 2022-12-28 at 14:51 +0000, Alex Kiernan wrote:
> On Wed, Dec 28, 2022 at 12:01 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2022-12-27 at 18:09 +0000, Alex Kiernan wrote:
> > > On Mon, Dec 26, 2022 at 6:33 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Sun, 2022-12-25 at 21:59 +0000, Alex Kiernan wrote:
> > > > > This series adds runtime tests for rust and cargo, merges (most o=
f) the
> > > > > include files into the base recipes and fixes target cargo builds=
.
> > > > >=20
> > > > > Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains a=
s part
> > > > > of packagegroup-core-sdk.
> > > > >=20
> > > > > Changes in v4:
> > > > > - Fixup `__stack_chk_fail_local` in musl-x86
> > > > > - Add crossbeam atomics fixes for ppc/mips
> > > > >=20
> > > > > Changes in v3:
> > > > > - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LA=
NGS
> > > > >   (which defaults to SDK_TOOLCHAIN_LANGS)
> > > > >=20
> > > > > Changes in v2:
> > > > > - Drop rust.inc/rust.bb merge, not actually made use of in the ch=
ange
> > > > >   set
> > > > > - Reorder so cargo test goes after build fixes
> > > > >=20
> > > > > Alex Kiernan (11):
> > > > >   rust-llvm: Merge .inc into .bb
> > > > >   rust-llvm: Update LLVM_VERSION to match embedded version
> > > > >   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
> > > > >   packagegroup-core-sdk: Add SDK toolchain language selection sup=
port
> > > > >   cargo: Merge .inc into .bb
> > > > >   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
> > > > >   rust: Merge .inc into .bb
> > > > >   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-so=
urce
> > > > >   cargo: Override crossbeam-utils with 0.8.14
> > > > >   packagegroup-rust-sdk-target: Add cargo
> > > > >   oeqa/runtime/rust: Add cargo test
> > > >=20
> > > > Looks much better thanks. There was one remaining issue which showe=
d up
> > > > in testing with a reproducibility issue:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/=
2119/steps/12/logs/stdio
> > > >=20
> > > > We did already have an open bug for a rust reproducibility issue an=
d we
> > > > excluded it from the tests until we could get to the bottom of it, =
I
> > > > suspect cargo may have the same issue. It frustrates me a bit as it=
 is
> > > > the one reproducibility exclusion for core.
> > > >=20
> > > > Ideally we would fix it but excluding it from the tests and noting =
it
> > > > in the bug may be an option if it is the same issue. It may be simp=
ler
> > > > to reproduce and fix the issue with cargo too.
> > > >=20
> > > > Cc: Sundeep who as been looking at it.
> > > >=20
> > >=20
> > > Just reading the ticket and the upstream ones... the upstream ticket
> > > is closed as remap path fixes it (which it looks like it does to me),
> > > there are build paths embedded in the build directory which don't get
> > > caught by that, but they're in thing like bootstrap which isn't
> > > packaged (which may or may not be an issue, but I'm suspecting not);
> > > it kinda feels like we're missing something.
> > >=20
> > > Can I get hold of the cargo packages generated here to have a poke at=
 them?
> >=20
> > Yes. The key line in the log is:
> >=20
> > 022-12-26 11:56:30,555 - oe-selftest - INFO - Non-reproducible packages=
 will be copied to /srv/autobuilder/autobuilder.yocto.io/pub/repro-fail/oe-=
reproducible-20221226-0vk5efsk
> >=20
> > i.e.
> >=20
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0v=
k5efsk
> >=20
> > where you'll find both the package files and diffoscope output:
> >=20
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0v=
k5efsk/packages/diff-html/
> >=20
> > which seems to be saying the symbol table changed size which is
> > unusual. I didn't look very deeply.
> >=20
>=20
> Upstream has this ticket which, given how I did the patching for
> cargo, feels like the right kind of thing (rust has something similar
> out of the box):
>=20
> https://github.com/rust-lang/rust/issues/98185
>=20
> I've switched it around so that it uses local patching rather than
> cargo patching, which if it is this, seems like it might resolve it.

It was a different issue, thanks for tracking that down and fixing it!

The tests all passed so I merged the v5 series. Thanks for working
through things, I think this makes our rust situation much more robust
and should help future proof it :)

Cheers,

Richard

