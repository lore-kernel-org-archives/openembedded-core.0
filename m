Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95917CA0EC2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.80415.1754022166727142669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BX+GMtpp;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so1314818a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022166; x=1754626966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaTNxFcUA+3NA/VvaP+0RJ8IrNbNqYPW4kf8OUu1dGg=;
        b=BX+GMtppde/6Qa14W4j6HgJv5CVkfeN65dfajpcxH5PUdOxLNKEbF5j/xTBMoB4htz
         Z3uIQ0o0bRT9vViGBu5U5Oq1xMzEJe9VKFAVXujZv1gMxY6rUpvEOSjdGknhxD70oPS+
         m1QcX+EBBl9hE3YnhnQphs6CVZtT4hhHd0wNonC0isKFF+Nmqqewy2UeScXGYQe5CDVD
         3w1pYzHTFQt2DaKQJ7HLn43GHd92qjzdKqbZpAC4dn+fuiVB+Aly7fxMgcvszhVDezJ/
         SGQ1hvGmGKo6VUZPhK+iPQ9P4hJ3zD1bqutH/p1MUxclNqiYZxo0qk1V0WIbgiGDQJjs
         Ch2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022166; x=1754626966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaTNxFcUA+3NA/VvaP+0RJ8IrNbNqYPW4kf8OUu1dGg=;
        b=jx24/mpdgRkuoNIIxHJIQKpLxpfXCUXGR35UZc9dzm8NrppfbYdNtIhTa6mAJqWjPl
         2Boi9zS68XW6pG3Zftp+y+cZ37nu3NxqfMAcbRzUKlP1KZQtyzdJfZwtU4xA2g9OQMjB
         AX061biOhW3OyVYOlUQFveIoPJLxBz7VfSeCYL3K/qOFsDdExDsXLOoxLTL5WJwqIFlR
         PNVqCEmPcEqHAWkQlNBJL8ni+RfvANfcdQo/63ZkpjnMTQN2qm8B0YAueq11TiJbBxVN
         yLBbBzsRH6gbHHtE48VAWipp2SsGWkUzOuN9AjKCvo2US9M2UWEQtQM70deL14QOJvjN
         AuyQ==
X-Gm-Message-State: AOJu0Yw4wcRpiN4Gwzf5wg7YnhmhxgjFfFdrCQHggC/rrdZs7BxlOeHK
	2eCzjYg9yusNXEzjWCGDLSX+LgXDMbDYsoGwPf4twkPaC3HjN1LDBkdIxiB2B0s/bFs=
X-Gm-Gg: ASbGncvLfrvGWhQEZ0Ht/hPcV09rGD7RHgrfbtF6kQ7m/9ePKhUiXh52gsdTlsrrZGl
	o0vXfk6uVCLd3LHvp3o2K5zf9jFBhLn8OevCQWhqATjGMOx1kf8turAjcvVNXwShLJKcs2f/fq6
	W9XmkOYXPou+QMxy30lT75/HmzAd5xl4DVLokPhDAGo+svCUs+2kQHN+i4Bf+m/sCMaPT01N4gh
	d2f9fikAMzV6RQDVUF87XF9EZajThAJ2YXenGunlRCihCM6IKsQc3TrQUymqI+Jm96WJmAVnIv2
	LuXdh4JV81gyImnM45x6PTm8AiESx/nvpanGwJv25R7byRdKYrWIkuaKo+uVx/MdswKE3vSMFRX
	mtwLulBliz5YbGw==
X-Google-Smtp-Source: AGHT+IFZQTz7jmsK6TpO7pxv9PPLH78uttqc6bwaIKXw/66Pg10gDeKfi73uPBSV/v9NKdL1Z4wmBg==
X-Received: by 2002:a05:6a20:7290:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-23de80bea72mr1732159637.6.1754022165541;
        Thu, 31 Jul 2025 21:22:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/7] cargo-c: Update patches to latest versions
Date: Thu, 31 Jul 2025 21:22:36 -0700
Message-ID: <20250801042242.3076232-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
References: <20250801042242.3076232-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221214

