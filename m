Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7400AC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 15:59:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2910.1685721573710010440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 08:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XB3ZFCCu;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f61530506aso22356435e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685721571; x=1688313571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3kC8NMdp8h4I0XWlVJVgOHd/3gcXo+Jd6M5nTW9Aec=;
        b=XB3ZFCCu7+A4B0WnTLepCDiiu8OSQdrH4+9vYPiLqxlOgm6odjY8SuXXsLiQuKzbk3
         i4LmweI+gtDl5Pm6gYjSyNpu+alQEgyshb0lxv81feG0+sV6/xtGYT9YjjBe0yQ9RpPQ
         RfVJ8olyg+TAve/p4m8389D0O7r9zAFwPnxxfh2kFZie2lFPSyJfIBxTgBXJuceTNC2R
         18o0C2vNnwdLa2InlfBNjfsjZJ4NH/LToBA3wvprg/O3MjbresO0NoeGgqCFszNRy5Ne
         stRO7GMeQ9poYLabzrnDbtVKXwziWaEeY6/2fzqYtrEzHfkdU1hm1FCvc6++Kvk8jQlQ
         l00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685721571; x=1688313571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3kC8NMdp8h4I0XWlVJVgOHd/3gcXo+Jd6M5nTW9Aec=;
        b=G5/Bejl/skzPF8cBBMmB6D4oB4/6WoMw5PXNnOhmLIw22AbAublTY4JguXwG2Q96Qh
         DV4+QFi3Ed+vsoWnGLQ0ih8WfMQZWn0hSlPiU7iIZ7F9nEuwjRHX6KDKSlUaVy0fkL6K
         oO4EP3nCSBSjW5UMnI5l7g1qNJqnVnvWh7AtrGstEee5Ulsl2CIeiH9c02t3oa9KfIDC
         Mrf4ezQd/FrsGkVRZq3It7Bqv0Nh1sFrVYXXwRPpgJGMMjgq6wOTJt8jAz8q3K46ZiqS
         nUx2uL5XraNsNhMkm+H1P6rsibtXwrdsxg9DMKpOMl3JZXmaYFxEStZUQ6rN4ODt/FQW
         p+Fw==
X-Gm-Message-State: AC+VfDydOsBECWwmAOTn7GfSv92s7dtqJcfW55voRsfObbgIp1bK68Kl
	EEBF1seHpmE4VEN99EkzODBOrhzdDWY=
X-Google-Smtp-Source: ACHHUZ7G+XhSOVsQjFgyKes+8zjyNUbxDtpVt8OJOKr82Ti4JGJYz8hAdtM9nzLub0QM3XXecNnOmw==
X-Received: by 2002:adf:e34a:0:b0:309:51ff:a77a with SMTP id n10-20020adfe34a000000b0030951ffa77amr359366wrj.10.1685721569945;
        Fri, 02 Jun 2023 08:59:29 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id w2-20020adfd4c2000000b0030aeb3731d0sm2031824wrk.98.2023.06.02.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:59:29 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Upgrade 1.69.0 -> 1.70.0
Date: Fri,  2 Jun 2023 16:59:21 +0100
Message-Id: <20230602155922.3193-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 15:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182334

Drop 0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch as this
is merged upstream in rust-llvm.

