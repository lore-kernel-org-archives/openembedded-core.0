Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3185FC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 06:52:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.3731.1634971930267626664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 23:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fc6Iq2ZH;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id g5so4276016plg.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gebXiYNFLqe2uMrA9h5cOU07oWCtsT7nFHxiCxI1QAU=;
        b=Fc6Iq2ZHc9sjm/+s/86/cd6fcuXaJbe0TPNnqFJcvqM5wm3VoF72gKlw15gAjT2FG9
         YMhpElJceAdY+1K+qdoBNP9VeelC9S/4sA/xUCKRetnPgeBeP+Ck1LR22XETJNl2aLbu
         fGSFuxuXM5WfxnPBJgRTcd+AoM02WzRqfOh5CKXlbQFQCnQpfkrLQ+iThELHPczQKMah
         Y8s1WtD81XofyODdH70AnXmq/DLqCkiPknRsU9/BuCsVGtkK6VIVbUQTpKUh2KL+Lzef
         wW2upEX6+BrldA8bsS1wAURW8S4NhUwWobnZGi4R0LyPcR34/JCn8juASyDn07KxZymH
         zTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gebXiYNFLqe2uMrA9h5cOU07oWCtsT7nFHxiCxI1QAU=;
        b=yGzK7yrOlSXeEfj8TvgN/yXUiixKeo1c3rXFpdyXojYgjNZBVvIYth5aLmS5NfGmbK
         laa8G1Y+l3+3CuxgIvk5wWgeO7AQnn/UmhznR5r75usg11JAvlqRwUYD6stpOI5Sdkgl
         o9ZielGgGSN6fON1CNAYJVzmd34qHhYykeggJ7fmEfdYmqetjWcjxO9RbNfcMVvzZp7Q
         a+RgBqGQlo2wGnhW/oKfLIa9R7oz0ua5UdVdhSKEzqkOckxik50ljKm5E7WxVOKG988d
         n0C/sGI2trW/VHXPomZlGvt2YPLKHmRHprkyHL7wLstLOWBSorN+glz/MPigOs7iqBL8
         Ld9Q==
X-Gm-Message-State: AOAM532YrVKk1Ye7AqQQXi6gqsLLopr0B+hjyoioFHpGbhDCo8h0LT5y
	Ir0XC8E5p5kYwv49f6qIPecnseSkdRjwAA==
X-Google-Smtp-Source: 
 ABdhPJwgx9xfxqC6Sh+AQwbCKaFr2l0dXLcrtco1viXTo+rP831BOU0nXHy9g7k9mZAfg9139//SIg==
X-Received: by 2002:a17:90b:3901:: with SMTP id
 ob1mr5103731pjb.24.1634971927770;
        Fri, 22 Oct 2021 23:52:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 gm14sm14958894pjb.40.2021.10.22.23.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 23:52:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [PATCH] rust: Upgrade to 1.56.0
Date: Fri, 22 Oct 2021 23:52:03 -0700
Message-Id: <20211023065203.1624178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 06:52:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157299

This is latest major release, changes are here [1]

Forward port libstd-rs patches and refresh musl/rv64 port

[1] https://github.com/rust-lang/rust/releases/tag/1.56.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...55.0.bb =3D> cargo-cross-canadian_1.56.0.bb} |  0
 .../{cargo_1.55.0.bb =3D> cargo_1.56.0.bb}      |  0
 ...e-definitions-for-riscv64-musl-libc.patch} | 93 +++++--------------
 ...-musl-mod.rs-add-riscv64-to-b64-set.patch} | 16 +---
 ...P-Correct-definitions-to-match-musl.patch} | 80 +++-------------
 ...-for-modified-files-for-rust-1.54.0-.patch | 23 -----
 ...hecksums-for-modified-files-for-rust.patch | 16 ++++
 .../recipes-devtools/rust/libstd-rs_1.55.0.bb | 11 ---
 .../recipes-devtools/rust/libstd-rs_1.56.0.bb | 11 +++
 ....55.0.bb =3D> rust-cross-canadian_1.56.0.bb} |  0
 ...t-cross_1.55.0.bb =3D> rust-cross_1.56.0.bb} |  0
 ...ust-llvm_1.55.0.bb =3D> rust-llvm_1.56.0.bb} |  2 +-
 meta/recipes-devtools/rust/rust-snapshot.inc  | 16 ++--
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 ...bb =3D> rust-tools-cross-canadian_1.56.0.bb} |  0
 .../rust/{rust_1.55.0.bb =3D> rust_1.56.0.bb}   |  0
 17 files changed, 79 insertions(+), 193 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.55.0.bb =3D> ca=
rgo-cross-canadian_1.56.0.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.55.0.bb =3D> cargo_1.56.0.bb} =
(100%)
 rename meta/recipes-devtools/rust/libstd-rs/{0005-Add-base-definitions-for=
-riscv64-musl-libc-0.2.93.patch =3D> 0005-Add-base-definitions-for-riscv64-=
musl-libc.patch} (91%)
 rename meta/recipes-devtools/rust/libstd-rs/{0006-FIXUP-linux-musl-mod.rs-=
add-riscv64-to-b64-set-libc-.patch =3D> 0006-FIXUP-linux-musl-mod.rs-add-ri=
scv64-to-b64-set.patch} (66%)
 rename meta/recipes-devtools/rust/libstd-rs/{0007-FIXUP-Correct-definition=
s-to-match-musl-libc-0.2.93.patch =3D> 0007-FIXUP-Correct-definitions-to-ma=
tch-musl.patch} (89%)
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs/0008-Update-checks=
ums-for-modified-files-for-rust-1.54.0-.patch
 create mode 100644 meta/recipes-devtools/rust/libstd-rs/0008-Update-checks=
ums-for-modified-files-for-rust.patch
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs_1.55.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.56.0.bb
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.55.0.bb =3D> rust=
-cross-canadian_1.56.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.55.0.bb =3D> rust-cross_1.=
56.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.55.0.bb =3D> rust-llvm_1.56=
.0.bb} (82%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.55.0.bb =3D=
> rust-tools-cross-canadian_1.56.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.55.0.bb =3D> rust_1.56.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 168bda2fd1..58f49800c4 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "12.0.1"
-RUSTVERSION ?=3D "1.55.0"
+RUSTVERSION ?=3D "1.56.0"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.55.0.bb b/m=
eta/recipes-devtools/cargo/cargo-cross-canadian_1.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.55.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.0.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.55.0.bb b/meta/recipes-dev=
tools/cargo/cargo_1.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.55.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.56.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions=
-for-riscv64-musl-libc-0.2.93.patch b/meta/recipes-devtools/rust/libstd-rs/=
0005-Add-base-definitions-for-riscv64-musl-libc.patch
similarity index 91%
rename from meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-=
for-riscv64-musl-libc-0.2.93.patch
rename to meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-fo=
r-riscv64-musl-libc.patch
index 7529c4ddd7..180e2b59ab 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-ri=
scv64-musl-libc-0.2.93.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-ri=
scv64-musl-libc.patch
@@ -1,7 +1,7 @@
 From 4e188d047dee33a19902113a3c90cdf1d8310a9e Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:05:06 +0200
-Subject: [PATCH 5/8] Add base definitions for riscv64 + musl - libc-0.2.93
+Subject: [PATCH 5/8] Add base definitions for riscv64 + musl
=20
 https://github.com/rust-lang/libc/pull/1994/commits/030a07761f61f3293d5375=
2e60edbd330a9d718d
=20
@@ -11,12 +11,10 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
  .../src/unix/linux_like/linux/musl/b64/mod.rs |   3 +
  .../linux_like/linux/musl/b64/riscv64/mod.rs  | 867 ++++++++++++++++++
  2 files changed, 870 insertions(+)
- create mode 100644 vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/=
riscv64/mod.rs
+ create mode 100644 vendor/libc-0.2.98/src/unix/linux_like/linux/musl/b64/=
riscv64/mod.rs
=20
-diff --git a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/mod.rs =
b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/mod.rs
-index cfcdaaecf..7261b95d2 100644
---- a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/mod.rs
-+++ b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/mod.rs
+--- a/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
 @@ -163,6 +163,9 @@ cfg_if! {
      } else if #[cfg(any(target_arch =3D "x86_64"))] {
          mod x86_64;
@@ -27,12 +25,9 @@ index cfcdaaecf..7261b95d2 100644
      } else {
          // Unknown target_arch
      }
-diff --git a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64=
/mod.rs b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64/mod=
.rs
-new file mode 100644
-index 000000000..14bae11d0
 --- /dev/null
-+++ b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-@@ -0,0 +1,867 @@
++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+@@ -0,0 +1,832 @@
 +//! RISC-V-specific definitions for 64-bit linux-like values
 +
 +pub type c_char =3D u8;
@@ -340,59 +335,7 @@ index 000000000..14bae11d0
 +pub const ENOTRECOVERABLE: ::c_int =3D 131;
 +pub const EHWPOISON: ::c_int =3D 133;
 +pub const ERFKILL: ::c_int =3D 132;
