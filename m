Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3533AC25B78
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:05:31 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.170741.1692216320785357840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xos0SvM1;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6418c1239c5so32345586d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692216320; x=1692821120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+NIlLDjfuEa9Qt997z2OLU6CeeIxNvp35XED2P9xWM4=;
        b=Xos0SvM1zAkX/56uI/4uSu4a8xHELC2KbuWCso/O67q12Lq19Vsh+JNPJG8U9TWxaU
         Yp0xpUFwSVEQEqmr7Yg+LyJOykMfTTT8vJ85WEqS8m9ywY4OF9fURrTA3hWPUwO26jJR
         84Oc7WpKG2K+za4IbgC+gkvc+CgHcwNDJkCG3JxEOVbyb+PgQwlklFcamlXAYBeEeQa/
         3GlLiIt+d1z/NMBZTLOmdFhjqAEW9KsCalQCeaBIJXLaz64x9LGIXnOKlhIeMd5Qi482
         lrXy9lxJZWTQ7CLiBW8oViVGABkk4vjVexVJTkV48nhI2mdlLD7ZC/db9wSeN+cO1/+k
         b4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692216320; x=1692821120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NIlLDjfuEa9Qt997z2OLU6CeeIxNvp35XED2P9xWM4=;
        b=MCNRWLZewXt5eNd0Vj0xUyVVnqg05kHXu3Cq/wNM3VBmzlWSKzZq6+BTQLhIC4QApc
         kCnZfM/eifcWyNjPu6ZvEPhGeR3GQmqubjUKdsQ8P8s9BbHO1/l04BVRInBVjfGXZw6q
         K6gFhwlRx9WM8vfsGA4Iqj+iy11ZC9UwFsyAGEXDK6HDEJFu7pCYKGQZQYXHn2OMzWSM
         jbU2l8vGDBwFlh2qY8LKowp7x/YkYf8T9Hz/zzBfJnYDXiRDKrdtPAHz23naTmDfdLn7
         XwsHSyLWZneceKJGvPJKQzs7zN9rfIWtxJajKmrONNIB9vkShTxooVjUxlVYP87zLuRa
         nRPw==
X-Gm-Message-State: AOJu0Yywy7YZU2x71vaKifZEeodKnVk3Cgy8odj+zJGJHZ0XhNaT4vEA
	rjjIqTxBsEupIZMjZnippH3WkF8PcuaBiOglKxPwPga8
X-Google-Smtp-Source: AGHT+IE31bpsa+3Ut4jC4S9aw/NXEh34Oqx1cIOBgZZO09geZ92fZ85qEgav/W+yHfdyqgR7NDXIOyW15kvxnHsHDgA=
X-Received: by 2002:a0c:e0c1:0:b0:647:2ae7:1cb3 with SMTP id
 x1-20020a0ce0c1000000b006472ae71cb3mr2655639qvk.6.1692216319552; Wed, 16 Aug
 2023 13:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692181166.git.frederic.martinsons@gmail.com>
 <17b77d199a105d1a9f6df7c1b67fb77b450dc3d7.1692181166.git.frederic.martinsons@gmail.com>
 <20230816185921c1258741@mail.local>
In-Reply-To: <20230816185921c1258741@mail.local>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 16 Aug 2023 22:05:08 +0200
Message-ID: <CA+cAkerOc7f=0kTZ17923HrAVq=8EizJdrhGRcTPoVP8YFC51g@mail.gmail.com>
Subject: Re: [OE-core] [PATHCH V5 3/4] rust: provide examples for C library
 generation in rust
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009c31f306030fd025"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186142

