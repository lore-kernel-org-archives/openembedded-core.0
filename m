Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB09C43219
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4666.1642588894290421252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f/MRRJEO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 h206-20020a1c21d7000000b0034d95625e1fso5421663wmh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXLRaoP8UqfpjmksqnuHH2ePM2aHlQoaznhO1nU1yf0=;
        b=f/MRRJEOOIiYu9KF7LjxK5VGRjPOBnRVrJ1n2oHE09SUdj7TNcxsaFjnneHdCWBK+P
         Fsdr8P19EQiCviRmEppS3L2fsG5eQsgJxZpudpVSBhahyEScuCiCuQH+vdmZkxjkEJbJ
         dz6tcoekIejsYMogh8Mvsi3w9U2cOD8ibYPa6JXURBuFZU6yIekTJ9tOpg/RV/06sYec
         uflXxglrQXlnZX/OoQE1fN+vKhRD1aIHOpcRdrC4CusIL/swILomsaJFvNjMfX2QWkBy
         Fnxr4++uAuYDd7q43nx0yjFOjRHAd82nfSdH/oqQpUCqmDOAELvwloI5Cg6yoUau88V4
         Oxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXLRaoP8UqfpjmksqnuHH2ePM2aHlQoaznhO1nU1yf0=;
        b=asIbR4DeGaPfA8AcsFosOmdJqmHAY5S2x6ISzVjEOIHa7YXS2tJolgTP8vosrOswBC
         RUVVn95bbf6OU3fcofcA8cflPLx9lPjk2Ab1mV0AVU08/U0Xv196kprirLyneDbC3ayh
         aVNvb25pL/Pl+5qzz2fkSrImj65t4uGf4HX8PiAwfyvaaz9FXgPnZDdISsQhWrJmTWb6
         miLwE+t5GqyA9VqesEk51Q+2KUjw6hcRBfRW8hD1mFTe/99Cgw3xDDEFAlO2iy1WHFRL
         RR8a40TULH9hCuIrTpizHhhUNpEt4ekmjx7KxzN2KNweMPX2c+gmdvfrnsvKUJ6kKb0z
         fC6w==
X-Gm-Message-State: AOAM533j5f6h43qa1HAzrvY0MkkPDBZzA7tLnnmP/HjhzQRXoDDdwhmD
	tXJ0OjcRFjkMQDj4RLrCWoIIWACuw/s=
X-Google-Smtp-Source: 
 ABdhPJwx43+sx3niv6i/rhkEWk/z5oXUi51qMzWbfHF3XjqyyWaXks/KQk9HhrtDIFYfoPrt8No/9Q==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr2823592wml.31.1642588891991;
        Wed, 19 Jan 2022 02:41:31 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ralf Anton Beier <ralf_beier@me.com>
Subject: [PATCH 09/39] rust: update 1.57.0 -> 1.58.0
Date: Wed, 19 Jan 2022 11:40:47 +0100
Message-Id: <20220119104117.2120127-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160701

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...57.0.bb =3D> cargo-cross-canadian_1.58.0.bb} |  0
 .../{cargo_1.57.0.bb =3D> cargo_1.58.0.bb}      |  0
 ...d-base-definitions-for-riscv64-musl.patch} | 18 ++++++++++-----
 ...-musl-mod.rs-add-riscv64-to-b64-set.patch} | 13 +++++++----
 ...P-Correct-definitions-to-match-musl.patch} | 15 ++++++++-----
 ...hecksums-for-modified-files-for-rust.patch | 22 +++++++++++++++++++
 ...hecksums-for-modified-files-for-rust.patch | 22 -------------------
 .../recipes-devtools/rust/libstd-rs_1.57.0.bb | 11 ----------
 .../recipes-devtools/rust/libstd-rs_1.58.0.bb | 12 ++++++++++
 ....57.0.bb =3D> rust-cross-canadian_1.58.0.bb} |  0
 ...t-cross_1.57.0.bb =3D> rust-cross_1.58.0.bb} |  0
 ...ust-llvm_1.57.0.bb =3D> rust-llvm_1.58.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 16 +++++++-------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 ...bb =3D> rust-tools-cross-canadian_1.58.0.bb} |  0
 .../rust/{rust_1.57.0.bb =3D> rust_1.58.0.bb}   |  0
 17 files changed, 76 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.57.0.bb =3D> ca=
rgo-cross-canadian_1.58.0.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.57.0.bb =3D> cargo_1.58.0.bb} =
(100%)
 rename meta/recipes-devtools/rust/libstd-rs/{0005-Add-base-definitions-for=
-riscv64-musl-libc.patch =3D> 0001-Add-base-definitions-for-riscv64-musl.pa=
tch} (97%)
 rename meta/recipes-devtools/rust/libstd-rs/{0006-FIXUP-linux-musl-mod.rs-=
add-riscv64-to-b64-set.patch =3D> 0002-FIXUP-linux-musl-mod.rs-add-riscv64-=
to-b64-set.patch} (69%)
 rename meta/recipes-devtools/rust/libstd-rs/{0007-FIXUP-Correct-definition=
s-to-match-musl.patch =3D> 0003-FIXUP-Correct-definitions-to-match-musl.pat=
ch} (98%)
 create mode 100644 meta/recipes-devtools/rust/libstd-rs/0004-Update-checks=
ums-for-modified-files-for-rust.patch
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs/0008-Update-checks=
ums-for-modified-files-for-rust.patch
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs_1.57.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.58.0.bb
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.57.0.bb =3D> rust=
-cross-canadian_1.58.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.57.0.bb =3D> rust-cross_1.=
58.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.57.0.bb =3D> rust-llvm_1.58=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.57.0.bb =3D=
> rust-tools-cross-canadian_1.58.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.57.0.bb =3D> rust_1.58.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 49e99af8f2..b8b2e7cbf7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.17%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "12.0.1"
-RUSTVERSION ?=3D "1.57.0"
+RUSTVERSION ?=3D "1.58%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.57.0.bb b/m=
eta/recipes-devtools/cargo/cargo-cross-canadian_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.57.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.58.0.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.57.0.bb b/meta/recipes-dev=
tools/cargo/cargo_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.57.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.58.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions=
-for-riscv64-musl-libc.patch b/meta/recipes-devtools/rust/libstd-rs/0001-Ad=
d-base-definitions-for-riscv64-musl.patch
similarity index 97%
rename from meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-=
for-riscv64-musl-libc.patch
rename to meta/recipes-devtools/rust/libstd-rs/0001-Add-base-definitions-fo=
r-riscv64-musl.patch
index dedf9af415..b1cd45d1dc 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-ri=
scv64-musl-libc.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0001-Add-base-definitions-for-ri=
scv64-musl.patch
@@ -1,7 +1,7 @@
-From 4e188d047dee33a19902113a3c90cdf1d8310a9e Mon Sep 17 00:00:00 2001
+From 8b86ecf87cf3589861b458f099572ad8487fc6cc Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:05:06 +0200
-Subject: [PATCH 5/8] Add base definitions for riscv64 + musl
+Subject: [PATCH 1/4] Add base definitions for riscv64 + musl
=20
 https://github.com/rust-lang/libc/pull/1994/commits/030a07761f61f3293d5375=