-+pub const SOL_SOCKET: ::c_int =3D 1;
-+pub const SO_REUSEADDR: ::c_int =3D 2;
-+pub const SO_TYPE: ::c_int =3D 3;
-+pub const SO_ERROR: ::c_int =3D 4;
-+pub const SO_DONTROUTE: ::c_int =3D 5;
-+pub const SO_BROADCAST: ::c_int =3D 6;
-+pub const SO_SNDBUF: ::c_int =3D 7;
-+pub const SO_RCVBUF: ::c_int =3D 8;
-+pub const SO_SNDBUFFORCE: ::c_int =3D 32;
-+pub const SO_RCVBUFFORCE: ::c_int =3D 33;
-+pub const SO_KEEPALIVE: ::c_int =3D 9;
-+pub const SO_OOBINLINE: ::c_int =3D 10;
-+pub const SO_NO_CHECK: ::c_int =3D 11;
-+pub const SO_PRIORITY: ::c_int =3D 12;
-+pub const SO_LINGER: ::c_int =3D 13;
-+pub const SO_BSDCOMPAT: ::c_int =3D 14;
-+pub const SO_REUSEPORT: ::c_int =3D 15;
-+pub const SO_PASSCRED: ::c_int =3D 16;
-+pub const SO_PEERCRED: ::c_int =3D 17;
-+pub const SO_RCVLOWAT: ::c_int =3D 18;
-+pub const SO_SNDLOWAT: ::c_int =3D 19;
-+pub const SO_RCVTIMEO: ::c_int =3D 20;
-+pub const SO_SNDTIMEO: ::c_int =3D 21;
-+pub const SO_SECURITY_AUTHENTICATION: ::c_int =3D 22;
-+pub const SO_SECURITY_ENCRYPTION_TRANSPORT: ::c_int =3D 23;
-+pub const SO_SECURITY_ENCRYPTION_NETWORK: ::c_int =3D 24;
-+pub const SO_BINDTODEVICE: ::c_int =3D 25;
-+pub const SO_ATTACH_FILTER: ::c_int =3D 26;
-+pub const SO_DETACH_FILTER: ::c_int =3D 27;
-+pub const SO_GET_FILTER: ::c_int =3D 26;
-+pub const SO_PEERNAME: ::c_int =3D 28;
-+pub const SO_TIMESTAMP: ::c_int =3D 29;
-+pub const SO_ACCEPTCONN: ::c_int =3D 30;
-+pub const SO_PEERSEC: ::c_int =3D 31;
-+pub const SO_PASSSEC: ::c_int =3D 34;
-+pub const SO_TIMESTAMPNS: ::c_int =3D 35;
-+pub const SCM_TIMESTAMPNS: ::c_int =3D 35;
-+pub const SO_MARK: ::c_int =3D 36;
-+pub const SO_PROTOCOL: ::c_int =3D 38;
-+pub const SO_DOMAIN: ::c_int =3D 39;
-+pub const SO_RXQ_OVFL: ::c_int =3D 40;
-+pub const SO_WIFI_STATUS: ::c_int =3D 41;
-+pub const SCM_WIFI_STATUS: ::c_int =3D 41;
-+pub const SO_PEEK_OFF: ::c_int =3D 42;
-+pub const SO_NOFCS: ::c_int =3D 43;
-+pub const SO_LOCK_FILTER: ::c_int =3D 44;
-+pub const SO_SELECT_ERR_QUEUE: ::c_int =3D 45;
-+pub const SO_BUSY_POLL: ::c_int =3D 46;
-+pub const SO_MAX_PACING_RATE: ::c_int =3D 47;
-+pub const SO_BPF_EXTENSIONS: ::c_int =3D 48;
-+pub const SO_INCOMING_CPU: ::c_int =3D 49;
-+pub const SO_ATTACH_BPF: ::c_int =3D 50;
-+pub const SO_DETACH_BPF: ::c_int =3D 27;
++
 +pub const SOCK_STREAM: ::c_int =3D 1;
 +pub const SOCK_DGRAM: ::c_int =3D 2;
 +pub const SA_ONSTACK: ::c_int =3D 134217728;
@@ -498,7 +441,7 @@ index 000000000..14bae11d0
 +pub const MAP_POPULATE: ::c_int =3D 32768;
 +pub const MAP_NONBLOCK: ::c_int =3D 65536;
 +pub const MAP_STACK: ::c_int =3D 131072;
-+pub const MAP_SYNC : ::c_int =3D 0x080000;
++pub const MAP_SYNC: ::c_int =3D 0x080000;
 +pub const EDEADLOCK: ::c_int =3D 35;
 +pub const EUCLEAN: ::c_int =3D 117;
 +pub const ENOTNAM: ::c_int =3D 118;
@@ -898,8 +841,22 @@ index 000000000..14bae11d0
 +pub const SYS_pkey_alloc: ::c_long =3D 289;
 +pub const SYS_pkey_free: ::c_long =3D 290;
 +pub const SYS_statx: ::c_long =3D 291;
++pub const SYS_pidfd_send_signal: ::c_long =3D 424;
++pub const SYS_io_uring_setup: ::c_long =3D 425;
++pub const SYS_io_uring_enter: ::c_long =3D 426;
++pub const SYS_io_uring_register: ::c_long =3D 427;
++pub const SYS_open_tree: ::c_long =3D 428;
++pub const SYS_move_mount: ::c_long =3D 429;
++pub const SYS_fsopen: ::c_long =3D 430;
++pub const SYS_fsconfig: ::c_long =3D 431;
++pub const SYS_fsmount: ::c_long =3D 432;
++pub const SYS_fspick: ::c_long =3D 433;
 +pub const SYS_pidfd_open: ::c_long =3D 434;
 +pub const SYS_clone3: ::c_long =3D 435;
---=20
-2.27.0
-
++pub const SYS_close_range: ::c_long =3D 436;
++pub const SYS_openat2: ::c_long =3D 437;
++pub const SYS_pidfd_getfd: ::c_long =3D 438;
++pub const SYS_faccessat2: ::c_long =3D 439;
++pub const SYS_process_madvise: ::c_long =3D 440;
++pub const SYS_epoll_pwait2: ::c_long =3D 441;
++pub const SYS_mount_setattr: ::c_long =3D 442;
diff --git a/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod=
.rs-add-riscv64-to-b64-set-libc-.patch b/meta/recipes-devtools/rust/libstd-=
rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch
similarity index 66%
rename from meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.=
rs-add-riscv64-to-b64-set-libc-.patch
rename to meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs=
-add-riscv64-to-b64-set.patch
index d0ddb3cbe7..047c4f2aab 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add=
-riscv64-to-b64-set-libc-.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add=
-riscv64-to-b64-set.patch
@@ -1,22 +1,19 @@
 From 4319893ebb7fca8bbd2bffc4bddb8d3ecdc08cc2 Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:07:21 +0200
-Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set -
- libc-0.2.93
+Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set
=20
 https://github.com/rust-lang/libc/pull/1994/commits/30070c822be2ef399b2ba3=