getrandom patch is accepted upstream with minor changes
parking_lot patch has addressed upstream feedback

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-libc-SYS_futex_time64-on-riscv32.patch | 69 +++++++------------
 ...Use-libc-SYS_futex_time64-on-riscv32.patch | 65 +++++++----------
 2 files changed, 51 insertions(+), 83 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use-libc-SYS_futex_time64-on-riscv32.patch b/meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use-libc-SYS_futex_time64-on-riscv32.patch
index dc7130fb574..638832c467f 100644
--- a/meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use-libc-SYS_futex_time64-on-riscv32.patch
+++ b/meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use-libc-SYS_futex_time64-on-riscv32.patch
@@ -1,53 +1,36 @@
 From 71c356a07fbbf1530cfc87960e975f93bc9007e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 22 Jul 2025 09:46:03 -0700
-Subject: [PATCH] Use libc::SYS_futex_time64 on riscv32
+Subject: [PATCH] Use getrandom syscall on riscv32/riscv64 linux
 
-On RISC-V 32-bit (riscv32), the SYS_futex system call is
-often handled indirectly due to the use of a 64-bit time_t
-type. Specifically, while SYS_futex is not directly defined,
-a related syscall like SYS_futex_time64 can be used,
+Minimum kernel needed on RISCV is fairly new (4.15+) so we are sure
+to have getrandom syscall, on glibc there is mimimal ABI kernel to denote
+it but musl does not have any other way to indicate it, so add it
+as a condition here to choose getrandom backend for rv32/rv64 on linux
+when using musl.
 
