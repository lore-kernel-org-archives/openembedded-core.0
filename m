Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ABEC2FC04
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 05:08:57 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.180452.1692248935724326535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 22:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PmINdvy9;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4ff9bbc83a5so370954e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692248934; x=1692853734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BmSNtI6kWrE+gk/d4yVLzCOpuYjJHpLvQE45u9EysJ0=;
        b=PmINdvy9KHxZD0L82txtuzSJ4Qz3Xig0jayktYcGTPpjwspEghKPkLqpUklvvizG2T
         PsVOGQQNie7R//wob4D8luGQujk6215zk9kFoEl2U1Sqo4V4UaY8uMAysZ4GVPIoE+iN
         ig1txC+eYEYz3EZ4tBtt7vhyofq0xxRC5+Xo5gc5NruQmUoEfLeqoqfKZbmvCAQOwSqM
         VqQCY62qczUrxm2SI8Vzr4BVv0GatYHx3b3e/ODDQh/y/b91AynDiFhP5Vo3Cm7573IL
         XvSqcOqwu/nVbNZN697jbhCyQraHmoeacEuXpPWzdZwTvafI1MNxdPLnAfL066ahB/lp
         zi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692248934; x=1692853734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmSNtI6kWrE+gk/d4yVLzCOpuYjJHpLvQE45u9EysJ0=;
        b=dINrfebuQaucplJlGn2DMhyVsgTAroEXsqYIqdFc8VsSepyJwGRA0x1SQyAiiqL4MO
         UEx2HvPwjrn6f3S322By9SglhG69WULch6P3ZU7bc5AQbJHz/EOA0LafHNk1ti4nwyjC
         sEnoQI9bk29492pFPVGgVsBEHnZ2mHrOGN3LvcQxWbnF9IAkvMcea+m8IDXL0+drmcpo
         QmMUFLsfQeRNZr33yxKd+stkx7uRhAZOBRIbR9KXti3i6XPeLNHKZc8ygIpsytW85K9z
         FCNvVDsyK0hTUhPvG33NU9pPIN+RmGZIObSik5+2oQoVnY1Ez7e063ko/5UVD/daIV30
         xTlQ==
X-Gm-Message-State: AOJu0YwBjakFQY6UFtJ0fMVfyJ8G4v9e5MsKqUiwTDRv0E38D3F3MnN+
	wLdwzvYENTE/vecQZ6MRwnUJcty4Dv6QoXMai34=
X-Google-Smtp-Source: AGHT+IHp8EfMtlNiKry8fKN5xseGJFspe5NPVAnup7UM8wknKHBZL1uBDtHJbrFjYC0T+bpxMk3g3YR45b0h0MlcBiI=
X-Received: by 2002:a19:431d:0:b0:4fb:52f1:9ab4 with SMTP id
 q29-20020a19431d000000b004fb52f19ab4mr2666684lfa.50.1692248933586; Wed, 16
 Aug 2023 22:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692181166.git.frederic.martinsons@gmail.com>
 <17b77d199a105d1a9f6df7c1b67fb77b450dc3d7.1692181166.git.frederic.martinsons@gmail.com>
 <20230816185921c1258741@mail.local> <CA+cAkerOc7f=0kTZ17923HrAVq=8EizJdrhGRcTPoVP8YFC51g@mail.gmail.com>
 <202308162117576ed53de1@mail.local>
In-Reply-To: <202308162117576ed53de1@mail.local>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 17 Aug 2023 07:08:41 +0200
Message-ID: <CA+cAkerLCTrX5OoTNpak5mL6NkZhWJKmX_1Ph0AOd4v=A=d8NQ@mail.gmail.com>
Subject: Re: [OE-core] [PATHCH V5 3/4] rust: provide examples for C library
 generation in rust
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008edd0d0603176866"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 05:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186287

