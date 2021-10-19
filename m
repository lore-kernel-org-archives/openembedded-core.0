Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CA0C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 16:34:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.12539.1634661255254760584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nGtOtD8Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so294590pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=BWroW/VyHMOdP8yf5lBPYoeWnxCGgqceceQrkTMkFcE=;
        b=nGtOtD8QCGdu4k5H4KzjVzoqndgAelDuH2OdvSKPvDxWd8Xkx/IuSCBBc/2IW+ZMxN
         sMv/BUkrpOWIaujCiBjtJalIIGqUNq5V7laR1MpVfl7inpw2xt1p4v+frjxt9+/aikXH
         haso/NFi4azdrxzycQWPL5EdkABHhG+9lyUiWTuCvuSgZirClKUtBtPGhYpLqvv0G9/w
         HN+KvFrEJug5P1e4Fkay4/CpYv0BWYA9E5sx5MuE4maDKimZpxl7ICPMSC18gxfdaAZ3
         PSAQWMkxBtYdCQRGCql+pW6IDGx4EAIEs7tqrpTWWtmgEtODfV12sYlEm9wtWPq1NDVW
         q6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=BWroW/VyHMOdP8yf5lBPYoeWnxCGgqceceQrkTMkFcE=;
        b=EFW8lBXQrwy3FMgrDZdPNRcMUKOcF8vbqPDbqPRDvGlS48AZnl8OSfswGH26/Gnox3
         mJ36q8u22KSVyyQY1Kw9io/Rb1QxOBJcxJsqJqfOydTM4dkFQ/LVftBgeaEtfSOzbH9q
         xNc8/TW+5Pztd4EPiRtwg+0TPAI9B9yeZ4c1+cngIwpni2AyeNBYiOR+lBpOScmTXUM9
         GtKcdC5dReJS4Jq3U42afjb2svdhGAdVYy3dO6ehACWynPbKZfV23xgweiXQZxd9Fd/Z
         ucoi91LvdGPZX+Xl+scpI4lJsbOAtEi1QOTb1OFdjP1U6JVQZVK6XmwssudjnuHIkX2u
         mEqA==
X-Gm-Message-State: AOAM530FCRBaaYt1Zt3prV5s82cxJQk/rMHocEUZ/zgeucBsPNoz+9hM
	at7/WCo8HCbCzYjPBmVltWM=
X-Google-Smtp-Source: 
 ABdhPJybn7f994cUl93MW3D9eGcU4a1W6XW2NtdpdBPvWqOkhFRgqQrzGEiq3aoo2I7uumx+Kb17uA==
X-Received: by 2002:a17:90a:d98e:: with SMTP id
 d14mr891300pjv.77.1634661254596;
        Tue, 19 Oct 2021 09:34:14 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9fc:73ad:7653:581d?
 ([2601:646:9200:a0f0:f9fc:73ad:7653:581d])
        by smtp.gmail.com with ESMTPSA id
 k6sm18116894pfg.18.2021.10.19.09.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:34:14 -0700 (PDT)
Message-ID: <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
Date: Tue, 19 Oct 2021 09:34:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-2-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211019153419.3319802-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 16:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157186



On 10/19/21 8:33 AM, Alexander Kanavin wrote:
> The recipes does not have any consumers, is host-only,
> is rather out of date, and is still present in meta-rust.
> 
> Rust toolchain is now tested through other items, so I don't see
> a use case for it. For a target example there's rust-hello-world.
> 

