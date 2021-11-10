Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90117C4332F
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 22:11:19 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.2293.1636582278663840621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 14:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EU6GoEMt;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id r8so3989747qkp.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 14:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D8xeWCJDRmA6s0HZRm1D3J635R93sab2EL49Yk+rXjg=;
        b=EU6GoEMtwTeopDbc6l6GkCWvfiCGGBb+2Yau3nN9H3LC7SnRukT+87mbQZUdZhU+05
         lw8TvudJ6BxbD0h/cv+IDS7fl/+1dgqEWmNp2Z3CeO+oOF9XGVnqn98vDsWlOdrL6Zmj
         5RgW8jWjlYoh06m33ECnsWm+9bVTTd4WhQ+4FtFCLWGyAcFHMnTy7Adi3KzztOFz/zvI
         F2XPieBLBdIDhkCTzcSQOHJYJgJRFL6XcgDAvu6gecByNnITW5CMgLYNm/LKtcIutldj
         apMPixSgYNi/OgA+Ci6BkwquR66CqZiUGowCrwsnw2QWPt7LgqAh7McZ6aU9pj+h5wYC
         yOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D8xeWCJDRmA6s0HZRm1D3J635R93sab2EL49Yk+rXjg=;
        b=FGmaNcZA4TKrZFxII1eaoJWrXtyjpNpxNkM4CyzOsEyxuHCUhOd7J05EzF2lH3zLZE
         GNJ/tRaYb3o1fvTKBEtV6p4vnmSo2Fqmqy1eygBqo7yPRYwJyuZkBaH+DLePBZErwI09
         4hxUFDxXYqXJBnwL73P8+uMvFG1uwsJ2n1820kMUs1inG+Yn88pWyZHXvU46Dd0b6fM4
         vqKtCpEhYivLpkgAv6STBK2B0W3nMTcd+rFFHRv9N2X71nDWSHuYR4pzYAjosXdw3aCQ
         0FtaenlFHAPLwrmBv0h5bAh7IhCMos28WBc+3/YD2iY+IXcOXQYK+x22ePq+93kLAAjp
         ZC0A==
X-Gm-Message-State: AOAM530o6KvoTxuRLW0If+HS1C2IKL2J59dWdEHtW/46PAu4FKym9m63
	YcmBsEEPTN771RIwl7dj6i+xpRen5zBKjCWj84U=
X-Google-Smtp-Source: 
 ABdhPJxFy5SzRwWyglQbzdhoYpXLW+0KPuzZpmRrfcHHly9GV21tQazgKNqWoBd1yX7kH3K2UjUA1u9zKGopbzbXKeM=
X-Received: by 2002:ae9:dc84:: with SMTP id
 q126mr2420919qkf.128.1636582277505;
 Wed, 10 Nov 2021 14:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20211110193937.2606747-1-alex@linutronix.de>
 <20211110193937.2606747-6-alex@linutronix.de>
In-Reply-To: <20211110193937.2606747-6-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Nov 2021 14:10:51 -0800
Message-ID: 
 <CAMKF1sq1ufM=pGSCMBkAcGh4eau07VJrojpOYPDb0m+eH08SJw@mail.gmail.com>
Subject: Re: [PATCH 06/24] rust: update 1.56.0 -> 1.56.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 22:11:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158114

On Wed, Nov 10, 2021 at 11:39 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This update includes fixes for the 'trojan source' vulnerability:
> https://blog.rust-lang.org/2021/11/01/Rust-1.56.1.html
>
> Drop two unused patches.