2e60edbd330a9d718d
=20
@@ -10,10 +10,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
  .../src/unix/linux_like/linux/musl/b64/mod.rs |   3 +
- .../linux_like/linux/musl/b64/riscv64/mod.rs  | 867 ++++++++++++++++++
- 2 files changed, 870 insertions(+)
- create mode 100644 vendor/libc-0.2.98/src/unix/linux_like/linux/musl/b64/=
riscv64/mod.rs
+ .../linux_like/linux/musl/b64/riscv64/mod.rs  | 832 ++++++++++++++++++
+ 2 files changed, 835 insertions(+)
+ create mode 100644 vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64=
/mod.rs
=20
+diff --git a/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs b/vendo=
r/libc/src/unix/linux_like/linux/musl/b64/mod.rs
+index cfcdaaecf..7261b95d2 100644
 --- a/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
 +++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
 @@ -163,6 +163,9 @@ cfg_if! {
@@ -26,6 +28,9 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
      } else {
          // Unknown target_arch
      }
+diff --git a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs=
 b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+new file mode 100644
+index 000000000..c656189c4
 --- /dev/null
 +++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
 @@ -0,0 +1,832 @@
@@ -861,3 +866,6 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 +pub const SYS_process_madvise: ::c_long =3D 440;
 +pub const SYS_epoll_pwait2: ::c_long =3D 441;
 +pub const SYS_mount_setattr: ::c_long =3D 442;
+--=20
+2.20.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod=
.rs-add-riscv64-to-b64-set.patch b/meta/recipes-devtools/rust/libstd-rs/000=
2-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch
similarity index 69%
rename from meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.=
rs-add-riscv64-to-b64-set.patch
rename to meta/recipes-devtools/rust/libstd-rs/0002-FIXUP-linux-musl-mod.rs=
-add-riscv64-to-b64-set.patch
index a037d407e6..0f159c6025 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add=
-riscv64-to-b64-set.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0002-FIXUP-linux-musl-mod.rs-add=
-riscv64-to-b64-set.patch
@@ -1,7 +1,7 @@
-From 4319893ebb7fca8bbd2bffc4bddb8d3ecdc08cc2 Mon Sep 17 00:00:00 2001
+From bd805ef63035ecefa03f67d5ab2e1d79f7daf9bc Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:07:21 +0200
-Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set
+Subject: [PATCH 2/4] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set
=20
 https://github.com/rust-lang/libc/pull/1994/commits/30070c822be2ef399b2ba3=
