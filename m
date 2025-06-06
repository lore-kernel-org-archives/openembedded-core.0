Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93438C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 21:41:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.6293.1749246096950548374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 14:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZzYFgNGT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442fda876a6so21268095e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749246095; x=1749850895; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qkvtyH2iMevporBTTZJAl0XFFGCC9yV7msXb20+Q5rM=;
        b=ZzYFgNGTWpdCD1btkSlbjbCK5ND+gOy+Oig7Ig7jxMYwref9dZUHwMsaP1wTt1uwus
         uISzT7Rc+U1T39QnmW159+Tk4gMDDaM/Bn69Eeya8zDB4hJg4H3x6UIS3CHg0pdx/aU9
         KbADLim+7IT1+dIWMz6NDzNm4HgrcusL7nyV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749246095; x=1749850895;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkvtyH2iMevporBTTZJAl0XFFGCC9yV7msXb20+Q5rM=;
        b=ES07Btvx9q8auKgIlhom9r/HGRg+8SDdfNxMav4rQ4a4YCEuRgnkBARthp34cBWJFY
         9FANHLUIiUsrjKvx2/hOrrgHiYhRtmw3EtdbNVvvd0K5xU8kQ2ESttXDdOeox6FkGHJf
         0afmTeCR1LDiumtXqziNDF1TY/52P2Cgp6RpWDeeoBHhinESXkkF92uKPzj2aOghGfye
         RIKBX+gHOpTN3WiiV1zndApi+xhfNdGwpgh6pAqBe2/0EkpoFsPhH7H8+673boc2F63e
         UQS1SbLCtDOzluQQ3yqo4PvJKrX8vsFgcsnBARNXZIu6sru35FHxy9/Hq96Etwl3J1Dr
         cjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5KeaDbhir+GLPMJGDsJxJjyTMZguCjnZ45Q4d+4k8z21fMjjEAjtZXiL3i6kQNmGVzljmYbeuaR7MKBeAFeGuKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzz9jKM6QthlaWla9b2jn2FyGRNkDT3ppGrbGwqp1bFeQEvVi7Y
	rmaDnMs5snUz17TqZ0fITMEKcOk8xKwFy0rJBcIe07Vg6MVZ5RdDLv1Zfj/tEALycKx6/jCmgg2
	8x5m9bX8=
X-Gm-Gg: ASbGncs8heD1ZpDVBk81shNvBw7SEzuhRGauMWkzd0rxQTS2R4XKU7LNZBTh1SAC32d
	HZ4aE2U00apfBeu7L1FTz/YmX3DgUx11KMDG3iPS9MIJHEToU5hk2D4+KplqzRG61kTJl7QUx0a
	vCkJWWgMedBA5CU415NEDyE+TkH8sO8dyd6dNenYDp4mxl7d/avH/X02/MY9D+jV68tq7SR6oeu
	NHXgEdbmaHziCmuIis7ppWcyxab4Hrk1BR8BT5XWZWr0Mogj8Z32ILWFFBpuuI0ukmW33SvvJR3
	xTBgHDAEUmu71BGfIrDd2ECihqzag4tEgRpxjWBwjTkmcsC3c/2YOumm6/EpTpWvN0XD+nITf2H
	b3idxtUwzV1qW3Ulom8C4OpTGMwBKQSwo+LaFDUwO
X-Google-Smtp-Source: AGHT+IGXhG5kV/F0j1RZYcbv2jsUfZKnEf7iErwyWheUECz0QfB95vFKaJOKM8aCT3k04eME7sD0eA==
X-Received: by 2002:a05:600c:3849:b0:442:e147:bea7 with SMTP id 5b1f17b1804b1-452013fb12bmr52868895e9.29.1749246094900;
        Fri, 06 Jun 2025 14:41:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8f59:50ba:83a4:d366? ([2001:8b0:aba:5f3c:8f59:50ba:83a4:d366])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532131df6sm2895804f8f.0.2025.06.06.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 14:41:33 -0700 (PDT)
