Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730AFC77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 15:41:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.11811.1682523662674687052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 08:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=c1kNmfVv;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-2f9b9aa9d75so4666437f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682523661; x=1685115661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/r/Coov7xuwev9BYy4j9H6uwj8kc6ByG9+k9V5GMkEw=;
        b=c1kNmfVvzfwgEDoCcwZ15zAquleqlxnp7pCPRE8CYxiNfEX8eqf5tP/MjoS+faiQRf
         KNMDy2I8lgKm/0T3qZ35Y4c2JS1Ry8Lk7bU+62rO9lu0szSYJ4EQgV1UIxHifLf46sTj
         zd7U12j8yYWF1sfZWZ+AIz2Pfo0kgEm3NT9YU5/wpWIfHzCuhlOIVIWfqJ0ISdVZPU2R
         lS6O+J8BHYHXMhTUerNpTByu2nM6hOv0LqyRnyiOCsuJyAaPxYe6PvSVkeDt5oe6D4IU
         A2BOXgIJN7O1dQE3ccEO3YJuHI9lQYrfjz9EljbG28wL7zuMejO6Dq6kaFN1mgyInPDn
         wqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682523661; x=1685115661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r/Coov7xuwev9BYy4j9H6uwj8kc6ByG9+k9V5GMkEw=;
        b=as9lm2Tdr1P9PIbd7cJhutuJ6CeW/kk/ZkiNVXrx8fR1kW2krY/tjTYtr3JEfA3wtD
         Y3ggYBgUMd2yYpPlxNlCxe3C7utYytJoYf9mZ9PZxw6KRz7MS9g3RlvSMQQY4/lNogAw
         o5Rs2bS3y+9h1TKdPQRTwlF6oMAxsHmyx4/R4E9clhcOwEKRQwxvbuE/V6Vdu5Zlbpyo
         U/1P28PKH0qXH5hVHTJhxAp+xjadpRPWOYxbLKeg0NLjPdxxx98eTDmUMt3QY6toYkwe
         ERXXyTiLRX9WruEUfXYPIOv85Wo+eaWs3XWyjNP84u7TE5hDk2rD9DlYWjlhdspc9tlR
         AjHA==
X-Gm-Message-State: AAQBX9fEG7TVdQX/iELYZWJ/cwe1LgiXu6MovR88/h+y3RxNsDxpC6i+
	FTX3pCTzyGXJCIb/6VQcuw6LjIDYm7E=
X-Google-Smtp-Source: AKy350YHrSRahgs3qfphFyRxGga1u2I6GkE5QHbnFshLiJ7tk1hzKqPl29wifERIPTKaP2CztCfCWQ==
X-Received: by 2002:adf:cd86:0:b0:2f5:6430:35c with SMTP id q6-20020adfcd86000000b002f56430035cmr14683636wrj.26.1682523659463;
        Wed, 26 Apr 2023 08:40:59 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id k5-20020adff5c5000000b002f103ca90cdsm16102404wrp.101.2023.04.26.08.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 08:40:58 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] rust: Upgrade 1.68.2 -> 1.69.0
Date: Wed, 26 Apr 2023 16:40:53 +0100
Message-Id: <20230426154053.29287-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 15:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180446

Rebase patches, drop crossbeam_atomic is this fully merged upstream.

https://blog.rust-lang.org/2023/04/20/Rust-1.69.0.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Rebase 0001-Do-not-use-LFS64-on-linux-with-musl correctly

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.68.2.bb =3D> cargo_1.69.0.bb} |  0
 ...-Do-not-use-LFS64-on-linux-with-musl.patch | 54 +++++++--------
 ...efine-SOCK_SEQPACKET-in-common-place.patch | 52 ++++++++++-----
 .../rust/files/crossbeam_atomic.patch         | 50 --------------
 .../rust/files/hardcodepaths.patch            | 11 ++--
 ...ibstd-rs_1.68.2.bb =3D> libstd-rs_1.69.0.bb} |  0
 ....68.2.bb =3D> rust-cross-canadian_1.69.0.bb} |  0
 ...ust-llvm_1.68.2.bb =3D> rust-llvm_1.69.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 66 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  3 +-
 .../rust/{rust_1.68.2.bb =3D> rust_1.69.0.bb}   |  0
 12 files changed, 99 insertions(+), 139 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.68.2.bb =3D> cargo_1.69.0.bb} (=
100%)
 delete mode 100644 meta/recipes-devtools/rust/files/crossbeam_atomic.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.68.2.bb =3D> libstd-rs_1.69=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.2.bb =3D> rust=
-cross-canadian_1.69.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.68.2.bb =3D> rust-llvm_1.69=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.68.2.bb =3D> rust_1.69.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index f9e88ca42699..dc4cd470e7b5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.1%"
 QEMUVERSION ?=3D "7.2%"
 GOVERSION ?=3D "1.20%"
 LLVMVERSION ?=3D "15.%"
-RUSTVERSION ?=3D "1.68%"
+RUSTVERSION ?=3D "1.69%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.68.2.bb b/meta/recipes-devt=
ools/rust/cargo_1.69.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.68.2.bb
rename to meta/recipes-devtools/rust/cargo_1.69.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linu=
x-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-=
on-linux-with-musl.patch
index da72665bbde2..77f22f42b603 100644
--- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-=
musl.patch
+++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-=
musl.patch
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
  3 files changed, 38 insertions(+), 12 deletions(-)
