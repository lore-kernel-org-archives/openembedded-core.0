Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684FDC5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:32:58 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.7018.1748899974387616001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XltFm7ym;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e75f30452so33348247b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 14:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748899973; x=1749504773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnvIFff1gWcTvI2SCKVnFMz0tV/eKwI0I1Hyz9wonM=;
        b=XltFm7ymg8AfYkVbgzD1sG626c0hJ0z4aRebeYcVGaUlqY8NwfNmmj1/qtSxpky5yj
         6sjYFGa7UxHIU7hbIf7b4Qrsjlwjw045QTUrGk4fYaAYXnTYBLqdU4L8p4S5hWQQx01V
         q9e0X4GLhlV7V91ox+K/GDfdiM0jQOFANmDdXfOED5yZq88Smhna7swOV/otoPnjwZw+
         7NgGXUi2K20oGhVcpuX2e3xB8VcJuyny3DAK1459sQc9oeJJqts/v9GcW2euo9LbE35y
         DW09xLpXwZPAzKbedAp/IEsmhI8k3kX5vAoZu1pCTr7E7+xSZ6x0UwDO+cIRN+GZhb1M
         T6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748899973; x=1749504773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnvIFff1gWcTvI2SCKVnFMz0tV/eKwI0I1Hyz9wonM=;
        b=geoZlsCF9IheJ7j3zz9oYdTbVrKR7W9VOLXzQs/HR+n1auJGqcs0BM4IwIg3et1C+q
         hWaZNR7CpmBxa3KYKx66ZpBh3MI5+K4a1SC+Q4Gvp427kRxm3kkfycSkecYEZcJocoi2
         Oclp/vV/FwG42Hd/Xuks5y2IDD4ZxKmW4SJBS3OrqC/LhM04OzM95/wQGFPErwmdk39u
         WFkX+DAAoUHsmqr6Gakpne+f2Je5y3ia8m5olAFgv7RMtEA1EY57oiA/B0EwvKjgE9Tn
         Lk974b615NJpRvPacrzlIFnVZha/4+vFU7iMRmDig3Fz7vEgJZLdr67iJT9vqP1tohxk
         PKpg==
X-Gm-Message-State: AOJu0Yyc8TjpyslN2MJ7ElxbL9/WpXf9JrtawaXJ3sP1IegNZFCDrFcp
	24GmRZCxlyN0xlrJXtEx17dCxCYbwnWi6id2j5okuY/ikjXjeRnjTPia8WfEY02KSufLtTn0sGk
	TncSOUF0w2ZNn7+5YeJjRky8p3rdqzNyoZA==
X-Gm-Gg: ASbGncuOCuq75fePVzYrXXeX3nVSKPvfeyZT30JsJ/oB4DdcAhzC9QCb4kPHmwYou3A
	ANHjZ6R8YjwDqI1C5KkSLeuUuTsWfkPBE4VQGpG6iAt0UW2R4oZuvBAnx4zgmCkZB2XRLTO9Bvn
	AVZ2mo1zkeJ/UfB+U196FZC3pXIlAUlZj624vDJHi3pKwxy37aBzrEscg74Bo3eIcoiSpZmiRfM
	26V
X-Google-Smtp-Source: AGHT+IFr1wBt1FnSOf+2XZTc6cknQahFLkMXcHgTsv4e6cam+sJ0Xoa+fh4lpXWpQH8SAw8qmAjfl9rFLJ7+P6UCQ1o=
X-Received: by 2002:a05:690c:6705:b0:70e:195:e924 with SMTP id
 00721157ae682-70f97f3212fmr195673147b3.36.1748899973145; Mon, 02 Jun 2025
 14:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748816484.git.tim.orling@konsulko.com> <09d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
In-Reply-To: <09d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jun 2025 14:32:26 -0700
X-Gm-Features: AX0GCFvZ_SXroLzMj5K_LKcRnP02Vp17Ut6TE_pAaQsW50Vjpz_WlUOPlTP7_2k
Message-ID: <CAMKF1sprSxJnkOkM+v_k6tmwtPOiq26_A1AU0RikUrRfTN5NWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/8] python3-maturin: upgrade 1.8.3 -> 1.8.6
To: tim.orling@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217736

On Sun, Jun 1, 2025 at 3:26=E2=80=AFPM Tim Orling via lists.openembedded.or=
g
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Tim Orling <tim.orling@konsulko.com>
>
> Comparing changes since 1.8.3:
> https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6
>
> Changelog:
>
> 1.8.6
> * Print a message when overriding platform tag from _PYTHON_HOST_PLATFORM
>   in #2594
> * Use the current python interpreter's version when the abi3 feature is s=
et
>   with no explicit version in #2597
>
> 1.8.5
> * Fix release CI build
>
> 1.8.4
> * Install a Rust toolchain into a temporary directory when building matur=
in
>   itself or a package and a Rust toolchain is missing. Set
>   MATURIN_NO_INSTALL_RUST to disable this behavior. #2421
> * Fix broken maturin develop with latest uv in #2584
> * Add PYO3_PYTHON env var support in #2534
> * Sort RECORD file in wheel archives to make them deterministic in #2550
> * Publish wheel for loongarch64 in #2548
> * Add --compression-level option to build command in #2572
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> oe-selftest for maturin passes
>
>  .../python/python3-maturin-crates.inc         |  20 +-
>  ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
>  .../python/python3-maturin_1.8.3.bb           |  43 --
>  .../python/python3-maturin_1.8.6.bb           | 405 ++++++++++++++++++
>  4 files changed, 415 insertions(+), 163 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Def=
ine-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch

Please keep this patch, this version of maturin still uses libc
0.2.167, it breaks riscv32 builds without it.