8cdc1d72ac694d65a3
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
- vendor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs | 3 ++-
+ vendor/libc-0.2.98/src/unix/linux_like/linux/musl/mod.rs | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
-diff --git a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs b/ve=
ndor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs
-index 00f26475d..a37f410fd 100644
---- a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs
-+++ b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs
-@@ -716,7 +716,8 @@ cfg_if! {
+--- a/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
++++ b/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
+@@ -709,7 +709,8 @@ cfg_if! {
                   target_arch =3D "aarch64",
                   target_arch =3D "mips64",
                   target_arch =3D "powerpc64",
@@ -26,6 +23,3 @@ index 00f26475d..a37f410fd 100644
          mod b64;
          pub use self::b64::*;
      } else if #[cfg(any(target_arch =3D "x86",
---=20
-2.27.0
-
diff --git a/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-defini=
tions-to-match-musl-libc-0.2.93.patch b/meta/recipes-devtools/rust/libstd-r=
s/0007-FIXUP-Correct-definitions-to-match-musl.patch
similarity index 89%
rename from meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definit=
ions-to-match-musl-libc-0.2.93.patch
rename to meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitio=
ns-to-match-musl.patch
index 8be8104f40..211d2e270b 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-t=
o-match-musl-libc-0.2.93.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-t=
o-match-musl.patch
@@ -1,7 +1,7 @@
 From 9d240d05c6e6620f36e4ddbcbcb5862fb3269d9f Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:09:17 +0200
-Subject: [PATCH 7/8] FIXUP Correct definitions to match musl - libc-0.2.93
+Subject: [PATCH 7/8] FIXUP Correct definitions to match musl
=20
 https://github.com/rust-lang/libc/pull/1994/commits/5f6a4d9745c79c81be63c7=
08515ab116786554a3
=20
@@ -11,11 +11,9 @@ Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
  .../linux_like/linux/musl/b64/riscv64/mod.rs  | 708 ++++++++----------
  1 file changed, 311 insertions(+), 397 deletions(-)
=20
-diff --git a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64=
/mod.rs b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64/mod=
.rs
-index 14bae11d0..c37190cca 100644
---- a/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-+++ b/vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-@@ -191,403 +191,8 @@ s! {
+--- a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+@@ -191,351 +191,8 @@ s! {
          pub l_len: ::off64_t,
          pub l_pid: ::pid_t,
      }
@@ -133,59 +131,7 @@ index 14bae11d0..c37190cca 100644
 -pub const ENOTRECOVERABLE: ::c_int =3D 131;
 -pub const EHWPOISON: ::c_int =3D 133;
 -pub const ERFKILL: ::c_int =3D 132;
--pub const SOL_SOCKET: ::c_int =3D 1;
--pub const SO_REUSEADDR: ::c_int =3D 2;
--pub const SO_TYPE: ::c_int =3D 3;
--pub const SO_ERROR: ::c_int =3D 4;
--pub const SO_DONTROUTE: ::c_int =3D 5;
--pub const SO_BROADCAST: ::c_int =3D 6;
--pub const SO_SNDBUF: ::c_int =3D 7;
--pub const SO_RCVBUF: ::c_int =3D 8;
--pub const SO_SNDBUFFORCE: ::c_int =3D 32;
--pub const SO_RCVBUFFORCE: ::c_int =3D 33;
--pub const SO_KEEPALIVE: ::c_int =3D 9;
--pub const SO_OOBINLINE: ::c_int =3D 10;
--pub const SO_NO_CHECK: ::c_int =3D 11;
--pub const SO_PRIORITY: ::c_int =3D 12;
--pub const SO_LINGER: ::c_int =3D 13;
--pub const SO_BSDCOMPAT: ::c_int =3D 14;
--pub const SO_REUSEPORT: ::c_int =3D 15;
--pub const SO_PASSCRED: ::c_int =3D 16;
--pub const SO_PEERCRED: ::c_int =3D 17;
--pub const SO_RCVLOWAT: ::c_int =3D 18;
--pub const SO_SNDLOWAT: ::c_int =3D 19;
--pub const SO_RCVTIMEO: ::c_int =3D 20;
--pub const SO_SNDTIMEO: ::c_int =3D 21;
--pub const SO_SECURITY_AUTHENTICATION: ::c_int =3D 22;
--pub const SO_SECURITY_ENCRYPTION_TRANSPORT: ::c_int =3D 23;
--pub const SO_SECURITY_ENCRYPTION_NETWORK: ::c_int =3D 24;
--pub const SO_BINDTODEVICE: ::c_int =3D 25;
--pub const SO_ATTACH_FILTER: ::c_int =3D 26;
--pub const SO_DETACH_FILTER: ::c_int =3D 27;
--pub const SO_GET_FILTER: ::c_int =3D 26;
--pub const SO_PEERNAME: ::c_int =3D 28;
--pub const SO_TIMESTAMP: ::c_int =3D 29;
--pub const SO_ACCEPTCONN: ::c_int =3D 30;
--pub const SO_PEERSEC: ::c_int =3D 31;
--pub const SO_PASSSEC: ::c_int =3D 34;
--pub const SO_TIMESTAMPNS: ::c_int =3D 35;
--pub const SCM_TIMESTAMPNS: ::c_int =3D 35;
--pub const SO_MARK: ::c_int =3D 36;
--pub const SO_PROTOCOL: ::c_int =3D 38;
--pub const SO_DOMAIN: ::c_int =3D 39;
--pub const SO_RXQ_OVFL: ::c_int =3D 40;
--pub const SO_WIFI_STATUS: ::c_int =3D 41;
--pub const SCM_WIFI_STATUS: ::c_int =3D 41;
--pub const SO_PEEK_OFF: ::c_int =3D 42;
--pub const SO_NOFCS: ::c_int =3D 43;
--pub const SO_LOCK_FILTER: ::c_int =3D 44;
--pub const SO_SELECT_ERR_QUEUE: ::c_int =3D 45;
--pub const SO_BUSY_POLL: ::c_int =3D 46;
--pub const SO_MAX_PACING_RATE: ::c_int =3D 47;
--pub const SO_BPF_EXTENSIONS: ::c_int =3D 48;
--pub const SO_INCOMING_CPU: ::c_int =3D 49;
--pub const SO_ATTACH_BPF: ::c_int =3D 50;
--pub const SO_DETACH_BPF: ::c_int =3D 27;
+-
 -pub const SOCK_STREAM: ::c_int =3D 1;
 -pub const SOCK_DGRAM: ::c_int =3D 2;
 -pub const SA_ONSTACK: ::c_int =3D 134217728;
@@ -291,7 +237,7 @@ index 14bae11d0..c37190cca 100644
 -pub const MAP_POPULATE: ::c_int =3D 32768;
 -pub const MAP_NONBLOCK: ::c_int =3D 65536;
 -pub const MAP_STACK: ::c_int =3D 131072;
--pub const MAP_SYNC : ::c_int =3D 0x080000;
+-pub const MAP_SYNC: ::c_int =3D 0x080000;
 -pub const EDEADLOCK: ::c_int =3D 35;
 -pub const EUCLEAN: ::c_int =3D 117;
 -pub const ENOTNAM: ::c_int =3D 118;
@@ -419,12 +365,11 @@ index 14bae11d0..c37190cca 100644
  pub const SYS_read: ::c_long =3D 63;
  pub const SYS_write: ::c_long =3D 64;
  pub const SYS_close: ::c_long =3D 57;
-@@ -863,5 +468,314 @@ pub const SYS_pkey_mprotect: ::c_long =3D 288;
- pub const SYS_pkey_alloc: ::c_long =3D 289;
- pub const SYS_pkey_free: ::c_long =3D 290;
- pub const SYS_statx: ::c_long =3D 291;
--pub const SYS_pidfd_open: ::c_long =3D 434;
--pub const SYS_clone3: ::c_long =3D 435;
+@@ -830,3 +487,315 @@ pub const SYS_faccessat2: ::c_long =3D 439
+ pub const SYS_process_madvise: ::c_long =3D 440;
+ pub const SYS_epoll_pwait2: ::c_long =3D 441;
+ pub const SYS_mount_setattr: ::c_long =3D 442;
++
 +
 +pub const O_APPEND: ::c_int =3D 1024;
 +pub const O_DIRECT: ::c_int =3D 0x4000;
@@ -736,6 +681,3 @@ index 14bae11d0..c37190cca 100644
 +extern "C" {
 +    pub fn ioctl(fd: ::c_int, request: ::c_int, ...) -> ::c_int;
 +}
---=20
-2.27.0
-
diff --git a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for=
-modified-files-for-rust-1.54.0-.patch b/meta/recipes-devtools/rust/libstd-=
rs/0008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch
deleted file mode 100644
index 23bb3aff38..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modifi=
ed-files-for-rust-1.54.0-.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 2b1c373f9a3341e8926d6be8d7cdcedc1fc6fca3 Mon Sep 17 00:00:00 2001
-From: Ralf Anton Beier <ralf_beier@me.com>
-Date: Sun, 8 Aug 2021 11:19:24 +0200
-Subject: [PATCH 8/8] Update checksums for modified files for rust 1.54.0 a=
nd
- libc-0.2.93
-
-Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
----
- vendor/libc-0.2.93/.cargo-checksum.json | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vendor/libc-0.2.93/.cargo-checksum.json b/vendor/libc-0.2.93/=
.cargo-checksum.json
-index 104eaa0ea..48576fb81 100644
---- a/vendor/libc-0.2.93/.cargo-checksum.json
-+++ b/vendor/libc-0.2.93/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"c65ce090d2ce0144faeb8d9ed9039d698ab19d9=
2eee1121ef234238041ec6153","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"770bf9c7c799dd353=
6b1e716cb42e7b5569cb4721f02e1d67dd2b932718dea2c","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"e992965c141308f1ab38c9=
646b6197b308143dedd2771b6df2f12eb5909ce663","src/fuchsia/no_align.rs":"303f=
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
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"3fe42dd50ccc476255ebe7c1f5b=
f65950f3d1b5a62fbf8ac91c8c29c945781bc","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"06e3e4a8972f367275c7d1226a47=
cf86db13afad74a22344d91d1ec2ab043bd9","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"14f0bd6693967d4fedec904f7042bd51f2138cb843ec4df18c911b357417cdd2"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"e7773=
54db19a183fba4c616cb8c72ac88839528c5e2095bbdf7e47e8e5d2148e","src/unix/bsd/=
freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472=
f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/m=
od.rs":"f3dc5dc3ca3e9cf999ee73222c4fc2200a06f92ce6e9dd6fc357d019bb4999a5","=
src/unix/bsd/freebsdlike/freebsd/mod.rs":"154dfc0825d39fb19fcf87ccc43bb3923=
d7faec1eac7b50464a6106dc44a32a8","src/unix/bsd/freebsdlike/freebsd/powerpc6=
4.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","s=
rc/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d=
80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/al=
ign.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70",=
"src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"6132aa0973454379674ea6cbc=
77e6eace1e1032dd9f38182071388a036f1bc08","src/unix/bsd/freebsdlike/mod.rs":=
"52a793977374d138c46e62b967e97dc5df06ef143701ffd8f4563658cbe77cf2","src/uni=
x/bsd/mod.rs":"33df9bc4e6f92f78842defe59d9ac2c2afa0942ba990134ec0bf57aa76fa=
a798","src/unix/bsd/netbsdlike/mod.rs":"c640eb7106c8af2ffee0644ea715528da3a=
8124fd2c9ca6ac617ab9eebc88787","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":=
"b38fc046f9a40fea28bd26328b96629f4d5d63d7524936bd6af1865d401a8716","src/uni=
x/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db1=
2c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"ff10f80b81=
82dc3a8fa5739bddd5362a2280f396b09d2da6c8adbf596d9643b0","src/unix/bsd/netbs=
dlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641=
465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566=
f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdli=
ke/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1=
a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"135509edeaf3fb3f102d8=
9d51ff1a8f82323497336a8dc7e1f0f23b5c2434b73","src/unix/bsd/netbsdlike/openb=
sd/aarch64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa=
2c28e","src/unix/bsd/netbsdlike/openbsd/mod.rs":"04372b08f57319b08002c1a5e1=
b200723ed1293754ea5b7d12beafa735c0c2db","src/unix/bsd/netbsdlike/openbsd/sp=
arc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085=
","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd8657=
0cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.=
rs":"e59b7fd65f68f8e857eec39e0c03bac1d3af6ddc26c9ba58494336b83659bb9b","src=
/unix/haiku/b32.rs":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649f=
ceaadce15a","src/unix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036=
ddf3a930d2939f337fc995900b","src/unix/haiku/mod.rs":"34d74b3f86953c4bdba363=
b7b629fd3fc72d3842260ba208f91b9dc6024634ff","src/unix/haiku/native.rs":"7f4=
3160df105a83a8527c59ad99b2578f479837a7c7d8bcdd5ee6607803e49f4","src/unix/he=
rmit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe087=
77fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed41=
3841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android/=
b32/arm.rs":"d611801c875a1066ff596ba813a80c1689aa54489bbd5bd8af4610c786d97a=
36","src/unix/linux_like/android/b32/mod.rs":"87c46d1ce6899df80b5eea1ca4fd3=
0bc437028e281ea16b658209c2a9b4edbec","src/unix/linux_like/android/b32/x86/a=
lign.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab"=
,"src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc9=
5ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aarc=
h64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca3=
5c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"db23f94bc3ed46a0967=
dde748f0d4566fc885cc6171d0555007f3398ff99a708","src/unix/linux_like/android=
/b64/mod.rs":"e3078e856e43fde9b57d8a5aa840a590f2e18517a3e8de23e9c2a3d798596=
f43","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android=
/b64/x86_64/mod.rs":"e84176d838e663d351450bad218715db1fafbb531e47ea0e262cbb=
45829dae89","src/unix/linux_like/android/mod.rs":"ead1d5880fa288e11470e560e=
119c29b16198a0a1bbd853c51e10b1bf4db7583","src/unix/linux_like/emscripten/al=
ign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216",=
"src/unix/linux_like/emscripten/mod.rs":"d4c59585ca4802029a41e269092ccfa20f=
982b352a74abc54d3e7edc3102fb05","src/unix/linux_like/emscripten/no_align.rs=
":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/u=
nix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7f=
a22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff1=
fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/li=
nux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c00=
e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a29622=
e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_li=
ke/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88c=
f581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded708=
124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linux=
_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957=
315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed009=
dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux_=
like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5c=
049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"4=
29fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/=
linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac9=
118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"1=
e05278ab6295e95165d0fab1698bdc82a511bcbda3250093af4e5edf08991f8","src/unix/=
linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2b=
fcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mod=
.rs":"9c628cd97806181dc4d34b072f63fe1eb42f08108712002e0628ffe27f2fa93f","sr=
c/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf7=
33a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/=
sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eeada=
fb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a8=
1b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/g=
nu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc2=
f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b160=
8fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_lik=
e/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a857801=
1cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.r=
s":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src/=
unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef2=
633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/mi=
ps64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c995=
1e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e86=
48948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linux=
/gnu/b64/mod.rs":"7bf5c9813032db77b964ccb90bdce15236ae9ea06ea185595278ea456=
5c21b7b","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868bb=
ecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_lik=
e/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a2=
d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs=
":"18edaa89c9746125863ff53182e0ef32cb1e1612e1ed9a2672558a9de85440e9","src/u=
nix/linux_like/linux/gnu/b64/s390x.rs":"d9bb4e524e70d6fef49e0f77d89a92f478f=
d95d9a1aea32f4dc845275a7465d4","src/unix/linux_like/linux/gnu/b64/sparc64/a=
lign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9"=
,"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c246=
e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu/=
b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b216=
96c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c92=
f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_like=
/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b5404=
995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs"=
:"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/un=
ix/linux_like/linux/gnu/mod.rs":"08c8e94116dd5bc3e78bd9118647169d6decfbab4b=
15c6d4f2fc378c2d802cd1","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223=
135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux=
_like/linux/mod.rs":"8fbd8e1d91f9e748755e11be5c385d9ba2c03acff741b4f75100d6=
79cbcc44bf","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c104=
3764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/=
linux/musl/b32/arm/mod.rs":"273f58d7483c7b562725fba71ff0b1f9685258c040f7f48=
30032aa5f42eced23","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a881179=
1809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux_=
like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d36068=
5b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs"=
:"33dfff5266bbc50c36d93e7b15381b9b9245031aa49e3db811b8984dd81851c0","src/un=
ix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edbaf=
c0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.rs=
":"bdfed99eb8beb541cc026a86eb99622687eecf603deb35204fee70f5464ad225","src/u=
nix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433be=
ce3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x86=
/mod.rs":"c34c06d1a2f02a761825a49ad6b37393c4f31afb9a3347de0a0c61979634b9b2"=
,"src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce235394=
f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/m=
usl/b64/aarch64/mod.rs":"3f01dbb2155877208ba58908396f75c7d3f57015662acb46cb=
19be6b2e81310b","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451f=
3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_like=
/linux/musl/b64/mod.rs":"d18abc0aeba2e26342bf3416a4dba0836db2bb0ee013b0a396=
29475cf8640289","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"028d235c=
b9d5af1b80e287b52373640532752ddce4812dee831948c6db4d434b","src/unix/linux_l=
ike/linux/musl/b64/s390x.rs":"38bbf839c22a07a46fd5b195812cf8a4d2966611a6221=
3a5b4972422a7e5b8cc","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"=
7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix=
/linux_like/linux/musl/b64/x86_64/mod.rs":"aeb436f2575e4e34eb88b597923e480e=
1e8214b1c8be7f1e41d63c8a0dd9c78b","src/unix/linux_like/linux/musl/mod.rs":"=
1a8ff52e8f3c52ad53a0d423fae3d79a8f7e07a0b83d5ff9b759eb2a421bda9a","src/unix=
/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac53330162683=
d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed1613=
8d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_=
like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7=
251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"9b69=
1eeec0a9bf7b2abb87e09062d2c148d18e11c96ecad0edd0b74d1d0509fd","src/unix/lin=
ux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb6=
32b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32=
/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f93=
6","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"18753a99b820d69e0=
62e3ba22a63fa86577b6dcc42f740479c7be1a4c658e1be","src/unix/linux_like/linux=
/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96=
b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/alig=
n.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","s=
rc/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c5=
5065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucli=
bc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad=
4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"4320e87=
31666e30f850d45d51cd59311e23cd22dad5d04b3be98a6419e70e0a1","src/unix/linux_=
like/linux/uclibc/mod.rs":"0438ffcfa951516cbfdbd7bdc31ccee06614d5150fd271ca=
6ba9ba06890041ad","src/unix/linux_like/linux/uclibc/no_align.rs":"3f2863704=
6524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_li=
ke/linux/uclibc/x86_64/l4re.rs":"bb31053d6403091e11f95ac2203982f279f8b984a1=
9adf30796878c45fdd8c25","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"0=
2e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix/=
linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b=
85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"35e17aa16019=
a82bb1667c43a97ecef151c16ecb5f489793adac918e704e21de","src/unix/mod.rs":"a5=
fbb90b99244f04bb37dc7d79d56261f5c5a41e9a09b7958aed9a2b4882eae8","src/unix/n=
ewlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b310=
9639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65=
f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd7=
f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/mod.=
rs":"407fe7e3c77f4c4c129788b3888a7da5d4b7b818ed3e96abb8de8cd780f83fb6","src=
/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085=
d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210e=
bd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/unix/newlib/xtensa/mod.rs":=
"08b314a27797ee27989f48f5a0e66e0d73670071ceabd341076cdce7ea67201c","src/uni=
x/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de=
78e53","src/unix/redox/mod.rs":"aa2fdf95ead6cde2937f2f0e7e0c72fdf2a6827d8b1=
bac647d3ca79e4d409348","src/unix/solarish/compat.rs":"b07a5bfac925eb012003a=
459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs"=
:"e01acc1b176e15268ac0ca4d1de50bf372ba80a465af35cd612c8f7e702baf92","src/un=
ix/solarish/mod.rs":"be9f7a37d17a7616f6dbebd871fe4ae83612af6b582ebf153284cf=
f1e7162334","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfec=
80d8c97a51342b15daf55fc3e808bb384","src/vxworks/aarch64.rs":"98f0afdc511cd0=
2557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/mod.rs":"9caf6ff3faad5b39c9deb8eae497a61ef15aa5e03aa409a16299e700240c3b6=
3","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7=
084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fe=
d6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f383176=
20b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs"=
:"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wa=
si.rs":"69460feb515652ec62ff258ccba4ed46738ee472938e78a3c34cbbf7a0e865c1","=
src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883=
b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a9486=
9585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"a0752b528fe6239536=
b9e915806326b20dc06183f078592b7394a10f5f56a621","src/windows/msvc.rs":"ea6d=
87a6a9cd668261b1c043e7c36cf599e80b5d09f6e4502e85daa4797c7927","tests/const_=
fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},=
"package":"9385f66bf6105b241aa65a61cb923ef20efc665cb9f9bb50ac2f0c4b7f378d41=
"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"c65ce090d2ce0144faeb8d9ed9039d698ab19d9=
2eee1121ef234238041ec6153","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"770bf9c7c799dd353=
6b1e716cb42e7b5569cb4721f02e1d67dd2b932718dea2c","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"e992965c141308f1ab38c9=
646b6197b308143dedd2771b6df2f12eb5909ce663","src/fuchsia/no_align.rs":"303f=
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
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"3fe42dd50ccc476255ebe7c1f5b=
f65950f3d1b5a62fbf8ac91c8c29c945781bc","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"06e3e4a8972f367275c7d1226a47=
cf86db13afad74a22344d91d1ec2ab043bd9","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"14f0bd6693967d4fedec904f7042bd51f2138cb843ec4df18c911b357417cdd2"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"e7773=
54db19a183fba4c616cb8c72ac88839528c5e2095bbdf7e47e8e5d2148e","src/unix/bsd/=
freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472=
f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/m=
od.rs":"f3dc5dc3ca3e9cf999ee73222c4fc2200a06f92ce6e9dd6fc357d019bb4999a5","=
src/unix/bsd/freebsdlike/freebsd/mod.rs":"154dfc0825d39fb19fcf87ccc43bb3923=
d7faec1eac7b50464a6106dc44a32a8","src/unix/bsd/freebsdlike/freebsd/powerpc6=
4.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","s=
rc/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d=
80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/al=
ign.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70",=
"src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"6132aa0973454379674ea6cbc=
77e6eace1e1032dd9f38182071388a036f1bc08","src/unix/bsd/freebsdlike/mod.rs":=
"52a793977374d138c46e62b967e97dc5df06ef143701ffd8f4563658cbe77cf2","src/uni=
x/bsd/mod.rs":"33df9bc4e6f92f78842defe59d9ac2c2afa0942ba990134ec0bf57aa76fa=
a798","src/unix/bsd/netbsdlike/mod.rs":"c640eb7106c8af2ffee0644ea715528da3a=
8124fd2c9ca6ac617ab9eebc88787","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":=
"b38fc046f9a40fea28bd26328b96629f4d5d63d7524936bd6af1865d401a8716","src/uni=
x/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db1=
2c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"ff10f80b81=
82dc3a8fa5739bddd5362a2280f396b09d2da6c8adbf596d9643b0","src/unix/bsd/netbs=
dlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641=
465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566=
f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdli=
ke/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1=
a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"135509edeaf3fb3f102d8=
9d51ff1a8f82323497336a8dc7e1f0f23b5c2434b73","src/unix/bsd/netbsdlike/openb=
sd/aarch64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa=
2c28e","src/unix/bsd/netbsdlike/openbsd/mod.rs":"04372b08f57319b08002c1a5e1=
b200723ed1293754ea5b7d12beafa735c0c2db","src/unix/bsd/netbsdlike/openbsd/sp=
arc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085=
","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd8657=
0cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.=
rs":"e59b7fd65f68f8e857eec39e0c03bac1d3af6ddc26c9ba58494336b83659bb9b","src=
/unix/haiku/b32.rs":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649f=
ceaadce15a","src/unix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036=
ddf3a930d2939f337fc995900b","src/unix/haiku/mod.rs":"34d74b3f86953c4bdba363=
b7b629fd3fc72d3842260ba208f91b9dc6024634ff","src/unix/haiku/native.rs":"7f4=
3160df105a83a8527c59ad99b2578f479837a7c7d8bcdd5ee6607803e49f4","src/unix/he=
rmit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe087=
77fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed41=
3841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android/=
b32/arm.rs":"d611801c875a1066ff596ba813a80c1689aa54489bbd5bd8af4610c786d97a=
36","src/unix/linux_like/android/b32/mod.rs":"87c46d1ce6899df80b5eea1ca4fd3=
0bc437028e281ea16b658209c2a9b4edbec","src/unix/linux_like/android/b32/x86/a=
lign.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab"=
,"src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc9=
5ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aarc=
h64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca3=
5c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"db23f94bc3ed46a0967=
dde748f0d4566fc885cc6171d0555007f3398ff99a708","src/unix/linux_like/android=
/b64/mod.rs":"e3078e856e43fde9b57d8a5aa840a590f2e18517a3e8de23e9c2a3d798596=
f43","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f751=
2719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android=
/b64/x86_64/mod.rs":"e84176d838e663d351450bad218715db1fafbb531e47ea0e262cbb=
45829dae89","src/unix/linux_like/android/mod.rs":"ead1d5880fa288e11470e560e=
119c29b16198a0a1bbd853c51e10b1bf4db7583","src/unix/linux_like/emscripten/al=
ign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216",=
"src/unix/linux_like/emscripten/mod.rs":"d4c59585ca4802029a41e269092ccfa20f=
982b352a74abc54d3e7edc3102fb05","src/unix/linux_like/emscripten/no_align.rs=
":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/u=
nix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7f=
a22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff1=
fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/li=
nux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c00=
e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a29622=
e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_li=
ke/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88c=
f581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded708=
124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linux=
_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957=
315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed009=
dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux_=
like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5c=
049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"4=
29fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/=
linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac9=
118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"1=
e05278ab6295e95165d0fab1698bdc82a511bcbda3250093af4e5edf08991f8","src/unix/=
linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2b=
fcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mod=
.rs":"9c628cd97806181dc4d34b072f63fe1eb42f08108712002e0628ffe27f2fa93f","sr=
c/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf7=
33a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/=
sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eeada=
fb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a8=
1b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/g=
nu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc2=
f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b160=
8fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_lik=
e/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a857801=
1cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.r=
s":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src/=
unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef2=
633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/mi=
ps64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c995=
1e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e86=
48948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linux=
/gnu/b64/mod.rs":"7bf5c9813032db77b964ccb90bdce15236ae9ea06ea185595278ea456=
5c21b7b","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868bb=
ecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_lik=
e/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a2=
d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs=
":"18edaa89c9746125863ff53182e0ef32cb1e1612e1ed9a2672558a9de85440e9","src/u=
nix/linux_like/linux/gnu/b64/s390x.rs":"d9bb4e524e70d6fef49e0f77d89a92f478f=
d95d9a1aea32f4dc845275a7465d4","src/unix/linux_like/linux/gnu/b64/sparc64/a=
lign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9"=
,"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c246=
e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu/=
b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b216=
96c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c92=
f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_like=
/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b5404=
995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs"=
:"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/un=
ix/linux_like/linux/gnu/mod.rs":"08c8e94116dd5bc3e78bd9118647169d6decfbab4b=
15c6d4f2fc378c2d802cd1","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223=
135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux=
_like/linux/mod.rs":"8fbd8e1d91f9e748755e11be5c385d9ba2c03acff741b4f75100d6=
79cbcc44bf","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c104=
3764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/=
linux/musl/b32/arm/mod.rs":"273f58d7483c7b562725fba71ff0b1f9685258c040f7f48=
30032aa5f42eced23","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a881179=
1809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux_=
like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d36068=
5b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs"=
:"33dfff5266bbc50c36d93e7b15381b9b9245031aa49e3db811b8984dd81851c0","src/un=
ix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edbaf=
c0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.rs=
":"bdfed99eb8beb541cc026a86eb99622687eecf603deb35204fee70f5464ad225","src/u=
nix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433be=
ce3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x86=
/mod.rs":"c34c06d1a2f02a761825a49ad6b37393c4f31afb9a3347de0a0c61979634b9b2"=
,"src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce235394=
f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/m=
usl/b64/aarch64/mod.rs":"3f01dbb2155877208ba58908396f75c7d3f57015662acb46cb=
19be6b2e81310b","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451f=
3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_like=
/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938cdccf40d985dafc11e90f2=
35947735a09bac","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"028d235c=
b9d5af1b80e287b52373640532752ddce4812dee831948c6db4d434b","src/unix/linux_l=
ike/linux/musl/b64/s390x.rs":"38bbf839c22a07a46fd5b195812cf8a4d2966611a6221=
3a5b4972422a7e5b8cc","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"=
7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix=
/linux_like/linux/musl/b64/x86_64/mod.rs":"aeb436f2575e4e34eb88b597923e480e=
1e8214b1c8be7f1e41d63c8a0dd9c78b","src/unix/linux_like/linux/musl/mod.rs":"=
bc727b710a7ba23980ad13ad95d360070759074ff5e8ee4522501d256472862e","src/unix=
/linux_like/linux/musl/b64/riscv64/mod.rs":"e0591197f0f9ebee3addb1a439f3db4=
d403712a859e76066d0484ee98a9ff724","src/unix/linux_like/linux/no_align.rs":=
"5ed04c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/uni=
x/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd673=
66e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs"=
:"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/un=
ix/linux_like/linux/uclibc/arm/mod.rs":"9b691eeec0a9bf7b2abb87e09062d2c148d=
18e11c96ecad0edd0b74d1d0509fd","src/unix/linux_like/linux/uclibc/arm/no_ali=
gn.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","=
src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d61=
2c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/u=
clibc/mips/mips32/mod.rs":"18753a99b820d69e062e3ba22a63fa86577b6dcc42f74047=
9c7be1a4c658e1be","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs=
":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/u=
nix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad=
83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc=
/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c5817=
7508a487fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a=
18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/l=
inux_like/linux/uclibc/mips/mod.rs":"4320e8731666e30f850d45d51cd59311e23cd2=
2dad5d04b3be98a6419e70e0a1","src/unix/linux_like/linux/uclibc/mod.rs":"0438=
ffcfa951516cbfdbd7bdc31ccee06614d5150fd271ca6ba9ba06890041ad","src/unix/lin=
ux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396=
e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs"=
:"bb31053d6403091e11f95ac2203982f279f8b984a19adf30796878c45fdd8c25","src/un=
ix/linux_like/linux/uclibc/x86_64/mod.rs":"02e21c0550a423a3f6db0a0af6a0f37c=
f5937feb2562a490e0ad0e09a8d9fc77","src/unix/linux_like/linux/uclibc/x86_64/=
other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8=
","src/unix/linux_like/mod.rs":"35e17aa16019a82bb1667c43a97ecef151c16ecb5f4=
89793adac918e704e21de","src/unix/mod.rs":"a5fbb90b99244f04bb37dc7d79d56261f=
5c5a41e9a09b7958aed9a2b4882eae8","src/unix/newlib/aarch64/mod.rs":"bb269c14=
68a9676442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/=
align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a=
","src/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d=
537bbc8020b39591af07c","src/unix/newlib/mod.rs":"407fe7e3c77f4c4c129788b388=
8a7da5d4b7b818ed3e96abb8de8cd780f83fb6","src/unix/newlib/no_align.rs":"e074=
3b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/new=
lib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2=
ad3fdc5187","src/unix/newlib/xtensa/mod.rs":"08b314a27797ee27989f48f5a0e66e=
0d73670071ceabd341076cdce7ea67201c","src/unix/no_align.rs":"c06e95373b90882=
66e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":=
"aa2fdf95ead6cde2937f2f0e7e0c72fdf2a6827d8b1bac647d3ca79e4d409348","src/uni=
x/solarish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a=
602e54beae9c","src/unix/solarish/illumos.rs":"e01acc1b176e15268ac0ca4d1de50=
bf372ba80a465af35cd612c8f7e702baf92","src/unix/solarish/mod.rs":"be9f7a37d1=
7a7616f6dbebd871fe4ae83612af6b582ebf153284cff1e7162334","src/unix/solarish/=
solaris.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb3=
84","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a=
9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d2=
1a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"9caf6ff3faad5b39c9d=
eb8eae497a61ef15aa5e03aa409a16299e700240c3b63","src/vxworks/powerpc.rs":"ac=
b7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwork=
s/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437=
762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d11584125243906=
0122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfb=
c0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"69460feb515652ec62ff258=
ccba4ed46738ee472938e78a3c34cbbf7a0e865c1","src/windows/gnu/align.rs":"b2c1=
3ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/=
gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e3837576=
7a","src/windows/mod.rs":"a0752b528fe6239536b9e915806326b20dc06183f078592b7=
394a10f5f56a621","src/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e=
80b5d09f6e4502e85daa4797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe7911=
8fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9385f66bf6105b241aa6=
5a61cb923ef20efc665cb9f9bb50ac2f0c4b7f378d41"}
-\ No newline at end of file
---=20
-2.27.0
-
diff --git a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for=
-modified-files-for-rust.patch b/meta/recipes-devtools/rust/libstd-rs/0008-=
Update-checksums-for-modified-files-for-rust.patch
new file mode 100644
index 0000000000..29131a0e1d
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modifi=
ed-files-for-rust.patch
@@ -0,0 +1,16 @@
+From 2b1c373f9a3341e8926d6be8d7cdcedc1fc6fca3 Mon Sep 17 00:00:00 2001
+From: Ralf Anton Beier <ralf_beier@me.com>
+Date: Sun, 8 Aug 2021 11:19:24 +0200
+Subject: [PATCH 8/8] Update checksums for modified files for rust
+
+Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
+---
+ vendor/libc-0.2.93/.cargo-checksum.json | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/vendor/libc/.cargo-checksum.json
++++ b/vendor/libc/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"9d8cd25bb60fc4bb42c4b034bfa26ba45a691fd=
7cae155dab8f8b5819fe12647","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"975b86cbe0335d64082ca8=
8bb24f0e3402371f6f5b33e940c4e12ce4342bb658","src/fuchsia/no_align.rs":"303f=
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
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"55e2ddba00f002fac0e3ed1c439=
32423ea6682aaff95491542dce9562c81e217","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"efdfed8f750d6a6233a3a753be80=
bdb6e06ec9ccdfa5b9246f09aa1d39d3cffe","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"14f0bd6693967d4fedec904f7042bd51f2138cb843ec4df18c911b357417cdd2"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"b449a=
5914d3175e0a390bad616370f28fe59efaee3b81c38fb6e556507c2711a","src/unix/bsd/=
freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472=
f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/m=
od.rs":"ce31af8c04d1a1b384f55f80db14b5f74c59d02c94b3b30288411c9bca5eba04","=
src/unix/bsd/freebsdlike/freebsd/mod.rs":"a4fc19429762fac85106180e87c4d10a6=
1b4c07563f4e844771fcde71c14fc51","src/unix/bsd/freebsdlike/freebsd/powerpc.=
rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src=
/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def=
55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.r=
s":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/=
unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3=
d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86=
_64/mod.rs":"6132aa0973454379674ea6cbc77e6eace1e1032dd9f38182071388a036f1bc=
08","src/unix/bsd/freebsdlike/mod.rs":"9dbe0fcf66f13ba27f163d9f4362c25036ff=
1973a3b67244bcb3e8f39c3efbfd","src/unix/bsd/mod.rs":"67e0932ebcd1605045744c=
3f15286204cc547019b0a2696419da1c14c61393f5","src/unix/bsd/netbsdlike/mod.rs=
":"ceaec69f85bbe5beaf0b2dd73e0fd2b7fa49c0ea9727dcf51415f99bd2bc4b9c","src/u=
nix/bsd/netbsdlike/netbsd/aarch64.rs":"b38fc046f9a40fea28bd26328b96629f4d5d=
63d7524936bd6af1865d401a8716","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cd=
bb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd=
/netbsdlike/netbsd/mod.rs":"6b30cadcf243eb6098cad6ec869f4739570df0f356aefd8=
26ef1c347c146685c","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0=
ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsd=
like/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068=
a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d=
1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/ne=
tbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51eb=
ca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"1dd5449dd1fd3d51e30ff=
deeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openb=
sd/mod.rs":"ac6fff797511b00659849242b997de4d9f948698b5677de928375fc84d2ac1f=
3","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e=
8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x8=
6.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","s=
rc/unix/bsd/netbsdlike/openbsd/x86_64.rs":"e59b7fd65f68f8e857eec39e0c03bac1=
d3af6ddc26c9ba58494336b83659bb9b","src/unix/haiku/b32.rs":"69ae47fc52c6880e=
85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"=
73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix=
/haiku/mod.rs":"cb829d468fecc8dacf3f03f5808f0c265a62dc82e34a208a025a8b90302=
7a121","src/unix/haiku/native.rs":"fd34e56a7b27591d83a980c92afefc543df9a2d4=
fe64c732d2b7d6aea31ac0a3","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
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
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"5d94d05d8c10a748f0b1f67=
a4abaf4dd8415351e14e3bc6c84f6a46c8e18874c","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"9e79edebb5c7b1b62f0e253570d02338a50f06fdb2fd4b27488e0ae50871a8=
36","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"6ef97140ca6fb24125fdd0aacb986ef785aa21993229660d7f703f8875ebfe49","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"ff1fe8fad4ea15d9bec3db25efcfcb4939190c51=
89f86cfa4d05825aa8c10956","src/unix/linux_like/linux/arch/mips/mod.rs":"e4a=
980b002105aaa057eb6568e1e2c6168ade5c00e13a31ef67e316ddffdb900","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"ded708124ee610267d011dee31fb02d1ec697c334aa=
822776ec95a7ddf6fc541","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"07adf=
9f4b96854062db518aaf08521fde0ad4a21a5c049efccba437bd97b2b5a","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"1cb5c0c9df3af2bbe131a91593583259fac9118931744c8435e197a394eb0462","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"9c628cd97806181dc4d34b072f63fe1=
eb42f08108712002e0628ffe27f2fa93f","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"1bcec269a8416ccc48a384=
ca5765eaaa23f30f39f32311f50008ef4eeadafb2f","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"5317dbf2323577b89=
370bbee3894882b89d8333176db4f7b271ddc2f036ef43c","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"c3730792dabcc166d8fd22929ef2633d49bc626875382dfcd401e8e125fb7a84"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"68bcb71bbfccb4e8648948e494366d94767ce96f36daab9c132937=
5cdd32a459","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"18edaa89c9746125863ff53182e0ef32cb=
1e1612e1ed9a2672558a9de85440e9","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"d9bb4e524e70d6fef49e0f77d89a92f478fd95d9a1aea32f4dc845275a7465d4","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"26fda11bdce99372c2c246e60866b56d98beb9fb49a2f6b69347ecfd03d=
18255","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c92f60d8900dce63d363a38f3126aaf5be981710=
e172bec96ef95ac6","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"5597=
b67f1cfc4e2012540a8cebf17ff139363c0835834ca8f308952ffe6e99c9","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"d6f8e72a6d67e0af=
6d1f7a09420f92906a52ae226a66f43268064249ce7019df","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"a8811791809672be8338e6e27d1c4fcf383c2f26585b=
e8bf9ab2923b219de032","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
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
c/unix/linux_like/linux/musl/mod.rs":"0602b1ee75b70eea30ad64234c9c6e772b6a7=
3262ce886971781a2bcf923f9b4","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"9b691eeec0a9bf7b2abb87e09062d2c148d18e11c=
96ecad0edd0b74d1d0509fd","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"18753a99b820d69e062e3ba22a63fa86577b6dcc42f740479c7be1=
a4c658e1be","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"656fbf5157ab6d06fc365a8353b138818ad5b8429ea5=
628ff35a3972c63a1a7c","src/unix/linux_like/linux/uclibc/mod.rs":"22f712c3e0=
8fd8cb37e274718de1bac09966a4cd4b0f018f28737bc30940b8af","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"bb31=
053d6403091e11f95ac2203982f279f8b984a19adf30796878c45fdd8c25","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"02e21c0550a423a3f6db0a0af6a0f37cf5937f=
eb2562a490e0ad0e09a8d9fc77","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"9f6eadebed153e31777482932dae2f3fd3471d5b5465099f9=
8f1e2a9429922fe","src/unix/mod.rs":"0550f5ed6a8292e62781cdfcca54b0f2652dd27=
9314d1b73db555fccfb059499","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"07c282da=
3fedf04d061c70ab918b561ba44e5d67670e0b04664505afc9c5979f","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"251ad=
e5cbe9d648ba7186f58dfe7d4fd8e08be1ab9d0d51bba13e0bf3a0207d0","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"be7cf5334fc8f2c6bc1b856288e53af7f90=
a92bd64793eb19b60b660383e508c","src/unix/solarish/mod.rs":"a5e87e2197011cea=
e4d6aa1bc8a16d2e01dd39583448e6809f32ba58143baee9","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"2689e3cad6461682892fcae8a=
23c0c51600e4750c147dd8d7538c6c6c876b7ec","src/vxworks/powerpc.rs":"acb7968c=
e99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powe=
rpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99=
","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f5=
2f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d=
8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"3800e710a40322fe0229f7665b185=
42dc066680c4d151e3c4f29f82202a1c294","src/windows/gnu/align.rs":"b2c13ec1b9=
f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mo=
d.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","s=
rc/windows/mod.rs":"2b960d585c2fc0c82659cc4caeaa3268e67a8de0a0390d084629eef=
d39a14c8d","src/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e80b5d0=
9f6e4502e85daa4797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d=
51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"a7f823d141fe0a24df1e23b4af=
4e3c7ba9e5966ec514ea068c93024aa7deb765"}
+\ No newline at end of file
++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"9d8cd25bb60fc4bb42c4b034bfa26ba45a691fd=
7cae155dab8f8b5819fe12647","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"975b86cbe0335d64082ca8=
8bb24f0e3402371f6f5b33e940c4e12ce4342bb658","src/fuchsia/no_align.rs":"303f=
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
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"55e2ddba00f002fac0e3ed1c439=
32423ea6682aaff95491542dce9562c81e217","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"efdfed8f750d6a6233a3a753be80=
bdb6e06ec9ccdfa5b9246f09aa1d39d3cffe","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"14f0bd6693967d4fedec904f7042bd51f2138cb843ec4df18c911b357417cdd2"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"b449a=
5914d3175e0a390bad616370f28fe59efaee3b81c38fb6e556507c2711a","src/unix/bsd/=
freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472=
f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/m=
od.rs":"ce31af8c04d1a1b384f55f80db14b5f74c59d02c94b3b30288411c9bca5eba04","=
src/unix/bsd/freebsdlike/freebsd/mod.rs":"a4fc19429762fac85106180e87c4d10a6=
1b4c07563f4e844771fcde71c14fc51","src/unix/bsd/freebsdlike/freebsd/powerpc.=
rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src=
/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def=
55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.r=
s":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/=
unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3=
d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86=
_64/mod.rs":"6132aa0973454379674ea6cbc77e6eace1e1032dd9f38182071388a036f1bc=
08","src/unix/bsd/freebsdlike/mod.rs":"9dbe0fcf66f13ba27f163d9f4362c25036ff=
1973a3b67244bcb3e8f39c3efbfd","src/unix/bsd/mod.rs":"67e0932ebcd1605045744c=
3f15286204cc547019b0a2696419da1c14c61393f5","src/unix/bsd/netbsdlike/mod.rs=
":"ceaec69f85bbe5beaf0b2dd73e0fd2b7fa49c0ea9727dcf51415f99bd2bc4b9c","src/u=
nix/bsd/netbsdlike/netbsd/aarch64.rs":"b38fc046f9a40fea28bd26328b96629f4d5d=
63d7524936bd6af1865d401a8716","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cd=
bb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd=
/netbsdlike/netbsd/mod.rs":"6b30cadcf243eb6098cad6ec869f4739570df0f356aefd8=
26ef1c347c146685c","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0=
ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsd=
like/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068=
a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d=
1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/ne=
tbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51eb=
ca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"1dd5449dd1fd3d51e30ff=
deeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openb=
sd/mod.rs":"ac6fff797511b00659849242b997de4d9f948698b5677de928375fc84d2ac1f=
3","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e=
8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x8=
6.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","s=
rc/unix/bsd/netbsdlike/openbsd/x86_64.rs":"e59b7fd65f68f8e857eec39e0c03bac1=
d3af6ddc26c9ba58494336b83659bb9b","src/unix/haiku/b32.rs":"69ae47fc52c6880e=
85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"=
73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix=
/haiku/mod.rs":"cb829d468fecc8dacf3f03f5808f0c265a62dc82e34a208a025a8b90302=
7a121","src/unix/haiku/native.rs":"fd34e56a7b27591d83a980c92afefc543df9a2d4=
fe64c732d2b7d6aea31ac0a3","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
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
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"5d94d05d8c10a748f0b1f67=
a4abaf4dd8415351e14e3bc6c84f6a46c8e18874c","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"9e79edebb5c7b1b62f0e253570d02338a50f06fdb2fd4b27488e0ae50871a8=
36","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"6ef97140ca6fb24125fdd0aacb986ef785aa21993229660d7f703f8875ebfe49","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"ff1fe8fad4ea15d9bec3db25efcfcb4939190c51=
89f86cfa4d05825aa8c10956","src/unix/linux_like/linux/arch/mips/mod.rs":"e4a=
980b002105aaa057eb6568e1e2c6168ade5c00e13a31ef67e316ddffdb900","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"ded708124ee610267d011dee31fb02d1ec697c334aa=
822776ec95a7ddf6fc541","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"07adf=
9f4b96854062db518aaf08521fde0ad4a21a5c049efccba437bd97b2b5a","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"1cb5c0c9df3af2bbe131a91593583259fac9118931744c8435e197a394eb0462","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"9c628cd97806181dc4d34b072f63fe1=
eb42f08108712002e0628ffe27f2fa93f","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"1bcec269a8416ccc48a384=
ca5765eaaa23f30f39f32311f50008ef4eeadafb2f","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"5317dbf2323577b89=
370bbee3894882b89d8333176db4f7b271ddc2f036ef43c","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"c3730792dabcc166d8fd22929ef2633d49bc626875382dfcd401e8e125fb7a84"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"68bcb71bbfccb4e8648948e494366d94767ce96f36daab9c132937=
5cdd32a459","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"18edaa89c9746125863ff53182e0ef32cb=
1e1612e1ed9a2672558a9de85440e9","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"d9bb4e524e70d6fef49e0f77d89a92f478fd95d9a1aea32f4dc845275a7465d4","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"26fda11bdce99372c2c246e60866b56d98beb9fb49a2f6b69347ecfd03d=
18255","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c92f60d8900dce63d363a38f3126aaf5be981710=
e172bec96ef95ac6","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"5597=
b67f1cfc4e2012540a8cebf17ff139363c0835834ca8f308952ffe6e99c9","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"d6f8e72a6d67e0af=
6d1f7a09420f92906a52ae226a66f43268064249ce7019df","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"a8811791809672be8338e6e27d1c4fcf383c2f26585b=
e8bf9ab2923b219de032","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
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
b7e9121c7fe28346","src/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d=
594c8febe780a938cdccf40d985dafc11e90f235947735a09bac","src/unix/linux_like/=
linux/musl/b64/powerpc64.rs":"e5a55525b42493923956d668f978fb45e22d51deea00c=
e5edbfddf76ff19c741","src/unix/linux_like/linux/musl/b64/s390x.rs":"03dfec6=
794d93cb31a7c52b2d53a0973755168f91f8fa437cc5dbd54882c8ee7","src/unix/linux_=
like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/musl/b64/x86_64/mod=
.rs":"0dd168f5a6881f32e5239fb312b23cf137b800d0ff323286a92c8a2c382b5456","sr=
c/unix/linux_like/linux/musl/mod.rs":"b69394bbcab5c452d3d3c04541a35702b9394=
f52cf63628449a5a2b61059517a","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"9b691eeec0a9bf7b2abb87e09062d2c148d18e11c=
96ecad0edd0b74d1d0509fd","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"18753a99b820d69e062e3ba22a63fa86577b6dcc42f740479c7be1=
a4c658e1be","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"656fbf5157ab6d06fc365a8353b138818ad5b8429ea5=
628ff35a3972c63a1a7c","src/unix/linux_like/linux/uclibc/mod.rs":"22f712c3e0=
8fd8cb37e274718de1bac09966a4cd4b0f018f28737bc30940b8af","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"bb31=
053d6403091e11f95ac2203982f279f8b984a19adf30796878c45fdd8c25","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"02e21c0550a423a3f6db0a0af6a0f37cf5937f=
eb2562a490e0ad0e09a8d9fc77","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"9f6eadebed153e31777482932dae2f3fd3471d5b5465099f9=
8f1e2a9429922fe","src/unix/mod.rs":"0550f5ed6a8292e62781cdfcca54b0f2652dd27=
9314d1b73db555fccfb059499","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"07c282da=
3fedf04d061c70ab918b561ba44e5d67670e0b04664505afc9c5979f","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"251ad=
e5cbe9d648ba7186f58dfe7d4fd8e08be1ab9d0d51bba13e0bf3a0207d0","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"be7cf5334fc8f2c6bc1b856288e53af7f90=
a92bd64793eb19b60b660383e508c","src/unix/solarish/mod.rs":"a5e87e2197011cea=
e4d6aa1bc8a16d2e01dd39583448e6809f32ba58143baee9","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"2689e3cad6461682892fcae8a=
23c0c51600e4750c147dd8d7538c6c6c876b7ec","src/vxworks/powerpc.rs":"acb7968c=
e99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powe=
rpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99=
","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f5=
2f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d=
8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"3800e710a40322fe0229f7665b185=
42dc066680c4d151e3c4f29f82202a1c294","src/windows/gnu/align.rs":"b2c13ec1b9=
f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mo=
d.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","s=
rc/windows/mod.rs":"2b960d585c2fc0c82659cc4caeaa3268e67a8de0a0390d084629eef=
d39a14c8d","src/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e80b5d0=
9f6e4502e85daa4797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d=
51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"a7f823d141fe0a24df1e23b4af=
4e3c7ba9e5966ec514ea068c93024aa7deb765"}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.55.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.55.0.bb
deleted file mode 100644
index cc30158d22..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs_1.55.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require rust-source.inc
-require libstd-rs.inc
-
-SRC_URI +=3D " \
-            file://0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.=
patch;patchdir=3D../../ \
-            file://0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-lib=
c-.patch;patchdir=3D../../ \
-            file://0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.9=
3.patch;patchdir=3D../../ \
-            file://0008-Update-checksums-for-modified-files-for-rust-1.54.=
0-.patch;patchdir=3D../../ \
-            "
-# libstd moved from src/libstd to library/std in 1.47+
-S =3D "${RUSTSRC}/library/std"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.56.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.56.0.bb
new file mode 100644
index 0000000000..e50665e1b7
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.56.0.bb
@@ -0,0 +1,11 @@
+require rust-source.inc
+require libstd-rs.inc
+
+SRC_URI +=3D " \
+    file://0005-Add-base-definitions-for-riscv64-musl-libc.patch;patchdir=
=3D../../ \
+    file://0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch;patch=
dir=3D../../ \
+    file://0007-FIXUP-Correct-definitions-to-match-musl.patch;patchdir=3D.=
./../ \
+    file://0008-Update-checksums-for-modified-files-for-rust.patch;patchdi=
r=3D../../ \
+"
+# libstd moved from src/libstd to library/std in 1.47+
+S =3D "${RUSTSRC}/library/std"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.55.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.55.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.56.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.55.0.bb b/meta/recipes=
-devtools/rust/rust-cross_1.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.55.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.56.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.55.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.56.0.bb
similarity index 82%
rename from meta/recipes-devtools/rust/rust-llvm_1.55.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.56.0.bb
index 5e37798edd..222c20ad3c 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.55.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.56.0.bb
@@ -1,5 +1,5 @@
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE =3D "12.0.1"
+LLVM_RELEASE =3D "13.0.0"
 require rust-source.inc
 require rust-llvm.inc
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 71ac102444..18e98d70a0 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -2,17 +2,17 @@
 ## snapshot info is taken from rust/src/stage0.txt
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.54.0"
-CARGO_VERSION =3D "1.54.0"
+RS_VERSION =3D "1.56.0"
+CARGO_VERSION =3D "1.56.0"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "a22e19859b3c5032daac16336=
37546a986c51bdfa3ad0db6e394e6cc461f466b"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "eafc06aba7128ee8592c16d7e3ae=
7b877e82c5d9779c9d07099558ed7e286296"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "8a9c80b7dc5d47e6eafe173b81ad=
96244522c97d74214ba7da57a502d49b231c"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "f693e4f41a959d62528e0043b=
0b010c4815fb9f5887267ae34ff8b860f8ec4ae"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "2a5f919e2036496c02ab4707a5eb=
8bd8a4ce6ea589e01cb39f25d213a26dcdfe"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f972125810d2db7df2e0af56d9f6=
a3dcdacc52d983bdf0ca17309b45fc44209b"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "a1a77737d218087eb7d3613a=
dcde2c9e383d758cdf128646a0ee63396145270b"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "0e771c06435b6fa3087ce054c7f=
2f94b8ee36717997f32f97e2e3425739ac2b4"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b3b6e5358bf1ecd5d8d7e258a56=
32dac7d923b2aa8ab1c8c0f6aad62d9307b37"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "3cd1c69c618e5efaf578a156=
c2a950c93964f9b47ba4d705d5700bdc64880231"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "0d2491a59f697d2ea52fc429b8d=
4665acb5f79b0e16703f3604b61b8aa68d1c4"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "9d97cd655845572846c058577f6=
8ea74b6111f8ea7649db308f786475f764a09"
=20
 SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index b3feb6072e..326a592544 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
-SRC_URI[rust.sha256sum] =3D "aec85a7c1f40b7a40818a58ae13632f8a12cfaa4d3e2a=
10957d0e9d16dfdd556"
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
+SRC_URI[rust.sha256sum] =3D "f13468889833c88e744ad579c5d8fbb7ecb53216159b5=
4481a90e5dcdaa9e320"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.55.0.bb=
 b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.55.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.0.bb
diff --git a/meta/recipes-devtools/rust/rust_1.55.0.bb b/meta/recipes-devto=
ols/rust/rust_1.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.55.0.bb
rename to meta/recipes-devtools/rust/rust_1.56.0.bb
--=20
2.33.1


