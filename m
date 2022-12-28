Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B9FC10F1B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 00:01:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.171284.1672185662844109971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 16:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bhm+8oeo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id bs20so11541290wrb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 16:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZMLcKUm7qcLzd+aWYZ5vUTfsnT1pqcbhQjFB1ILpyU=;
        b=Bhm+8oeo/QTNmLdCTeOazkU9Fjr0OI3qxiItaJEzEdqL/CCXvOtjFjhP41+YbvP2mz
         749Kde1ichFT0/54zWvz8aoT0N9CV8SC24lg875b+7RMSBtEzexZL587M9ZTNYY+AKGh
         s6RU0lyxvw1bYhIyC2B2S+SNFleXr2ORcLzd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZMLcKUm7qcLzd+aWYZ5vUTfsnT1pqcbhQjFB1ILpyU=;
        b=X+2l/UKKjPAO3vAz/AKR4B9nFCtu9B2J3ftadwMgQ/5MA0wGtgGOKLRBTmC7V4yka8
         vpUpd2+Sik91YjKSM8sSa2Mc65GpWNHeRGIeWKoHtUTu9Q4ez9ZaWyD2lEy9RH2GEUCc
         Hv4g0gDCoCEoPVvvpJLB8J7XgT5A7+UJT6dp8uWcqrGLmWpUSEOcmo1X0BvfhHlDL6jS
         6nKG87P/q8yvzDPcsgtS8mhkL+9j4PTvaT5iOfQs8K15dldqW2Tf+JHDbk8GYMkG0mEV
         ulDExBJ8w0immi/OjsgFDH5V3vp0j70kLzdGGk8ZzZmOVlNPTN6h0S8Xa5wWGi9aFel3
         o4Vg==
X-Gm-Message-State: AFqh2kpdSKrTMLjYcV9hFB+dp0u9CL4by8GbWkgYKehG6+6eTQi/wo4D
	4WsfFrXxfCUiIhvnbqjJIz8tfA==
X-Google-Smtp-Source: AMrXdXudinlUdOI03ZbW3losFx5+AwhPm7PiZn0eni1eabdHUec5DRlNRFLLe+JU5RlaFBkETKky3Q==
X-Received: by 2002:adf:f245:0:b0:24f:376e:4fdb with SMTP id b5-20020adff245000000b0024f376e4fdbmr14965289wrp.13.1672185660798;
        Tue, 27 Dec 2022 16:01:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a6e:7039:ab68:1e0d? ([2001:8b0:aba:5f3c:9a6e:7039:ab68:1e0d])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00236883f2f5csm13652346wrq.94.2022.12.27.16.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 16:01:00 -0800 (PST)
Message-ID: <2da2bcbfa690802a5dd68e7def0b7b07d1c9c277.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>, Randy MacLeod
 <randy.macleod@windriver.com>
Date: Wed, 28 Dec 2022 00:00:59 +0000
In-Reply-To: <CAO5Uq5RdKixvptDjxb4GqxSgFMosT+-Gf0=gjw3o=HXCpJCYcA@mail.gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
	 <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
	 <CAO5Uq5RdKixvptDjxb4GqxSgFMosT+-Gf0=gjw3o=HXCpJCYcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 00:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175037

On Tue, 2022-12-27 at 18:09 +0000, Alex Kiernan wrote:
> On Mon, Dec 26, 2022 at 6:33 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Sun, 2022-12-25 at 21:59 +0000, Alex Kiernan wrote:
> > > This series adds runtime tests for rust and cargo, merges (most of) t=
he
> > > include files into the base recipes and fixes target cargo builds.
> > >=20
> > > Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as pa=
rt
> > > of packagegroup-core-sdk.
> > >=20
> > > Changes in v4:
> > > - Fixup `__stack_chk_fail_local` in musl-x86
> > > - Add crossbeam atomics fixes for ppc/mips
> > >=20
> > > Changes in v3:
> > > - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
> > >   (which defaults to SDK_TOOLCHAIN_LANGS)
> > >=20
> > > Changes in v2:
> > > - Drop rust.inc/rust.bb merge, not actually made use of in the change
> > >   set
> > > - Reorder so cargo test goes after build fixes
> > >=20
> > > Alex Kiernan (11):
> > >   rust-llvm: Merge .inc into .bb
> > >   rust-llvm: Update LLVM_VERSION to match embedded version
> > >   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
> > >   packagegroup-core-sdk: Add SDK toolchain language selection support
> > >   cargo: Merge .inc into .bb
> > >   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
> > >   rust: Merge .inc into .bb
> > >   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
> > >   cargo: Override crossbeam-utils with 0.8.14
> > >   packagegroup-rust-sdk-target: Add cargo
> > >   oeqa/runtime/rust: Add cargo test
> >=20
> > Looks much better thanks. There was one remaining issue which showed up
> > in testing with a reproducibility issue:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2119=
/steps/12/logs/stdio
> >=20
> > We did already have an open bug for a rust reproducibility issue and we
> > excluded it from the tests until we could get to the bottom of it, I
> > suspect cargo may have the same issue. It frustrates me a bit as it is
> > the one reproducibility exclusion for core.
> >=20
> > Ideally we would fix it but excluding it from the tests and noting it
> > in the bug may be an option if it is the same issue. It may be simpler
> > to reproduce and fix the issue with cargo too.
> >=20
> > Cc: Sundeep who as been looking at it.
> >=20
>=20
> Just reading the ticket and the upstream ones... the upstream ticket
> is closed as remap path fixes it (which it looks like it does to me),
> there are build paths embedded in the build directory which don't get
> caught by that, but they're in thing like bootstrap which isn't
> packaged (which may or may not be an issue, but I'm suspecting not);
> it kinda feels like we're missing something.
>=20
> Can I get hold of the cargo packages generated here to have a poke at the=
m?

Yes. The key line in the log is:

022-12-26 11:56:30,555 - oe-selftest - INFO - Non-reproducible packages wil=
l be copied to /srv/autobuilder/autobuilder.yocto.io/pub/repro-fail/oe-repr=
oducible-20221226-0vk5efsk

i.e.

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5ef=
sk

where you'll find both the package files and diffoscope output:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5ef=
sk/packages/diff-html/

which seems to be saying the symbol table changed size which is
unusual. I didn't look very deeply.

Cheers,

Richard