https://blog.rust-lang.org/2023/06/01/Rust-1.70.0.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.69.0.bb =3D> cargo_1.70.0.bb} |  0
 ...-Do-not-use-LFS64-on-linux-with-musl.patch | 34 ++++----
 ...efine-SOCK_SEQPACKET-in-common-place.patch | 56 ++++++-------
 ...ibstd-rs_1.69.0.bb =3D> libstd-rs_1.70.0.bb} |  0
 ....69.0.bb =3D> rust-cross-canadian_1.70.0.bb} |  0
 ...e-64bit-off_t-on-32bit-glibc-systems.patch | 79 -------------------
 ...ust-llvm_1.69.0.bb =3D> rust-llvm_1.70.0.bb} |  5 +-
 meta/recipes-devtools/rust/rust-snapshot.inc  | 66 ++++++++--------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.69.0.bb =3D> rust_1.70.0.bb}   |  0
 11 files changed, 82 insertions(+), 162 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.69.0.bb =3D> cargo_1.70.0.bb} (=
100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.69.0.bb =3D> libstd-rs_1.70=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.69.0.bb =3D> rust=
-cross-canadian_1.70.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-=
64bit-off_t-on-32bit-glibc-systems.patch
 rename meta/recipes-devtools/rust/{rust-llvm_1.69.0.bb =3D> rust-llvm_1.70=
.0.bb} (94%)
 rename meta/recipes-devtools/rust/{rust_1.69.0.bb =3D> rust_1.70.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 52b050ec4141..0b33e619249d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.1%"
 QEMUVERSION ?=3D "8.0%"
 GOVERSION ?=3D "1.20%"
 LLVMVERSION ?=3D "16.%"
-RUSTVERSION ?=3D "1.69%"
+RUSTVERSION ?=3D "1.70%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.69.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.70.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.69.0.bb
rename to meta/recipes-devtools/rust/cargo_1.70.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linu=
x-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-=
on-linux-with-musl.patch
index 77f22f42b603..7f8d62a25651 100644
--- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-=
musl.patch
+++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-=
musl.patch
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
  3 files changed, 38 insertions(+), 12 deletions(-)
=20
-Index: rustc-1.69.0-src/library/std/src/os/linux/fs.rs
+Index: rustc-1.70.0-src/library/std/src/os/linux/fs.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/library/std/src/os/linux/fs.rs
-+++ rustc-1.69.0-src/library/std/src/os/linux/fs.rs
+--- rustc-1.70.0-src.orig/library/std/src/os/linux/fs.rs
++++ rustc-1.70.0-src/library/std/src/os/linux/fs.rs
 @@ -329,7 +329,14 @@ pub trait MetadataExt {
  impl MetadataExt for Metadata {
      #[allow(deprecated)]
@@ -39,10 +39,10 @@ Index: rustc-1.69.0-src/library/std/src/os/linux/fs.rs
      }
      fn st_dev(&self) -> u64 {
          self.as_inner().as_inner().st_dev as u64
-Index: rustc-1.69.0-src/library/std/src/sys/unix/fd.rs
+Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/library/std/src/sys/unix/fd.rs
-+++ rustc-1.69.0-src/library/std/src/sys/unix/fd.rs
+--- rustc-1.70.0-src.orig/library/std/src/sys/unix/fd.rs
++++ rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
 @@ -121,9 +121,12 @@ impl FileDesc {
      }
=20=20
@@ -73,11 +73,11 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fd.rs
          use libc::pwrite64;
=20=20
          unsafe {
-Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
+Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/library/std/src/sys/unix/fs.rs
-+++ rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
-@@ -46,9 +46,13 @@ use libc::{c_int, mode_t};
+--- rustc-1.70.0-src.orig/library/std/src/sys/unix/fs.rs
++++ rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
+@@ -47,9 +47,13 @@ use libc::{c_int, mode_t};
      all(target_os =3D "linux", target_env =3D "gnu")
  ))]
  use libc::c_char;
@@ -93,7 +93,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
  use libc::fstatat64;
  #[cfg(any(
      target_os =3D "android",
-@@ -57,9 +61,10 @@ use libc::fstatat64;
+@@ -58,9 +62,10 @@ use libc::fstatat64;
      target_os =3D "redox",
      target_os =3D "illumos",
      target_os =3D "nto",
@@ -105,7 +105,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
  use libc::readdir64;
  #[cfg(any(target_os =3D "emscripten", target_os =3D "l4re"))]
  use libc::readdir64_r;
-@@ -80,7 +85,13 @@ use libc::{
+@@ -81,7 +86,13 @@ use libc::{
      dirent as dirent64, fstat as fstat64, fstatat as fstatat64, ftruncate=
64, lseek64,
      lstat as lstat64, off64_t, open as open64, stat as stat64,
  };
@@ -119,7 +119,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
      target_os =3D "linux",
      target_os =3D "emscripten",
      target_os =3D "l4re",
-@@ -90,7 +101,7 @@ use libc::{
+@@ -91,7 +102,7 @@ use libc::{
      dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lseek=
 as lseek64,
      lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
  };
@@ -128,7 +128,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
  use libc::{dirent64, fstat64, ftruncate64, lseek64, lstat64, off64_t, ope=
n64, stat64};
=20=20
  pub use crate::sys_common::fs::try_exists;
-@@ -277,6 +288,7 @@ unsafe impl Sync for Dir {}
+@@ -278,6 +289,7 @@ unsafe impl Sync for Dir {}
  #[cfg(any(
      target_os =3D "android",
      target_os =3D "linux",
@@ -136,7 +136,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
      target_os =3D "solaris",
      target_os =3D "illumos",
      target_os =3D "fuchsia",
-@@ -311,6 +323,7 @@ struct dirent64_min {
+@@ -312,6 +324,7 @@ struct dirent64_min {
  }
=20=20
  #[cfg(not(any(
@@ -144,7 +144,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
      target_os =3D "android",
      target_os =3D "linux",
      target_os =3D "solaris",
-@@ -786,7 +799,7 @@ impl DirEntry {
+@@ -787,7 +800,7 @@ impl DirEntry {
      }
=20=20
      #[cfg(all(
@@ -153,7 +153,7 @@ Index: rustc-1.69.0-src/library/std/src/sys/unix/fs.rs
          not(miri)
      ))]
      pub fn metadata(&self) -> io::Result<FileAttr> {
-@@ -810,7 +823,7 @@ impl DirEntry {
+@@ -811,7 +824,7 @@ impl DirEntry {
      }
=20=20
      #[cfg(any(
diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACK=
ET-in-common-place.patch b/meta/recipes-devtools/rust/files/0001-musl-Defin=
e-SOCK_SEQPACKET-in-common-place.patch
index b6d94e3a1a36..8723f552b631 100644
--- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
+++ b/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  vendor/libc/src/unix/linux_like/linux/musl/mod.rs          | 1 +
  7 files changed, 2 insertions(+), 7 deletions(-)
=20
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm=
/mod.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm=
/mod.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mo=
d.rs
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mo=
d.rs
 @@ -326,7 +326,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 1;
@@ -31,10 +31,10 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like=
/linux/musl/b32/arm/mod.r
=20=20
  pub const EDEADLK: ::c_int =3D 35;
  pub const ENAMETOOLONG: ::c_int =3D 36;
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hex=
agon.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hex=
agon.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexago=
n.rs
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexago=
n.rs
 @@ -296,7 +296,6 @@ pub const SIG_BLOCK: ::c_int =3D 0x000000;
  pub const SIG_UNBLOCK: ::c_int =3D 0x01;
  pub const SOCK_DGRAM: ::c_int =3D 2;
@@ -43,10 +43,10 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like=
/linux/musl/b32/hexagon.r
  pub const SOCK_STREAM: ::c_int =3D 1;
  pub const SOL_CAIF: ::c_int =3D 278;
  pub const SOL_IUCV: ::c_int =3D 277;
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mip=
s/mod.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mip=
s/mod.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/m=
od.rs
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/m=
od.rs
 @@ -350,7 +350,6 @@ pub const ERFKILL: ::c_int =3D 167;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 2;
@@ -55,10 +55,10 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like=
/linux/musl/b32/mips/mod.
=20=20
  pub const SA_ONSTACK: ::c_int =3D 0x08000000;
  pub const SA_SIGINFO: ::c_int =3D 8;
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/pow=
erpc.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/pow=
erpc.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powerp=
c.rs
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powerp=
c.rs
 @@ -257,7 +257,6 @@ pub const MAP_STACK: ::c_int =3D 0x020000;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 1;
@@ -67,10 +67,10 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like=
/linux/musl/b32/powerpc.r
=20=20
  pub const EDEADLK: ::c_int =3D 35;
  pub const ENAMETOOLONG: ::c_int =3D 36;
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86=
/mod.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86=
/mod.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mo=
d.rs
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mo=
d.rs
 @@ -315,7 +315,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
=20=20
  pub const SOCK_STREAM: ::c_int =3D 1;
@@ -79,11 +79,11 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like=
/linux/musl/b32/x86/mod.r
=20=20
  pub const EDEADLK: ::c_int =3D 35;
  pub const ENAMETOOLONG: ::c_int =3D 36;
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod=
.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod=
.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
-@@ -135,8 +135,6 @@ pub const __SIZEOF_PTHREAD_MUTEX_T: usiz
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
+@@ -136,8 +136,6 @@ pub const __SIZEOF_PTHREAD_BARRIER_T: us
=20=20
  pub const SOCK_NONBLOCK: ::c_int =3D 2048;
=20=20
@@ -92,11 +92,11 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like=
/linux/musl/b64/mod.rs
  extern "C" {
      pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uin=
t) -> ::ssize_t;
  }
-Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
+Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-+++ rustc-1.69.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-@@ -526,6 +526,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
+--- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
++++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
+@@ -535,6 +535,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
=20=20
  pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
=20=20
@@ -104,11 +104,11 @@ Index: rustc-1.69.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/mod.rs
  pub const SOCK_DCCP: ::c_int =3D 6;
  pub const SOCK_PACKET: ::c_int =3D 10;
=20=20
-Index: rustc-1.69.0-src/vendor/libc/.cargo-checksum.json
+Index: rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.69.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.69.0-src/vendor/libc/.cargo-checksum.json
+--- rustc-1.70.0-src.orig/vendor/libc/.cargo-checksum.json
++++ rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
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
+-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5cd84=
dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13f06d=
440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c493948=
c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"24111461547739f=
3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b457eb0=
28b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856d=
ddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0e549=
8c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powerpc6=
4.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf","s=
rc/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56=
d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0=
385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad=
3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bsd/a=
pple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed336c=
c59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263afe=
7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b64/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5=
cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec833a7=
47866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/ap=
ple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3bf=
d83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819dc6=
5ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"52b9=
0d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix/bsd=
/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b20=
8170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"8986a=
8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/bsd/=
freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4b16=
0a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670=
eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7=
d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.=
rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686=
d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/f=
reebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae5bee=
c72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f12=
2f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freeb=
sdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7=
553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs=
":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","src/u=
nix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d=
22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/=
freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe1=
97ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b7766136a2=
2ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/freebsd=
like/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc9=
1c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cbfb50=
eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/bsd/f=
reebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747=
a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2da=
e3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bs=
d/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089551a=
04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e=
3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/f=
reebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe5=
18dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs=
":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","src/u=
nix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983ae2d4=
910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee31c3f=
554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a66f7d=
e43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bsd/ne=
tbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc=
877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f5=
36551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlik=
e/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04a4fa=
1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f53123=
7b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbs=
d/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902=
d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe1=
2ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_6=
4.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","s=
rc/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee1=
0d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.rs"=
:"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/un=
ix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e0=
9bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"c0f0=
6c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix/bsd=
/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066ce=
e65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1dd=
5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bs=
d/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710=
e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04f=
d287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd=
/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7=
569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630=
289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32=
.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","sr=
c/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf46=
81f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a7b8a=
2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d1df2=
ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.rs":=
"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/uni=
x/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bb=
e08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b5882fe=
855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/andr=
oid/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3=
ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a3081652=
faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b32/x=
86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0=
dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85dfa18f=
683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/b64/=
aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cd=
dca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5c567=
70d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/=
android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34cd99d=
259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe952bf=
a4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_like/a=
ndroid/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445e597=
552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"19d4=
bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix/lin=
ux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs=
":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src/u=
nix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf75127c=
7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95cbed=
7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_li=
ke/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c3db2=
5e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721a990=
2754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like/lin=
ux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75ec16e=
e96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5a936=
52699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux/arc=
h/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc4277e1=
42460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2e=
b17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/powe=
rpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c41b8=
15","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e61202=
8f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gnu/al=
ign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936",=
"src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd714b4d=
eabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu/b32=
/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dda34e=
6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c0354=
18d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b8c7f=
ef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb=
7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/=
linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df9e43=
ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc8b71=
79711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_like/=
linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc782241=
a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":"d32=
1491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/li=
nux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe7689f1=
99dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc/ali=
gn.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","=
src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b07ad=
37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/b32/=
x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9e=
b413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d9e58=
31bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux/gnu=
/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a9566207=
6d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611=
b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux=
_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2=
052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/l=
p64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072",=
"src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b7fdf=
cedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/gnu/b=
64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a93876=
d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"9c=
39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/unix/l=
inux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8=
bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/=
mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb",=
"src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542ea73f=
b6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/power=
pc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268=
130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2f=
feacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/li=
nux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f9=
9cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"8=
8bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/unix/=
linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c76=
5c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align=
.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","sr=
c/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a02=
78c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/=
x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc=
4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9=
883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f=
7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2=
0218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/l=
inux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f38880f=
e3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135d=
e75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_lik=
e/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d5409=
ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764=
776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linu=
x/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa7df84ee0cfd3d8=
cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs":"226a8b64ce9=
c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/linux_like=
/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b19=
4f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"16=
a7a03d998a5db11be9ee81525c7faec4623383260e8bc125b1c53a050fde75","src/unix/l=
inux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc0=
6e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"d=
c52adc264c34bce80753d6bd064e8fc4b8237fa1e5c5315ccb6c72df74c2813","src/unix/=
linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5d=
a896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902c251=
81c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2f=
f56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/m=
usl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da056287fc42f8e2ccf1d5b=
2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725=
d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_l=
ike/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b20=
52b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/m=
od.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","=
src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9d=
e989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/m=
od.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b134e986191b614b","=
src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffaf461=
f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/musl/b6=
4/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6d368=
07f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux_lik=
e/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544cffa=
cdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77=
309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/l=
inux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32d59a=
88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs":"89=
65596cc33a032f7495c74d0d25ff9169e425491b36c4563b291e9f12e2a1b6","src/unix/l=
inux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b2060=
9defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181a05b=
f94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_=
like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf63=
3936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c2=
7fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux=
_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c4=
22a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"=
9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix=
/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05=
bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mi=
ps/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0af=
db66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc=
78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mi=
ps64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f=
1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e38756=
98c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_lik=
e/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a=
2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfe=
fa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_like/=
linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cc=
cdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba=
5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux=
_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb222e=
e906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.rs=
":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/u=
nix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d822327=
5e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a04225=
0de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c=
710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs=
":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/u=
nix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa=
27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31=
d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab066=
d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/newli=
b/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c=
996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d665fe=
83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495a951=
4bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/m=
od.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","=
src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e3=
82d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee=
3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd7db6=
7aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs":"6=
2198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/unix/=
nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb04=
0bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e616048e1=
89debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e4=
2f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs"=
:"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/un=
ix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262c227=
b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92b=
e53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0ca=
ed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x8=
6_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc"=
,"src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a=
8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506=
c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce=
99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.r=
s":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","src/=
vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb=
181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585=
490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889=
cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92=
be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"=
09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/wind=
ows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb=
31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69d=
fabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323b1a1=
4e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c068271e=
00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb=
0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/cons=
t_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"=
},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f8=
0c"}
 \ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
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
++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5cd84=
dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13f06d=
440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c493948=
c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"24111461547739f=
3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b457eb0=
28b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856d=
ddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0e549=
8c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powerpc6=
4.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf","s=
rc/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56=
d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0=
385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad=
3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bsd/a=
pple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed336c=
c59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263afe=
7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b64/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5=
cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec833a7=
47866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/ap=
ple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3bf=
d83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819dc6=
5ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"52b9=
0d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix/bsd=
/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b20=
8170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"8986a=
8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/bsd/=
freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4b16=
0a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670=
eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7=
d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.=
rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686=
d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/f=
reebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae5bee=
c72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f12=
2f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freeb=
sdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7=
553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs=
":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","src/u=
nix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d=
22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/=
freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe1=
97ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b7766136a2=
2ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/freebsd=
like/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc9=
1c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cbfb50=
eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/bsd/f=
reebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747=
a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2da=
e3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bs=
d/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089551a=
04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e=
3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/f=
reebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe5=
18dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs=
":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","src/u=
nix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983ae2d4=
910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee31c3f=
554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a66f7d=
e43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bsd/ne=
tbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc=
877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f5=
36551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlik=
e/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04a4fa=
1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f53123=
7b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbs=
d/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902=
d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe1=
2ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_6=
4.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","s=
rc/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee1=
0d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.rs"=
:"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/un=
ix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e0=
9bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"c0f0=
6c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix/bsd=
/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066ce=
e65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1dd=
5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bs=
d/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710=
e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04f=
d287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd=
/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7=
569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630=
289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32=
.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","sr=
c/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf46=
81f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a7b8a=
2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d1df2=
ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.rs":=
"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/uni=
x/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bb=
e08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b5882fe=
855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/andr=
oid/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3=
ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a3081652=
faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b32/x=
86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0=
dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85dfa18f=
683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/b64/=
aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cd=
dca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5c567=
70d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/=
android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34cd99d=
259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe952bf=
a4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_like/a=
ndroid/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445e597=
552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"19d4=
bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix/lin=
ux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs=
":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src/u=
nix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf75127c=
7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95cbed=
7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_li=
ke/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c3db2=
5e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721a990=
2754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like/lin=
ux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75ec16e=
e96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5a936=
52699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux/arc=
h/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc4277e1=
42460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2e=
b17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/powe=
rpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c41b8=
15","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e61202=
8f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gnu/al=
ign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936",=
"src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd714b4d=
eabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu/b32=
/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dda34e=
6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c0354=
18d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b8c7f=
ef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb=
7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/=
linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df9e43=
ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc8b71=
79711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_like/=
linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc782241=
a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":"d32=
1491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/li=
nux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe7689f1=
99dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc/ali=
gn.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","=
src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b07ad=
37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/b32/=
x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9e=
b413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d9e58=
31bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux/gnu=
/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a9566207=
6d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611=
b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux=
_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2=
052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/l=
p64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072",=
"src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b7fdf=
cedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/gnu/b=
64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a93876=
d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"9c=
39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/unix/l=
inux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8=
bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/=
mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb",=
"src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542ea73f=
b6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/power=
pc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268=
130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2f=
feacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/li=
nux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f9=
9cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"8=
8bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/unix/=
linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c76=
5c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align=
.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","sr=
c/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a02=
78c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/=
x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc=
4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9=
883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f=
7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2=
0218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/l=
inux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f38880f=
e3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135d=
e75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_lik=
e/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d5409=
ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764=
776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linu=
x/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779ebfa9320a1f6a4102=
7529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon.rs":"5625a3dfcd8=
fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","src/unix/linux_like=
/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b19=
4f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"bb=
5f45dd376e928a22282e1696989399b0e8d0a5fbc8309bb4238926d81e61e7","src/unix/l=
inux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc0=
6e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"f=
23491f21f3eeac3e05a76b466567ea633b92a4830ab8b401cbb31c74ad1acab","src/unix/=
linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5d=
a896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902c251=
81c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2f=
f56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/m=
usl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080226afc0006d71d5dd57=
8c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725=
d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_l=
ike/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b20=
52b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/m=
od.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","=
src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9d=
e989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/m=
od.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b80ae7ec0317c7ee5c98","=
src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffaf461=
f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/musl/b6=
4/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6d368=
07f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux_lik=
e/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544cffa=
cdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77=
309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/l=
inux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32d59a=
88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs":"46=
b47255dd8ce2ae32443267f5f334e2e72341d58615edf50611218506a08082","src/unix/l=
inux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b2060=
9defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181a05b=
f94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_=
like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf63=
3936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c2=
7fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux=
_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c4=
22a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"=
9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix=
/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05=
bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mi=
ps/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0af=
db66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc=
78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mi=
ps64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f=
1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e38756=
98c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_lik=
e/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a=
2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfe=
fa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_like/=
linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cc=
cdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba=
5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux=
_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb222e=
e906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.rs=
":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/u=
nix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d822327=
5e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a04225=
0de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c=
710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs=
":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/u=
nix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa=
27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31=
d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab066=
d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/newli=
b/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c=
996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d665fe=
83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495a951=
4bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/m=
od.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","=
src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e3=
82d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee=
3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd7db6=
7aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs":"6=
2198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/unix/=
nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb04=
0bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e616048e1=
89debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e4=
2f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs"=
:"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/un=
ix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262c227=
b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92b=
e53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0ca=
ed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x8=
6_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc"=
,"src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a=
8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506=
c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce=
99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.r=
s":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","src/=
vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb=
181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585=
490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889=
cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92=
be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"=
09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/wind=
ows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb=
31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69d=
fabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323b1a1=
4e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c068271e=
00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb=
0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/cons=
t_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"=
},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f8=
0c"}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.70.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.69.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.69.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.69.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-64bit-o=
ff_t-on-32bit-glibc-systems.patch b/meta/recipes-devtools/rust/rust-llvm/00=
35-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
deleted file mode 100644
index fe98e3e4c05c..000000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-64bit-off_t-on=
-32bit-glibc-systems.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From cd2fa12d715929642513fc441287c402f4560096 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 25 Dec 2022 15:13:41 -0800
-Subject: [PATCH] build: Enable 64bit off_t on 32bit glibc systems
-
-Pass -D_FILE_OFFSET_BITS=3D64 to compiler flags on 32bit glibc based
-systems. This will make sure that 64bit versions of LFS functions are
-used e.g. lseek will behave same as lseek64. Also revert [1] partially
-because this added a cmake test to detect lseek64 but then forgot to
-pass the needed macro during actual compile, this test was incomplete too
-since libc implementations like musl has 64-bit off_t by default on 32-bit
-systems and does not bundle -D_LARGEFILE64_SOURCE [2] under -D_GNU_SOURCE
-like glibc, which means the compile now fails on musl because the cmake
-check passes but we do not have _LARGEFILE64_SOURCE defined. Moreover,
-Using the *64 function was transitional anyways so use
--D_FILE_OFFSET_BITS=3D64 instead
-
-[1] https://github.com/llvm/llvm-project/commit/8db7e5e4eed4c4e697dc3164f2=
c9351d8c3e942b
-[2] https://git.musl-libc.org/cgit/musl/commit/?id=3D25e6fee27f4a293728dd1=
5b659170e7b9c7db9bc
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D139752]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/cmake/config-ix.cmake                                | 8 +++++---
- llvm/include/llvm/Config/config.h.cmake                   | 3 ---
- llvm/lib/Support/raw_ostream.cpp                          | 2 --
- llvm/utils/gn/secondary/llvm/include/llvm/Config/BUILD.gn | 2 --
- utils/bazel/llvm-project-overlay/llvm/config.bzl          | 1 -
- .../llvm/include/llvm/Config/config.h                     | 3 ---
- utils/bazel/llvm_configs/config.h.cmake                   | 3 ---
- 7 files changed, 5 insertions(+), 17 deletions(-)
-
---- a/llvm/cmake/config-ix.cmake
-+++ b/llvm/cmake/config-ix.cmake
-@@ -284,9 +284,6 @@ check_symbol_exists(futimes sys/time.h H
- if( HAVE_SIGNAL_H AND NOT LLVM_USE_SANITIZER MATCHES ".*Address.*" AND NO=
T APPLE )
-   check_symbol_exists(sigaltstack signal.h HAVE_SIGALTSTACK)
- endif()
--set(CMAKE_REQUIRED_DEFINITIONS "-D_LARGEFILE64_SOURCE")
--check_symbol_exists(lseek64 "sys/types.h;unistd.h" HAVE_LSEEK64)
--set(CMAKE_REQUIRED_DEFINITIONS "")
- check_symbol_exists(mallctl malloc_np.h HAVE_MALLCTL)
- check_symbol_exists(mallinfo malloc.h HAVE_MALLINFO)
- check_symbol_exists(mallinfo2 malloc.h HAVE_MALLINFO2)
-@@ -350,6 +347,11 @@ check_symbol_exists(__GLIBC__ stdio.h LL
- if( LLVM_USING_GLIBC )
-   add_definitions( -D_GNU_SOURCE )
-   list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_GNU_SOURCE")
-+# enable 64bit off_t on 32bit systems using glibc
-+  if (CMAKE_SIZEOF_VOID_P EQUAL 4)
-+    add_compile_definitions(_FILE_OFFSET_BITS=3D64)
-+    list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_FILE_OFFSET_BITS=3D64")
-+  endif()
- endif()
- # This check requires _GNU_SOURCE
- if (NOT PURE_WINDOWS)
---- a/llvm/include/llvm/Config/config.h.cmake
-+++ b/llvm/include/llvm/Config/config.h.cmake
-@@ -128,9 +128,6 @@
- /* Define to 1 if you have the <link.h> header file. */
- #cmakedefine HAVE_LINK_H ${HAVE_LINK_H}
-=20
--/* Define to 1 if you have the `lseek64' function. */
--#cmakedefine HAVE_LSEEK64 ${HAVE_LSEEK64}
--
- /* Define to 1 if you have the <mach/mach.h> header file. */
- #cmakedefine HAVE_MACH_MACH_H ${HAVE_MACH_MACH_H}
-=20
---- a/llvm/lib/Support/raw_ostream.cpp
-+++ b/llvm/lib/Support/raw_ostream.cpp
-@@ -804,8 +804,6 @@ uint64_t raw_fd_ostream::seek(uint64_t o
-   flush();
- #ifdef _WIN32
-   pos =3D ::_lseeki64(FD, off, SEEK_SET);
--#elif defined(HAVE_LSEEK64)
--  pos =3D ::lseek64(FD, off, SEEK_SET);
- #else
-   pos =3D ::lseek(FD, off, SEEK_SET);
- #endif
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.69.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.70.0.bb
similarity index 94%
rename from meta/recipes-devtools/rust/rust-llvm_1.69.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
index 6304070debf3..09e4c65be383 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.69.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
@@ -4,14 +4,13 @@ HOMEPAGE =3D "http://www.rust-lang.org"
=20
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE =3D "15.0.6"
+LLVM_RELEASE =3D "16.0.2"
=20
 require rust-source.inc
=20
 SRC_URI +=3D "file://0002-llvm-allow-env-override-of-exe-path.patch;stripl=
evel=3D2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-=
we.patch;striplevel=3D2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=3D2 \
-	    file://0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch;str=
iplevel=3D2"
+	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=3D2"
=20
 S =3D "${RUSTSRC}/src/llvm-project/llvm"
=20
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index dbf50abc022b..e31a699d2e0e 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,51 +4,51 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.68.2"
+SNAPSHOT_VERSION =3D "1.69.0"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "a1b1f8ffdd56747453cb9531f70=
474ddbe603533e7b06647a810e32fc7c3a8ba"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "cbe60945af743804be682270=
4f986c812dd1fe1d167602aec5350a8f519f9861"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d78579af4d4b98b3bf49b8a0b78=
48960e68254150ac517faeb9caf7b9f44ede2"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b0ffb368d4e66a5808f96659cc5=
98030761cb06966ae8d5299596b14fbc09364"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "c3c5346b1e95ea9bd806b0dd=
9ff9aa618976fb38f4f3a615af4964bb4dd15633"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d14166fa0b2832dd87b3f35c08d=
0bc829f83aa01a539b45df3d923469ee119be"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "aeee38c0cd35b531d9f00028f72035=
8256e9f3b80b176467c6afc033a16c92aa"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "695d4469c131b9993c939db0ce7=
3a3866ab8e69dd657ec3137f3d594857f7812"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "dc533e7d0f0349d92a98973e20b99d=
69b09a25b8675f28a38fa26b0160615fd4"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "4c9b1b2fb692bb0c81e524df636872=
3f061c8bb0d21a1f487eb8e5c2bdf323ab"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "bef330af5bfb381a01349186e05=
402983495a3e2d4d1c35723a8443039d19a2d"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "788ff61555857680d5ea7cf76023f7=
4a7f4820dd1c26abf76536561d4de3cbe6"
=20
-SRC_URI[cargo-snapshot-mips.sha256sum] =3D "8d24614f31ba67fe10a642e9f49d64=
066b4ce6789a80a101ae10afcc2a194c97"
-SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "4ab007f223cf723f8f7adf26a60=
14f4f5aa444f88c19daccc5ac81ea30275c66"
-SRC_URI[rustc-snapshot-mips.sha256sum] =3D "68c6aac6e0e95588b65d6f937032b5=
7ad2a09b2897990a3a930729763f728e12"
+SRC_URI[cargo-snapshot-mips.sha256sum] =3D "bdaef2f95b0485dc2a5cde74c08bd2=
69174bbbb553226c5b5d2287e52841b061"
+SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "89849b93af9d4922554c938bc1c=
7641498d13c3a8b2b464f3bb7a060eae7a580"
+SRC_URI[rustc-snapshot-mips.sha256sum] =3D "ef17b364df355f7322c1fdd3b4cc42=
96d2d5d489b58fdd4b12374a1f2975a455"
=20
-SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "8664ff821dfd8bb252c61c2b7473=
e355bd38cd8a6bc15a9ecc98af46f6a2b282"
-SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "c299d65b3594c309d092f6a0f=
e15c205ab489ffa50910fb8126e944a2727cbe5"
-SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "de72245d5e6db0e4327ce105a7ce=
3d5597a3792e71b95578dd7ec62af56946fb"
+SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "df114ac589fb50fcc3027e26c6e2=
01fc530aadef1bcc8f6396c761a457ba7bbb"
+SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "22bb266cf4e6da4d686714487=
3579b0da47e59c8ec9cb1a329ee8a7f418e8ee3"
+SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "9df4110f716a309323a776952fcf=
0dccaae878e7abf0d148c14a2a03c5170850"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "13ad9e74376fc01d9d770447c14=
1a18dd986dd60bbd4c6177ed80df4a28fc142"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "e75bdc8a6e3f00285a376062=
40862cdad69a986c3e3d47d6af1376613281233a"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "92b08b1ad69786f3bcc6fd7bb71=
411ad162dca478f9636027bf809b9de6eea72"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "26c774db5e21ddf66107b677d5c=
6612d50611186feaa68ff11c34a61e4d5a57e"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6303fc2be557467af0f1ff9c=
c756fd14ae2b9db7f17f42a1d2238ed934351e56"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "716e790b7658206c59dc8019c1b=
603f230c5ce945229463367fade862cea60b9"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "ad4eded41be32bb19a5f6224d=
aacb9589947956f4be9f884f7ea06323b448088"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "354322352cd8b661b84f5e=
97729d5d7adb7df9cb9bfd43cac378271c40214d7f"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "a23e71c7da172ece7ef760db0=
43b010c84dd8a491cd9c00303e2c01ad521dec2"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "160692a0fc5fe1b48b617e063=
c6ce1d4546e108b32c0049dbde95602a30af133"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "6a4b8b5307141c8207ed67=
d4fbaf9345c42fb3662e389b9dd3d9a4086c1b6efe"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "313d0944a1fc41c1c5ce0a054=
b3cebccd6f471ce8e8272e5e68f36b8d08e5bb1"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "1eb1c330d281a9478d51472=
4c5089225b3f66880f4a69e9e02b9d389f000adbb"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "e69c8c1b7b0df839b271=
a2c12985b1c56565a34f9b357631ed99fa9263f3d326"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "4d493bec7500dd3159c05ee=
8f2fef71241de575e1cb7a89bf128f01dc3e537cb"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "9a3fe155d763b382ea18753=
133cb0e2186993e2850568134e2f7e468f2d07197"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "c44bcf91a9d13412a59b=
a75e7f8bd14c7f60d44cdb7b21916e502c90b4b378ce"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "1781b5be30fa4fadf7608cc=
9cd3a2de93b3671a09adfa98ae4d975f789ba2275"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "d5a154406bc6ebc6d5cdd3198=
aa2b5167ceef130454c56bcf03e37fa6b290882"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8388ac7a5f924d5d6aa441=
ae97c33c1abf11fd9516f2b9853f7edc0c5d6c453b"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "de7ef61f6fa5f7ddddbddc093=
4beec58a3ce49cda96679dbf06895128f1fc228"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "9bc29f493c353313b968243fb=
df5147c9ca401f7f8205aed63f180b5757161e2"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8c32a848e2688b2900c3e0=
73da8814ce5649ce6e0362be30d53517d7a9ef21ff"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "03606f1ad3fd196e73e0d255a=
b6342e4e8fef2edaa1afcc577411aa8a68f0133"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "26353406aba935e135e0527673bfd=
3805de88ff9a63187135e73b5788f385112"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "7f909658496692a05dd241c15f=
79a02f80658d353013dace127fdc69dc5026b4"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "fbfb02fff83f4a9d7298c511a3ad4=
b9e73c4d9d0be558edbf7226af0f586517a"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "812907846a454a182b05eab76658b=
49eabd8d06d2b5e8df56f29d73971f91b03"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "5c98653199b89bff6f368bed61=
fca7860f7179364ce9e9474c90af38e2629baf"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "3cef208c0761bc83d156a14a5a948=
21cc9421772f0f376ea54765a6d00842b21"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "b25d6f88b93cb75868ff4bc9ca01=
03facd4622825cf53df67546cea6cb60da0f"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "c8a3eaf26b83f1926d86b4db9=
9ca16cbbff8e746e4c63f25f4d75a02a34a3b16"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "d33d493381dd17a4b491d0e978cd=
b6700badb5905e831dd5f7fe75ffbf8e0584"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "336eeabf231a7665c26c127a37b8=
aefffe28cb087c5c8d4ba0460419f5f8eff2"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "4c95739e6f0f1d4defd937f6d=
60360b566e051dfb2fa71879d0f9751392f3709"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "70e97ab5b9600328b977268fc92c=
a4aa53064e4e97468df35215d4396e509279"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "07fc71adf63691ae5e103c57c29=
5e665b6dfc096fe4bedfeb5e1d33c133bb9f4"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "a8125d72e06f2d866472a7aca3b=
d20a247160171d23a75c4207761a05e00ed5b"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "787f5cbbcec4e75b9beba380=
4ea05e36b7cb9b164c291cf7ce8f775d05634d61"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7d50ff8499d8925ea973aa65=
9e1a88190547615b3cfecb79e776ef8de953b755"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 9dceb904b66a..fbe2492fb4f5 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUS=
T_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;p=
atchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "e533c903820b0c2ba10491b70105149d2243348f3b5e2=
6bd7b6bdd022c7dbe75"
+SRC_URI[rust.sha256sum] =3D "bb8e9c564566b2d3228d95de9063a9254182446a16135=
3f1d843bfbaf5c34639"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.69.0.bb b/meta/recipes-devto=
ols/rust/rust_1.70.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.69.0.bb
rename to meta/recipes-devtools/rust/rust_1.70.0.bb
--=20
2.39.0


