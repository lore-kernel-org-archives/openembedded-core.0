Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D35C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:11:36 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.13876.1634667095920410362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pnKW+yjT;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id r15so772215qkp.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RxVby3HKsyUvVP8sS20dQSNDI/hdEQ8hS1GCucnS+YM=;
        b=pnKW+yjTEC4bXEqN9oS2fxvtUe12845xIY3l7QHfJsJjYsV4CBRx8ic3Bncb8u4j++
         GIZy4NcV2+wwvqBdTUHxUTC3dWOiI1crBT0c/T9g7lIY0uLAv/oCKyjM01uiX8anh9zo
         vi4+QyCM3rw20mhQjcc6q5pMf1AkPPovRSbbxf+FcLJZtaWv4zzBuL+vx5ZQ0battBD+
         AfIgWwHWiZC4GOAvyMtQ+tq5Hzztx/WjJPfX7+sYTrRbEXgT8sWZdtYX30nexS+dwMtF
         8pv69M4NAszQNi3A7r/K1noomebaxVB1dM3VrF6c4jWKUVaYUX+0ApI/wJ/3ZqpyhuKO
         bjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RxVby3HKsyUvVP8sS20dQSNDI/hdEQ8hS1GCucnS+YM=;
        b=ZEAqRV7aFc/i2x9e1SDtjRZ2ORZQQNu/YKuBpFLnh1WoVyPnfD5G851aEwvWJloh9J
         iPb9WsQs5tkJbSgNbQJeq7s5GC17nKmLQ+WzyOD6g439d0HORJhLjEAySfciS5xqTeMQ
         sttmo23+MJcoNgWvymOm56GSIlDufwP2sJ2jzwnAS3YK0eGxlSpSEWZGsMI19x2xLO0r
         HmyHKFftGWFrzZpj1gq8XPspvCGJjKNghdmJJJW/rWFtJ1kxryx55Ndc3sBDPM6vSbUc
         OL3S1kX8H4UcoA3dJ9W1Sqk7uqyf1vuQCAJLiBtj1qjwQm4F+qbjAIMIsa8lvdygzvnL
         TZ0w==
X-Gm-Message-State: AOAM530gZYx7X4bn1fy2JSKVIQxTTtfwMFezMvuA9HXYteZuNeaZlpPJ
	sTTqg2ArVgH0Fa8gO+osvWrYr4lsXl3bz2L+qeI=
X-Google-Smtp-Source: 
 ABdhPJyR4IIo229yhbaJh1I7CQfcPF0dfxRgPLNLLN+DPueyasdTMv/0VMJXGaQ/5sR/kQIVbsNd/cqgaVIGeKlDXMc=
X-Received: by 2002:a37:6744:: with SMTP id b65mr1333967qkc.98.1634667094784;
 Tue, 19 Oct 2021 11:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-2-alex@linutronix.de>
 <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Oct 2021 11:11:08 -0700
Message-ID: 
 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 18:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157196

On Tue, Oct 19, 2021 at 10:44 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I disagree. It carries a support burden, can be easily provided by the ho=
st, and it=E2=80=99s purpose is source code formatting. It does not belong =
in core.

rustfmt is used by default in a lot of rust projects so its better to
include the minimal set of tools in core even though when there is no
sample in core using it. perhaps adding such a sample to oe-core
example could be better patch here. We have Joe as maintainer for this
recipe so its not a orphaned package.