-Upstream-Status: Submitted [https://github.com/rust-random/getrandom/pull/698]
+Upstream-Status: Backport [https://github.com/rust-random/getrandom/pull/699]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/backends/use_file.rs | 17 +++++++++++++++++
  1 file changed, 17 insertions(+)
 
-diff --git a/src/backends/use_file.rs b/src/backends/use_file.rs
-index 7b48d43..baa0c66 100644
---- a/src/backends/use_file.rs
-+++ b/src/backends/use_file.rs
-@@ -158,7 +158,18 @@ mod sync {
-     pub(super) fn wait() {
-         let op = libc::FUTEX_WAIT | libc::FUTEX_PRIVATE_FLAG;
-         let timeout_ptr = core::ptr::null::<libc::timespec>();
-+        #[cfg(not(target_arch = "riscv32"))]
-         let ret = unsafe { libc::syscall(libc::SYS_futex, &FD, op, FD_ONGOING_INIT, timeout_ptr) };
-+        #[cfg(target_arch = "riscv32")]
-+        let ret = unsafe {
-+            libc::syscall(
-+                libc::SYS_futex_time64,
-+                &FD,
-+                op,
-+                FD_ONGOING_INIT,
-+                timeout_ptr,
-+            )
-+        };
-         // FUTEX_WAIT should return either 0 or EAGAIN error
-         debug_assert!({
-             match ret {
-@@ -172,7 +183,13 @@ mod sync {
-     /// Wake up all threads which wait for value of atomic `FD` to change.
-     pub(super) fn wake() {
-         let op = libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG;
-+
-+        #[cfg(not(target_arch = "riscv32"))]
-         let ret = unsafe { libc::syscall(libc::SYS_futex, &FD, op, libc::INT_MAX) };
-+
-+        #[cfg(target_arch = "riscv32")]
-+        let ret = unsafe { libc::syscall(libc::SYS_futex_time64, &FD, op, libc::INT_MAX) };
-+
-         debug_assert!(ret >= 0);
-     }
- 
+--- a/src/backends.rs
++++ b/src/backends.rs
+@@ -93,7 +93,15 @@ cfg_if! {
+                 // Minimum supported Linux kernel version for MUSL targets
+                 // is not specified explicitly (as of Rust 1.77) and they
+                 // are used in practice to target pre-3.17 kernels.
+-                target_env = "musl",
++                all(
++                    target_env = "musl",
++                    not(
++                        any(
++                            target_arch = "riscv64",
++                            target_arch = "riscv32",
++                        ),
++                    ),
++                ),
+             ),
+         )
+     ))] {
diff --git a/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch b/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
index 37f21af3d14..9e84ca3ec79 100644
--- a/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
+++ b/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
@@ -1,66 +1,51 @@
-From 78d4c37e9c5b60ea2368627c2fc297dfc46bec2a Mon Sep 17 00:00:00 2001
+From 7ebddca7070742bbb9cce471a93d699ad70ee371 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 22 Jul 2025 10:15:06 -0700
-Subject: [PATCH] Use libc::SYS_futex_time64 on riscv32
+Subject: [PATCH] Use libc::SYS_futex_time64 on riscv32/musl
 
 On RISC-V 32-bit (riscv32), the SYS_futex system call is
 often handled indirectly due to the use of a 64-bit time_t
 type. Specifically, while SYS_futex is not directly defined,
-a related syscall like SYS_futex_time64 can be used,
+a related syscall like SYS_futex_time64 can be used on target
+e.g. riscv32
 
 Upstream-Status: Submitted [https://github.com/Amanieu/parking_lot/pull/485]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/thread_parker/linux.rs | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
+ src/thread_parker/linux.rs | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/src/thread_parker/linux.rs b/src/thread_parker/linux.rs
-index 92601f6..3695624 100644
+index 92601f6..0952db4 100644
 --- a/src/thread_parker/linux.rs
 +++ b/src/thread_parker/linux.rs
-@@ -108,6 +108,7 @@ impl ThreadParker {
+@@ -108,9 +108,13 @@ impl ThreadParker {
              .as_ref()
              .map(|ts_ref| ts_ref as *const _)
              .unwrap_or(ptr::null());
-+        #[cfg(not(target_arch = "riscv32"))]
++        #[cfg(not(all(target_arch = "riscv32", target_env = "musl")))]
++        let futex_num = libc::SYS_futex;
++        #[cfg(all(target_arch = "riscv32", target_env = "musl",))]
++        let futex_num = libc::SYS_futex_time64;
          let r = unsafe {
              libc::syscall(
-                 libc::SYS_futex,
-@@ -117,6 +118,16 @@ impl ThreadParker {
-                 ts_ptr,
-             )
-         };
-+        #[cfg(target_arch = "riscv32")]
-+        let r = unsafe {
-+            libc::syscall(
-+                libc::SYS_futex_time64,
-+                &self.futex,
-+                libc::FUTEX_WAIT | libc::FUTEX_PRIVATE_FLAG,
-+                1,
-+                ts_ptr,
-+            )
-+        };
-         debug_assert!(r == 0 || r == -1);
-         if r == -1 {
-             debug_assert!(
-@@ -137,12 +148,20 @@ impl super::UnparkHandleT for UnparkHandle {
+-                libc::SYS_futex,
++                futex_num,
+                 &self.futex,
+                 libc::FUTEX_WAIT | libc::FUTEX_PRIVATE_FLAG,
+                 1,
+@@ -137,8 +141,13 @@ impl super::UnparkHandleT for UnparkHandle {
      unsafe fn unpark(self) {
          // The thread data may have been freed at this point, but it doesn't
          // matter since the syscall will just return EFAULT in that case.
-+        #[cfg(not(target_arch = "riscv32"))]
++        #[cfg(not(all(target_arch = "riscv32", target_env = "musl",)))]
++        let futex_num = libc::SYS_futex;
++        #[cfg(all(target_arch = "riscv32", target_env = "musl",))]
++        let futex_num = libc::SYS_futex_time64;
++
          let r = libc::syscall(
-             libc::SYS_futex,
+-            libc::SYS_futex,
++            futex_num,
              self.futex,
              libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG,
              1,
-         );
-+        #[cfg(target_arch = "riscv32")]
-+        let r = libc::syscall(
-+            libc::SYS_futex_time64,
-+            self.futex,
-+            libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG,
-+            1,
-+        );
-         debug_assert!(r == 0 || r == 1 || r == -1);
-         if r == -1 {
-             debug_assert_eq!(errno(), libc::EFAULT);