--0000000000008edd0d0603176866
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Aug 2023 at 23:17, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 16/08/2023 22:05:08+0200, Frederic Martinsons wrote:
> > On Wed, 16 Aug 2023 at 20:59, Alexandre Belloni <
> > alexandre.belloni@bootlin.com> wrote:
> >
> > > Hello,
> > >
> > > On 16/08/2023 12:33:32+0200, Frederic Martinsons wrote:
> > > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > >
> > > > rust-c-lib-example is a little rust code which provide
> > > > a single function to print a formatted date (via the chrono crate)
> > > > from an input timestamp in millisecond. It has the necessary FFI
> > > > annotation and inherit cargo_c class for the C ABI compatible
> > > > library generation.
> > > >
> > > > rust-c-lib-example is meson project for the C code which
> > > > will call the print_date function from rust-c-lib-example
> > > > if no argument is provided, if any argument is provided
> > > > it will print "Hello world in rust from C!"
> > > >
> > > > add a runtime test case to check if all went well.
> > > >
> > > > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > > ---
> > > >  .../rust/rust-c-lib-example-bin_git.bb        | 16 ++++
> > > >  .../rust/rust-c-lib-example-crates.inc        | 79
> +++++++++++++++++++
> > > >  .../rust/rust-c-lib-example_git.bb            | 15 ++++
> > > >  meta/conf/distro/include/maintainers.inc      |  2 +
> > > >  meta/lib/oeqa/runtime/cases/rust.py           | 12 +++
> > > >  5 files changed, 124 insertions(+)
> > > >  create mode 100644 meta-selftest/recipes-devtools/rust/
> > > rust-c-lib-example-bin_git.bb
> > > >  create mode 100644
> > > meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> > > >  create mode 100644 meta-selftest/recipes-devtools/rust/
> > > rust-c-lib-example_git.bb
> > > >
> > >
> > > You need to add entries in maintainers.inc:
> > >
> > > AssertionError:
> > > Unable to find recipes for the following entries in maintainers.inc:
> > > rust-c-lib-example
> > > rust-c-lib-example-bin
> > >
> >
> > But I did !
> >
> > The entries for these recipes have been added in
> > meta/conf/distro/maintainers.inc by this very patch.
> > Can you tell the command to reproduce this error please  ? I'll try to
> > understand what's going on.
> >
>
> Indeed, sorry. But I tested v4 which didn't have the maintainers.inc
> change and there was no feedback that it was missing and no indication
> that this was added in v5.
>
>
It was also in v4 (see
https://lists.openembedded.org/g/openembedded-core/message/186112),
in fact it was in V1 too, but I find that the issue was not missing entries
in maintainers.inc
but that the two recipes was not found as the message suggest:

Unable to find recipes for the following entries in maintainers.inc:
rust-c-lib-example
rust-c-lib-example-bin


And looking at the test which raises that
(distrodata.Distrodata.test_maintainers), the recipe
searched are only those in "meta/recipes-*" and these example lies in
meta-selftest,

I just sent a V6 for removing these entries from maintainers.inc



> > Thanks.
> >
> >
> > > > diff --git a/meta-selftest/recipes-devtools/rust/
> > > rust-c-lib-example-bin_git.bb b/meta-selftest/recipes-devtools/rust/
> > > rust-c-lib-example-bin_git.bb
> > > > new file mode 100644
> > > > index 0000000000..47d878597a
> > > > --- /dev/null
> > > > +++ b/meta-selftest/recipes-devtools/rust/
> rust-c-lib-example-bin_git.bb
> > > > @@ -0,0 +1,16 @@
> > > > +DESCRIPTION = "A simple example for C wrapper around a rust library"
> > > > +HOMEPAGE = "https://gitlab.com/fmartinsonsHome/rust-c-lib-example"
> > > > +LICENSE = "MIT"
> > > > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=cb9c441273ed8a029701a086befbfc63"
> > > > +
> > > > +SRC_URI = " \
> > > > +     git://
> > >
> gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=main;protocol=https
> > > \
> > > > +"
> > > > +
> > > > +SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +DEPENDS = "rust-c-lib-example"
> > > > +
> > > > +inherit meson pkgconfig
> > > > +
> > > > diff --git
> > > a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> > > b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> > > > new file mode 100644
> > > > index 0000000000..05f5949203
> > > > --- /dev/null
> > > > +++
> b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> > > > @@ -0,0 +1,79 @@
> > > > +SRC_URI += " \
> > > > +    crate://crates.io/android-tzdata/0.1.1 \
> > > > +    crate://crates.io/android_system_properties/0.1.5 \
> > > > +    crate://crates.io/autocfg/1.1.0 \
> > > > +    crate://crates.io/bumpalo/3.13.0 \
> > > > +    crate://crates.io/cc/1.0.82 \
> > > > +    crate://crates.io/cfg-if/1.0.0 \
> > > > +    crate://crates.io/chrono/0.4.26 \
> > > > +    crate://crates.io/core-foundation-sys/0.8.4 \
> > > > +    crate://crates.io/iana-time-zone/0.1.57 \
> > > > +    crate://crates.io/iana-time-zone-haiku/0.1.2 \
> > > > +    crate://crates.io/js-sys/0.3.64 \
> > > > +    crate://crates.io/libc/0.2.147 \
> > > > +    crate://crates.io/log/0.4.19 \
> > > > +    crate://crates.io/num-traits/0.2.16 \
> > > > +    crate://crates.io/once_cell/1.18.0 \
> > > > +    crate://crates.io/proc-macro2/1.0.66 \
> > > > +    crate://crates.io/quote/1.0.32 \
> > > > +    crate://crates.io/syn/2.0.28 \
> > > > +    crate://crates.io/time/0.1.45 \
> > > > +    crate://crates.io/unicode-ident/1.0.11 \
> > > > +    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
> > > > +    crate://crates.io/wasm-bindgen/0.2.87 \
> > > > +    crate://crates.io/wasm-bindgen-backend/0.2.87 \
> > > > +    crate://crates.io/wasm-bindgen-macro/0.2.87 \
> > > > +    crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
> > > > +    crate://crates.io/wasm-bindgen-shared/0.2.87 \
> > > > +    crate://crates.io/winapi/0.3.9 \
> > > > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > > > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > > > +    crate://crates.io/windows/0.48.0 \
> > > > +    crate://crates.io/windows-targets/0.48.1 \
> > > > +    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
> > > > +    crate://crates.io/windows_aarch64_msvc/0.48.0 \
> > > > +    crate://crates.io/windows_i686_gnu/0.48.0 \
> > > > +    crate://crates.io/windows_i686_msvc/0.48.0 \
> > > > +    crate://crates.io/windows_x86_64_gnu/0.48.0 \
> > > > +    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
> > > > +    crate://crates.io/windows_x86_64_msvc/0.48.0 \
> > > > +"
> > > > +
> > > > +SRC_URI[android-tzdata-0.1.1.sha256sum] =
> > > "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
> > > > +SRC_URI[android_system_properties-0.1.5.sha256sum] =
> > > "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> > > > +SRC_URI[autocfg-1.1.0.sha256sum] =
> > > "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > > > +SRC_URI[bumpalo-3.13.0.sha256sum] =
> > > "a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656af3fc1"
> > > > +SRC_URI[cc-1.0.82.sha256sum] =
> > > "305fe645edc1442a0fa8b6726ba61d422798d37a52e12eaecf4b022ebbb88f01"
> > > > +SRC_URI[cfg-if-1.0.0.sha256sum] =
> > > "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > > > +SRC_URI[chrono-0.4.26.sha256sum] =
> > > "ec837a71355b28f6556dbd569b37b3f363091c0bd4b2e735674521b4c5fd9bc5"
> > > > +SRC_URI[core-foundation-sys-0.8.4.sha256sum] =
> > > "e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa"
> > > > +SRC_URI[iana-time-zone-0.1.57.sha256sum] =
> > > "2fad5b825842d2b38bd206f3e81d6957625fd7f0a361e345c30e01a0ae2dd613"
> > > > +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =
> > > "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
> > > > +SRC_URI[js-sys-0.3.64.sha256sum] =
> > > "c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a"
> > > > +SRC_URI[libc-0.2.147.sha256sum] =
> > > "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
> > > > +SRC_URI[log-0.4.19.sha256sum] =
> > > "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
> > > > +SRC_URI[num-traits-0.2.16.sha256sum] =
> > > "f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2"
> > > > +SRC_URI[once_cell-1.18.0.sha256sum] =
> > > "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
> > > > +SRC_URI[proc-macro2-1.0.66.sha256sum] =
> > > "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
> > > > +SRC_URI[quote-1.0.32.sha256sum] =
> > > "50f3b39ccfb720540debaa0164757101c08ecb8d326b15358ce76a62c7e85965"
> > > > +SRC_URI[syn-2.0.28.sha256sum] =
> > > "04361975b3f5e348b2189d8dc55bc942f278b2d482a6a0365de5bdd62d351567"
> > > > +SRC_URI[time-0.1.45.sha256sum] =
> > > "1b797afad3f312d1c66a56d11d0316f916356d11bd158fbc6ca6389ff6bf805a"
> > > > +SRC_URI[unicode-ident-1.0.11.sha256sum] =
> > > "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
> > > > +SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] =
> > > "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
> > > > +SRC_URI[wasm-bindgen-0.2.87.sha256sum] =
> > > "7706a72ab36d8cb1f80ffbf0e071533974a60d0a308d01a5d0375bf60499a342"
> > > > +SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] =
> > > "5ef2b6d3c510e9625e5fe6f509ab07d66a760f0885d858736483c32ed7809abd"
> > > > +SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] =
> > > "dee495e55982a3bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d"
> > > > +SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] =
> > > "54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
> > > > +SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] =
> > > "ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1"
> > > > +SRC_URI[winapi-0.3.9.sha256sum] =
> > > "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> > > > +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =
> > > "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> > > > +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =
> > > "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> > > > +SRC_URI[windows-0.48.0.sha256sum] =
> > > "e686886bc078bc1b0b600cac0147aadb815089b6e4da64016cbd754b6342700f"
> > > > +SRC_URI[windows-targets-0.48.1.sha256sum] =
> > > "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
> > > > +SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =
> > > "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
> > > > +SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =
> > > "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
> > > > +SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =
> > > "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
> > > > +SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =
> > > "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
> > > > +SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =
> > > "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
> > > > +SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =
> > > "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
> > > > +SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =
> > > "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
> > > > diff --git a/meta-selftest/recipes-devtools/rust/
> > > rust-c-lib-example_git.bb b/meta-selftest/recipes-devtools/rust/
> > > rust-c-lib-example_git.bb
> > > > new file mode 100644
> > > > index 0000000000..6e7c250b92
> > > > --- /dev/null
> > > > +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
> > > > @@ -0,0 +1,15 @@
> > > > +DESCRIPTION = "A simple example for rust C library"
> > > > +HOMEPAGE = "https://gitlab.com/fmartinsonsHome/rust-c-lib-example"
> > > > +LICENSE = "MIT"
> > > > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=cb9c441273ed8a029701a086befbfc63"
> > > > +
> > > > +SRC_URI = " \
> > > > +     git://
> > >
> gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=main;protocol=https
> > > \
> > > > +"
> > > > +
> > > > +SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +inherit cargo_c
> > > > +
> > > > +require ${BPN}-crates.inc
> > > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > b/meta/conf/distro/include/maintainers.inc
> > > > index a69b58881d..e3a573df61 100644
> > > > --- a/meta/conf/distro/include/maintainers.inc
> > > > +++ b/meta/conf/distro/include/maintainers.inc
> > > > @@ -735,6 +735,8 @@ RECIPE_MAINTAINER:pn-ruby = "Ross Burton <
> > > ross.burton@arm.com>"
> > > >  RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <
> ross.burton@arm.com
> > > >"
> > > >  RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <
> Randy.MacLeod@windriver.com
> > > >"
> > > >  RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> > > "Randy MacLeod <Randy.MacLeod@windriver.com>"
> > > > +RECIPE_MAINTAINER:pn-rust-c-lib-example = "Frederic Martinsons <
> > > frederic.martinsons@gmail.com>"
> > > > +RECIPE_MAINTAINER:pn-rust-c-lib-example-bin = "Frederic Martinsons <
> > > frederic.martinsons@gmail.com>"
> > > >  RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <
> > > Randy.MacLeod@windriver.com>"
> > > >  RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <
> > > unassigned@yoctoproject.org>"
> > > >  RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <
> > > ross.burton@arm.com>"
> > > > diff --git a/meta/lib/oeqa/runtime/cases/rust.py
> > > b/meta/lib/oeqa/runtime/cases/rust.py
> > > > index 9bf0312669..39707cf5cf 100644
> > > > --- a/meta/lib/oeqa/runtime/cases/rust.py
> > > > +++ b/meta/lib/oeqa/runtime/cases/rust.py
> > > > @@ -48,3 +48,15 @@ class RustCompileTest(OERuntimeTestCase):
> > > >          status, output = self.target.run('cargo run
> > > --manifest-path=/tmp/hello/Cargo.toml')
> > > >          msg = 'running compiled file failed, output: %s' % output
> > > >          self.assertEqual(status, 0, msg=msg)
> > > > +
> > > > +class RustCLibExampleTest(OERuntimeTestCase):
> > > > +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> > > > +    @OEHasPackage('rust-c-lib-example-bin')
> > > > +    def test_rust_c_lib_example(self):
> > > > +        cmd = "rust-c-lib-example-bin test"
> > > > +        status, output = self.target.run(cmd)
> > > > +        msg = 'Exit status was not 0. Output: %s' % output
> > > > +        self.assertEqual(status, 0, msg=msg)
> > > > +
> > > > +        msg = 'Incorrect output: %s' % output
> > > > +        self.assertEqual(output, "Hello world in rust from C!",
> msg=msg)
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186142):
> https://lists.openembedded.org/g/openembedded-core/message/186142
> > Mute This Topic: https://lists.openembedded.org/mt/100776696/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000008edd0d0603176866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Aug 2023 at 23:17, Alexand=
re Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.b=
elloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 16/08/2023 22:05:08+0200, Frederic Martinsons wrote:<b=
r>
&gt; On Wed, 16 Aug 2023 at 20:59, Alexandre Belloni &lt;<br>
&gt; <a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">ale=
xandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; On 16/08/2023 12:33:32+0200, Frederic Martinsons wrote:<br>
&gt; &gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mar=
tinsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; rust-c-lib-example is a little rust code which provide<br>
&gt; &gt; &gt; a single function to print a formatted date (via the chrono =
crate)<br>
&gt; &gt; &gt; from an input timestamp in millisecond. It has the necessary=
 FFI<br>