=20
-diff --git a/library/std/src/os/linux/fs.rs b/library/std/src/os/linux/fs.=
rs
-index 479bbcc17a8..ab0b2a3eda3 100644
---- a/library/std/src/os/linux/fs.rs
-+++ b/library/std/src/os/linux/fs.rs
+Index: rustc-1.69.0-src/library/std/src/os/linux/fs.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/library/std/src/os/linux/fs.rs
++++ rustc-1.69.0-src/library/std/src/os/linux/fs.rs
 @@ -329,7 +329,14 @@ pub trait MetadataExt {
  impl MetadataExt for Metadata {
      #[allow(deprecated)]
@@ -39,11 +39,11 @@ index 479bbcc17a8..ab0b2a3eda3 100644
      }
      fn st_dev(&self) -> u64 {
          self.as_inner().as_inner().st_dev as u64
-diff --git a/library/std/src/sys/unix/fd.rs b/library/std/src/sys/unix/fd.=
rs
-index dbaa3c33e2e..5d31557bd11 100644
---- a/library/std/src/sys/unix/fd.rs
-+++ b/library/std/src/sys/unix/fd.rs
-@@ -115,9 +115,12 @@ pub fn read_to_end(&self, buf: &mut Vec<u8>) -> io::R=
esult<usize> {
+Index: rustc-1.69.0-src/library/std/src/sys/unix/fd.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/library/std/src/sys/unix/fd.rs
++++ rustc-1.69.0-src/library/std/src/sys/unix/fd.rs
+@@ -121,9 +121,12 @@ impl FileDesc {
      }
=20=20
      pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<usiz=
e> {
@@ -58,7 +58,7 @@ index dbaa3c33e2e..5d31557bd11 100644
          use libc::pread64;
=20=20
          unsafe {
-@@ -181,9 +184,12 @@ pub fn is_write_vectored(&self) -> bool {
+@@ -276,9 +279,12 @@ impl FileDesc {
      }
=20=20
      pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize> {
@@ -73,11 +73,11 @@ index dbaa3c33e2e..5d31557bd11 100644
          use libc::pwrite64;
=20=20
          unsafe {
-diff --git a/library/std/src/sys/unix/fs.rs b/library/std/src/sys/unix/fs.=
rs
-index aea0c26ee8b..e7be4729ca6 100644
---- a/library/std/src/sys/unix/fs.rs
-+++ b/library/std/src/sys/unix/fs.rs
-@@ -45,19 +45,24 @@
+Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/library/std/src/sys/unix/fs.rs
++++ rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
+@@ -46,9 +46,13 @@ use libc::{c_int, mode_t};
      all(target_os =3D "linux", target_env =3D "gnu")
  ))]
  use libc::c_char;
@@ -93,12 +93,11 @@ index aea0c26ee8b..e7be4729ca6 100644
  use libc::fstatat64;
  #[cfg(any(
      target_os =3D "android",
-     target_os =3D "solaris",
-     target_os =3D "fuchsia",
+@@ -57,9 +61,10 @@ use libc::fstatat64;
      target_os =3D "redox",
--    target_os =3D "illumos"
-+    target_os =3D "illumos",
-+    target_env =3D "musl"
+     target_os =3D "illumos",
+     target_os =3D "nto",
++    target_env =3D "musl",
  ))]
  use libc::readdir as readdir64;
 -#[cfg(target_os =3D "linux")]
@@ -106,7 +105,7 @@ index aea0c26ee8b..e7be4729ca6 100644
  use libc::readdir64;
  #[cfg(any(target_os =3D "emscripten", target_os =3D "l4re"))]
  use libc::readdir64_r;
-@@ -77,7 +82,13 @@
+@@ -80,7 +85,13 @@ use libc::{
      dirent as dirent64, fstat as fstat64, fstatat as fstatat64, ftruncate=
64, lseek64,
      lstat as lstat64, off64_t, open as open64, stat as stat64,
  };
@@ -120,7 +119,7 @@ index aea0c26ee8b..e7be4729ca6 100644
      target_os =3D "linux",
      target_os =3D "emscripten",
      target_os =3D "l4re",
-@@ -87,7 +98,7 @@
+@@ -90,7 +101,7 @@ use libc::{
      dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lseek=
 as lseek64,
      lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
  };
@@ -129,7 +128,7 @@ index aea0c26ee8b..e7be4729ca6 100644
  use libc::{dirent64, fstat64, ftruncate64, lseek64, lstat64, off64_t, ope=
n64, stat64};
=20=20
  pub use crate::sys_common::fs::try_exists;
-@@ -260,6 +271,7 @@ unsafe impl Sync for Dir {}
+@@ -277,6 +288,7 @@ unsafe impl Sync for Dir {}
  #[cfg(any(
      target_os =3D "android",
      target_os =3D "linux",
@@ -137,7 +136,7 @@ index aea0c26ee8b..e7be4729ca6 100644
      target_os =3D "solaris",
      target_os =3D "illumos",
      target_os =3D "fuchsia",
-@@ -292,6 +304,7 @@ struct dirent64_min {
+@@ -311,6 +323,7 @@ struct dirent64_min {
  }
=20=20
  #[cfg(not(any(
@@ -145,7 +144,7 @@ index aea0c26ee8b..e7be4729ca6 100644
      target_os =3D "android",
      target_os =3D "linux",
      target_os =3D "solaris",
-@@ -745,7 +758,7 @@ pub fn file_name(&self) -> OsString {
+@@ -786,7 +799,7 @@ impl DirEntry {
      }
=20=20
      #[cfg(all(
@@ -154,7 +153,7 @@ index aea0c26ee8b..e7be4729ca6 100644
          not(miri)
      ))]
      pub fn metadata(&self) -> io::Result<FileAttr> {
-@@ -769,7 +782,7 @@ pub fn metadata(&self) -> io::Result<FileAttr> {
+@@ -810,7 +823,7 @@ impl DirEntry {
      }
=20=20
      #[cfg(any(
@@ -163,6 +162,3 @@ index aea0c26ee8b..e7be4729ca6 100644
          miri
      ))]
      pub fn metadata(&self) -> io::Result<FileAttr> {
---=20
-2.39.0
-
diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACK=
ET-in-common-place.patch b/meta/recipes-devtools/rust/files/0001-musl-Defin=
e-SOCK_SEQPACKET-in-common-place.patch
index 54478a8e003f..b6d94e3a1a36 100644
--- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
+++ b/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
@@ -19,8 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  vendor/libc/src/unix/linux_like/linux/musl/mod.rs          | 1 +
  7 files changed, 2 insertions(+), 7 deletions(-)
=20
---- a/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mod.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm=
/mod.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mo=
d.rs
 @@ -326,7 +326,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 1;
@@ -29,8 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20=20
  pub const EDEADLK: ::c_int =3D 35;
  pub const ENAMETOOLONG: ::c_int =3D 36;
---- a/vendor/libc/src/unix/linux_like/linux/musl/b32/hexagon.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b32/hexagon.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hex=
agon.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexago=
n.rs
 @@ -296,7 +296,6 @@ pub const SIG_BLOCK: ::c_int =3D 0x000000;
  pub const SIG_UNBLOCK: ::c_int =3D 0x01;
  pub const SOCK_DGRAM: ::c_int =3D 2;
@@ -39,8 +43,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  pub const SOCK_STREAM: ::c_int =3D 1;
  pub const SOL_CAIF: ::c_int =3D 278;
  pub const SOL_IUCV: ::c_int =3D 277;
---- a/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/mod.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mip=
s/mod.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/m=
od.rs
 @@ -350,7 +350,6 @@ pub const ERFKILL: ::c_int =3D 167;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 2;
@@ -49,8 +55,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20=20
  pub const SA_ONSTACK: ::c_int =3D 0x08000000;
  pub const SA_SIGINFO: ::c_int =3D 8;
---- a/vendor/libc/src/unix/linux_like/linux/musl/b32/powerpc.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b32/powerpc.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/pow=
erpc.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powerp=
c.rs
 @@ -257,7 +257,6 @@ pub const MAP_STACK: ::c_int =3D 0x020000;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 1;
@@ -59,8 +67,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20=20
  pub const EDEADLK: ::c_int =3D 35;
  pub const ENAMETOOLONG: ::c_int =3D 36;
---- a/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mod.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86=
/mod.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mo=
d.rs
 @@ -315,7 +315,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 1;
@@ -69,8 +79,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20=20
  pub const EDEADLK: ::c_int =3D 35;
  pub const ENAMETOOLONG: ::c_int =3D 36;
---- a/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod=
.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
 @@ -135,8 +135,6 @@ pub const __SIZEOF_PTHREAD_MUTEX_T: usiz
=20=20
  pub const SOCK_NONBLOCK: ::c_int =3D 2048;
@@ -80,8 +92,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  extern "C" {
      pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uin=
t) -> ::ssize_t;
  }
---- a/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
+Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
++++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
 @@ -526,6 +526,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
=20=20
  pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
@@ -90,9 +104,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  pub const SOCK_DCCP: ::c_int =3D 6;
  pub const SOCK_PACKET: ::c_int =3D 10;
