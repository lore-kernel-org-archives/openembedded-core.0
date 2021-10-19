Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98639C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:18:16 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.14166.1634667495033976265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IF7pFSKB;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id f4so1734156uad.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rvy1DxU+3qSAjfIisUZFYCIB12dpy/ZoOEMdtECrevo=;
        b=IF7pFSKB0dvtXgeATRN4H4lk2H7XDVRCVACNuvHWm9mQohzELIjktsNnrTkDwse6lz
         6j0PzHZdL7iLD0C95lAh3R/IDEGKevgOvsy5ufAkjHQRSCFyjQoCcF49Kx/9ZoW5s+Ob
         F88paU6avvkDUibI0dRqfF4/eVNQ3kJk7dOZqCE/Gra44dPoRR5Tk609xBuiukdPBZlZ
         FNjPN4TS4IH7/Jz4N26KYOt4QyhrcHLVW50S9QDlvA99BdIFxUnQlmlyxKvLhoKIrEUO
         qoeChFaUijWqcdX6WyFM/OCrLCVEc4nuT5EUZDM7ZjRjNKHE3CtgOutiu+9gDarpNf53
         kFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvy1DxU+3qSAjfIisUZFYCIB12dpy/ZoOEMdtECrevo=;
        b=lEVoadGsqS5mUMeaBt9EdABx3d+7YpMN7bwyoGUoLMEgDWqE9oekBqtL3xMKDZna97
         qAxHg69Jn918uAv+Cnx4ESZ52VICRj8+MNbbb2DwdkSpUVZ+vJhmYo5gdScn134Ot998
         WDy2qTXIeatobwmtglGQ6sjgtU/snlYll6LckPLM6PtEVDcMvh/yrHYpEpsUjv6p4bw4
         u3IiQAQrRjCyR4KNuqCJHE4+mjr4Ev1brjxmWWzsuFVCtLdWhvasDt9D7CeB5yzLVT4m
         Rl+MDcUVFC/WDzycGcb5R+1QN93xVMERmGlfFaQUzamDuko98KhokL8oDOijwgWuS/K4
         X2sQ==
X-Gm-Message-State: AOAM530VfcwqmaH8efHCkl36PH97mE86sPgxw+2XbCbaoAq/1IovRhiz
	l1/iSnkfZO+B77im7Ipw80DY20gXk7Py9Lvk1lo=
X-Google-Smtp-Source: 
 ABdhPJwfL+gEdWSYzHMDjurgLPb6kxSN7LjSZwQ7bm2rI3fFiC0491nzvRDCPQ9FS1iDEO91zsOb0LQJcArg8+4tUuA=
X-Received: by 2002:ab0:36e8:: with SMTP id x8mr1800516uau.22.1634667492287;
 Tue, 19 Oct 2021 11:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-2-alex@linutronix.de>
 <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Oct 2021 20:18:00 +0200
Message-ID: 
 <CANNYZj_kzzBM7v96_fkivVgA4ksNBpk00hsCHPmkq4am1EpGXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003427f205ceb8afb9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 18:18:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157197

--0000000000003427f205ceb8afb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Oct 2021 at 20:11, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Oct 19, 2021 at 10:44 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I disagree. It carries a support burden, can be easily provided by the
> host, and it=E2=80=99s purpose is source code formatting. It does not bel=
ong in
> core.
>
> rustfmt is used by default in a lot of rust projects so its better to
> include the minimal set of tools in core even though when there is no
> sample in core using it. perhaps adding such a sample to oe-core
> example could be better patch here. We have Joe as maintainer for this
> recipe so its not a orphaned package.
>

I can't agree with the 'it might be needed somehow, somewhere' reasoning to
keep it
(or anything else really). It only got added to core because someone copied
recipes-examples/ wholesale from meta-rust.

If it is actually needed somewhere, we can easily bring it back, but until
then I would take it out.
Especially considering it's a generated recipe (via cargo-bitbake) and it's
not at all clear how
to keep it current.