--0000000000009c31f306030fd025
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Aug 2023 at 20:59, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> On 16/08/2023 12:33:32+0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > rust-c-lib-example is a little rust code which provide
> > a single function to print a formatted date (via the chrono crate)
> > from an input timestamp in millisecond. It has the necessary FFI
> > annotation and inherit cargo_c class for the C ABI compatible
> > library generation.
> >
> > rust-c-lib-example is meson project for the C code which
> > will call the print_date function from rust-c-lib-example
> > if no argument is provided, if any argument is provided
> > it will print "Hello world in rust from C!"
> >
> > add a runtime test case to check if all went well.
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  .../rust/rust-c-lib-example-bin_git.bb        | 16 ++++
> >  .../rust/rust-c-lib-example-crates.inc        | 79 +++++++++++++++++++
> >  .../rust/rust-c-lib-example_git.bb            | 15 ++++
> >  meta/conf/distro/include/maintainers.inc      |  2 +
> >  meta/lib/oeqa/runtime/cases/rust.py           | 12 +++
> >  5 files changed, 124 insertions(+)
> >  create mode 100644 meta-selftest/recipes-devtools/rust/
> rust-c-lib-example-bin_git.bb
> >  create mode 100644
> meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> >  create mode 100644 meta-selftest/recipes-devtools/rust/
> rust-c-lib-example_git.bb
> >
>
> You need to add entries in maintainers.inc:
>
> AssertionError:
> Unable to find recipes for the following entries in maintainers.inc:
> rust-c-lib-example
> rust-c-lib-example-bin
>

But I did !

The entries for these recipes have been added in
meta/conf/distro/maintainers.inc by this very patch.
Can you tell the command to reproduce this error please  ? I'll try to
understand what's going on.

Thanks.