&gt; &gt; &gt; annotation and inherit cargo_c class for the C ABI compatibl=
e<br>
&gt; &gt; &gt; library generation.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; rust-c-lib-example is meson project for the C code which<br>
&gt; &gt; &gt; will call the print_date function from rust-c-lib-example<br=
>
&gt; &gt; &gt; if no argument is provided, if any argument is provided<br>
&gt; &gt; &gt; it will print &quot;Hello world in rust from C!&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; add a runtime test case to check if all went well.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:fre=
deric.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../rust/<a href=3D"http://rust-c-lib-example-bin_git.=
bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib-example-bin_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++<br>
&gt; &gt; &gt;=C2=A0 .../rust/rust-c-lib-example-crates.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 79 +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 .../rust/<a href=3D"http://rust-c-lib-example_git.bb" =
rel=3D"noreferrer" target=3D"_blank">rust-c-lib-example_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++<br>
&gt; &gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +<br>
&gt; &gt; &gt;=C2=A0 meta/lib/oeqa/runtime/cases/rust.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++<br>
&gt; &gt; &gt;=C2=A0 5 files changed, 124 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/rust=
/<br>
&gt; &gt; <a href=3D"http://rust-c-lib-example-bin_git.bb" rel=3D"noreferre=
r" target=3D"_blank">rust-c-lib-example-bin_git.bb</a><br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc=
<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/rust=
/<br>
&gt; &gt; <a href=3D"http://rust-c-lib-example_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">rust-c-lib-example_git.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; You need to add entries in maintainers.inc:<br>
&gt; &gt;<br>
&gt; &gt; AssertionError:<br>
&gt; &gt; Unable to find recipes for the following entries in maintainers.i=
nc:<br>
&gt; &gt; rust-c-lib-example<br>
&gt; &gt; rust-c-lib-example-bin<br>
&gt; &gt;<br>
&gt; <br>
&gt; But I did !<br>
&gt; <br>
&gt; The entries for these recipes have been added in<br>
&gt; meta/conf/distro/maintainers.inc by this very patch.<br>
&gt; Can you tell the command to reproduce this error please=C2=A0 ? I&#39;=
ll try to<br>
&gt; understand what&#39;s going on.<br>
&gt; <br>
<br>
Indeed, sorry. But I tested v4 which didn&#39;t have the maintainers.inc<br=
>
change and there was no feedback that it was missing and no indication<br>
that this was added in v5.<br>
<br></blockquote><div><br></div><div>It was also in v4 (see <a href=3D"http=
s://lists.openembedded.org/g/openembedded-core/message/186112">https://list=
s.openembedded.org/g/openembedded-core/message/186112</a>),</div><div>in fa=
ct it was in V1 too, but I find that the issue was not missing entries in m=
aintainers.inc</div><div>but that the two recipes was not found as the mess=
age suggest:</div><div><br></div><div>Unable to find recipes for the follow=
ing entries in maintainers.inc:<br>rust-c-lib-example<br>rust-c-lib-example=
-bin<br></div><div><br></div><div><br></div><div>And looking at the test wh=
ich raises that (distrodata.Distrodata.test_maintainers), the recipe</div><=
div>searched are only those in &quot;meta/recipes-*&quot; and these example=
 lies in meta-selftest,</div><div><br></div><div>I just sent a V6 for remov=
