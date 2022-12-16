Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EDBC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 12:06:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.11231.1671192405276752747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 04:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TkcPIXTa;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h16so2240546wrz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 04:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/V8P+SZLNR0GNuFBNqUhJnc1I19CTHgeB9I0hb9Rvw=;
        b=TkcPIXTaW49YKilRTLKBWcnhv0rbtVcp2hy3V73iTLNMcd1J7QB53CFZHGTTkVHk6s
         ZKJbzEwLVO5WyN0rFYRiTr8lbDF5GP0lznmtSMohixD+eoxw6CW/lVXqKHmftLcr6UQ6
         e0nChB7zCZpsQbW2yWQT7NZD7COntwlfCJnolWFV//5XUbRnozReNjBUo3v+EQildYap
         aR5YlUMxBRmr+BB4FAVxNKdza2oRIHudQokGZmNnPhmqxF4+WCCLJI3Fp2OwTxNrM0MV
         z4o4obqw/j102n/xrHn126w9XcVql9DivT2fswvqLN2q2BxiJ8uW+gmg1eiSE676olJ5
         U+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/V8P+SZLNR0GNuFBNqUhJnc1I19CTHgeB9I0hb9Rvw=;
        b=bS56V1FO7G6BnokVYOo/V5oM0Iw9vac6dV1JuGdzqcIiZvkx7dWUVx2zvpqunvyuqQ
         Fnp9BPlE1onyqs5uzAAjqjcB8vhYaPKWinVeCHRc31OY8c+wnJZUHUUswPJnXQRxaupy
         katCujcSqS4hDYuE8m+JJcPeHdKxfCa9QZToCry+movf4n6yFEocmOKZRUlnW50j261K
         1cLhmgRoFqdtGoomi2aCKqOHcCPzEVylj8WRLdzH/uKiCfx/Hus4hhsbSI9mGgLxafoy
         tzOyL0GGDfIlL0xbT4viCsB9XKlVpSNqAVr9Yn0uISrlncqcY2PGSgyY7/tdtMbxFsG3
         KugQ==
X-Gm-Message-State: ANoB5pmETPi87i4tqUZ0tFE0xTd+JMHHoLPqp+qzXH8BOyg8V5nfIDIO
	e+/v/mT6BAOCKbKRpSxZZu3SLvEWHC8=
X-Google-Smtp-Source: AA0mqf7WGsWZGCluQXWDMkXuh//4IMqA3rTKnULzwhGrkQUCypHtPzc8ADuPUD9g01qI9izUXruz+g==
X-Received: by 2002:adf:e3cb:0:b0:242:1e0a:318c with SMTP id k11-20020adfe3cb000000b002421e0a318cmr21159096wrm.47.1671192402552;
        Fri, 16 Dec 2022 04:06:42 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bt19-20020a056000081300b002302dc43d77sm2074661wrb.115.2022.12.16.04.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 04:06:41 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] rust: update 1.65.0 -> 1.66.0
Date: Fri, 16 Dec 2022 12:06:32 +0000
Message-Id: <20221216120632.5804-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216120632.5804-1-alex.kiernan@gmail.com>
References: <20221216120632.5804-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 12:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174742

Drop backported patch ENOTSUP constant for riscv32/musl.

Release notes:
  https://blog.rust-lang.org/2022/12/15/Rust-1.66.0.html

License-Update: Upstream has added Unicode Terms of Use license
  (Unicode-TOU).
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../{cargo_1.65.0.bb =3D> cargo_1.66.0.bb}      |  0
 meta/recipes-devtools/rust/libstd-rs.inc      |  4 +--
 ...ibstd-rs_1.65.0.bb =3D> libstd-rs_1.66.0.bb} |  0
 ....65.0.bb =3D> rust-cross-canadian_1.66.0.bb} |  0
 ...ust-llvm_1.65.0.bb =3D> rust-llvm_1.66.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 22 ++++++-------
 meta/recipes-devtools/rust/rust-source.inc    |  5 ++-
 meta/recipes-devtools/rust/rust.inc           |  4 +--
 ...dd-ENOTSUP-constant-for-riscv32-musl.patch | 32 -------------------
 .../rust/rust/crossbeam_atomic.patch          | 28 ++++++++--------
 .../rust/rust/hardcodepaths.patch             | 14 ++++----
 .../rust/{rust_1.65.0.bb =3D> rust_1.66.0.bb}   |  0
 13 files changed, 39 insertions(+), 72 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo_1.65.0.bb =3D> cargo_1.66.0.bb} =
