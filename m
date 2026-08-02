Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E38C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 03:10:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17491.1785640223923717952
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 20:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sPAhsxYU;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so24471795ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785640223; x=1786245023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g11NciCeYID2xBar/IgXukTxPeaOPZfOAP+zghcKAwA=;
        b=sPAhsxYUJ8X2mwn5F058DY9oWk0njPB7MgcCr6p7se+Vw65u/lDPJZht32VPI6RDGG
         wXXPE+l0DUb+KpR7hVS4AmiZ7T0BLg80AV+D9oig+e1mb8hAucHA77szHBx4yh5+mCB3
         cSHyLPUNxQSW6ztc7tm4gTn1lxLa/cbXAHi5agIrKNUGDnFkPT3Ta0lu922nxOKel+Mc
         cGBFUpnM4EtSLKQLt66mHQDpP8c7zx8uizyPmSFkigRkuZR1exR648BmCWNbS99SbbgK
         FIvFOdLex0ELRCS/V5xr4FgNsx4ym/WHBnfE1D0mFAkJY33hkaQ/hwTy89RW6YK3BpXW
         F31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785640223; x=1786245023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g11NciCeYID2xBar/IgXukTxPeaOPZfOAP+zghcKAwA=;
        b=WnxboCy2ghEFnLPdaCsg9HL/QmXHr6nFUsghoFtwopfBmVXoP9U489yHgJU4cZpFt3
         h7MzxYt/vN+gjtsaAb3biHkIK7BfaH0mXse9N3YkgQFFBh3Cunc6QGPscHfkyHutY4uL
         YRW1BttkOESojyaAAEAbKEer4cHrxTaJXUh3NVQ/Xahp0IM6YWTqUDnwiurv6J2bZ87u
         DuRRp8xzST1+9fw9zBtDiBEsqPGNZJF6WFiGtTuXeRiVr1BwthdtAJInBC4EarSyslf6
         CUht7eEoFAeTBSiqW21jSd8VZG89g6A7nyHN6PXNvmP2FwK1OwtsSAGJy5zb0YAHoF4I
         k2hQ==
X-Gm-Message-State: AOJu0Yxk7/a8r573z37GSP4RbphYQoZj78bUqqfY6nfGN8Jr1A2jk5VS
	N+K2b9/BZDcrP0xB0K3WxDFrb17Nc91IzGJeNqPT6n29usA/48L+BJcqNceaBbocXuU=
X-Gm-Gg: AR+sD11WM5WpzXSyaNiq9juZosOTzlx0pR9AP8IpWYlPnSYWQupQwBvvbZ03Ed7zKr4
	yUKMfkTnEEYGKgOx2ZaC4hSxqbR/ZqFakXWp7JcmU3Yt69IKwkGir4SZ/I97rcQTC4WBX0LkZCx
	qEtek3eKbii9bOCpJRYG94w5DWXvCiMDgd/RMaHSrTniI5Pudc/1Ba7IQznN/R+pIk5tt6cf4SW
	YStNOgfy90h3055jrav74V3pPd9jWN19RGxYkz7AzZ1GXfCEsoIrvyLhgDPt+wl1MssXJUH4kvB
	rd7e7c6lSvRH+8LKB1eg2Ncfzq7NcPOXMevsy5gYhIMD1FqkTFoYvIgcynoUPIkpa16EHLBiXF2
	dnRHDquJ+Y/0OOy9rqZ4PnH8ncG+Dx8D/A2dQXZYBHItnSfHhvoYdZ0p9pjR7YOrzlDcrijKRzK
	P0Ximrv20pj+8hocqGmd5w4u/MD76qYG73UMqxtheYJNhPnaVeB94aqf90PmIy5w==