>
> Alex
>
> On Tue 19. Oct 2021 at 18.34, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 10/19/21 8:33 AM, Alexander Kanavin wrote:
>> > The recipes does not have any consumers, is host-only,
>> > is rather out of date, and is still present in meta-rust.
>> >
>> > Rust toolchain is now tested through other items, so I don't see
>> > a use case for it. For a target example there's rust-hello-world.
>> >
>>
>> its a tool. Think of strace, so there is value in keeping it in oe-core
>> so lets not drop it.
>>
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >   meta/conf/distro/include/maintainers.inc      |   1 -
>> >   meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 171 ----------------=
--
>> >   2 files changed, 172 deletions(-)
>> >   delete mode 100644 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
>> >
>> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc
>> > index baec2bef4d..d26d99a43d 100644
>> > --- a/meta/conf/distro/include/maintainers.inc
>> > +++ b/meta/conf/distro/include/maintainers.inc
>> > @@ -662,7 +662,6 @@ RECIPE_MAINTAINER:pn-rt-tests =3D "Alexander Kanav=
in <alex.kanavin@gmail.com>"
>> >   RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burton@arm.com>"
>> >   RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm=
.com>"
>> >   RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windrive=
r.com>"
>> > -RECIPE_MAINTAINER:pn-rustfmt =3D "Randy MacLeod <Randy.MacLeod@windri=
ver.com>"
>> >   RECIPE_MAINTAINER:pn-rust-cross-${TARGET_ARCH} =3D "Randy MacLeod <R=
andy.MacLeod@windriver.com>"
>> >   RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
=3D "Randy MacLeod <Randy.MacLeod@windriver.com>"
>> >   RECIPE_MAINTAINER:pn-rust-hello-world =3D "Randy MacLeod <Randy.MacL=
eod@windriver.com>"
>> > diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb b/meta/reci=
pes-example/rustfmt/rustfmt_1.4.2.bb
>> > deleted file mode 100644
>> > index 2e4a47eb00..0000000000
>> > --- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
>> > +++ /dev/null
>> > @@ -1,171 +0,0 @@
>> > -# Auto-Generated by cargo-bitbake 0.3.13
>> > -#
>> > -inherit cargo
>> > -
>> > -# If this is git based prefer versioned ones if they exist
>> > -# DEFAULT_PREFERENCE =3D "-1"
>> > -
>> > -# how to get rustfmt-nightly could be as easy as but default to a git=
 checkout:
>> > -# SRC_URI +=3D "crate://crates.io/rustfmt-nightly/1.4.2"
>> > -SRC_URI +=3D "git://github.com/rust-lang/rustfmt.git;protocol=3Dhttps=
;nobranch=3D1"
>> > -SRCREV =3D "aeb3496f31a0dfa90fc511520d2023634e885260"
>> > -S =3D "${WORKDIR}/git"
>> > -CARGO_SRC_DIR =3D ""
>> > -EXCLUDE_FROM_WORLD =3D "1"
>> > -
>> > -# please note if you have entries that do not begin with crate://
>> > -# you must change them to how that package can be fetched
>> > -SRC_URI +=3D " \
>> > -    crate://crates.io/aho-corasick/0.7.4 \
>> > -    crate://crates.io/annotate-snippets/0.6.1 \
>> > -    crate://crates.io/ansi_term/0.11.0 \
>> > -    crate://crates.io/argon2rs/0.2.5 \
>> > -    crate://crates.io/arrayvec/0.4.11 \
>> > -    crate://crates.io/atty/0.2.13 \
>> > -    crate://crates.io/autocfg/0.1.5 \
>> > -    crate://crates.io/backtrace-sys/0.1.31 \
>> > -    crate://crates.io/backtrace/0.3.33 \
>> > -    crate://crates.io/bitflags/1.1.0 \
>> > -    crate://crates.io/blake2-rfc/0.2.18 \
>> > -    crate://crates.io/bstr/0.2.6 \
>> > -    crate://crates.io/bytecount/0.5.1 \
>> > -    crate://crates.io/byteorder/1.3.2 \
>> > -    crate://crates.io/c2-chacha/0.2.2 \
>> > -    crate://crates.io/cargo_metadata/0.8.1 \
>> > -    crate://crates.io/cc/1.0.38 \
>> > -    crate://crates.io/cfg-if/0.1.9 \
>> > -    crate://crates.io/clap/2.33.0 \
>> > -    crate://crates.io/cloudabi/0.0.3 \
>> > -    crate://crates.io/constant_time_eq/0.1.3 \
>> > -    crate://crates.io/crossbeam-channel/0.3.9 \
>> > -    crate://crates.io/crossbeam-deque/0.2.0 \
>> > -    crate://crates.io/crossbeam-epoch/0.3.1 \
>> > -    crate://crates.io/crossbeam-utils/0.2.2 \
>> > -    crate://crates.io/crossbeam-utils/0.6.6 \
>> > -    crate://crates.io/derive-new/0.5.7 \
>> > -    crate://crates.io/diff/0.1.11 \
>> > -    crate://crates.io/dirs-sys/0.3.3 \
>> > -    crate://crates.io/dirs/2.0.1 \
>> > -    crate://crates.io/either/1.5.2 \
>> > -    crate://crates.io/ena/0.13.0 \
>> > -    crate://crates.io/env_logger/0.6.2 \
>> > -    crate://crates.io/failure/0.1.5 \
>> > -    crate://crates.io/failure_derive/0.1.5 \
>> > -    crate://crates.io/fnv/1.0.6 \
>> > -    crate://crates.io/fuchsia-cprng/0.1.1 \
>> > -    crate://crates.io/getopts/0.2.19 \
>> > -    crate://crates.io/getrandom/0.1.6 \
>> > -    crate://crates.io/globset/0.4.4 \
>> > -    crate://crates.io/heck/0.3.1 \
>> > -    crate://crates.io/humantime/1.2.0 \
>> > -    crate://crates.io/ignore/0.4.8 \
>> > -    crate://crates.io/indexmap/1.0.2 \
>> > -    crate://crates.io/itertools/0.8.0 \
>> > -    crate://crates.io/itoa/0.4.4 \
>> > -    crate://crates.io/jobserver/0.1.16 \
>> > -    crate://crates.io/lazy_static/1.3.0 \
>> > -    crate://crates.io/libc/0.2.60 \
>> > -    crate://crates.io/lock_api/0.1.5 \
>> > -    crate://crates.io/log/0.4.7 \
>> > -    crate://crates.io/memchr/2.2.1 \
>> > -    crate://crates.io/memoffset/0.2.1 \
>> > -    crate://crates.io/nodrop/0.1.13 \
>> > -    crate://crates.io/num_cpus/1.10.1 \
>> > -    crate://crates.io/owning_ref/0.4.0 \
>> > -    crate://crates.io/packed_simd/0.3.3 \
>> > -    crate://crates.io/parking_lot/0.7.1 \
>> > -    crate://crates.io/parking_lot_core/0.4.0 \
>> > -    crate://crates.io/ppv-lite86/0.2.5 \
>> > -    crate://crates.io/proc-macro2/0.4.30 \
>> > -    crate://crates.io/quick-error/1.2.2 \
>> > -    crate://crates.io/quote/0.6.13 \
>> > -    crate://crates.io/rand/0.6.5 \
>> > -    crate://crates.io/rand/0.7.0 \
>> > -    crate://crates.io/rand_chacha/0.1.1 \
>> > -    crate://crates.io/rand_chacha/0.2.1 \
>> > -    crate://crates.io/rand_core/0.3.1 \
>> > -    crate://crates.io/rand_core/0.4.0 \
>> > -    crate://crates.io/rand_core/0.5.0 \
>> > -    crate://crates.io/rand_hc/0.1.0 \
>> > -    crate://crates.io/rand_hc/0.2.0 \
>> > -    crate://crates.io/rand_isaac/0.1.1 \
>> > -    crate://crates.io/rand_jitter/0.1.4 \
>> > -    crate://crates.io/rand_os/0.1.3 \
>> > -    crate://crates.io/rand_pcg/0.1.2 \
>> > -    crate://crates.io/rand_xorshift/0.1.1 \
>> > -    crate://crates.io/rdrand/0.4.0 \
>> > -    crate://crates.io/redox_syscall/0.1.56 \
>> > -    crate://crates.io/redox_users/0.3.0 \
>> > -    crate://crates.io/regex-syntax/0.6.10 \
>> > -    crate://crates.io/regex/1.2.0 \
>> > -    crate://crates.io/rustc-ap-arena/542.0.0 \
>> > -    crate://crates.io/rustc-ap-graphviz/542.0.0 \
>> > -    crate://crates.io/rustc-ap-rustc_data_structures/542.0.0 \
>> > -    crate://crates.io/rustc-ap-rustc_errors/542.0.0 \
>> > -    crate://crates.io/rustc-ap-rustc_lexer/542.0.0 \
>> > -    crate://crates.io/rustc-ap-rustc_macros/542.0.0 \
>> > -    crate://crates.io/rustc-ap-rustc_target/542.0.0 \
>> > -    crate://crates.io/rustc-ap-serialize/542.0.0 \
>> > -    crate://crates.io/rustc-ap-syntax/542.0.0 \
>> > -    crate://crates.io/rustc-ap-syntax_pos/542.0.0 \
>> > -    crate://crates.io/rustc-demangle/0.1.15 \
>> > -    crate://crates.io/rustc-hash/1.0.1 \
>> > -    crate://crates.io/rustc-rayon-core/0.2.0 \
>> > -    crate://crates.io/rustc-rayon/0.2.0 \
>> > -    crate://crates.io/rustc-workspace-hack/1.0.0 \
>> > -    crate://crates.io/rustc_version/0.2.3 \
>> > -    crate://crates.io/ryu/1.0.0 \
>> > -    crate://crates.io/same-file/1.0.5 \
>> > -    crate://crates.io/scoped-tls/1.0.0 \
>> > -    crate://crates.io/scoped_threadpool/0.1.9 \
>> > -    crate://crates.io/scopeguard/0.3.3 \
>> > -    crate://crates.io/semver-parser/0.7.0 \
>> > -    crate://crates.io/semver/0.9.0 \
>> > -    crate://crates.io/serde/1.0.97 \
>> > -    crate://crates.io/serde_derive/1.0.97 \
>> > -    crate://crates.io/serde_json/1.0.40 \
>> > -    crate://crates.io/smallvec/0.6.10 \
>> > -    crate://crates.io/spin/0.5.0 \
>> > -    crate://crates.io/stable_deref_trait/1.1.1 \
>> > -    crate://crates.io/strsim/0.8.0 \
>> > -    crate://crates.io/structopt-derive/0.2.18 \
>> > -    crate://crates.io/structopt/0.2.18 \
>> > -    crate://crates.io/syn/0.15.42 \
>> > -    crate://crates.io/synstructure/0.10.2 \
>> > -    crate://crates.io/term/0.6.0 \
>> > -    crate://crates.io/termcolor/1.0.5 \
>> > -    crate://crates.io/textwrap/0.11.0 \
>> > -    crate://crates.io/thread_local/0.3.6 \
>> > -    crate://crates.io/toml/0.5.1 \
>> > -    crate://crates.io/ucd-util/0.1.5 \
>> > -    crate://crates.io/unicode-segmentation/1.3.0 \
>> > -    crate://crates.io/unicode-width/0.1.5 \
>> > -    crate://crates.io/unicode-xid/0.1.0 \
>> > -    crate://crates.io/unicode_categories/0.1.1 \
>> > -    crate://crates.io/utf8-ranges/1.0.3 \
>> > -    crate://crates.io/vec_map/0.8.1 \
>> > -    crate://crates.io/walkdir/2.2.9 \
>> > -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
>> > -    crate://crates.io/winapi-util/0.1.2 \
>> > -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
>> > -    crate://crates.io/winapi/0.3.7 \
>> > -    crate://crates.io/wincolor/1.0.1 \
>> > -"
>> > -
>> > -
>> > -
>> > -# FIXME: update generateme with the real MD5 of the license file
>> > -LIC_FILES_CHKSUM =3D " \
>> > -    file://LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540542 \
>> > -    file://LICENSE-MIT;md5=3D0b29d505d9225d1f0815cbdcf602b901 \
>> > -"
>> > -
>> > -SUMMARY =3D "Tool to find and fix Rust formatting issues"
>> > -HOMEPAGE =3D "https://github.com/rust-lang/rustfmt"
>> > -LICENSE =3D "Apache-2.0 | MIT"
>> > -
>> > -# includes this file if it exists but does not fail
>> > -# this is useful for anything you may want to override from
>> > -# what cargo-bitbake generates.
>> > -include rustfmt-nightly-${PV}.inc
>> > -include rustfmt-nightly.inc
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#157121): https://lists.openembedded.org/g/openembe=
dded-core/message/157121
>> > Mute This Topic: https://lists.openembedded.org/mt/86442640/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

