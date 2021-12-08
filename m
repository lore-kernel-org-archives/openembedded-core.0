Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA19C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 00:10:54 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.5510.1638922253893908206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 16:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QS0/Ny+v;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: rwmacleod@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id k4so520494pgb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 16:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cZZsCtFcKkHV0AuaX4jri5peRiYNHil3XCvTEU056uE=;
        b=QS0/Ny+v3tWf86vtBj43x1rR6i421aRhjx03NrK/5mL/QutUMFuub+bC6Cu/szV2nM
         3ZG0IidlnbZrY5RT4gF8GeWM7hUBtZ6qr889an7lzy1aSR714VoUQPZ6zBN9hlHu3Wot
         5SszUEZdIJRZEZRwQaUdObvB5DfVgML0JxdS4HRc4/Ii0Nr/aXfZtHJQjOkCnhvbHicp
         6XLr5OJIk14cilzO5SOHemiXnDNwZkIV3tPm+oPfcmalCiaBk9WJ04dPvkSR0uDB6zR7
         EQKBMURjM3uMXZ1KaNZDfHNenhQRIUg2DoC+z2JMdMt3CorRlE05vBqG4tdqqonuQy/2
         xgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZZsCtFcKkHV0AuaX4jri5peRiYNHil3XCvTEU056uE=;
        b=2eDHs5tDBS1q/nC5mE9wMUnFuo0V3eBGFR8XaTw8Tjw3fo0uGSMLyDlt8m+W5QmR9h
         NuAEeWQjbWYIxRKkax1+ZydnSkI7PkzwlCvOOkYZuTQO1wr9ds6W918JXyCybJffoHgK
         yNap/FK7mUAn3uxrCzcUFXspjqDC6qnBZbVgQJqXbNB4NrU3Xf02Omv/jXFjBzdfFBTC
         0VIoKtAhwZRtXzSD8dYzSJ97usgfY5UOHgaecZOtQZqPGwrtZRHYm319tStM7PZ0pJIO
         4QsvyyTzDRsYBztLjqp3YnWRTKqGIsFfbOO7vXgybTk3Ys7/BhUK538UbGI13nwzjyb9
         uIdw==
X-Gm-Message-State: AOAM533TQVSnzgnnltW8ZFO/W3h6WTfASBzHIDzUQWBKRo+phJVWAfT4
	BNKDzjyhaVt+LsxsXuBI2SEulQhraRzOizai1jY=
X-Google-Smtp-Source: 
 ABdhPJyGSNwPUNaWOtwdzhUk8EDGk79U5G1TeZhbeloUczOOu8PR9cmsTv3FEg5i05t6HIv+amZJem/OUy2N7nNpQOQ=
X-Received: by 2002:a05:6a00:1389:b0:4ad:528b:bf86 with SMTP id
 t9-20020a056a00138900b004ad528bbf86mr2541971pfg.80.1638922253231; Tue, 07 Dec
 2021 16:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20211207130703.3196805-1-alex@linutronix.de>
 <20211207130703.3196805-5-alex@linutronix.de>
 <CAMKF1srdcxkovvJbdO62u8aESa4M7gb7Z_on1MqaurNdRW5uXw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srdcxkovvJbdO62u8aESa4M7gb7Z_on1MqaurNdRW5uXw@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Tue, 7 Dec 2021 19:10:41 -0500
Message-ID: 
 <CAK6=ix6t4xSqz6s1FUZSO1x7GXaJ5uJHdE28-W74SvmsSxOx_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/16] rustfmt: remove the recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, pgowda cve <pgowda.cve@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b7e90c05d2975277"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 00:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159337

--000000000000b7e90c05d2975277
Content-Type: text/plain; charset="UTF-8"

Fine with me.

Even building rustfmt seems to require the nightly toolchain so let's drop
it for now.

Randy


On Tue., Dec. 7, 2021, 11:01 Khem Raj, <raj.khem@gmail.com> wrote:

> On Tue, Dec 7, 2021 at 5:07 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > There has been a discussion on the merits of keeping rustfmt in core,
> > and especially this message made me resubmit its removal:
> >
> > https://lists.openembedded.org/g/openembedded-core/message/157471
> >
>
> Its fine I guess, perhaps meta-rust will still be used to carry some
> additional rust tools.
>
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   1 -
> >  meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 171 ------------------
> >  2 files changed, 172 deletions(-)
> >  delete mode 100644 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 7d3ca5c429..8e86ea45d2 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -677,7 +677,6 @@ RECIPE_MAINTAINER:pn-rt-tests = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com
> >"
> >  RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com
> >"
> > -RECIPE_MAINTAINER:pn-rustfmt = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >  RECIPE_MAINTAINER:pn-rust-cross-${TUNE_PKGARCH}-${TCLIBC} = "Randy
> MacLeod <Randy.MacLeod@windriver.com>"
> >  RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "Randy MacLeod <Randy.MacLeod@windriver.com>"
> >  RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> > diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> > deleted file mode 100644
> > index 2e4a47eb00..0000000000
> > --- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> > +++ /dev/null
> > @@ -1,171 +0,0 @@
> > -# Auto-Generated by cargo-bitbake 0.3.13
> > -#
> > -inherit cargo
> > -
> > -# If this is git based prefer versioned ones if they exist
> > -# DEFAULT_PREFERENCE = "-1"
> > -
> > -# how to get rustfmt-nightly could be as easy as but default to a git
> checkout:
> > -# SRC_URI += "crate://crates.io/rustfmt-nightly/1.4.2"
> > -SRC_URI += "git://
> github.com/rust-lang/rustfmt.git;protocol=https;nobranch=1"
> > -SRCREV = "aeb3496f31a0dfa90fc511520d2023634e885260"
> > -S = "${WORKDIR}/git"
> > -CARGO_SRC_DIR = ""
> > -EXCLUDE_FROM_WORLD = "1"
> > -
> > -# please note if you have entries that do not begin with crate://
> > -# you must change them to how that package can be fetched
> > -SRC_URI += " \
> > -    crate://crates.io/aho-corasick/0.7.4 \
> > -    crate://crates.io/annotate-snippets/0.6.1 \
> > -    crate://crates.io/ansi_term/0.11.0 \
> > -    crate://crates.io/argon2rs/0.2.5 \
> > -    crate://crates.io/arrayvec/0.4.11 \
> > -    crate://crates.io/atty/0.2.13 \
> > -    crate://crates.io/autocfg/0.1.5 \
> > -    crate://crates.io/backtrace-sys/0.1.31 \
> > -    crate://crates.io/backtrace/0.3.33 \
> > -    crate://crates.io/bitflags/1.1.0 \
> > -    crate://crates.io/blake2-rfc/0.2.18 \
> > -    crate://crates.io/bstr/0.2.6 \
> > -    crate://crates.io/bytecount/0.5.1 \
> > -    crate://crates.io/byteorder/1.3.2 \
> > -    crate://crates.io/c2-chacha/0.2.2 \
> > -    crate://crates.io/cargo_metadata/0.8.1 \
> > -    crate://crates.io/cc/1.0.38 \
> > -    crate://crates.io/cfg-if/0.1.9 \
> > -    crate://crates.io/clap/2.33.0 \
> > -    crate://crates.io/cloudabi/0.0.3 \
> > -    crate://crates.io/constant_time_eq/0.1.3 \
> > -    crate://crates.io/crossbeam-channel/0.3.9 \
> > -    crate://crates.io/crossbeam-deque/0.2.0 \
> > -    crate://crates.io/crossbeam-epoch/0.3.1 \
> > -    crate://crates.io/crossbeam-utils/0.2.2 \
> > -    crate://crates.io/crossbeam-utils/0.6.6 \
> > -    crate://crates.io/derive-new/0.5.7 \
> > -    crate://crates.io/diff/0.1.11 \
> > -    crate://crates.io/dirs-sys/0.3.3 \
> > -    crate://crates.io/dirs/2.0.1 \
> > -    crate://crates.io/either/1.5.2 \
> > -    crate://crates.io/ena/0.13.0 \
> > -    crate://crates.io/env_logger/0.6.2 \
> > -    crate://crates.io/failure/0.1.5 \
> > -    crate://crates.io/failure_derive/0.1.5 \
> > -    crate://crates.io/fnv/1.0.6 \
> > -    crate://crates.io/fuchsia-cprng/0.1.1 \
> > -    crate://crates.io/getopts/0.2.19 \
> > -    crate://crates.io/getrandom/0.1.6 \
> > -    crate://crates.io/globset/0.4.4 \
> > -    crate://crates.io/heck/0.3.1 \
> > -    crate://crates.io/humantime/1.2.0 \
> > -    crate://crates.io/ignore/0.4.8 \
> > -    crate://crates.io/indexmap/1.0.2 \
> > -    crate://crates.io/itertools/0.8.0 \
> > -    crate://crates.io/itoa/0.4.4 \
> > -    crate://crates.io/jobserver/0.1.16 \
> > -    crate://crates.io/lazy_static/1.3.0 \
> > -    crate://crates.io/libc/0.2.60 \
> > -    crate://crates.io/lock_api/0.1.5 \
> > -    crate://crates.io/log/0.4.7 \
> > -    crate://crates.io/memchr/2.2.1 \
> > -    crate://crates.io/memoffset/0.2.1 \
> > -    crate://crates.io/nodrop/0.1.13 \
> > -    crate://crates.io/num_cpus/1.10.1 \
> > -    crate://crates.io/owning_ref/0.4.0 \
> > -    crate://crates.io/packed_simd/0.3.3 \
> > -    crate://crates.io/parking_lot/0.7.1 \
> > -    crate://crates.io/parking_lot_core/0.4.0 \
> > -    crate://crates.io/ppv-lite86/0.2.5 \
> > -    crate://crates.io/proc-macro2/0.4.30 \
> > -    crate://crates.io/quick-error/1.2.2 \
> > -    crate://crates.io/quote/0.6.13 \
> > -    crate://crates.io/rand/0.6.5 \
> > -    crate://crates.io/rand/0.7.0 \
> > -    crate://crates.io/rand_chacha/0.1.1 \
> > -    crate://crates.io/rand_chacha/0.2.1 \
> > -    crate://crates.io/rand_core/0.3.1 \
> > -    crate://crates.io/rand_core/0.4.0 \
> > -    crate://crates.io/rand_core/0.5.0 \
> > -    crate://crates.io/rand_hc/0.1.0 \
> > -    crate://crates.io/rand_hc/0.2.0 \
> > -    crate://crates.io/rand_isaac/0.1.1 \
> > -    crate://crates.io/rand_jitter/0.1.4 \
> > -    crate://crates.io/rand_os/0.1.3 \
> > -    crate://crates.io/rand_pcg/0.1.2 \
> > -    crate://crates.io/rand_xorshift/0.1.1 \
> > -    crate://crates.io/rdrand/0.4.0 \
> > -    crate://crates.io/redox_syscall/0.1.56 \
> > -    crate://crates.io/redox_users/0.3.0 \
> > -    crate://crates.io/regex-syntax/0.6.10 \
> > -    crate://crates.io/regex/1.2.0 \
> > -    crate://crates.io/rustc-ap-arena/542.0.0 \
> > -    crate://crates.io/rustc-ap-graphviz/542.0.0 \
> > -    crate://crates.io/rustc-ap-rustc_data_structures/542.0.0 \
> > -    crate://crates.io/rustc-ap-rustc_errors/542.0.0 \
> > -    crate://crates.io/rustc-ap-rustc_lexer/542.0.0 \
> > -    crate://crates.io/rustc-ap-rustc_macros/542.0.0 \
> > -    crate://crates.io/rustc-ap-rustc_target/542.0.0 \
> > -    crate://crates.io/rustc-ap-serialize/542.0.0 \
> > -    crate://crates.io/rustc-ap-syntax/542.0.0 \
> > -    crate://crates.io/rustc-ap-syntax_pos/542.0.0 \
> > -    crate://crates.io/rustc-demangle/0.1.15 \
> > -    crate://crates.io/rustc-hash/1.0.1 \
> > -    crate://crates.io/rustc-rayon-core/0.2.0 \
> > -    crate://crates.io/rustc-rayon/0.2.0 \
> > -    crate://crates.io/rustc-workspace-hack/1.0.0 \
> > -    crate://crates.io/rustc_version/0.2.3 \
> > -    crate://crates.io/ryu/1.0.0 \
> > -    crate://crates.io/same-file/1.0.5 \
> > -    crate://crates.io/scoped-tls/1.0.0 \
> > -    crate://crates.io/scoped_threadpool/0.1.9 \
> > -    crate://crates.io/scopeguard/0.3.3 \
> > -    crate://crates.io/semver-parser/0.7.0 \
> > -    crate://crates.io/semver/0.9.0 \
> > -    crate://crates.io/serde/1.0.97 \
> > -    crate://crates.io/serde_derive/1.0.97 \
> > -    crate://crates.io/serde_json/1.0.40 \
> > -    crate://crates.io/smallvec/0.6.10 \
> > -    crate://crates.io/spin/0.5.0 \
> > -    crate://crates.io/stable_deref_trait/1.1.1 \
> > -    crate://crates.io/strsim/0.8.0 \
> > -    crate://crates.io/structopt-derive/0.2.18 \
> > -    crate://crates.io/structopt/0.2.18 \
> > -    crate://crates.io/syn/0.15.42 \
> > -    crate://crates.io/synstructure/0.10.2 \
> > -    crate://crates.io/term/0.6.0 \
> > -    crate://crates.io/termcolor/1.0.5 \
> > -    crate://crates.io/textwrap/0.11.0 \
> > -    crate://crates.io/thread_local/0.3.6 \
> > -    crate://crates.io/toml/0.5.1 \
> > -    crate://crates.io/ucd-util/0.1.5 \
> > -    crate://crates.io/unicode-segmentation/1.3.0 \
> > -    crate://crates.io/unicode-width/0.1.5 \
> > -    crate://crates.io/unicode-xid/0.1.0 \
> > -    crate://crates.io/unicode_categories/0.1.1 \
> > -    crate://crates.io/utf8-ranges/1.0.3 \
> > -    crate://crates.io/vec_map/0.8.1 \
> > -    crate://crates.io/walkdir/2.2.9 \
> > -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > -    crate://crates.io/winapi-util/0.1.2 \
> > -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > -    crate://crates.io/winapi/0.3.7 \
> > -    crate://crates.io/wincolor/1.0.1 \
> > -"
> > -
> > -
> > -
> > -# FIXME: update generateme with the real MD5 of the license file
> > -LIC_FILES_CHKSUM = " \
> > -    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
> > -    file://LICENSE-MIT;md5=0b29d505d9225d1f0815cbdcf602b901 \
> > -"
> > -
> > -SUMMARY = "Tool to find and fix Rust formatting issues"
> > -HOMEPAGE = "https://github.com/rust-lang/rustfmt"
> > -LICENSE = "Apache-2.0 | MIT"
> > -
> > -# includes this file if it exists but does not fail
> > -# this is useful for anything you may want to override from
> > -# what cargo-bitbake generates.
> > -include rustfmt-nightly-${PV}.inc
> > -include rustfmt-nightly.inc
> > --
> > 2.20.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159311):
> https://lists.openembedded.org/g/openembedded-core/message/159311
> Mute This Topic: https://lists.openembedded.org/mt/87564002/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b7e90c05d2975277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Fine with me.=C2=A0<div dir=3D"auto"><br><div dir=3D"auto=
">Even building rustfmt seems to require the nightly toolchain so let&#39;s=
 drop it for now.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Randy</div><div dir=3D"auto"><br></div></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue., Dec. 7, 2021, 11:01 K=