Joe who? The listed maintainer is Randy.

Alex


>
> >
> > Alex
> >
> > On Tue 19. Oct 2021 at 18.34, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On 10/19/21 8:33 AM, Alexander Kanavin wrote:
> >> > The recipes does not have any consumers, is host-only,
> >> > is rather out of date, and is still present in meta-rust.
> >> >
> >> > Rust toolchain is now tested through other items, so I don't see
> >> > a use case for it. For a target example there's rust-hello-world.
> >> >
> >>
> >> its a tool. Think of strace, so there is value in keeping it in oe-cor=
e
> >> so lets not drop it.
> >>
> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > ---
> >> >   meta/conf/distro/include/maintainers.inc      |   1 -
> >> >   meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 171
> ------------------
> >> >   2 files changed, 172 deletions(-)
> >> >   delete mode 100644 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >> >
> >> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> >> > index baec2bef4d..d26d99a43d 100644
> >> > --- a/meta/conf/distro/include/maintainers.inc
> >> > +++ b/meta/conf/distro/include/maintainers.inc
> >> > @@ -662,7 +662,6 @@ RECIPE_MAINTAINER:pn-rt-tests =3D "Alexander
> Kanavin <alex.kanavin@gmail.com>"
> >> >   RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burton@arm.com>"
> >> >   RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <
> ross.burton@arm.com>"
> >> >   RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> > -RECIPE_MAINTAINER:pn-rustfmt =3D "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> >   RECIPE_MAINTAINER:pn-rust-cross-${TARGET_ARCH} =3D "Randy MacLeod =
<
> Randy.MacLeod@windriver.com>"
> >> >   RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH}
> =3D "Randy MacLeod <Randy.MacLeod@windriver.com>"
> >> >   RECIPE_MAINTAINER:pn-rust-hello-world =3D "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> > diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >> > deleted file mode 100644
> >> > index 2e4a47eb00..0000000000
> >> > --- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >> > +++ /dev/null
> >> > @@ -1,171 +0,0 @@
> >> > -# Auto-Generated by cargo-bitbake 0.3.13
> >> > -#
> >> > -inherit cargo
> >> > -
> >> > -# If this is git based prefer versioned ones if they exist
> >> > -# DEFAULT_PREFERENCE =3D "-1"
> >> > -
> >> > -# how to get rustfmt-nightly could be as easy as but default to a
> git checkout:
> >> > -# SRC_URI +=3D "crate://crates.io/rustfmt-nightly/1.4.2"
> >> > -SRC_URI +=3D "git://
> github.com/rust-lang/rustfmt.git;protocol=3Dhttps;nobranch=3D1"
> >> > -SRCREV =3D "aeb3496f31a0dfa90fc511520d2023634e885260"
> >> > -S =3D "${WORKDIR}/git"
> >> > -CARGO_SRC_DIR =3D ""
> >> > -EXCLUDE_FROM_WORLD =3D "1"
> >> > -
> >> > -# please note if you have entries that do not begin with crate://
> >> > -# you must change them to how that package can be fetched
> >> > -SRC_URI +=3D " \
> >> > -    crate://crates.io/aho-corasick/0.7.4 \
> >> > -    crate://crates.io/annotate-snippets/0.6.1 \
> >> > -    crate://crates.io/ansi_term/0.11.0 \
> >> > -    crate://crates.io/argon2rs/0.2.5 \
> >> > -    crate://crates.io/arrayvec/0.4.11 \
> >> > -    crate://crates.io/atty/0.2.13 \
> >> > -    crate://crates.io/autocfg/0.1.5 \
> >> > -    crate://crates.io/backtrace-sys/0.1.31 \
> >> > -    crate://crates.io/backtrace/0.3.33 \
> >> > -    crate://crates.io/bitflags/1.1.0 \
> >> > -    crate://crates.io/blake2-rfc/0.2.18 \
> >> > -    crate://crates.io/bstr/0.2.6 \
> >> > -    crate://crates.io/bytecount/0.5.1 \
> >> > -    crate://crates.io/byteorder/1.3.2 \
> >> > -    crate://crates.io/c2-chacha/0.2.2 \
> >> > -    crate://crates.io/cargo_metadata/0.8.1 \
> >> > -    crate://crates.io/cc/1.0.38 \
> >> > -    crate://crates.io/cfg-if/0.1.9 \
> >> > -    crate://crates.io/clap/2.33.0 \
> >> > -    crate://crates.io/cloudabi/0.0.3 \
> >> > -    crate://crates.io/constant_time_eq/0.1.3 \
> >> > -    crate://crates.io/crossbeam-channel/0.3.9 \
> >> > -    crate://crates.io/crossbeam-deque/0.2.0 \
> >> > -    crate://crates.io/crossbeam-epoch/0.3.1 \
> >> > -    crate://crates.io/crossbeam-utils/0.2.2 \
> >> > -    crate://crates.io/crossbeam-utils/0.6.6 \
> >> > -    crate://crates.io/derive-new/0.5.7 \
> >> > -    crate://crates.io/diff/0.1.11 \
> >> > -    crate://crates.io/dirs-sys/0.3.3 \
> >> > -    crate://crates.io/dirs/2.0.1 \
> >> > -    crate://crates.io/either/1.5.2 \
> >> > -    crate://crates.io/ena/0.13.0 \
> >> > -    crate://crates.io/env_logger/0.6.2 \
> >> > -    crate://crates.io/failure/0.1.5 \
> >> > -    crate://crates.io/failure_derive/0.1.5 \
> >> > -    crate://crates.io/fnv/1.0.6 \
> >> > -    crate://crates.io/fuchsia-cprng/0.1.1 \
> >> > -    crate://crates.io/getopts/0.2.19 \
> >> > -    crate://crates.io/getrandom/0.1.6 \
> >> > -    crate://crates.io/globset/0.4.4 \
> >> > -    crate://crates.io/heck/0.3.1 \
> >> > -    crate://crates.io/humantime/1.2.0 \
> >> > -    crate://crates.io/ignore/0.4.8 \
> >> > -    crate://crates.io/indexmap/1.0.2 \
> >> > -    crate://crates.io/itertools/0.8.0 \
> >> > -    crate://crates.io/itoa/0.4.4 \
> >> > -    crate://crates.io/jobserver/0.1.16 \
> >> > -    crate://crates.io/lazy_static/1.3.0 \
> >> > -    crate://crates.io/libc/0.2.60 \
> >> > -    crate://crates.io/lock_api/0.1.5 \
> >> > -    crate://crates.io/log/0.4.7 \
> >> > -    crate://crates.io/memchr/2.2.1 \
> >> > -    crate://crates.io/memoffset/0.2.1 \
> >> > -    crate://crates.io/nodrop/0.1.13 \
> >> > -    crate://crates.io/num_cpus/1.10.1 \
> >> > -    crate://crates.io/owning_ref/0.4.0 \
> >> > -    crate://crates.io/packed_simd/0.3.3 \
> >> > -    crate://crates.io/parking_lot/0.7.1 \
> >> > -    crate://crates.io/parking_lot_core/0.4.0 \
> >> > -    crate://crates.io/ppv-lite86/0.2.5 \
> >> > -    crate://crates.io/proc-macro2/0.4.30 \
> >> > -    crate://crates.io/quick-error/1.2.2 \
> >> > -    crate://crates.io/quote/0.6.13 \
> >> > -    crate://crates.io/rand/0.6.5 \
> >> > -    crate://crates.io/rand/0.7.0 \
> >> > -    crate://crates.io/rand_chacha/0.1.1 \
> >> > -    crate://crates.io/rand_chacha/0.2.1 \
> >> > -    crate://crates.io/rand_core/0.3.1 \
> >> > -    crate://crates.io/rand_core/0.4.0 \
> >> > -    crate://crates.io/rand_core/0.5.0 \
> >> > -    crate://crates.io/rand_hc/0.1.0 \
> >> > -    crate://crates.io/rand_hc/0.2.0 \
> >> > -    crate://crates.io/rand_isaac/0.1.1 \
> >> > -    crate://crates.io/rand_jitter/0.1.4 \
> >> > -    crate://crates.io/rand_os/0.1.3 \
> >> > -    crate://crates.io/rand_pcg/0.1.2 \
> >> > -    crate://crates.io/rand_xorshift/0.1.1 \
> >> > -    crate://crates.io/rdrand/0.4.0 \
> >> > -    crate://crates.io/redox_syscall/0.1.56 \
> >> > -    crate://crates.io/redox_users/0.3.0 \
> >> > -    crate://crates.io/regex-syntax/0.6.10 \
> >> > -    crate://crates.io/regex/1.2.0 \
> >> > -    crate://crates.io/rustc-ap-arena/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-graphviz/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-rustc_data_structures/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-rustc_errors/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-rustc_lexer/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-rustc_macros/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-rustc_target/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-serialize/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-syntax/542.0.0 \
> >> > -    crate://crates.io/rustc-ap-syntax_pos/542.0.0 \
> >> > -    crate://crates.io/rustc-demangle/0.1.15 \
> >> > -    crate://crates.io/rustc-hash/1.0.1 \
> >> > -    crate://crates.io/rustc-rayon-core/0.2.0 \
> >> > -    crate://crates.io/rustc-rayon/0.2.0 \
> >> > -    crate://crates.io/rustc-workspace-hack/1.0.0 \
> >> > -    crate://crates.io/rustc_version/0.2.3 \
> >> > -    crate://crates.io/ryu/1.0.0 \
> >> > -    crate://crates.io/same-file/1.0.5 \
> >> > -    crate://crates.io/scoped-tls/1.0.0 \
> >> > -    crate://crates.io/scoped_threadpool/0.1.9 \
> >> > -    crate://crates.io/scopeguard/0.3.3 \
> >> > -    crate://crates.io/semver-parser/0.7.0 \
> >> > -    crate://crates.io/semver/0.9.0 \
> >> > -    crate://crates.io/serde/1.0.97 \
> >> > -    crate://crates.io/serde_derive/1.0.97 \
> >> > -    crate://crates.io/serde_json/1.0.40 \
> >> > -    crate://crates.io/smallvec/0.6.10 \
> >> > -    crate://crates.io/spin/0.5.0 \
> >> > -    crate://crates.io/stable_deref_trait/1.1.1 \
> >> > -    crate://crates.io/strsim/0.8.0 \
> >> > -    crate://crates.io/structopt-derive/0.2.18 \
> >> > -    crate://crates.io/structopt/0.2.18 \
> >> > -    crate://crates.io/syn/0.15.42 \
> >> > -    crate://crates.io/synstructure/0.10.2 \
> >> > -    crate://crates.io/term/0.6.0 \
> >> > -    crate://crates.io/termcolor/1.0.5 \
> >> > -    crate://crates.io/textwrap/0.11.0 \
> >> > -    crate://crates.io/thread_local/0.3.6 \
> >> > -    crate://crates.io/toml/0.5.1 \
> >> > -    crate://crates.io/ucd-util/0.1.5 \
> >> > -    crate://crates.io/unicode-segmentation/1.3.0 \
> >> > -    crate://crates.io/unicode-width/0.1.5 \
> >> > -    crate://crates.io/unicode-xid/0.1.0 \
> >> > -    crate://crates.io/unicode_categories/0.1.1 \
> >> > -    crate://crates.io/utf8-ranges/1.0.3 \
> >> > -    crate://crates.io/vec_map/0.8.1 \
> >> > -    crate://crates.io/walkdir/2.2.9 \
> >> > -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> >> > -    crate://crates.io/winapi-util/0.1.2 \
> >> > -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> >> > -    crate://crates.io/winapi/0.3.7 \
> >> > -    crate://crates.io/wincolor/1.0.1 \
> >> > -"
> >> > -
> >> > -
> >> > -
> >> > -# FIXME: update generateme with the real MD5 of the license file
> >> > -LIC_FILES_CHKSUM =3D " \
> >> > -    file://LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540542 \
> >> > -    file://LICENSE-MIT;md5=3D0b29d505d9225d1f0815cbdcf602b901 \
> >> > -"
> >> > -
> >> > -SUMMARY =3D "Tool to find and fix Rust formatting issues"
> >> > -HOMEPAGE =3D "https://github.com/rust-lang/rustfmt"
> >> > -LICENSE =3D "Apache-2.0 | MIT"
> >> > -
> >> > -# includes this file if it exists but does not fail
> >> > -# this is useful for anything you may want to override from
> >> > -# what cargo-bitbake generates.
> >> > -include rustfmt-nightly-${PV}.inc
> >> > -include rustfmt-nightly.inc
> >> >
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#157121):
> https://lists.openembedded.org/g/openembedded-core/message/157121
> >> > Mute This Topic: https://lists.openembedded.org/mt/86442640/1997914
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--0000000000003427f205ceb8afb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Oct 2021 at 20:11, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Oct 19, 2021 at 10:44 AM Alexander=
 Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I disagree. It carries a support burden, can be easily provided by the=
 host, and it=E2=80=99s purpose is source code formatting. It does not belo=