> > diff --git a/meta-selftest/recipes-devtools/rust/
> rust-c-lib-example-bin_git.bb b/meta-selftest/recipes-devtools/rust/
> rust-c-lib-example-bin_git.bb
> > new file mode 100644
> > index 0000000000..47d878597a
> > --- /dev/null
> > +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
> > @@ -0,0 +1,16 @@
> > +DESCRIPTION = "A simple example for C wrapper around a rust library"
> > +HOMEPAGE = "https://gitlab.com/fmartinsonsHome/rust-c-lib-example"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=cb9c441273ed8a029701a086befbfc63"
> > +
> > +SRC_URI = " \
> > +     git://
> gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=main;protocol=https
> \
> > +"
> > +
> > +SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS = "rust-c-lib-example"
> > +
> > +inherit meson pkgconfig
> > +
> > diff --git
> a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> > new file mode 100644
> > index 0000000000..05f5949203
> > --- /dev/null
> > +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
> > @@ -0,0 +1,79 @@
> > +SRC_URI += " \
> > +    crate://crates.io/android-tzdata/0.1.1 \
> > +    crate://crates.io/android_system_properties/0.1.5 \
> > +    crate://crates.io/autocfg/1.1.0 \
> > +    crate://crates.io/bumpalo/3.13.0 \
> > +    crate://crates.io/cc/1.0.82 \
> > +    crate://crates.io/cfg-if/1.0.0 \
> > +    crate://crates.io/chrono/0.4.26 \
> > +    crate://crates.io/core-foundation-sys/0.8.4 \
> > +    crate://crates.io/iana-time-zone/0.1.57 \
> > +    crate://crates.io/iana-time-zone-haiku/0.1.2 \
> > +    crate://crates.io/js-sys/0.3.64 \
> > +    crate://crates.io/libc/0.2.147 \
> > +    crate://crates.io/log/0.4.19 \
> > +    crate://crates.io/num-traits/0.2.16 \
> > +    crate://crates.io/once_cell/1.18.0 \
> > +    crate://crates.io/proc-macro2/1.0.66 \
> > +    crate://crates.io/quote/1.0.32 \
> > +    crate://crates.io/syn/2.0.28 \
> > +    crate://crates.io/time/0.1.45 \
> > +    crate://crates.io/unicode-ident/1.0.11 \
> > +    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
> > +    crate://crates.io/wasm-bindgen/0.2.87 \
> > +    crate://crates.io/wasm-bindgen-backend/0.2.87 \
> > +    crate://crates.io/wasm-bindgen-macro/0.2.87 \
> > +    crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
> > +    crate://crates.io/wasm-bindgen-shared/0.2.87 \
> > +    crate://crates.io/winapi/0.3.9 \
> > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/windows/0.48.0 \
> > +    crate://crates.io/windows-targets/0.48.1 \
> > +    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
> > +    crate://crates.io/windows_aarch64_msvc/0.48.0 \
> > +    crate://crates.io/windows_i686_gnu/0.48.0 \
> > +    crate://crates.io/windows_i686_msvc/0.48.0 \
> > +    crate://crates.io/windows_x86_64_gnu/0.48.0 \
> > +    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
> > +    crate://crates.io/windows_x86_64_msvc/0.48.0 \
> > +"
> > +
> > +SRC_URI[android-tzdata-0.1.1.sha256sum] =
> "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
> > +SRC_URI[android_system_properties-0.1.5.sha256sum] =
> "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> > +SRC_URI[autocfg-1.1.0.sha256sum] =
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > +SRC_URI[bumpalo-3.13.0.sha256sum] =
> "a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656af3fc1"
> > +SRC_URI[cc-1.0.82.sha256sum] =
> "305fe645edc1442a0fa8b6726ba61d422798d37a52e12eaecf4b022ebbb88f01"
> > +SRC_URI[cfg-if-1.0.0.sha256sum] =
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > +SRC_URI[chrono-0.4.26.sha256sum] =
> "ec837a71355b28f6556dbd569b37b3f363091c0bd4b2e735674521b4c5fd9bc5"
> > +SRC_URI[core-foundation-sys-0.8.4.sha256sum] =
> "e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa"
> > +SRC_URI[iana-time-zone-0.1.57.sha256sum] =
> "2fad5b825842d2b38bd206f3e81d6957625fd7f0a361e345c30e01a0ae2dd613"
> > +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =
> "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
> > +SRC_URI[js-sys-0.3.64.sha256sum] =
> "c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a"
> > +SRC_URI[libc-0.2.147.sha256sum] =
> "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
> > +SRC_URI[log-0.4.19.sha256sum] =
> "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
> > +SRC_URI[num-traits-0.2.16.sha256sum] =
> "f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2"
> > +SRC_URI[once_cell-1.18.0.sha256sum] =
> "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
> > +SRC_URI[proc-macro2-1.0.66.sha256sum] =
> "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
> > +SRC_URI[quote-1.0.32.sha256sum] =
> "50f3b39ccfb720540debaa0164757101c08ecb8d326b15358ce76a62c7e85965"
> > +SRC_URI[syn-2.0.28.sha256sum] =
> "04361975b3f5e348b2189d8dc55bc942f278b2d482a6a0365de5bdd62d351567"
> > +SRC_URI[time-0.1.45.sha256sum] =
> "1b797afad3f312d1c66a56d11d0316f916356d11bd158fbc6ca6389ff6bf805a"
> > +SRC_URI[unicode-ident-1.0.11.sha256sum] =
> "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
> > +SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] =
> "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
> > +SRC_URI[wasm-bindgen-0.2.87.sha256sum] =
> "7706a72ab36d8cb1f80ffbf0e071533974a60d0a308d01a5d0375bf60499a342"
> > +SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] =
> "5ef2b6d3c510e9625e5fe6f509ab07d66a760f0885d858736483c32ed7809abd"
> > +SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] =
> "dee495e55982a3bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d"
> > +SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] =
> "54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
> > +SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] =
> "ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1"
> > +SRC_URI[winapi-0.3.9.sha256sum] =
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> > +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> > +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> > +SRC_URI[windows-0.48.0.sha256sum] =
> "e686886bc078bc1b0b600cac0147aadb815089b6e4da64016cbd754b6342700f"
> > +SRC_URI[windows-targets-0.48.1.sha256sum] =
> "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
> > +SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =
> "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
> > +SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =
> "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
> > +SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =
> "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
> > +SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =
> "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
> > +SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =
> "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
> > +SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =
> "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
> > +SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =
> "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
> > diff --git a/meta-selftest/recipes-devtools/rust/
> rust-c-lib-example_git.bb b/meta-selftest/recipes-devtools/rust/
> rust-c-lib-example_git.bb
> > new file mode 100644
> > index 0000000000..6e7c250b92
> > --- /dev/null
> > +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
> > @@ -0,0 +1,15 @@
> > +DESCRIPTION = "A simple example for rust C library"
> > +HOMEPAGE = "https://gitlab.com/fmartinsonsHome/rust-c-lib-example"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=cb9c441273ed8a029701a086befbfc63"
> > +
> > +SRC_URI = " \
> > +     git://
> gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=main;protocol=https
> \
> > +"
> > +
> > +SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cargo_c
> > +
> > +require ${BPN}-crates.inc
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index a69b58881d..e3a573df61 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -735,6 +735,8 @@ RECIPE_MAINTAINER:pn-ruby = "Ross Burton <
> ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com
> >"
> >  RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com
> >"
> >  RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "Randy MacLeod <Randy.MacLeod@windriver.com>"
> > +RECIPE_MAINTAINER:pn-rust-c-lib-example = "Frederic Martinsons <
> frederic.martinsons@gmail.com>"
> > +RECIPE_MAINTAINER:pn-rust-c-lib-example-bin = "Frederic Martinsons <
> frederic.martinsons@gmail.com>"
> >  RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >  RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <
> unassigned@yoctoproject.org>"
> >  RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <
> ross.burton@arm.com>"
> > diff --git a/meta/lib/oeqa/runtime/cases/rust.py
> b/meta/lib/oeqa/runtime/cases/rust.py
> > index 9bf0312669..39707cf5cf 100644
> > --- a/meta/lib/oeqa/runtime/cases/rust.py
> > +++ b/meta/lib/oeqa/runtime/cases/rust.py
> > @@ -48,3 +48,15 @@ class RustCompileTest(OERuntimeTestCase):
> >          status, output = self.target.run('cargo run
> --manifest-path=/tmp/hello/Cargo.toml')
> >          msg = 'running compiled file failed, output: %s' % output
> >          self.assertEqual(status, 0, msg=msg)
> > +
> > +class RustCLibExampleTest(OERuntimeTestCase):
> > +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> > +    @OEHasPackage('rust-c-lib-example-bin')
> > +    def test_rust_c_lib_example(self):
> > +        cmd = "rust-c-lib-example-bin test"
> > +        status, output = self.target.run(cmd)
> > +        msg = 'Exit status was not 0. Output: %s' % output
> > +        self.assertEqual(status, 0, msg=msg)
> > +
> > +        msg = 'Incorrect output: %s' % output
> > +        self.assertEqual(output, "Hello world in rust from C!", msg=msg)
> > --
> > 2.34.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186128):
> https://lists.openembedded.org/g/openembedded-core/message/186128
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