ing these entries from maintainers.inc</div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Thanks.<br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt; diff --git a/meta-selftest/recipes-devtools/rust/<br>
&gt; &gt; <a href=3D"http://rust-c-lib-example-bin_git.bb" rel=3D"noreferre=
r" target=3D"_blank">rust-c-lib-example-bin_git.bb</a> b/meta-selftest/reci=
pes-devtools/rust/<br>
&gt; &gt; <a href=3D"http://rust-c-lib-example-bin_git.bb" rel=3D"noreferre=
r" target=3D"_blank">rust-c-lib-example-bin_git.bb</a><br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..47d878597a<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-selftest/recipes-devtools/rust/<a href=3D"http://=
rust-c-lib-example-bin_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-=
lib-example-bin_git.bb</a><br>
&gt; &gt; &gt; @@ -0,0 +1,16 @@<br>
&gt; &gt; &gt; +DESCRIPTION =3D &quot;A simple example for C wrapper around=
 a rust library&quot;<br>
&gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/fmartinson=
sHome/rust-c-lib-example" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.com/fmartinsonsHome/rust-c-lib-example</a>&quot;<br>
&gt; &gt; &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dcb9c441273e=
d8a029701a086befbfc63&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI =3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0git://<br>
&gt; &gt; <a href=3D"http://gitlab.com/fmartinsonsHome/rust-c-lib-example.g=
it;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git=
lab.com/fmartinsonsHome/rust-c-lib-example.git;branch=3Dmain;protocol=3Dhtt=
ps</a><br>
&gt; &gt; \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRCREV =3D &quot;fc53c457f69aa5221ec1f8619a007e8150db5e60&q=
uot;<br>
&gt; &gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +DEPENDS =3D &quot;rust-c-lib-example&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +inherit meson pkgconfig<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.i=
nc<br>
&gt; &gt; b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.i=
nc<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..05f5949203<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example=
-crates.inc<br>
&gt; &gt; &gt; @@ -0,0 +1,79 @@<br>
&gt; &gt; &gt; +SRC_URI +=3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android-t=
zdata/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/android-tzdata/=
0.1.1</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android_s=
ystem_properties/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/andr=
oid_system_properties/0.1.5</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3=
.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bumpalo/3.13.0</a> \<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.82=
" rel=3D"noreferrer" target=3D"_blank">crates.io/cc/1.0.82</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.=
0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.=
4.26" rel=3D"noreferrer" target=3D"_blank">crates.io/chrono/0.4.26</a> \<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/core-foun=
dation-sys/0.8.4" rel=3D"noreferrer" target=3D"_blank">crates.io/core-found=
ation-sys/0.8.4</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time=
-zone/0.1.57" rel=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone=
/0.1.57</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time=
-zone-haiku/0.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/iana-time=
-zone-haiku/0.1.2</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.=
3.64" rel=3D"noreferrer" target=3D"_blank">crates.io/js-sys/0.3.64</a> \<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.=
147" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.147</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.1=
9" rel=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.19</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-trait=
s/0.2.16" rel=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.16<=
/a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell=
/1.18.0" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.18.0</a=
> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macr=
o2/1.0.66" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.6=
6</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0=
.32" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.32</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.2=
8" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.28</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.1.=
45" rel=3D"noreferrer" target=3D"_blank">crates.io/time/0.1.45</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-i=
dent/1.0.11" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1=
.0.11</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.10=
.0+wasi-snapshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/w=
asi/0.10.0+wasi-snapshot-preview1</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bind=
gen/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.2=
.87</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bind=
gen-backend/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bin=
dgen-backend/0.2.87</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bind=
gen-macro/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindg=
en-macro/0.2.87</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bind=
gen-macro-support/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wa=
sm-bindgen-macro-support/0.2.87</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bind=
gen-shared/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bind=
gen-shared/0.2.87</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.=
3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i6=
86-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/win=
api-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x8=
6_64-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/w=
inapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows/0=
.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows/0.48.0</a> \<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-t=
argets/0.48.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targe=
ts/0.48.1</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_a=
arch64_gnullvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windo=
ws_aarch64_gnullvm/0.48.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_a=
arch64_msvc/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_=
aarch64_msvc/0.48.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i=
686_gnu/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686=
_gnu/0.48.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i=
686_msvc/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i68=
6_msvc/0.48.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x=
86_64_gnu/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x8=
6_64_gnu/0.48.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x=
86_64_gnullvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/window=
s_x86_64_gnullvm/0.48.0</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x=
86_64_msvc/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x=
86_64_msvc/0.48.0</a> \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI[android-tzdata-0.1.1.sha256sum] =3D<br>
&gt; &gt; &quot;e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb=
4fef0&quot;<br>
&gt; &gt; &gt; +SRC_URI[android_system_properties-0.1.5.sha256sum] =3D<br>
&gt; &gt; &quot;819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee=
66311&quot;<br>
&gt; &gt; &gt; +SRC_URI[autocfg-1.1.0.sha256sum] =3D<br>
&gt; &gt; &quot;d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161=
b97fa&quot;<br>
&gt; &gt; &gt; +SRC_URI[bumpalo-3.13.0.sha256sum] =3D<br>
&gt; &gt; &quot;a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656a=
f3fc1&quot;<br>
&gt; &gt; &gt; +SRC_URI[cc-1.0.82.sha256sum] =3D<br>
&gt; &gt; &quot;305fe645edc1442a0fa8b6726ba61d422798d37a52e12eaecf4b022ebbb=
88f01&quot;<br>
&gt; &gt; &gt; +SRC_URI[cfg-if-1.0.0.sha256sum] =3D<br>
&gt; &gt; &quot;baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2d=
a40fd&quot;<br>
&gt; &gt; &gt; +SRC_URI[chrono-0.4.26.sha256sum] =3D<br>
&gt; &gt; &quot;ec837a71355b28f6556dbd569b37b3f363091c0bd4b2e735674521b4c5f=
d9bc5&quot;<br>
&gt; &gt; &gt; +SRC_URI[core-foundation-sys-0.8.4.sha256sum] =3D<br>
&gt; &gt; &quot;e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c32=
10efa&quot;<br>
&gt; &gt; &gt; +SRC_URI[iana-time-zone-0.1.57.sha256sum] =3D<br>
&gt; &gt; &quot;2fad5b825842d2b38bd206f3e81d6957625fd7f0a361e345c30e01a0ae2=
dd613&quot;<br>
&gt; &gt; &gt; +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D<br>
&gt; &gt; &quot;f31827a206f56af32e590ba56d5d2d085f558508192593743f16b230649=
5269f&quot;<br>
&gt; &gt; &gt; +SRC_URI[js-sys-0.3.64.sha256sum] =3D<br>
&gt; &gt; &quot;c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8=
f935a&quot;<br>
&gt; &gt; &gt; +SRC_URI[libc-0.2.147.sha256sum] =3D<br>
&gt; &gt; &quot;b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef9271=
59bb3&quot;<br>
&gt; &gt; &gt; +SRC_URI[log-0.4.19.sha256sum] =3D<br>
&gt; &gt; &quot;b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42=
004b4&quot;<br>
&gt; &gt; &gt; +SRC_URI[num-traits-0.2.16.sha256sum] =3D<br>
&gt; &gt; &quot;f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee=
9e6c2&quot;<br>
&gt; &gt; &gt; +SRC_URI[once_cell-1.18.0.sha256sum] =3D<br>
&gt; &gt; &quot;dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a6=
3576d&quot;<br>
&gt; &gt; &gt; +SRC_URI[proc-macro2-1.0.66.sha256sum] =3D<br>
&gt; &gt; &quot;18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e=
2ead9&quot;<br>
&gt; &gt; &gt; +SRC_URI[quote-1.0.32.sha256sum] =3D<br>
&gt; &gt; &quot;50f3b39ccfb720540debaa0164757101c08ecb8d326b15358ce76a62c7e=
85965&quot;<br>
&gt; &gt; &gt; +SRC_URI[syn-2.0.28.sha256sum] =3D<br>
&gt; &gt; &quot;04361975b3f5e348b2189d8dc55bc942f278b2d482a6a0365de5bdd62d3=
51567&quot;<br>
&gt; &gt; &gt; +SRC_URI[time-0.1.45.sha256sum] =3D<br>
&gt; &gt; &quot;1b797afad3f312d1c66a56d11d0316f916356d11bd158fbc6ca6389ff6b=
f805a&quot;<br>
&gt; &gt; &gt; +SRC_URI[unicode-ident-1.0.11.sha256sum] =3D<br>
&gt; &gt; &quot;301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86a=
dfc3c&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] =3D<b=
r>
&gt; &gt; &quot;1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba=
2c31f&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasm-bindgen-0.2.87.sha256sum] =3D<br>
&gt; &gt; &quot;7706a72ab36d8cb1f80ffbf0e071533974a60d0a308d01a5d0375bf6049=
9a342&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] =3D<br>
&gt; &gt; &quot;5ef2b6d3c510e9625e5fe6f509ab07d66a760f0885d858736483c32ed78=
09abd&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] =3D<br>
&gt; &gt; &quot;dee495e55982a3bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd0=
28f1d&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] =3D<br=
>
&gt; &gt; &quot;54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af2=
10c7b&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] =3D<br>
&gt; &gt; &quot;ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369=
775a1&quot;<br>
&gt; &gt; &gt; +SRC_URI[winapi-0.3.9.sha256sum] =3D<br>
&gt; &gt; &quot;5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b0=
0f419&quot;<br>
&gt; &gt; &gt; +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D<br>
&gt; &gt; &quot;ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab5=
1b7b6&quot;<br>
&gt; &gt; &gt; +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D<b=
r>
&gt; &gt; &quot;712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc193=
1183f&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;e686886bc078bc1b0b600cac0147aadb815089b6e4da64016cbd754b634=
2700f&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows-targets-0.48.1.sha256sum] =3D<br>
&gt; &gt; &quot;05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b495=
3e95f&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f=
7e1bc&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98=
d7cf3&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467d=
aa241&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19=
f8e00&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af=
974b1&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f=
7b953&quot;<br>
&gt; &gt; &gt; +SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D<br>
&gt; &gt; &quot;1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c=
8378a&quot;<br>
&gt; &gt; &gt; diff --git a/meta-selftest/recipes-devtools/rust/<br>
&gt; &gt; <a href=3D"http://rust-c-lib-example_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">rust-c-lib-example_git.bb</a> b/meta-selftest/recipes-devt=
ools/rust/<br>
&gt; &gt; <a href=3D"http://rust-c-lib-example_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">rust-c-lib-example_git.bb</a><br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..6e7c250b92<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-selftest/recipes-devtools/rust/<a href=3D"http://=
rust-c-lib-example_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib-=
example_git.bb</a><br>
&gt; &gt; &gt; @@ -0,0 +1,15 @@<br>
&gt; &gt; &gt; +DESCRIPTION =3D &quot;A simple example for rust C library&q=
uot;<br>
&gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/fmartinson=
sHome/rust-c-lib-example" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.com/fmartinsonsHome/rust-c-lib-example</a>&quot;<br>
&gt; &gt; &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dcb9c441273e=
d8a029701a086befbfc63&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI =3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0git://<br>
&gt; &gt; <a href=3D"http://gitlab.com/fmartinsonsHome/rust-c-lib-example.g=
it;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git=
lab.com/fmartinsonsHome/rust-c-lib-example.git;branch=3Dmain;protocol=3Dhtt=
ps</a><br>
&gt; &gt; \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRCREV =3D &quot;fc53c457f69aa5221ec1f8619a007e8150db5e60&q=
uot;<br>
&gt; &gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +inherit cargo_c<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +require ${BPN}-crates.inc<br>
&gt; &gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; b/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; &gt; index a69b58881d..e3a573df61 100644<br>
&gt; &gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; &gt; @@ -735,6 +735,8 @@ RECIPE_MAINTAINER:pn-ruby =3D &quot;Ross=
 Burton &lt;<br>
