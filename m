Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED93EC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 16:50:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.9788.1665766201136281497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 09:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EUZYgXl/;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g27so7610977edf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrl0ltNMouy95K3lArNC+Hn0/2SZo7gGAKCx9Ie7uJ4=;
        b=EUZYgXl/hd4JJpf4Vm6hW1ce8IirFGRhl2oRyUOeaGTHh60nhvLbRgqv+cPhoU0GCb
         e2UWGjhxPJHiWXvtPRXmLrE+kH+sAewJEJbDanXuIBWQOEL2ZtieJrvuGO9hUKeFiBIm
         6Cr0KgPZI3l4okXQ1jndv/MGmbfP6/8FAXO9bJkQHaxoYKGKAYsnFulNAh+V/KiSh3GP
         FYs3Ad+3mWfTA5ELDrxV8TFmLn10kFZF7A6gj7emcOM7DjL5XTVAqkbolCbfAS4nWsee
         +Zjn7PWL+eZsncqlJkjIMoXG5ha5DsXVtAiwgl9HxT8o2LYC7J2dCw4DJwggiIej29GB
         Oknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrl0ltNMouy95K3lArNC+Hn0/2SZo7gGAKCx9Ie7uJ4=;
        b=jtwr2ZSm8pZVoPxXxsBC0avBsLtY1RhlYBvq8FKV6PXUYSXLTbctbjm8c4KHNsTmkU
         NXbLvvrWy0Dv0gH7MlOZP/0jCKv9bm5BFT5QCzJxFDb+3oG5Rxm+TBe2BJWrwXJNyUWU
         sLtzwcCH8dZTzLt14iCIVC9hSrui9ce/KwT8eY13X6AZqtbbq8gQ95wEawKkhAPPnIU8
         4E14zFKVGzRTedV1D/7sPXJrYTIAy94vYgTVrsyAO9IJq7PLES3sR4wJG36okK9HTS7k
         sSARFabykDkR1q65vriNDHwyq9tILjRVHl1LhIjM2neDE6UNNdjPM/4GslpFmELTSN+N
         VPlw==
X-Gm-Message-State: ACrzQf2wW0Rflz+XJk6s3CL20GZ/1qM2yQd25zjyScy4fnuLS2RZUzFd
	c5rXp5FBi6JCZXYWzNiP1EiuJUvN0UY=
X-Google-Smtp-Source: AMsMyM4ISin2csfDEa/mi19dk/kIdiD1peoGyzZQwfRaLieZr5ABBR8+KwuoNMvKJArutvRm/UojCw==
X-Received: by 2002:aa7:d7c5:0:b0:459:fad8:fd2 with SMTP id e5-20020aa7d7c5000000b00459fad80fd2mr5122571eds.336.1665766198720;
        Fri, 14 Oct 2022 09:49:58 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id i8-20020a1709061e4800b0078d4c72e2cesm1802655ejj.44.2022.10.14.09.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:49:58 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v2] rust: update 1.63.0 -> 1.64.0
Date: Fri, 14 Oct 2022 17:49:54 +0100
Message-Id: <20221014164954.16848-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 16:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171738

From: Alex Kiernan <alexk@zuma.ai>

Release notes:
  https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../{cargo_1.63.0.bb =3D> cargo_1.64.0.bb}      |  0
 ...ibstd-rs_1.63.0.bb =3D> libstd-rs_1.64.0.bb} |  0
 ....63.0.bb =3D> rust-cross-canadian_1.64.0.bb} |  0
 ...ust-llvm_1.63.0.bb =3D> rust-llvm_1.64.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 22 +++++-----
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/rust/crossbeam_atomic.patch          | 43 ++++++++++++++++---
 .../rust/rust/hardcodepaths.patch             | 16 +++----
 .../rust/{rust_1.63.0.bb =3D> rust_1.64.0.bb}   |  0
 10 files changed, 58 insertions(+), 27 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo_1.63.0.bb =3D> cargo_1.64.0.bb} =