ng in core.<br>
<br>
rustfmt is used by default in a lot of rust projects so its better to<br>
include the minimal set of tools in core even though when there is no<br>
sample in core using it. perhaps adding such a sample to oe-core<br>
example could be better patch here. We have Joe as maintainer for this<br>
recipe so its not a orphaned package.<br></blockquote><div><br></div><div>I=
 can&#39;t agree with the &#39;it might be needed somehow, somewhere&#39; r=
easoning to keep it <br></div><div>(or anything else really). It only got a=
dded to core because someone copied <br></div><div>recipes-examples/ wholes=
ale from meta-rust.</div><div><br></div><div>If it is actually needed somew=
here, we can easily bring it back, but until then I would take it out.</div=
><div>Especially considering it&#39;s a generated recipe (via cargo-bitbake=
) and it&#39;s not at all clear how</div><div>to keep it current.</div><div=
><br></div><div>Joe who? The listed maintainer is Randy.<br></div><div><br>=
</div><div>Alex<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue 19. Oct 2021 at 18.34, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 10/19/21 8:33 AM, Alexander Kanavin wrote:<br>
&gt;&gt; &gt; The recipes does not have any consumers, is host-only,<br>
&gt;&gt; &gt; is rather out of date, and is still present in meta-rust.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Rust toolchain is now tested through other items, so I don&#3=
9;t see<br>
&gt;&gt; &gt; a use case for it. For a target example there&#39;s rust-hell=
o-world.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; its a tool. Think of strace, so there is value in keeping it in oe=
-core<br>
&gt;&gt; so lets not drop it.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@l=
inutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;&gt; &gt;=C2=A0 =C2=A0meta/recipes-example/rustfmt/<a href=3D"http://ru=
stfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a> |=
 171 ------------------<br>
&gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 172 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-example/rustfmt/<=
a href=3D"http://rustfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rus=
tfmt_1.4.2.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/=
conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; index baec2bef4d..d26d99a43d 100644<br>
&gt;&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; @@ -662,7 +662,6 @@ RECIPE_MAINTAINER:pn-rt-tests =3D &quot;A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-ruby =3D &quot;Ross Burton &=
lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm=
.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-run-postinsts =3D &quot;Ross=
 Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.b=
urton@arm.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust =3D &quot;Randy MacLeod=
 &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy=
.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt; -RECIPE_MAINTAINER:pn-rustfmt =3D &quot;Randy MacLeod &lt;<a =
href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod=
@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust-cross-${TARGET_ARCH} =
=3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" =
target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSL=
ATED_TARGET_ARCH} =3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLe=
od@windriver.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;&quo=
t;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust-hello-world =3D &quot;R=
andy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_=
blank">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-example/rustfmt/<a href=3D"http://r=
ustfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a> =
b/meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_1.4.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 2e4a47eb00..0000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_=
1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,171 +0,0 @@<br>
&gt;&gt; &gt; -# Auto-Generated by cargo-bitbake 0.3.13<br>
&gt;&gt; &gt; -#<br>
&gt;&gt; &gt; -inherit cargo<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# If this is git based prefer versioned ones if they exist<b=
r>
&gt;&gt; &gt; -# DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# how to get rustfmt-nightly could be as easy as but default=
 to a git checkout:<br>