its a tool. Think of strace, so there is value in keeping it in oe-core
so lets not drop it.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/conf/distro/include/maintainers.inc      |   1 -
>   meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 171 ------------------
>   2 files changed, 172 deletions(-)
>   delete mode 100644 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index baec2bef4d..d26d99a43d 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -662,7 +662,6 @@ RECIPE_MAINTAINER:pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
> -RECIPE_MAINTAINER:pn-rustfmt = "Randy MacLeod <Randy.MacLeod@windriver.com>"
>   RECIPE_MAINTAINER:pn-rust-cross-${TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
>   RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
>   RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
> diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> deleted file mode 100644
> index 2e4a47eb00..0000000000
> --- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> +++ /dev/null
> @@ -1,171 +0,0 @@
> -# Auto-Generated by cargo-bitbake 0.3.13
> -#
> -inherit cargo
> -
> -# If this is git based prefer versioned ones if they exist
> -# DEFAULT_PREFERENCE = "-1"
> -
> -# how to get rustfmt-nightly could be as easy as but default to a git checkout:
> -# SRC_URI += "crate://crates.io/rustfmt-nightly/1.4.2"
> -SRC_URI += "git://github.com/rust-lang/rustfmt.git;protocol=https;nobranch=1"
> -SRCREV = "aeb3496f31a0dfa90fc511520d2023634e885260"
> -S = "${WORKDIR}/git"
> -CARGO_SRC_DIR = ""
> -EXCLUDE_FROM_WORLD = "1"
> -
> -# please note if you have entries that do not begin with crate://
> -# you must change them to how that package can be fetched
> -SRC_URI += " \
> -    crate://crates.io/aho-corasick/0.7.4 \
> -    crate://crates.io/annotate-snippets/0.6.1 \
> -    crate://crates.io/ansi_term/0.11.0 \
> -    crate://crates.io/argon2rs/0.2.5 \
> -    crate://crates.io/arrayvec/0.4.11 \
> -    crate://crates.io/atty/0.2.13 \
> -    crate://crates.io/autocfg/0.1.5 \
> -    crate://crates.io/backtrace-sys/0.1.31 \
> -    crate://crates.io/backtrace/0.3.33 \
> -    crate://crates.io/bitflags/1.1.0 \
> -    crate://crates.io/blake2-rfc/0.2.18 \
> -    crate://crates.io/bstr/0.2.6 \
> -    crate://crates.io/bytecount/0.5.1 \
> -    crate://crates.io/byteorder/1.3.2 \
> -    crate://crates.io/c2-chacha/0.2.2 \
> -    crate://crates.io/cargo_metadata/0.8.1 \
> -    crate://crates.io/cc/1.0.38 \
> -    crate://crates.io/cfg-if/0.1.9 \
> -    crate://crates.io/clap/2.33.0 \
> -    crate://crates.io/cloudabi/0.0.3 \
> -    crate://crates.io/constant_time_eq/0.1.3 \
> -    crate://crates.io/crossbeam-channel/0.3.9 \
> -    crate://crates.io/crossbeam-deque/0.2.0 \
> -    crate://crates.io/crossbeam-epoch/0.3.1 \
> -    crate://crates.io/crossbeam-utils/0.2.2 \
> -    crate://crates.io/crossbeam-utils/0.6.6 \
> -    crate://crates.io/derive-new/0.5.7 \
> -    crate://crates.io/diff/0.1.11 \
> -    crate://crates.io/dirs-sys/0.3.3 \
> -    crate://crates.io/dirs/2.0.1 \
> -    crate://crates.io/either/1.5.2 \
> -    crate://crates.io/ena/0.13.0 \
> -    crate://crates.io/env_logger/0.6.2 \
> -    crate://crates.io/failure/0.1.5 \
> -    crate://crates.io/failure_derive/0.1.5 \
> -    crate://crates.io/fnv/1.0.6 \
> -    crate://crates.io/fuchsia-cprng/0.1.1 \
> -    crate://crates.io/getopts/0.2.19 \
> -    crate://crates.io/getrandom/0.1.6 \
> -    crate://crates.io/globset/0.4.4 \
> -    crate://crates.io/heck/0.3.1 \
> -    crate://crates.io/humantime/1.2.0 \
> -    crate://crates.io/ignore/0.4.8 \
> -    crate://crates.io/indexmap/1.0.2 \
> -    crate://crates.io/itertools/0.8.0 \
> -    crate://crates.io/itoa/0.4.4 \
> -    crate://crates.io/jobserver/0.1.16 \
> -    crate://crates.io/lazy_static/1.3.0 \
> -    crate://crates.io/libc/0.2.60 \
> -    crate://crates.io/lock_api/0.1.5 \
> -    crate://crates.io/log/0.4.7 \
> -    crate://crates.io/memchr/2.2.1 \
> -    crate://crates.io/memoffset/0.2.1 \
> -    crate://crates.io/nodrop/0.1.13 \
> -    crate://crates.io/num_cpus/1.10.1 \
> -    crate://crates.io/owning_ref/0.4.0 \
> -    crate://crates.io/packed_simd/0.3.3 \
> -    crate://crates.io/parking_lot/0.7.1 \
> -    crate://crates.io/parking_lot_core/0.4.0 \
> -    crate://crates.io/ppv-lite86/0.2.5 \
> -    crate://crates.io/proc-macro2/0.4.30 \
> -    crate://crates.io/quick-error/1.2.2 \
> -    crate://crates.io/quote/0.6.13 \
> -    crate://crates.io/rand/0.6.5 \
> -    crate://crates.io/rand/0.7.0 \
> -    crate://crates.io/rand_chacha/0.1.1 \
> -    crate://crates.io/rand_chacha/0.2.1 \
> -    crate://crates.io/rand_core/0.3.1 \
> -    crate://crates.io/rand_core/0.4.0 \
> -    crate://crates.io/rand_core/0.5.0 \
> -    crate://crates.io/rand_hc/0.1.0 \
> -    crate://crates.io/rand_hc/0.2.0 \
> -    crate://crates.io/rand_isaac/0.1.1 \
> -    crate://crates.io/rand_jitter/0.1.4 \
> -    crate://crates.io/rand_os/0.1.3 \
> -    crate://crates.io/rand_pcg/0.1.2 \
> -    crate://crates.io/rand_xorshift/0.1.1 \
> -    crate://crates.io/rdrand/0.4.0 \
> -    crate://crates.io/redox_syscall/0.1.56 \
> -    crate://crates.io/redox_users/0.3.0 \
> -    crate://crates.io/regex-syntax/0.6.10 \
> -    crate://crates.io/regex/1.2.0 \
> -    crate://crates.io/rustc-ap-arena/542.0.0 \
> -    crate://crates.io/rustc-ap-graphviz/542.0.0 \
> -    crate://crates.io/rustc-ap-rustc_data_structures/542.0.0 \
> -    crate://crates.io/rustc-ap-rustc_errors/542.0.0 \
> -    crate://crates.io/rustc-ap-rustc_lexer/542.0.0 \
> -    crate://crates.io/rustc-ap-rustc_macros/542.0.0 \
> -    crate://crates.io/rustc-ap-rustc_target/542.0.0 \
> -    crate://crates.io/rustc-ap-serialize/542.0.0 \
> -    crate://crates.io/rustc-ap-syntax/542.0.0 \
> -    crate://crates.io/rustc-ap-syntax_pos/542.0.0 \
> -    crate://crates.io/rustc-demangle/0.1.15 \
> -    crate://crates.io/rustc-hash/1.0.1 \
> -    crate://crates.io/rustc-rayon-core/0.2.0 \
> -    crate://crates.io/rustc-rayon/0.2.0 \
> -    crate://crates.io/rustc-workspace-hack/1.0.0 \
> -    crate://crates.io/rustc_version/0.2.3 \
> -    crate://crates.io/ryu/1.0.0 \
> -    crate://crates.io/same-file/1.0.5 \
> -    crate://crates.io/scoped-tls/1.0.0 \
> -    crate://crates.io/scoped_threadpool/0.1.9 \
> -    crate://crates.io/scopeguard/0.3.3 \
> -    crate://crates.io/semver-parser/0.7.0 \
> -    crate://crates.io/semver/0.9.0 \
> -    crate://crates.io/serde/1.0.97 \
> -    crate://crates.io/serde_derive/1.0.97 \
> -    crate://crates.io/serde_json/1.0.40 \
> -    crate://crates.io/smallvec/0.6.10 \
> -    crate://crates.io/spin/0.5.0 \
> -    crate://crates.io/stable_deref_trait/1.1.1 \
> -    crate://crates.io/strsim/0.8.0 \
> -    crate://crates.io/structopt-derive/0.2.18 \
> -    crate://crates.io/structopt/0.2.18 \
> -    crate://crates.io/syn/0.15.42 \
> -    crate://crates.io/synstructure/0.10.2 \
> -    crate://crates.io/term/0.6.0 \
> -    crate://crates.io/termcolor/1.0.5 \
> -    crate://crates.io/textwrap/0.11.0 \
> -    crate://crates.io/thread_local/0.3.6 \
> -    crate://crates.io/toml/0.5.1 \
> -    crate://crates.io/ucd-util/0.1.5 \
> -    crate://crates.io/unicode-segmentation/1.3.0 \
> -    crate://crates.io/unicode-width/0.1.5 \
> -    crate://crates.io/unicode-xid/0.1.0 \
> -    crate://crates.io/unicode_categories/0.1.1 \
> -    crate://crates.io/utf8-ranges/1.0.3 \
> -    crate://crates.io/vec_map/0.8.1 \
> -    crate://crates.io/walkdir/2.2.9 \
> -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> -    crate://crates.io/winapi-util/0.1.2 \
> -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> -    crate://crates.io/winapi/0.3.7 \
> -    crate://crates.io/wincolor/1.0.1 \
> -"
> -
> -
> -
> -# FIXME: update generateme with the real MD5 of the license file
> -LIC_FILES_CHKSUM = " \
> -    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
> -    file://LICENSE-MIT;md5=0b29d505d9225d1f0815cbdcf602b901 \
> -"
> -
> -SUMMARY = "Tool to find and fix Rust formatting issues"
> -HOMEPAGE = "https://github.com/rust-lang/rustfmt"
> -LICENSE = "Apache-2.0 | MIT"
> -
> -# includes this file if it exists but does not fail
> -# this is useful for anything you may want to override from
> -# what cargo-bitbake generates.
> -include rustfmt-nightly-${PV}.inc
> -include rustfmt-nightly.inc
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157121): https://lists.openembedded.org/g/openembedded-core/message/157121
> Mute This Topic: https://lists.openembedded.org/mt/86442640/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

