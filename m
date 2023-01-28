Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1736AC38142
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 17:39:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.18481.1674927562009848970
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 09:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LCc9DJ5/;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so5580832wmq.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 09:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/T3wDt2mIgpxCyfi10mxYJRB9YGPM60rbJGYerBBsM=;
        b=LCc9DJ5/t4/Wr58146urt8EOahXlUdyLpGBDYia75qRZNETlVYE2ewaOAjRH5OLfvW
         oePb3evcgWVOVr61TRSn7GfofDlihclvmC+pm1DFF5yIY6Qp4jbF8fmtI8VZQTTAYUgH
         TboyC2g/putJbcwMsCfFIiLQwzEHL7NKyMiyRhpi3SsiAUgXd3Qs4P7AH3xerU8O2k2j
         pe64UfeUBmXZFi4rChhOoQ+SPRVWVIn4Fs+aQnq+6l0DPmkvS+/RnjzkQA7ROx0hlKFu
         Q2IIYtJIQQUh8HSb7fhhAxnSc9QRB+ICSfUwXvDXeEH0h7saWz+xjrFQo2AduS85Ol4x
         uCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/T3wDt2mIgpxCyfi10mxYJRB9YGPM60rbJGYerBBsM=;
        b=4T0HAX7FfJLtlId6ONw2FS4A/Gy3a7YvlP2TpBcVE9rypOdD+mwTpw49KHgcSrAJiV
         E8BfMlgP6g3n8Bjmla7FZx2dvg1iMNZ8av8/4MKM+QHR15AT+0D1+paV5scr8QrfpaH6
         MG+8xrDtmX3+tmW25ZBUG/dTJ296YaZoo7NLadfjdQfJX/5Qj/ADp0I7ABw5Zs5txxn5
         0DgH60QzfjMVOTZX50Jfn2XvLPrKb4uScCzOCrJt2Gm3bsyWK26X6QyW/O87oo6PtOG9
         1O5mYMJd2DVvOJcy3WoVm+L5S8TEYqHjt0AX3PUijtTI3n8STLVDw+GXW9JgjMm8zg3N
         zEUw==
X-Gm-Message-State: AFqh2kqaV2w+caSt7gae+n+2GnuINmFSXWXVblfE3gFUG08yX9ttBRP6
	lo87DSBE8fgR3ps/SmpS/tSb+pEt16o=
X-Google-Smtp-Source: AMrXdXtgK0WCHheZGI90ntUlwT7Rlj3ABvYWGuMmHU/+XWwDY8KSYmeyk/71UXjqrsrtj0zmCKY/AA==
X-Received: by 2002:a05:600c:1c9d:b0:3da:db4:6105 with SMTP id k29-20020a05600c1c9d00b003da0db46105mr44518826wms.37.1674927559806;
        Sat, 28 Jan 2023 09:39:19 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id w8-20020a05600c2a0800b003db06224953sm8174592wme.41.2023.01.28.09.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 09:39:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Upgrade 1.66.1 -> 1.67.0
Date: Sat, 28 Jan 2023 17:39:12 +0000
Message-Id: <20230128173912.27980-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 17:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176460

Disable ZStd to avoid needing libzstd in llvm (mirrors zlib disable).
Generate complete list of rust-snapshot artefacts from src/stage0.json.
Drop clippy-driver reproducibility change as the code is gone from
upstream.

Release notes:
  https://releases.rs/docs/1.67.0/