=20=20
---- a/vendor/libc/.cargo-checksum.json
-+++ b/vendor/libc/.cargo-checksum.json
+Index: rustc-1.69.0-src/vendor/libc/.cargo-checksum.json
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.69.0-src.orig/vendor/libc/.cargo-checksum.json
++++ rustc-1.69.0-src/vendor/libc/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"89e8938bf82dadf7854b0831c879ef1c66708a3=
917b0c48079aadbc2855b18b8","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"cecfa3f926ab4a9c8=
7cd59cc0d687f98eceb6035b0dde185152e5206d090f8d0","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"e54e72e15cf4ab2df88da9=
ac3b69fa12e918b0bcfeadc81843b2a838b43d9547","src/fuchsia/no_align.rs":"303f=
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
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"1cc76b056d5925aedae04ead411057dc5c6c9bd3948609fdb30164ac1fb6565e"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"8986a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57=
602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"badda6f0f7666f38345b1f4ca78817a47bc92bbdcdc3a1377f376f4e=
08c316e5","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"327700c5668be863f1fea205c82b0402e2936b883df=
63dda677716c30a50a284","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"7f689e9a944c919834ec852b30c224f98e14b4b4087571adefeea5abad=
5d6374","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"9b6fa1c3f5217f9482e0bed3bd0ea2905cdf56d628307cea48e49d8e00a6b09d","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"26bda8cf730ab4868523a6ed7c513f51885cad30cdd02da905ff35b597576415","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7=
fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"bd80ce2ff628ed5eaa856ebe8b6a8fb0=
e89d1c9728040b9ee6b967beb4bcf3a7","src/unix/bsd/mod.rs":"6f7e4f0affa04e5c26=
375875389a9891f69930bb56842cf20526aad3a0f64299","src/unix/bsd/netbsdlike/mo=
d.rs":"34f60d73631f3c59936c87db1f62ddb8f693901c3cb199f7f370882e84d509fa","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"107a4aa396b8383c66e0ace2f941450b4b69146558c=
dc4d9fbe33eeab51760f1","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
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
/mod.rs":"38b7d65a86701a75a9047a3ef3b006f09ffbb33ab2312174bcee889efb74e100"=
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
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"14171bbff41ad7f11219806=
4b80f7b86a78c2c36c689d5cc04a748f2186c6bf3","src/unix/haiku/native.rs":"dbfc=
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
3b1dc2","src/unix/linux_like/android/mod.rs":"fbfcd29a13b58a89841ea23737b45=
d1a3d69e8ec72bd168755297c4d0eb701f3","src/unix/linux_like/emscripten/align.=
rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/mod.rs":"6ef4652dfb94e3c58aed5133ece982ad30569d=
46b6b1054552cd61905fa61690","src/unix/linux_like/emscripten/no_align.rs":"0=
128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/=
linux_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93=
a8d02641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"46dd663=
4e564fb1b60c8a2d1018ef8f365d1a8ed26f162c99528922d06d14134","src/unix/linux_=
like/linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8=
f1a43adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c=
6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/l=
inux/arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef=
02206a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec044=
0f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_lik=
e/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93=
f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like=
/linux/gnu/b32/arm/mod.rs":"5bd3f6b3484e049ddaac95f411b0d82cbf1cd28e6a5defb=
c927bd917f5f7d299","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa9=
2f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linu=
x_like/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214=
d1ae7d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs"=
:"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/un=
ix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c=
87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs"=
:"8da281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/un=
ix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02=
f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/=
align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119=
","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"5e7c1e29aeb82fc422f45=
b73fb0cf3d13d0902300f9150d2755a9074f8d96999","src/unix/linux_like/linux/gnu=
/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440=
895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e=
9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/=
linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef=
8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5=
e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_=
like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac5=
66eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp=
32.rs":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","=
src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd42=
6442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu=
/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830=
c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"666beae35=
371cb54a4ad091764e0e3ca4983d5205179c119a8ff97d3ae301869","src/unix/linux_li=
ke/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb77=
71334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch=
64/mod.rs":"17e9478b6a5830f6b8f6bea4ccab712cfd1972cdfb43b97408a068e4ea92410=
6","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/g=
nu/b64/mips64/mod.rs":"80b4b97a41564290c510e68a1fb20cfd8424206f010e71a596f1=
2877de886a71","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88527=
57b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux=
/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc=
9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"=
a595e37c2325ceb40ef66c634bd3c255ad184a1d70ff8025e98a075f0ec67704","src/unix=
/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111b=
eb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/risc=
v64/mod.rs":"ef4b13477ffd8532fb6705ca3fa63a1f13e8d19ee39b083c5355dfce430c1a=
5b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"788fde4fa1919859cc028b59d=
a31de00449edd2b2c1530ae76134beac418b73c","src/unix/linux_like/linux/gnu/b64=
/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"c4fa0ede3f78=
b21a9982667922cccd0681bee3cb6d42208ea9958f65e93d6308","src/unix/linux_like/=
linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b3=
08ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"e=
37e0421290b152fe508883181c41225e09dd5452a6b085e8d807b3b54823028","src/unix/=
linux_like/linux/gnu/b64/x86_64/not_x32.rs":"c1b6345ce14f67d1b2e2f7f2c0ff9a=
074c07acbd348df69cb4558bda8c8fb9ae","src/unix/linux_like/linux/gnu/b64/x86_=
64/x32.rs":"3f4d2aeadb7d2620cad09564abdbfc5cf02eeb5a27f2bab8a4e9b4bdbdb258a=
5","src/unix/linux_like/linux/gnu/mod.rs":"e31aa4bd147c83d05dcd13baca4b9f67=
6320a7713ff50de08b51d0c88f8241a3","src/unix/linux_like/linux/gnu/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/mod.rs":"ddd008ff6304dca5d6fe9b452eb7a69745098bce4783=
4d0999abdedd5978c2b3","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e=
8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/l=
inux_like/linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa=
7df84ee0cfd3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs=
":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/u=
nix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6e=
bfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs":"16a7a03d998a5db11be9ee81525c7faec4623383260e8bc125b1c53a050fde7=
5","src/unix/linux_like/linux/musl/b32/mod.rs":"580e27c5ce3344df686f1ffc08f=
dfa2c282d1ceb623d778c50d210d4bd65ec7e","src/unix/linux_like/linux/musl/b32/=
powerpc.rs":"dc52adc264c34bce80753d6bd064e8fc4b8237fa1e5c5315ccb6c72df74c28=
13","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7=
c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linu=
x/musl/b32/riscv32/mod.rs":"e57dc5562553aab6d0765e0ec266254aa52975f8757bfe9=
7e0c6028fa7d5d37c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77=
fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linu=
x_like/linux/musl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da056287f=
c42f8e2ccf1d5b2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/align=
.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","sr=
c/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426=
442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl=
/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e6080=
1d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332b=
b056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/li=
nux/musl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e5=
5cd533fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55=
afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like=
/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.r=
s":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294","src/=
unix/linux_like/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb34=
2e8aa41544cffacdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64=
/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6=
e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e=
6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/mu=
sl/mod.rs":"8d8b50a0bf7ec53bd4d2ea92e8bfae14529f0beb3f22a65b55623f7086fee8a=
c","src/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae=
6a982ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustiv=
e.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","s=
rc/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7=
ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/ali=
gn.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","=
src/unix/linux_like/linux/uclibc/arm/mod.rs":"bf2dcf0a468f386899f572324f3bc=
14be1974f570afdfff1075ca6c5dd57710d","src/unix/linux_like/linux/uclibc/arm/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a5=
7b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/l=
inux/uclibc/mips/mips32/mod.rs":"d2fc251754458b697ef6e599f0a670ebca18f61e40=
26bf681be4e2baa896b9df","src/unix/linux_like/linux/uclibc/mips/mips32/no_al=
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
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"420dbea99e99091f333641e202=
960fa4bed0733de2a834e610708555be6bab4c","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2=
d6a0a8","src/unix/linux_like/mod.rs":"03ae2e1f8113ed650e1c9691e715254dd6b6d=
13cc829b639d5857336ecd11b24","src/unix/mod.rs":"4647dc713fb4208df76fe6009b9=
716eef1d9e09a77f6b2f1b793d63537b4c670","src/unix/newlib/aarch64/mod.rs":"ba=
c93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/n=
ewlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d85=
02b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3f=
a0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4b=
aabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/gener=
ic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","=
src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd=
0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"494e56628d4408bf66ad30ff7=
1fbd21bc33d9037935c411dff7bf73dd3f1070b","src/unix/newlib/no_align.rs":"e07=
43b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/ne=
wlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f=
831be393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93f=
b2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8=
a8f25138a200e616048e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"=
00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix=
/solarish/illumos.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad=
127b82809fa7","src/unix/solarish/mod.rs":"eace25beaa4874bfc2451f8136efc261f=
9dfb7a30caab3c97c708068d5431bbf","src/unix/solarish/solaris.rs":"41b350a89d=
df01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/=
x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e",=
"src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3=
ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22=
460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"9=
8f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxwor=
ks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e8=
8","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95=
a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21=
a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd0=
2557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"5=
52f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxwor=
ks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b=
514a","src/wasi.rs":"3f6219f036ac1d917ab5fa7323e3770857f566bc4189a9d4c4ea8c=
a6517b8953","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0=
215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44=
af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"7fe35=
c1f5e6272acfba059a1ad7a78b144f5bc63456f6377d58bbc42cc23f509","src/windows/m=
svc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986=
f4","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e777=
4c7e545f21f1f4"},"package":"db6d7e329c562c5dfab7a46a2afabc8b987ab9a4834c9d1=
ca04dc54c1546cef8"}
+-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"cec0b42b20e776ac9165b5a5eedfbd8fc033700=
cacabfa4209c60d35833e42f1","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"cecfa3f926ab4a9c8=
7cd59cc0d687f98eceb6035b0dde185152e5206d090f8d0","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"1b4e6c34b01b4c970f4d4c=
044d1642020e0fc2ea1b8442e8f1a9b698569ab1f6","src/fuchsia/no_align.rs":"303f=
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
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"1cc76b056d5925aedae04ead411057dc5c6c9bd3948609fdb30164ac1fb6565e"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"8986a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57=
602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"badda6f0f7666f38345b1f4ca78817a47bc92bbdcdc3a1377f376f4e=
08c316e5","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"327700c5668be863f1fea205c82b0402e2936b883df=
63dda677716c30a50a284","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"7f689e9a944c919834ec852b30c224f98e14b4b4087571adefeea5abad=
5d6374","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"9b6fa1c3f5217f9482e0bed3bd0ea2905cdf56d628307cea48e49d8e00a6b09d","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"26bda8cf730ab4868523a6ed7c513f51885cad30cdd02da905ff35b597576415","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7=
fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"bd80ce2ff628ed5eaa856ebe8b6a8fb0=
e89d1c9728040b9ee6b967beb4bcf3a7","src/unix/bsd/mod.rs":"0c672b075b5616fca2=
cc56c00ee31c3f554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mo=
d.rs":"34f60d73631f3c59936c87db1f62ddb8f693901c3cb199f7f370882e84d509fa","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"107a4aa396b8383c66e0ace2f941450b4b69146558c=
dc4d9fbe33eeab51760f1","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
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
/mod.rs":"38b7d65a86701a75a9047a3ef3b006f09ffbb33ab2312174bcee889efb74e100"=
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
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"891f77891349938ffb2048d=
b0446e28f2b7f78a0286042d0f0a9af6c2d4570af","src/unix/haiku/native.rs":"dbfc=
bf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/hai=
ku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b=
7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10cec=
cefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b=
8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab=
832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/l=
inux_like/android/b32/arm.rs":"007391f35663762d8097a8a5ae301accb82c729713da=
0dfd9631c4bc69d9305e","src/unix/linux_like/android/b32/mod.rs":"7c173e03751=
19bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like=
/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f=
0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"81b4ab3ffc=
347e819f2f62c09dcd923d9d12d14b3d0e66ddc06ab78fa75a4b88","src/unix/linux_lik=
e/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs"=
:"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/un=
ix/linux_like/android/b64/aarch64/mod.rs":"f12594f7a57654ea63794822761c1ef9=
029ee5cef6bbad498c928a5bff2dfade","src/unix/linux_like/android/b64/mod.rs":=
"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/uni=
x/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6=
832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64=
/mod.rs":"80e9f93fed838a48b4e2e8d77b95c72cfd7c0647bcce63851555c5ad16dad143"=
,"src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719=
aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64=
/x86_64/mod.rs":"40be3b9dac9b52f3fd341fae4593a8c8c11a79ed694bcccf82f8810253=
c77492","src/unix/linux_like/android/mod.rs":"bf37384b99034eb1817303d9e1b35=
fe895da1010b024ada128e84059dad2c73b","src/unix/linux_like/emscripten/align.=
rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/mod.rs":"24a6b0eadc011ee75c5bcbd18fe9f30d64006b=
71ec1416f6352e6015917240fc","src/unix/linux_like/emscripten/no_align.rs":"0=
128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/=
linux_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93=
a8d02641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"46dd663=
4e564fb1b60c8a2d1018ef8f365d1a8ed26f162c99528922d06d14134","src/unix/linux_=
like/linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8=
f1a43adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c=
6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/l=
inux/arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef=
02206a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec044=
0f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_lik=
e/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93=
f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like=
/linux/gnu/b32/arm/mod.rs":"5bd3f6b3484e049ddaac95f411b0d82cbf1cd28e6a5defb=
c927bd917f5f7d299","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa9=
2f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linu=
x_like/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214=
d1ae7d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs"=
:"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/un=
ix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c=
87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs"=
:"8da281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/un=
ix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02=
f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/=
align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119=
","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"5e7c1e29aeb82fc422f45=
b73fb0cf3d13d0902300f9150d2755a9074f8d96999","src/unix/linux_like/linux/gnu=
/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440=
895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e=
9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/=
linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef=
8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5=
e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_=
like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac5=
66eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp=
32.rs":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","=
src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd42=
6442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu=
/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830=
c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"666beae35=
371cb54a4ad091764e0e3ca4983d5205179c119a8ff97d3ae301869","src/unix/linux_li=
ke/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb77=
71334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch=
64/mod.rs":"17e9478b6a5830f6b8f6bea4ccab712cfd1972cdfb43b97408a068e4ea92410=
6","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/g=
nu/b64/mips64/mod.rs":"80b4b97a41564290c510e68a1fb20cfd8424206f010e71a596f1=
2877de886a71","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88527=
57b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux=
/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc=
9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"=
a595e37c2325ceb40ef66c634bd3c255ad184a1d70ff8025e98a075f0ec67704","src/unix=
/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111b=
eb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/risc=
v64/mod.rs":"ef4b13477ffd8532fb6705ca3fa63a1f13e8d19ee39b083c5355dfce430c1a=
5b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"788fde4fa1919859cc028b59d=
a31de00449edd2b2c1530ae76134beac418b73c","src/unix/linux_like/linux/gnu/b64=
/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"c4fa0ede3f78=
b21a9982667922cccd0681bee3cb6d42208ea9958f65e93d6308","src/unix/linux_like/=
linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b3=
08ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"e=
37e0421290b152fe508883181c41225e09dd5452a6b085e8d807b3b54823028","src/unix/=
linux_like/linux/gnu/b64/x86_64/not_x32.rs":"c1b6345ce14f67d1b2e2f7f2c0ff9a=
074c07acbd348df69cb4558bda8c8fb9ae","src/unix/linux_like/linux/gnu/b64/x86_=
64/x32.rs":"3f4d2aeadb7d2620cad09564abdbfc5cf02eeb5a27f2bab8a4e9b4bdbdb258a=
5","src/unix/linux_like/linux/gnu/mod.rs":"e31aa4bd147c83d05dcd13baca4b9f67=
6320a7713ff50de08b51d0c88f8241a3","src/unix/linux_like/linux/gnu/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/mod.rs":"8862912e65ae64dd26728ced492eacbdd3753b7a1943=
2fc8fdf5a673ff7526c9","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e=
8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/l=
inux_like/linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa=
7df84ee0cfd3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs=
":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/u=
nix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6e=
bfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs":"16a7a03d998a5db11be9ee81525c7faec4623383260e8bc125b1c53a050fde7=
5","src/unix/linux_like/linux/musl/b32/mod.rs":"580e27c5ce3344df686f1ffc08f=
dfa2c282d1ceb623d778c50d210d4bd65ec7e","src/unix/linux_like/linux/musl/b32/=
powerpc.rs":"dc52adc264c34bce80753d6bd064e8fc4b8237fa1e5c5315ccb6c72df74c28=
13","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7=
c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linu=
x/musl/b32/riscv32/mod.rs":"e57dc5562553aab6d0765e0ec266254aa52975f8757bfe9=
7e0c6028fa7d5d37c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77=
fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linu=
x_like/linux/musl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da056287f=
c42f8e2ccf1d5b2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/align=
.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","sr=
c/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426=
442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl=
/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e6080=
1d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332b=
b056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/li=
nux/musl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e5=
5cd533fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55=
afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like=
/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.r=
s":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294","src/=
unix/linux_like/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb34=
2e8aa41544cffacdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64=
/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6=
e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e=
6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/mu=
sl/mod.rs":"8d8b50a0bf7ec53bd4d2ea92e8bfae14529f0beb3f22a65b55623f7086fee8a=
c","src/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae=
6a982ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustiv=
e.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","s=
rc/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7=
ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/ali=
gn.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","=
src/unix/linux_like/linux/uclibc/arm/mod.rs":"bf2dcf0a468f386899f572324f3bc=
14be1974f570afdfff1075ca6c5dd57710d","src/unix/linux_like/linux/uclibc/arm/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a5=
7b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/l=
inux/uclibc/mips/mips32/mod.rs":"d2fc251754458b697ef6e599f0a670ebca18f61e40=
26bf681be4e2baa896b9df","src/unix/linux_like/linux/uclibc/mips/mips32/no_al=
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
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"420dbea99e99091f333641e202=
960fa4bed0733de2a834e610708555be6bab4c","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2=
d6a0a8","src/unix/linux_like/mod.rs":"759e65c13f7e49a6efd1a979c821c53c47864=
8f7f00cb29da65d92904c7c6814","src/unix/mod.rs":"a55d80aae47b642e25810c23216=
26f4cc5168170230a1d73953dfca58709b774","src/unix/newlib/aarch64/mod.rs":"ba=
c93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/n=
ewlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d85=
02b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3f=
a0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4b=
aabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/gener=
ic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","=
src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd=
0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"47d853beaa42b4aa17532d768=
7715e00e1da6632fccbcdcb079382dbde5412ff","src/unix/newlib/no_align.rs":"e07=
43b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/ne=
wlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f=
831be393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93f=
b2b01d951855e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876=
598e7c238499ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"a4ed35=
5f33ab18041cf642e2f4d1a50dc96b5bce778715f04352c34d020961b5","src/unix/nto/n=
eutrino.rs":"62198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab=
7b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2a=
afec19a84cfb040bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f2513=
8a200e616048e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3=
faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solari=
sh/illumos.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b828=
09fa7","src/unix/solarish/mod.rs":"b1c0a1d347b30d45c85429b7236d234f5b2c86b9=
eec439e897c9371d856c187a","src/unix/solarish/solaris.rs":"41b350a89ddf01cd1=
2a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs"=
:"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/un=
ix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847=
227a9c09ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c224604683=
91eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc=
511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/mod.rs":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1f=
b3f4018","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba43=
5b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e50=
6c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f=
38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_=
64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","=
src/wasi.rs":"b9a2ecc75fd2359a2484e93fdd1c539d2abc109cd9455d8f566476bcfb19d=
f3d","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d=
77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db=
2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb=
69845f4323b1a14e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod=
.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","te=
sts/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545=
f21f1f4"},"package":"201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c=
66ca1f5f79"}
 \ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"89e8938bf82dadf7854b0831c879ef1c66708a3=