(100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.63.0.bb =3D> libstd-rs_1.64=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.63.0.bb =3D> rust=
-cross-canadian_1.64.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.63.0.bb =3D> rust-llvm_1.64=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.63.0.bb =3D> rust_1.64.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 59b226e62fcd..6bba92ac9696 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "14.0.6"
-RUSTVERSION ?=3D "1.63%"
+RUSTVERSION ?=3D "1.64%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo_1.63.0.bb b/meta/recipes-dev=
tools/cargo/cargo_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.63.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index b9d7edd6720f..e790705aba0c 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -5,21 +5,21 @@
 ## The version is replicated here.
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.62.0"
-CARGO_VERSION =3D "1.62.0"
+RS_VERSION =3D "1.63.0"
+CARGO_VERSION =3D "1.63.0"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "addfae87b6b1b521d98a50fdc=
5120990888a51bb397100062e9c558267c67c77"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "e7f71f4ef09334ddc9ec8cbf2f95=
8d654e36f580c95f8fec6d5c816ce256dbd6"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "815c63119a9cf0282ff240c6444b=
6f867238763ee3dea182f10837ae7dbbb1d4"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "993c2c17bf76ac626bfb5b17b=
ddce65fbdfc14f70d183f33773de0cd12df46d2"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "bdab9d9afa5c329c40f9ba568364=
815237fab8426477c12bfabad35ffc484ab5"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f370d12e4c11f0c835becb738bcf=
00d363f29b76f8b424b4dcb005abcf15fc9a"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "dd5df8a92af3e5d49a1122b9=
561821ebd72a9317884a37ecddae041e652a7563"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "0fa320a19d41dcfc592bc006f5e=
9eda8e3b972598a26c96ad64eedd868516df3"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "475038ecacca9ff586cad2082d5=
d950544b0d581a2a287facc7d899aae488813"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "f1d93b3d48258f701687c63e=
f9b226c07329fb92c2c5559283258687f958e9d0"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d78799bb8f4177877f97b9051c9=
cba1fd85173f2e9cecab9486388fc6fa66259"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "4313ab44dccba4faed20db4aacc=
16def405773d1676e79d3e65ced4b99d710d4"
=20
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "d6678b7c971f3adbe7f8=
20adae669d03a314468441e2907747c76eca98e0be92"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "b66d0bc6dbfdc0d4b826f78=
7ec4e772dea8e3d2015cecbe2105632d468c28dcb"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "016257f1641693008068bd0=
86fec66d68550d1778f6aea9d06c9b263fca392d5"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "3ae0b74ba428c569fcec=
ebbb09060ad0bd434a5f1fc9ffd1329b56941a897b6e"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "b3dc2c082e76b5effe0b158=
aac3831830168a1a6980b39347c355e49be63fcca"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "a4cdc00a42fd767bf5a296f=
7126d9db22a0a609cd956bbf0cb3eae882add1be7"
=20
 SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index ce6c983fc0b5..67f130d0ef4e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
-SRC_URI[rust.sha256sum] =3D "8f44af6dc44cc4146634a4dd5e4cc5470b3052a233701=
9b870c0e025e8987e0c"
+SRC_URI[rust.sha256sum] =3D "e8170d318fac9d2fc17d5c3e648e7068f56e8db8d233d=
864aeffbef7c6542eac"
=20
 SRC_URI:append:class-target:pn-rust =3D " \
     file://hardcodepaths.patch \
diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/=
recipes-devtools/rust/rust/crossbeam_atomic.patch
index 7097bb9087a3..2f3f985243c9 100644
--- a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
@@ -17,10 +17,10 @@ to create a patch that upstream might accept.
 Upstream-Status: Inappropriate [OE Specific tweak  but could be rewritten]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
+Index: rustc-1.64.0-src/vendor/crossbeam-utils/build.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.63.0-src.orig/vendor/crossbeam-utils/build.rs
-+++ rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
+--- rustc-1.64.0-src.orig/vendor/crossbeam-utils/build.rs
++++ rustc-1.64.0-src/vendor/crossbeam-utils/build.rs
 @@ -29,7 +29,7 @@ use std::env;
  include!("no_atomic.rs");
=20=20
@@ -39,12 +39,43 @@ Index: rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
=20=20
      // Note that this is `no_*`, not `has_*`. This allows treating
      // `cfg(target_has_atomic =3D "ptr")` as true when the build script d=
oesn't
-Index: rustc-1.63.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+Index: rustc-1.64.0-src/vendor/crossbeam-utils/.cargo-checksum.json
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.63.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
-+++ rustc-1.63.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+--- rustc-1.64.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
++++ rustc-1.64.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CHANGELOG.md":"c2cdac68fbf3795e9c3cb0bbeace5f87736d0745fefbd3d=
b9c07f568dc70d1d1","Cargo.toml":"fc5b0f0f821aa944d4341dc97e7c3b4d4bf658483b=
a359b5bf2e53d8ad945ac9","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"7e7=
4dc72343ff57e83d0a84a9fbdd9ff1645894165909999b4c3d2fba94bc96c","no_atomic.r=
s":"916ed15218bb7b75a4e0d432430e7134efd27ca43ca8a8766e0c90e89febb602","src/=
atomic/atomic_cell.rs":"f1b407b62b981de47968236eabb932384722c4dd7b7f08f52c5=
9943aefd0b113","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
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
_lock.rs":"78433f55ee3defeea348d65abc78e03d63d6a304e09c568b27b403e9ad205771=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"21cf9b3e965529e5c0a6ff8fc1ec846bfe0006c=
41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869c922a1cbf929c3b7=
41bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6a16c865a5aced621=
6d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"7d82ee10ce34d7bc12c2122495e759=
3a9c41347ecdd64185af4ecf72cb1a7f83"}
+\ No newline at end of file
++{"files":{"CHANGELOG.md":"c2cdac68fbf3795e9c3cb0bbeace5f87736d0745fefbd3d=
b9c07f568dc70d1d1","Cargo.toml":"fc5b0f0f821aa944d4341dc97e7c3b4d4bf658483b=
a359b5bf2e53d8ad945ac9","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"916ed15218bb7b75a4e0d432430e7134efd27ca43ca8a8766e0c90e89febb602","src/=
atomic/atomic_cell.rs":"f1b407b62b981de47968236eabb932384722c4dd7b7f08f52c5=
9943aefd0b113","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
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
_lock.rs":"78433f55ee3defeea348d65abc78e03d63d6a304e09c568b27b403e9ad205771=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"21cf9b3e965529e5c0a6ff8fc1ec846bfe0006c=
41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869c922a1cbf929c3b7=
41bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6a16c865a5aced621=
6d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"7d82ee10ce34d7bc12c2122495e759=
3a9c41347ecdd64185af4ecf72cb1a7f83"}
+\ No newline at end of file
+Index: rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.64.0-src.orig/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
++++ rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
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
+Index: rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/build.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.64.0-src.orig/vendor/crossbeam-utils-0.8.8/build.rs
++++ rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/build.rs
+@@ -29,7 +29,7 @@ use std::env;
+ include!("no_atomic.rs");
+=20
+ fn main() {
+-    let target =3D match env::var("TARGET") {
++    let mut target =3D match env::var("TARGET") {
+         Ok(target) =3D> target,
+         Err(e) =3D> {
+             println!(
+@@ -40,6 +40,8 @@ fn main() {
+             return;
+         }
+     };
++    let vendor =3D env::var("TARGET_VENDOR").unwrap();
++    target =3D target.replace(&vendor, "-unknown");
+=20
+     // Note that this is `no_*`, not `has_*`. This allows treating
+     // `cfg(target_has_atomic =3D "ptr")` as true when the build script d=
oesn't
diff --git a/meta/recipes-devtools/rust/rust/hardcodepaths.patch b/meta/rec=
ipes-devtools/rust/rust/hardcodepaths.patch
index 2fdfe6d4637d..b6824bb979bc 100644
--- a/meta/recipes-devtools/rust/rust/hardcodepaths.patch
+++ b/meta/recipes-devtools/rust/rust/hardcodepaths.patch
@@ -5,11 +5,11 @@ to resolve these issues properly upstream.
 Upstream-Status: Inappropriate [patches need rework]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: rustc-1.62.0-src/src/tools/clippy/src/driver.rs
+Index: rustc-1.64.0-src/src/tools/clippy/src/driver.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.62.0-src.orig/src/tools/clippy/src/driver.rs
-+++ rustc-1.62.0-src/src/tools/clippy/src/driver.rs
-@@ -255,7 +255,6 @@ pub fn main() {
+--- rustc-1.64.0-src.orig/src/tools/clippy/src/driver.rs
++++ rustc-1.64.0-src/src/tools/clippy/src/driver.rs
+@@ -259,7 +259,6 @@ pub fn main() {
                      .and_then(|out| String::from_utf8(out.stdout).ok())
                      .map(|s| PathBuf::from(s.trim()))
              })
@@ -17,11 +17,11 @@ Index: rustc-1.62.0-src/src/tools/clippy/src/driver.rs
              .or_else(|| {
                  let home =3D option_env!("RUSTUP_HOME")
                      .or(option_env!("MULTIRUST_HOME"))
-Index: rustc-1.62.0-src/compiler/rustc_codegen_llvm/src/context.rs
+Index: rustc-1.64.0-src/compiler/rustc_codegen_llvm/src/context.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.62.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
-+++ rustc-1.62.0-src/compiler/rustc_codegen_llvm/src/context.rs
-@@ -167,46 +167,6 @@ pub unsafe fn create_module<'ll>(
+--- rustc-1.64.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
++++ rustc-1.64.0-src/compiler/rustc_codegen_llvm/src/context.rs
+@@ -166,46 +166,6 @@ pub unsafe fn create_module<'ll>(
          }
      }
=20=20
diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devto=
ols/rust/rust_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.63.0.bb
rename to meta/recipes-devtools/rust/rust_1.64.0.bb
--=20
2.35.1