License-Update: Unicode-TOU text added (already in our license string)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.66.1.bb =3D> cargo_1.67.0.bb} |  0
 .../rust/files/crossbeam_atomic.patch         | 12 ++--
 .../rust/files/hardcodepaths.patch            | 12 ----
 ...ibstd-rs_1.66.1.bb =3D> libstd-rs_1.67.0.bb} |  2 +-
 ....66.1.bb =3D> rust-cross-canadian_1.67.0.bb} |  0
 ...ust-llvm_1.66.1.bb =3D> rust-llvm_1.67.0.bb} |  3 +-
 meta/recipes-devtools/rust/rust-snapshot.inc  | 63 ++++++++++++++-----
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.66.1.bb =3D> rust_1.67.0.bb}   |  2 +-
 10 files changed, 59 insertions(+), 39 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.66.1.bb =3D> cargo_1.67.0.bb} (=
100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.66.1.bb =3D> libstd-rs_1.67=
.0.bb} (94%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.66.1.bb =3D> rust=
-cross-canadian_1.67.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.66.1.bb =3D> rust-llvm_1.67=
.0.bb} (98%)
 rename meta/recipes-devtools/rust/{rust_1.66.1.bb =3D> rust_1.67.0.bb} (99=
%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index f628e00d3336..7cd0b004e982 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.1%"
 QEMUVERSION ?=3D "7.2%"
 GOVERSION ?=3D "1.19%"
 LLVMVERSION ?=3D "15.%"
-RUSTVERSION ?=3D "1.66%"
+RUSTVERSION ?=3D "1.67%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.66.1.bb b/meta/recipes-devt=
ools/rust/cargo_1.67.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.66.1.bb
rename to meta/recipes-devtools/rust/cargo_1.67.0.bb
diff --git a/meta/recipes-devtools/rust/files/crossbeam_atomic.patch b/meta=
/recipes-devtools/rust/files/crossbeam_atomic.patch
index b24ac439c66e..51dd3c5f65aa 100644
--- a/meta/recipes-devtools/rust/files/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/files/crossbeam_atomic.patch
@@ -17,10 +17,10 @@ to create a patch that upstream might accept.
 Upstream-Status: Submitted [https://github.com/crossbeam-rs/crossbeam/pull=
/922]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: rustc-1.66.0-src/vendor/crossbeam-utils/build.rs
+Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/build.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/vendor/crossbeam-utils/build.rs
-+++ rustc-1.66.0-src/vendor/crossbeam-utils/build.rs
+--- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.12/build.rs
++++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/build.rs
 @@ -29,7 +29,7 @@ use std::env;
  include!("no_atomic.rs");
=20=20
@@ -39,10 +39,10 @@ Index: rustc-1.66.0-src/vendor/crossbeam-utils/build.rs
=20=20
      // Note that this is `no_`*, not `has_*`. This allows treating as the=
 latest
      // stable rustc is used when the build script doesn't run. This is us=
eful
-Index: rustc-1.66.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/.cargo-checksum.json
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
-+++ rustc-1.66.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+--- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.12/.cargo-checksum.js=
on
++++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/.cargo-checksum.json
 @@ -1 +1 @@
 -{"files":{"CHANGELOG.md":"65d3e11edf9498bdbc930c8c3878b7d3a90c1a0b1698597=
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
diff --git a/meta/recipes-devtools/rust/files/hardcodepaths.patch b/meta/re=
cipes-devtools/rust/files/hardcodepaths.patch
index 178f354cf834..cb99e8b01136 100644
--- a/meta/recipes-devtools/rust/files/hardcodepaths.patch
+++ b/meta/recipes-devtools/rust/files/hardcodepaths.patch
@@ -5,18 +5,6 @@ to resolve these issues properly upstream.
 Upstream-Status: Inappropriate [patches need rework]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: rustc-1.66.0-src/src/tools/clippy/src/driver.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/src/tools/clippy/src/driver.rs
-+++ rustc-1.66.0-src/src/tools/clippy/src/driver.rs
-@@ -259,7 +259,6 @@ pub fn main() {
-                     .and_then(|out| String::from_utf8(out.stdout).ok())
-                     .map(|s| PathBuf::from(s.trim()))
-             })
--            .or_else(|| option_env!("SYSROOT").map(PathBuf::from))
-             .or_else(|| {
-                 let home =3D option_env!("RUSTUP_HOME")
-                     .or(option_env!("MULTIRUST_HOME"))
 Index: rustc-1.66.0-src/compiler/rustc_codegen_llvm/src/context.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- rustc-1.66.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.67.0.bb
similarity index 94%
rename from meta/recipes-devtools/rust/libstd-rs_1.66.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.67.0.bb
index 8802e9790ce4..f4e5abc0cc43 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.66.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Rust standard libaries"
 HOMEPAGE =3D "http://www.rust-lang.org"
 SECTION =3D "devel"
 LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"
-LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D92289ed52a60b63ab715612=
ad2915603"
+LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3Dc2cccf560306876da3913d7=
9062a54b9"
=20
 require rust-source.inc
=20
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.66.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.67.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.66.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.67.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.1.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.67.0.bb
similarity index 98%
rename from meta/recipes-devtools/rust/rust-llvm_1.66.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.67.0.bb
index 4cc57d12aec0..4da11da8ef31 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.1.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.rust-lang.org"
=20
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE =3D "15.0.2"
+LLVM_RELEASE =3D "15.0.6"
=20
 require rust-source.inc
=20
@@ -37,6 +37,7 @@ EXTRA_OECMAKE =3D " \
     -DLLVM_BUILD_DOCS=3DOFF \
     -DLLVM_ENABLE_TERMINFO=3DOFF \
     -DLLVM_ENABLE_ZLIB=3DOFF \
+    -DLLVM_ENABLE_ZSTD=3DOFF \
     -DLLVM_ENABLE_LIBXML2=3DOFF \
     -DLLVM_ENABLE_FFI=3DOFF \
     -DLLVM_INSTALL_UTILS=3DON \
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 25192c9f7666..d5317279db6e 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -3,30 +3,61 @@
 ## Rust is self-hosting and bootstraps itself with a pre-built previous ve=
rsion of itself.
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
-## TODO: find a way to add additional SRC_URIs based on the contents of an
-##       earlier SRC_URI.
=20
-SNAPSHOT_VERSION =3D "1.65.0"
+SNAPSHOT_VERSION =3D "1.66.1"
=20
-# TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2b588cd2d49688c0c33b74666=
14123e8fe4c910f4d802fc0ff0662b1772816a9"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "62b89786e195fc5a8a262f83118d=
6689832b24228c9d303cba8ac14dc1e9adc8"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "82547aacaf42fc3c2970ec31b967=
51dfbeba3dffe1a042a3780bd670c29a89bf"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "61736a6ec61a4eaa9a7b3f219d9=
f8166ae97c1acd54b5e904c15fb8caff06250"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "9d96ba6a5a255339cd04af07=
9d906753d56c85503c727279c227d24bd4987e24"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "b4d842594ba11a84712c2d1bbf7=
f7945cfcc2485c72861a23b488fefba5c6a45"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "735b681c8a6e60925c76d6cc=
899e78b4cb4562ada24a1f265b2021c1faad78ad"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "67c3d3545fd898c1383071c0f62=
96453565e0da10903c50652d7bf679b53e8a2"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "3fd483c0d58673ab69862824408=
c8a48612827ddcdeaaca0f8fbe5ca02214a4c"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "fb0c1aa922c4e41fead9d350907693=
09cb45648d6f77ccbe8d2ba125a75cc2af"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "b32cbbb9002f8a20b302823a2ff=
122a91f077b5e1a7bc1340de690ded86bf10b"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "e2ab464f43d6319ddb9796cbfacd44=
4dc40f3d0e7503d672c23ecbe0daf11e1c"
=20
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "ce18b44300f7d5d94856=
cef5b270ba010061fafa411beb9782207e26cbab88a6"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "a6ce7aadd10a3fd84fe4717=
a59378421a65b101b61f27eed8b09336b8daf62cf"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "9393de910df7cd6947e3804=
60a1144ac2373a36c776c7367a81212a51a92d9a7"
+SRC_URI[cargo-snapshot-mips.sha256sum] =3D "0f03d6d35b6044dc81a4d5eb9bd42c=
9d1e8c0e85363f960ff921ebe46294ae45"
+SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "e6029b4cec5d6c06c34a0dbec61=
4fa252fdc8cf31013d6e561112cf90f742568"
+SRC_URI[rustc-snapshot-mips.sha256sum] =3D "64ad92525ae1f018e08c055d7892e0=
fc613437bde8cf614b1c2a8986488290e7"
+
+SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "74d757a456d2fbb418c253db203c=
0bb3f71d797e4ab3e2804b6c594a18e0f199"
+SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "8bfa3d6079c6df049978fe61b=
1ccaf992aecd006e23df2439ecfc883bd8bc31b"
+SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "f2674d60ce52c49048e9823af57a=
ae24bb6722e8998783819ec884222caeccf3"
+
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "f771fa4294c8e0d5d0e58129fe9=
d4e0913566dd43523b6f0af19a08004004df8"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "417b12a9bf090d694514937c=
d8c321ed625f155248f63c0de8207b17fa4b35b1"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "ff16d02c100086175b9fbcfff4d=
3705fb4f5b58a6506ec7667dc86c56b8bb3c7"
+
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "9a933d39e6b028e73db9cc095=
9af84128824e0b11554e3a0171cad7635a343c7"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "7074c4ea9fcc683ceb0adc=
ca6ba07544a1d91f0e5d2a4cf14c81eb14316ebf35"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f5bff79d517e2f72183946288=
1331bdc1b8323a434f4ebe0529f93213adb2a24"
+
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "29fa2e003f4bf3e37a3fb50=
6d5b7ab19eb6412b5966d865e082b354637d5d84a"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "4c64a09be872b5832b50=
d681fbe29691b6a5d3e23ee5535020fa22b8b453c770"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "3b4322b519b0f7fbcf88511=
b2061be1499921517d810d7696be58a16467d4589"
+
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "f362cf575fde92f988d5b1fe1=
9fd463a1905d8d2a3844168034df49b1dffb10b"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "776eff6f451845e8822471=
4ee6da7819e34f01b7625bf927394c2b91e5c8243c"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "84bea70d3acb6af04ae4c0f49=
f904bba4e2644b92c5996aacbafd7610dd0e147"
+
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "f69ea091fa1ee4871a46cb9fa1da5=
b81fa2980687f3bedbc4677a4a82f8da0c0"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "51d1567e1d28e43c2165886f5a=
4955dcdaa41aa5ddcec5fb08200491fd1f6062"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "25a047db8ec0627bb7054eafe6edc=
a6ce4c473b30d6766b30cbff1c536d0673b"
+
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "a636f83eb2327a66f484b9592ab3=
05c6642df16fc80d0d1cb727e766a60da904"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "c5e2c9b160bd8d99514f13cfb=
c0e42a722fd9ca14e6aaca4b9b77731a7a48377"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "242855e2626860aede6957dc5648=
1cc02acf8cad12fa5bbbcbd93f9c51f0b3ad"
+
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "90eb8e2490283930e682b79842d=
664d4867414563353d53dafc47eccf44aea17"
+
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "3aee03fa61c28bb242023efb=
09a22e38a76b075cc72bcad9894560be8b28a927"
=20
 SRC_URI +=3D " \
-    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
-    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=3Drust=
c-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
-    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=3Dcarg=
o-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
+    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
+    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=3Drustc-snapsho=
t-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
+    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=3Dcargo-snapsho=
t-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
 "
=20
+RUST_DIST_SERVER =3D "https://static.rust-lang.org"
+
 RUST_STD_SNAPSHOT =3D "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unk=
nown-linux-gnu"
 RUSTC_SNAPSHOT =3D "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-l=
inux-gnu"
 CARGO_SNAPSHOT =3D "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-l=
inux-gnu"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 22e97174a98c..268e17bcf8ef 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUS=
T_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=
=3D${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f033=
4e7fb343cb4a0b81ebe"
+SRC_URI[rust.sha256sum] =3D "9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d=
5db8946a448c9432c6d"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.66.1.bb b/meta/recipes-devto=
ols/rust/rust_1.67.0.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust_1.66.1.bb
rename to meta/recipes-devtools/rust/rust_1.67.0.bb
index eba933ddeda4..f4ac8bc6350b 100644
--- a/meta/recipes-devtools/rust/rust_1.66.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.67.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Rust compiler and runtime libaries"
 HOMEPAGE =3D "http://www.rust-lang.org"
 SECTION =3D "devel"
 LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D92289ed52a60b63ab715612ad2915=
603"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dc2cccf560306876da3913d79062a5=
4b9"
=20
 inherit rust
 inherit cargo_common
--=20
2.39.0