Message-ID: <12e748b05c76144d8a6c019a2954802dce15d3f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.85.1->1.86.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Fri, 06 Jun 2025 22:41:32 +0100
In-Reply-To: <20250606124816.365627-1-Yash.Shinde@windriver.com>
References: <20250606124816.365627-1-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 21:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218186

On Fri, 2025-06-06 at 05:48 -0700, Yash Shinde via lists.openembedded.org w=
rote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> * Add pkgconfig-native and openssl to resolve openssl-sys crate
> dependency on pkg-config. As per rust document this is a required depende=
ncy.
>=20
> Fixes:
> > error: failed to run custom build command for `openssl-sys v0.9.106`
> > Could not find openssl via pkg-config:
> > =C2=A0 The pkg-config command could not be found.
> >=20
> > =C2=A0 Most likely, you need to install a pkg-config package for your O=
S.
> > =C2=A0 Try `apt install pkg-config`, or `yum install pkg-config`,
> > =C2=A0 or `pkg install pkg-config`, or `apk add pkgconfig` depending on=
 your distribution
>=20
> https://crates.io/crates/openssl-sys/0.9.108/dependencies
> https://github.com/rust-lang/rust/blob/master/INSTALL.md#dependencies
>=20
> * Add Ninja as a dependency for building Rust to prevent bootstrap
> =C2=A0 build regression.
>=20
> Fixes:
> > Building LLD for x86_64-unknown-linux-gnu
> >=20
> > Couldn't find required command: ninja (or ninja-build)
> >=20
> > You should install ninja as described at
> > <https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages>,
> > or set `ninja =3D false` in the `[llvm]` section of `config.toml`.
> > Alternatively, set `download-ci-llvm =3D true` in that `[llvm]` section
> > to download LLVM rather than building it.
>=20
> * Add bash to DEPENDS to resolve missing dependency for subtree-sync.sh
> Fixes:
> ERROR: rust-1.86.0-r0 do_package_qa: QA Issue: /usr/lib/rustlib/src/rust/=
library/portable-simd/subtree-sync.sh
> contained in package rust requires /bin/bash, but no providers found in R=
DEPENDS:rust? [file-rdeps]
>=20
> * Add do_install:append() task to remove cargo bin from rust native build=
s.
> This resolves the following conflict:
>=20
> Fixes:
> ERROR: libstd-rs-1.86.0-r0 do_prepare_recipe_sysroot: The file /usr/bin/c=
argo is
> installed by both rust-native and cargo-native, aborting
>=20
> * Update Unicode-3.0 license checksums.
> License-Update: Copyright and license files to distributions are updated.
>=20
> https://github.com/rust-lang/rust/commit/f9c16997dc016a3ef1456f56df2ab564=
a1c48cb2
> =C2=A0 It adds copyright and license files (including HTML versions) to d=
istributions,
> =C2=A0 aligns with license compliance tools like reuse, and ensures all r=
equired
> =C2=A0 license texts are properly included and formatted.
>=20
> * Disable building of extended Rust tools to reduce build time and filesy=
stem usage.
> =C2=A0 Update config.toml to disable building of extended Rust tools that=
 are not required.