&gt; &gt; <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.bur=
ton@arm.com</a>&gt;&quot;<br>
&gt; &gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-run-postinsts =3D &quot;Ross Burt=
on &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton=
@arm.com</a><br>
&gt; &gt; &gt;&quot;<br>
&gt; &gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-rust =3D &quot;Randy MacLeod &lt;=
<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacL=
eod@windriver.com</a><br>
&gt; &gt; &gt;&quot;<br>
&gt; &gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_=
TARGET_ARCH} =3D<br>
&gt; &gt; &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver=
.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt; &gt; &gt; +RECIPE_MAINTAINER:pn-rust-c-lib-example =3D &quot;Frederic =
Martinsons &lt;<br>
&gt; &gt; <a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank=
">frederic.martinsons@gmail.com</a>&gt;&quot;<br>
&gt; &gt; &gt; +RECIPE_MAINTAINER:pn-rust-c-lib-example-bin =3D &quot;Frede=
ric Martinsons &lt;<br>
&gt; &gt; <a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank=
">frederic.martinsons@gmail.com</a>&gt;&quot;<br>
&gt; &gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-llvm =3D &quot;Randy MacLeod=
 &lt;<br>
&gt; &gt; <a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">=
Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt; &gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-rxvt-unicode =3D &quot;Unassigned=
 &lt;<br>