>  delete mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.3.bb
>  create mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.6.bb
>
> diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/me=
ta/recipes-devtools/python/python3-maturin-crates.inc
> index 2f196f56570..5c939a09a8e 100644
> --- a/meta/recipes-devtools/python/python3-maturin-crates.inc
> +++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
> @@ -34,7 +34,7 @@ SRC_URI +=3D " \
>      crate://crates.io/cargo-options/0.7.4 \
>      crate://crates.io/cargo-platform/0.1.8 \
>      crate://crates.io/cargo-xwin/0.18.4 \
> -    crate://crates.io/cargo-zigbuild/0.19.7 \
> +    crate://crates.io/cargo-zigbuild/0.20.0 \
>      crate://crates.io/cargo_metadata/0.19.0 \
>      crate://crates.io/cbindgen/0.28.0 \
>      crate://crates.io/cc/1.2.16 \
> @@ -60,7 +60,7 @@ SRC_URI +=3D " \
>      crate://crates.io/crc/3.2.1 \
>      crate://crates.io/crc-catalog/2.4.0 \
>      crate://crates.io/crc32fast/1.4.2 \
> -    crate://crates.io/crossbeam-channel/0.5.13 \
> +    crate://crates.io/crossbeam-channel/0.5.15 \
>      crate://crates.io/crossbeam-deque/0.8.5 \
>      crate://crates.io/crossbeam-epoch/0.9.18 \
>      crate://crates.io/crossbeam-utils/0.8.20 \
> @@ -169,10 +169,10 @@ SRC_URI +=3D " \
>      crate://crates.io/num-conv/0.1.0 \
>      crate://crates.io/number_prefix/0.4.0 \
>      crate://crates.io/once_cell/1.20.2 \
> -    crate://crates.io/openssl/0.10.70 \
> +    crate://crates.io/openssl/0.10.72 \
>      crate://crates.io/openssl-macros/0.1.1 \
>      crate://crates.io/openssl-probe/0.1.5 \
> -    crate://crates.io/openssl-sys/0.9.105 \
> +    crate://crates.io/openssl-sys/0.9.107 \
>      crate://crates.io/option-ext/0.2.0 \
>      crate://crates.io/os_pipe/1.2.0 \
>      crate://crates.io/overload/0.1.1 \
> @@ -362,7 +362,7 @@ SRC_URI +=3D " \
>      crate://crates.io/zeroize/1.8.1 \
>      crate://crates.io/zerovec/0.10.4 \
>      crate://crates.io/zerovec-derive/0.10.3 \
> -    crate://crates.io/zip/2.2.3 \
> +    crate://crates.io/zip/2.3.0 \
>      crate://crates.io/zopfli/0.8.1 \
>  "
>
> @@ -398,7 +398,7 @@ SRC_URI[cargo-config2-0.1.26.sha256sum] =3D "d83ce0be=
8bd1479e5de6202def660e6c7e27e
>  SRC_URI[cargo-options-0.7.4.sha256sum] =3D "f3540247c0a37a76eb324acc238d=
c617786ea22c43b95da560c82a8f2714321f"
>  SRC_URI[cargo-platform-0.1.8.sha256sum] =3D "24b1f0365a6c6bb4020cd05806f=
d0d33c44d38046b8bd7f0e40814b9763cabfc"
>  SRC_URI[cargo-xwin-0.18.4.sha256sum] =3D "60f1954e4ffa0f4c47b3df5e6e9508=
706d8dcaa56152cd672dcee02930ba0326"
> -SRC_URI[cargo-zigbuild-0.19.7.sha256sum] =3D "04cc649328f39bbf1ef92ef753=
406e1785ff1074941c398e5214b6c74d318a9e"
> +SRC_URI[cargo-zigbuild-0.20.0.sha256sum] =3D "3f6e9e856390d5b0a859acaeda=
16528f8a61c964bdb894c3216c254908f1c2ea"
>  SRC_URI[cargo_metadata-0.19.0.sha256sum] =3D "afc309ed89476c8957c50fb818=
f56fe894db857866c3e163335faa91dc34eb85"
>  SRC_URI[cbindgen-0.28.0.sha256sum] =3D "eadd868a2ce9ca38de7eeafdcec9c706=
5ef89b42b32f0839278d55f35c54d1ff"
>  SRC_URI[cc-1.2.16.sha256sum] =3D "be714c154be609ec7f5dad223a33bf1482fff9=
0472de28f7362806e6d4832b8c"
> @@ -424,7 +424,7 @@ SRC_URI[cpufeatures-0.2.12.sha256sum] =3D "53fe5e26ff=
1b7aef8bca9c6080520cfb8d9333c
>  SRC_URI[crc-3.2.1.sha256sum] =3D "69e6e4d7b33a94f0991c26729976b10ebde1d3=
4c3ee82408fb536164fa10d636"
>  SRC_URI[crc-catalog-2.4.0.sha256sum] =3D "19d374276b40fb8bbdee95aef7c7fa=
6b5316ec764510eb64b8dd0e2ed0d7e7f5"
>  SRC_URI[crc32fast-1.4.2.sha256sum] =3D "a97769d94ddab943e4510d138150169a=
2758b5ef3eb191a9ee688de3e23ef7b3"
> -SRC_URI[crossbeam-channel-0.5.13.sha256sum] =3D "33480d6946193aa80339101=
24896ca395333cae7e2d1113d1fef6c3272217df2"
> +SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D "82b8f8f868b36967f960679=
0d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
>  SRC_URI[crossbeam-deque-0.8.5.sha256sum] =3D "613f8cc01fe9cf1a3eb3d7f488=
fd2fa8388403e97039e2f73692932e291a770d"
>  SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f02=
0e1402edd5753411d7737aa39c3714ad1b5420e"
>  SRC_URI[crossbeam-utils-0.8.20.sha256sum] =3D "22ec99545bb0ed0ea7bb9b8e1=
e9122ea386ff8a48c0922e43f36d45ab09e0e80"
> @@ -533,10 +533,10 @@ SRC_URI[nu-ansi-term-0.46.0.sha256sum] =3D "77a8165=
726e8236064dbb45459242600304b42
>  SRC_URI[num-conv-0.1.0.sha256sum] =3D "51d515d32fb182ee37cda2ccdcb92950d=
6a3c2893aa280e540671c2cd0f3b1d9"
>  SRC_URI[number_prefix-0.4.0.sha256sum] =3D "830b246a0e5f20af87141b25c173=
cd1b609bd7779a4617d6ec582abaf90870f3"
>  SRC_URI[once_cell-1.20.2.sha256sum] =3D "1261fe7e33c73b354eab43b1273a57c=
8f967d0391e80353e51f764ac02cf6775"
> -SRC_URI[openssl-0.10.70.sha256sum] =3D "61cfb4e166a8bb8c9b55c500bc230855=
0148ece889be90f609377e58140f42c6"
> +SRC_URI[openssl-0.10.72.sha256sum] =3D "fedfea7d58a1f73118430a55da6a286e=
7b044961736ce96a16a17068ea25e5da"
>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D "a948666b637a0f465e8564c73e8=
9d4dde00d72d4d473cc972f390fc3dcee7d9c"
>  SRC_URI[openssl-probe-0.1.5.sha256sum] =3D "ff011a302c396a5197692431fc19=
48019154afc178baf7d8e37367442a4601cf"
> -SRC_URI[openssl-sys-0.9.105.sha256sum] =3D "8b22d5b84be05a8d6947c7cb71f7=
c849aa0f112acd4bf51c2a7c1c988ac0a9dc"
> +SRC_URI[openssl-sys-0.9.107.sha256sum] =3D "8288979acd84749c744a9014b438=
2d42b8f7b2592847b5afb2ed29e5d16ede07"
>  SRC_URI[option-ext-0.2.0.sha256sum] =3D "04744f49eae99ab78e0d5c0b603ab21=
8f515ea8cfe5a456d7629ad883a3b6e7d"
>  SRC_URI[os_pipe-1.2.0.sha256sum] =3D "29d73ba8daf8fac13b0501d1abeddcfe21=
ba7401ada61a819144b6c2a4f32209"
>  SRC_URI[overload-0.1.1.sha256sum] =3D "b15813163c1d831bf4a13c3610c05c0d0=
3b39feb07f7e09fa234dac9b15aaf39"
> @@ -726,5 +726,5 @@ SRC_URI[zerofrom-derive-0.1.5.sha256sum] =3D "595eed9=
82f7d355beb85837f651fa22e90b3
>  SRC_URI[zeroize-1.8.1.sha256sum] =3D "ced3678a2879b30306d323f4542626697a=
464a97c0a07c9aebf7ebca65cd4dde"
>  SRC_URI[zerovec-0.10.4.sha256sum] =3D "aa2b893d79df23bfb12d5461018d408ea=
19dfafe76c2c7ef6d4eba614f8ff079"
>  SRC_URI[zerovec-derive-0.10.3.sha256sum] =3D "6eafa6dfb17584ea3e2bd6e76e=
0cc15ad7af12b09abdd1ca55961bed9b1063c6"
> -SRC_URI[zip-2.2.3.sha256sum] =3D "b280484c454e74e5fff658bbf7df8fdbe7a07c=
6b2de4a53def232c15ef138f3a"
> +SRC_URI[zip-2.3.0.sha256sum] =3D "84e9a772a54b54236b9b744aaaf8d7be01b4d6=
e99725523cb82cb32d1c81b1d7"
>  SRC_URI[zopfli-0.8.1.sha256sum] =3D "e5019f391bac5cf252e93bbcc53d039ffd6=
2c7bfb7c150414d61369afe57e946"
> diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-mor=
e-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/py=
thon/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linu=
x-g.patch
> deleted file mode 100644
> index aceefa7967e..00000000000
> --- a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl=
-codes-on-riscv32gc-unknown-linux-g.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 2001
> -From: Dan Gohman <dev@sunfishcode.online>
> -Date: Sun, 6 Apr 2025 05:22:49 -0700
> -Subject: [PATCH] Define Linux ioctl codes on more architectures.
> -
> -Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` using
> -`_IOR` and `_IOW` so that they're automatically supported on all
> -architectures, including riscv32gc-unknown-linux-gnu.
> -
> -Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4382/]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/unix/linux_like/linux/arch/generic/mod.rs | 75 ++++---------------
> - 1 file changed, 15 insertions(+), 60 deletions(-)
> -
> ---- a/src/unix/linux_like/linux/arch/generic/mod.rs
> -+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
> -@@ -1,5 +1,5 @@
> - use crate::prelude::*;
> --use crate::Ioctl;
> -+use crate::{Ioctl, _IOR, _IOW};
> -
> - s! {
> -     pub struct termios2 {
> -@@ -116,21 +116,8 @@ cfg_if! {
> - // pub const SO_PREFER_BUSY_POLL: c_int =3D 69;
> - // pub const SO_BUSY_POLL_BUDGET: c_int =3D 70;
> -
> --cfg_if! {
> --    if #[cfg(any(
> --        target_arch =3D "x86",
> --        target_arch =3D "x86_64",
> --        target_arch =3D "arm",
> --        target_arch =3D "aarch64",
> --        target_arch =3D "riscv64",
> --        target_arch =3D "s390x",
> --        target_arch =3D "csky",
> --        target_arch =3D "loongarch64"
> --    ))] {
> --        pub const FICLONE: c_ulong =3D 0x40049409;
> --        pub const FICLONERANGE: c_ulong =3D 0x4020940D;
> --    }
> --}
> -+pub const FICLONE: Ioctl =3D _IOW::<c_int>(0x94, 9) as Ioctl;
> -+pub const FICLONERANGE: Ioctl =3D _IOW::<crate::file_clone_range>(0x94,=
 13) as Ioctl;
> -
> - // Defined in unix/linux_like/mod.rs
> - // pub const SCM_TIMESTAMP: c_int =3D SO_TIMESTAMP;
> -@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl =3D 0x800454
> - pub const TUNSETSTEERINGEBPF: Ioctl =3D 0x800454e0;
> - pub const TUNSETFILTEREBPF: Ioctl =3D 0x800454e1;
> -
> --cfg_if! {
> --    // Those type are constructed using the _IOC macro
> --    // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN
> --    // where D stands for direction (either None (00), Read (01) or Wri=
te (11))
> --    // where S stands for size (int, long, struct...)
> --    // where T stands for type ('f','v','X'...)
> --    // where N stands for NR (NumbeR)
> --    if #[cfg(any(
> --        target_arch =3D "x86",
> --        target_arch =3D "arm",
> --        target_arch =3D "csky"
> --    ))] {
> --        pub const FS_IOC_GETFLAGS: Ioctl =3D 0x80046601;
> --        pub const FS_IOC_SETFLAGS: Ioctl =3D 0x40046602;
> --        pub const FS_IOC_GETVERSION: Ioctl =3D 0x80047601;
> --        pub const FS_IOC_SETVERSION: Ioctl =3D 0x40047602;
> --        pub const FS_IOC32_GETFLAGS: Ioctl =3D 0x80046601;
> --        pub const FS_IOC32_SETFLAGS: Ioctl =3D 0x40046602;
> --        pub const FS_IOC32_GETVERSION: Ioctl =3D 0x80047601;
> --        pub const FS_IOC32_SETVERSION: Ioctl =3D 0x40047602;
> --        pub const TUNATTACHFILTER: Ioctl =3D 0x400854d5;
> --        pub const TUNDETACHFILTER: Ioctl =3D 0x400854d6;
> --        pub const TUNGETFILTER: Ioctl =3D 0x800854db;
> --    } else if #[cfg(any(
> --        target_arch =3D "x86_64",
> --        target_arch =3D "riscv64",
> --        target_arch =3D "aarch64",
> --        target_arch =3D "s390x",
> --        target_arch =3D "loongarch64"
> --    ))] {
> --        pub const FS_IOC_GETFLAGS: Ioctl =3D 0x80086601;
> --        pub const FS_IOC_SETFLAGS: Ioctl =3D 0x40086602;
> --        pub const FS_IOC_GETVERSION: Ioctl =3D 0x80087601;
> --        pub const FS_IOC_SETVERSION: Ioctl =3D 0x40087602;
> --        pub const FS_IOC32_GETFLAGS: Ioctl =3D 0x80046601;
> --        pub const FS_IOC32_SETFLAGS: Ioctl =3D 0x40046602;
> --        pub const FS_IOC32_GETVERSION: Ioctl =3D 0x80047601;
> --        pub const FS_IOC32_SETVERSION: Ioctl =3D 0x40047602;
> --        pub const TUNATTACHFILTER: Ioctl =3D 0x401054d5;
> --        pub const TUNDETACHFILTER: Ioctl =3D 0x401054d6;
> --        pub const TUNGETFILTER: Ioctl =3D 0x801054db;
> --    }
> --}
> -+pub const FS_IOC_GETFLAGS: Ioctl =3D _IOR::<c_long>('f' as u32, 1) as I=
octl;
> -+pub const FS_IOC_SETFLAGS: Ioctl =3D _IOW::<c_long>('f' as u32, 2) as I=
octl;
> -+pub const FS_IOC_GETVERSION: Ioctl =3D _IOR::<c_long>('v' as u32, 1) as=
 Ioctl;
> -+pub const FS_IOC_SETVERSION: Ioctl =3D _IOW::<c_long>('v' as u32, 2) as=
 Ioctl;
> -+pub const FS_IOC32_GETFLAGS: Ioctl =3D _IOR::<c_int>('f' as u32, 1) as =
Ioctl;
> -+pub const FS_IOC32_SETFLAGS: Ioctl =3D _IOW::<c_int>('f' as u32, 2) as =
Ioctl;
> -+pub const FS_IOC32_GETVERSION: Ioctl =3D _IOR::<c_int>('v' as u32, 1) a=
s Ioctl;
> -+pub const FS_IOC32_SETVERSION: Ioctl =3D _IOW::<c_int>('v' as u32, 2) a=
s Ioctl;
> -+
> -+pub const TUNATTACHFILTER: Ioctl =3D _IOW::<crate::sock_fprog>('T' as u=
32, 213) as Ioctl;
> -+pub const TUNDETACHFILTER: Ioctl =3D _IOW::<crate::sock_fprog>('T' as u=
32, 214) as Ioctl;
> -+pub const TUNGETFILTER: Ioctl =3D _IOR::<crate::sock_fprog>('T' as u32,=
 219) as Ioctl;
> -
> - cfg_if! {
> -     if #[cfg(any(target_arch =3D "arm", target_arch =3D "s390x"))] {
> diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta=
/recipes-devtools/python/python3-maturin_1.8.3.bb
> deleted file mode 100644
> index 08975e177f0..00000000000
> --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -SUMMARY =3D "Build and publish crates with pyo3, rust-cpython, cffi bind=
ings and rust binaries as python packages"
> -HOMEPAGE =3D "https://github.com/pyo3/maturin"
> -SECTION =3D "devel/python"
> -LICENSE =3D "MIT | Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://license-apache;md5=3D1836efb2eb779966696f47=
3ee8540542 \
> -                    file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5=
c0797"
> -
> -SRC_URI +=3D "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-l=
inux-g.patch;patchdir=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
> -SRC_URI[sha256sum] =3D "304762f86fd53a8031b1bf006d12572a2aa0a52354850311=
13195cc0152e1e12"
> -
> -S =3D "${WORKDIR}/maturin-${PV}"
> -
> -CFLAGS +=3D "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/ca=
rgo_home"
> -
> -DEPENDS +=3D "\
> -    python3-setuptools-rust-native \
> -    python3-semantic-version-native \
> -    python3-setuptools-rust \
> -"
> -
> -require ${BPN}-crates.inc
> -
> -inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_bu=
ild_meta
> -
> -do_configure() {
> -    python_pyo3_do_configure
> -    cargo_common_do_configure
> -    python_pep517_do_configure
> -}
> -
> -RDEPENDS:${PN} +=3D "\
> -    cargo \
> -    python3-json \
> -    rust \
> -"
> -
> -RRECOMMENDS:${PN} +=3D "\
> -    python3-ensurepip \
> -    python3-pip \
> -    python3-venv \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb b/meta=
/recipes-devtools/python/python3-maturin_1.8.6.bb
> new file mode 100644
> index 00000000000..d7aa9fc99f0
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
> @@ -0,0 +1,405 @@
> +SUMMARY =3D "Build and publish crates with pyo3, rust-cpython, cffi bind=
ings and rust binaries as python packages"
> +HOMEPAGE =3D "https://github.com/pyo3/maturin"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT | Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://license-apache;md5=3D1836efb2eb779966696f47=
3ee8540542 \
> +                    file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5=
c0797"
> +
> +SRC_URI +=3D "crate://crates.io/adler2/2.0.0 \
> +           crate://crates.io/ahash/0.8.11 \
> +           crate://crates.io/aho-corasick/1.1.3 \
> +           crate://crates.io/allocator-api2/0.2.18 \
> +           crate://crates.io/anstream/0.6.14 \
> +           crate://crates.io/anstyle/1.0.7 \
> +           crate://crates.io/anstyle-parse/0.2.4 \
> +           crate://crates.io/anstyle-query/1.1.0 \
> +           crate://crates.io/anstyle-wincon/3.0.3 \
> +           crate://crates.io/anyhow/1.0.89 \
> +           crate://crates.io/arbitrary/1.4.1 \
> +           crate://crates.io/autocfg/1.3.0 \
> +           crate://crates.io/automod/1.0.14 \
> +           crate://crates.io/base64/0.21.7 \
> +           crate://crates.io/base64/0.22.1 \
> +           crate://crates.io/bitflags/1.3.2 \
> +           crate://crates.io/bitflags/2.5.0 \
> +           crate://crates.io/block-buffer/0.10.4 \
> +           crate://crates.io/boxcar/0.2.8 \
> +           crate://crates.io/bstr/1.10.0 \
> +           crate://crates.io/bumpalo/3.16.0 \
> +           crate://crates.io/byteorder/1.5.0 \
> +           crate://crates.io/bytes/1.9.0 \
> +           crate://crates.io/bytesize/1.3.0 \
> +           crate://crates.io/bzip2/0.5.2 \
> +           crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
> +           crate://crates.io/cab/0.6.0 \
> +           crate://crates.io/camino/1.1.9 \
> +           crate://crates.io/cargo-config2/0.1.26 \
> +           crate://crates.io/cargo-options/0.7.4 \
> +           crate://crates.io/cargo-platform/0.1.8 \
> +           crate://crates.io/cargo-xwin/0.18.4 \
> +           crate://crates.io/cargo-zigbuild/0.20.0 \
> +           crate://crates.io/cargo_metadata/0.19.0 \
> +           crate://crates.io/cbindgen/0.28.0 \
> +           crate://crates.io/cc/1.2.16 \
> +           crate://crates.io/cfb/0.10.0 \
> +           crate://crates.io/cfg-if/1.0.0 \
> +           crate://crates.io/charset/0.1.5 \
> +           crate://crates.io/chumsky/0.9.3 \
> +           crate://crates.io/clap/4.5.7 \
> +           crate://crates.io/clap_builder/4.5.7 \
> +           crate://crates.io/clap_complete/4.5.5 \
> +           crate://crates.io/clap_complete_command/0.6.1 \
> +           crate://crates.io/clap_complete_nushell/4.5.2 \
> +           crate://crates.io/clap_derive/4.5.5 \
> +           crate://crates.io/clap_lex/0.7.1 \
> +           crate://crates.io/cli-table/0.4.7 \
> +           crate://crates.io/colorchoice/1.0.1 \
> +           crate://crates.io/configparser/3.1.0 \
> +           crate://crates.io/console/0.15.8 \
> +           crate://crates.io/content_inspector/0.2.4 \
> +           crate://crates.io/core-foundation/0.9.4 \
> +           crate://crates.io/core-foundation-sys/0.8.6 \
> +           crate://crates.io/cpufeatures/0.2.12 \
> +           crate://crates.io/crc/3.2.1 \
> +           crate://crates.io/crc-catalog/2.4.0 \
> +           crate://crates.io/crc32fast/1.4.2 \
> +           crate://crates.io/crossbeam-channel/0.5.15 \
> +           crate://crates.io/crossbeam-deque/0.8.5 \
> +           crate://crates.io/crossbeam-epoch/0.9.18 \
> +           crate://crates.io/crossbeam-utils/0.8.20 \
> +           crate://crates.io/crypto-common/0.1.6 \
> +           crate://crates.io/data-encoding/2.6.0 \
> +           crate://crates.io/deranged/0.3.11 \
> +           crate://crates.io/derive_arbitrary/1.4.1 \
> +           crate://crates.io/dialoguer/0.11.0 \
> +           crate://crates.io/diff/0.1.13 \
> +           crate://crates.io/digest/0.10.7 \
> +           crate://crates.io/dirs/5.0.1 \
> +           crate://crates.io/dirs-sys/0.4.1 \
> +           crate://crates.io/displaydoc/0.2.5 \
> +           crate://crates.io/dissimilar/1.0.9 \
> +           crate://crates.io/dunce/1.0.5 \
> +           crate://crates.io/dyn-clone/1.0.17 \
> +           crate://crates.io/either/1.13.0 \
> +           crate://crates.io/encode_unicode/0.3.6 \
> +           crate://crates.io/encoding_rs/0.8.34 \
> +           crate://crates.io/equivalent/1.0.1 \
> +           crate://crates.io/errno/0.3.9 \
> +           crate://crates.io/expect-test/1.5.0 \
> +           crate://crates.io/fastrand/2.1.0 \
> +           crate://crates.io/fat-macho/0.4.9 \
> +           crate://crates.io/filetime/0.2.23 \
> +           crate://crates.io/flate2/1.0.33 \
> +           crate://crates.io/fnv/1.0.7 \
> +           crate://crates.io/foreign-types/0.3.2 \
> +           crate://crates.io/foreign-types-shared/0.1.1 \
> +           crate://crates.io/form_urlencoded/1.2.1 \
> +           crate://crates.io/fs-err/3.0.0 \
> +           crate://crates.io/fs4/0.12.0 \
> +           crate://crates.io/futures/0.3.30 \
> +           crate://crates.io/futures-channel/0.3.31 \
> +           crate://crates.io/futures-core/0.3.31 \
> +           crate://crates.io/futures-executor/0.3.30 \
> +           crate://crates.io/futures-io/0.3.31 \
> +           crate://crates.io/futures-macro/0.3.31 \
> +           crate://crates.io/futures-sink/0.3.31 \
> +           crate://crates.io/futures-task/0.3.31 \
> +           crate://crates.io/futures-timer/3.0.3 \
> +           crate://crates.io/futures-util/0.3.31 \
> +           crate://crates.io/generic-array/0.14.7 \
> +           crate://crates.io/getrandom/0.2.15 \
> +           crate://crates.io/glob/0.3.1 \
> +           crate://crates.io/globset/0.4.15 \
> +           crate://crates.io/goblin/0.9.2 \
> +           crate://crates.io/hashbrown/0.14.5 \
> +           crate://crates.io/hashbrown/0.15.2 \
> +           crate://crates.io/heck/0.4.1 \
> +           crate://crates.io/heck/0.5.0 \
> +           crate://crates.io/home/0.5.9 \
> +           crate://crates.io/humantime/2.1.0 \
> +           crate://crates.io/humantime-serde/1.1.1 \
> +           crate://crates.io/icu_collections/1.5.0 \
> +           crate://crates.io/icu_locid/1.5.0 \
> +           crate://crates.io/icu_locid_transform/1.5.0 \
> +           crate://crates.io/icu_locid_transform_data/1.5.0 \
> +           crate://crates.io/icu_normalizer/1.5.0 \
> +           crate://crates.io/icu_normalizer_data/1.5.0 \
> +           crate://crates.io/icu_properties/1.5.1 \
> +           crate://crates.io/icu_properties_data/1.5.0 \
> +           crate://crates.io/icu_provider/1.5.0 \
> +           crate://crates.io/icu_provider_macros/1.5.0 \
> +           crate://crates.io/idna/1.0.3 \
> +           crate://crates.io/idna_adapter/1.2.0 \
> +           crate://crates.io/ignore/0.4.23 \
> +           crate://crates.io/indexmap/2.6.0 \
> +           crate://crates.io/indicatif/0.17.9 \
> +           crate://crates.io/indoc/2.0.5 \
> +           crate://crates.io/is_terminal_polyfill/1.70.0 \
> +           crate://crates.io/itertools/0.12.1 \
> +           crate://crates.io/itertools/0.13.0 \
> +           crate://crates.io/itoa/1.0.11 \
> +           crate://crates.io/js-sys/0.3.73 \
> +           crate://crates.io/keyring/2.3.3 \
> +           crate://crates.io/lazy_static/1.4.0 \
> +           crate://crates.io/lddtree/0.3.7 \
> +           crate://crates.io/libc/0.2.167 \
> +           crate://crates.io/libmimalloc-sys/0.1.39 \
> +           crate://crates.io/libredox/0.1.3 \
> +           crate://crates.io/linux-keyutils/0.2.4 \
> +           crate://crates.io/linux-raw-sys/0.4.14 \
> +           crate://crates.io/litemap/0.7.3 \
> +           crate://crates.io/lock_api/0.4.12 \
> +           crate://crates.io/lockfree-object-pool/0.1.6 \
> +           crate://crates.io/log/0.4.22 \
> +           crate://crates.io/lzma-sys/0.1.20 \
> +           crate://crates.io/lzxd/0.2.5 \
> +           crate://crates.io/mailparse/0.15.0 \
> +           crate://crates.io/matchers/0.1.0 \
> +           crate://crates.io/memchr/2.7.4 \
> +           crate://crates.io/mimalloc/0.1.43 \
> +           crate://crates.io/mime/0.3.17 \
> +           crate://crates.io/mime_guess/2.0.4 \
> +           crate://crates.io/minijinja/2.5.0 \
> +           crate://crates.io/minimal-lexical/0.2.1 \
> +           crate://crates.io/miniz_oxide/0.8.0 \
> +           crate://crates.io/msi/0.8.0 \
> +           crate://crates.io/multipart/0.18.0 \
> +           crate://crates.io/native-tls/0.2.12 \
> +           crate://crates.io/nom/7.1.3 \
> +           crate://crates.io/normalize-line-endings/0.3.0 \
> +           crate://crates.io/normpath/1.2.0 \
> +           crate://crates.io/nu-ansi-term/0.46.0 \
> +           crate://crates.io/num-conv/0.1.0 \
> +           crate://crates.io/number_prefix/0.4.0 \
> +           crate://crates.io/once_cell/1.20.2 \
> +           crate://crates.io/openssl/0.10.72 \
> +           crate://crates.io/openssl-macros/0.1.1 \
> +           crate://crates.io/openssl-probe/0.1.5 \
> +           crate://crates.io/openssl-sys/0.9.107 \
> +           crate://crates.io/option-ext/0.2.0 \
> +           crate://crates.io/os_pipe/1.2.0 \
> +           crate://crates.io/overload/0.1.1 \
> +           crate://crates.io/parking_lot/0.12.3 \
> +           crate://crates.io/parking_lot_core/0.9.10 \
> +           crate://crates.io/paste/1.0.15 \
> +           crate://crates.io/path-slash/0.2.1 \
> +           crate://crates.io/pep440_rs/0.7.3 \
> +           crate://crates.io/pep508_rs/0.9.2 \
> +           crate://crates.io/percent-encoding/2.3.1 \
> +           crate://crates.io/pin-project-lite/0.2.15 \
> +           crate://crates.io/pin-utils/0.1.0 \
> +           crate://crates.io/pkg-config/0.3.30 \
> +           crate://crates.io/plain/0.2.3 \
> +           crate://crates.io/platform-info/2.0.3 \
> +           crate://crates.io/portable-atomic/1.6.0 \
> +           crate://crates.io/powerfmt/0.2.0 \
> +           crate://crates.io/ppv-lite86/0.2.17 \
> +           crate://crates.io/pretty_assertions/1.4.1 \
> +           crate://crates.io/proc-macro-crate/3.1.0 \
> +           crate://crates.io/proc-macro2/1.0.92 \
> +           crate://crates.io/psm/0.1.21 \
> +           crate://crates.io/pyproject-toml/0.13.4 \
> +           crate://crates.io/python-pkginfo/0.6.5 \
> +           crate://crates.io/quote/1.0.37 \
> +           crate://crates.io/quoted_printable/0.5.0 \
> +           crate://crates.io/rand/0.8.5 \
> +           crate://crates.io/rand_chacha/0.3.1 \
> +           crate://crates.io/rand_core/0.6.4 \
> +           crate://crates.io/rayon/1.10.0 \
> +           crate://crates.io/rayon-core/1.12.1 \
> +           crate://crates.io/redox_syscall/0.4.1 \
> +           crate://crates.io/redox_syscall/0.5.1 \
> +           crate://crates.io/redox_users/0.4.5 \
> +           crate://crates.io/regex/1.11.1 \
> +           crate://crates.io/regex-automata/0.1.10 \
> +           crate://crates.io/regex-automata/0.4.9 \
> +           crate://crates.io/regex-syntax/0.6.29 \
> +           crate://crates.io/regex-syntax/0.8.5 \
> +           crate://crates.io/relative-path/1.9.3 \
> +           crate://crates.io/rfc2047-decoder/1.0.6 \
> +           crate://crates.io/ring/0.17.13 \
> +           crate://crates.io/rstest/0.22.0 \
> +           crate://crates.io/rstest_macros/0.22.0 \
> +           crate://crates.io/rustc-hash/2.0.0 \
> +           crate://crates.io/rustc_version/0.4.1 \
> +           crate://crates.io/rustflags/0.1.6 \
> +           crate://crates.io/rustix/0.38.41 \
> +           crate://crates.io/rustls/0.23.19 \
> +           crate://crates.io/rustls-pemfile/2.1.3 \
> +           crate://crates.io/rustls-pki-types/1.10.0 \
> +           crate://crates.io/rustls-webpki/0.102.8 \
> +           crate://crates.io/rustversion/1.0.18 \
> +           crate://crates.io/ryu/1.0.18 \
> +           crate://crates.io/same-file/1.0.6 \
> +           crate://crates.io/schannel/0.1.23 \
> +           crate://crates.io/schemars/0.8.21 \
> +           crate://crates.io/schemars_derive/0.8.21 \
> +           crate://crates.io/scopeguard/1.2.0 \
> +           crate://crates.io/scroll/0.12.0 \
> +           crate://crates.io/scroll_derive/0.12.0 \
> +           crate://crates.io/security-framework/2.11.0 \
> +           crate://crates.io/security-framework-sys/2.11.0 \
> +           crate://crates.io/semver/1.0.23 \
> +           crate://crates.io/serde/1.0.217 \
> +           crate://crates.io/serde_derive/1.0.217 \
> +           crate://crates.io/serde_derive_internals/0.29.1 \
> +           crate://crates.io/serde_json/1.0.135 \
> +           crate://crates.io/serde_spanned/0.6.8 \
> +           crate://crates.io/sha2/0.10.8 \
> +           crate://crates.io/sharded-slab/0.1.7 \
> +           crate://crates.io/shell-words/1.1.0 \
> +           crate://crates.io/shlex/1.3.0 \
> +           crate://crates.io/simd-adler32/0.3.7 \
> +           crate://crates.io/similar/2.5.0 \
> +           crate://crates.io/slab/0.4.9 \
> +           crate://crates.io/smallvec/1.13.2 \
> +           crate://crates.io/smawk/0.3.2 \
> +           crate://crates.io/snapbox/0.6.16 \
> +           crate://crates.io/snapbox-macros/0.3.10 \
> +           crate://crates.io/socks/0.3.4 \
> +           crate://crates.io/stable_deref_trait/1.2.0 \
> +           crate://crates.io/stacker/0.1.15 \
> +           crate://crates.io/static_assertions/1.1.0 \
> +           crate://crates.io/strsim/0.11.1 \
> +           crate://crates.io/subtle/2.5.0 \
> +           crate://crates.io/syn/2.0.90 \
> +           crate://crates.io/synstructure/0.13.1 \
> +           crate://crates.io/tar/0.4.43 \
> +           crate://crates.io/target-lexicon/0.13.1 \
> +           crate://crates.io/tempfile/3.11.0 \
> +           crate://crates.io/termcolor/1.4.1 \
> +           crate://crates.io/terminal_size/0.3.0 \
> +           crate://crates.io/textwrap/0.16.1 \
> +           crate://crates.io/thiserror/1.0.69 \
> +           crate://crates.io/thiserror/2.0.3 \
> +           crate://crates.io/thiserror-impl/1.0.69 \
> +           crate://crates.io/thiserror-impl/2.0.3 \
> +           crate://crates.io/thread_local/1.1.8 \
> +           crate://crates.io/time/0.3.36 \
> +           crate://crates.io/time-core/0.1.2 \
> +           crate://crates.io/time-macros/0.2.18 \
> +           crate://crates.io/tinystr/0.7.6 \
> +           crate://crates.io/toml/0.8.19 \
> +           crate://crates.io/toml_datetime/0.6.8 \
> +           crate://crates.io/toml_edit/0.21.1 \
> +           crate://crates.io/toml_edit/0.22.22 \
> +           crate://crates.io/tracing/0.1.41 \
> +           crate://crates.io/tracing-attributes/0.1.28 \
> +           crate://crates.io/tracing-core/0.1.33 \
> +           crate://crates.io/tracing-log/0.2.0 \
> +           crate://crates.io/tracing-serde/0.2.0 \
> +           crate://crates.io/tracing-subscriber/0.3.19 \
> +           crate://crates.io/trycmd/0.15.6 \
> +           crate://crates.io/twox-hash/1.6.3 \
> +           crate://crates.io/typenum/1.17.0 \
> +           crate://crates.io/unicase/2.7.0 \
> +           crate://crates.io/unicode-ident/1.0.12 \
> +           crate://crates.io/unicode-linebreak/0.1.5 \
> +           crate://crates.io/unicode-width/0.1.13 \
> +           crate://crates.io/unicode-width/0.2.0 \
> +           crate://crates.io/unicode-xid/0.2.6 \
> +           crate://crates.io/unscanny/0.1.0 \
> +           crate://crates.io/untrusted/0.9.0 \
> +           crate://crates.io/ureq/2.11.0 \
> +           crate://crates.io/url/2.5.4 \
> +           crate://crates.io/urlencoding/2.1.3 \
> +           crate://crates.io/utf16_iter/1.0.5 \
> +           crate://crates.io/utf8_iter/1.0.4 \
> +           crate://crates.io/utf8parse/0.2.2 \
> +           crate://crates.io/uuid/1.8.0 \
> +           crate://crates.io/valuable/0.1.0 \
> +           crate://crates.io/vcpkg/0.2.15 \
> +           crate://crates.io/version-ranges/0.1.1 \
> +           crate://crates.io/version_check/0.9.4 \
> +           crate://crates.io/versions/6.2.0 \
> +           crate://crates.io/wait-timeout/0.2.0 \
> +           crate://crates.io/walkdir/2.5.0 \
> +           crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> +           crate://crates.io/wasm-bindgen/0.2.96 \
> +           crate://crates.io/wasm-bindgen-backend/0.2.96 \
> +           crate://crates.io/wasm-bindgen-macro/0.2.96 \
> +           crate://crates.io/wasm-bindgen-macro-support/0.2.96 \
> +           crate://crates.io/wasm-bindgen-shared/0.2.96 \
> +           crate://crates.io/web-time/1.1.0 \
> +           crate://crates.io/webpki-roots/0.26.2 \
> +           crate://crates.io/which/7.0.0 \
> +           crate://crates.io/wild/2.2.1 \
> +           crate://crates.io/winapi/0.3.9 \
> +           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +           crate://crates.io/winapi-util/0.1.8 \
> +           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +           crate://crates.io/windows-sys/0.48.0 \
> +           crate://crates.io/windows-sys/0.52.0 \
> +           crate://crates.io/windows-targets/0.48.5 \
> +           crate://crates.io/windows-targets/0.52.5 \
> +           crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> +           crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
> +           crate://crates.io/windows_aarch64_msvc/0.48.5 \
> +           crate://crates.io/windows_aarch64_msvc/0.52.5 \
> +           crate://crates.io/windows_i686_gnu/0.48.5 \
> +           crate://crates.io/windows_i686_gnu/0.52.5 \
> +           crate://crates.io/windows_i686_gnullvm/0.52.5 \
> +           crate://crates.io/windows_i686_msvc/0.48.5 \
> +           crate://crates.io/windows_i686_msvc/0.52.5 \
> +           crate://crates.io/windows_x86_64_gnu/0.48.5 \
> +           crate://crates.io/windows_x86_64_gnu/0.52.5 \
> +           crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> +           crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
> +           crate://crates.io/windows_x86_64_msvc/0.48.5 \
> +           crate://crates.io/windows_x86_64_msvc/0.52.5 \
> +           crate://crates.io/winnow/0.5.40 \
> +           crate://crates.io/winnow/0.6.20 \
> +           crate://crates.io/winsafe/0.0.19 \
> +           crate://crates.io/write16/1.0.0 \
> +           crate://crates.io/writeable/0.5.5 \
> +           crate://crates.io/xattr/1.3.1 \
> +           crate://crates.io/xwin/0.6.5 \
> +           crate://crates.io/xz2/0.1.7 \
> +           crate://crates.io/yansi/1.0.1 \
> +           crate://crates.io/yoke/0.7.4 \
> +           crate://crates.io/yoke-derive/0.7.5 \
> +           crate://crates.io/zerocopy/0.7.35 \
> +           crate://crates.io/zerocopy-derive/0.7.35 \
> +           crate://crates.io/zerofrom/0.1.4 \
> +           crate://crates.io/zerofrom-derive/0.1.5 \
> +           crate://crates.io/zeroize/1.8.1 \
> +           crate://crates.io/zerovec/0.10.4 \
> +           crate://crates.io/zerovec-derive/0.10.3 \
> +           crate://crates.io/zip/2.3.0 \
> +           crate://crates.io/zopfli/0.8.1 \
> +           "
> +SRC_URI[sha256sum] =3D "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8=
d0e61fa664b0289d"
> +
> +S =3D "${WORKDIR}/maturin-${PV}"
> +
> +CFLAGS +=3D "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/ca=
rgo_home"
> +
> +DEPENDS +=3D "\
> +    python3-setuptools-rust-native \
> +    python3-semantic-version-native \
> +    python3-setuptools-rust \
> +"
> +
> +require ${BPN}-crates.inc
> +
> +inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_bu=
ild_meta
> +
> +do_configure() {
> +    python_pyo3_do_configure
> +    cargo_common_do_configure
> +    python_pep517_do_configure
> +}
> +
> +RDEPENDS:${PN} +=3D "\
> +    cargo \
> +    python3-json \
> +    rust \
> +"
> +
> +RRECOMMENDS:${PN} +=3D "\
> +    python3-ensurepip \
> +    python3-pip \
> +    python3-venv \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217680): https://lists.openembedded.org/g/openembedde=
d-core/message/217680
> Mute This Topic: https://lists.openembedded.org/mt/113419172/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