--0000000000009c31f306030fd025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Aug 2023 at 20:59, Alexand=
re Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.b=
elloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello,<br>
<br>
On 16/08/2023 12:33:32+0200, Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; <br>
&gt; rust-c-lib-example is a little rust code which provide<br>
&gt; a single function to print a formatted date (via the chrono crate)<br>
&gt; from an input timestamp in millisecond. It has the necessary FFI<br>
&gt; annotation and inherit cargo_c class for the C ABI compatible<br>
&gt; library generation.<br>
&gt; <br>
&gt; rust-c-lib-example is meson project for the C code which<br>
&gt; will call the print_date function from rust-c-lib-example<br>
&gt; if no argument is provided, if any argument is provided<br>
&gt; it will print &quot;Hello world in rust from C!&quot;<br>
&gt; <br>
&gt; add a runtime test case to check if all went well.<br>
&gt; <br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 .../rust/<a href=3D"http://rust-c-lib-example-bin_git.bb" rel=3D=
"noreferrer" target=3D"_blank">rust-c-lib-example-bin_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 16 ++++<br>
&gt;=C2=A0 .../rust/rust-c-lib-example-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 79 +++++++++++++++++++<br>
&gt;=C2=A0 .../rust/<a href=3D"http://rust-c-lib-example_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">rust-c-lib-example_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 12 +++<br>
&gt;=C2=A0 5 files changed, 124 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/rust/<a href=
=3D"http://rust-c-lib-example-bin_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust-c-lib-example-bin_git.bb</a><br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-li=
b-example-crates.inc<br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/rust/<a href=
=3D"http://rust-c-lib-example_git.bb" rel=3D"noreferrer" target=3D"_blank">=
rust-c-lib-example_git.bb</a><br>
&gt; <br>
<br>
You need to add entries in maintainers.inc:<br>
<br>
AssertionError: <br>
Unable to find recipes for the following entries in maintainers.inc:<br>
rust-c-lib-example<br>
rust-c-lib-example-bin<br></blockquote><div><br></div><div>But I did !</div=
><div><br></div><div>The entries=C2=A0for these recipes have been added in =
meta/conf/distro/maintainers.inc by this very patch.</div><div>Can you tell=
 the command to reproduce this error please=C2=A0 ? I&#39;ll try to underst=