917b0c48079aadbc2855b18b8","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"cecfa3f926ab4a9c8=
7cd59cc0d687f98eceb6035b0dde185152e5206d090f8d0","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"e54e72e15cf4ab2df88da9=
ac3b69fa12e918b0bcfeadc81843b2a838b43d9547","src/fuchsia/no_align.rs":"303f=
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
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"1cc76b056d5925aedae04ead411057dc5c6c9bd3948609fdb30164ac1fb6565e"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"8986a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57=
602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"badda6f0f7666f38345b1f4ca78817a47bc92bbdcdc3a1377f376f4e=
08c316e5","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"327700c5668be863f1fea205c82b0402e2936b883df=
63dda677716c30a50a284","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"7f689e9a944c919834ec852b30c224f98e14b4b4087571adefeea5abad=
5d6374","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"9b6fa1c3f5217f9482e0bed3bd0ea2905cdf56d628307cea48e49d8e00a6b09d","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"26bda8cf730ab4868523a6ed7c513f51885cad30cdd02da905ff35b597576415","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7=
fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"bd80ce2ff628ed5eaa856ebe8b6a8fb0=
e89d1c9728040b9ee6b967beb4bcf3a7","src/unix/bsd/mod.rs":"6f7e4f0affa04e5c26=
375875389a9891f69930bb56842cf20526aad3a0f64299","src/unix/bsd/netbsdlike/mo=
d.rs":"34f60d73631f3c59936c87db1f62ddb8f693901c3cb199f7f370882e84d509fa","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"107a4aa396b8383c66e0ace2f941450b4b69146558c=
dc4d9fbe33eeab51760f1","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
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
/mod.rs":"38b7d65a86701a75a9047a3ef3b006f09ffbb33ab2312174bcee889efb74e100"=
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
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"14171bbff41ad7f11219806=
4b80f7b86a78c2c36c689d5cc04a748f2186c6bf3","src/unix/haiku/native.rs":"dbfc=
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
3b1dc2","src/unix/linux_like/android/mod.rs":"fbfcd29a13b58a89841ea23737b45=
d1a3d69e8ec72bd168755297c4d0eb701f3","src/unix/linux_like/emscripten/align.=
rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/mod.rs":"6ef4652dfb94e3c58aed5133ece982ad30569d=
46b6b1054552cd61905fa61690","src/unix/linux_like/emscripten/no_align.rs":"0=
128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/=
linux_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93=
a8d02641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"46dd663=
4e564fb1b60c8a2d1018ef8f365d1a8ed26f162c99528922d06d14134","src/unix/linux_=
like/linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8=
f1a43adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c=
6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/l=
inux/arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef=
02206a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec044=
0f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_lik=
e/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93=
f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like=
/linux/gnu/b32/arm/mod.rs":"5bd3f6b3484e049ddaac95f411b0d82cbf1cd28e6a5defb=
c927bd917f5f7d299","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa9=
2f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linu=
x_like/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214=
d1ae7d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs"=
:"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/un=
ix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c=
87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs"=
:"8da281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/un=
ix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02=
f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/=
align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119=
","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"5e7c1e29aeb82fc422f45=
b73fb0cf3d13d0902300f9150d2755a9074f8d96999","src/unix/linux_like/linux/gnu=
/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440=
895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e=
9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/=
linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef=
8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5=
e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_=
like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac5=
66eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp=
32.rs":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","=
src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd42=
6442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu=
/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830=
c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"666beae35=
371cb54a4ad091764e0e3ca4983d5205179c119a8ff97d3ae301869","src/unix/linux_li=
ke/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb77=
71334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch=
64/mod.rs":"17e9478b6a5830f6b8f6bea4ccab712cfd1972cdfb43b97408a068e4ea92410=
6","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/g=
nu/b64/mips64/mod.rs":"80b4b97a41564290c510e68a1fb20cfd8424206f010e71a596f1=
2877de886a71","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88527=
57b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux=
/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc=
9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"=
a595e37c2325ceb40ef66c634bd3c255ad184a1d70ff8025e98a075f0ec67704","src/unix=
/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111b=
eb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/risc=
v64/mod.rs":"ef4b13477ffd8532fb6705ca3fa63a1f13e8d19ee39b083c5355dfce430c1a=
5b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"788fde4fa1919859cc028b59d=
a31de00449edd2b2c1530ae76134beac418b73c","src/unix/linux_like/linux/gnu/b64=
/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"c4fa0ede3f78=
b21a9982667922cccd0681bee3cb6d42208ea9958f65e93d6308","src/unix/linux_like/=
linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b3=
08ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"e=
37e0421290b152fe508883181c41225e09dd5452a6b085e8d807b3b54823028","src/unix/=
linux_like/linux/gnu/b64/x86_64/not_x32.rs":"c1b6345ce14f67d1b2e2f7f2c0ff9a=
074c07acbd348df69cb4558bda8c8fb9ae","src/unix/linux_like/linux/gnu/b64/x86_=
64/x32.rs":"3f4d2aeadb7d2620cad09564abdbfc5cf02eeb5a27f2bab8a4e9b4bdbdb258a=
5","src/unix/linux_like/linux/gnu/mod.rs":"e31aa4bd147c83d05dcd13baca4b9f67=
6320a7713ff50de08b51d0c88f8241a3","src/unix/linux_like/linux/gnu/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/mod.rs":"ddd008ff6304dca5d6fe9b452eb7a69745098bce4783=
4d0999abdedd5978c2b3","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e=
8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/l=
inux_like/linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779ebf=
a9320a1f6a41027529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon.rs=
":"5625a3dfcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","src/u=
nix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6e=
bfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs":"bb5f45dd376e928a22282e1696989399b0e8d0a5fbc8309bb4238926d81e61e=
7","src/unix/linux_like/linux/musl/b32/mod.rs":"580e27c5ce3344df686f1ffc08f=
dfa2c282d1ceb623d778c50d210d4bd65ec7e","src/unix/linux_like/linux/musl/b32/=
powerpc.rs":"f23491f21f3eeac3e05a76b466567ea633b92a4830ab8b401cbb31c74ad1ac=
ab","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7=
c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linu=
x/musl/b32/riscv32/mod.rs":"e57dc5562553aab6d0765e0ec266254aa52975f8757bfe9=
7e0c6028fa7d5d37c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77=
fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linu=
x_like/linux/musl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080226af=
c0006d71d5dd578c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/align=
.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","sr=
c/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426=
442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl=
/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e6080=
1d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332b=
b056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/li=
nux/musl/b64/mod.rs":"6480edde6e8b2c3aa7d2561ec9d879e9fc7fe6d3e4568592b42a1=
564bb1daa9a","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55=
afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like=
/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.r=
s":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294","src/=
unix/linux_like/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb34=
2e8aa41544cffacdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64=
/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6=
e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e=
6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/mu=
sl/mod.rs":"9c980de9de01e8675003ed41b98edbcfb8c6dc8ac6b8387769b87085aeda5ef=
a","src/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae=
6a982ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustiv=
e.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","s=
rc/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7=
ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/ali=
gn.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","=
src/unix/linux_like/linux/uclibc/arm/mod.rs":"bf2dcf0a468f386899f572324f3bc=
14be1974f570afdfff1075ca6c5dd57710d","src/unix/linux_like/linux/uclibc/arm/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a5=
7b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/l=
inux/uclibc/mips/mips32/mod.rs":"d2fc251754458b697ef6e599f0a670ebca18f61e40=
26bf681be4e2baa896b9df","src/unix/linux_like/linux/uclibc/mips/mips32/no_al=
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
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"420dbea99e99091f333641e202=
960fa4bed0733de2a834e610708555be6bab4c","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2=
d6a0a8","src/unix/linux_like/mod.rs":"03ae2e1f8113ed650e1c9691e715254dd6b6d=
13cc829b639d5857336ecd11b24","src/unix/mod.rs":"4647dc713fb4208df76fe6009b9=
716eef1d9e09a77f6b2f1b793d63537b4c670","src/unix/newlib/aarch64/mod.rs":"ba=
c93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/n=
ewlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d85=
02b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3f=
a0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4b=
aabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/gener=
ic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","=
src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd=
0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"494e56628d4408bf66ad30ff7=
1fbd21bc33d9037935c411dff7bf73dd3f1070b","src/unix/newlib/no_align.rs":"e07=
43b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/ne=
wlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f=
831be393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93f=
b2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8=
a8f25138a200e616048e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"=
00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix=
/solarish/illumos.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad=
127b82809fa7","src/unix/solarish/mod.rs":"eace25beaa4874bfc2451f8136efc261f=
9dfb7a30caab3c97c708068d5431bbf","src/unix/solarish/solaris.rs":"41b350a89d=
df01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/=
x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e",=
"src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3=
ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22=
460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"9=
8f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxwor=
ks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e8=
8","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95=
a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21=
a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd0=
2557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"5=
52f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxwor=
ks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b=
514a","src/wasi.rs":"3f6219f036ac1d917ab5fa7323e3770857f566bc4189a9d4c4ea8c=
a6517b8953","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0=
215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44=
af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"7fe35=
c1f5e6272acfba059a1ad7a78b144f5bc63456f6377d58bbc42cc23f509","src/windows/m=
svc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986=
f4","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e777=
4c7e545f21f1f4"},"package":"db6d7e329c562c5dfab7a46a2afabc8b987ab9a4834c9d1=
ca04dc54c1546cef8"}
++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"cec0b42b20e776ac9165b5a5eedfbd8fc033700=
cacabfa4209c60d35833e42f1","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"cecfa3f926ab4a9c8=
7cd59cc0d687f98eceb6035b0dde185152e5206d090f8d0","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"1b4e6c34b01b4c970f4d4c=
044d1642020e0fc2ea1b8442e8f1a9b698569ab1f6","src/fuchsia/no_align.rs":"303f=
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
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"1cc76b056d5925aedae04ead411057dc5c6c9bd3948609fdb30164ac1fb6565e"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"8986a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57=
602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"badda6f0f7666f38345b1f4ca78817a47bc92bbdcdc3a1377f376f4e=
08c316e5","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"327700c5668be863f1fea205c82b0402e2936b883df=
63dda677716c30a50a284","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"7f689e9a944c919834ec852b30c224f98e14b4b4087571adefeea5abad=
5d6374","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"9b6fa1c3f5217f9482e0bed3bd0ea2905cdf56d628307cea48e49d8e00a6b09d","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"26bda8cf730ab4868523a6ed7c513f51885cad30cdd02da905ff35b597576415","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7=
fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"bd80ce2ff628ed5eaa856ebe8b6a8fb0=
e89d1c9728040b9ee6b967beb4bcf3a7","src/unix/bsd/mod.rs":"0c672b075b5616fca2=
cc56c00ee31c3f554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mo=
d.rs":"34f60d73631f3c59936c87db1f62ddb8f693901c3cb199f7f370882e84d509fa","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"107a4aa396b8383c66e0ace2f941450b4b69146558c=
dc4d9fbe33eeab51760f1","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
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
/mod.rs":"38b7d65a86701a75a9047a3ef3b006f09ffbb33ab2312174bcee889efb74e100"=
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
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"891f77891349938ffb2048d=
b0446e28f2b7f78a0286042d0f0a9af6c2d4570af","src/unix/haiku/native.rs":"dbfc=
bf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/hai=
ku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b=
7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10cec=
cefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b=
8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab=
832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/l=
inux_like/android/b32/arm.rs":"007391f35663762d8097a8a5ae301accb82c729713da=
0dfd9631c4bc69d9305e","src/unix/linux_like/android/b32/mod.rs":"7c173e03751=
19bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like=
/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f=
0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"81b4ab3ffc=
347e819f2f62c09dcd923d9d12d14b3d0e66ddc06ab78fa75a4b88","src/unix/linux_lik=
e/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs"=
:"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/un=
ix/linux_like/android/b64/aarch64/mod.rs":"f12594f7a57654ea63794822761c1ef9=
029ee5cef6bbad498c928a5bff2dfade","src/unix/linux_like/android/b64/mod.rs":=
"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/uni=
x/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6=
832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64=
/mod.rs":"80e9f93fed838a48b4e2e8d77b95c72cfd7c0647bcce63851555c5ad16dad143"=
,"src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719=
aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64=
/x86_64/mod.rs":"40be3b9dac9b52f3fd341fae4593a8c8c11a79ed694bcccf82f8810253=
c77492","src/unix/linux_like/android/mod.rs":"bf37384b99034eb1817303d9e1b35=
fe895da1010b024ada128e84059dad2c73b","src/unix/linux_like/emscripten/align.=
rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/mod.rs":"24a6b0eadc011ee75c5bcbd18fe9f30d64006b=
71ec1416f6352e6015917240fc","src/unix/linux_like/emscripten/no_align.rs":"0=
128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/=
linux_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93=
a8d02641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"46dd663=
4e564fb1b60c8a2d1018ef8f365d1a8ed26f162c99528922d06d14134","src/unix/linux_=
like/linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8=
f1a43adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c=
6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/l=
inux/arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef=
02206a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec044=
0f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_lik=
e/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93=
f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like=
/linux/gnu/b32/arm/mod.rs":"5bd3f6b3484e049ddaac95f411b0d82cbf1cd28e6a5defb=
c927bd917f5f7d299","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa9=
2f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linu=
x_like/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214=
d1ae7d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs"=
:"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/un=
ix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c=
87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs"=
:"8da281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/un=
ix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02=
f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/=
align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119=
","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"5e7c1e29aeb82fc422f45=
b73fb0cf3d13d0902300f9150d2755a9074f8d96999","src/unix/linux_like/linux/gnu=
/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440=
895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e=
9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/=
linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef=
8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5=
e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_=
like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac5=
66eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp=
32.rs":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","=
src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd42=
6442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu=
/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830=
c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"666beae35=
371cb54a4ad091764e0e3ca4983d5205179c119a8ff97d3ae301869","src/unix/linux_li=
ke/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb77=
71334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch=
64/mod.rs":"17e9478b6a5830f6b8f6bea4ccab712cfd1972cdfb43b97408a068e4ea92410=
6","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/g=
nu/b64/mips64/mod.rs":"80b4b97a41564290c510e68a1fb20cfd8424206f010e71a596f1=
2877de886a71","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88527=
57b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux=
/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc=
9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"=
a595e37c2325ceb40ef66c634bd3c255ad184a1d70ff8025e98a075f0ec67704","src/unix=
/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111b=
eb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/risc=
v64/mod.rs":"ef4b13477ffd8532fb6705ca3fa63a1f13e8d19ee39b083c5355dfce430c1a=
5b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"788fde4fa1919859cc028b59d=
a31de00449edd2b2c1530ae76134beac418b73c","src/unix/linux_like/linux/gnu/b64=
/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"c4fa0ede3f78=
b21a9982667922cccd0681bee3cb6d42208ea9958f65e93d6308","src/unix/linux_like/=
linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b3=
08ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"e=
37e0421290b152fe508883181c41225e09dd5452a6b085e8d807b3b54823028","src/unix/=
linux_like/linux/gnu/b64/x86_64/not_x32.rs":"c1b6345ce14f67d1b2e2f7f2c0ff9a=
074c07acbd348df69cb4558bda8c8fb9ae","src/unix/linux_like/linux/gnu/b64/x86_=
64/x32.rs":"3f4d2aeadb7d2620cad09564abdbfc5cf02eeb5a27f2bab8a4e9b4bdbdb258a=
5","src/unix/linux_like/linux/gnu/mod.rs":"e31aa4bd147c83d05dcd13baca4b9f67=
6320a7713ff50de08b51d0c88f8241a3","src/unix/linux_like/linux/gnu/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/mod.rs":"8862912e65ae64dd26728ced492eacbdd3753b7a1943=
2fc8fdf5a673ff7526c9","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e=
8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/l=
inux_like/linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779ebf=
a9320a1f6a41027529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon.rs=
":"5625a3dfcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","src/u=
nix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6e=
bfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs":"bb5f45dd376e928a22282e1696989399b0e8d0a5fbc8309bb4238926d81e61e=
7","src/unix/linux_like/linux/musl/b32/mod.rs":"580e27c5ce3344df686f1ffc08f=
dfa2c282d1ceb623d778c50d210d4bd65ec7e","src/unix/linux_like/linux/musl/b32/=
powerpc.rs":"f23491f21f3eeac3e05a76b466567ea633b92a4830ab8b401cbb31c74ad1ac=
ab","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7=
c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linu=
x/musl/b32/riscv32/mod.rs":"e57dc5562553aab6d0765e0ec266254aa52975f8757bfe9=
7e0c6028fa7d5d37c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77=
fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linu=
x_like/linux/musl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080226af=
c0006d71d5dd578c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/align=
.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","sr=
c/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426=
442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl=
/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e6080=
1d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332b=
b056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/li=
nux/musl/b64/mod.rs":"6480edde6e8b2c3aa7d2561ec9d879e9fc7fe6d3e4568592b42a1=
564bb1daa9a","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55=
afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like=
/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.r=
s":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294","src/=
unix/linux_like/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb34=
2e8aa41544cffacdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64=
/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6=
e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e=
6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/mu=
sl/mod.rs":"9c980de9de01e8675003ed41b98edbcfb8c6dc8ac6b8387769b87085aeda5ef=
a","src/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae=
6a982ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustiv=
e.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","s=
rc/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7=
ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/ali=
gn.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","=
src/unix/linux_like/linux/uclibc/arm/mod.rs":"bf2dcf0a468f386899f572324f3bc=
14be1974f570afdfff1075ca6c5dd57710d","src/unix/linux_like/linux/uclibc/arm/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a5=
7b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/l=
inux/uclibc/mips/mips32/mod.rs":"d2fc251754458b697ef6e599f0a670ebca18f61e40=
26bf681be4e2baa896b9df","src/unix/linux_like/linux/uclibc/mips/mips32/no_al=
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
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"420dbea99e99091f333641e202=
960fa4bed0733de2a834e610708555be6bab4c","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2=
d6a0a8","src/unix/linux_like/mod.rs":"759e65c13f7e49a6efd1a979c821c53c47864=
8f7f00cb29da65d92904c7c6814","src/unix/mod.rs":"a55d80aae47b642e25810c23216=
26f4cc5168170230a1d73953dfca58709b774","src/unix/newlib/aarch64/mod.rs":"ba=
c93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/n=
ewlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d85=
02b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3f=
a0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4b=
aabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/gener=
ic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","=
src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd=
0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"47d853beaa42b4aa17532d768=
7715e00e1da6632fccbcdcb079382dbde5412ff","src/unix/newlib/no_align.rs":"e07=
43b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/ne=
wlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f=
831be393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93f=
b2b01d951855e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876=
598e7c238499ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"a4ed35=
5f33ab18041cf642e2f4d1a50dc96b5bce778715f04352c34d020961b5","src/unix/nto/n=
eutrino.rs":"62198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab=
7b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2a=
afec19a84cfb040bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f2513=
8a200e616048e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3=
faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solari=
sh/illumos.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b828=
09fa7","src/unix/solarish/mod.rs":"b1c0a1d347b30d45c85429b7236d234f5b2c86b9=
eec439e897c9371d856c187a","src/unix/solarish/solaris.rs":"41b350a89ddf01cd1=
2a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs"=
:"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/un=
ix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847=
227a9c09ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c224604683=
91eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc=
511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/mod.rs":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1f=
b3f4018","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba43=
5b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e50=
6c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f=
38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_=
64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","=
src/wasi.rs":"b9a2ecc75fd2359a2484e93fdd1c539d2abc109cd9455d8f566476bcfb19d=
f3d","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d=
77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db=
2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb=
69845f4323b1a14e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod=
.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","te=
sts/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545=
f21f1f4"},"package":"201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c=
66ca1f5f79"}
diff --git a/meta/recipes-devtools/rust/files/crossbeam_atomic.patch b/meta=
/recipes-devtools/rust/files/crossbeam_atomic.patch
deleted file mode 100644
index 0a2910391e2c..000000000000
--- a/meta/recipes-devtools/rust/files/crossbeam_atomic.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-crossbeam-utils is taking the target triplet and comparing it against a
-known list of platforms that have issues either with any atomics or with
-64 bit atomics. Since OE encodes TARGET_VENDOR into the rust triplet (to
-differentiate host vs. target) this means that platforms that should match,
-don't.
-
-We could make a list of platforms and pass in configuration values but
-having one list in rust and another in our recipes is likely to cause
-problems in the future. We do already have this issue in the librsvg recip=
e.
-Instead, switch out the value of TARGET_VENDOR for "-unknown" which
-them makes the list in no_atomics.rs work correctly.
-
-Someone with more rust knowledge could split up the triplets in no_atmoics=
.rs
-and compare against the architecture/processor, or replace -unknown with a=
 glob