&gt;&gt; &gt; -# SRC_URI +=3D &quot;crate://<a href=3D"http://crates.io/rus=
tfmt-nightly/1.4.2" rel=3D"noreferrer" target=3D"_blank">crates.io/rustfmt-=
nightly/1.4.2</a>&quot;<br>
&gt;&gt; &gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rust-l=
ang/rustfmt.git;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D=
"_blank">github.com/rust-lang/rustfmt.git;protocol=3Dhttps;nobranch=3D1</a>=
&quot;<br>
&gt;&gt; &gt; -SRCREV =3D &quot;aeb3496f31a0dfa90fc511520d2023634e885260&qu=
ot;<br>
&gt;&gt; &gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; -CARGO_SRC_DIR =3D &quot;&quot;<br>
&gt;&gt; &gt; -EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# please note if you have entries that do not begin with cra=
te://<br>
&gt;&gt; &gt; -# you must change them to how that package can be fetched<br=
>
&gt;&gt; &gt; -SRC_URI +=3D &quot; \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasi=
ck/0.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/0.7.4=
</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/annotate-s=
nippets/0.6.1" rel=3D"noreferrer" target=3D"_blank">crates.io/annotate-snip=
pets/0.6.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ansi_term/=
0.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ansi_term/0.11.0</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/argon2rs/0=
.2.5" rel=3D"noreferrer" target=3D"_blank">crates.io/argon2rs/0.2.5</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/arrayvec/0=
.4.11" rel=3D"noreferrer" target=3D"_blank">crates.io/arrayvec/0.4.11</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.1=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/atty/0.2.13</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/0.=
1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/0.1.5</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/backtrace-=
sys/0.1.31" rel=3D"noreferrer" target=3D"_blank">crates.io/backtrace-sys/0.=
1.31</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/backtrace/=
0.3.33" rel=3D"noreferrer" target=3D"_blank">crates.io/backtrace/0.3.33</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.1.0</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/blake2-rfc=
/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/blake2-rfc/0.2.18</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bstr/0.2.6=
" rel=3D"noreferrer" target=3D"_blank">crates.io/bstr/0.2.6</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bytecount/=
0.5.1" rel=3D"noreferrer" target=3D"_blank">crates.io/bytecount/0.5.1</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder/=
1.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/byteorder/1.3.2</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c2-chacha/=
0.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/c2-chacha/0.2.2</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo_meta=
data/0.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo_metadata/0=
.8.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.38"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/cc/1.0.38</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/0.1=
.9" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/0.1.9</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap/2.33.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/clap/2.33.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cloudabi/0=
.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/cloudabi/0.0.3</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/constant_t=
ime_eq/0.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/constant_time_=
eq/0.1.3</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-=
channel/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-cha=
nnel/0.3.9</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-=
deque/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque=
/0.2.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-=
epoch/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch=
/0.3.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-=
utils/0.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils=
/0.2.2</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-=
utils/0.6.6" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils=
/0.6.6</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/derive-new=
/0.5.7" rel=3D"noreferrer" target=3D"_blank">crates.io/derive-new/0.5.7</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/diff/0.1.1=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/diff/0.1.11</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dirs-sys/0=
.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/dirs-sys/0.3.3</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dirs/2.0.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/dirs/2.0.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/either/1.5=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/either/1.5.2</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ena/0.13.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/ena/0.13.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_logger=
/0.6.2" rel=3D"noreferrer" target=3D"_blank">crates.io/env_logger/0.6.2</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/failure/0.=
1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/failure/0.1.5</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/failure_de=
rive/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/failure_derive/0=
.1.5</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fnv/1.0.6"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/fnv/1.0.6</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fuchsia-cp=
rng/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/fuchsia-cprng/0.1=
.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getopts/0.=
2.19" rel=3D"noreferrer" target=3D"_blank">crates.io/getopts/0.2.19</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/=
0.1.6" rel=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.1.6</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/globset/0.=
4.4" rel=3D"noreferrer" target=3D"_blank">crates.io/globset/0.4.4</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.3.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/heck/0.3.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/humantime/=
1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/humantime/1.2.0</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ignore/0.4=
.8" rel=3D"noreferrer" target=3D"_blank">crates.io/ignore/0.4.8</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/1=
.0.2" rel=3D"noreferrer" target=3D"_blank">crates.io/indexmap/1.0.2</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/=
0.8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/itertools/0.8.0</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/0.4.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/itoa/0.4.4</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jobserver/=
0.1.16" rel=3D"noreferrer" target=3D"_blank">crates.io/jobserver/0.1.16</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_stati=
c/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.3.0</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.6=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.60</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0=
.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.1.5</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.7"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.7</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.2=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/memchr/2.2.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/=
0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.2.1</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nodrop/0.1=
.13" rel=3D"noreferrer" target=3D"_blank">crates.io/nodrop/0.1.13</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1=
.10.1" rel=3D"noreferrer" target=3D"_blank">crates.io/num_cpus/1.10.1</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/owning_ref=
/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/owning_ref/0.4.0</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/packed_sim=
d/0.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/packed_simd/0.3.3</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lo=
t/0.7.1" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.7.1</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lo=
t_core/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_co=
re/0.4.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86=
/0.2.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.5</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro=
2/0.4.30" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/0.4.30=
</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quick-erro=
r/1.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/quick-error/1.2.2</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/0.6.=
13" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/0.6.13</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.6.5=
" rel=3D"noreferrer" target=3D"_blank">crates.io/rand/0.6.5</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.7.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/rand/0.7.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chach=
a/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.1.1</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chach=
a/0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.2.1</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/=
0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.3.1</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/=
0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.4.0</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/=
0.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.5.0</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.=
1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_hc/0.1.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.=
2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_hc/0.2.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_isaac=
/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_isaac/0.1.1</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_jitte=
r/0.1.4" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_jitter/0.1.4</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_os/0.=
1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_os/0.1.3</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_pcg/0=
.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_pcg/0.1.2</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_xorsh=
ift/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_xorshift/0.1=
.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rdrand/0.4=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rdrand/0.4.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_sysc=
all/0.1.56" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.=
1.56</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_user=
s/0.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_users/0.3.0</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-synt=
ax/0.6.10" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.6.=
10</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.2.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/regex/1.2.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-a=
rena/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-ap-arena=
/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-g=
raphviz/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-ap-gr=
aphviz/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-r=
ustc_data_structures/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rustc-ap-rustc_data_structures/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-r=
ustc_errors/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-a=
p-rustc_errors/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-r=
ustc_lexer/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-ap=
-rustc_lexer/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-r=
ustc_macros/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-a=
p-rustc_macros/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-r=
ustc_target/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-a=
p-rustc_target/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-s=
erialize/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-ap-s=
erialize/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-s=
yntax/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-ap-synt=
ax/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-s=
yntax_pos/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-ap-=
syntax_pos/542.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-dema=
ngle/0.1.15" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-demangle/=
0.1.15</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-hash=
/1.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-hash/1.0.1</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-rayo=
n-core/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-rayon-co=
re/0.2.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-rayo=
n/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-rayon/0.2.0</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-work=
space-hack/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-work=
space-hack/1.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc_vers=
ion/0.2.3" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc_version/0.2=
.3</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/ryu/1.0.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/=
1.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/same-file/1.0.5</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scoped-tls=
/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scoped-tls/1.0.0</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scoped_thr=
eadpool/0.1.9" rel=3D"noreferrer" target=3D"_blank">crates.io/scoped_thread=
pool/0.1.9</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard=
/0.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/0.3.3</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/semver-par=
ser/0.7.0" rel=3D"noreferrer" target=3D"_blank">crates.io/semver-parser/0.7=
.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/semver/0.9=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/semver/0.9.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.=
97" rel=3D"noreferrer" target=3D"_blank">crates.io/serde/1.0.97</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_deri=
ve/1.0.97" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.=
97</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json=
/1.0.40" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.40</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/0=
.6.10" rel=3D"noreferrer" target=3D"_blank">crates.io/smallvec/0.6.10</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spin/0.5.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/spin/0.5.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/stable_der=
ef_trait/1.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/stable_deref=
_trait/1.1.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strsim/0.8=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/strsim/0.8.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/structopt-=
derive/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/structopt-der=
ive/0.2.18</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/structopt/=
0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/structopt/0.2.18</a>=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/0.15.4=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/0.15.42</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/synstructu=
re/0.10.2" rel=3D"noreferrer" target=3D"_blank">crates.io/synstructure/0.10=
.2</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/term/0.6.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/term/0.6.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termcolor/=
1.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/termcolor/1.0.5</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/textwrap/0=
.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/textwrap/0.11.0</a> \=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thread_loc=
al/0.3.6" rel=3D"noreferrer" target=3D"_blank">crates.io/thread_local/0.3.6=
</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml/0.5.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/toml/0.5.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ucd-util/0=
.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ucd-util/0.1.5</a> \<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-se=
gmentation/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-se=
gmentation/1.3.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-wi=
dth/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-width/0.1=
.5</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xi=
d/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.1.0</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode_ca=
tegories/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode_cate=
gories/0.1.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf8-range=
s/1.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/utf8-ranges/1.0.3</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vec_map/0.=
8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/vec_map/0.8.1</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.=
2.9" rel=3D"noreferrer" target=3D"_blank">crates.io/walkdir/2.2.9</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i68=
6-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/wina=
pi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-uti=
l/0.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.2</=
a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86=
_64-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/wi=
napi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3=
.7" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.7</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wincolor/1=
.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/wincolor/1.0.1</a> \<b=
r>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# FIXME: update generateme with the real MD5 of the license =
file<br>
&gt;&gt; &gt; -LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://LICENSE-APACHE;md5=3D1836efb2eb77996669=
6f473ee8540542 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://LICENSE-MIT;md5=3D0b29d505d9225d1f0815c=
bdcf602b901 \<br>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SUMMARY =3D &quot;Tool to find and fix Rust formatting issue=
s&quot;<br>
&gt;&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/rust-lang/r=
ustfmt" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/r=
ustfmt</a>&quot;<br>
&gt;&gt; &gt; -LICENSE =3D &quot;Apache-2.0 | MIT&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# includes this file if it exists but does not fail<br>
&gt;&gt; &gt; -# this is useful for anything you may want to override from<=
br>
&gt;&gt; &gt; -# what cargo-bitbake generates.<br>
&gt;&gt; &gt; -include rustfmt-nightly-${PV}.inc<br>
&gt;&gt; &gt; -include rustfmt-nightly.inc<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#157121): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/157121" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/157121</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/86442640/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/86442640/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div></div>

--0000000000003427f205ceb8afb9--