> =C2=A0 This helps minimize unnecessary build time and filesystem usage.
>=20
> * The "remote-test-server" bin is now generated in stage2-tools-bin dir
> =C2=A0 rather than stage1. Update the test suite accordingly.
>=20
> * Fix do_package QA issue by packing missing zsh files and directories:
>=20
> Fixes:
> do_package: QA Issue: rust: Files/directories were installed but not ship=
ped in any package:
> /usr/share/zsh
> /usr/share/zsh/site-functions
> /usr/share/zsh/site-functions/_cargo
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded,
> avoid installing them or delete them within do_install
>=20
> * Install "llvm-tblgen" from native-sysroot to recipe sysroot to handle
> =C2=A0 file not found error during rust builds:
>=20
> Fixes:
> /bin/sh: line 1:/home/poky/build/tmp/work/core2-64-poky-linux/rust/1.86.0=
/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-tblgen:
> No such file or directory
>=20
> > make[2]: *** [COFF/CMakeFiles/COFFOptionsTableGen.dir/build.make:120: C=
OFF/Options.inc] Error 127
> > make[1]: *** [CMakeFiles/Makefile2:630: COFF/CMakeFiles/COFFOptionsTabl=
eGen.dir/all] Error 2
> > make[1]: *** Waiting for unfinished jobs....
>=20
> * From v1.86.0, a "self-contained" LLD is built as part of rust
> =C2=A0bootstrap build. This results in additional build time and
> =C2=A0installations. Disable rust-lld in config.toml to prevent it.
>=20
> =C2=A0References: https://github.com/rust-lang/rust/pull/135001
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
https://github.com/rust-lang/rust/commit/8744b44e6bde053f7656a3c727c968177e=
e8e4b6
>=20
> * Drop Zdual-proc-macros-additional-check.patch patch
> =C2=A0since it's merged with v1.86.0
> =C2=A0https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad=
46fd5547bd4916
>=20
> * LTO config is applied to rustdoc from v1.86.0.
> =C2=A0Rebase 0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.pa=
tch
> =C2=A0which disables it to avoid suffixes in binaries causing non-reprodu=
cibility.
> =C2=A0https://github.com/rust-lang/rust/commit/1fe351b
>=20
> * Restrict tests using "//@only <target_arch>" to avoid failures on riscv=
64,
> =C2=A0 which is now part of default AB testing. Since riscv64 is Tier 2
> =C2=A0 with no automated testing, some tests may fail. This approach ensu=
res tests continue
> =C2=A0 running on supported architectures while skipping them on riscv64.
> =C2=A0 https://doc.rust-lang.org/rustc/platform-support.html#tier-2-with-=
host-tools
>=20
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
> =C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.bb} |=C2=A0 0
> =C2=A0...l-codes-on-riscv32gc-unknown-linux-g.patch | 32 -------
> =C2=A0...teps-tool.rs-switch-off-lto-for-rust.patch | 54 +++++++++---
> =C2=A0.../Zdual-proc-macros-additional-check.patch=C2=A0 | 31 -------
> =C2=A0.../rust/files/rust-oe-selftest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 85 +++++++++++--------
> =C2=A0...ibstd-rs_1.85.1.bb =3D> libstd-rs_1.86.0.bb} |=C2=A0 2 +-
> =C2=A0....85.1.bb =3D> rust-cross-canadian_1.86.0.bb} |=C2=A0 0
> =C2=A0...ust-llvm_1.85.1.bb =3D> rust-llvm_1.86.0.bb} |=C2=A0 4 +-
> =C2=A0meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0 | 78 ++++++++---=
------
> =C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
> =C2=A0.../rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb}=C2=A0=C2=A0 | 20 ++++=
-
> =C2=A013 files changed, 154 insertions(+), 159 deletions(-)
> =C2=A0rename meta/recipes-devtools/rust/{cargo_1.85.1.bb =3D> cargo_1.86.=
0.bb} (100%)
> =C2=A0delete mode 100644 meta/recipes-devtools/rust/files/Zdual-proc-macr=
os-additional-check.patch
> =C2=A0rename meta/recipes-devtools/rust/{libstd-rs_1.85.1.bb =3D> libstd-=
rs_1.86.0.bb} (95%)
> =C2=A0rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.1.bb =
=3D> rust-cross-canadian_1.86.0.bb} (100%)
> =C2=A0rename meta/recipes-devtools/rust/{rust-llvm_1.85.1.bb =3D> rust-ll=
vm_1.86.0.bb} (96%)
> =C2=A0rename meta/recipes-devtools/rust/{rust_1.85.1.bb =3D> rust_1.86.0.=
bb} (94%)

Thanks Yash, this is definitely moving in the right direction.
Unfortunately there was one issue that showed up during testing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1788

Cheers,

Richard