8cdc1d72ac694d65a3
=20
@@ -9,12 +9,14 @@ Upstream-Status: Submitted [https://github.com/rust-lang/=
libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
- vendor/libc-0.2.98/src/unix/linux_like/linux/musl/mod.rs | 3 ++-
+ vendor/libc/src/unix/linux_like/linux/musl/mod.rs | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
+diff --git a/vendor/libc/src/unix/linux_like/linux/musl/mod.rs b/vendor/li=
bc/src/unix/linux_like/linux/musl/mod.rs
+index df596e968..1ab13a712 100644
 --- a/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
 +++ b/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-@@ -709,7 +709,8 @@ cfg_if! {
+@@ -765,7 +765,8 @@ cfg_if! {
                   target_arch =3D "aarch64",
                   target_arch =3D "mips64",
                   target_arch =3D "powerpc64",
@@ -24,3 +26,6 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
          mod b64;
          pub use self::b64::*;
      } else if #[cfg(any(target_arch =3D "x86",
+--=20
+2.20.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-defini=
tions-to-match-musl.patch b/meta/recipes-devtools/rust/libstd-rs/0003-FIXUP=
-Correct-definitions-to-match-musl.patch
similarity index 98%
rename from meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definit=
ions-to-match-musl.patch
rename to meta/recipes-devtools/rust/libstd-rs/0003-FIXUP-Correct-definitio=
ns-to-match-musl.patch
index aca6290fe7..288f4c5286 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-t=
o-match-musl.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0003-FIXUP-Correct-definitions-t=
o-match-musl.patch
@@ -1,7 +1,7 @@
-From 9d240d05c6e6620f36e4ddbcbcb5862fb3269d9f Mon Sep 17 00:00:00 2001
+From a811c933372b18b98fdef3d5901b512131b27b1c Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:09:17 +0200
-Subject: [PATCH 7/8] FIXUP Correct definitions to match musl
+Subject: [PATCH 3/4] FIXUP Correct definitions to match musl
=20
 https://github.com/rust-lang/libc/pull/1994/commits/5f6a4d9745c79c81be63c7=
08515ab116786554a3
=20
@@ -9,9 +9,11 @@ Upstream-Status: Submitted [https://github.com/rust-lang/l=
ibc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
- .../linux_like/linux/musl/b64/riscv64/mod.rs  | 708 ++++++++----------
- 1 file changed, 311 insertions(+), 397 deletions(-)
+ .../linux_like/linux/musl/b64/riscv64/mod.rs  | 655 +++++++++---------
+ 1 file changed, 312 insertions(+), 343 deletions(-)
=20
+diff --git a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs=
 b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+index c656189c4..1799539c2 100644
 --- a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
 +++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
 @@ -191,351 +191,8 @@ s! {
@@ -366,7 +368,7 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
  pub const SYS_read: ::c_long =3D 63;
  pub const SYS_write: ::c_long =3D 64;
  pub const SYS_close: ::c_long =3D 57;
-@@ -830,3 +487,315 @@ pub const SYS_faccessat2: ::c_long =3D 439
+@@ -830,3 +487,315 @@ pub const SYS_faccessat2: ::c_long =3D 439;
  pub const SYS_process_madvise: ::c_long =3D 440;
  pub const SYS_epoll_pwait2: ::c_long =3D 441;
  pub const SYS_mount_setattr: ::c_long =3D 442;
@@ -682,3 +684,6 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 +extern "C" {
 +    pub fn ioctl(fd: ::c_int, request: ::c_int, ...) -> ::c_int;
 +}
+--=20
+2.20.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs/0004-Update-checksums-for=
-modified-files-for-rust.patch b/meta/recipes-devtools/rust/libstd-rs/0004-=
Update-checksums-for-modified-files-for-rust.patch
new file mode 100644
index 0000000000..6f0e3315f9
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs/0004-Update-checksums-for-modifi=
ed-files-for-rust.patch
@@ -0,0 +1,22 @@
+From 6dc0a4273b01ec9492af4965f47450a8b8a7c202 Mon Sep 17 00:00:00 2001
+From: Ralf Anton Beier <ralf_beier@me.com>
+Date: Sun, 8 Aug 2021 11:19:24 +0200
+Subject: [PATCH 4/4] Update checksums for modified files for rust
+
+Upstream-Status: Inappropriate [previous patches need to be upstreamed]
+Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
+---
+ vendor/libc/.cargo-checksum.json | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vendor/libc/.cargo-checksum.json b/vendor/libc/.cargo-checksu=
m.json
+index 8cf4eba1b..333cb7cf9 100644
+--- a/vendor/libc/.cargo-checksum.json
++++ b/vendor/libc/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"d6f6253f05d207b6c676e5647b31ad0ca3f05da=
3ac05db47f81d4ebd901ba22f","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"a71b92db5077b33af=
4ee6f1de33574ac33c2b292840eddbe3f7cce37f1fb16b9","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"e92c56b42f1bd1b=
9e66be2a9b73aca6ba29024b9bd17c16f327dfbe8831e3f86","src/macros.rs":"c1a299d=
5327ba033f079388f8ac8a44848f9aeff6a72e9be6dfa70f4769cc619","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"8cdae0cc37c43dabd4253a534e700bec6b6a57293c0c8e36c9ce16675=
d16799a","src/solid/arm.rs":"852b58a0837fde089cb9b5af131bf653daeb8c726f7540=
032756db8b7d4f8149","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
52d40885a0024fbe43676fe54d14b","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"f0c321=
265dd7671f16106b84951ac7dd77ed2e65c6623cbf2d29e76531984770","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"96f101bdab46a9f0a5249a8143d4a9def055284a0c2bd62bce15532a5bed428c"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"6ea4129eb5d6da5c09f8cf3692b5e7716f058b48d1e8c61115691709eda7ce51",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"bf0a994e2079b8aad9da5efd3a3b9a7194a53ae60887a25c57964fb6=
8499e847","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"295b3e3b67394f731d4e88d169e3d3d1d80026b9989=
8745cd0d1d163f085ff61","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"98f6af2021b434f9c3197094312b457774381220f31a22c3b15b1fe8a6=
0cb365","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/mod.rs":"6b825079ffe3f9aec6e78ea6b50acedcb91a4e1312d721105b7f=
8b1555f254df","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e=
6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdli=
ke/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aa=
e23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c9=
3cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f=
096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"c3a011=
1252e201c172b99e7d9cbee4cf088d3dd47995110e819f04276bccd198","src/unix/bsd/f=
reebsdlike/mod.rs":"98d322b22050a80636841287d9ed12549a2004a9dbe151763e5b127=
0f5e73ea3","src/unix/bsd/mod.rs":"2fed08973739d7f6a7412b204724af64b1a915c71=
2689c250cf9a08263ba05ff","src/unix/bsd/netbsdlike/mod.rs":"4e9da54e541773c7=
ad4cca9dade1df00f28f2fdac3f8df5957f4c74b7e082344","src/unix/bsd/netbsdlike/=
netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc877353449=
d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3=
bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/=
mod.rs":"f6de6981382af87518e4a5b6d26c2ea551ed74640dd7166107a824af30ced243",=
"src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa6=
69df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64=
.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","sr=
c/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa90=
9cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"1a=
fe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","src/unix/b=
sd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b1=
2c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/mod.rs":"47aaab2=
bd8238e937112ff17e8262945c8e5865d5e696f218b11c1da59830808","src/unix/bsd/ne=
tbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424=
ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a=
2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdl=
ike/openbsd/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448=
fe2cf7675a4e1","src/unix/haiku/b32.rs":"69ae47fc52c6880e85416b4744500d5655c=
9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"73e64db09275a8da8d5=
0a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix/haiku/mod.rs":"80a=
6cfb58acbbc471dbd412dd76a41f372befc8f217fb1671ed4ce8d391dced0","src/unix/ha=
iku/native.rs":"44855f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017=
c8be6","src/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e169=
36a1a35d9a52789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
63d0083d0f368ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"85=
9814f5df89e28fd4b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/h=
ermit/x86_64.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539=
bfa110c","src/unix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c5=
8055dde0c4ceea5e00150063b24ddc60768332a4","src/unix/linux_like/android/b32/=
mod.rs":"d971b98530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715",=
"src/unix/linux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3=
374615dc3a4bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86=
/mod.rs":"8388bd3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89"=
,"src/unix/linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf688404=
82bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b6=
4/aarch64/mod.rs":"8fe667d2b14abc5ac8aad32e16c3da24350471d8156eaea9ab4989f7=
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde=
3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"07cebaa8d953446b8df5cb7c5de3932ae85b04d9e9993e3a3a126ff8f15111=
a4","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"b71d37106750f57bc2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"1618634d37348032f5ce1dc9df1aaa1f1681bca4=
a275f23d41f42098c4d3b423","src/unix/linux_like/linux/arch/mips/mod.rs":"dac=
02cd01dbd3b222286887c64d398c031afc08d38850c2b3ce2fe7158d888e0","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"e7139d3bfb291a283c767e6201eac8bbb58c91839a3=
6fa56bfe500fcb3aa754a","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"5e40c=
273b767c369a46c3315c7cfde97379944ed63c74735e98d4dae2c49d414","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"20b4c897fb3f63e31a04849b348ec8e6e6405ce9463048d411114f8c9dbabd8a","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"ee5145a383386b716605a8d1ff3df21=
2d418aae1aa1f37d2307d4f9cd1a08e99","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"a2c4ae8f31a74e4843b8ff=
4b6507419f403b52713169fcee9b1b24eb2324162a","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"525ee4917b54790ce=
fc1298ec1015cea6332d818d9c7475434e94d06afdd59c0","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"d179cbb462c451ff8805029b2b922c4bf90e35f667e80d716d5064f563aebc52"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"7d456da436017cb388b65b2c4b626c83b489cbb19a591673b9c627=
a608d53cfc","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"5b982c41097f4f91adcb0968290afeccb2=
7dce1695a261c964d34ef85df87cf4","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"fce37140468f8914411eed0b25a882e60e1b54bcffcd33d6263a91b57d04f6c1","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"518ef78da0d81fe74cec30be411145d763fdfd249de4d108602fd099578=
1f590","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"76cba0a3f9456a968d2ae6ea587162b2ff04278dc5250cb1=
76395c936579771b","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"af35=
90c392bd06394cb307ccb993e66f53de7e2a0211c689dbb1845220475445","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"88ce2c4105c07c12=
62495e0ff1bd53f3ceec99adba9c20c612439838b4dbfdd6","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"10067cde5706e1173aa8e0a3a364cf44fe5b7a9f8b71=
cb086c653be71af00564","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
29fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/=
linux_like/linux/musl/b32/mips/mod.rs":"b9e9ff42363ebbb884ddf6445129ec41644=
71df45846874fc08f5f458e659254","src/unix/linux_like/linux/musl/b32/mod.rs":=
"8ede3985e6243882814ce91e8ce543e7edbafc0cee5932816072b6f14207a671","src/uni=
x/linux_like/linux/musl/b32/powerpc.rs":"4592dc5f1f2fe888dfef85fa862d42d168=
e73a2c6f4fc052b58287d0f4d4ffcd","src/unix/linux_like/linux/musl/b32/x86/ali=
gn.rs":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","=
src/unix/linux_like/linux/musl/b32/x86/mod.rs":"a19a8decfab185af3cebd34aae4=
b15082e7552be573904b8c1a3f0c0e493ef34","src/unix/linux_like/linux/musl/b64/=
aarch64/align.rs":"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b6=
38ae2928","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"a73035c6d9b7=
76f13b839008e15c04c2c53455571efd06664affcb047e457112","src/unix/linux_like/=
linux/musl/b64/mips64.rs":"2744895451f3a777fbe54f7f2695be53310b965fd62084c9=
b7e9121c7fe28346","src/unix/linux_like/linux/musl/b64/mod.rs":"d18abc0aeba2=
e26342bf3416a4dba0836db2bb0ee013b0a39629475cf8640289","src/unix/linux_like/=
linux/musl/b64/powerpc64.rs":"e5a55525b42493923956d668f978fb45e22d51deea00c=
e5edbfddf76ff19c741","src/unix/linux_like/linux/musl/b64/s390x.rs":"03dfec6=
794d93cb31a7c52b2d53a0973755168f91f8fa437cc5dbd54882c8ee7","src/unix/linux_=
like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/musl/b64/x86_64/mod=
.rs":"0dd168f5a6881f32e5239fb312b23cf137b800d0ff323286a92c8a2c382b5456","sr=
c/unix/linux_like/linux/musl/mod.rs":"55ccd71342276ccb4c441a4bc2772aebfd163=
af299669b658c6c8c6add331ec3","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"1e3bf809508b5872949136859bf48ddf58b7d24ae=
9f0b663e79f0efd1aaeb6a6","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"fa4102d9a596d90de604ce2962b0e64f184dfbf10552a4c3ecf28f=
12d4704379","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a2877679fef0f14f54a89ccbc41fb02f0c25bf6e536f=
9eb2cb2fa437e1d3f739","src/unix/linux_like/linux/uclibc/mod.rs":"82d504d3aa=
12cb0f7933980f81c4708fa6e070d4c57efdf407f2de05b71bc06d","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024e=
ba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"66e8f5b7509a6e638b8b904906f89badbab0da=
8fb5b602d07ebd88649c4b961a","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"ffce98bdd208fd9d335c65feafbf0d9742bea67c7eec1ee48=
657f292132ec3f0","src/unix/mod.rs":"b72f18e053cca0ade0f0606f1848a773fcf1885=
c72cbb31889275e8195f060bd","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"d7271c13=
748be08305d36f9af6f41f6950a7a1d6d4382149194a35d5fe2090de","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"cc479=
4afa4fbed9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"7d8f47fd37880715b449723688aaee56878=
5325a46f1c360a05bdca13252278e","src/unix/solarish/mod.rs":"ea9dd1c1d6892740=
8342762ee8998a9628838974c91089f620c867910c29adba","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/unix/solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b5374df70241d9b7=
2d45a069611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6=
737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4=
abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"aea=
3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6","src/vxworks=
/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788=
e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dc=
e7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d=
1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad62=
8a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"44ce561=
83380d18aedea9b7bec2edc5819e8529302c913bfe5d01f760155b82a","src/windows/gnu=
/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb3179464=
7","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef3=
0571b4f4e38375767a","src/windows/mod.rs":"1cd9223293255b994814487e28d9979fb=
8ebef4538a236c1aa47fdc166a149cc","src/windows/msvc/mod.rs":"c068271e00fca6b=
62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const_fn.rs":"cb7=
5a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"=
fbe5e23404da5b4f555ef85ebed98fb4083e55a00c317800bc2a50ede9f3d219"}
+\ No newline at end of file
++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"d6f6253f05d207b6c676e5647b31ad0ca3f05da=
3ac05db47f81d4ebd901ba22f","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"a71b92db5077b33af=
4ee6f1de33574ac33c2b292840eddbe3f7cce37f1fb16b9","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"e92c56b42f1bd1b=
9e66be2a9b73aca6ba29024b9bd17c16f327dfbe8831e3f86","src/macros.rs":"c1a299d=
5327ba033f079388f8ac8a44848f9aeff6a72e9be6dfa70f4769cc619","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"8cdae0cc37c43dabd4253a534e700bec6b6a57293c0c8e36c9ce16675=
d16799a","src/solid/arm.rs":"852b58a0837fde089cb9b5af131bf653daeb8c726f7540=
032756db8b7d4f8149","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
52d40885a0024fbe43676fe54d14b","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"f0c321=
265dd7671f16106b84951ac7dd77ed2e65c6623cbf2d29e76531984770","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"96f101bdab46a9f0a5249a8143d4a9def055284a0c2bd62bce15532a5bed428c"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"6ea4129eb5d6da5c09f8cf3692b5e7716f058b48d1e8c61115691709eda7ce51",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"bf0a994e2079b8aad9da5efd3a3b9a7194a53ae60887a25c57964fb6=
8499e847","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"295b3e3b67394f731d4e88d169e3d3d1d80026b9989=
8745cd0d1d163f085ff61","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"98f6af2021b434f9c3197094312b457774381220f31a22c3b15b1fe8a6=
0cb365","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/mod.rs":"6b825079ffe3f9aec6e78ea6b50acedcb91a4e1312d721105b7f=
8b1555f254df","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e=
6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdli=
ke/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aa=
e23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c9=
3cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f=
096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"c3a011=
1252e201c172b99e7d9cbee4cf088d3dd47995110e819f04276bccd198","src/unix/bsd/f=
reebsdlike/mod.rs":"98d322b22050a80636841287d9ed12549a2004a9dbe151763e5b127=
0f5e73ea3","src/unix/bsd/mod.rs":"2fed08973739d7f6a7412b204724af64b1a915c71=
2689c250cf9a08263ba05ff","src/unix/bsd/netbsdlike/mod.rs":"4e9da54e541773c7=
ad4cca9dade1df00f28f2fdac3f8df5957f4c74b7e082344","src/unix/bsd/netbsdlike/=
netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc877353449=
d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3=
bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/=
mod.rs":"f6de6981382af87518e4a5b6d26c2ea551ed74640dd7166107a824af30ced243",=
"src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa6=
69df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64=
.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","sr=
c/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa90=
9cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"1a=
fe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","src/unix/b=
sd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b1=
2c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/mod.rs":"47aaab2=
bd8238e937112ff17e8262945c8e5865d5e696f218b11c1da59830808","src/unix/bsd/ne=
tbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424=
ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a=
2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdl=
ike/openbsd/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448=
fe2cf7675a4e1","src/unix/haiku/b32.rs":"69ae47fc52c6880e85416b4744500d5655c=
9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"73e64db09275a8da8d5=
0a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix/haiku/mod.rs":"80a=
6cfb58acbbc471dbd412dd76a41f372befc8f217fb1671ed4ce8d391dced0","src/unix/ha=
iku/native.rs":"44855f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017=
c8be6","src/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e169=
36a1a35d9a52789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
63d0083d0f368ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"85=
9814f5df89e28fd4b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/h=
ermit/x86_64.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539=
bfa110c","src/unix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c5=
8055dde0c4ceea5e00150063b24ddc60768332a4","src/unix/linux_like/android/b32/=
mod.rs":"d971b98530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715",=
"src/unix/linux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3=
374615dc3a4bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86=
/mod.rs":"8388bd3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89"=
,"src/unix/linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf688404=
82bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b6=
4/aarch64/mod.rs":"8fe667d2b14abc5ac8aad32e16c3da24350471d8156eaea9ab4989f7=
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde=
3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"07cebaa8d953446b8df5cb7c5de3932ae85b04d9e9993e3a3a126ff8f15111=
a4","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"b71d37106750f57bc2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"1618634d37348032f5ce1dc9df1aaa1f1681bca4=
a275f23d41f42098c4d3b423","src/unix/linux_like/linux/arch/mips/mod.rs":"dac=
02cd01dbd3b222286887c64d398c031afc08d38850c2b3ce2fe7158d888e0","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"e7139d3bfb291a283c767e6201eac8bbb58c91839a3=
6fa56bfe500fcb3aa754a","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"5e40c=
273b767c369a46c3315c7cfde97379944ed63c74735e98d4dae2c49d414","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"20b4c897fb3f63e31a04849b348ec8e6e6405ce9463048d411114f8c9dbabd8a","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"ee5145a383386b716605a8d1ff3df21=
2d418aae1aa1f37d2307d4f9cd1a08e99","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"a2c4ae8f31a74e4843b8ff=
4b6507419f403b52713169fcee9b1b24eb2324162a","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"525ee4917b54790ce=
fc1298ec1015cea6332d818d9c7475434e94d06afdd59c0","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"d179cbb462c451ff8805029b2b922c4bf90e35f667e80d716d5064f563aebc52"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"7d456da436017cb388b65b2c4b626c83b489cbb19a591673b9c627=
a608d53cfc","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"5b982c41097f4f91adcb0968290afeccb2=
7dce1695a261c964d34ef85df87cf4","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"fce37140468f8914411eed0b25a882e60e1b54bcffcd33d6263a91b57d04f6c1","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"518ef78da0d81fe74cec30be411145d763fdfd249de4d108602fd099578=
1f590","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"76cba0a3f9456a968d2ae6ea587162b2ff04278dc5250cb1=
76395c936579771b","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"af35=
90c392bd06394cb307ccb993e66f53de7e2a0211c689dbb1845220475445","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"88ce2c4105c07c12=
62495e0ff1bd53f3ceec99adba9c20c612439838b4dbfdd6","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"10067cde5706e1173aa8e0a3a364cf44fe5b7a9f8b71=
cb086c653be71af00564","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
29fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/=
linux_like/linux/musl/b32/mips/mod.rs":"b9e9ff42363ebbb884ddf6445129ec41644=
71df45846874fc08f5f458e659254","src/unix/linux_like/linux/musl/b32/mod.rs":=
"8ede3985e6243882814ce91e8ce543e7edbafc0cee5932816072b6f14207a671","src/uni=
x/linux_like/linux/musl/b32/powerpc.rs":"4592dc5f1f2fe888dfef85fa862d42d168=
e73a2c6f4fc052b58287d0f4d4ffcd","src/unix/linux_like/linux/musl/b32/x86/ali=
gn.rs":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","=
src/unix/linux_like/linux/musl/b32/x86/mod.rs":"a19a8decfab185af3cebd34aae4=
b15082e7552be573904b8c1a3f0c0e493ef34","src/unix/linux_like/linux/musl/b64/=
aarch64/align.rs":"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b6=
38ae2928","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"a73035c6d9b7=
76f13b839008e15c04c2c53455571efd06664affcb047e457112","src/unix/linux_like/=
linux/musl/b64/mips64.rs":"2744895451f3a777fbe54f7f2695be53310b965fd62084c9=
b7e9121c7fe28346","src/unix/linux_like/linux/musl/b64/mod.rs":"d18abc0aeba2=
e26342bf3416a4dba0836db2bb0ee013b0a39629475cf8640289","src/unix/linux_like/=
linux/musl/b64/powerpc64.rs":"e5a55525b42493923956d668f978fb45e22d51deea00c=
e5edbfddf76ff19c741","src/unix/linux_like/linux/musl/b64/s390x.rs":"03dfec6=
794d93cb31a7c52b2d53a0973755168f91f8fa437cc5dbd54882c8ee7","src/unix/linux_=
like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/musl/b64/x86_64/mod=
.rs":"0dd168f5a6881f32e5239fb312b23cf137b800d0ff323286a92c8a2c382b5456","sr=
c/unix/linux_like/linux/musl/mod.rs":"55ccd71342276ccb4c441a4bc2772aebfd163=
af299669b658c6c8c6add331ec3","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"1e3bf809508b5872949136859bf48ddf58b7d24ae=
9f0b663e79f0efd1aaeb6a6","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"fa4102d9a596d90de604ce2962b0e64f184dfbf10552a4c3ecf28f=
12d4704379","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a2877679fef0f14f54a89ccbc41fb02f0c25bf6e536f=
9eb2cb2fa437e1d3f739","src/unix/linux_like/linux/uclibc/mod.rs":"82d504d3aa=
12cb0f7933980f81c4708fa6e070d4c57efdf407f2de05b71bc06d","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024e=
ba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"66e8f5b7509a6e638b8b904906f89badbab0da=
8fb5b602d07ebd88649c4b961a","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"ffce98bdd208fd9d335c65feafbf0d9742bea67c7eec1ee48=
657f292132ec3f0","src/unix/mod.rs":"b72f18e053cca0ade0f0606f1848a773fcf1885=
c72cbb31889275e8195f060bd","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"d7271c13=
748be08305d36f9af6f41f6950a7a1d6d4382149194a35d5fe2090de","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"cc479=
4afa4fbed9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"7d8f47fd37880715b449723688aaee56878=
5325a46f1c360a05bdca13252278e","src/unix/solarish/mod.rs":"ea9dd1c1d6892740=
8342762ee8998a9628838974c91089f620c867910c29adba","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/unix/solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b5374df70241d9b7=
2d45a069611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6=
737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4=
abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"aea=
3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6","src/vxworks=
/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788=
e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dc=
e7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d=
1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad62=
8a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"44ce561=
83380d18aedea9b7bec2edc5819e8529302c913bfe5d01f760155b82a","src/windows/gnu=
/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb3179464=
7","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef3=
0571b4f4e38375767a","src/windows/mod.rs":"1cd9223293255b994814487e28d9979fb=
8ebef4538a236c1aa47fdc166a149cc","src/windows/msvc/mod.rs":"c068271e00fca6b=
62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const_fn.rs":"cb7=
5a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"=
fbe5e23404da5b4f555ef85ebed98fb4083e55a00c317800bc2a50ede9f3d219"}
+--=20
+2.20.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for=
-modified-files-for-rust.patch b/meta/recipes-devtools/rust/libstd-rs/0008-=
Update-checksums-for-modified-files-for-rust.patch
deleted file mode 100644
index 2a5f3e3422..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modifi=
ed-files-for-rust.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 9bed5cee7388931fc706c2a1e6b8e3285d6807a4 Mon Sep 17 00:00:00 2001
-From: Ralf Anton Beier <ralf_beier@me.com>
-Date: Sun, 8 Aug 2021 11:19:24 +0200
-Subject: [PATCH] Update checksums for modified files for rust
-
-Upstream-Status: Inappropriate [previous patches need to be upstreamed]
-Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
----
- vendor/libc/.cargo-checksum.json | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vendor/libc/.cargo-checksum.json b/vendor/libc/.cargo-checksu=
m.json
-index 38ea3c65d..e373c3cb2 100644
---- a/vendor/libc/.cargo-checksum.json
-+++ b/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"aad61c58f04e78be520769d8927ab4c121a6536=
f532b159be1b706550fcd0234","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"e0ebe1040b8ff87c52d581f9623=
4291a6380ebe3af3088c4f6ff748fbd7d2a7a","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"1466715589ed18b66789d60904e8=
258b20d7783a6f3bf72f775617bc0d9373d8","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"2a215bd6136b8617aacedf9be738ccee94da9d29b418e9a78101d6291c182352"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"08215=
43bf2073cb3dc46157e47140caa30704e062b23099d52bf80cb56e25321","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc=
80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/freebsd1=
3/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"21416cad3e76f53d10d0=
c73840469290aa80c2d92c773307a1ca92485d3c0e13","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3=
daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"0ee5530ddde569=
0cdc6f91acca86ce74c37ec06886418c34b201c154fd2c9e41","src/unix/bsd/freebsdli=
ke/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da58=
20492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87e=
ac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebs=
dlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05=
a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88=
fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/free=
bsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99e7d9cbee4cf088d3dd4799=
5110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.rs":"77763a8dfe2d31c78=
ee7c3e64001ceee6d4ba34cc77b7fd4fdde153e5abbbeb8","src/unix/bsd/mod.rs":"2fe=
d08973739d7f6a7412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bs=
d/netbsdlike/mod.rs":"4e9da54e541773c7ad4cca9dade1df00f28f2fdac3f8df5957f4c=
74b7e082344","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028=
401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/n=
etbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a92=
4452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"96edbcf448b89c991c9254c19423=
2322dce69fb8050bab9f9741f5aecb2104ea","src/unix/bsd/netbsdlike/netbsd/power=
pc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","=
src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960=
613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":=
"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/uni=
x/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6=
db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd=
91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/b=
sd/netbsdlike/openbsd/mod.rs":"9a9878e70ee8765d95cb1b010e39d74004278ca6da58=
fb82354f69752a84c926","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd28=
7afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/ne=
tbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569=
e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289=
c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs=
":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/u=
nix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337f=
c995900b","src/unix/haiku/mod.rs":"912969bc1d59a6cec74de3140982b7f0b69e74d4=
4936646587f1c8820be7c0fe","src/unix/haiku/native.rs":"44855f52906f607de137f=
c4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/haiku/x86_64.rs":"3e=
c3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/h=
ermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe08=
777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed4=
13841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49=
ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android=
/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e00150063b24ddc6076833=
2a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a96f5892f98e1edc31=
33cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like/android/b32/x86/=
align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab=
","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc=
95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aar=
ch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca=
35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"8fe667d2b14abc5ac8=
aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/unix/linux_like/androi=
d/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5c=
ce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d2121587=
8c95fe07c19","src/unix/linux_like/android/mod.rs":"8688204b3236db28b66ff0f1=
de5320f47ec5c1ef5395dddcc9df025a8d78630a","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"6ef97140ca6fb24125fdd0aacb986ef78=
5aa21993229660d7f703f8875ebfe49","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7=
fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff=
1fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c0=
0e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88=
cf581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded70=
8124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed00=
9dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5=
c049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"=
429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix=
/linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac=
9118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"=
794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4b401478fcd9","src/unix=
/linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2=
bfcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mo=
d.rs":"ee5145a383386b716605a8d1ff3df212d418aae1aa1f37d2307d4f9cd1a08e99","s=
rc/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf=
733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32=
/sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eead=
afb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a=
81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/=
gnu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc=
2f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b16=
08fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a85780=
11cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.=
rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src=
/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef=
2633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/m=
ips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c99=
51e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e8=
648948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linu=
x/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13e163fdadaefd108bd=
8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868b=
becfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_li=
ke/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a=
2d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.r=
s":"5b982c41097f4f91adcb0968290afeccb27dce1695a261c964d34ef85df87cf4","src/=
unix/linux_like/linux/gnu/b64/s390x.rs":"a9484dfd3c7ca1174537957bef997c3ba7=
ea41989cdf61ede22b1bbc45a667bf","src/unix/linux_like/linux/gnu/b64/sparc64/=
align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9=
","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c24=
6e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu=
/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21=
696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c9=
2f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_lik=
e/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b540=
4995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs=
":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/u=
nix/linux_like/linux/gnu/mod.rs":"a040250bc2b4b2831ae2cad6f1abf3dc73e6015c4=
f570abf21350e220e898338","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/mod.rs":"8f282fe98fe7fcdae158aad41b2a9e6130c130c7a041fe1391935=
7bf7b548057","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10=
43764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like=
/linux/musl/b32/arm/mod.rs":"6255abe2ee04986832d12b7b2190589580f2a43e9bfb28=
5b32b5747227f62727","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a88117=
91809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux=
_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs=
":"b9e9ff42363ebbb884ddf6445129ec4164471df45846874fc08f5f458e659254","src/u=
nix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edba=
fc0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.r=
s":"4592dc5f1f2fe888dfef85fa862d42d168e73a2c6f4fc052b58287d0f4d4ffcd","src/=
unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433b=
ece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs":"a19a8decfab185af3cebd34aae4b15082e7552be573904b8c1a3f0c0e493ef34=
","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce23539=
4f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/=
musl/b64/aarch64/mod.rs":"a73035c6d9b776f13b839008e15c04c2c53455571efd06664=
affcb047e457112","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451=
f3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_lik=
e/linux/musl/b64/mod.rs":"d18abc0aeba2e26342bf3416a4dba0836db2bb0ee013b0a39=
629475cf8640289","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a5552=
5b42493923956d668f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8f=
a437cc5dbd54882c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf=
137b800d0ff323286a92c8a2c382b5456","src/unix/linux_like/linux/musl/mod.rs":=
"55ccd71342276ccb4c441a4bc2772aebfd163af299669b658c6c8c6add331ec3","src/uni=
x/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac5333016268=
3d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed161=
38d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux=
_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec=
7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"1e3=
bf809508b5872949136859bf48ddf58b7d24ae9f0b663e79f0efd1aaeb6a6","src/unix/li=
nux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb=
632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips3=
2/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"fa4102d9a596d90d=
e604ce2962b0e64f184dfbf10552a4c3ecf28f12d4704379","src/unix/linux_like/linu=
x/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b9=
6b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/ali=
gn.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","=
src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c=
55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucl=
ibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2a=
d4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a28776=
79fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2fa437e1d3f739","src/unix/linux=
_like/linux/uclibc/mod.rs":"82d504d3aa12cb0f7933980f81c4708fa6e070d4c57efdf=
407f2de05b71bc06d","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370=
46524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_l=
ike/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c=
1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"=
02e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix=
/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31=
b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"0a97d43fdce=
7f9bd57a0b47d770867f4e234eba602adc9ef993ed02a182276f2","src/unix/mod.rs":"6=
b2b57833e37cd3231944696c8216eb587a2a68069346150cf321153eaf04d03","src/unix/=
newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b31=
09639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf6=
5f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd=
7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/esp=
idf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3110394ed5a=
3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a7a1d6d4382=
149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4=
d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs"=
:"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/un=
ix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22d=
e78e53","src/unix/redox/mod.rs":"267a413e63dbdcaed6e758f9a5c10bd00178ed76c7=
b3527e8e984341f617d3a5","src/unix/solarish/compat.rs":"b07a5bfac925eb012003=
a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs=
":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca13252278e","src/u=
nix/solarish/mod.rs":"080e0cf03b50874ba9d5082b314eabb0d253532dc4b13d8af095a=
0c78e0fba84","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfe=
c80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs":"9d761573=
bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vxworks/aarc=
h64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99",=
"src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15=
ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d=
98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0=
afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/=
x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba",=
"src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b90=
0a7f98ed6b514a","src/wasi.rs":"2c945bce3ddd26bf20ff03fb4192c9c3f625f1308a47=
9c5cb4bd4510a892629a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80=
c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb=
7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.=
rs":"1cd9223293255b994814487e28d9979fb8ebef4538a236c1aa47fdc166a149cc","src=
/windows/msvc/mod.rs":"860dc98245039bc3aa5782ef2b5798d009ea6655bd27a63f244b=
e2206d2cb47f","src/windows/msvc/x86_64.rs":"25d35a5ba8e19569a5bed573dcf8c82=
f7ce53da7c91941f9ceda6fe86cab1088","tests/const_fn.rs":"cb75a1f0864f926aebe=
79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"dd8f7255a17a6273=
54f321ef0055d63b898c6fb27eff628af4d1b66b7331edf6"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"aad61c58f04e78be520769d8927ab4c121a6536=
f532b159be1b706550fcd0234","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"e0ebe1040b8ff87c52d581f9623=
4291a6380ebe3af3088c4f6ff748fbd7d2a7a","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"1466715589ed18b66789d60904e8=
258b20d7783a6f3bf72f775617bc0d9373d8","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"2a215bd6136b8617aacedf9be738ccee94da9d29b418e9a78101d6291c182352"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"08215=
43bf2073cb3dc46157e47140caa30704e062b23099d52bf80cb56e25321","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc=
80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/freebsd1=
3/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"21416cad3e76f53d10d0=
c73840469290aa80c2d92c773307a1ca92485d3c0e13","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3=
daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"0ee5530ddde569=
0cdc6f91acca86ce74c37ec06886418c34b201c154fd2c9e41","src/unix/bsd/freebsdli=
ke/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da58=
20492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87e=
ac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebs=
dlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05=
a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88=
fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/free=
bsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99e7d9cbee4cf088d3dd4799=
5110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.rs":"77763a8dfe2d31c78=
ee7c3e64001ceee6d4ba34cc77b7fd4fdde153e5abbbeb8","src/unix/bsd/mod.rs":"2fe=
d08973739d7f6a7412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bs=
d/netbsdlike/mod.rs":"4e9da54e541773c7ad4cca9dade1df00f28f2fdac3f8df5957f4c=
74b7e082344","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028=
401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/n=
etbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a92=
4452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"96edbcf448b89c991c9254c19423=
2322dce69fb8050bab9f9741f5aecb2104ea","src/unix/bsd/netbsdlike/netbsd/power=
pc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","=
src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960=
613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":=
"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/uni=
x/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6=
db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd=
91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/b=
sd/netbsdlike/openbsd/mod.rs":"9a9878e70ee8765d95cb1b010e39d74004278ca6da58=
fb82354f69752a84c926","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd28=
7afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/ne=
tbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569=
e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289=
c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs=
":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/u=
nix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337f=
c995900b","src/unix/haiku/mod.rs":"912969bc1d59a6cec74de3140982b7f0b69e74d4=
4936646587f1c8820be7c0fe","src/unix/haiku/native.rs":"44855f52906f607de137f=
c4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/haiku/x86_64.rs":"3e=
c3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/h=
ermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe08=
777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed4=
13841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49=
ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android=
/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e00150063b24ddc6076833=
2a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a96f5892f98e1edc31=
33cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like/android/b32/x86/=
align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab=
","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc=
95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aar=
ch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca=
35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"8fe667d2b14abc5ac8=
aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/unix/linux_like/androi=
d/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5c=
ce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d2121587=
8c95fe07c19","src/unix/linux_like/android/mod.rs":"8688204b3236db28b66ff0f1=
de5320f47ec5c1ef5395dddcc9df025a8d78630a","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"6ef97140ca6fb24125fdd0aacb986ef78=
5aa21993229660d7f703f8875ebfe49","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7=
fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff=
1fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c0=
0e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88=
cf581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded70=
8124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed00=
9dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5=
c049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"=
429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix=
/linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac=
9118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"=
794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4b401478fcd9","src/unix=
/linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2=
bfcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mo=
d.rs":"ee5145a383386b716605a8d1ff3df212d418aae1aa1f37d2307d4f9cd1a08e99","s=
rc/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf=
733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32=
/sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eead=
afb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a=
81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/=
gnu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc=
2f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b16=
08fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a85780=
11cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.=
rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src=
/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef=
2633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/m=
ips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c99=
51e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e8=
648948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linu=
x/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13e163fdadaefd108bd=
8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868b=
becfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_li=
ke/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a=
2d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.r=
s":"5b982c41097f4f91adcb0968290afeccb27dce1695a261c964d34ef85df87cf4","src/=
unix/linux_like/linux/gnu/b64/s390x.rs":"a9484dfd3c7ca1174537957bef997c3ba7=
ea41989cdf61ede22b1bbc45a667bf","src/unix/linux_like/linux/gnu/b64/sparc64/=
align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9=
","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c24=
6e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu=
/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21=
696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c9=
2f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_lik=
e/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b540=
4995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs=
":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/u=
nix/linux_like/linux/gnu/mod.rs":"a040250bc2b4b2831ae2cad6f1abf3dc73e6015c4=
f570abf21350e220e898338","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/mod.rs":"8f282fe98fe7fcdae158aad41b2a9e6130c130c7a041fe1391935=
7bf7b548057","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10=
43764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like=
/linux/musl/b32/arm/mod.rs":"6255abe2ee04986832d12b7b2190589580f2a43e9bfb28=
5b32b5747227f62727","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a88117=
91809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux=
_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs=
":"b9e9ff42363ebbb884ddf6445129ec4164471df45846874fc08f5f458e659254","src/u=
nix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edba=
fc0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.r=
s":"4592dc5f1f2fe888dfef85fa862d42d168e73a2c6f4fc052b58287d0f4d4ffcd","src/=
unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433b=
ece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs":"a19a8decfab185af3cebd34aae4b15082e7552be573904b8c1a3f0c0e493ef34=
","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce23539=
4f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/=
musl/b64/aarch64/mod.rs":"a73035c6d9b776f13b839008e15c04c2c53455571efd06664=
affcb047e457112","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451=
f3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_lik=
e/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938cdccf40d985dafc11e90f=
235947735a09bac","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a5552=
5b42493923956d668f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8f=
a437cc5dbd54882c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf=
137b800d0ff323286a92c8a2c382b5456","src/unix/linux_like/linux/musl/mod.rs":=
"ac08dd0891304a0e6f478a38bffa4fe8e6b27ad79094b2f7139c7a95082c3a18","src/uni=
x/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac5333016268=
3d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed161=
38d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux=
_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec=
7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"1e3=
bf809508b5872949136859bf48ddf58b7d24ae9f0b663e79f0efd1aaeb6a6","src/unix/li=
nux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb=
632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips3=
2/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"fa4102d9a596d90d=
e604ce2962b0e64f184dfbf10552a4c3ecf28f12d4704379","src/unix/linux_like/linu=
x/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b9=
6b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/ali=
gn.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","=
src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c=
55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucl=
ibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2a=
d4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a28776=
79fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2fa437e1d3f739","src/unix/linux=
_like/linux/uclibc/mod.rs":"82d504d3aa12cb0f7933980f81c4708fa6e070d4c57efdf=
407f2de05b71bc06d","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370=
46524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_l=
ike/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c=
1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"=
02e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix=
/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31=
b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"0a97d43fdce=
7f9bd57a0b47d770867f4e234eba602adc9ef993ed02a182276f2","src/unix/mod.rs":"6=
b2b57833e37cd3231944696c8216eb587a2a68069346150cf321153eaf04d03","src/unix/=
newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b31=
09639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf6=
5f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd=
7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/esp=
idf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3110394ed5a=
3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a7a1d6d4382=
149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4=
d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs"=
:"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/un=
ix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22d=
e78e53","src/unix/redox/mod.rs":"267a413e63dbdcaed6e758f9a5c10bd00178ed76c7=
b3527e8e984341f617d3a5","src/unix/solarish/compat.rs":"b07a5bfac925eb012003=
a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs=
":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca13252278e","src/u=
nix/solarish/mod.rs":"080e0cf03b50874ba9d5082b314eabb0d253532dc4b13d8af095a=
0c78e0fba84","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfe=
c80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs":"9d761573=
bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vxworks/aarc=
h64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99",=
"src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15=
ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d=
98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0=
afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/=
x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba",=
"src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b90=
0a7f98ed6b514a","src/wasi.rs":"2c945bce3ddd26bf20ff03fb4192c9c3f625f1308a47=
9c5cb4bd4510a892629a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80=
c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb=
7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.=
rs":"1cd9223293255b994814487e28d9979fb8ebef4538a236c1aa47fdc166a149cc","src=
/windows/msvc/mod.rs":"860dc98245039bc3aa5782ef2b5798d009ea6655bd27a63f244b=
e2206d2cb47f","src/windows/msvc/x86_64.rs":"25d35a5ba8e19569a5bed573dcf8c82=
f7ce53da7c91941f9ceda6fe86cab1088","tests/const_fn.rs":"cb75a1f0864f926aebe=
79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"dd8f7255a17a6273=
54f321ef0055d63b898c6fb27eff628af4d1b66b7331edf6"}
---=20
-2.20.1
-
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.57.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.57.0.bb
deleted file mode 100644
index e50665e1b7..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs_1.57.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require rust-source.inc
-require libstd-rs.inc
-
-SRC_URI +=3D " \
-    file://0005-Add-base-definitions-for-riscv64-musl-libc.patch;patchdir=
=3D../../ \
-    file://0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch;patch=
dir=3D../../ \
-    file://0007-FIXUP-Correct-definitions-to-match-musl.patch;patchdir=3D.=
./../ \
-    file://0008-Update-checksums-for-modified-files-for-rust.patch;patchdi=
r=3D../../ \
-"
-# libstd moved from src/libstd to library/std in 1.47+
-S =3D "${RUSTSRC}/library/std"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.58.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.58.0.bb
new file mode 100644
index 0000000000..141fea1454
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.58.0.bb
@@ -0,0 +1,12 @@
+require rust-source.inc
+require libstd-rs.inc
+
+SRC_URI +=3D " \
+    file://0001-Add-base-definitions-for-riscv64-musl.patch;patchdir=3D../=
../ \
+    file://0002-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch;patch=
dir=3D../../ \
+    file://0003-FIXUP-Correct-definitions-to-match-musl.patch;patchdir=3D.=
./../ \
+    file://0004-Update-checksums-for-modified-files-for-rust.patch;patchdi=
r=3D../../ \
+    "
+
+# libstd moved from src/libstd to library/std in 1.47+
+S =3D "${RUSTSRC}/library/std"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.57.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.57.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.58.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.57.0.bb b/meta/recipes=
-devtools/rust/rust-cross_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.57.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.58.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.57.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.57.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.58.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 3418a2e0ba..74b558262f 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -2,17 +2,17 @@
 ## snapshot info is taken from rust/src/stage0.txt
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.56.1"
-CARGO_VERSION =3D "1.56.1"
+RS_VERSION =3D "1.57.0"
+CARGO_VERSION =3D "1.57.0"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "b01011cbb5503c456ecc6a557=
a38e099994b8497df545c661ce8fd48c5beadc6"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a7001d1218b62d377cab15522d1b=
1c376b073c05f7d0ff32cf278871a5eeda3d"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "dfed65a50e2b58b6807c1fb6f8af=
a7abd5c3b22c682d505721d615823687c708"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "ccdc72d06c90841b7227ec363=
0337881eeda3da5fbe87328d2e9d705f6f8016c"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "c42f40c5279a3a9d539cae93dbca=
b9d333777ad9a60a5b9f1086b874ef63db86"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "ed2013713ae742895af5df8d91c5=
430ba9ba3c781e3bc7f3471b220cc06d565d"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "a83416d15354e4dfa1c1e4a7=
56282c6be7169679f2b04eca82ed34e2116b93f0"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "77aec6a8c5f3d33941c79a48cda=
3bb08878c23dd1947dc027dfe5c4da41305b3"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "3d263eb1871b5d6ca4b198b9611=
925923e9353e1f5c2becf8c7b784298e88743"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "3618da916a0f92f241cf1d67=
d04bb57835b303cf2047b57dc2f2487b89a4fc1f"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "f26811e48d03c56c125de03d389=
e1ae7c6df36990953c1670c6a5676bc12d4cb"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "6d11cd94618d80cda273eeeae72=
85980445f61a49ebacc616777b482a41cbf3f"
=20
 SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index dbbfa14913..63ba02b299 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
-SRC_URI[rust.sha256sum] =3D "fad07ea1daf9c6195c32e6e9c43ece4565c5f2f1de3c3=
771574790d6abbc9704"
+SRC_URI[rust.sha256sum] =3D "37dce222b82a438e550ccd5e45ca9bad1c57aa7acc7ad=
fec6a897c4ff94b6485"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.57.0.bb=
 b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.57.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.58.0.bb
diff --git a/meta/recipes-devtools/rust/rust_1.57.0.bb b/meta/recipes-devto=
ols/rust/rust_1.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.57.0.bb
rename to meta/recipes-devtools/rust/rust_1.58.0.bb
--=20
2.20.1