X-Received: by 2002:a17:903:8c7:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2d05247217bmr53522695ad.43.1785640223014;
        Sat, 01 Aug 2026 20:10:23 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ea02sm22309115ad.28.2026.08.01.20.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 20:10:22 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Daniel R . Slater" <daniel.slater@thermofisher.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [scarthgap][PATCH] qemu: restore 64-bit file lock handling for 32-bit guests
Date: Sun,  2 Aug 2026 03:10:21 +0000
Message-ID: <20260802031022.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242516

0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch removes the
TARGET_F_GETLK64, TARGET_F_SETLK64 and TARGET_F_SETLKW64 cases from
target_to_host_fcntl_cmd(), along with the struct target_flock64
conversions. Those are guest ABI, not host libc spellings, so every 32-bit
guest calling fcntl64() to lock a file now gets -TARGET_EINVAL; under
qemu-arm SQLite reports "disk I/O error".

Backport ac1bbe8ca46c ("linux-user/syscall.c: drop 64 suffix from flock64
&Co", 9.2.0), which makes the same musl-driven change without dropping the
guest side, and remove the hunks it supersedes from the local patch.

[YOCTO #16326]

AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Only scarthgap is affected. master and wrynose carry qemu 11.0.3 and 10.2.0
respectively, both of which contain ac1bbe8ca46c, and neither still carries
0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch, so there is
no master commit to backport from and nothing to send there first.

Verified by building qemu 8.2.7 with the current and proposed patch stacks
and running a 32-bit ARM test program under each resulting qemu-arm:
F_SETLK64, F_GETLK64, F_SETLKW64 and a lock at a 5 GiB offset all return
EINVAL before the change and succeed after it, with plain 32-bit F_SETLK
unaffected either way. bitbake qemu-native also builds clean on scarthgap
with the new stack.

 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...all.c-drop-64-suffix-from-flock64-Co.patch | 225 +++++++++++++++
 ...ce-use-of-lfs64-related-functions-an.patch | 265 +-----------------
 3 files changed, 228 insertions(+), 263 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 46cc7cb5cb0..91fd6df3e12 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
+           file://0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://fixedmeson.patch \
            file://no-pip.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
new file mode 100644
index 00000000000..6ebe2b895db
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
@@ -0,0 +1,225 @@
+From ac1bbe8ca46c550b3ad99c85744119a3ace7b4f4 Mon Sep 17 00:00:00 2001
+From: Michael Tokarev <mjt@tls.msk.ru>
+Date: Thu, 29 Aug 2024 09:39:50 +0300
+Subject: [PATCH] linux-user/syscall.c: drop 64 suffix from flock64 &Co
+
+Since we are always building with LFS enabled, in particular
+with -D_FILE_OFFSET_BITS=64, we should always have struct flock
+mapped to the 64bit variant (with off64_t), and F_GETLK mapped
+to F_GETLK64 etc, automatically.
+
+So there should be no need to explicitly use the "64" suffix
+for these things anymore.
+
+Also fix a misleading comment near safe_fcntl telling us to
+always use flock64 (since v2.6.0-1311-g435da5e7092a "linux-user:
+Use safe_syscall wrapper for fcntl").
+
+Reference: https://gitlab.com/qemu-project/qemu/-/issues/2215
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/ac1bbe8ca46c550b3ad99c85744119a3ace7b4f4]
+---
+ linux-user/syscall.c | 92 ++++++++++++++++++++--------------------------------
+ 1 file changed, 40 insertions(+), 52 deletions(-)
+
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -758,10 +758,8 @@
+  * the libc function.
+  */
+ #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
+-/* Similarly for fcntl. Note that callers must always:
+- *  pass the F_GETLK64 etc constants rather than the unsuffixed F_GETLK
+- *  use the flock64 struct rather than unsuffixed flock
+- * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
++/* Similarly for fcntl. Since we always build with LFS enabled,
++ * we should be using the 64-bit structures automatically.
+  */
+ #ifdef __NR_fcntl64
+ #define safe_fcntl(...) safe_syscall(__NR_fcntl64, __VA_ARGS__)
+@@ -6720,13 +6718,13 @@
+         ret = cmd;
+         break;
+     case TARGET_F_GETLK:
+-        ret = F_GETLK64;
++        ret = F_GETLK;
+         break;
+     case TARGET_F_SETLK:
+-        ret = F_SETLK64;
++        ret = F_SETLK;
+         break;
+     case TARGET_F_SETLKW:
+-        ret = F_SETLKW64;
++        ret = F_SETLKW;
+         break;
+     case TARGET_F_GETOWN:
+         ret = F_GETOWN;
+@@ -6742,13 +6740,13 @@
+         break;
+ #if TARGET_ABI_BITS == 32
+     case TARGET_F_GETLK64:
+-        ret = F_GETLK64;
++        ret = F_GETLK;
+         break;
+     case TARGET_F_SETLK64:
+-        ret = F_SETLK64;
++        ret = F_SETLK;
+         break;
+     case TARGET_F_SETLKW64:
+-        ret = F_SETLKW64;
++        ret = F_SETLKW;
+         break;
+ #endif
+     case TARGET_F_SETLEASE:
+@@ -6802,8 +6800,8 @@
+      * them to 5, 6 and 7 before making the syscall(). Since we make the
+      * syscall directly, adjust to what is supported by the kernel.
+      */
+-    if (ret >= F_GETLK64 && ret <= F_SETLKW64) {
+-        ret -= F_GETLK64 - 5;
++    if (ret >= F_GETLK && ret <= F_SETLKW) {
++        ret -= F_GETLK - 5;
+     }
+ #endif
+ 
+@@ -6836,7 +6834,7 @@
+     return type;
+ }
+ 
+-static inline abi_long copy_from_user_flock(struct flock64 *fl,
++static inline abi_long copy_from_user_flock(struct flock *fl,
+                                             abi_ulong target_flock_addr)
+ {
+     struct target_flock *target_fl;
+@@ -6861,7 +6859,7 @@
+ }
+ 
+ static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
+-                                          const struct flock64 *fl)
++                                          const struct flock *fl)
+ {
+     struct target_flock *target_fl;
+     short l_type;
+@@ -6880,8 +6878,8 @@
+     return 0;
+ }
+ 
+-typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
+-typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
++typedef abi_long from_flock64_fn(struct flock *fl, abi_ulong target_addr);
++typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock *fl);
+ 
+ #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
+ struct target_oabi_flock64 {
+@@ -6892,7 +6890,7 @@
+     abi_int   l_pid;
+ } QEMU_PACKED;
+ 
+-static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
++static inline abi_long copy_from_user_oabi_flock64(struct flock *fl,
+                                                    abi_ulong target_flock_addr)
+ {
+     struct target_oabi_flock64 *target_fl;
+@@ -6917,7 +6915,7 @@
+ }
+ 
+ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+-                                                 const struct flock64 *fl)
++                                                 const struct flock *fl)
+ {
+     struct target_oabi_flock64 *target_fl;
+     short l_type;
+@@ -6937,7 +6935,7 @@
+ }
+ #endif
+ 
+-static inline abi_long copy_from_user_flock64(struct flock64 *fl,
++static inline abi_long copy_from_user_flock64(struct flock *fl,
+                                               abi_ulong target_flock_addr)
+ {
+     struct target_flock64 *target_fl;
+@@ -6962,7 +6960,7 @@
+ }
+ 
+ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+-                                            const struct flock64 *fl)
++                                            const struct flock *fl)
+ {
+     struct target_flock64 *target_fl;
+     short l_type;
+@@ -6983,7 +6981,7 @@
+ 
+ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+ {
+-    struct flock64 fl64;
++    struct flock fl;
+ #ifdef F_GETOWN_EX
+     struct f_owner_ex fox;
+     struct target_f_owner_ex *target_fox;
+@@ -6996,45 +6994,45 @@
+ 
+     switch(cmd) {
+     case TARGET_F_GETLK:
+-        ret = copy_from_user_flock(&fl64, arg);
++        ret = copy_from_user_flock(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         if (ret == 0) {
+-            ret = copy_to_user_flock(arg, &fl64);
++            ret = copy_to_user_flock(arg, &fl);
+         }
+         break;
+ 
+     case TARGET_F_SETLK:
+     case TARGET_F_SETLKW:
+-        ret = copy_from_user_flock(&fl64, arg);
++        ret = copy_from_user_flock(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         break;
+ 
+     case TARGET_F_GETLK64:
+     case TARGET_F_OFD_GETLK:
+-        ret = copy_from_user_flock64(&fl64, arg);
++        ret = copy_from_user_flock64(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         if (ret == 0) {
+-            ret = copy_to_user_flock64(arg, &fl64);
++            ret = copy_to_user_flock64(arg, &fl);
+         }
+         break;
+     case TARGET_F_SETLK64:
+     case TARGET_F_SETLKW64:
+     case TARGET_F_OFD_SETLK:
+     case TARGET_F_OFD_SETLKW:
+-        ret = copy_from_user_flock64(&fl64, arg);
++        ret = copy_from_user_flock64(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         break;
+ 
+     case TARGET_F_GETFL:
+@@ -12301,7 +12299,7 @@
+     case TARGET_NR_fcntl64:
+     {
+         int cmd;
+-        struct flock64 fl;
++        struct flock fl;
+         from_flock64_fn *copyfrom = copy_from_user_flock64;
+         to_flock64_fn *copyto = copy_to_user_flock64;
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
index ceae67be644..b10a76090b8 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -13,234 +13,13 @@ Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-1
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Laurent Vivier <laurent@vivier.eu>
 ---
- linux-user/syscall.c | 153 +++++++++++--------------------------------
- 1 file changed, 39 insertions(+), 114 deletions(-)
+ linux-user/syscall.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
 
 Index: qemu-8.0.0/linux-user/syscall.c
 ===================================================================
 --- qemu-8.0.0.orig/linux-user/syscall.c
 +++ qemu-8.0.0/linux-user/syscall.c
-@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range,
-  */
- #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
- /* Similarly for fcntl. Note that callers must always:
-- *  pass the F_GETLK64 etc constants rather than the unsuffixed F_GETLK
-- *  use the flock64 struct rather than unsuffixed flock
-+ *  pass the F_GETLK etc constants rather than the unsuffixed F_GETLK
-+ *  use the flock struct rather than unsuffixed flock
-  * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
-  */
- #ifdef __NR_fcntl64
-@@ -6813,13 +6813,13 @@ static int target_to_host_fcntl_cmd(int
-         ret = cmd;
-         break;
-     case TARGET_F_GETLK:
--        ret = F_GETLK64;
-+        ret = F_GETLK;
-         break;
-     case TARGET_F_SETLK:
--        ret = F_SETLK64;
-+        ret = F_SETLK;
-         break;
-     case TARGET_F_SETLKW:
--        ret = F_SETLKW64;
-+        ret = F_SETLKW;
-         break;
-     case TARGET_F_GETOWN:
-         ret = F_GETOWN;
-@@ -6833,17 +6833,6 @@ static int target_to_host_fcntl_cmd(int
-     case TARGET_F_SETSIG:
-         ret = F_SETSIG;
-         break;
--#if TARGET_ABI_BITS == 32
--    case TARGET_F_GETLK64:
--        ret = F_GETLK64;
--        break;
--    case TARGET_F_SETLK64:
--        ret = F_SETLK64;
--        break;
--    case TARGET_F_SETLKW64:
--        ret = F_SETLKW64;
--        break;
--#endif
-     case TARGET_F_SETLEASE:
-         ret = F_SETLEASE;
-         break;
-@@ -6895,8 +6884,8 @@ static int target_to_host_fcntl_cmd(int
-      * them to 5, 6 and 7 before making the syscall(). Since we make the
-      * syscall directly, adjust to what is supported by the kernel.
-      */
--    if (ret >= F_GETLK64 && ret <= F_SETLKW64) {
--        ret -= F_GETLK64 - 5;
-+    if (ret >= F_GETLK && ret <= F_SETLKW) {
-+        ret -= F_GETLK - 5;
-     }
- #endif
- 
-@@ -6929,55 +6918,11 @@ static int host_to_target_flock(int type
-     return type;
- }
- 
--static inline abi_long copy_from_user_flock(struct flock64 *fl,
--                                            abi_ulong target_flock_addr)
--{
--    struct target_flock *target_fl;
--    int l_type;
--
--    if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
--        return -TARGET_EFAULT;
--    }
--
--    __get_user(l_type, &target_fl->l_type);
--    l_type = target_to_host_flock(l_type);
--    if (l_type < 0) {
--        return l_type;
--    }
--    fl->l_type = l_type;
--    __get_user(fl->l_whence, &target_fl->l_whence);
--    __get_user(fl->l_start, &target_fl->l_start);
--    __get_user(fl->l_len, &target_fl->l_len);
--    __get_user(fl->l_pid, &target_fl->l_pid);
--    unlock_user_struct(target_fl, target_flock_addr, 0);
--    return 0;
--}
--
--static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
--                                          const struct flock64 *fl)
--{
--    struct target_flock *target_fl;
--    short l_type;
--
--    if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
--        return -TARGET_EFAULT;
--    }
--
--    l_type = host_to_target_flock(fl->l_type);
--    __put_user(l_type, &target_fl->l_type);
--    __put_user(fl->l_whence, &target_fl->l_whence);
--    __put_user(fl->l_start, &target_fl->l_start);
--    __put_user(fl->l_len, &target_fl->l_len);
--    __put_user(fl->l_pid, &target_fl->l_pid);
--    unlock_user_struct(target_fl, target_flock_addr, 1);
--    return 0;
--}
--
--typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
--typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
-+typedef abi_long from_flock_fn(struct flock *fl, abi_ulong target_addr);
-+typedef abi_long to_flock_fn(abi_ulong target_addr, const struct flock *fl);
- 
- #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
--struct target_oabi_flock64 {
-+struct target_oabi_flock {
-     abi_short l_type;
-     abi_short l_whence;
-     abi_llong l_start;
-@@ -6985,10 +6930,10 @@ struct target_oabi_flock64 {
-     abi_int   l_pid;
- } QEMU_PACKED;
- 
--static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
-+static inline abi_long copy_from_user_oabi_flock(struct flock *fl,
-                                                    abi_ulong target_flock_addr)
- {
--    struct target_oabi_flock64 *target_fl;
-+    struct target_oabi_flock *target_fl;
-     int l_type;
- 
-     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7009,10 +6954,10 @@ static inline abi_long copy_from_user_oa
-     return 0;
- }
- 
--static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
--                                                 const struct flock64 *fl)
-+static inline abi_long copy_to_user_oabi_flock(abi_ulong target_flock_addr,
-+                                                 const struct flock *fl)
- {
--    struct target_oabi_flock64 *target_fl;
-+    struct target_oabi_flock *target_fl;
-     short l_type;
- 
-     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7030,10 +6975,10 @@ static inline abi_long copy_to_user_oabi
- }
- #endif
- 
--static inline abi_long copy_from_user_flock64(struct flock64 *fl,
-+static inline abi_long copy_from_user_flock(struct flock *fl,
-                                               abi_ulong target_flock_addr)
- {
--    struct target_flock64 *target_fl;
-+    struct target_flock *target_fl;
-     int l_type;
- 
-     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7054,10 +6999,10 @@ static inline abi_long copy_from_user_fl
-     return 0;
- }
- 
--static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
--                                            const struct flock64 *fl)
-+static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
-+                                            const struct flock *fl)
- {
--    struct target_flock64 *target_fl;
-+    struct target_flock *target_fl;
-     short l_type;
- 
-     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7076,7 +7021,7 @@ static inline abi_long copy_to_user_floc
- 
- static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
- {
--    struct flock64 fl64;
-+    struct flock fl64;
- #ifdef F_GETOWN_EX
-     struct f_owner_ex fox;
-     struct target_f_owner_ex *target_fox;
-@@ -7089,6 +7034,7 @@ static abi_long do_fcntl(int fd, int cmd
- 
-     switch(cmd) {
-     case TARGET_F_GETLK:
-+    case TARGET_F_OFD_GETLK:
-         ret = copy_from_user_flock(&fl64, arg);
-         if (ret) {
-             return ret;
-@@ -7098,32 +7044,11 @@ static abi_long do_fcntl(int fd, int cmd
-             ret = copy_to_user_flock(arg, &fl64);
-         }
-         break;
--
-     case TARGET_F_SETLK:
-     case TARGET_F_SETLKW:
--        ret = copy_from_user_flock(&fl64, arg);
--        if (ret) {
--            return ret;
--        }
--        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
--        break;
--
--    case TARGET_F_GETLK64:
--    case TARGET_F_OFD_GETLK:
--        ret = copy_from_user_flock64(&fl64, arg);
--        if (ret) {
--            return ret;
--        }
--        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
--        if (ret == 0) {
--            ret = copy_to_user_flock64(arg, &fl64);
--        }
--        break;
--    case TARGET_F_SETLK64:
--    case TARGET_F_SETLKW64:
-     case TARGET_F_OFD_SETLK:
-     case TARGET_F_OFD_SETLKW:
--        ret = copy_from_user_flock64(&fl64, arg);
-+        ret = copy_from_user_flock(&fl64, arg);
-         if (ret) {
-             return ret;
-         }
 @@ -7348,7 +7273,7 @@ static inline abi_long target_truncate64
          arg2 = arg3;
          arg3 = arg4;
@@ -313,43 +92,3 @@ Index: qemu-8.0.0/linux-user/syscall.c
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -11998,14 +11923,14 @@ static abi_long do_syscall1(CPUArchState
-     case TARGET_NR_fcntl64:
-     {
-         int cmd;
--        struct flock64 fl;
--        from_flock64_fn *copyfrom = copy_from_user_flock64;
--        to_flock64_fn *copyto = copy_to_user_flock64;
-+        struct flock fl;
-+        from_flock_fn *copyfrom = copy_from_user_flock;
-+        to_flock_fn *copyto = copy_to_user_flock;
- 
- #ifdef TARGET_ARM
-         if (!cpu_env->eabi) {
--            copyfrom = copy_from_user_oabi_flock64;
--            copyto = copy_to_user_oabi_flock64;
-+            copyfrom = copy_from_user_oabi_flock;
-+            copyto = copy_to_user_oabi_flock;
-         }
- #endif
- 
-@@ -12015,7 +11940,7 @@ static abi_long do_syscall1(CPUArchState
-         }
- 
-         switch(arg2) {
--        case TARGET_F_GETLK64:
-+        case TARGET_F_GETLK:
-             ret = copyfrom(&fl, arg3);
-             if (ret) {
-                 break;
-@@ -12026,8 +11951,8 @@ static abi_long do_syscall1(CPUArchState
-             }
- 	    break;
- 
--        case TARGET_F_SETLK64:
--        case TARGET_F_SETLKW64:
-+        case TARGET_F_SETLK:
-+        case TARGET_F_SETLKW:
-             ret = copyfrom(&fl, arg3);
-             if (ret) {
-                 break;
-- 
2.43.0