this is fine, these patches are already upstreamed in rust compiler. I
think some portion of it is still required for rv32/musl
standard library but it will be a different patch. So its fine to delete th=
em.

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  ...56.0.bb =3D> cargo-cross-canadian_1.56.1.bb} |  0
>  .../{cargo_1.56.0.bb =3D> cargo_1.56.1.bb}      |  0
>  .../rust/files/riscv-march.patch              | 73 -------------------
>  meta/recipes-devtools/rust/files/rv64gc.patch | 37 ----------
>  ...ibstd-rs_1.56.0.bb =3D> libstd-rs_1.56.1.bb} |  0
>  ....56.0.bb =3D> rust-cross-canadian_1.56.1.bb} |  0
>  ...t-cross_1.56.0.bb =3D> rust-cross_1.56.1.bb} |  0
>  ...-llvm-allow-env-override-of-exe-path.patch |  1 +
>  ...ust-llvm_1.56.0.bb =3D> rust-llvm_1.56.1.bb} |  0
>  meta/recipes-devtools/rust/rust-snapshot.inc  | 16 ++--
>  meta/recipes-devtools/rust/rust-source.inc    |  2 +-
>  ...bb =3D> rust-tools-cross-canadian_1.56.1.bb} |  0
>  .../rust/{rust_1.56.0.bb =3D> rust_1.56.1.bb}   |  0
>  14 files changed, 11 insertions(+), 120 deletions(-)
>  rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.56.0.bb =3D> =
cargo-cross-canadian_1.56.1.bb} (100%)
>  rename meta/recipes-devtools/cargo/{cargo_1.56.0.bb =3D> cargo_1.56.1.bb=
} (100%)
>  delete mode 100644 meta/recipes-devtools/rust/files/riscv-march.patch
>  delete mode 100644 meta/recipes-devtools/rust/files/rv64gc.patch
>  rename meta/recipes-devtools/rust/{libstd-rs_1.56.0.bb =3D> libstd-rs_1.=
56.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.56.0.bb =3D> ru=
st-cross-canadian_1.56.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross_1.56.0.bb =3D> rust-cross_=
1.56.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.56.0.bb =3D> rust-llvm_1.=
56.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.56.0.bb =
=3D> rust-tools-cross-canadian_1.56.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.56.0.bb =3D> rust_1.56.1.bb} (=
100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 609f2fd0eb..d5167ee9ad 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -27,7 +27,7 @@ GOVERSION ?=3D "1.16%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to=
 denote
>  # llvm version being used, so always bump it with llvm recipe version bu=
mp
>  LLVMVERSION ?=3D "12.0.1"
> -RUSTVERSION ?=3D "1.56.0"
> +RUSTVERSION ?=3D "1.56.1"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.0.bb b=
/meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.0.bb
> rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.1.bb
> diff --git a/meta/recipes-devtools/cargo/cargo_1.56.0.bb b/meta/recipes-d=
evtools/cargo/cargo_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cargo/cargo_1.56.0.bb
> rename to meta/recipes-devtools/cargo/cargo_1.56.1.bb
> diff --git a/meta/recipes-devtools/rust/files/riscv-march.patch b/meta/re=
cipes-devtools/rust/files/riscv-march.patch
> deleted file mode 100644
> index a10b3a4d93..0000000000
> --- a/meta/recipes-devtools/rust/files/riscv-march.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -Add suppor for riscv64 and riscv32 musl targets
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/vendor/cc/src/lib.rs
> -+++ b/vendor/cc/src/lib.rs
> -@@ -2361,6 +2361,7 @@ impl Build {
> -                 "riscv-none-embed",
> -             ]),
> -             "riscv64gc-unknown-linux-gnu" =3D> Some("riscv64-linux-gnu"=
),
> -+            "riscv64gc-unknown-linux-musl" =3D> Some("riscv64-linux-mus=
l"),
> -             "s390x-unknown-linux-gnu" =3D> Some("s390x-linux-gnu"),
> -             "sparc-unknown-linux-gnu" =3D> Some("sparc-linux-gnu"),
> -             "sparc64-unknown-linux-gnu" =3D> Some("sparc64-linux-gnu"),
> ---- a/compiler/rustc_target/src/spec/mod.rs
> -+++ b/compiler/rustc_target/src/spec/mod.rs
> -@@ -641,9 +641,11 @@ supported_targets! {
> -     ("riscv32imc-unknown-none-elf", riscv32imc_unknown_none_elf),
> -     ("riscv32imac-unknown-none-elf", riscv32imac_unknown_none_elf),
> -     ("riscv32gc-unknown-linux-gnu", riscv32gc_unknown_linux_gnu),
> -+    ("riscv32gc-unknown-linux-musl", riscv32gc_unknown_linux_musl),
> -     ("riscv64imac-unknown-none-elf", riscv64imac_unknown_none_elf),
> -     ("riscv64gc-unknown-none-elf", riscv64gc_unknown_none_elf),
> -     ("riscv64gc-unknown-linux-gnu", riscv64gc_unknown_linux_gnu),
> -+    ("riscv64gc-unknown-linux-musl", riscv64gc_unknown_linux_musl),
> -
> -     ("aarch64-unknown-none", aarch64_unknown_none),
> -     ("aarch64-unknown-none-softfloat", aarch64_unknown_none_softfloat),
> ---- /dev/null
> -+++ b/compiler/rustc_target/src/spec/riscv32gc_unknown_linux_musl.rs
> -@@ -0,0 +1,19 @@
> -+use crate::spec::{CodeModel, Target, TargetOptions};
> -+
> -+pub fn target() -> Target {
> -+    Target {
> -+        llvm_target: "riscv32-unknown-linux-musl".to_string(),
> -+        pointer_width: 32,
> -+        data_layout: "e-m:e-p:32:32-i64:64-n32-S128".to_string(),
> -+        arch: "riscv32".to_string(),
> -+        options: TargetOptions {
> -+            unsupported_abis: super::riscv_base::unsupported_abis(),
> -+            code_model: Some(CodeModel::Medium),
> -+            cpu: "generic-rv32".to_string(),
> -+            features: "+m,+a,+f,+d,+c".to_string(),
> -+            llvm_abiname: "ilp32d".to_string(),
> -+            max_atomic_width: Some(32),
> -+            ..super::linux_musl_base::opts()
> -+        },
> -+    }
> -+}
> ---- /dev/null
> -+++ b/compiler/rustc_target/src/spec/riscv64gc_unknown_linux_musl.rs
> -@@ -0,0 +1,19 @@
> -+use crate::spec::{CodeModel, Target, TargetOptions};
> -+
> -+pub fn target() -> Target {
> -+    Target {
> -+        llvm_target: "riscv64-unknown-linux-musl".to_string(),
> -+        pointer_width: 64,
> -+        data_layout: "e-m:e-p:64:64-i64:64-i128:128-n64-S128".to_string=
(),
> -+        arch: "riscv64".to_string(),
> -+        options: TargetOptions {
> -+            unsupported_abis: super::riscv_base::unsupported_abis(),
> -+            code_model: Some(CodeModel::Medium),
> -+            cpu: "generic-rv64".to_string(),
> -+            features: "+m,+a,+f,+d,+c".to_string(),
> -+            llvm_abiname: "lp64d".to_string(),
> -+            max_atomic_width: Some(64),
> -+            ..super::linux_musl_base::opts()
> -+        },
> -+    }
> -+}
> diff --git a/meta/recipes-devtools/rust/files/rv64gc.patch b/meta/recipes=
-devtools/rust/files/rv64gc.patch
> deleted file mode 100644
> index aab1e18453..0000000000
> --- a/meta/recipes-devtools/rust/files/rv64gc.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> ---- a/vendor/cc-1.0.60/.cargo-checksum.json
> -+++ b/vendor/cc-1.0.60/.cargo-checksum.json
> -@@ -1 +1 @@
> --{"files":{"Cargo.lock":"30b9e23f97015aea3eed3e17c6d76d565c2924efec8bdae=
64c899080847afe89","Cargo.toml":"f6f22b69df3df57c58373cdee72b22218ffa030bc3=
75b36632660037dd72c866","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"51405d284d2e0620db62c65=
5c652fc0ec84f20c1cb30529227355c9575a9e6dd","src/bin/gcc-shim.rs":"b77907875=
029494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bcda=
f1c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs":=
"903c5f2f5dd0cc7d04f99f605a95e6abde8b38156fd4e73eefc58493f55a4e5a","src/reg=
istry.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff5d=
","src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b2237=
982d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b19=
a8d757c48ea7ca0881c50c","src/windows_registry.rs":"52afe8554f577c87841c48dd=
ee3ba7ffe70a00129e1d6eeb2ec0efb3d2b9aa11","tests/cc_env.rs":"e02b3b0824ad03=
9b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57f0=
6eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxfla=
gs.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371","=
tests/support/mod.rs":"16274867f23871e9b07614eda4c7344da13d1751fed63d4f6338=
57e40be86394","tests/test.rs":"65c073e0e2cf4aa0433066102788e9f57442719e6f32=
f5ad5248aa7132bb4597"},"package":"ef611cc68ff783f18535d77ddd080185275713d85=
2c4f5cbb6122c462a7a825c"}
> -\ No newline at end of file
> -+{"files":{"Cargo.lock":"30b9e23f97015aea3eed3e17c6d76d565c2924efec8bdae=
64c899080847afe89","Cargo.toml":"f6f22b69df3df57c58373cdee72b22218ffa030bc3=
75b36632660037dd72c866","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"51405d284d2e0620db62c65=
5c652fc0ec84f20c1cb30529227355c9575a9e6dd","src/bin/gcc-shim.rs":"b77907875=
029494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bcda=
f1c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs":=
"2788af2bdf425f267b33bc524f3e627851b52422e38f480a7e39eb834264fd73","src/reg=
istry.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff5d=
","src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b2237=
982d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b19=
a8d757c48ea7ca0881c50c","src/windows_registry.rs":"52afe8554f577c87841c48dd=
ee3ba7ffe70a00129e1d6eeb2ec0efb3d2b9aa11","tests/cc_env.rs":"e02b3b0824ad03=
9b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57f0=
6eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxfla=
gs.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371","=
tests/support/mod.rs":"16274867f23871e9b07614eda4c7344da13d1751fed63d4f6338=
57e40be86394","tests/test.rs":"65c073e0e2cf4aa0433066102788e9f57442719e6f32=
f5ad5248aa7132bb4597"},"package":"ef611cc68ff783f18535d77ddd080185275713d85=
2c4f5cbb6122c462a7a825c"}
> ---- a/vendor/cc-1.0.60/src/lib.rs
> -+++ b/vendor/cc-1.0.60/src/lib.rs
> -@@ -1639,14 +1639,17 @@ impl Build {
> -                     let mut parts =3D target.split('-');
> -                     if let Some(arch) =3D parts.next() {
> -                         let arch =3D &arch[5..];
> --                        cmd.args.push(("-march=3Drv".to_owned() + arch)=
.into());
> -                         if target.contains("linux") && arch.starts_with=
("64") {
> -+                            cmd.args.push(("-march=3Drv64gc").into());
> -                             cmd.args.push("-mabi=3Dlp64d".into());
> -                         } else if target.contains("linux") && arch.star=
ts_with("32") {
> -+                            cmd.args.push(("-march=3Drv32gc").into());
> -                             cmd.args.push("-mabi=3Dilp32d".into());
> -                         } else if arch.starts_with("64") {
> -+                            cmd.args.push(("-march=3Drv".to_owned() + a=
rch).into());
> -                             cmd.args.push("-mabi=3Dlp64".into());
> -                         } else {
> -+                            cmd.args.push(("-march=3Drv".to_owned() + a=
rch).into());
> -                             cmd.args.push("-mabi=3Dilp32".into());
> -                         }
> -                         cmd.args.push("-mcmodel=3Dmedany".into());
> -@@ -2332,6 +2335,9 @@ impl Build {
> -                 "riscv-none-embed",
> -             ]),
> -             "riscv64gc-unknown-linux-gnu" =3D> Some("riscv64-linux-gnu"=
),
> -+            "riscv32gc-unknown-linux-gnu" =3D> Some("riscv32-linux-gnu"=
),
> -+            "riscv64gc-unknown-linux-musl" =3D> Some("riscv64-linux-mus=
l"),
> -+            "riscv32gc-unknown-linux-musl" =3D> Some("riscv32-linux-mus=
l"),
> -             "s390x-unknown-linux-gnu" =3D> Some("s390x-linux-gnu"),
> -             "sparc-unknown-linux-gnu" =3D> Some("sparc-linux-gnu"),
> -             "sparc64-unknown-linux-gnu" =3D> Some("sparc64-linux-gnu"),
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.56.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.56.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.56.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.56.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.56.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.56.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross_1.56.0.bb b/meta/recip=
es-devtools/rust/rust-cross_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross_1.56.0.bb
> rename to meta/recipes-devtools/rust/rust-cross_1.56.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-ove=
rride-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-al=
low-env-override-of-exe-path.patch
> index 943c2118bb..9be26677a9 100644
> --- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
> +++ b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
> @@ -8,6 +8,7 @@ return the libraries, include directories, etc. from insi=
de the sysroot rather
>  than from the native sysroot. Thus provide an env override for calling
>  llvm-config from a target sysroot.
>
> +Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Martin Kelly <mkelly@xevo.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.56.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.56.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.56.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-=
devtools/rust/rust-snapshot.inc
> index 18e98d70a0..3418a2e0ba 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -2,17 +2,17 @@
>  ## snapshot info is taken from rust/src/stage0.txt
>  ## TODO: find a way to add additional SRC_URIs based on the contents of =
an
>  ##       earlier SRC_URI.
> -RS_VERSION =3D "1.56.0"
> -CARGO_VERSION =3D "1.56.0"
> +RS_VERSION =3D "1.56.1"
> +CARGO_VERSION =3D "1.56.1"
>
>  # TODO: Add hashes for other architecture toolchains as well. Make a scr=
ipt?
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "f693e4f41a959d62528e004=
3b0b010c4815fb9f5887267ae34ff8b860f8ec4ae"
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "2a5f919e2036496c02ab4707a5=
eb8bd8a4ce6ea589e01cb39f25d213a26dcdfe"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f972125810d2db7df2e0af56d9=
f6a3dcdacc52d983bdf0ca17309b45fc44209b"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "b01011cbb5503c456ecc6a5=
57a38e099994b8497df545c661ce8fd48c5beadc6"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a7001d1218b62d377cab15522d=
1b1c376b073c05f7d0ff32cf278871a5eeda3d"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "dfed65a50e2b58b6807c1fb6f8=
afa7abd5c3b22c682d505721d615823687c708"
>
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "3cd1c69c618e5efaf578a1=
56c2a950c93964f9b47ba4d705d5700bdc64880231"
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "0d2491a59f697d2ea52fc429b=
8d4665acb5f79b0e16703f3604b61b8aa68d1c4"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "9d97cd655845572846c058577=
f68ea74b6111f8ea7649db308f786475f764a09"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "a83416d15354e4dfa1c1e4=
a756282c6be7169679f2b04eca82ed34e2116b93f0"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "77aec6a8c5f3d33941c79a48c=
da3bb08878c23dd1947dc027dfe5c4da41305b3"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "3d263eb1871b5d6ca4b198b96=
11925923e9353e1f5c2becf8c7b784298e88743"
>
>  SRC_URI +=3D " \
>      https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=
=3Drust-std-snapshot-${BUILD_ARCH};subdir=3Drust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index 326a592544..e197604716 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -1,5 +1,5 @@
>  SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;n=
ame=3Drust"
> -SRC_URI[rust.sha256sum] =3D "f13468889833c88e744ad579c5d8fbb7ecb53216159=
b54481a90e5dcdaa9e320"
> +SRC_URI[rust.sha256sum] =3D "61fdcc8bc2530ee18f91318347e09b7cc07e9ca04b1=
c627c135ecc8dcb8f2ac5"
>
>  RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
>
> diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.0.=
bb b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.0.b=
b
> rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.1.bb
> diff --git a/meta/recipes-devtools/rust/rust_1.56.0.bb b/meta/recipes-dev=
tools/rust/rust_1.56.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.56.0.bb
> rename to meta/recipes-devtools/rust/rust_1.56.1.bb
> --
> 2.20.1
>