hem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Dec 7, 2021 at 5:=
07 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; There has been a discussion on the merits of keeping rustfmt in core,<=
br>
&gt; and especially this message made me resubmit its removal:<br>
&gt;<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
157471" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-core/message/157471</a><br>
&gt;<br>
<br>
Its fine I guess, perhaps meta-rust will still be used to carry some<br>
additional rust tools.<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank" rel=3D"noreferrer">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_1.4.2.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a> | 171=
 ------------------<br>
&gt;=C2=A0 2 files changed, 172 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-example/rustfmt/<a href=3D"http:=
//rustfmt_1.4.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rustfmt=
_1.4.2.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 7d3ca5c429..8e86ea45d2 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -677,7 +677,6 @@ RECIPE_MAINTAINER:pn-rt-tests =3D &quot;Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-ruby =3D &quot;Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@arm.com" target=3D"_blank" rel=3D"noreferrer">ross.burton=
@arm.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-run-postinsts =3D &quot;Ross Burton &lt;<a =
href=3D"mailto:ross.burton@arm.com" target=3D"_blank" rel=3D"noreferrer">ro=
ss.burton@arm.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust =3D &quot;Randy MacLeod &lt;<a href=3D=
"mailto:Randy.MacLeod@windriver.com" target=3D"_blank" rel=3D"noreferrer">R=
andy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-rustfmt =3D &quot;Randy MacLeod &lt;<a href=3D"m=
ailto:Randy.MacLeod@windriver.com" target=3D"_blank" rel=3D"noreferrer">Ran=
dy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-cross-${TUNE_PKGARCH}-${TCLIBC} =3D &q=
uot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Randy.MacLeod@windriver.com</a>&gt;&quot;<br=
>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARC=
H} =3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.co=
m" target=3D"_blank" rel=3D"noreferrer">Randy.MacLeod@windriver.com</a>&gt;=
&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-hello-world =3D &quot;Randy MacLeod &l=
t;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank" rel=3D"n=
oreferrer">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_1.=
4.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a=
> b/meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_1.4.2.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 2e4a47eb00..0000000000<br>
&gt; --- a/meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_1.4.2.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,171 +0,0 @@<br>
&gt; -# Auto-Generated by cargo-bitbake 0.3.13<br>
&gt; -#<br>
&gt; -inherit cargo<br>
&gt; -<br>
&gt; -# If this is git based prefer versioned ones if they exist<br>
&gt; -# DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; -<br>
&gt; -# how to get rustfmt-nightly could be as easy as but default to a git=
 checkout:<br>