and what&#39;s going on.</div><div><br></div><div>Thanks.</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/meta-selftest/recipes-devtools/rust/<a href=3D"http://rus=
t-c-lib-example-bin_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib=
-example-bin_git.bb</a> b/meta-selftest/recipes-devtools/rust/<a href=3D"ht=
tp://rust-c-lib-example-bin_git.bb" rel=3D"noreferrer" target=3D"_blank">ru=
st-c-lib-example-bin_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..47d878597a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-selftest/recipes-devtools/rust/<a href=3D"http://rust-c-lib=
-example-bin_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib-exampl=
e-bin_git.bb</a><br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +DESCRIPTION =3D &quot;A simple example for C wrapper around a rust li=
brary&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/fmartinsonsHome/rust=
-c-lib-example" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/fma=
rtinsonsHome/rust-c-lib-example</a>&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dcb9c441273ed8a029701a=
086befbfc63&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gitlab.com/fmartinsonsHom=
e/rust-c-lib-example.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=
=3Dmain;protocol=3Dhttps</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;fc53c457f69aa5221ec1f8619a007e8150db5e60&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;rust-c-lib-example&quot;<br>
&gt; +<br>
&gt; +inherit meson pkgconfig<br>
&gt; +<br>
&gt; diff --git a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-cr=
ates.inc b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.in=
c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..05f5949203<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.in=
c<br>
&gt; @@ -0,0 +1,79 @@<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android-tzdata/0.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/android-tzdata/0.1.1</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android_system_prop=
erties/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/android_system=
_properties/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3.13.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bumpalo/3.13.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.82" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.82</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.26" rel=
=3D"noreferrer" target=3D"_blank">crates.io/chrono/0.4.26</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/core-foundation-sys=
/0.8.4" rel=3D"noreferrer" target=3D"_blank">crates.io/core-foundation-sys/=
0.8.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time-zone/0.1.=
57" rel=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone/0.1.57</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time-zone-haik=
u/0.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone-haik=
u/0.1.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.3.64" rel=
=3D"noreferrer" target=3D"_blank">crates.io/js-sys/0.3.64</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.147" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.147</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.19" rel=3D"=
noreferrer" target=3D"_blank">crates.io/log/0.4.19</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.16" =
rel=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.16</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.18.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.18.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.66"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.66</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.32</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.28" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/2.0.28</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.1.45" rel=3D=
"noreferrer" target=3D"_blank">crates.io/time/0.1.45</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.1=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.11</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.10.0+wasi-sn=
apshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.10.0=
+wasi-snapshot-preview1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen/0.2.87=
" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.2.87</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-backen=
d/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-backe=
nd/0.2.87</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro/=
0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-macro/0=
.2.87</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro-=
support/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen=
-macro-support/0.2.87</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-shared=
/0.2.87" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-shared=
/0.2.87</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-wind=
ows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-p=
c-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-wi=
ndows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_=
64-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows/0.48.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.4=
8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.1<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64=
_gnullvm/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_ms=
vc/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.=
48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.48.=
0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0=
.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.4=
8.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0=
.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_g=
nullvm/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc=
/0.48.0</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRC_URI[android-tzdata-0.1.1.sha256sum] =3D &quot;e999941b234f3131b00=
bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0&quot;<br>
&gt; +SRC_URI[android_system_properties-0.1.5.sha256sum] =3D &quot;819e7219=
dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311&quot;<br>
&gt; +SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b05=
3f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt; +SRC_URI[bumpalo-3.13.0.sha256sum] =3D &quot;a3e2c3daef883ecc1b5d58c15=
adae93470a91d425f3532ba1695849656af3fc1&quot;<br>
&gt; +SRC_URI[cc-1.0.82.sha256sum] =3D &quot;305fe645edc1442a0fa8b6726ba61d=
422798d37a52e12eaecf4b022ebbb88f01&quot;<br>
&gt; +SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc=
0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt; +SRC_URI[chrono-0.4.26.sha256sum] =3D &quot;ec837a71355b28f6556dbd569b=
37b3f363091c0bd4b2e735674521b4c5fd9bc5&quot;<br>
&gt; +SRC_URI[core-foundation-sys-0.8.4.sha256sum] =3D &quot;e496a50fda8aac=
ccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa&quot;<br>
&gt; +SRC_URI[iana-time-zone-0.1.57.sha256sum] =3D &quot;2fad5b825842d2b38b=
d206f3e81d6957625fd7f0a361e345c30e01a0ae2dd613&quot;<br>
&gt; +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D &quot;f31827a206f56=
af32e590ba56d5d2d085f558508192593743f16b2306495269f&quot;<br>
&gt; +SRC_URI[js-sys-0.3.64.sha256sum] =3D &quot;c5f195fe497f702db0f318b07f=
dd68edb16955aed830df8363d837542f8f935a&quot;<br>
&gt; +SRC_URI[libc-0.2.147.sha256sum] =3D &quot;b4668fb0ea861c1df094127ac5f=
1da3409a82116a4ba74fca2e58ef927159bb3&quot;<br>
&gt; +SRC_URI[log-0.4.19.sha256sum] =3D &quot;b06a4cde4c0f271a446782e3eff8d=
e789548ce57dbc8eca9292c27f4a42004b4&quot;<br>
&gt; +SRC_URI[num-traits-0.2.16.sha256sum] =3D &quot;f30b0abd723be7e2ffca12=
72140fac1a2f084c77ec3e123c192b66af1ee9e6c2&quot;<br>
&gt; +SRC_URI[once_cell-1.18.0.sha256sum] =3D &quot;dd8b5dd2ae5ed71462c5402=
58bedcb51965123ad7e7ccf4b9a8cafaa4a63576d&quot;<br>
&gt; +SRC_URI[proc-macro2-1.0.66.sha256sum] =3D &quot;18fb31db3f9bddb2ea821=
cde30a9f70117e3f119938b5ee630b7403aa6e2ead9&quot;<br>
&gt; +SRC_URI[quote-1.0.32.sha256sum] =3D &quot;50f3b39ccfb720540debaa01647=
57101c08ecb8d326b15358ce76a62c7e85965&quot;<br>
&gt; +SRC_URI[syn-2.0.28.sha256sum] =3D &quot;04361975b3f5e348b2189d8dc55bc=
942f278b2d482a6a0365de5bdd62d351567&quot;<br>
&gt; +SRC_URI[time-0.1.45.sha256sum] =3D &quot;1b797afad3f312d1c66a56d11d03=
16f916356d11bd158fbc6ca6389ff6bf805a&quot;<br>
&gt; +SRC_URI[unicode-ident-1.0.11.sha256sum] =3D &quot;301abaae475aa91687e=
b82514b328ab47a211a533026cb25fc3e519b86adfc3c&quot;<br>
&gt; +SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] =3D &quot;1a143=
597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f&quot;<br>
&gt; +SRC_URI[wasm-bindgen-0.2.87.sha256sum] =3D &quot;7706a72ab36d8cb1f80f=
fbf0e071533974a60d0a308d01a5d0375bf60499a342&quot;<br>
&gt; +SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] =3D &quot;5ef2b6d3c510=
e9625e5fe6f509ab07d66a760f0885d858736483c32ed7809abd&quot;<br>
&gt; +SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] =3D &quot;dee495e55982a3=
bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d&quot;<br>
&gt; +SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] =3D &quot;54681b=
18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b&quot;<br>
&gt; +SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] =3D &quot;ca6ad05a4870b=
2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1&quot;<br>
&gt; +SRC_URI[winapi-0.3.9.sha256sum] =3D &quot;5c839a674fcd7a98952e593242e=
a400abe93992746761e38641405d28b00f419&quot;<br>
&gt; +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;ac3b87c=
63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6&quot;<br>
&gt; +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;712e2=
27841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>
&gt; +SRC_URI[windows-0.48.0.sha256sum] =3D &quot;e686886bc078bc1b0b600cac0=
147aadb815089b6e4da64016cbd754b6342700f&quot;<br>
&gt; +SRC_URI[windows-targets-0.48.1.sha256sum] =3D &quot;05d4b17490f70499f=
20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f&quot;<br>
&gt; +SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D &quot;91ae572e1=
b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc&quot;<br>
&gt; +SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D &quot;b2ef27e0d7bd=
fcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3&quot;<br>
&gt; +SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D &quot;622a1962a7db830d=
6fd0a69683c80a18fda201879f0f447f065a3b7467daa241&quot;<br>
&gt; +SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D &quot;4542c6e364ce21b=
f45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00&quot;<br>
&gt; +SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D &quot;ca2b8a661f7628=
cbd23440e50b05d705db3686f894fc9580820623656af974b1&quot;<br>
&gt; +SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D &quot;7896dbc1f4=
1e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953&quot;<br>
&gt; +SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D &quot;1a515f5799fe4=
961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a&quot;<br>
&gt; diff --git a/meta-selftest/recipes-devtools/rust/<a href=3D"http://rus=
t-c-lib-example_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib-exa=
mple_git.bb</a> b/meta-selftest/recipes-devtools/rust/<a href=3D"http://rus=
t-c-lib-example_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib-exa=
mple_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6e7c250b92<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-selftest/recipes-devtools/rust/<a href=3D"http://rust-c-lib=
-example_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-c-lib-example_gi=
t.bb</a><br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +DESCRIPTION =3D &quot;A simple example for rust C library&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/fmartinsonsHome/rust=
-c-lib-example" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/fma=
rtinsonsHome/rust-c-lib-example</a>&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dcb9c441273ed8a029701a=
086befbfc63&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gitlab.com/fmartinsonsHom=
e/rust-c-lib-example.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=
=3Dmain;protocol=3Dhttps</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;fc53c457f69aa5221ec1f8619a007e8150db5e60&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit cargo_c<br>
&gt; +<br>
&gt; +require ${BPN}-crates.inc<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index a69b58881d..e3a573df61 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -735,6 +735,8 @@ RECIPE_MAINTAINER:pn-ruby =3D &quot;Ross Burton &l=
t;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.=
com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-run-postinsts =3D &quot;Ross Burton &lt;<a =
href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</=
a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust =3D &quot;Randy MacLeod &lt;<a href=3D=
"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@windri=
ver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARC=
H} =3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.co=
m" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-rust-c-lib-example =3D &quot;Frederic Martinsons=
 &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fre=