&gt; &gt; <a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">=
unassigned@yoctoproject.org</a>&gt;&quot;<br>
&gt; &gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-sato-screenshot =3D &quot;Ross Bu=
rton &lt;<br>
&gt; &gt; <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.bur=
ton@arm.com</a>&gt;&quot;<br>
&gt; &gt; &gt; diff --git a/meta/lib/oeqa/runtime/cases/rust.py<br>
&gt; &gt; b/meta/lib/oeqa/runtime/cases/rust.py<br>
&gt; &gt; &gt; index 9bf0312669..39707cf5cf 100644<br>
&gt; &gt; &gt; --- a/meta/lib/oeqa/runtime/cases/rust.py<br>
&gt; &gt; &gt; +++ b/meta/lib/oeqa/runtime/cases/rust.py<br>
&gt; &gt; &gt; @@ -48,3 +48,15 @@ class RustCompileTest(OERuntimeTestCase):=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.ta=
rget.run(&#39;cargo run<br>
&gt; &gt; --manifest-path=3D/tmp/hello/Cargo.toml&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;running compi=
led file failed, output: %s&#39; % output<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0=
, msg=3Dmsg)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +class RustCLibExampleTest(OERuntimeTestCase):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 @OETestDepends([&#39;ssh.SSHTest.test_ssh&#39=
;])<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 @OEHasPackage(&#39;rust-c-lib-example-bin&#39=
;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def test_rust_c_lib_example(self):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;rust-c-lib-exampl=
e-bin test&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.=
run(cmd)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;Exit status was no=
t 0. Output: %s&#39; % output<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=
=3Dmsg)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;Incorrect output: =
%s&#39; % output<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output, &quot;=
Hello world in rust from C!&quot;, msg=3Dmsg)<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_bla=
nk">https://bootlin.com</a><br>
&gt; &gt;<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#186142): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/186142" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/186142</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10077669=
6/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100776696/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000008edd0d0603176866--