&gt; -# SRC_URI +=3D &quot;crate://<a href=3D"http://crates.io/rustfmt-nigh=
tly/1.4.2" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustfm=
t-nightly/1.4.2</a>&quot;<br>
&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rust-lang/rustf=
mt.git;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/rust-lang/rustfmt.git;protocol=3Dhttps;nobranch=3D1<=
/a>&quot;<br>
&gt; -SRCREV =3D &quot;aeb3496f31a0dfa90fc511520d2023634e885260&quot;<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -CARGO_SRC_DIR =3D &quot;&quot;<br>
&gt; -EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; -<br>
&gt; -# please note if you have entries that do not begin with crate://<br>
&gt; -# you must change them to how that package can be fetched<br>
&gt; -SRC_URI +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.4"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/aho-corasick/0.7=
.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/annotate-snippets/0=
.6.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/annotate-sn=
ippets/0.6.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ansi_term/0.11.0" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ansi_term/0.11.0</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/argon2rs/0.2.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/argon2rs/0.2.5</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/arrayvec/0.4.11" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/arrayvec/0.4.11</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.13" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/atty/0.2.13</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/0.1.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/autocfg/0.1.5</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/backtrace-sys/0.1.3=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/backtrace-sys/=
0.1.31</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/backtrace/0.3.33" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/backtrace/0.3.33</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.1.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/bitflags/1.1.0</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/blake2-rfc/0.2.18" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/blake2-rfc/0.2.18=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bstr/0.2.6" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/bstr/0.2.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bytecount/0.5.1" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/bytecount/0.5.1</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder/1.3.2" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/byteorder/1.3.2</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c2-chacha/0.2.2" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/c2-chacha/0.2.2</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo_metadata/0.8.=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/cargo_metadata=
/0.8.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.38" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">crates.io/cc/1.0.38</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/0.1.9" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/cfg-if/0.1.9</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap/2.33.0" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/clap/2.33.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cloudabi/0.0.3" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/cloudabi/0.0.3</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/constant_time_eq/0.=
1.3" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/constant_tim=
e_eq/0.1.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0=
.3.9" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-c=
hannel/0.3.9</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.2=
.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-deq=
ue/0.2.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.3=
.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-epo=
ch/0.3.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.2=
.2" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-uti=
ls/0.2.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.6=
.6" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-uti=
ls/0.6.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/derive-new/0.5.7" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/derive-new/0.5.7</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/diff/0.1.11" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/diff/0.1.11</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dirs-sys/0.3.3" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/dirs-sys/0.3.3</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dirs/2.0.1" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/dirs/2.0.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/either/1.5.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/either/1.5.2</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ena/0.13.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/ena/0.13.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_logger/0.6.2" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/env_logger/0.6.2</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/failure/0.1.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/failure/0.1.5</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/failure_derive/0.1.=
5" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/failure_derive=
/0.1.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fnv/1.0.6" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">crates.io/fnv/1.0.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fuchsia-cprng/0.1.1=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/fuchsia-cprng/0=
.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getopts/0.2.19" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/getopts/0.2.19</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.1.6" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/getrandom/0.1.6</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/globset/0.4.4" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/globset/0.4.4</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.3.1" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/heck/0.3.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/humantime/1.2.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/humantime/1.2.0</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ignore/0.4.8" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ignore/0.4.8</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/1.0.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/indexmap/1.0.2</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/0.8.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/itertools/0.8.0</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/0.4.4" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/itoa/0.4.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jobserver/0.1.16" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/jobserver/0.1.16</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.3.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/lazy_static/1.3.0=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.60" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/libc/0.2.60</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.1.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/lock_api/0.1.5</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.7" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">crates.io/log/0.4.7</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.2.1" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/memchr/2.2.1</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.2.1" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/memoffset/0.2.1</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nodrop/0.1.13" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/nodrop/0.1.13</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1.10.1" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/num_cpus/1.10.1</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/owning_ref/0.4.0" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/owning_ref/0.4.0</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/packed_simd/0.3.3" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/packed_simd/0.3.3=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.7.1" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/parking_lot/0.7.1=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
4.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/parking_lot_=
core/0.4.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2.5" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.5</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/0.4.30"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/proc-macro2/0.4.=
30</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quick-error/1.2.2" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/quick-error/1.2.2=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/0.6.13" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/quote/0.6.13</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.6.5" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/rand/0.6.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.7.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/rand/0.7.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.1.1" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_chacha/0.1.1=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.2.1" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_chacha/0.2.1=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.3.1" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_core/0.3.1</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.4.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_core/0.4.0</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.5.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_core/0.5.0</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.1.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_hc/0.1.0</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.2.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_hc/0.2.0</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_isaac/0.1.1" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_isaac/0.1.1</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_jitter/0.1.4" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_jitter/0.1.4=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_os/0.1.3" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_os/0.1.3</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_pcg/0.1.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_pcg/0.1.2</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_xorshift/0.1.1=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_xorshift/0=
.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rdrand/0.4.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rdrand/0.4.0</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.1.5=
6" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/redox_syscall/=
0.1.56</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_users/0.3.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/redox_users/0.3.0=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.6.10=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/regex-syntax/0.=
6.10</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.2.0" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/regex/1.2.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-arena/542.=
0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-ap-are=
na/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-graphviz/5=
42.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-ap-=
graphviz/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-rustc_data=
_structures/542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates=
.io/rustc-ap-rustc_data_structures/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-rustc_erro=
rs/542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc=
-ap-rustc_errors/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-rustc_lexe=
r/542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-=
ap-rustc_lexer/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-rustc_macr=
os/542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc=
-ap-rustc_macros/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-rustc_targ=
et/542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc=
-ap-rustc_target/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-serialize/=
542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-ap=
-serialize/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-syntax/542=
.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-ap-sy=
ntax/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-ap-syntax_pos=
/542.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-a=
p-syntax_pos/542.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-demangle/0.1.=
15" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-demangl=
e/0.1.15</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-hash/1.0.1" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-hash/1.0.1</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-rayon-core/0.=
2.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-rayon-=
core/0.2.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-rayon/0.2.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-rayon/0.2.0=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-workspace-hac=
k/1.0.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc-wo=
rkspace-hack/1.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc_version/0.2.3=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rustc_version/0=
.2.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.0" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">crates.io/ryu/1.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.5" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/same-file/1.0.5</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scoped-tls/1.0.0" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/scoped-tls/1.0.0</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scoped_threadpool/0=
.1.9" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/scoped_thre=
adpool/0.1.9</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/0.3.3" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/scopeguard/0.3.3</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/semver-parser/0.7.0=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/semver-parser/0=
.7.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/semver/0.9.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/semver/0.9.0</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.97" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde/1.0.97</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.97=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde_derive/1.=
0.97</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.40" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde_json/1.0.40=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/0.6.10" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/smallvec/0.6.10</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spin/0.5.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/spin/0.5.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/stable_deref_trait/=
1.1.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/stable_der=
ef_trait/1.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strsim/0.8.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/strsim/0.8.0</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/structopt-derive/0.=
2.18" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/structopt-d=
erive/0.2.18</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/structopt/0.2.18" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/structopt/0.2.18</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/0.15.42" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/syn/0.15.42</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/synstructure/0.10.2=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/synstructure/0.=
10.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/term/0.6.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/term/0.6.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termcolor/1.0.5" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/termcolor/1.0.5</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/textwrap/0.11.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/textwrap/0.11.0</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thread_local/0.3.6"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/thread_local/0.3=
.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml/0.5.1" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/toml/0.5.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ucd-util/0.1.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ucd-util/0.1.5</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-segmentatio=
n/1.3.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode-=
segmentation/1.3.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-width/0.1.5=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode-width/0=
.1.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.1.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode-xid/0.1.0=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode_categories/=
0.1.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode_ca=
tegories/0.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf8-ranges/1.0.3" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/utf8-ranges/1.0.3=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vec_map/0.8.1" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/vec_map/0.8.1</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.2.9" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/walkdir/2.2.9</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-wind=
ows-gnu/0.4.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wi=
napi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.2" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.2=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-wi=
ndows-gnu/0.4.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/=
winapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.7" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/winapi/0.3.7</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wincolor/1.0.1" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wincolor/1.0.1</a> \=
<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -<br>
&gt; -<br>
&gt; -# FIXME: update generateme with the real MD5 of the license file<br>
&gt; -LIC_FILES_CHKSUM =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee85=
40542 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE-MIT;md5=3D0b29d505d9225d1f0815cbdcf602b9=
01 \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -SUMMARY =3D &quot;Tool to find and fix Rust formatting issues&quot;<b=
r>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/rust-lang/rustfmt" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/rust-lang=
/rustfmt</a>&quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0 | MIT&quot;<br>
&gt; -<br>
&gt; -# includes this file if it exists but does not fail<br>
&gt; -# this is useful for anything you may want to override from<br>
&gt; -# what cargo-bitbake generates.<br>
&gt; -include rustfmt-nightly-${PV}.inc<br>
&gt; -include rustfmt-nightly.inc<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159311): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159311" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/159311</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87564002/9533=
99" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/87564002/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b7e90c05d2975277--