(100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.65.0.bb =3D> libstd-rs_1.66=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.65.0.bb =3D> rust=
-cross-canadian_1.66.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.65.0.bb =3D> rust-llvm_1.66=
.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-consta=
nt-for-riscv32-musl.patch
 rename meta/recipes-devtools/rust/{rust_1.65.0.bb =3D> rust_1.66.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 4345701443c2..6f9a68a900f7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "15.0.4"
-RUSTVERSION ?=3D "1.65%"
+RUSTVERSION ?=3D "1.66%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo_1.65.0.bb b/meta/recipes-dev=
tools/cargo/cargo_1.66.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.65.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.66.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtoo=
ls/rust/libstd-rs.inc
index d49383ced58d..44cf683837db 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -1,8 +1,8 @@
 SUMMARY =3D "Rust standard libaries"
 HOMEPAGE =3D "http://www.rust-lang.org"
 SECTION =3D "devel"
-LICENSE =3D "MIT | Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D93a95682d51b4cb0a633a97=
046940ef0"
+LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"
+LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D92289ed52a60b63ab715612=
ad2915603"
=20
 RUSTLIB_DEP =3D ""
 inherit cargo
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.65.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.66.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.65.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.65.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.66.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.65.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.66.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.65.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.66.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.65.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 2f9cdb956661..222f34f9a889 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -5,21 +5,21 @@
 ## The version is replicated here.
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.64.0"
-CARGO_VERSION =3D "1.64.0"
+RS_VERSION =3D "1.65.0"
+CARGO_VERSION =3D "1.65.0"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "6ace34bcbba9557aa2fc3a051=
5c3da4a83ca24d7d45506c5e1b32f589fa38a8b"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "1f5756a03119853b53358018c5b1=
592940a2354c3c9f84ee7faf684e3478f8f0"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "21434d83a30ad3fa4e4831487c55=
74a20b07dd57d213b26e1246290c57d4ec41"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2b588cd2d49688c0c33b74666=
14123e8fe4c910f4d802fc0ff0662b1772816a9"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "62b89786e195fc5a8a262f83118d=
6689832b24228c9d303cba8ac14dc1e9adc8"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "82547aacaf42fc3c2970ec31b967=
51dfbeba3dffe1a042a3780bd670c29a89bf"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "40abc9ec4f86ff0e37ba176e=
4c68dfa708e9857bb0372169c865367593127566"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "8f10b379bcc8caaab983b7d04a3=
f105dae42f95718f231b46d7e68685d239191"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "103d69e4f2f49f5a6309d7d1957=
47b31f94cf707f90fb49cf76039a5ce6295c7"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "735b681c8a6e60925c76d6cc=
899e78b4cb4562ada24a1f265b2021c1faad78ad"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "67c3d3545fd898c1383071c0f62=
96453565e0da10903c50652d7bf679b53e8a2"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "3fd483c0d58673ab69862824408=
c8a48612827ddcdeaaca0f8fbe5ca02214a4c"
=20
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "ef697469b2a3ea8897f4=
9b70e3be0c7aaca3f26fd3234812113e2e85cafac738"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "11630fc51fffe722e52f649=
357b5948c24b5305cfb61a8114527234e054451c4"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "ba7188b2c7890e61bf58d3a=
a9e94c323fec375f67cf03841bbcc0f6c800fe6ad"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "ce18b44300f7d5d94856=
cef5b270ba010061fafa411beb9782207e26cbab88a6"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "a6ce7aadd10a3fd84fe4717=
a59378421a65b101b61f27eed8b09336b8daf62cf"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "9393de910df7cd6947e3804=
60a1144ac2373a36c776c7367a81212a51a92d9a7"
=20
 SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 0c85b4b48018..1c511917e248 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,10 +1,9 @@
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
-SRC_URI[rust.sha256sum] =3D "2d6aa2ea3fedd55acbbd65f78349385f9daa9c14e25db=
7a8df5d015588eee1cf"
+SRC_URI[rust.sha256sum] =3D "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d2=
9281a07419c4950715c"
=20
 SRC_URI:append:class-target:pn-rust =3D " \
     file://hardcodepaths.patch \
-    file://crossbeam_atomic.patch \
-    file://0001-Add-ENOTSUP-constant-for-riscv32-musl.patch"
+    file://crossbeam_atomic.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcodepath=
s.patch"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/ru=
st/rust.inc
index 956301023a05..8d25e7993aef 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -1,8 +1,8 @@
 SUMMARY =3D "Rust compiler and runtime libaries"
 HOMEPAGE =3D "http://www.rust-lang.org"
 SECTION =3D "devel"
-LICENSE =3D "MIT | Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D93a95682d51b4cb0a633a97046940=
ef0"
+LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D92289ed52a60b63ab715612ad2915=
603"
=20
 inherit rust
 inherit cargo_common
diff --git a/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-constant-for-=
riscv32-musl.patch b/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-const=
ant-for-riscv32-musl.patch
deleted file mode 100644
index ecfe0fe9b08d..000000000000
--- a/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-constant-for-riscv32=
-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e9fb036eeffaaa5cb7b1e6fc1dabb92ed6263f0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 19 Aug 2022 10:26:43 -0700
-Subject: [PATCH] Add ENOTSUP constant for riscv32/musl
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/commit/e9fb03=
6eeffaaa5cb7b1e6fc1dabb92ed6263f0f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- vendor/libc/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: rustc-1.65.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs
-+++ rustc-1.65.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs
-@@ -271,6 +271,7 @@ pub const ENOPROTOOPT: ::c_int =3D 92;
- pub const EPROTONOSUPPORT: ::c_int =3D 93;
- pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
- pub const EOPNOTSUPP: ::c_int =3D 95;
-+pub const ENOTSUP: ::c_int =3D EOPNOTSUPP;
- pub const EPFNOSUPPORT: ::c_int =3D 96;
- pub const EAFNOSUPPORT: ::c_int =3D 97;
- pub const EADDRINUSE: ::c_int =3D 98;
-Index: rustc-1.65.0-src/vendor/libc/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.65.0-src/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"f480d10d2a506eecd23ae2e2dedb7a28b8bf6dae5f46=
f438dbb61be2003426fb","Cargo.toml":"1549dc2db0ecd74316f52b2d14b15144ae970a8=
48bf3d54c048844ed7a35df2a","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"1d0cbe878e98e970c=
3318cac0772215a9f44bd286d859d665da27872ba9d8818","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"94cbaad15021e287a1b954=
6a697b04c1e560f1204b52204ffaaea5975c5d03b9","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"ce753ef318b300b=
bd441feabdd77d00322dfb6ce9eee8c78a38afe02b57aa4c0","src/macros.rs":"b457eb0=
28b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856d=
ddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38=
d064b5fefec6f37d42873820a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"a3f0dfff62d0f7f4f1b5f9a4e2b662acf233a46badbc5419d=
3cc2d735629a710","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"56dc7604509f49b274770cade97a1874c8955c3b0a445fb857707ae0ca6df41b"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"d0e8246063cae113806524a63a47c6c0628cc54a3ef03e938e89964f8b4f08b4",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda33476c37=
a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"755dafaf3f0945e798c34ea94c48e8552804ce60e2a=
15a4f0649f9d1aceaf422","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"cc65a73b0fa95a77044a4b3ee76d6eceb9773b55aea7d73bdf070e6f66=
e9ea38","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"0ed92eb93e78299cd7de0ae9daebb04a53b3c2d5e6a078e1fcd977f2a86bffc3","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"ec229cc7af2511cb510c078e87e90ee2625090bfe94f40eb35f73d79143533aa","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64365f=
8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"1e35b4773384ea143810cdce4b96f471=
08b37446430da30c96a0d1651656d73d","src/unix/bsd/mod.rs":"817ca5719c36a74c84=
e52c6a56a5998b60d7f02351a405e034f08ebab079b63a","src/unix/bsd/netbsdlike/mo=
d.rs":"b07a0e81085bd811fce7270f3b90fbfea29faf9593d9e39d9d2ebbb9a78bf25f","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"8f9613e50c2771b33d7cf817a735d536b389ec57f86=
1b9486d870373c768276e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/ne=
tbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc1=
3068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe=
028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlik=
e/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d=
51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf=
6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/o=
penbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729=
ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d40=
65da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd=
/mod.rs":"228505fa48292e74b06acbed96196801595a4b822da2126a6d6c7fa773cff8bc"=
,"src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98218=
1b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powe=
rpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e=
","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaec=
e91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/spa=
rc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085"=
,"src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570=
cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.r=
s":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/=
unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced=
11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57=
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"df7b6b7d8dd3441665bfe87=
f2abc942bddc65b8b10dfa9c83dd0422f68107891","src/unix/haiku/native.rs":"dbfc=
bf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/hai=
ku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b=
7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10cec=
cefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345=
db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab=
832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/l=
inux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e0015=
0063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"7c173e03751=
19bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like=
/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f=
0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0f=
cb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_lik=
e/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs"=
:"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/un=
ix/linux_like/android/b64/aarch64/mod.rs":"ef230d49fd0d182adf2dae6f8e10babf=
18d72259d65980bf1c4c2dc8a4f84501","src/unix/linux_like/android/b64/mod.rs":=
"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/uni=
x/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6=
832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64=
/mod.rs":"80e9f93fed838a48b4e2e8d77b95c72cfd7c0647bcce63851555c5ad16dad143"=
,"src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719=
aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64=
/x86_64/mod.rs":"e10d19bea39f719723ab6666a5ddbd378b6958769441c5904629e1df17=
3b1dc2","src/unix/linux_like/android/mod.rs":"962741303dc24a5b9653f2e9b0b4a=
d9eb42fc54daa0a70ca70a7ce175e75094b","src/unix/linux_like/emscripten/align.=
rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/mod.rs":"c69c90606d4362f8de89b8816df0ded724ed64=
b53bf55d15681fde171b7bb361","src/unix/linux_like/emscripten/no_align.rs":"0=
128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/=
linux_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93=
a8d02641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"e20013e=
d91edcfb7f84f3f9f5a9ef827fd5c406e24b65989d8438da332236ef6","src/unix/linux_=
like/linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8=
f1a43adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c=
6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/l=
inux/arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef=
02206a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec044=
0f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_lik=
e/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93=
f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like=
/linux/gnu/b32/arm/mod.rs":"92ea7edc0e24f79dfbf5e3efc2d7509bed230562036e6aa=
85ef4f2c8088ecc8f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa9=
2f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linu=
x_like/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214=
d1ae7d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs"=
:"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/un=
ix/linux_like/linux/gnu/b32/mips/mod.rs":"0d7849eb2435ec1f49b6774872a0518f0=
129c50f37c9d38b37b1535722777a22","src/unix/linux_like/linux/gnu/b32/mod.rs"=
:"8da281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/un=
ix/linux_like/linux/gnu/b32/powerpc.rs":"049d6211ba4a9304bd4497c160bc21ae84=
7c24e0528dd9d76263f16192e6aff5","src/unix/linux_like/linux/gnu/b32/riscv32/=
align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119=
","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"a4256148cec0bb672c8df=
a605866930d9761af9655721de72ae41eeeb8fdbf6d","src/unix/linux_like/linux/gnu=
/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440=
895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"525618615aa0=
cb80c6c90860bf579dfed8db307fffd56b97dc235fb945419434","src/unix/linux_like/=
linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef=
8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"78b4038=
852986436888c63be9258037cf642124daee9d5fa5cef2bf8e412bf54","src/unix/linux_=
like/linux/gnu/b64/aarch64/align.rs":"5b32fcc0d60356c92ded4e0ba9bb32f0140a8=
bd75ba800486bf38294f61dbdbb","src/unix/linux_like/linux/gnu/b64/aarch64/ilp=
32.rs":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","=
src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd42=
6442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu=
/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830=
c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c72a08011=
c32f82919e930e0d89044d8feb65fd41bf80647436756c290344eb8","src/unix/linux_li=
ke/linux/gnu/b64/loongarch64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8be=
d306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/loongarch=
64/mod.rs":"387808d5398b24339e7e2bf7591150735011befc5b421fa713d7017c04a7b1d=
a","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/g=
nu/b64/mips64/mod.rs":"17aad16329431d83e1909e3a08022f6e28f4bcba7dec4a967fe1=
a321a6a43b99","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88527=
57b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux=
/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc=
9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"=
97e0ecf11ecce793a13fec39654fb513c5479edf7faa7a276fa714b61993d0fc","src/unix=
/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111b=
eb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/risc=
v64/mod.rs":"b3fe290afe63d2d6e315d0cf1f775464e9c1f2a1906d243c1af74a137a4031=
cb","src/unix/linux_like/linux/gnu/b64/s390x.rs":"254f00266ecf9644a4b469457=
cb37c4dd6c055820926c1de0fb9035b6048e75c","src/unix/linux_like/linux/gnu/b64=
/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"87dd7f3d5bf3=
c09f4064ec738e306cc9cc41ad49b4a5df62c5983301c3bbf99a","src/unix/linux_like/=
linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b3=
08ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"f=
0db9914315d5a3d51bf5ec04a0ae6584f2e1688b9258ce132b617e67d9bd7a9","src/unix/=
linux_like/linux/gnu/b64/x86_64/not_x32.rs":"b88ef8a1eaa9ed73bf2acb8192afb7=
3af987a92abb94140c6376fc83f2fa5553","src/unix/linux_like/linux/gnu/b64/x86_=
64/x32.rs":"79305936a60d342efdc10519ba89507d6b48e65f13f33090d3b04dc9655ceed=
0","src/unix/linux_like/linux/gnu/mod.rs":"fd62b48974dd2f97f6e8fa2a30624e8d=
69fdedc5d3b0ab2f3f09516e88a8769a","src/unix/linux_like/linux/gnu/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/mod.rs":"af94b1a6d844bed87bb4c93de0a12f160ca1f918f523=
4d7fe17511d4e424dedc","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e=
8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/l=
inux_like/linux/musl/b32/arm/mod.rs":"e5faee8efda8a225ea0b17d4d6f9e893a678e=
73773fa62c549a8e19c106b9f04","src/unix/linux_like/linux/musl/b32/hexagon.rs=
":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/u=
nix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6e=
bfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs":"df8f8b529a6cc6b8a7326639e83303cf1320c6c50d76517c17d42bcf45f6240=
a","src/unix/linux_like/linux/musl/b32/mod.rs":"7b3d9dfd8605b00bb9b5fa1439a=
be5ebf60199c7fa033eee555e8d181e93ffa2","src/unix/linux_like/linux/musl/b32/=
powerpc.rs":"c957d99a4d4371d2411a5769be8cf344516bf9ddc1011f977501a4eb57cb4e=
82","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7=
c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linu=
x/musl/b32/riscv32/mod.rs":"698f77bfcc838f82126c54f7387881fe3e89490117e5a4f=
333d1b4433823a672","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77=
fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linu=
x_like/linux/musl/b32/x86/mod.rs":"199a91e90b454f9dc32770d5204cc4f6e5b8f144=
e0e34a1c91829949d6e804b3","src/unix/linux_like/linux/musl/b64/aarch64/align=
.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","sr=
c/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426=
442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl=
/b64/aarch64/mod.rs":"9c4878df0fea0e0affd85346e0bc191abdc5e41e74dc9199b5644=
ec33d29c300","src/unix/linux_like/linux/musl/b64/mips64.rs":"1fa4974fe412b2=
2c3555d3e240dbf00cc04a5287c751035ddf08a0470d4a7c9a","src/unix/linux_like/li=
nux/musl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e5=
5cd533fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"36694cbdcdc=
33879e00502d55cb95eaa0096d213538993dd39c3da800cdd06d1","src/unix/linux_like=
/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.r=
s":"36621aca8ecf714f8dd42662dc2997833d95b9f129ef8c220503362e21efd695","src/=
unix/linux_like/linux/musl/b64/s390x.rs":"c7ebabc4e1bdbbd97e5065faa3a57f41f=
473570920582d979f9e9d4f77448546","src/unix/linux_like/linux/musl/b64/x86_64=
/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6=
e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"238789097a26abc8b7cd=
578ed1a8e6cb8672083054303902781983902cd66854","src/unix/linux_like/linux/mu=
sl/mod.rs":"c3365480375bc258ffe267e7a299d7b3bb542a908bef8881f503ddc25ba8fc1=
f","src/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae=
6a982ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustiv=
e.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","s=
rc/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7=
ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/ali=
gn.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","=
src/unix/linux_like/linux/uclibc/arm/mod.rs":"a056bbf718ddd775519058706bdb4=
909b56e6256985869e3c3132aa8ec5faca0","src/unix/linux_like/linux/uclibc/arm/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a5=
7b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/l=
inux/uclibc/mips/mips32/mod.rs":"b84def53a49587e87f884c2bc28b21b290463b00b5=
2e1d0309f2ba233a5b4a99","src/unix/linux_like/linux/uclibc/mips/mips32/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e6=
4d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/=
uclibc/mips/mips64/mod.rs":"256a428290a560163ef7dc7d18b27bd3c6ce9748a0f28d5=
dc7f82203ee228220","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.r=
s":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/=
unix/linux_like/linux/uclibc/mips/mod.rs":"367ec5483ad317e6ccba1ac0888da6cf=
088a8d32689214cc8d16129aa692260c","src/unix/linux_like/linux/uclibc/mod.rs"=
:"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/un=
ix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe9=
4b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4=
re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","=
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"bf6985e901041a61e90ccee129=
6b35a4c62ef90aa528d31989e1d647f072e79a","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2=
d6a0a8","src/unix/linux_like/mod.rs":"09fa012e027bfcdaabee221c1b676804a9c7e=
0e04a4b64fdd98a50c9b5c2f674","src/unix/mod.rs":"fbd5520d160a32a127608cd4089=
05febe387773bbf05bfe199ef385fb5562e9c","src/unix/newlib/aarch64/mod.rs":"ba=
c93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/n=
ewlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d85=
02b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3f=
a0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4b=
aabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/gener=
ic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","=
src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd=
0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"54633d606e4e0413274af0b5b=
eb5e697e6c061b63feaa0704b026554cc9d9c3e","src/unix/newlib/no_align.rs":"e07=
43b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/ne=
wlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f=
831be393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93f=
b2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"033768cb273daf2c8090d9=
7252c2de9dba6809e6a5d2457f5727d724807695db","src/unix/solarish/compat.rs":"=
b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix=
/solarish/illumos.rs":"29387916ee7dc58f07478746024003215e631cd30953e8fa2a5c=
415f81839007","src/unix/solarish/mod.rs":"8914a68865af026c1f4fb1d5f02ba0053=
362ef34b813ad60cc4aa3a88aa4999e","src/unix/solarish/solaris.rs":"65b005453a=
efa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/=
x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e",=
"src/unix/solarish/x86_64.rs":"9074e813949f3c613afeac39d4118fb942c0b3c47623=
2fc536489357cff5790f","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22=
460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"9=
8f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxwor=
ks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e8=
8","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95=
a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21=
a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd0=
2557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"5=
52f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxwor=
ks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b=
514a","src/wasi.rs":"4fae202af0327d768ed9e1b586b75816cce14fe2dc16947d2f3d38=
1f209a54c1","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0=
215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44=
af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"090dd=
8fcd951d18f1905bca96188783c2e3f1433484926ecdcda144237ecec0f","src/windows/m=
svc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986=
f4","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e777=
4c7e545f21f1f4"},"package":"8371e4e5341c3a96db127eb2465ac681ced4c433e01dd0e=
938adbef26ba93ba5"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"f480d10d2a506eecd23ae2e2dedb7a28b8bf6dae5f46=
f438dbb61be2003426fb","Cargo.toml":"1549dc2db0ecd74316f52b2d14b15144ae970a8=
48bf3d54c048844ed7a35df2a","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"1d0cbe878e98e970c=
3318cac0772215a9f44bd286d859d665da27872ba9d8818","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"94cbaad15021e287a1b954=
6a697b04c1e560f1204b52204ffaaea5975c5d03b9","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"ce753ef318b300b=
bd441feabdd77d00322dfb6ce9eee8c78a38afe02b57aa4c0","src/macros.rs":"b457eb0=
28b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856d=
ddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38=
d064b5fefec6f37d42873820a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"a3f0dfff62d0f7f4f1b5f9a4e2b662acf233a46badbc5419d=
3cc2d735629a710","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"56dc7604509f49b274770cade97a1874c8955c3b0a445fb857707ae0ca6df41b"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"d0e8246063cae113806524a63a47c6c0628cc54a3ef03e938e89964f8b4f08b4",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda33476c37=
a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"755dafaf3f0945e798c34ea94c48e8552804ce60e2a=
15a4f0649f9d1aceaf422","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"cc65a73b0fa95a77044a4b3ee76d6eceb9773b55aea7d73bdf070e6f66=
e9ea38","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"0ed92eb93e78299cd7de0ae9daebb04a53b3c2d5e6a078e1fcd977f2a86bffc3","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"ec229cc7af2511cb510c078e87e90ee2625090bfe94f40eb35f73d79143533aa","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64365f=
8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"1e35b4773384ea143810cdce4b96f471=
08b37446430da30c96a0d1651656d73d","src/unix/bsd/mod.rs":"817ca5719c36a74c84=
e52c6a56a5998b60d7f02351a405e034f08ebab079b63a","src/unix/bsd/netbsdlike/mo=
d.rs":"b07a0e81085bd811fce7270f3b90fbfea29faf9593d9e39d9d2ebbb9a78bf25f","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"8f9613e50c2771b33d7cf817a735d536b389ec57f86=
1b9486d870373c768276e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/ne=
tbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc1=
3068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe=
028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlik=
e/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d=
51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf=
6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/o=
penbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729=
ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d40=
65da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd=
/mod.rs":"228505fa48292e74b06acbed96196801595a4b822da2126a6d6c7fa773cff8bc"=
,"src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98218=
1b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powe=
rpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e=
","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaec=
e91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/spa=
rc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085"=
,"src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570=
cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.r=
s":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/=
unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced=
11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57=
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"df7b6b7d8dd3441665bfe87=
f2abc942bddc65b8b10dfa9c83dd0422f68107891","src/unix/haiku/native.rs":"dbfc=
bf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/hai=
ku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b=
7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10cec=
cefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345=
db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab=
832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/l=
inux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e0015=
0063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"7c173e03751=
19bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like=
/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f=
0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0f=
cb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_lik=
e/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs"=
:"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/un=
ix/linux_like/android/b64/aarch64/mod.rs":"ef230d49fd0d182adf2dae6f8e10babf=
18d72259d65980bf1c4c2dc8a4f84501","src/unix/linux_like/android/b64/mod.rs":=
"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/uni=
x/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6=
832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64=
/mod.rs":"80e9f93fed838a48b4e2e8d77b95c72cfd7c0647bcce63851555c5ad16dad143"=
,"src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719=
aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64=
/x86_64/mod.rs":"e10d19bea39f719723ab6666a5ddbd378b6958769441c5904629e1df17=
3b1dc2","src/unix/linux_like/android/mod.rs":"962741303dc24a5b9653f2e9b0b4a=
d9eb42fc54daa0a70ca70a7ce175e75094b","src/unix/linux_like/emscripten/align.=
rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/mod.rs":"c69c90606d4362f8de89b8816df0ded724ed64=
b53bf55d15681fde171b7bb361","src/unix/linux_like/emscripten/no_align.rs":"0=
128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/=
linux_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93=
a8d02641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"e20013e=
d91edcfb7f84f3f9f5a9ef827fd5c406e24b65989d8438da332236ef6","src/unix/linux_=
like/linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8=
f1a43adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c=
6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/l=
inux/arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef=
02206a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec044=
0f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_lik=
e/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93=
f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like=
/linux/gnu/b32/arm/mod.rs":"92ea7edc0e24f79dfbf5e3efc2d7509bed230562036e6aa=
85ef4f2c8088ecc8f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa9=
2f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linu=
x_like/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214=
d1ae7d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs"=
:"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/un=
ix/linux_like/linux/gnu/b32/mips/mod.rs":"0d7849eb2435ec1f49b6774872a0518f0=
129c50f37c9d38b37b1535722777a22","src/unix/linux_like/linux/gnu/b32/mod.rs"=
:"8da281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/un=
ix/linux_like/linux/gnu/b32/powerpc.rs":"049d6211ba4a9304bd4497c160bc21ae84=
7c24e0528dd9d76263f16192e6aff5","src/unix/linux_like/linux/gnu/b32/riscv32/=
align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119=
","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"a4256148cec0bb672c8df=
a605866930d9761af9655721de72ae41eeeb8fdbf6d","src/unix/linux_like/linux/gnu=
/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440=
895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"525618615aa0=
cb80c6c90860bf579dfed8db307fffd56b97dc235fb945419434","src/unix/linux_like/=
linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef=
8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"78b4038=
852986436888c63be9258037cf642124daee9d5fa5cef2bf8e412bf54","src/unix/linux_=
like/linux/gnu/b64/aarch64/align.rs":"5b32fcc0d60356c92ded4e0ba9bb32f0140a8=
bd75ba800486bf38294f61dbdbb","src/unix/linux_like/linux/gnu/b64/aarch64/ilp=
32.rs":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","=
src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd42=
6442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu=
/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830=
c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c72a08011=
c32f82919e930e0d89044d8feb65fd41bf80647436756c290344eb8","src/unix/linux_li=
ke/linux/gnu/b64/loongarch64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8be=
d306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/loongarch=
64/mod.rs":"387808d5398b24339e7e2bf7591150735011befc5b421fa713d7017c04a7b1d=
a","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/g=
nu/b64/mips64/mod.rs":"17aad16329431d83e1909e3a08022f6e28f4bcba7dec4a967fe1=
a321a6a43b99","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88527=
57b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux=
/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc=
9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"=
97e0ecf11ecce793a13fec39654fb513c5479edf7faa7a276fa714b61993d0fc","src/unix=
/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111b=
eb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/risc=
v64/mod.rs":"b3fe290afe63d2d6e315d0cf1f775464e9c1f2a1906d243c1af74a137a4031=
cb","src/unix/linux_like/linux/gnu/b64/s390x.rs":"254f00266ecf9644a4b469457=
cb37c4dd6c055820926c1de0fb9035b6048e75c","src/unix/linux_like/linux/gnu/b64=
/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"87dd7f3d5bf3=
c09f4064ec738e306cc9cc41ad49b4a5df62c5983301c3bbf99a","src/unix/linux_like/=
linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b3=
08ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"f=
0db9914315d5a3d51bf5ec04a0ae6584f2e1688b9258ce132b617e67d9bd7a9","src/unix/=
linux_like/linux/gnu/b64/x86_64/not_x32.rs":"b88ef8a1eaa9ed73bf2acb8192afb7=
3af987a92abb94140c6376fc83f2fa5553","src/unix/linux_like/linux/gnu/b64/x86_=
64/x32.rs":"79305936a60d342efdc10519ba89507d6b48e65f13f33090d3b04dc9655ceed=
0","src/unix/linux_like/linux/gnu/mod.rs":"fd62b48974dd2f97f6e8fa2a30624e8d=
69fdedc5d3b0ab2f3f09516e88a8769a","src/unix/linux_like/linux/gnu/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/mod.rs":"af94b1a6d844bed87bb4c93de0a12f160ca1f918f523=
4d7fe17511d4e424dedc","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e=
8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/l=
inux_like/linux/musl/b32/arm/mod.rs":"e5faee8efda8a225ea0b17d4d6f9e893a678e=
73773fa62c549a8e19c106b9f04","src/unix/linux_like/linux/musl/b32/hexagon.rs=
":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/u=
nix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6e=
bfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs":"df8f8b529a6cc6b8a7326639e83303cf1320c6c50d76517c17d42bcf45f6240=
a","src/unix/linux_like/linux/musl/b32/mod.rs":"7b3d9dfd8605b00bb9b5fa1439a=
be5ebf60199c7fa033eee555e8d181e93ffa2","src/unix/linux_like/linux/musl/b32/=
powerpc.rs":"c957d99a4d4371d2411a5769be8cf344516bf9ddc1011f977501a4eb57cb4e=
82","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7=
c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linu=
x/musl/b32/riscv32/mod.rs":"e57dc5562553aab6d0765e0ec266254aa52975f8757bfe9=
7e0c6028fa7d5d37c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77=
fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linu=
x_like/linux/musl/b32/x86/mod.rs":"199a91e90b454f9dc32770d5204cc4f6e5b8f144=
e0e34a1c91829949d6e804b3","src/unix/linux_like/linux/musl/b64/aarch64/align=
.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","sr=
c/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426=
442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl=
/b64/aarch64/mod.rs":"9c4878df0fea0e0affd85346e0bc191abdc5e41e74dc9199b5644=
ec33d29c300","src/unix/linux_like/linux/musl/b64/mips64.rs":"1fa4974fe412b2=
2c3555d3e240dbf00cc04a5287c751035ddf08a0470d4a7c9a","src/unix/linux_like/li=
nux/musl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e5=
5cd533fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"36694cbdcdc=
33879e00502d55cb95eaa0096d213538993dd39c3da800cdd06d1","src/unix/linux_like=
/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.r=
s":"36621aca8ecf714f8dd42662dc2997833d95b9f129ef8c220503362e21efd695","src/=
unix/linux_like/linux/musl/b64/s390x.rs":"c7ebabc4e1bdbbd97e5065faa3a57f41f=
473570920582d979f9e9d4f77448546","src/unix/linux_like/linux/musl/b64/x86_64=
/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6=
e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"238789097a26abc8b7cd=
578ed1a8e6cb8672083054303902781983902cd66854","src/unix/linux_like/linux/mu=
sl/mod.rs":"c3365480375bc258ffe267e7a299d7b3bb542a908bef8881f503ddc25ba8fc1=
f","src/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae=
6a982ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustiv=
e.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","s=
rc/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7=
ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/ali=
gn.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","=
src/unix/linux_like/linux/uclibc/arm/mod.rs":"a056bbf718ddd775519058706bdb4=
909b56e6256985869e3c3132aa8ec5faca0","src/unix/linux_like/linux/uclibc/arm/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a5=
7b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/l=
inux/uclibc/mips/mips32/mod.rs":"b84def53a49587e87f884c2bc28b21b290463b00b5=
2e1d0309f2ba233a5b4a99","src/unix/linux_like/linux/uclibc/mips/mips32/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e6=
4d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/=
uclibc/mips/mips64/mod.rs":"256a428290a560163ef7dc7d18b27bd3c6ce9748a0f28d5=
dc7f82203ee228220","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.r=
s":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/=
unix/linux_like/linux/uclibc/mips/mod.rs":"367ec5483ad317e6ccba1ac0888da6cf=
088a8d32689214cc8d16129aa692260c","src/unix/linux_like/linux/uclibc/mod.rs"=
:"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/un=
ix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe9=
4b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4=
re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","=
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"bf6985e901041a61e90ccee129=
6b35a4c62ef90aa528d31989e1d647f072e79a","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2=
d6a0a8","src/unix/linux_like/mod.rs":"09fa012e027bfcdaabee221c1b676804a9c7e=
0e04a4b64fdd98a50c9b5c2f674","src/unix/mod.rs":"fbd5520d160a32a127608cd4089=
05febe387773bbf05bfe199ef385fb5562e9c","src/unix/newlib/aarch64/mod.rs":"ba=
c93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/n=
ewlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d85=
02b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3f=
a0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4b=
aabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/gener=
ic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","=
src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd=
0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"54633d606e4e0413274af0b5b=
eb5e697e6c061b63feaa0704b026554cc9d9c3e","src/unix/newlib/no_align.rs":"e07=
43b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/ne=
wlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f=
831be393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93f=
b2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"033768cb273daf2c8090d9=
7252c2de9dba6809e6a5d2457f5727d724807695db","src/unix/solarish/compat.rs":"=
b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix=
/solarish/illumos.rs":"29387916ee7dc58f07478746024003215e631cd30953e8fa2a5c=
415f81839007","src/unix/solarish/mod.rs":"8914a68865af026c1f4fb1d5f02ba0053=
362ef34b813ad60cc4aa3a88aa4999e","src/unix/solarish/solaris.rs":"65b005453a=
efa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/=
x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e",=
"src/unix/solarish/x86_64.rs":"9074e813949f3c613afeac39d4118fb942c0b3c47623=
2fc536489357cff5790f","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22=
460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"9=
8f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxwor=
ks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e8=
8","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95=
a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21=
a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd0=
2557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"5=
52f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxwor=
ks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b=
514a","src/wasi.rs":"4fae202af0327d768ed9e1b586b75816cce14fe2dc16947d2f3d38=
1f209a54c1","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0=
215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44=
af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"090dd=
8fcd951d18f1905bca96188783c2e3f1433484926ecdcda144237ecec0f","src/windows/m=
svc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986=
f4","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e777=
4c7e545f21f1f4"},"package":"8371e4e5341c3a96db127eb2465ac681ced4c433e01dd0e=
938adbef26ba93ba5"}
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/=
recipes-devtools/rust/rust/crossbeam_atomic.patch
index 1c0d5a1974e9..b24ac439c66e 100644
--- a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
@@ -17,10 +17,10 @@ to create a patch that upstream might accept.
 Upstream-Status: Submitted [https://github.com/crossbeam-rs/crossbeam/pull=
/922]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: rustc-1.65.0-src/vendor/crossbeam-utils/build.rs
+Index: rustc-1.66.0-src/vendor/crossbeam-utils/build.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/vendor/crossbeam-utils/build.rs
-+++ rustc-1.65.0-src/vendor/crossbeam-utils/build.rs
+--- rustc-1.66.0-src.orig/vendor/crossbeam-utils/build.rs
++++ rustc-1.66.0-src/vendor/crossbeam-utils/build.rs
 @@ -29,7 +29,7 @@ use std::env;
  include!("no_atomic.rs");
=20=20
@@ -39,28 +39,28 @@ Index: rustc-1.65.0-src/vendor/crossbeam-utils/build.rs
=20=20
      // Note that this is `no_`*, not `has_*`. This allows treating as the=
 latest
      // stable rustc is used when the build script doesn't run. This is us=
eful
-Index: rustc-1.65.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+Index: rustc-1.66.0-src/vendor/crossbeam-utils/.cargo-checksum.json
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
-+++ rustc-1.65.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+--- rustc-1.66.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
++++ rustc-1.66.0-src/vendor/crossbeam-utils/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CHANGELOG.md":"eb2f46ecf2eee5f591c4d4e789f18735bb1ed771782a5e0=
f16eab3a77001e7c2","Cargo.toml":"9ce8b596c9789e65bef4c952bdcac84fc88e50ba9e=
cb01a818036eff4e6ecfec","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"2a19af38a52dd965c2d66bb=
39f90a85b430b51ee9ccb29e9e1978ee7091e5087","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"485=
9f9c926c230023e861bf01c4b225b460035faf8cf6240108530efedbb747f","no_atomic.r=
s":"916ed15218bb7b75a4e0d432430e7134efd27ca43ca8a8766e0c90e89febb602","src/=
atomic/atomic_cell.rs":"0fc99463e633144c5d59d39c35b5477da1f1b90f5448cadc374=
54b7f4b97707e","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"8fd5e3dcccc05860680e49c8498de8096bee9140bcfee8723d=
97117106a020d0","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"91f3a7d4=
ee8d9e06b6558d180e8a0df08ff5c6cef612b4ce4790f9f75cb34f84","src/sync/sharded=
_lock.rs":"78433f55ee3defeea348d65abc78e03d63d6a304e09c568b27b403e9ad205771=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"21cf9b3e965529e5c0a6ff8fc1ec846bfe0006c=
41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869c922a1cbf929c3b7=
41bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6a16c865a5aced621=
6d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"02661c2a820a5abe8b0c8fe15a6650aea=
d707b57cdda0610d1b09a2680ed6969"},"package":"51887d4adc7b564537b15adcfb3079=
36f8075dfcd5f00dde9a9f1d29383682bc"}
+-{"files":{"CHANGELOG.md":"65d3e11edf9498bdbc930c8c3878b7d3a90c1a0b1698597=
dc4a396a547fa0948","Cargo.toml":"1e4259a5a47271e8ae040b91e17652b5a4e0e7e45c=
3f22de5008db276f3a50bf","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"2a19af38a52dd965c2d66bb=
39f90a85b430b51ee9ccb29e9e1978ee7091e5087","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"485=
9f9c926c230023e861bf01c4b225b460035faf8cf6240108530efedbb747f","no_atomic.r=
s":"f58085b9d0666ccf62e0ae17fb5dae937c0a86fcc55dc0ae04ad8659e696a49c","src/=
atomic/atomic_cell.rs":"0fc99463e633144c5d59d39c35b5477da1f1b90f5448cadc374=
54b7f4b97707e","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"8fd5e3dcccc05860680e49c8498de8096bee9140bcfee8723d=
97117106a020d0","src/cache_padded.rs":"8bb8925e2df44224ffa29f31a2f9c08d88d8=
bd3df6c1ce47003598225055fdb5","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"eca73c04f821859b8434d=
2b93db87d160dc6a3f65498ca201cd40d732ca4c134","src/sync/once_lock.rs":"c03dc=
9c05a817e087dccf8b682f7307501542805533551da3c2bab442bc40743","src/sync/park=
er.rs":"91f3a7d4ee8d9e06b6558d180e8a0df08ff5c6cef612b4ce4790f9f75cb34f84","=
src/sync/sharded_lock.rs":"6391b3b99b194b8e0888446c2dec340e4fb095753bcf0c1a=
80bc654f9c8be0e3","src/sync/wait_group.rs":"3e339aab014f50e214fea535c841755=
113ea058153378ed54e50a4acb403c937","src/thread.rs":"21cf9b3e965529e5c0a6ff8=
fc1ec846bfe0006c41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869=
c922a1cbf929c3b741bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padd=
ed.rs":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","=
tests/parker.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69=
dd99d20","tests/sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6=
a16c865a5aced6216d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1c=
c252a816bc20ab62cec060d6cd09cab10","tests/wait_group.rs":"02661c2a820a5abe8=
b0c8fe15a6650aead707b57cdda0610d1b09a2680ed6969"},"package":"edbafec5fa1f19=
6ca66527c1b12c2ec4745ca14b50f1ad8f9f6f720b55d11fac"}
 \ No newline at end of file
-+{"files":{"CHANGELOG.md":"eb2f46ecf2eee5f591c4d4e789f18735bb1ed771782a5e0=
f16eab3a77001e7c2","Cargo.toml":"9ce8b596c9789e65bef4c952bdcac84fc88e50ba9e=
cb01a818036eff4e6ecfec","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"2a19af38a52dd965c2d66bb=
39f90a85b430b51ee9ccb29e9e1978ee7091e5087","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"108=
ba75398e3169c35b0e9754782391e4e4a9f9bf0ae2b216b55d836c4ac9ba8","no_atomic.r=
s":"916ed15218bb7b75a4e0d432430e7134efd27ca43ca8a8766e0c90e89febb602","src/=
atomic/atomic_cell.rs":"0fc99463e633144c5d59d39c35b5477da1f1b90f5448cadc374=
54b7f4b97707e","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"8fd5e3dcccc05860680e49c8498de8096bee9140bcfee8723d=
97117106a020d0","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"91f3a7d4=
ee8d9e06b6558d180e8a0df08ff5c6cef612b4ce4790f9f75cb34f84","src/sync/sharded=
_lock.rs":"78433f55ee3defeea348d65abc78e03d63d6a304e09c568b27b403e9ad205771=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"21cf9b3e965529e5c0a6ff8fc1ec846bfe0006c=
41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869c922a1cbf929c3b7=
41bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6a16c865a5aced621=
6d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"02661c2a820a5abe8b0c8fe15a6650aea=
d707b57cdda0610d1b09a2680ed6969"},"package":"51887d4adc7b564537b15adcfb3079=
36f8075dfcd5f00dde9a9f1d29383682bc"}
++{"files":{"CHANGELOG.md":"65d3e11edf9498bdbc930c8c3878b7d3a90c1a0b1698597=
dc4a396a547fa0948","Cargo.toml":"1e4259a5a47271e8ae040b91e17652b5a4e0e7e45c=
3f22de5008db276f3a50bf","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"2a19af38a52dd965c2d66bb=
39f90a85b430b51ee9ccb29e9e1978ee7091e5087","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"108=
ba75398e3169c35b0e9754782391e4e4a9f9bf0ae2b216b55d836c4ac9ba8","no_atomic.r=
s":"f58085b9d0666ccf62e0ae17fb5dae937c0a86fcc55dc0ae04ad8659e696a49c","src/=
atomic/atomic_cell.rs":"0fc99463e633144c5d59d39c35b5477da1f1b90f5448cadc374=
54b7f4b97707e","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"8fd5e3dcccc05860680e49c8498de8096bee9140bcfee8723d=
97117106a020d0","src/cache_padded.rs":"8bb8925e2df44224ffa29f31a2f9c08d88d8=
bd3df6c1ce47003598225055fdb5","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"eca73c04f821859b8434d=
2b93db87d160dc6a3f65498ca201cd40d732ca4c134","src/sync/once_lock.rs":"c03dc=
9c05a817e087dccf8b682f7307501542805533551da3c2bab442bc40743","src/sync/park=
er.rs":"91f3a7d4ee8d9e06b6558d180e8a0df08ff5c6cef612b4ce4790f9f75cb34f84","=
src/sync/sharded_lock.rs":"6391b3b99b194b8e0888446c2dec340e4fb095753bcf0c1a=
80bc654f9c8be0e3","src/sync/wait_group.rs":"3e339aab014f50e214fea535c841755=
113ea058153378ed54e50a4acb403c937","src/thread.rs":"21cf9b3e965529e5c0a6ff8=
fc1ec846bfe0006c41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869=
c922a1cbf929c3b741bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padd=
ed.rs":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","=
tests/parker.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69=
dd99d20","tests/sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6=
a16c865a5aced6216d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1c=
c252a816bc20ab62cec060d6cd09cab10","tests/wait_group.rs":"02661c2a820a5abe8=
b0c8fe15a6650aead707b57cdda0610d1b09a2680ed6969"},"package":"edbafec5fa1f19=
6ca66527c1b12c2ec4745ca14b50f1ad8f9f6f720b55d11fac"}
 \ No newline at end of file
-Index: rustc-1.65.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
+Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
-+++ rustc-1.65.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
+--- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
++++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
 @@ -1 +1 @@
 -{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"7e7=
4dc72343ff57e83d0a84a9fbdd9ff1645894165909999b4c3d2fba94bc96c","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
 \ No newline at end of file
 +{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
 \ No newline at end of file
-Index: rustc-1.65.0-src/vendor/crossbeam-utils-0.8.8/build.rs
+Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/build.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/vendor/crossbeam-utils-0.8.8/build.rs
-+++ rustc-1.65.0-src/vendor/crossbeam-utils-0.8.8/build.rs
+--- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.8/build.rs
++++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/build.rs
 @@ -29,7 +29,7 @@ use std::env;
  include!("no_atomic.rs");
=20=20
diff --git a/meta/recipes-devtools/rust/rust/hardcodepaths.patch b/meta/rec=
ipes-devtools/rust/rust/hardcodepaths.patch
index 87ac0c3989a7..178f354cf834 100644
--- a/meta/recipes-devtools/rust/rust/hardcodepaths.patch
+++ b/meta/recipes-devtools/rust/rust/hardcodepaths.patch
@@ -5,10 +5,10 @@ to resolve these issues properly upstream.
 Upstream-Status: Inappropriate [patches need rework]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: rustc-1.65.0-src/src/tools/clippy/src/driver.rs
+Index: rustc-1.66.0-src/src/tools/clippy/src/driver.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/src/tools/clippy/src/driver.rs
-+++ rustc-1.65.0-src/src/tools/clippy/src/driver.rs
+--- rustc-1.66.0-src.orig/src/tools/clippy/src/driver.rs
++++ rustc-1.66.0-src/src/tools/clippy/src/driver.rs
 @@ -259,7 +259,6 @@ pub fn main() {
                      .and_then(|out| String::from_utf8(out.stdout).ok())
                      .map(|s| PathBuf::from(s.trim()))
@@ -17,11 +17,11 @@ Index: rustc-1.65.0-src/src/tools/clippy/src/driver.rs
              .or_else(|| {
                  let home =3D option_env!("RUSTUP_HOME")
                      .or(option_env!("MULTIRUST_HOME"))
-Index: rustc-1.65.0-src/compiler/rustc_codegen_llvm/src/context.rs
+Index: rustc-1.66.0-src/compiler/rustc_codegen_llvm/src/context.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.65.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
-+++ rustc-1.65.0-src/compiler/rustc_codegen_llvm/src/context.rs
-@@ -155,46 +155,6 @@ pub unsafe fn create_module<'ll>(
+--- rustc-1.66.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
++++ rustc-1.66.0-src/compiler/rustc_codegen_llvm/src/context.rs
+@@ -160,46 +160,6 @@ pub unsafe fn create_module<'ll>(
          }
      }
=20=20
diff --git a/meta/recipes-devtools/rust/rust_1.65.0.bb b/meta/recipes-devto=
ols/rust/rust_1.66.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.65.0.bb
rename to meta/recipes-devtools/rust/rust_1.66.0.bb
--=20
2.39.0


