Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0514C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:23:15 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.33258.1654528987384104255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d1Aey5z9;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id v9so16120323lja.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUGnLu6aja1zwW8tgI2lUbBxKHYXPw2Wcudn/v0bWHk=;
        b=d1Aey5z9t8H469bQO7oEBzyy9XTK2CITQDMPU+advEC6PYZLcyFCbMNSyKJOVAUtW7
         RR8BeDvBNxeZ7VrlG2c/fmg1icPY5iZEOCFwUCHF2S8llNPzzx3vXors4Cn85MYDu62z
         5pHLB3mteRP3nag1JIF2CQuxme6f4vkFHm+Ra9zdGGx+lEwG67+J3TFC6L1YOMPtfUFs
         iDmNXs0oWZKXEBF3Aa7OVJsw2/xaBXHyBx/jLDq8Xkn57OrGsz8p3v/FbyyYAzdBbVQV
         BCtRq6mSrxeANhi9vVY+ccll5zynRBSaBDe/pZI2C5cttD/yBEJQBMaFcGweOcpXrqs/
         hJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUGnLu6aja1zwW8tgI2lUbBxKHYXPw2Wcudn/v0bWHk=;
        b=MyS9scQMGpa/X2uChFcgPMdLN5/205MQcXLQjUqKUDFjNMz5etvAIDQSudWqlRJZc9
         qZ5ommp+1JyACi3VXx/iG5425btB8+32fg6nd9sv3deDzYCYb0EmcVDjB9su9qhTCMik
         MiYwaBK32wlEc2d0U2oGewBdn1iIQAtN0vtOin89vi4OhP5WKUHL2Oysqaofq4gvNROE
         DDG6NkqbJcB62YAGsQ7xP+t//QkDNgkBY1Wd7XNocefpQGXChPat83HaByKn6S3dgbx7
         2TV+I3WqbFjCeyazcF5AfqoNa3KzRtd6eSd1lSnnR2wdbrU5L1d8vXagotH0yGRTnSm1
         KXxg==
X-Gm-Message-State: AOAM531+uht4obb/8lTG3yluDIb9hcZsIe0x6ObD6DMbouxss5Zd8Nbu
	pl0Z+DdKrOx/oWS5CT5T7jDDf6wrNoU1fdxGzyZSJVzH00U=
X-Google-Smtp-Source: 
 ABdhPJwQBUHjVlfc7u8x29SHm0nt7RbHceiyasupksQs/8eJPHxtE558GMwUiBtZkMDc3BPaUA3yjZ8ldSLt7ObITp8=
X-Received: by 2002:a2e:824b:0:b0:24d:c247:c928 with SMTP id
 j11-20020a2e824b000000b0024dc247c928mr51892534ljh.68.1654528985632; Mon, 06
 Jun 2022 08:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220606132653.60232-1-brgl@bgdev.pl>
 <20220606132653.60232-5-brgl@bgdev.pl>
In-Reply-To: <20220606132653.60232-5-brgl@bgdev.pl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jun 2022 17:22:54 +0200
Message-ID: 
 <CANNYZj9g-POf_jFigmeb5E6PosUPhSi5omiBoS-D9_aF4VFM5Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/4] gstreamer1.0-plugins-rs: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 15:23:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166648

Thanks; is this something that oe-core needs to provide? As it's not
in version lockstep with the rest of gstreamer, it seems more like a
collection of experimental plugins and is maybe a better fit for
meta-oe for now?

Alex