deric.martinsons@gmail.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-rust-c-lib-example-bin =3D &quot;Frederic Martin=
sons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank"=
>frederic.martinsons@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rust-llvm =3D &quot;Randy MacLeod &lt;<a hr=
ef=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@w=
indriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-rxvt-unicode =3D &quot;Unassigned &lt;<a hr=
ef=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoct=
oproject.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-sato-screenshot =3D &quot;Ross Burton &lt;<=
a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com=
</a>&gt;&quot;<br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runti=
me/cases/rust.py<br>
&gt; index 9bf0312669..39707cf5cf 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/rust.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/rust.py<br>
&gt; @@ -48,3 +48,15 @@ class RustCompileTest(OERuntimeTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&=
#39;cargo run --manifest-path=3D/tmp/hello/Cargo.toml&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;running compiled file f=
ailed, output: %s&#39; % output<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3Dms=
g)<br>
&gt; +<br>
&gt; +class RustCLibExampleTest(OERuntimeTestCase):<br>
&gt; +=C2=A0 =C2=A0 @OETestDepends([&#39;ssh.SSHTest.test_ssh&#39;])<br>
&gt; +=C2=A0 =C2=A0 @OEHasPackage(&#39;rust-c-lib-example-bin&#39;)<br>
&gt; +=C2=A0 =C2=A0 def test_rust_c_lib_example(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;rust-c-lib-example-bin test=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(cmd)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;Exit status was not 0. Outpu=
t: %s&#39; % output<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3Dmsg)<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;Incorrect output: %s&#39; % =
output<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output, &quot;Hello worl=
d in rust from C!&quot;, msg=3Dmsg)<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#186128): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/186128" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/186128</a><br>
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

--0000000000009c31f306030fd025--