-to create a patch that upstream might accept.
-
-Upstream-Status: Submitted [https://github.com/crossbeam-rs/crossbeam/pull=
/922]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/build.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.12/build.rs
-+++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/build.rs
-@@ -29,7 +29,7 @@ use std::env;
- include!("no_atomic.rs");
-=20
- fn main() {
--    let target =3D match env::var("TARGET") {
-+    let mut target =3D match env::var("TARGET") {
-         Ok(target) =3D> target,
-         Err(e) =3D> {
-             println!(
-@@ -40,6 +40,8 @@ fn main() {
-             return;
-         }
-     };
-+    let vendor =3D env::var("TARGET_VENDOR").unwrap();
-+    target =3D target.replace(&vendor, "-unknown");
-=20
-     // Note that this is `no_`*, not `has_*`. This allows treating as the=
 latest
-     // stable rustc is used when the build script doesn't run. This is us=
eful
-Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.12/.cargo-checksum.js=
on
-+++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CHANGELOG.md":"65d3e11edf9498bdbc930c8c3878b7d3a90c1a0b1698597=
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
-\ No newline at end of file
-+{"files":{"CHANGELOG.md":"65d3e11edf9498bdbc930c8c3878b7d3a90c1a0b1698597=
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
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/files/hardcodepaths.patch b/meta/re=
cipes-devtools/rust/files/hardcodepaths.patch
index cb99e8b01136..19c494ad9a4f 100644
--- a/meta/recipes-devtools/rust/files/hardcodepaths.patch
+++ b/meta/recipes-devtools/rust/files/hardcodepaths.patch
@@ -4,12 +4,11 @@ to resolve these issues properly upstream.
=20
 Upstream-Status: Inappropriate [patches need rework]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
=20
-Index: rustc-1.66.0-src/compiler/rustc_codegen_llvm/src/context.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
-+++ rustc-1.66.0-src/compiler/rustc_codegen_llvm/src/context.rs
-@@ -160,46 +160,6 @@ pub unsafe fn create_module<'ll>(
+--- rustc-1.69.0-src/compiler/rustc_codegen_llvm/src/context.rs.orig	2023-=
04-21 08:38:23.092458478 +0100
++++ rustc-1.69.0-src/compiler/rustc_codegen_llvm/src/context.rs	2023-04-21=
 08:39:00.266819755 +0100
+@@ -156,46 +156,6 @@
          }
      }
=20=20
@@ -39,7 +38,7 @@ Index: rustc-1.66.0-src/compiler/rustc_codegen_llvm/src/c=
ontext.rs
 -        //
 -        // FIXME(#34960)
 -        let cfg_llvm_root =3D option_env!("CFG_LLVM_ROOT").unwrap_or("");
--        let custom_llvm_used =3D cfg_llvm_root.trim() !=3D "";
+-        let custom_llvm_used =3D !cfg_llvm_root.trim().is_empty();
 -
 -        if !custom_llvm_used && target_data_layout !=3D llvm_data_layout {
 -            bug!(
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.69.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.69.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.69.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.69.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.2.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.69.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.69.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index cb49d8e7c3e4..dbf50abc022b 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,51 +4,51 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.67.1"
+SNAPSHOT_VERSION =3D "1.68.2"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b04e33d9beb3cd97501399c17ca=
297f0adc12a7c0ea16351b8821fc9228de477"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "35027409400faaaa38ea2855=
b92dea6b553b2e656dff735da730f67ac02e57e6"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "053ccc4ab81ea9c16906205c2b6=
53a93b5b44fe4f67f9e45153a2687b7efb65a"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "a1b1f8ffdd56747453cb9531f70=
474ddbe603533e7b06647a810e32fc7c3a8ba"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "cbe60945af743804be682270=
4f986c812dd1fe1d167602aec5350a8f519f9861"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d78579af4d4b98b3bf49b8a0b78=
48960e68254150ac517faeb9caf7b9f44ede2"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "36db46e19e8573ea113c38d88f66de=
f5fad848721b3c6dd69361f197b7a02f80"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "aab2d7aa76793e78c9c8810e93e=
d8978f6422843b1277e9c60337b0f943a4409"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "0c77fde6daa80825f8cb81a5525c99=
db238a3ab4f0b226470964062e74603dd6"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "aeee38c0cd35b531d9f00028f72035=
8256e9f3b80b176467c6afc033a16c92aa"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "695d4469c131b9993c939db0ce7=
3a3866ab8e69dd657ec3137f3d594857f7812"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "dc533e7d0f0349d92a98973e20b99d=
69b09a25b8675f28a38fa26b0160615fd4"
=20
-SRC_URI[cargo-snapshot-mips.sha256sum] =3D "06778d8aedd8e7850f0175483efa01=
5cc2eeb69e6027e3d94352d89d2a510fc5"
-SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "048b3da190212b742f7a052618b=
57683dc96ee2b6c25fc7f5ae751143cb79bad"
-SRC_URI[rustc-snapshot-mips.sha256sum] =3D "d3b7501acdfda6e4e9d8ee64d9de71=
6579791d567c66f1273e601a55c2e23ca8"
+SRC_URI[cargo-snapshot-mips.sha256sum] =3D "8d24614f31ba67fe10a642e9f49d64=
066b4ce6789a80a101ae10afcc2a194c97"
+SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "4ab007f223cf723f8f7adf26a60=
14f4f5aa444f88c19daccc5ac81ea30275c66"
+SRC_URI[rustc-snapshot-mips.sha256sum] =3D "68c6aac6e0e95588b65d6f937032b5=
7ad2a09b2897990a3a930729763f728e12"
=20
-SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "7bf800ddd0ee6b69bb66fb7cdf12=
ae045db025fdb866e00c62b63a1eb99f7d64"
-SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "94410897626546dde806a1142=
99c3c32abb6b4b294af5daea5c4d136751fe063"
-SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "eb34b5d901807e1e47fb6ac68657=
1f21b2a80ad831583485872c9e9c59291776"
+SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "8664ff821dfd8bb252c61c2b7473=
e355bd38cd8a6bc15a9ecc98af46f6a2b282"
+SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "c299d65b3594c309d092f6a0f=
e15c205ab489ffa50910fb8126e944a2727cbe5"
+SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "de72245d5e6db0e4327ce105a7ce=
3d5597a3792e71b95578dd7ec62af56946fb"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "b134c63817805f59821024d3771=
96f2821ae53f88d0a4a2ebdbd8152433984b0"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "26efe78c09ed36da34964c0d=
023cf9aa404766ab790a94d9becd373b8879cb5a"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "8f6212756d152f6876a6456f4d3=
f93ef8b4b7e5c93b96fe515cb8183c0612d7b"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "13ad9e74376fc01d9d770447c14=
1a18dd986dd60bbd4c6177ed80df4a28fc142"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "e75bdc8a6e3f00285a376062=
40862cdad69a986c3e3d47d6af1376613281233a"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "92b08b1ad69786f3bcc6fd7bb71=
411ad162dca478f9636027bf809b9de6eea72"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "2cd84deb15ed16fc4a1d8a9de=
45577ba4d9f245de4f7efb3dc6611eec437eef3"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "135f5e6ab6d8f077a14521=
d387d3f31831abdb840ca4e6a15b6f0d0d5b7dbc81"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "bdb08b549df5d7a421637efb0=
be00211b5ca9cf1e4214d66eb762b92e0f9b3fe"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "ad4eded41be32bb19a5f6224d=
aacb9589947956f4be9f884f7ea06323b448088"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "354322352cd8b661b84f5e=
97729d5d7adb7df9cb9bfd43cac378271c40214d7f"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "a23e71c7da172ece7ef760db0=
43b010c84dd8a491cd9c00303e2c01ad521dec2"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "fbad853a30437653f09001d=
0de797823dfa32d537163841bec1792c3267f5eab"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "364c47ed22e4268edf23=
8d221c40007d7d8792a66ca325d3937596a9c911ea48"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "4a2368996acd1741200d720=
674101323fa951dfa580b64c8b2e9fdc09bb22534"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "1eb1c330d281a9478d51472=
4c5089225b3f66880f4a69e9e02b9d389f000adbb"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "e69c8c1b7b0df839b271=
a2c12985b1c56565a34f9b357631ed99fa9263f3d326"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "4d493bec7500dd3159c05ee=
8f2fef71241de575e1cb7a89bf128f01dc3e537cb"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "3381af9ba39068b9c5e625361=
25a3abb582aef15932f63cd4f90df0cccb05ac7"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "63a7e6a6c889a3d01bb3c6=
6a3def3e41963511ea52e13906669da5b29b2fd9da"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "916d204d727f485abbadeef91=
4ee881cf61fa3c167741a9ed29c9f4042c99e25"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "d5a154406bc6ebc6d5cdd3198=
aa2b5167ceef130454c56bcf03e37fa6b290882"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8388ac7a5f924d5d6aa441=
ae97c33c1abf11fd9516f2b9853f7edc0c5d6c453b"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "de7ef61f6fa5f7ddddbddc093=
4beec58a3ce49cda96679dbf06895128f1fc228"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "78d7c2714015ecb7283b417cb265d=
4d604379d0720aab5f611ca1c113987c283"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "04573298d9e815c1e8c47a2f95=
48ea55d4a2afc538eceaa6a704d44a5e1f7e3e"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "e786d34e10069dc00774fe53bca09=
2e537e96db6c9d5258a8b0221e4fa5a2caf"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "26353406aba935e135e0527673bfd=
3805de88ff9a63187135e73b5788f385112"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "7f909658496692a05dd241c15f=
79a02f80658d353013dace127fdc69dc5026b4"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "fbfb02fff83f4a9d7298c511a3ad4=
b9e73c4d9d0be558edbf7226af0f586517a"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "e744dad75de8419e7fea530c29bd=
56cf931b4d4de62eb4bd442bfac7b54e61ed"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "f4dc8468dfc1dbd86f865b10f=
06e0e4b4e76f5a3a1cc27317a520ab1660844e9"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "e27ec0c6d1a2b2b38e5258904c37=
41ddb246bff5715aa95e595f818aa77f7bee"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "b25d6f88b93cb75868ff4bc9ca01=
03facd4622825cf53df67546cea6cb60da0f"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "c8a3eaf26b83f1926d86b4db9=
9ca16cbbff8e746e4c63f25f4d75a02a34a3b16"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "d33d493381dd17a4b491d0e978cd=
b6700badb5905e831dd5f7fe75ffbf8e0584"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "22cbbf0b22d9b0894cfbd6e1dd6=
b95b71c7ad02cee4e477d375dcf81af8d1337"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "07fc71adf63691ae5e103c57c29=
5e665b6dfc096fe4bedfeb5e1d33c133bb9f4"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "addf0b0beb1966787e599f32=
849f18c28d5cb65515272b7d9608d4a1dddee2e7"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "787f5cbbcec4e75b9beba380=
4ea05e36b7cb9b164c291cf7ce8f775d05634d61"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index b25b5c17e880..9dceb904b66a 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,14 +1,13 @@
 RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
=20
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
-            file://crossbeam_atomic.patch;patchdir=3D${RUSTSRC} \
             file://hardcodepaths.patch;patchdir=3D${RUSTSRC} \
             file://getrandom-open64.patch;patchdir=3D${RUSTSRC} \
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=
=3D${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;p=
atchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "ce1a115f6aafa912b4622906a92b626354973afa9288e=
2c7750df4dcf3390fc0"
+SRC_URI[rust.sha256sum] =3D "e533c903820b0c2ba10491b70105149d2243348f3b5e2=
6bd7b6bdd022c7dbe75"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.68.2.bb b/meta/recipes-devto=
ols/rust/rust_1.69.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.68.2.bb
rename to meta/recipes-devtools/rust/rust_1.69.0.bb
--=20
2.39.0