On Mon, 6 Jun 2022 at 15:27, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This adds a recipe for gstreamer plugins written in Rust.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../gstreamer1.0-plugins-rs_0.8.4.bb          | 465 ++++++++++++++++++
>  1 file changed, 465 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.8.4.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.8.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.8.4.bb
> new file mode 100644
> index 0000000000..0b299e0257
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.8.4.bb
> @@ -0,0 +1,465 @@
> +SUMMARY = "Various GStreamer plugins and elements written in the Rust programming language."
> +LICENSE = "Apache-2.0 & MIT & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
> +    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
> +    file://LICENSE-LGPLv2;md5=4fbd65380cdd255951079008b364516c \
> +"
> +
> +SRC_URI = " \
> +    git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git;protocol=https;branch=0.8;name=default \
> +    gitsm://gitlab.freedesktop.org/gstreamer/gstreamer-rs.git;protocol=https;branch=0.18;name=gstreamer-rs;destsuffix=cargo_home/git/db/gstreamer-rs-79e52a2d27eb91a3 \
> +    git://github.com/gtk-rs/gtk-rs-core.git;protocol=https;branch=0.15;name=gtk-rs-core;destsuffix=cargo_home/git/db/gtk-rs-core-7be42ca38bd6361c \
> +    git://github.com/gtk-rs/gtk3-rs;protocol=https;branch=0.15;name=gtk3-rs;destsuffix=cargo_home/git/db/gtk3-rs-a818089b55180ee1 \
> +    git://github.com/rust-av/ffv1.git;protocol=https;branch=master;name=ffv1;destsuffix=cargo_home/git/db/ffv1-08f2e3b26709fb34 \
> +    git://github.com/rust-av/flavors;protocol=https;branch=master;name=flavors;destsuffix=cargo_home/git/db/flavors-0f978a4d88ad8592 \
> +    git://github.com/gtk-rs/gtk4-rs;protocol=https;branch=0.4;name=gtk4-rs;destsuffix=cargo_home/git/db/gtk4-rs-e74ad56283dfeb5e \
> +    crate://crates.io/adler/1.0.2 \
> +    crate://crates.io/adler32/1.2.0 \
> +    crate://crates.io/aes/0.6.0 \
> +    crate://crates.io/aes-ctr/0.6.0 \
> +    crate://crates.io/aes-soft/0.6.4 \
> +    crate://crates.io/aesni/0.10.0 \
> +    crate://crates.io/aho-corasick/0.7.18 \
> +    crate://crates.io/ansi_term/0.12.1 \
> +    crate://crates.io/anyhow/1.0.57 \
> +    crate://crates.io/arbitrary/0.4.7 \
> +    crate://crates.io/arg_enum_proc_macro/0.3.2 \
> +    crate://crates.io/array-init/2.0.0 \
> +    crate://crates.io/arrayvec/0.7.2 \
> +    crate://crates.io/async-compression/0.3.12 \
> +    crate://crates.io/async-task/4.2.0 \
> +    crate://crates.io/async-trait/0.1.53 \
> +    crate://crates.io/async-tungstenite/0.17.2 \
> +    crate://crates.io/atomic_refcell/0.1.8 \
> +    crate://crates.io/atty/0.2.14 \
> +    crate://crates.io/autocfg/1.1.0 \
> +    crate://crates.io/backoff/0.4.0 \
> +    crate://crates.io/base-x/0.2.10 \
> +    crate://crates.io/base32/0.4.0 \
> +    crate://crates.io/base64/0.13.0 \
> +    crate://crates.io/bincode/1.3.3 \
> +    crate://crates.io/bindgen/0.59.2 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitstream-io/1.3.0 \
> +    crate://crates.io/block-buffer/0.9.0 \
> +    crate://crates.io/block-buffer/0.10.2 \
> +    crate://crates.io/build_const/0.2.2 \
> +    crate://crates.io/bumpalo/3.9.1 \
> +    crate://crates.io/byte-slice-cast/1.2.1 \
> +    crate://crates.io/bytemuck/1.9.1 \
> +    crate://crates.io/byteorder/1.4.3 \
> +    crate://crates.io/bytes/1.1.0 \
> +    crate://crates.io/cache-padded/1.2.0 \
> +    crate://crates.io/cc/1.0.73 \
> +    crate://crates.io/cdg/0.1.0 \
> +    crate://crates.io/cdg_renderer/0.7.0 \
> +    crate://crates.io/cexpr/0.6.0 \
> +    crate://crates.io/cfg-expr/0.7.4 \
> +    crate://crates.io/cfg-expr/0.10.2 \
> +    crate://crates.io/cfg-if/0.1.10 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/chrono/0.4.19 \
> +    crate://crates.io/cipher/0.2.5 \
> +    crate://crates.io/clang-sys/1.3.1 \
> +    crate://crates.io/clap/2.34.0 \
> +    crate://crates.io/clap/3.1.12 \
> +    crate://crates.io/clap_derive/3.1.7 \
> +    crate://crates.io/clap_lex/0.1.1 \
> +    crate://crates.io/claxon/0.4.3 \
> +    crate://crates.io/color_quant/1.1.0 \
> +    crate://crates.io/concurrent-queue/1.2.2 \
> +    crate://crates.io/const_fn/0.4.9 \
> +    crate://crates.io/cookie/0.15.1 \
> +    crate://crates.io/cookie_store/0.15.1 \
> +    crate://crates.io/core-foundation/0.9.3 \
> +    crate://crates.io/core-foundation-sys/0.8.3 \
> +    crate://crates.io/cpufeatures/0.2.2 \
> +    crate://crates.io/crc/1.8.1 \
> +    crate://crates.io/crc/3.0.0 \
> +    crate://crates.io/crc-catalog/2.1.0 \
> +    crate://crates.io/crc32fast/1.3.2 \
> +    crate://crates.io/crossbeam-channel/0.5.4 \
> +    crate://crates.io/crossbeam-deque/0.8.1 \
> +    crate://crates.io/crossbeam-epoch/0.9.8 \
> +    crate://crates.io/crossbeam-utils/0.8.8 \
> +    crate://crates.io/crypto-common/0.1.3 \
> +    crate://crates.io/crypto-mac/0.11.1 \
> +    crate://crates.io/csound/0.1.8 \
> +    crate://crates.io/csound-sys/0.1.2 \
> +    crate://crates.io/ctor/0.1.22 \
> +    crate://crates.io/ctr/0.6.0 \
> +    crate://crates.io/dasp_frame/0.11.0 \
> +    crate://crates.io/dasp_sample/0.11.0 \
> +    crate://crates.io/dav1d/0.7.0 \
> +    crate://crates.io/dav1d-sys/0.4.0 \
> +    crate://crates.io/deflate/1.0.0 \
> +    crate://crates.io/diff/0.1.12 \
> +    crate://crates.io/digest/0.9.0 \
> +    crate://crates.io/digest/0.10.3 \
> +    crate://crates.io/dirs-next/2.0.0 \
> +    crate://crates.io/dirs-sys-next/0.1.2 \
> +    crate://crates.io/discard/1.0.4 \
> +    crate://crates.io/ebur128/0.1.6 \
> +    crate://crates.io/ed25519/1.4.1 \
> +    crate://crates.io/either/1.6.1 \
> +    crate://crates.io/encoding_rs/0.8.31 \
> +    crate://crates.io/env_logger/0.8.4 \
> +    crate://crates.io/env_logger/0.9.0 \
> +    crate://crates.io/fastrand/1.7.0 \
> +    crate://crates.io/field-offset/0.3.4 \
> +    crate://crates.io/flate2/1.0.23 \
> +    crate://crates.io/fnv/1.0.7 \
> +    crate://crates.io/foreign-types/0.3.2 \
> +    crate://crates.io/foreign-types-shared/0.1.1 \
> +    crate://crates.io/form_urlencoded/1.0.1 \
> +    crate://crates.io/fragile/1.2.0 \
> +    crate://crates.io/fst/0.4.7 \
> +    crate://crates.io/futures/0.3.21 \
> +    crate://crates.io/futures-channel/0.3.21 \
> +    crate://crates.io/futures-core/0.3.21 \
> +    crate://crates.io/futures-executor/0.3.21 \
> +    crate://crates.io/futures-io/0.3.21 \
> +    crate://crates.io/futures-macro/0.3.21 \
> +    crate://crates.io/futures-sink/0.3.21 \
> +    crate://crates.io/futures-task/0.3.21 \
> +    crate://crates.io/futures-util/0.3.21 \
> +    crate://crates.io/generic-array/0.14.5 \
> +    crate://crates.io/getopts/0.2.21 \
> +    crate://crates.io/getrandom/0.2.6 \
> +    crate://crates.io/gif/0.11.3 \
> +    crate://crates.io/glob/0.3.0 \
> +    crate://crates.io/h2/0.3.13 \
> +    crate://crates.io/hashbrown/0.11.2 \
> +    crate://crates.io/headers/0.3.7 \
> +    crate://crates.io/headers-core/0.2.0 \
> +    crate://crates.io/heck/0.3.3 \
> +    crate://crates.io/heck/0.4.0 \
> +    crate://crates.io/hermit-abi/0.1.19 \
> +    crate://crates.io/hex/0.4.3 \
> +    crate://crates.io/hmac/0.11.0 \
> +    crate://crates.io/hostname/0.3.1 \
> +    crate://crates.io/hrtf/0.8.0 \
> +    crate://crates.io/http/0.2.6 \
> +    crate://crates.io/http-body/0.4.4 \
> +    crate://crates.io/httparse/1.7.0 \
> +    crate://crates.io/httpdate/1.0.2 \
> +    crate://crates.io/humantime/2.1.0 \
> +    crate://crates.io/hyper/0.14.18 \
> +    crate://crates.io/hyper-proxy/0.9.1 \
> +    crate://crates.io/hyper-tls/0.5.0 \
> +    crate://crates.io/hyphenation/0.8.4 \
> +    crate://crates.io/hyphenation_commons/0.8.4 \
> +    crate://crates.io/idna/0.2.3 \
> +    crate://crates.io/if-addrs/0.6.7 \
> +    crate://crates.io/if-addrs-sys/0.3.2 \
> +    crate://crates.io/image/0.24.1 \
> +    crate://crates.io/indexmap/1.8.1 \
> +    crate://crates.io/instant/0.1.12 \
> +    crate://crates.io/interpolate_name/0.2.3 \
> +    crate://crates.io/ipnet/2.5.0 \
> +    crate://crates.io/itertools/0.10.3 \
> +    crate://crates.io/itoa/1.0.1 \
> +    crate://crates.io/jobserver/0.1.24 \
> +    crate://crates.io/js-sys/0.3.57 \
> +    crate://crates.io/lazy_static/1.4.0 \
> +    crate://crates.io/lazycell/1.3.0 \
> +    crate://crates.io/lewton/0.10.2 \
> +    crate://crates.io/libc/0.2.124 \
> +    crate://crates.io/libfuzzer-sys/0.3.5 \
> +    crate://crates.io/libloading/0.7.3 \
> +    crate://crates.io/libm/0.2.2 \
> +    crate://crates.io/libmdns/0.6.2 \
> +    crate://crates.io/librespot/0.3.1 \
> +    crate://crates.io/librespot-audio/0.3.1 \
> +    crate://crates.io/librespot-connect/0.3.1 \
> +    crate://crates.io/librespot-core/0.3.1 \
> +    crate://crates.io/librespot-discovery/0.3.1 \
> +    crate://crates.io/librespot-metadata/0.3.1 \
> +    crate://crates.io/librespot-playback/0.3.1 \
> +    crate://crates.io/librespot-protocol/0.3.1 \
> +    crate://crates.io/libsodium-sys/0.2.7 \
> +    crate://crates.io/libwebp-sys2/0.1.2 \
> +    crate://crates.io/lock_api/0.4.7 \
> +    crate://crates.io/log/0.4.16 \
> +    crate://crates.io/m3u8-rs/4.0.0 \
> +    crate://crates.io/match_cfg/0.1.0 \
> +    crate://crates.io/matches/0.1.9 \
> +    crate://crates.io/md-5/0.9.1 \
> +    crate://crates.io/memchr/2.4.1 \
> +    crate://crates.io/memoffset/0.6.5 \
> +    crate://crates.io/mime/0.3.16 \
> +    crate://crates.io/minimal-lexical/0.2.1 \
> +    crate://crates.io/miniz_oxide/0.5.1 \
> +    crate://crates.io/mio/0.8.2 \
> +    crate://crates.io/miow/0.3.7 \
> +    crate://crates.io/more-asserts/0.2.2 \
> +    crate://crates.io/muldiv/1.0.0 \
> +    crate://crates.io/multimap/0.8.3 \
> +    crate://crates.io/nasm-rs/0.2.4 \
> +    crate://crates.io/native-tls/0.2.10 \
> +    crate://crates.io/nnnoiseless/0.4.0 \
> +    crate://crates.io/nom/7.1.1 \
> +    crate://crates.io/noop_proc_macro/0.3.0 \
> +    crate://crates.io/ntapi/0.3.7 \
> +    crate://crates.io/num-bigint/0.4.3 \
> +    crate://crates.io/num-complex/0.4.0 \
> +    crate://crates.io/num-derive/0.3.3 \
> +    crate://crates.io/num-integer/0.1.44 \
> +    crate://crates.io/num-iter/0.1.42 \
> +    crate://crates.io/num-rational/0.4.0 \
> +    crate://crates.io/num-traits/0.2.14 \
> +    crate://crates.io/num_cpus/1.13.1 \
> +    crate://crates.io/ogg/0.8.0 \
> +    crate://crates.io/once_cell/1.10.0 \
> +    crate://crates.io/opaque-debug/0.3.0 \
> +    crate://crates.io/openssl/0.10.38 \
> +    crate://crates.io/openssl-probe/0.1.5 \
> +    crate://crates.io/openssl-sys/0.9.72 \
> +    crate://crates.io/option-operations/0.4.0 \
> +    crate://crates.io/os_str_bytes/6.0.0 \
> +    crate://crates.io/output_vt100/0.1.3 \
> +    crate://crates.io/parking_lot/0.12.0 \
> +    crate://crates.io/parking_lot_core/0.9.2 \
> +    crate://crates.io/paste/1.0.7 \
> +    crate://crates.io/pbkdf2/0.8.0 \
> +    crate://crates.io/peeking_take_while/0.1.2 \
> +    crate://crates.io/percent-encoding/2.1.0 \
> +    crate://crates.io/pest/2.1.3 \
> +    crate://crates.io/pin-project-lite/0.2.8 \
> +    crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/pkg-config/0.3.25 \
> +    crate://crates.io/png/0.17.5 \
> +    crate://crates.io/pocket-resources/0.3.2 \
> +    crate://crates.io/polling/2.2.0 \
> +    crate://crates.io/ppv-lite86/0.2.16 \
> +    crate://crates.io/pretty-hex/0.3.0 \
> +    crate://crates.io/pretty_assertions/1.2.1 \
> +    crate://crates.io/primal-check/0.3.1 \
> +    crate://crates.io/priority-queue/1.2.1 \
> +    crate://crates.io/proc-macro-crate/1.1.3 \
> +    crate://crates.io/proc-macro-error/1.0.4 \
> +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> +    crate://crates.io/proc-macro-hack/0.5.19 \
> +    crate://crates.io/proc-macro2/1.0.37 \
> +    crate://crates.io/protobuf/2.27.1 \
> +    crate://crates.io/protobuf-codegen/2.27.1 \
> +    crate://crates.io/protobuf-codegen-pure/2.27.1 \
> +    crate://crates.io/psl-types/2.0.10 \
> +    crate://crates.io/publicsuffix/2.1.1 \
> +    crate://crates.io/quick-xml/0.22.0 \
> +    crate://crates.io/quote/1.0.18 \
> +    crate://crates.io/rand/0.8.5 \
> +    crate://crates.io/rand_chacha/0.3.1 \
> +    crate://crates.io/rand_core/0.6.3 \
> +    crate://crates.io/rand_distr/0.4.3 \
> +    crate://crates.io/rav1e/0.5.1 \
> +    crate://crates.io/rayon/1.5.2 \
> +    crate://crates.io/rayon-core/1.9.2 \
> +    crate://crates.io/realfft/2.0.1 \
> +    crate://crates.io/redox_syscall/0.2.13 \
> +    crate://crates.io/redox_users/0.4.3 \
> +    crate://crates.io/regex/1.5.5 \
> +    crate://crates.io/regex-syntax/0.6.25 \
> +    crate://crates.io/remove_dir_all/0.5.3 \
> +    crate://crates.io/reqwest/0.11.10 \
> +    crate://crates.io/rpassword/5.0.1 \
> +    crate://crates.io/rubato/0.10.1 \
> +    crate://crates.io/rusoto_core/0.48.0 \
> +    crate://crates.io/rusoto_credential/0.48.0 \
> +    crate://crates.io/rusoto_s3/0.48.0 \
> +    crate://crates.io/rusoto_signature/0.48.0 \
> +    crate://crates.io/rust_hawktracer/0.7.0 \
> +    crate://crates.io/rust_hawktracer_normal_macro/0.4.1 \
> +    crate://crates.io/rust_hawktracer_proc_macro/0.4.1 \
> +    crate://crates.io/rustc-hash/1.1.0 \
> +    crate://crates.io/rustc_version/0.2.3 \
> +    crate://crates.io/rustc_version/0.3.3 \
> +    crate://crates.io/rustc_version/0.4.0 \
> +    crate://crates.io/rustfft/6.0.1 \
> +    crate://crates.io/ryu/1.0.9 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/schannel/0.1.19 \
> +    crate://crates.io/scopeguard/1.1.0 \
> +    crate://crates.io/security-framework/2.6.1 \
> +    crate://crates.io/security-framework-sys/2.6.1 \
> +    crate://crates.io/semver/0.9.0 \
> +    crate://crates.io/semver/0.11.0 \
> +    crate://crates.io/semver/1.0.7 \
> +    crate://crates.io/semver-parser/0.7.0 \
> +    crate://crates.io/semver-parser/0.10.2 \
> +    crate://crates.io/serde/1.0.136 \
> +    crate://crates.io/serde_bytes/0.11.5 \
> +    crate://crates.io/serde_derive/1.0.136 \
> +    crate://crates.io/serde_json/1.0.79 \
> +    crate://crates.io/serde_urlencoded/0.7.1 \
> +    crate://crates.io/sha-1/0.9.8 \
> +    crate://crates.io/sha-1/0.10.0 \
> +    crate://crates.io/sha1/0.6.1 \
> +    crate://crates.io/sha1_smol/1.0.0 \
> +    crate://crates.io/sha2/0.9.9 \
> +    crate://crates.io/shannon/0.2.0 \
> +    crate://crates.io/shell-words/1.1.0 \
> +    crate://crates.io/shlex/1.1.0 \
> +    crate://crates.io/signal-hook-registry/1.4.0 \
> +    crate://crates.io/signature/1.5.0 \
> +    crate://crates.io/simd_helpers/0.1.0 \
> +    crate://crates.io/slab/0.4.6 \
> +    crate://crates.io/smallvec/1.8.0 \
> +    crate://crates.io/smawk/0.3.1 \
> +    crate://crates.io/socket2/0.4.4 \
> +    crate://crates.io/sodiumoxide/0.2.7 \
> +    crate://crates.io/standback/0.2.17 \
> +    crate://crates.io/stdweb/0.4.20 \
> +    crate://crates.io/stdweb-derive/0.5.3 \
> +    crate://crates.io/stdweb-internal-macros/0.2.9 \
> +    crate://crates.io/stdweb-internal-runtime/0.1.5 \
> +    crate://crates.io/strength_reduce/0.2.3 \
> +    crate://crates.io/strsim/0.8.0 \
> +    crate://crates.io/strsim/0.10.0 \
> +    crate://crates.io/structopt/0.3.26 \
> +    crate://crates.io/structopt-derive/0.4.18 \
> +    crate://crates.io/strum/0.21.0 \
> +    crate://crates.io/strum_macros/0.21.1 \
> +    crate://crates.io/subtle/2.4.1 \
> +    crate://crates.io/syn/1.0.91 \
> +    crate://crates.io/synstructure/0.12.6 \
> +    crate://crates.io/system-deps/3.1.2 \
> +    crate://crates.io/system-deps/6.0.2 \
> +    crate://crates.io/tempfile/3.3.0 \
> +    crate://crates.io/termcolor/1.1.3 \
> +    crate://crates.io/textwrap/0.11.0 \
> +    crate://crates.io/textwrap/0.15.0 \
> +    crate://crates.io/thiserror/1.0.30 \
> +    crate://crates.io/thiserror-impl/1.0.30 \
> +    crate://crates.io/time/0.1.43 \
> +    crate://crates.io/time/0.2.27 \
> +    crate://crates.io/time-macros/0.1.1 \
> +    crate://crates.io/time-macros-impl/0.1.2 \
> +    crate://crates.io/tinyvec/1.6.0 \
> +    crate://crates.io/tinyvec_macros/0.1.0 \
> +    crate://crates.io/tokio/1.17.0 \
> +    crate://crates.io/tokio-macros/1.7.0 \
> +    crate://crates.io/tokio-native-tls/0.3.0 \
> +    crate://crates.io/tokio-stream/0.1.8 \
> +    crate://crates.io/tokio-util/0.6.9 \
> +    crate://crates.io/tokio-util/0.7.1 \
> +    crate://crates.io/toml/0.5.9 \
> +    crate://crates.io/tower-service/0.3.1 \
> +    crate://crates.io/tracing/0.1.34 \
> +    crate://crates.io/tracing-attributes/0.1.20 \
> +    crate://crates.io/tracing-core/0.1.26 \
> +    crate://crates.io/transpose/0.2.1 \
> +    crate://crates.io/try-lock/0.2.3 \
> +    crate://crates.io/tungstenite/0.17.2 \
> +    crate://crates.io/typenum/1.15.0 \
> +    crate://crates.io/ucd-trie/0.1.3 \
> +    crate://crates.io/unicode-bidi/0.3.7 \
> +    crate://crates.io/unicode-linebreak/0.1.2 \
> +    crate://crates.io/unicode-normalization/0.1.19 \
> +    crate://crates.io/unicode-segmentation/1.9.0 \
> +    crate://crates.io/unicode-width/0.1.9 \
> +    crate://crates.io/unicode-xid/0.2.2 \
> +    crate://crates.io/url/2.2.2 \
> +    crate://crates.io/utf-8/0.7.6 \
> +    crate://crates.io/uuid/0.8.2 \
> +    crate://crates.io/uuid/1.0.0 \
> +    crate://crates.io/v_frame/0.2.5 \
> +    crate://crates.io/va_list/0.1.4 \
> +    crate://crates.io/vcpkg/0.2.15 \
> +    crate://crates.io/vec_map/0.8.2 \
> +    crate://crates.io/vergen/3.2.0 \
> +    crate://crates.io/version-compare/0.0.11 \
> +    crate://crates.io/version-compare/0.1.0 \
> +    crate://crates.io/version_check/0.9.4 \
> +    crate://crates.io/waker-fn/1.1.0 \
> +    crate://crates.io/walkdir/2.3.2 \
> +    crate://crates.io/want/0.3.0 \
> +    crate://crates.io/wasi/0.10.2+wasi-snapshot-preview1 \
> +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wasm-bindgen/0.2.80 \
> +    crate://crates.io/wasm-bindgen-backend/0.2.80 \
> +    crate://crates.io/wasm-bindgen-futures/0.4.30 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.80 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.80 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.80 \
> +    crate://crates.io/web-sys/0.3.57 \
> +    crate://crates.io/weezl/0.1.6 \
> +    crate://crates.io/wepoll-ffi/0.1.2 \
> +    crate://crates.io/which/4.2.5 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.5 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows-sys/0.34.0 \
> +    crate://crates.io/windows_aarch64_msvc/0.34.0 \
> +    crate://crates.io/windows_i686_gnu/0.34.0 \
> +    crate://crates.io/windows_i686_msvc/0.34.0 \
> +    crate://crates.io/windows_x86_64_gnu/0.34.0 \
> +    crate://crates.io/windows_x86_64_msvc/0.34.0 \
> +    crate://crates.io/winreg/0.10.1 \
> +    crate://crates.io/xml-rs/0.8.4 \
> +    crate://crates.io/zerocopy/0.3.0 \
> +    crate://crates.io/zerocopy-derive/0.2.0 \
> +    crate://crates.io/zeroize/1.5.4 \
> +"
> +
> +SRCREV_FORMAT = "default_gstreamer-rs_gtk-rs-core_gtk3-rs_ffv1_flavors_gtk4-rs"
> +
> +SRCREV_default = "18c9bd0355e0fc1ab20072d805807112945ad5bb"
> +SRCREV_gstreamer-rs = "9ee22baa07d2c4e67742baeafb2be49e1db9befe"
> +SRCREV_gtk-rs-core = "59eea5774c06bfd323e9298240f615ad2f7ced9e"
> +SRCREV_gtk3-rs = "51df5c22fbe02ec57c5052a3e5a91cc9671a0e83"
> +SRCREV_ffv1 = "2afb025a327173ce891954c052e804d0f880368a"
> +SRCREV_flavors = "c48542aef94b7da36d6f306f4016bee9c79e09ba"
> +SRCREV_gtk4-rs = "36aa4108f8e221536e194f62d8ee3be8ea6191f0"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG[file] = "-p gst-plugin-file"
> +PACKAGECONFIG[fmp4] = "-p gst-plugin-fmp4"
> +PACKAGECONFIG[sodium] = "-p gst-plugin-sodium"
> +PACKAGECONFIG[threadshare] = "-p gst-plugin-threadshare"
> +PACKAGECONFIG[hlssink3] = "-p gst-plugin-hlssink3"
> +PACKAGECONFIG[reqwest] = "-p gst-plugin-reqwest"
> +PACKAGECONFIG[rusoto] = "-p gst-plugin-rusoto"
> +PACKAGECONFIG[audiofx] = "-p gst-plugin-audiofx"
> +PACKAGECONFIG[claxon] = "-p gst-plugin-claxon"
> +PACKAGECONFIG[lewton] = "-p gst-plugin-lewton"
> +PACKAGECONFIG[spotify] = "-p gst-plugin-spotify"
> +PACKAGECONFIG[cdg] = "-p gst-plugin-cdg"
> +PACKAGECONFIG[closedcaption] = "-p gst-plugin-closedcaption"
> +PACKAGECONFIG[ffv1] = "-p gst-plugin-ffv1"
> +PACKAGECONFIG[flavors] = "-p gst-plugin-flavors"
> +PACKAGECONFIG[gif] = "-p gst-plugin-gif"
> +PACKAGECONFIG[hsv] = "-p gst-plugin-hsv"
> +PACKAGECONFIG[png] = "-p gst-plugin-rspng"
> +PACKAGECONFIG[rav1e] = "-p gst-plugin-rav1e"
> +PACKAGECONFIG[videofx] = "-p gst-plugin-videofx"
> +PACKAGECONFIG[webp] = "-p gst-plugin-webp"
> +PACKAGECONFIG[ahead] = "-p gst-plugin-textahead"
> +PACKAGECONFIG[json] = "-p gst-plugin-json"
> +PACKAGECONFIG[regex] = "-p gst-plugin-regex"
> +PACKAGECONFIG[wrap] = "-p gst-plugin-textwrap"
> +PACKAGECONFIG[fallbackswitch] = "-p gst-plugin-fallbackswitch"
> +PACKAGECONFIG[togglerecord] = "-p gst-plugin-togglerecord"
> +
> +PACKAGECONFIG ??= " \
> +    file fmp4 sodium threadshare hlssink3 reqwest rusoto audiofx claxon \
> +    lewton spotify cdg closedcaption ffv1 flavors gif hsv png rav1e \
> +    videofx webp ahead json regex wrap fallbackswitch togglerecord \
> +"
> +
> +inherit cargo pkgconfig
> +
> +DEPENDS = " \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-good \
> +"
> +
> +do_install:append() {
> +    mkdir -p ${D}${libdir}/gstreamer-1.0
> +    mv ${D}${libdir}/rust/*.so ${D}${libdir}/gstreamer-1.0/
> +}
> +
> +FILES:${PN} += "${libdir}/gstreamer-1.0/*"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166631): https://lists.openembedded.org/g/openembedded-core/message/166631
> Mute This Topic: https://lists.openembedded.org/mt/91576745/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

