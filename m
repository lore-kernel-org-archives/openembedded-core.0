Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD00C48294
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63148.1702649864477980529
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Aq02Xivo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HtnkH9KK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018c6dd71f02-d282601e-c780-4dc6-8644-1c87eb1d45f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649864;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/fmHC8Q5verOsanzF6UTWvJOXlesdh4WqL69OFuHfNM=;
	b=Aq02XivoITyNdXg74KzcntIXY4lmQoOLlW8O9+UkJedK/pomUo8nGl0nxIPNOSXu
	drOvJTe46tqg4155WkyMsB/7nSRp6JYvQ1ScNiytY8fSUt7veCh7RkinpRopz48fkZU
	qqFGzmr58PR/oDWhUlOcnS3/nc611npu0Qg0xGG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649864;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/fmHC8Q5verOsanzF6UTWvJOXlesdh4WqL69OFuHfNM=;
	b=HtnkH9KKtQIB31xm8nTXVbr97k/jhIjAfyZwz7Wy4rJ5Jmv0+XXAXOF9vCbTiZIo
	LLTVLzpaDvMBbKcaRKeKpVHltuYWXprc2L/W4V5/rPkZcynKEcne7ZMIt2U0Jpxmo4O
	7hAd5Qcb564aeQcQt3Qm/4WG2EqyCDnkdx6Cn5w4=
Content-Type: multipart/mixed; boundary="===============5163544547795088655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.1.3 FAILED
Message-ID: <0101018c6dd71f02-d282601e-c780-4dc6-8644-1c87eb1d45f5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192478

--===============5163544547795088655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *8.1.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-qemu-upgrade-8.1.2-8.1.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2f84e0edbe372f23089ed8cd1fbdfcee7fc33d33 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 08:41:39 +0000
Subject: [PATCH] qemu: upgrade 8.1.2 -> 8.1.3

---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 ...n-environment-space-to-boot-loader-q.patch | 12 ++--
 ...ce-use-of-lfs64-related-functions-an.patch | 60 +++++++++----------
 .../0003-apic-fixup-fallthrough-to-PIC.patch  | 14 ++---
 ...dd-pkg-config-handling-for-libgcrypt.patch | 12 ++--
 ...mu-Do-not-include-file-if-not-exists.patch | 12 ++--
 ...er-space-mmap-tweaks-to-address-musl.patch | 15 +++--
 .../qemu/0007-qemu-Determinism-fixes.patch    | 14 ++---
 ...d-use-relative-path-to-refer-to-file.patch | 12 ++--
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch | 12 ++--
 ...t-against-buggy-or-malicious-guest-d.patch | 21 +++----
 meta/recipes-devtools/qemu/qemu/cross.patch   | 16 ++---
 .../qemu/qemu/fixedmeson.patch                | 17 ++++--
 meta/recipes-devtools/qemu/qemu/fixmips.patch | 21 +++++--
 .../qemu/{qemu_8.1.2.bb => qemu_8.1.3.bb}     |  0
 15 files changed, 129 insertions(+), 111 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5ab2cb83b4..d6a3cf47b9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
+SRC_URI[sha256sum] = "43cc176804105586f74f90398f34e9f85787dff400d3b640d81f7779fbe265bb"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index c65508017d..3d3086b4b3 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From de64af82950a6908f9407dfc92b83c17e2af3eab Mon Sep 17 00:00:00 2001
+From bee9d0ff821e5124364caf5c528068e03a757cb8 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
-Subject: [PATCH 01/12] qemu: Add addition environment space to boot loader
+Subject: [PATCH] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/hw/mips/malta.c
-===================================================================
---- qemu-8.0.0.orig/hw/mips/malta.c
-+++ qemu-8.0.0/hw/mips/malta.c
+diff --git a/hw/mips/malta.c b/hw/mips/malta.c
+index f9618fa5f..dd2dd35e5 100644
+--- a/hw/mips/malta.c
++++ b/hw/mips/malta.c
 @@ -64,7 +64,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
index ceae67be64..dca7a239c8 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,8 +1,7 @@
-From 71f14902256e3c3529710b713e1ea43100bf4c40 Mon Sep 17 00:00:00 2001
+From d242e9b872231285ab3f1ed5c26406ef055012e3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH 2/2] linux-user: Replace use of lfs64 related functions and
- macros
+Subject: [PATCH] linux-user: Replace use of lfs64 related functions and macros
 
 Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
 anf macros behave same as their 64 suffixed counterparts. This also
@@ -12,15 +11,16 @@ functions are no more available under _GNU_SOURCE feature macro
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02841.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Laurent Vivier <laurent@vivier.eu>
+
 ---
  linux-user/syscall.c | 153 +++++++++++--------------------------------
  1 file changed, 39 insertions(+), 114 deletions(-)
 
-Index: qemu-8.0.0/linux-user/syscall.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/syscall.c
-+++ qemu-8.0.0/linux-user/syscall.c
-@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range,
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 48320fc74..fc57b650b 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
   */
  #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
  /* Similarly for fcntl. Note that callers must always:
@@ -31,7 +31,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
   * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
   */
  #ifdef __NR_fcntl64
-@@ -6813,13 +6813,13 @@ static int target_to_host_fcntl_cmd(int
+@@ -6862,13 +6862,13 @@ static int target_to_host_fcntl_cmd(int cmd)
          ret = cmd;
          break;
      case TARGET_F_GETLK:
@@ -48,7 +48,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          break;
      case TARGET_F_GETOWN:
          ret = F_GETOWN;
-@@ -6833,17 +6833,6 @@ static int target_to_host_fcntl_cmd(int
+@@ -6882,17 +6882,6 @@ static int target_to_host_fcntl_cmd(int cmd)
      case TARGET_F_SETSIG:
          ret = F_SETSIG;
          break;
@@ -66,7 +66,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      case TARGET_F_SETLEASE:
          ret = F_SETLEASE;
          break;
-@@ -6895,8 +6884,8 @@ static int target_to_host_fcntl_cmd(int
+@@ -6944,8 +6933,8 @@ static int target_to_host_fcntl_cmd(int cmd)
       * them to 5, 6 and 7 before making the syscall(). Since we make the
       * syscall directly, adjust to what is supported by the kernel.
       */
@@ -77,7 +77,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      }
  #endif
  
-@@ -6929,55 +6918,11 @@ static int host_to_target_flock(int type
+@@ -6978,55 +6967,11 @@ static int host_to_target_flock(int type)
      return type;
  }
  
@@ -136,7 +136,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      abi_short l_type;
      abi_short l_whence;
      abi_llong l_start;
-@@ -6985,10 +6930,10 @@ struct target_oabi_flock64 {
+@@ -7034,10 +6979,10 @@ struct target_oabi_flock64 {
      abi_int   l_pid;
  } QEMU_PACKED;
  
@@ -149,7 +149,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7009,10 +6954,10 @@ static inline abi_long copy_from_user_oa
+@@ -7058,10 +7003,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -163,7 +163,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7030,10 +6975,10 @@ static inline abi_long copy_to_user_oabi
+@@ -7079,10 +7024,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
  }
  #endif
  
@@ -176,7 +176,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7054,10 +6999,10 @@ static inline abi_long copy_from_user_fl
+@@ -7103,10 +7048,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -190,7 +190,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7076,7 +7021,7 @@ static inline abi_long copy_to_user_floc
+@@ -7125,7 +7070,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
  
  static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  {
@@ -199,7 +199,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  #ifdef F_GETOWN_EX
      struct f_owner_ex fox;
      struct target_f_owner_ex *target_fox;
-@@ -7089,6 +7034,7 @@ static abi_long do_fcntl(int fd, int cmd
+@@ -7138,6 +7083,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  
      switch(cmd) {
      case TARGET_F_GETLK:
@@ -207,7 +207,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          ret = copy_from_user_flock(&fl64, arg);
          if (ret) {
              return ret;
-@@ -7098,32 +7044,11 @@ static abi_long do_fcntl(int fd, int cmd
+@@ -7147,32 +7093,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
              ret = copy_to_user_flock(arg, &fl64);
          }
          break;
@@ -241,7 +241,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          if (ret) {
              return ret;
          }
-@@ -7348,7 +7273,7 @@ static inline abi_long target_truncate64
+@@ -7401,7 +7326,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +250,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  }
  #endif
  
-@@ -7362,7 +7287,7 @@ static inline abi_long target_ftruncate6
+@@ -7415,7 +7340,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -259,7 +259,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  }
  #endif
  
-@@ -8598,7 +8523,7 @@ static int do_getdents(abi_long dirfd, a
+@@ -8893,7 +8818,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -268,7 +268,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8651,7 +8576,7 @@ static int do_getdents(abi_long dirfd, a
+@@ -8946,7 +8871,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -277,7 +277,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
              break;
          }
  
-@@ -8685,7 +8610,7 @@ static int do_getdents64(abi_long dirfd,
+@@ -8980,7 +8905,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -286,7 +286,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8727,7 +8652,7 @@ static int do_getdents64(abi_long dirfd,
+@@ -9022,7 +8947,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -295,7 +295,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
              break;
          }
  
-@@ -11158,7 +11083,7 @@ static abi_long do_syscall1(CPUArchState
+@@ -11635,7 +11560,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -304,7 +304,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          unlock_user(p, arg2, ret);
          return ret;
      case TARGET_NR_pwrite64:
-@@ -11175,7 +11100,7 @@ static abi_long do_syscall1(CPUArchState
+@@ -11652,7 +11577,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -313,7 +313,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -11998,14 +11923,14 @@ static abi_long do_syscall1(CPUArchState
+@@ -12512,14 +12437,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
      case TARGET_NR_fcntl64:
      {
          int cmd;
@@ -333,7 +333,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          }
  #endif
  
-@@ -12015,7 +11940,7 @@ static abi_long do_syscall1(CPUArchState
+@@ -12529,7 +12454,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          }
  
          switch(arg2) {
@@ -342,7 +342,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
-@@ -12026,8 +11951,8 @@ static abi_long do_syscall1(CPUArchState
+@@ -12540,8 +12465,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              }
  	    break;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
index e85f8202e9..8f0dc151cd 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From dc2a8ccd440ee3741b61606eafed3f7e092f4312 Mon Sep 17 00:00:00 2001
+From b3f71663bc254a6f4fe3349005330de4d33d2025 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH 03/12] apic: fixup fallthrough to PIC
+Subject: [PATCH] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -29,11 +29,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/hw/intc/apic.c
-===================================================================
---- qemu-8.0.0.orig/hw/intc/apic.c
-+++ qemu-8.0.0/hw/intc/apic.c
-@@ -607,7 +607,7 @@ int apic_accept_pic_intr(DeviceState *de
+diff --git a/hw/intc/apic.c b/hw/intc/apic.c
+index ac3d47d23..8978af6ab 100644
+--- a/hw/intc/apic.c
++++ b/hw/intc/apic.c
+@@ -607,7 +607,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
index f981a64a54..900c5d27e7 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From d8265abdce5dc2bf74b3fccdf2b7257b4f3894f0 Mon Sep 17 00:00:00 2001
+From 99fdde4952364a319352c226430f6d1cfabb91fa Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 28 Aug 2019 19:56:28 +0800
-Subject: [PATCH 04/12] configure: Add pkg-config handling for libgcrypt
+Subject: [PATCH] configure: Add pkg-config handling for libgcrypt
 
 libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
 handling for libgcrypt.
@@ -14,10 +14,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.1.0/meson.build
-===================================================================
---- qemu-8.1.0.orig/meson.build
-+++ qemu-8.1.0/meson.build
+diff --git a/meson.build b/meson.build
+index a9c4f2824..d580334f5 100644
+--- a/meson.build
++++ b/meson.build
 @@ -1481,7 +1481,7 @@ endif
  if not gnutls_crypto.found()
    if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
index 38aa4c3bbe..307fa1c15e 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From f39e7bfc5ed07b5ecaeb705c4eae4855ca120d47 Mon Sep 17 00:00:00 2001
+From a6ae40e7cca987096eab707a7af099386bcbd43f Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
-Subject: [PATCH 05/12] qemu: Do not include file if not exists
+Subject: [PATCH] qemu: Do not include file if not exists
 
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: qemu-8.0.0/linux-user/syscall.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/syscall.c
-+++ qemu-8.0.0/linux-user/syscall.c
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 9353268cc..48320fc74 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
 @@ -115,7 +115,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 5d1d7c6881..131323287b 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,8 +1,7 @@
-From 375cae3dd6151ef33cae8f243f6a2c2da6c0c356 Mon Sep 17 00:00:00 2001
+From c496cedf0ad60e793763ea0230b739e83dd17006 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
-Subject: [PATCH 06/12] qemu: Add some user space mmap tweaks to address musl
- 32 bit
+Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
 
 When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
 infinite loop of mremap calls of ever decreasing/increasing addresses.
@@ -23,11 +22,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  linux-user/mmap.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
-Index: qemu-8.0.0/linux-user/mmap.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/mmap.c
-+++ qemu-8.0.0/linux-user/mmap.c
-@@ -776,12 +776,16 @@ abi_long target_mremap(abi_ulong old_add
+diff --git a/linux-user/mmap.c b/linux-user/mmap.c
+index 9aab48d4a..613263274 100644
+--- a/linux-user/mmap.c
++++ b/linux-user/mmap.c
+@@ -829,12 +829,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
index d3f965e070..699284adc6 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 50bab5c2605b609ea7ea154f57a9be96d656725a Mon Sep 17 00:00:00 2001
+From 6d9b5fda4bfb6e50e2a420d5e40562a9d0455191 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
-Subject: [PATCH 07/12] qemu: Determinism fixes
+Subject: [PATCH] qemu: Determinism fixes
 
 When sources are included within debug information, a couple of areas of the
 qemu build are not reproducible due to either full buildpaths or timestamps.
@@ -16,11 +16,11 @@ RP 2021/3/1
  scripts/decodetree.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/scripts/decodetree.py
-===================================================================
---- qemu-8.0.0.orig/scripts/decodetree.py
-+++ qemu-8.0.0/scripts/decodetree.py
-@@ -1328,7 +1328,7 @@ def main():
+diff --git a/scripts/decodetree.py b/scripts/decodetree.py
+index e8b72da3a..5cd86b142 100644
+--- a/scripts/decodetree.py
++++ b/scripts/decodetree.py
+@@ -1558,7 +1558,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
diff --git a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
index a84364ccc1..b7cf1f5ca0 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 2bf9388b801d4389e2d57e95a7897bfc1c42786e Mon Sep 17 00:00:00 2001
+From a7747612b0fd31a91b35a1b478fab4ddbfb08c49 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
-Subject: [PATCH 08/12] tests/meson.build: use relative path to refer to files
+Subject: [PATCH] tests/meson.build: use relative path to refer to files
 
 Fix error like:
 Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  tests/unit/meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: qemu-8.0.0/tests/unit/meson.build
-===================================================================
---- qemu-8.0.0.orig/tests/unit/meson.build
-+++ qemu-8.0.0/tests/unit/meson.build
+diff --git a/tests/unit/meson.build b/tests/unit/meson.build
+index 93977cc32..155a57cbb 100644
+--- a/tests/unit/meson.build
++++ b/tests/unit/meson.build
 @@ -46,7 +46,7 @@ tests = {
    'test-keyval': [testqapi],
    'test-logging': [],
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 4de6cc2445..6893d705e0 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From ebf4bb2f51da83af0c61480414cfa156f7308b34 Mon Sep 17 00:00:00 2001
+From 91af816fce072161718d759bf6bc6c0401bddd92 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
-Subject: [PATCH 09/12] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
+Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
  systems
 
 linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
@@ -18,10 +18,10 @@ Cc: Michael S. Tsirkin <mst@redhat.com>
  util/mmap-alloc.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
-Index: qemu-8.0.0/util/mmap-alloc.c
-===================================================================
---- qemu-8.0.0.orig/util/mmap-alloc.c
-+++ qemu-8.0.0/util/mmap-alloc.c
+diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
+index ed14f9c64..038f5b4b5 100644
+--- a/util/mmap-alloc.c
++++ b/util/mmap-alloc.c
 @@ -10,14 +10,18 @@
   * later.  See the COPYING file in the top-level directory.
   */
diff --git a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
index 6caf35b634..01e3d3ef34 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
@@ -1,12 +1,12 @@
-CVE: CVE-2022-1050
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20220403095234.2210-1-yuval.shaia.ml@gmail.com/]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dbdef95c272e8f3ec037c3db4197c66002e30995 Mon Sep 17 00:00:00 2001
+From 3ab82e3d7c4ffa1e38b2b5fb19cfba1f5c0d9c28 Mon Sep 17 00:00:00 2001
 From: Yuval Shaia <yuval.shaia.ml@gmail.com>
 Date: Sun, 3 Apr 2022 12:52:34 +0300
 Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
 
+CVE: CVE-2022-1050
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20220403095234.2210-1-yuval.shaia.ml@gmail.com/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 Guest driver might execute HW commands when shared buffers are not yet
 allocated.
 This could happen on purpose (malicious guest) or because of some other
@@ -17,15 +17,16 @@ Fixes: CVE-2022-1050
 
 Reported-by: Raven <wxhusst@gmail.com>
 Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+
 ---
  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
-===================================================================
---- qemu-8.0.0.orig/hw/rdma/vmw/pvrdma_cmd.c
-+++ qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
-@@ -782,6 +782,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index d385d18d9..116adddec 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
+@@ -786,6 +786,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
              goto out;
      }
  
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
index 112eb92593..55435c93d1 100644
--- a/meta/recipes-devtools/qemu/qemu/cross.patch
+++ b/meta/recipes-devtools/qemu/qemu/cross.patch
@@ -1,7 +1,7 @@
-From 76c3fc4c87231bed32974ebbbdb5079cff45a6b7 Mon Sep 17 00:00:00 2001
+From 86544cce3993b157180ac7aebd202374f08d54ff Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 5 Jan 2021 23:00:14 +0000
-Subject: [PATCH 12/12] qemu: Upgrade 5.1.0->5.2.0
+Subject: [PATCH] qemu: Upgrade 5.1.0->5.2.0
 
 We need to be able to trigger configure's cross code but we don't want
 to set cross_prefix as it does other things we don't want. Patch things
@@ -14,11 +14,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  configure | 4 ----
  1 file changed, 4 deletions(-)
 
-Index: qemu-8.0.0/configure
-===================================================================
---- qemu-8.0.0.orig/configure
-+++ qemu-8.0.0/configure
-@@ -2590,7 +2590,6 @@ if test "$skip_meson" = no; then
+diff --git a/configure b/configure
+index bc8e114c4..0e8dc7d10 100755
+--- a/configure
++++ b/configure
+@@ -1892,7 +1892,6 @@ if test "$skip_meson" = no; then
    echo "widl = [$(meson_quote $widl)]" >> $cross
    echo "windres = [$(meson_quote $windres)]" >> $cross
    echo "windmc = [$(meson_quote $windmc)]" >> $cross
@@ -26,7 +26,7 @@ Index: qemu-8.0.0/configure
      cross_arg="--cross-file config-meson.cross"
      echo "[host_machine]" >> $cross
      echo "system = '$targetos'" >> $cross
-@@ -2608,9 +2607,6 @@ if test "$skip_meson" = no; then
+@@ -1910,9 +1909,6 @@ if test "$skip_meson" = no; then
      else
          echo "endian = 'little'" >> $cross
      fi
diff --git a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch b/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
index 0cbaea07ca..d0e87af895 100644
--- a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
+++ b/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
@@ -1,9 +1,18 @@
+From 1b83d8f19c01bcf438d8adb8b090322c6074cc8f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 24 Aug 2023 16:41:20 +0100
+Subject: [PATCH] qemu: Upgrade 8.0.4 -> 8.1.0
+
 Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
 
-Index: qemu-8.1.0/configure
-===================================================================
---- qemu-8.1.0.orig/configure
-+++ qemu-8.1.0/configure
+---
+ configure | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index 133f4e323..bc8e114c4 100755
+--- a/configure
++++ b/configure
 @@ -1032,12 +1032,7 @@ then
      exit 1
  fi
diff --git a/meta/recipes-devtools/qemu/qemu/fixmips.patch b/meta/recipes-devtools/qemu/qemu/fixmips.patch
index 01546d1030..55a089eff7 100644
--- a/meta/recipes-devtools/qemu/qemu/fixmips.patch
+++ b/meta/recipes-devtools/qemu/qemu/fixmips.patch
@@ -1,13 +1,22 @@
-Patch to fix mips boot hangs where virtio appears broken. Patch under discussion upstream. 
+From 0ab620b77d7c17dfe161dbc6c74264aba7d98fde Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 6 Sep 2023 17:49:07 +0100
+Subject: [PATCH] qemu: Add patches to resolve x86 and then mips boot issues
+
+Patch to fix mips boot hangs where virtio appears broken. Patch under discussion upstream.
 Regression is introduced by other fixes to 8.1.0 to get x86 boots working.
 
 Upstream-Status: Pending [https://lore.kernel.org/qemu-devel/6c956b90-5a13-db96-9c02-9834a512fe6f@linaro.org/]
 
-Index: qemu-8.1.0/softmmu/physmem.c
-===================================================================
---- qemu-8.1.0.orig/softmmu/physmem.c
-+++ qemu-8.1.0/softmmu/physmem.c
-@@ -2517,7 +2517,7 @@ static void tcg_commit(MemoryListener *l
+---
+ softmmu/physmem.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 18277ddd6..ec31ebcb5 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -2517,7 +2517,7 @@ static void tcg_commit(MemoryListener *listener)
       * That said, the listener is also called during realize, before
       * all of the tcg machinery for run-on is initialized: thus halt_cond.
       */
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.2.bb b/meta/recipes-devtools/qemu/qemu_8.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.3.bb
-- 
2.42.0


--===============5163544547795088655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-8.1.2-8.1.3.patch"

RnJvbSAyZjg0ZTBlZGJlMzcyZjIzMDg5ZWQ4Y2QxZmJkZmNlZTdmYzMzZDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDg6NDE6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11OiB1cGdyYWRlIDguMS4yIC0+IDguMS4zCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUuaW5jICAgICAgICAgICB8ICAyICstCiAuLi5uLWVudmlyb25tZW50LXNwYWNlLXRv
LWJvb3QtbG9hZGVyLXEucGF0Y2ggfCAxMiArKy0tCiAuLi5jZS11c2Utb2YtbGZzNjQtcmVsYXRl
ZC1mdW5jdGlvbnMtYW4ucGF0Y2ggfCA2MCArKysrKysrKystLS0tLS0tLS0tCiAuLi4vMDAwMy1h
cGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaCAgfCAxNCArKy0tLQogLi4uZGQtcGtn
LWNvbmZpZy1oYW5kbGluZy1mb3ItbGliZ2NyeXB0LnBhdGNoIHwgMTIgKystLQogLi4ubXUtRG8t
bm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoIHwgMTIgKystLQogLi4uZXItc3Bh
Y2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoIHwgMTUgKysrLS0KIC4uLi9xZW11
LzAwMDctcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCAgICB8IDE0ICsrLS0tCiAuLi5kLXVz
ZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2ggfCAxMiArKy0tCiAuLi5hbmQt
TUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggfCAxMiArKy0tCiAuLi50LWFn
YWluc3QtYnVnZ3ktb3ItbWFsaWNpb3VzLWd1ZXN0LWQucGF0Y2ggfCAyMSArKystLS0tCiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2Nyb3NzLnBhdGNoICAgfCAxNiArKy0tLQogLi4u
L3FlbXUvcWVtdS9maXhlZG1lc29uLnBhdGNoICAgICAgICAgICAgICAgIHwgMTcgKysrKy0tCiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeG1pcHMucGF0Y2ggfCAyMSArKysrKy0t
CiAuLi4vcWVtdS97cWVtdV84LjEuMi5iYiA9PiBxZW11XzguMS4zLmJifSAgICAgfCAgMAogMTUg
ZmlsZXMgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDExMSBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdV84LjEuMi5iYiA9PiBxZW11XzguMS4z
LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCmluZGV4IDVhYjJjYjgz
YjQuLmQ2YTNjZjQ3YjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCkBAIC0zNyw3
ICszNyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQ
Vn0udGFyLnh6IFwKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCiAKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0MTUyNmE3NjQ1NzZlYjQ5
NGQyZmY1ZWM0NmFlYjI1M2U2MmVhMjkwMzVkMWMyM2MwYThhZjRlNmNkNGYwODciCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDNjYzE3NjgwNDEwNTU4NmY3NGY5MDM5OGYzNGU5Zjg1Nzg3ZGZmNDAw
ZDNiNjQwZDgxZjc3NzlmYmUyNjViYiIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0g
IiBmaWxlOi8vY3Jvc3MucGF0Y2giCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAi
IGZpbGU6Ly9jcm9zcy5wYXRjaCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290
LWxvYWRlci1xLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFl
bXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gK
aW5kZXggYzY1NTA4MDE3ZC4uM2QzMDg2YjRiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNl
LXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9h
ZGVyLXEucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGRlNjRhZjgyOTUwYTY5MDhmOTQwN2Rm
YzkyYjgzYzE3ZTJhZjNlYWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJlZTlkMGZm
ODIxZTUxMjQzNjRjYWY1YzUyODA2OGUwM2E3NTdjYjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBKYXNvbiBXZXNzZWwgPGphc29uLndlc3NlbEB3aW5kcml2ZXIuY29tPgogRGF0ZTog
RnJpLCAyOCBNYXIgMjAxNCAxNzo0Mjo0MyArMDgwMAotU3ViamVjdDogW1BBVENIIDAxLzEyXSBx
ZW11OiBBZGQgYWRkaXRpb24gZW52aXJvbm1lbnQgc3BhY2UgdG8gYm9vdCBsb2FkZXIKK1N1Ympl
Y3Q6IFtQQVRDSF0gcWVtdTogQWRkIGFkZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJvb3Qg
bG9hZGVyCiAgcWVtdS1zeXN0ZW0tbWlwcwogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlh
dGUgLSBPRSB1c2VzIGRlZXAgcGF0aHMKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAgaHcvbWlwcy9tYWx0YS5jIHwg
MiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCi1J
bmRleDogcWVtdS04LjAuMC9ody9taXBzL21hbHRhLmMKLT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBxZW11LTgu
MC4wLm9yaWcvaHcvbWlwcy9tYWx0YS5jCi0rKysgcWVtdS04LjAuMC9ody9taXBzL21hbHRhLmMK
K2RpZmYgLS1naXQgYS9ody9taXBzL21hbHRhLmMgYi9ody9taXBzL21hbHRhLmMKK2luZGV4IGY5
NjE4ZmE1Zi4uZGQyZGQzNWU1IDEwMDY0NAorLS0tIGEvaHcvbWlwcy9tYWx0YS5jCisrKysgYi9o
dy9taXBzL21hbHRhLmMKIEBAIC02NCw3ICs2NCw3IEBACiAgI2RlZmluZSBFTlZQX1BBRERSICAg
ICAgICAgIDB4MjAwMAogICNkZWZpbmUgRU5WUF9WQUREUiAgICAgICAgICBjcHVfbWlwc19waHlz
X3RvX2tzZWcwKE5VTEwsIEVOVlBfUEFERFIpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDItbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxh
dGVkLWZ1bmN0aW9ucy1hbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwMi1saW51eC11c2VyLVJlcGxhY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQtZnVuY3Rpb25zLWFu
LnBhdGNoCmluZGV4IGNlYWU2N2JlNjQuLmRjYTdhMjM5YzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1saW51eC11c2VyLVJlcGxhY2UtdXNlLW9mLWxm
czY0LXJlbGF0ZWQtZnVuY3Rpb25zLWFuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwMi1saW51eC11c2VyLVJlcGxhY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQt
ZnVuY3Rpb25zLWFuLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJvbSA3MWYxNDkwMjI1NmUzYzM1
Mjk3MTBiNzEzZTFlYTQzMTAwYmY0YzQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBk
MjQyZTliODcyMjMxMjg1YWIzZjFlZDVjMjY0MDZlZjA1NTAxMmUzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwg
MTcgRGVjIDIwMjIgMDg6Mzc6NDYgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAyLzJdIGxpbnV4LXVz
ZXI6IFJlcGxhY2UgdXNlIG9mIGxmczY0IHJlbGF0ZWQgZnVuY3Rpb25zIGFuZAotIG1hY3Jvcwor
U3ViamVjdDogW1BBVENIXSBsaW51eC11c2VyOiBSZXBsYWNlIHVzZSBvZiBsZnM2NCByZWxhdGVk
IGZ1bmN0aW9ucyBhbmQgbWFjcm9zCiAKIEJ1aWxkcyBkZWZpbmVzIC1EX0ZJTEVfT0ZGU0VUX0JJ
VFM9NjQgd2hpY2ggbWFrZXMgdGhlIG9yaWdpbmFsIGZ1bmN0aW9ucwogYW5mIG1hY3JvcyBiZWhh
dmUgc2FtZSBhcyB0aGVpciA2NCBzdWZmaXhlZCBjb3VudGVycGFydHMuIFRoaXMgYWxzbwpAQCAt
MTIsMTUgKzExLDE2IEBAIGZ1bmN0aW9ucyBhcmUgbm8gbW9yZSBhdmFpbGFibGUgdW5kZXIgX0dO
VV9TT1VSQ0UgZmVhdHVyZSBtYWNybwogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBz
Oi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIyLTEyL21zZzAyODQx
Lmh0bWxdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogQ2M6
IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KKwogLS0tCiAgbGludXgtdXNlci9z
eXNjYWxsLmMgfCAxNTMgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxMTQgZGVsZXRpb25zKC0pCiAK
LUluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0g
cWVtdS04LjAuMC5vcmlnL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi0rKysgcWVtdS04LjAuMC9saW51
eC11c2VyL3N5c2NhbGwuYwotQEAgLTc2MSw4ICs3NjEsOCBAQCBzYWZlX3N5c2NhbGw2KHNzaXpl
X3QsIGNvcHlfZmlsZV9yYW5nZSwKK2RpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBi
L2xpbnV4LXVzZXIvc3lzY2FsbC5jCitpbmRleCA0ODMyMGZjNzQuLmZjNTdiNjUwYiAxMDA2NDQK
Ky0tLSBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jCisrKysgYi9saW51eC11c2VyL3N5c2NhbGwuYwor
QEAgLTc2MSw4ICs3NjEsOCBAQCBzYWZlX3N5c2NhbGw2KHNzaXplX3QsIGNvcHlfZmlsZV9yYW5n
ZSwgaW50LCBpbmZkLCBsb2ZmX3QgKiwgcGlub2ZmLAogICAqLwogICNkZWZpbmUgc2FmZV9pb2N0
bCguLi4pIHNhZmVfc3lzY2FsbChfX05SX2lvY3RsLCBfX1ZBX0FSR1NfXykKICAvKiBTaW1pbGFy
bHkgZm9yIGZjbnRsLiBOb3RlIHRoYXQgY2FsbGVycyBtdXN0IGFsd2F5czoKQEAgLTMxLDcgKzMx
LDcgQEAgSW5kZXg6IHFlbXUtOC4wLjAvbGludXgtdXNlci9zeXNjYWxsLmMKICAgKiBUaGlzIHdp
bGwgdGhlbiB3b3JrIGFuZCB1c2UgYSA2NC1iaXQgb2Zmc2V0IGZvciBib3RoIDMyLWJpdCBhbmQg
NjQtYml0IGhvc3RzLgogICAqLwogICNpZmRlZiBfX05SX2ZjbnRsNjQKLUBAIC02ODEzLDEzICs2
ODEzLDEzIEBAIHN0YXRpYyBpbnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludAorQEAgLTY4
NjIsMTMgKzY4NjIsMTMgQEAgc3RhdGljIGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50
IGNtZCkKICAgICAgICAgIHJldCA9IGNtZDsKICAgICAgICAgIGJyZWFrOwogICAgICBjYXNlIFRB
UkdFVF9GX0dFVExLOgpAQCAtNDgsNyArNDgsNyBAQCBJbmRleDogcWVtdS04LjAuMC9saW51eC11
c2VyL3N5c2NhbGwuYwogICAgICAgICAgYnJlYWs7CiAgICAgIGNhc2UgVEFSR0VUX0ZfR0VUT1dO
OgogICAgICAgICAgcmV0ID0gRl9HRVRPV047Ci1AQCAtNjgzMywxNyArNjgzMyw2IEBAIHN0YXRp
YyBpbnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludAorQEAgLTY4ODIsMTcgKzY4ODIsNiBA
QCBzdGF0aWMgaW50IHRhcmdldF90b19ob3N0X2ZjbnRsX2NtZChpbnQgY21kKQogICAgICBjYXNl
IFRBUkdFVF9GX1NFVFNJRzoKICAgICAgICAgIHJldCA9IEZfU0VUU0lHOwogICAgICAgICAgYnJl
YWs7CkBAIC02Niw3ICs2Niw3IEBAIEluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2Fs
bC5jCiAgICAgIGNhc2UgVEFSR0VUX0ZfU0VUTEVBU0U6CiAgICAgICAgICByZXQgPSBGX1NFVExF
QVNFOwogICAgICAgICAgYnJlYWs7Ci1AQCAtNjg5NSw4ICs2ODg0LDggQEAgc3RhdGljIGludCB0
YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50CitAQCAtNjk0NCw4ICs2OTMzLDggQEAgc3RhdGlj
IGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKICAgICAgICogdGhlbSB0byA1
LCA2IGFuZCA3IGJlZm9yZSBtYWtpbmcgdGhlIHN5c2NhbGwoKS4gU2luY2Ugd2UgbWFrZSB0aGUK
ICAgICAgICogc3lzY2FsbCBkaXJlY3RseSwgYWRqdXN0IHRvIHdoYXQgaXMgc3VwcG9ydGVkIGJ5
IHRoZSBrZXJuZWwuCiAgICAgICAqLwpAQCAtNzcsNyArNzcsNyBAQCBJbmRleDogcWVtdS04LjAu
MC9saW51eC11c2VyL3N5c2NhbGwuYwogICAgICB9CiAgI2VuZGlmCiAgCi1AQCAtNjkyOSw1NSAr
NjkxOCwxMSBAQCBzdGF0aWMgaW50IGhvc3RfdG9fdGFyZ2V0X2Zsb2NrKGludCB0eXBlCitAQCAt
Njk3OCw1NSArNjk2NywxMSBAQCBzdGF0aWMgaW50IGhvc3RfdG9fdGFyZ2V0X2Zsb2NrKGludCB0
eXBlKQogICAgICByZXR1cm4gdHlwZTsKICB9CiAgCkBAIC0xMzYsNyArMTM2LDcgQEAgSW5kZXg6
IHFlbXUtOC4wLjAvbGludXgtdXNlci9zeXNjYWxsLmMKICAgICAgYWJpX3Nob3J0IGxfdHlwZTsK
ICAgICAgYWJpX3Nob3J0IGxfd2hlbmNlOwogICAgICBhYmlfbGxvbmcgbF9zdGFydDsKLUBAIC02
OTg1LDEwICs2OTMwLDEwIEBAIHN0cnVjdCB0YXJnZXRfb2FiaV9mbG9jazY0IHsKK0BAIC03MDM0
LDEwICs2OTc5LDEwIEBAIHN0cnVjdCB0YXJnZXRfb2FiaV9mbG9jazY0IHsKICAgICAgYWJpX2lu
dCAgIGxfcGlkOwogIH0gUUVNVV9QQUNLRUQ7CiAgCkBAIC0xNDksNyArMTQ5LDcgQEAgSW5kZXg6
IHFlbXUtOC4wLjAvbGludXgtdXNlci9zeXNjYWxsLmMKICAgICAgaW50IGxfdHlwZTsKICAKICAg
ICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0KFZFUklGWV9SRUFELCB0YXJnZXRfZmwsIHRhcmdldF9m
bG9ja19hZGRyLCAxKSkgewotQEAgLTcwMDksMTAgKzY5NTQsMTAgQEAgc3RhdGljIGlubGluZSBh
YmlfbG9uZyBjb3B5X2Zyb21fdXNlcl9vYQorQEAgLTcwNTgsMTAgKzcwMDMsMTAgQEAgc3RhdGlj
IGlubGluZSBhYmlfbG9uZyBjb3B5X2Zyb21fdXNlcl9vYWJpX2Zsb2NrNjQoc3RydWN0IGZsb2Nr
NjQgKmZsLAogICAgICByZXR1cm4gMDsKICB9CiAgCkBAIC0xNjMsNyArMTYzLDcgQEAgSW5kZXg6
IHFlbXUtOC4wLjAvbGludXgtdXNlci9zeXNjYWxsLmMKICAgICAgc2hvcnQgbF90eXBlOwogIAog
ICAgICBpZiAoIWxvY2tfdXNlcl9zdHJ1Y3QoVkVSSUZZX1dSSVRFLCB0YXJnZXRfZmwsIHRhcmdl
dF9mbG9ja19hZGRyLCAwKSkgewotQEAgLTcwMzAsMTAgKzY5NzUsMTAgQEAgc3RhdGljIGlubGlu
ZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfb2FiaQorQEAgLTcwNzksMTAgKzcwMjQsMTAgQEAgc3Rh
dGljIGlubGluZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfb2FiaV9mbG9jazY0KGFiaV91bG9uZyB0
YXJnZXRfZmxvY2tfYWRkciwKICB9CiAgI2VuZGlmCiAgCkBAIC0xNzYsNyArMTc2LDcgQEAgSW5k
ZXg6IHFlbXUtOC4wLjAvbGludXgtdXNlci9zeXNjYWxsLmMKICAgICAgaW50IGxfdHlwZTsKICAK
ICAgICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0KFZFUklGWV9SRUFELCB0YXJnZXRfZmwsIHRhcmdl
dF9mbG9ja19hZGRyLCAxKSkgewotQEAgLTcwNTQsMTAgKzY5OTksMTAgQEAgc3RhdGljIGlubGlu
ZSBhYmlfbG9uZyBjb3B5X2Zyb21fdXNlcl9mbAorQEAgLTcxMDMsMTAgKzcwNDgsMTAgQEAgc3Rh
dGljIGlubGluZSBhYmlfbG9uZyBjb3B5X2Zyb21fdXNlcl9mbG9jazY0KHN0cnVjdCBmbG9jazY0
ICpmbCwKICAgICAgcmV0dXJuIDA7CiAgfQogIApAQCAtMTkwLDcgKzE5MCw3IEBAIEluZGV4OiBx
ZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiAgICAgIHNob3J0IGxfdHlwZTsKICAKICAg
ICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0KFZFUklGWV9XUklURSwgdGFyZ2V0X2ZsLCB0YXJnZXRf
ZmxvY2tfYWRkciwgMCkpIHsKLUBAIC03MDc2LDcgKzcwMjEsNyBAQCBzdGF0aWMgaW5saW5lIGFi
aV9sb25nIGNvcHlfdG9fdXNlcl9mbG9jCitAQCAtNzEyNSw3ICs3MDcwLDcgQEAgc3RhdGljIGlu
bGluZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfZmxvY2s2NChhYmlfdWxvbmcgdGFyZ2V0X2Zsb2Nr
X2FkZHIsCiAgCiAgc3RhdGljIGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJp
X3Vsb25nIGFyZykKICB7CkBAIC0xOTksNyArMTk5LDcgQEAgSW5kZXg6IHFlbXUtOC4wLjAvbGlu
dXgtdXNlci9zeXNjYWxsLmMKICAjaWZkZWYgRl9HRVRPV05fRVgKICAgICAgc3RydWN0IGZfb3du
ZXJfZXggZm94OwogICAgICBzdHJ1Y3QgdGFyZ2V0X2Zfb3duZXJfZXggKnRhcmdldF9mb3g7Ci1A
QCAtNzA4OSw2ICs3MDM0LDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50
IGNtZAorQEAgLTcxMzgsNiArNzA4Myw3IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19mY250bChpbnQg
ZmQsIGludCBjbWQsIGFiaV91bG9uZyBhcmcpCiAgCiAgICAgIHN3aXRjaChjbWQpIHsKICAgICAg
Y2FzZSBUQVJHRVRfRl9HRVRMSzoKQEAgLTIwNyw3ICsyMDcsNyBAQCBJbmRleDogcWVtdS04LjAu
MC9saW51eC11c2VyL3N5c2NhbGwuYwogICAgICAgICAgcmV0ID0gY29weV9mcm9tX3VzZXJfZmxv
Y2soJmZsNjQsIGFyZyk7CiAgICAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKLUBAIC03MDk4LDMyICs3MDQ0LDExIEBAIHN0YXRpYyBhYmlfbG9uZyBkb19mY250bChp
bnQgZmQsIGludCBjbWQKK0BAIC03MTQ3LDMyICs3MDkzLDExIEBAIHN0YXRpYyBhYmlfbG9uZyBk
b19mY250bChpbnQgZmQsIGludCBjbWQsIGFiaV91bG9uZyBhcmcpCiAgICAgICAgICAgICAgcmV0
ID0gY29weV90b191c2VyX2Zsb2NrKGFyZywgJmZsNjQpOwogICAgICAgICAgfQogICAgICAgICAg
YnJlYWs7CkBAIC0yNDEsNyArMjQxLDcgQEAgSW5kZXg6IHFlbXUtOC4wLjAvbGludXgtdXNlci9z
eXNjYWxsLmMKICAgICAgICAgIGlmIChyZXQpIHsKICAgICAgICAgICAgICByZXR1cm4gcmV0Owog
ICAgICAgICAgfQotQEAgLTczNDgsNyArNzI3Myw3IEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcg
dGFyZ2V0X3RydW5jYXRlNjQKK0BAIC03NDAxLDcgKzczMjYsNyBAQCBzdGF0aWMgaW5saW5lIGFi
aV9sb25nIHRhcmdldF90cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgY29uc3QgY2hh
ciAqYXJnMQogICAgICAgICAgYXJnMiA9IGFyZzM7CiAgICAgICAgICBhcmczID0gYXJnNDsKICAg
ICAgfQpAQCAtMjUwLDcgKzI1MCw3IEBAIEluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lz
Y2FsbC5jCiAgfQogICNlbmRpZgogIAotQEAgLTczNjIsNyArNzI4Nyw3IEBAIHN0YXRpYyBpbmxp
bmUgYWJpX2xvbmcgdGFyZ2V0X2Z0cnVuY2F0ZTYKK0BAIC03NDE1LDcgKzczNDAsNyBAQCBzdGF0
aWMgaW5saW5lIGFiaV9sb25nIHRhcmdldF9mdHJ1bmNhdGU2NChDUFVBcmNoU3RhdGUgKmNwdV9l
bnYsIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICBhcmcyID0gYXJnMzsKICAgICAgICAgIGFyZzMg
PSBhcmc0OwogICAgICB9CkBAIC0yNTksNyArMjU5LDcgQEAgSW5kZXg6IHFlbXUtOC4wLjAvbGlu
dXgtdXNlci9zeXNjYWxsLmMKICB9CiAgI2VuZGlmCiAgCi1AQCAtODU5OCw3ICs4NTIzLDcgQEAg
c3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBkaXJmZCwgYQorQEAgLTg4OTMsNyArODgx
OCw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHMoYWJpX2xvbmcgZGlyZmQsIGFiaV9sb25nIGFy
ZzIsIGFiaV9sb25nIGNvdW50KQogICAgICB2b2lkICp0ZGlycDsKICAgICAgaW50IGhsZW4sIGhv
ZmYsIHRvZmY7CiAgICAgIGludCBocmVjbGVuLCB0cmVjbGVuOwpAQCAtMjY4LDcgKzI2OCw3IEBA
IEluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiAgCiAgICAgIGhkaXJwID0g
Z190cnlfbWFsbG9jKGNvdW50KTsKICAgICAgaWYgKCFoZGlycCkgewotQEAgLTg2NTEsNyArODU3
Niw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHMoYWJpX2xvbmcgZGlyZmQsIGEKK0BAIC04OTQ2
LDcgKzg4NzEsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRpcmZkLCBhYmlf
bG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKICAgICAgICAgICAgICAgKiBSZXR1cm4gd2hhdCB3
ZSBoYXZlLCByZXNldHRpbmcgdGhlIGZpbGUgcG9pbnRlciB0byB0aGUKICAgICAgICAgICAgICAg
KiBsb2NhdGlvbiBvZiB0aGUgZmlyc3QgcmVjb3JkIG5vdCByZXR1cm5lZC4KICAgICAgICAgICAg
ICAgKi8KQEAgLTI3Nyw3ICsyNzcsNyBAQCBJbmRleDogcWVtdS04LjAuMC9saW51eC11c2VyL3N5
c2NhbGwuYwogICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgfQogIAotQEAgLTg2ODUsNyAr
ODYxMCw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJmZCwKK0BAIC04
OTgwLDcgKzg5MDUsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzNjQoYWJpX2xvbmcgZGlyZmQs
IGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNvdW50KQogICAgICB2b2lkICp0ZGlycDsKICAgICAg
aW50IGhsZW4sIGhvZmYsIHRvZmY7CiAgICAgIGludCBocmVjbGVuLCB0cmVjbGVuOwpAQCAtMjg2
LDcgKzI4Niw3IEBAIEluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiAgCiAg
ICAgIGhkaXJwID0gZ190cnlfbWFsbG9jKGNvdW50KTsKICAgICAgaWYgKCFoZGlycCkgewotQEAg
LTg3MjcsNyArODY1Miw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJm
ZCwKK0BAIC05MDIyLDcgKzg5NDcsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzNjQoYWJpX2xv
bmcgZGlyZmQsIGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNvdW50KQogICAgICAgICAgICAgICAq
IFJldHVybiB3aGF0IHdlIGhhdmUsIHJlc2V0dGluZyB0aGUgZmlsZSBwb2ludGVyIHRvIHRoZQog
ICAgICAgICAgICAgICAqIGxvY2F0aW9uIG9mIHRoZSBmaXJzdCByZWNvcmQgbm90IHJldHVybmVk
LgogICAgICAgICAgICAgICAqLwpAQCAtMjk1LDcgKzI5NSw3IEBAIEluZGV4OiBxZW11LTguMC4w
L2xpbnV4LXVzZXIvc3lzY2FsbC5jCiAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICB9CiAg
Ci1AQCAtMTExNTgsNyArMTEwODMsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BV
QXJjaFN0YXRlCitAQCAtMTE2MzUsNyArMTE1NjAsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lz
Y2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAg
ICAgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FRkFVTFQ7CiAgICAgICAgICAgICAgfQogICAg
ICAgICAgfQpAQCAtMzA0LDcgKzMwNCw3IEBAIEluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIv
c3lzY2FsbC5jCiAgICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcyLCByZXQpOwogICAgICAgICAg
cmV0dXJuIHJldDsKICAgICAgY2FzZSBUQVJHRVRfTlJfcHdyaXRlNjQ6Ci1AQCAtMTExNzUsNyAr
MTExMDAsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlCitAQCAt
MTE2NTIsNyArMTE1NzcsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0
YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICAgICAgICAgICAgICBy
ZXR1cm4gLVRBUkdFVF9FRkFVTFQ7CiAgICAgICAgICAgICAgfQogICAgICAgICAgfQpAQCAtMzEz
LDcgKzMxMyw3IEBAIEluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiAgICAg
ICAgICB1bmxvY2tfdXNlcihwLCBhcmcyLCAwKTsKICAgICAgICAgIHJldHVybiByZXQ7CiAgI2Vu
ZGlmCi1AQCAtMTE5OTgsMTQgKzExOTIzLDE0IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxs
MShDUFVBcmNoU3RhdGUKK0BAIC0xMjUxMiwxNCArMTI0MzcsMTQgQEAgc3RhdGljIGFiaV9sb25n
IGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJn
MSwKICAgICAgY2FzZSBUQVJHRVRfTlJfZmNudGw2NDoKICAgICAgewogICAgICAgICAgaW50IGNt
ZDsKQEAgLTMzMyw3ICszMzMsNyBAQCBJbmRleDogcWVtdS04LjAuMC9saW51eC11c2VyL3N5c2Nh
bGwuYwogICAgICAgICAgfQogICNlbmRpZgogIAotQEAgLTEyMDE1LDcgKzExOTQwLDcgQEAgc3Rh
dGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZQorQEAgLTEyNTI5LDcgKzEyNDU0
LDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2Vudiwg
aW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgIH0KICAKICAgICAgICAgIHN3aXRjaChh
cmcyKSB7CkBAIC0zNDIsNyArMzQyLDcgQEAgSW5kZXg6IHFlbXUtOC4wLjAvbGludXgtdXNlci9z
eXNjYWxsLmMKICAgICAgICAgICAgICByZXQgPSBjb3B5ZnJvbSgmZmwsIGFyZzMpOwogICAgICAg
ICAgICAgIGlmIChyZXQpIHsKICAgICAgICAgICAgICAgICAgYnJlYWs7Ci1AQCAtMTIwMjYsOCAr
MTE5NTEsOCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlCitAQCAt
MTI1NDAsOCArMTI0NjUsOCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0
YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICAgICAgICAgIH0KICAJ
ICAgIGJyZWFrOwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAzLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAzLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBh
dGNoCmluZGV4IGU4NWY4MjAyZTkuLjhmMGRjMTUxY2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMy1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDMtYXBpYy1maXh1
cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGRjMmE4Y2Nk
NDQwZWUzNzQxYjYxNjA2ZWFmZWQzZjdlMDkyZjQzMTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGIzZjcxNjYzYmMyNTRhNmY0ZmUzMzQ5MDA1MzMwZGU0ZDMzZDIwMjUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrIEFzc2Vsc3RpbmUgPG1hcmsuYXNzZWxzdGluZUB3
aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBGZWIgMjAxMyAxMTo0MzoyOCAtMDUwMAotU3Vi
amVjdDogW1BBVENIIDAzLzEyXSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKK1N1Ympl
Y3Q6IFtQQVRDSF0gYXBpYzogZml4dXAgZmFsbHRocm91Z2ggdG8gUElDCiAKIENvbW1pdCAwZTIx
ZTEyYmIzMTFjNGMxMDk1ZDAyNjlkYzJlZjgxMTk2Y2NiNjBhIFtEb24ndCByb3V0ZSBQSUMKIGlu
dGVycnVwdHMgdGhyb3VnaCB0aGUgbG9jYWwgQVBJQyBpZiB0aGUgbG9jYWwgQVBJQyBjb25maWcg
c2F5cyBzby5dCkBAIC0yOSwxMSArMjksMTEgQEAgU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUu
aGVAd2luZHJpdmVyLmNvbT4KICBody9pbnRjL2FwaWMuYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAotSW5kZXg6IHFlbXUtOC4wLjAvaHcv
aW50Yy9hcGljLmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBxZW11LTguMC4wLm9yaWcvaHcvaW50Yy9hcGlj
LmMKLSsrKyBxZW11LTguMC4wL2h3L2ludGMvYXBpYy5jCi1AQCAtNjA3LDcgKzYwNyw3IEBAIGlu
dCBhcGljX2FjY2VwdF9waWNfaW50cihEZXZpY2VTdGF0ZSAqZGUKK2RpZmYgLS1naXQgYS9ody9p
bnRjL2FwaWMuYyBiL2h3L2ludGMvYXBpYy5jCitpbmRleCBhYzNkNDdkMjMuLjg5NzhhZjZhYiAx
MDA2NDQKKy0tLSBhL2h3L2ludGMvYXBpYy5jCisrKysgYi9ody9pbnRjL2FwaWMuYworQEAgLTYw
Nyw3ICs2MDcsNyBAQCBpbnQgYXBpY19hY2NlcHRfcGljX2ludHIoRGV2aWNlU3RhdGUgKmRldikK
ICAgICAgQVBJQ0NvbW1vblN0YXRlICpzID0gQVBJQyhkZXYpOwogICAgICB1aW50MzJfdCBsdnQw
OwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LWNv
bmZpZ3VyZS1BZGQtcGtnLWNvbmZpZy1oYW5kbGluZy1mb3ItbGliZ2NyeXB0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LWNvbmZpZ3VyZS1BZGQtcGtnLWNvbmZp
Zy1oYW5kbGluZy1mb3ItbGliZ2NyeXB0LnBhdGNoCmluZGV4IGY5ODFhNjRhNTQuLjkwMGM1ZDI3
ZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1jb25m
aWd1cmUtQWRkLXBrZy1jb25maWctaGFuZGxpbmctZm9yLWxpYmdjcnlwdC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtY29uZmlndXJlLUFkZC1wa2ctY29u
ZmlnLWhhbmRsaW5nLWZvci1saWJnY3J5cHQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGQ4
MjY1YWJkY2U1ZGMyYmY3NGIzZmNjZGYyYjcyNTdiNGYzODk0ZjAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDk5ZmRkZTQ5NTIzNjRhMzE5MzUyYzIyNjQzMGY2ZDFjZmFiYjkxZmEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogV2VkLCAyOCBBdWcgMjAxOSAxOTo1NjoyOCArMDgwMAotU3ViamVjdDogW1BBVENI
IDA0LzEyXSBjb25maWd1cmU6IEFkZCBwa2ctY29uZmlnIGhhbmRsaW5nIGZvciBsaWJnY3J5cHQK
K1N1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBBZGQgcGtnLWNvbmZpZyBoYW5kbGluZyBmb3Ig
bGliZ2NyeXB0CiAKIGxpYmdjcnlwdCBtYXkgYWxzbyBiZSBjb250cm9sbGVkIGJ5IHBrZy1jb25m
aWcsIHRoaXMgcGF0Y2ggYWRkcyBwa2ctY29uZmlnCiBoYW5kbGluZyBmb3IgbGliZ2NyeXB0LgpA
QCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhlIFpoZSA8emhlLmhlQHdpbmRyaXZl
ci5jb20+CiAgbWVzb24uYnVpbGQgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKLUluZGV4OiBxZW11LTguMS4wL21lc29uLmJ1aWxkCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gcWVtdS04LjEuMC5vcmlnL21lc29uLmJ1aWxkCi0rKysgcWVtdS04LjEuMC9t
ZXNvbi5idWlsZAorZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKK2luZGV4
IGE5YzRmMjgyNC4uZDU4MDMzNGY1IDEwMDY0NAorLS0tIGEvbWVzb24uYnVpbGQKKysrKyBiL21l
c29uLmJ1aWxkCiBAQCAtMTQ4MSw3ICsxNDgxLDcgQEAgZW5kaWYKICBpZiBub3QgZ251dGxzX2Ny
eXB0by5mb3VuZCgpCiAgICBpZiAobm90IGdldF9vcHRpb24oJ2djcnlwdCcpLmF1dG8oKSBvciBo
YXZlX3N5c3RlbSkgYW5kIG5vdCBnZXRfb3B0aW9uKCduZXR0bGUnKS5lbmFibGVkKCkKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LURvLW5vdC1p
bmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAwNS1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRj
aAppbmRleCAzOGFhNGMzYmJlLi4zMDdmYTFjMTVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1l
eGlzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFl
bXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBAIC0xLDcgKzEsNyBA
QAotRnJvbSBmMzllN2JmYzVlZDA3YjVlY2FlYjcwNWM0ZWFlNDg1NWNhMTIwZDQ3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNmFlNDBlN2NjYTk4NzA5NmVhYjcwN2E3YWYwOTkzODZi
Y2JkNDNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3NpeSBPYml0b3Rza3l5
IDxvb2JpdG90c0BjaXNjby5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIwIDIxOjIxOjM1ICsw
MjAwCi1TdWJqZWN0OiBbUEFUQ0ggMDUvMTJdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYg
bm90IGV4aXN0cworU3ViamVjdDogW1BBVENIXSBxZW11OiBEbyBub3QgaW5jbHVkZSBmaWxlIGlm
IG5vdCBleGlzdHMKIAogU2NyaXB0IGNvbmZpZ3VyZSBjaGVja3MgZm9yIGlmX2FsZy5oIGFuZCBj
aGVjayBmYWlsZWQgYnV0CiBpZl9hbGcuaCBzdGlsbCBpbmNsdWRlZC4KQEAgLTE2LDEwICsxNiwx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2FqYWxAd2luZHJpdmVyLmNv
bT4KICBsaW51eC11c2VyL3N5c2NhbGwuYyB8IDIgKysKICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCiAKLUluZGV4OiBxZW11LTguMC4wL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gcWVtdS04LjAuMC5vcmlnL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi0rKysgcWVt
dS04LjAuMC9saW51eC11c2VyL3N5c2NhbGwuYworZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvc3lz
Y2FsbC5jIGIvbGludXgtdXNlci9zeXNjYWxsLmMKK2luZGV4IDkzNTMyNjhjYy4uNDgzMjBmYzc0
IDEwMDY0NAorLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKKysrKyBiL2xpbnV4LXVzZXIvc3lz
Y2FsbC5jCiBAQCAtMTE1LDcgKzExNSw5IEBACiAgI2luY2x1ZGUgPGxpbnV4L2Jsa3BnLmg+CiAg
I2luY2x1ZGUgPG5ldHBhY2tldC9wYWNrZXQuaD4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vh
a3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDA2LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11
c2wucGF0Y2gKaW5kZXggNWQxZDdjNjg4MS4uMTMxMzIzMjg3YiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1t
bWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10
by1hZGRyZXNzLW11c2wucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDM3NWNhZTNkZDYxNTFl
ZjMzY2FlOGYyNDNmNmEyYzJkYTZjMGMzNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGM0OTZjZWRmMGFkNjBlNzkzNzYzZWEwMjMwYjczOWU4M2RkMTcwMDYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgOCBKYW4gMjAyMSAxNzoyNzowNiArMDAwMAotU3ViamVj
dDogW1BBVENIIDA2LzEyXSBxZW11OiBBZGQgc29tZSB1c2VyIHNwYWNlIG1tYXAgdHdlYWtzIHRv
IGFkZHJlc3MgbXVzbAotIDMyIGJpdAorU3ViamVjdDogW1BBVENIXSBxZW11OiBBZGQgc29tZSB1
c2VyIHNwYWNlIG1tYXAgdHdlYWtzIHRvIGFkZHJlc3MgbXVzbCAzMiBiaXQKIAogV2hlbiB1c2lu
ZyBxZW11LWkzODYgdG8gYnVpbGQgcWVtdXg4NiB3ZWJraXRndGsgb24gbXVzbCwgaXQgc2l0cyBp
biBhbgogaW5maW5pdGUgbG9vcCBvZiBtcmVtYXAgY2FsbHMgb2YgZXZlciBkZWNyZWFzaW5nL2lu
Y3JlYXNpbmcgYWRkcmVzc2VzLgpAQCAtMjMsMTEgKzIyLDExIEBAIFNpZ25lZC1vZmYtYnk6IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnCiAgbGludXgt
dXNlci9tbWFwLmMgfCAxMCArKysrKysrLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKIAotSW5kZXg6IHFlbXUtOC4wLjAvbGludXgtdXNlci9tbWFw
LmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KLS0tLSBxZW11LTguMC4wLm9yaWcvbGludXgtdXNlci9tbWFwLmMKLSsr
KyBxZW11LTguMC4wL2xpbnV4LXVzZXIvbW1hcC5jCi1AQCAtNzc2LDEyICs3NzYsMTYgQEAgYWJp
X2xvbmcgdGFyZ2V0X21yZW1hcChhYmlfdWxvbmcgb2xkX2FkZAorZGlmZiAtLWdpdCBhL2xpbnV4
LXVzZXIvbW1hcC5jIGIvbGludXgtdXNlci9tbWFwLmMKK2luZGV4IDlhYWI0OGQ0YS4uNjEzMjYz
Mjc0IDEwMDY0NAorLS0tIGEvbGludXgtdXNlci9tbWFwLmMKKysrKyBiL2xpbnV4LXVzZXIvbW1h
cC5jCitAQCAtODI5LDEyICs4MjksMTYgQEAgYWJpX2xvbmcgdGFyZ2V0X21yZW1hcChhYmlfdWxv
bmcgb2xkX2FkZHIsIGFiaV91bG9uZyBvbGRfc2l6ZSwKICAgICAgaW50IHByb3Q7CiAgICAgIHZv
aWQgKmhvc3RfYWRkcjsKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwNy1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDA3LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKaW5kZXgg
ZDNmOTY1ZTA3MC4uNjk5Mjg0YWRjNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA3LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0
Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDUwYmFiNWMyNjA1YjYwOWVhN2VhMTU0ZjU3YTliZTk2
ZDY1NjcyNWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZkOWI1ZmRhNGJmYjZlNTBl
MmE0MjBkNWU0MDU2MmE5ZDA0NTUxOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6
IE1vbiwgMSBNYXIgMjAyMSAxMzowMDo0NyArMDAwMAotU3ViamVjdDogW1BBVENIIDA3LzEyXSBx
ZW11OiBEZXRlcm1pbmlzbSBmaXhlcworU3ViamVjdDogW1BBVENIXSBxZW11OiBEZXRlcm1pbmlz
bSBmaXhlcwogCiBXaGVuIHNvdXJjZXMgYXJlIGluY2x1ZGVkIHdpdGhpbiBkZWJ1ZyBpbmZvcm1h
dGlvbiwgYSBjb3VwbGUgb2YgYXJlYXMgb2YgdGhlCiBxZW11IGJ1aWxkIGFyZSBub3QgcmVwcm9k
dWNpYmxlIGR1ZSB0byBlaXRoZXIgZnVsbCBidWlsZHBhdGhzIG9yIHRpbWVzdGFtcHMuCkBAIC0x
NiwxMSArMTYsMTEgQEAgUlAgMjAyMS8zLzEKICBzY3JpcHRzL2RlY29kZXRyZWUucHkgfCAyICst
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKLUluZGV4
OiBxZW11LTguMC4wL3NjcmlwdHMvZGVjb2RldHJlZS5weQotPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIHFlbXUt
OC4wLjAub3JpZy9zY3JpcHRzL2RlY29kZXRyZWUucHkKLSsrKyBxZW11LTguMC4wL3NjcmlwdHMv
ZGVjb2RldHJlZS5weQotQEAgLTEzMjgsNyArMTMyOCw3IEBAIGRlZiBtYWluKCk6CitkaWZmIC0t
Z2l0IGEvc2NyaXB0cy9kZWNvZGV0cmVlLnB5IGIvc2NyaXB0cy9kZWNvZGV0cmVlLnB5CitpbmRl
eCBlOGI3MmRhM2EuLjVjZDg2YjE0MiAxMDA2NDQKKy0tLSBhL3NjcmlwdHMvZGVjb2RldHJlZS5w
eQorKysrIGIvc2NyaXB0cy9kZWNvZGV0cmVlLnB5CitAQCAtMTU1OCw3ICsxNTU4LDcgQEAgZGVm
IG1haW4oKToKICAgICAgdG9wcGF0ID0gRXhjTXVsdGlQYXR0ZXJuKDApCiAgCiAgICAgIGZvciBm
aWxlbmFtZSBpbiBhcmdzOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA4LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRv
LWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtdGVzdHMt
bWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaAppbmRl
eCBhODQzNjRjY2MxLi5iN2NmMWY1Y2EwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDgtdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8t
cmVmZXItdG8tZmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDgtdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmls
ZS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMmJmOTM4OGI4MDFkNDM4OWUyZDU3ZTk1YTc4
OTdiZmMxYzQyNzg2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTc3NDc2MTJiMGZk
MzFhOTFiMzVhMWI0NzhmYWI0ZGRiZmIwOGM0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUs
IDE0IEphbiAyMDIxIDA2OjMzOjA0ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMDgvMTJdIHRlc3Rz
L21lc29uLmJ1aWxkOiB1c2UgcmVsYXRpdmUgcGF0aCB0byByZWZlciB0byBmaWxlcworU3ViamVj
dDogW1BBVENIXSB0ZXN0cy9tZXNvbi5idWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIg
dG8gZmlsZXMKIAogRml4IGVycm9yIGxpa2U6CiBGYXRhbCBlcnJvcjogY2FuJ3QgY3JlYXRlIHRl
c3RzL3B0aW1lci10ZXN0LnAvLi4uX3FlbXUtNS4yLjBfaHdfY29yZV9wdGltZXIuYy5vOiBGaWxl
IG5hbWUgdG9vIGxvbmcKQEAgLTE3LDEwICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBDaGFuZ3Fp
bmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogIHRlc3RzL3VuaXQvbWVzb24uYnVp
bGQgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCi1JbmRleDogcWVtdS04LjAuMC90ZXN0cy91bml0L21lc29uLmJ1aWxkCi09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Ci0tLS0gcWVtdS04LjAuMC5vcmlnL3Rlc3RzL3VuaXQvbWVzb24uYnVpbGQKLSsrKyBxZW11
LTguMC4wL3Rlc3RzL3VuaXQvbWVzb24uYnVpbGQKK2RpZmYgLS1naXQgYS90ZXN0cy91bml0L21l
c29uLmJ1aWxkIGIvdGVzdHMvdW5pdC9tZXNvbi5idWlsZAoraW5kZXggOTM5NzdjYzMyLi4xNTVh
NTdjYmIgMTAwNjQ0CistLS0gYS90ZXN0cy91bml0L21lc29uLmJ1aWxkCisrKysgYi90ZXN0cy91
bml0L21lc29uLmJ1aWxkCiBAQCAtNDYsNyArNDYsNyBAQCB0ZXN0cyA9IHsKICAgICd0ZXN0LWtl
eXZhbCc6IFt0ZXN0cWFwaV0sCiAgICAndGVzdC1sb2dnaW5nJzogW10sCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDktRGVmaW5lLU1BUF9TWU5DLWFuZC1N
QVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwOS1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURB
VEUtb24tbmVlZGVkLWxpLnBhdGNoCmluZGV4IDRkZTZjYzI0NDUuLjY4OTNkNzA1ZTAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOS1EZWZpbmUtTUFQX1NZ
TkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOS1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9T
SEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBl
YmY0YmIyZjUxZGE4M2FmMGM2MTQ4MDQxNGNmYTE1NmY3MzA4YjM0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA5MWFmODE2ZmNlMDcyMTYxNzE4ZDc1OWJmNmJjNmMwNDAxYmRkZDkyIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IE1vbiwgMjEgTWFyIDIwMjIgMTA6MDk6MzggLTA3MDAKLVN1YmplY3Q6IFtQQVRD
SCAwOS8xMl0gRGVmaW5lIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5lZWRl
ZCBsaW51eAorU3ViamVjdDogW1BBVENIXSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURf
VkFMSURBVEUgb24gbmVlZGVkIGxpbnV4CiAgc3lzdGVtcwogCiBsaW51eCBvbmx5IHdpcmVzIE1B
UF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIGZvciBhcmNoaXRlY3R1cmVzCkBAIC0xOCwx
MCArMTgsMTAgQEAgQ2M6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CiAgdXRp
bC9tbWFwLWFsbG9jLmMgfCAxMCArKysrKysrLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAotSW5kZXg6IHFlbXUtOC4wLjAvdXRpbC9tbWFwLWFs
bG9jLmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KLS0tLSBxZW11LTguMC4wLm9yaWcvdXRpbC9tbWFwLWFsbG9jLmMK
LSsrKyBxZW11LTguMC4wL3V0aWwvbW1hcC1hbGxvYy5jCitkaWZmIC0tZ2l0IGEvdXRpbC9tbWFw
LWFsbG9jLmMgYi91dGlsL21tYXAtYWxsb2MuYworaW5kZXggZWQxNGY5YzY0Li4wMzhmNWI0YjUg
MTAwNjQ0CistLS0gYS91dGlsL21tYXAtYWxsb2MuYworKysrIGIvdXRpbC9tbWFwLWFsbG9jLmMK
IEBAIC0xMCwxNCArMTAsMTggQEAKICAgKiBsYXRlci4gIFNlZSB0aGUgQ09QWUlORyBmaWxlIGlu
IHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgogICAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWh3LXB2cmRtYS1Qcm90ZWN0LWFnYWluc3QtYnVnZ3kt
b3ItbWFsaWNpb3VzLWd1ZXN0LWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMTAtaHctcHZyZG1hLVByb3RlY3QtYWdhaW5zdC1idWdneS1vci1tYWxpY2lvdXMtZ3Vl
c3QtZC5wYXRjaAppbmRleCA2Y2FmMzViNjM0Li4wMWUzZDNlZjM0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtaHctcHZyZG1hLVByb3RlY3QtYWdhaW5z
dC1idWdneS1vci1tYWxpY2lvdXMtZ3Vlc3QtZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMTAtaHctcHZyZG1hLVByb3RlY3QtYWdhaW5zdC1idWdneS1vci1t
YWxpY2lvdXMtZ3Vlc3QtZC5wYXRjaApAQCAtMSwxMiArMSwxMiBAQAotQ1ZFOiBDVkUtMjAyMi0x
MDUwCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cWVtdS1kZXZlbC8yMDIyMDQwMzA5NTIzNC4yMjEwLTEteXV2YWwuc2hhaWEubWxAZ21haWwuY29t
L10KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCi1G
cm9tIGRiZGVmOTVjMjcyZThmM2VjMDM3YzNkYjQxOTdjNjYwMDJlMzA5OTUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDNhYjgyZTNkN2M0ZmZhMWUzOGIyYjVmYjE5Y2ZiYTFmNWMwZDlj
MjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZdXZhbCBTaGFpYSA8eXV2YWwuc2hh
aWEubWxAZ21haWwuY29tPgogRGF0ZTogU3VuLCAzIEFwciAyMDIyIDEyOjUyOjM0ICswMzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGh3L3B2cmRtYTogUHJvdGVjdCBhZ2FpbnN0IGJ1Z2d5IG9yIG1hbGlj
aW91cyBndWVzdCBkcml2ZXIKIAorQ1ZFOiBDVkUtMjAyMi0xMDUwCitVcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIyMDQwMzA5
NTIzNC4yMjEwLTEteXV2YWwuc2hhaWEubWxAZ21haWwuY29tL10KK1NpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgorCiBHdWVzdCBkcml2ZXIgbWlnaHQgZXhl
Y3V0ZSBIVyBjb21tYW5kcyB3aGVuIHNoYXJlZCBidWZmZXJzIGFyZSBub3QgeWV0CiBhbGxvY2F0
ZWQuCiBUaGlzIGNvdWxkIGhhcHBlbiBvbiBwdXJwb3NlIChtYWxpY2lvdXMgZ3Vlc3QpIG9yIGJl
Y2F1c2Ugb2Ygc29tZSBvdGhlcgpAQCAtMTcsMTUgKzE3LDE2IEBAIEZpeGVzOiBDVkUtMjAyMi0x
MDUwCiAKIFJlcG9ydGVkLWJ5OiBSYXZlbiA8d3hodXNzdEBnbWFpbC5jb20+CiBTaWduZWQtb2Zm
LWJ5OiBZdXZhbCBTaGFpYSA8eXV2YWwuc2hhaWEubWxAZ21haWwuY29tPgorCiAtLS0KICBody9y
ZG1hL3Ztdy9wdnJkbWFfY21kLmMgfCA2ICsrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKIAotSW5kZXg6IHFlbXUtOC4wLjAvaHcvcmRtYS92bXcvcHZyZG1hX2NtZC5jCi09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Ci0tLS0gcWVtdS04LjAuMC5vcmlnL2h3L3JkbWEvdm13L3B2cmRtYV9jbWQuYwot
KysrIHFlbXUtOC4wLjAvaHcvcmRtYS92bXcvcHZyZG1hX2NtZC5jCi1AQCAtNzgyLDYgKzc4Miwx
MiBAQCBpbnQgcHZyZG1hX2V4ZWNfY21kKFBWUkRNQURldiAqZGV2KQorZGlmZiAtLWdpdCBhL2h3
L3JkbWEvdm13L3B2cmRtYV9jbWQuYyBiL2h3L3JkbWEvdm13L3B2cmRtYV9jbWQuYworaW5kZXgg
ZDM4NWQxOGQ5Li4xMTZhZGRkZWMgMTAwNjQ0CistLS0gYS9ody9yZG1hL3Ztdy9wdnJkbWFfY21k
LmMKKysrKyBiL2h3L3JkbWEvdm13L3B2cmRtYV9jbWQuYworQEAgLTc4Niw2ICs3ODYsMTIgQEAg
aW50IHB2cmRtYV9leGVjX2NtZChQVlJETUFEZXYgKmRldikKICAgICAgICAgICAgICBnb3RvIG91
dDsKICAgICAgfQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS9jcm9zcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvY3Jvc3MucGF0
Y2gKaW5kZXggMTEyZWI5MjU5My4uNTU0MzVjOTNkMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS9jcm9zcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11L2Nyb3NzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA3NmMzZmM0Yzg3
MjMxYmVkMzI5NzRlYmJiZGI1MDc5Y2ZmNDVhNmI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA4NjU0NGNjZTM5OTNiMTU3MTgwYWM3YWViZDIwMjM3NGYwOGQ1NGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDUgSmFuIDIwMjEgMjM6MDA6MTQgKzAwMDAKLVN1
YmplY3Q6IFtQQVRDSCAxMi8xMl0gcWVtdTogVXBncmFkZSA1LjEuMC0+NS4yLjAKK1N1YmplY3Q6
IFtQQVRDSF0gcWVtdTogVXBncmFkZSA1LjEuMC0+NS4yLjAKIAogV2UgbmVlZCB0byBiZSBhYmxl
IHRvIHRyaWdnZXIgY29uZmlndXJlJ3MgY3Jvc3MgY29kZSBidXQgd2UgZG9uJ3Qgd2FudAogdG8g
c2V0IGNyb3NzX3ByZWZpeCBhcyBpdCBkb2VzIG90aGVyIHRoaW5ncyB3ZSBkb24ndCB3YW50LiBQ
YXRjaCB0aGluZ3MKQEAgLTE0LDExICsxNCwxMSBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1
cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KICBjb25maWd1cmUgfCA0
IC0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKIAotSW5kZXg6IHFlbXUtOC4w
LjAvY29uZmlndXJlCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gcWVtdS04LjAuMC5vcmlnL2NvbmZpZ3VyZQot
KysrIHFlbXUtOC4wLjAvY29uZmlndXJlCi1AQCAtMjU5MCw3ICsyNTkwLDYgQEAgaWYgdGVzdCAi
JHNraXBfbWVzb24iID0gbm87IHRoZW4KK2RpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1
cmUKK2luZGV4IGJjOGUxMTRjNC4uMGU4ZGM3ZDEwIDEwMDc1NQorLS0tIGEvY29uZmlndXJlCisr
KysgYi9jb25maWd1cmUKK0BAIC0xODkyLDcgKzE4OTIsNiBAQCBpZiB0ZXN0ICIkc2tpcF9tZXNv
biIgPSBubzsgdGhlbgogICAgZWNobyAid2lkbCA9IFskKG1lc29uX3F1b3RlICR3aWRsKV0iID4+
ICRjcm9zcwogICAgZWNobyAid2luZHJlcyA9IFskKG1lc29uX3F1b3RlICR3aW5kcmVzKV0iID4+
ICRjcm9zcwogICAgZWNobyAid2luZG1jID0gWyQobWVzb25fcXVvdGUgJHdpbmRtYyldIiA+PiAk
Y3Jvc3MKQEAgLTI2LDcgKzI2LDcgQEAgSW5kZXg6IHFlbXUtOC4wLjAvY29uZmlndXJlCiAgICAg
IGNyb3NzX2FyZz0iLS1jcm9zcy1maWxlIGNvbmZpZy1tZXNvbi5jcm9zcyIKICAgICAgZWNobyAi
W2hvc3RfbWFjaGluZV0iID4+ICRjcm9zcwogICAgICBlY2hvICJzeXN0ZW0gPSAnJHRhcmdldG9z
JyIgPj4gJGNyb3NzCi1AQCAtMjYwOCw5ICsyNjA3LDYgQEAgaWYgdGVzdCAiJHNraXBfbWVzb24i
ID0gbm87IHRoZW4KK0BAIC0xOTEwLDkgKzE5MDksNiBAQCBpZiB0ZXN0ICIkc2tpcF9tZXNvbiIg
PSBubzsgdGhlbgogICAgICBlbHNlCiAgICAgICAgICBlY2hvICJlbmRpYW4gPSAnbGl0dGxlJyIg
Pj4gJGNyb3NzCiAgICAgIGZpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11L2ZpeGVkbWVzb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
L2ZpeGVkbWVzb24ucGF0Y2gKaW5kZXggMGNiYWVhMDdjYS4uZDBlODdhZjg5NSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXhlZG1lc29uLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4ZWRtZXNvbi5wYXRjaApAQCAtMSw5
ICsxLDE4IEBACitGcm9tIDFiODNkOGYxOWMwMWJjZjQzOGQ4YWRiOGIwOTAzMjJjNjA3NGNjOGYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IFRodSwgMjQgQXVnIDIwMjMgMTY6NDE6
MjAgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gcWVtdTogVXBncmFkZSA4LjAuNCAtPiA4LjEuMAor
CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3dvcmthcm91bmQsIHdvdWxkIG5lZWQg
YSByZWFsIGZpeCBmb3IgdXBzdHJlYW1dCiAKLUluZGV4OiBxZW11LTguMS4wL2NvbmZpZ3VyZQot
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQotLS0tIHFlbXUtOC4xLjAub3JpZy9jb25maWd1cmUKLSsrKyBxZW11LTguMS4w
L2NvbmZpZ3VyZQorLS0tCisgY29uZmlndXJlIHwgNyArLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvY29uZmlndXJl
IGIvY29uZmlndXJlCitpbmRleCAxMzNmNGUzMjMuLmJjOGUxMTRjNCAxMDA3NTUKKy0tLSBhL2Nv
bmZpZ3VyZQorKysrIGIvY29uZmlndXJlCiBAQCAtMTAzMiwxMiArMTAzMiw3IEBAIHRoZW4KICAg
ICAgZXhpdCAxCiAgZmkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvZml4bWlwcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4bWlw
cy5wYXRjaAppbmRleCAwMTU0NmQxMDMwLi41NWEwODllZmY3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeG1pcHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS9maXhtaXBzLnBhdGNoCkBAIC0xLDEzICsxLDIyIEBACi1QYXRj
aCB0byBmaXggbWlwcyBib290IGhhbmdzIHdoZXJlIHZpcnRpbyBhcHBlYXJzIGJyb2tlbi4gUGF0
Y2ggdW5kZXIgZGlzY3Vzc2lvbiB1cHN0cmVhbS4gCitGcm9tIDBhYjYyMGI3N2Q3YzE3ZGZlMTYx
ZGJjNmM3NDI2NGFiYTdkOThmZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IFdl
ZCwgNiBTZXAgMjAyMyAxNzo0OTowNyArMDEwMAorU3ViamVjdDogW1BBVENIXSBxZW11OiBBZGQg
cGF0Y2hlcyB0byByZXNvbHZlIHg4NiBhbmQgdGhlbiBtaXBzIGJvb3QgaXNzdWVzCisKK1BhdGNo
IHRvIGZpeCBtaXBzIGJvb3QgaGFuZ3Mgd2hlcmUgdmlydGlvIGFwcGVhcnMgYnJva2VuLiBQYXRj
aCB1bmRlciBkaXNjdXNzaW9uIHVwc3RyZWFtLgogUmVncmVzc2lvbiBpcyBpbnRyb2R1Y2VkIGJ5
IG90aGVyIGZpeGVzIHRvIDguMS4wIHRvIGdldCB4ODYgYm9vdHMgd29ya2luZy4KIAogVXBzdHJl
YW0tU3RhdHVzOiBQZW5kaW5nIFtodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzZj
OTU2YjkwLTVhMTMtZGI5Ni05YzAyLTk4MzRhNTEyZmU2ZkBsaW5hcm8ub3JnL10KIAotSW5kZXg6
IHFlbXUtOC4xLjAvc29mdG1tdS9waHlzbWVtLmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBxZW11LTguMS4w
Lm9yaWcvc29mdG1tdS9waHlzbWVtLmMKLSsrKyBxZW11LTguMS4wL3NvZnRtbXUvcGh5c21lbS5j
Ci1AQCAtMjUxNyw3ICsyNTE3LDcgQEAgc3RhdGljIHZvaWQgdGNnX2NvbW1pdChNZW1vcnlMaXN0
ZW5lciAqbAorLS0tCisgc29mdG1tdS9waHlzbWVtLmMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9zb2Z0bW11L3Bo
eXNtZW0uYyBiL3NvZnRtbXUvcGh5c21lbS5jCitpbmRleCAxODI3N2RkZDYuLmVjMzFlYmNiNSAx
MDA2NDQKKy0tLSBhL3NvZnRtbXUvcGh5c21lbS5jCisrKysgYi9zb2Z0bW11L3BoeXNtZW0uYwor
QEAgLTI1MTcsNyArMjUxNyw3IEBAIHN0YXRpYyB2b2lkIHRjZ19jb21taXQoTWVtb3J5TGlzdGVu
ZXIgKmxpc3RlbmVyKQogICAgICAgKiBUaGF0IHNhaWQsIHRoZSBsaXN0ZW5lciBpcyBhbHNvIGNh
bGxlZCBkdXJpbmcgcmVhbGl6ZSwgYmVmb3JlCiAgICAgICAqIGFsbCBvZiB0aGUgdGNnIG1hY2hp
bmVyeSBmb3IgcnVuLW9uIGlzIGluaXRpYWxpemVkOiB0aHVzIGhhbHRfY29uZC4KICAgICAgICov
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzguMS4yLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV84LjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV84LjEuMi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV84LjEuMy5iYgotLSAK
Mi40Mi4wCgo=

--===============5163544547795088655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (908 cached, 3 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-5d58d8048040feffda703385a7726b6e274897a8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5d58d8048040feffda703385a7726b6e274897a8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 505 Local 327 Mirrors 0 Missed 178 Current 610 (64% match, 84% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 75 stale sstate objects for arch core2-64...done.
Removing 41 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 677 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 739 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe libslirp-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-8.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 795 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe qemu-8.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 811 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libslirp-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 814 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 865 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 868 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 870 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 873 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 878 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 879 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 886 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 889 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 892 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 896 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 899 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 900 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 901 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 903 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 915 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 923 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 940 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 944 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 946 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 947 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 958 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 961 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 964 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 965 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 966 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 970 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 993 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 994 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1007 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1008 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1046 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1058 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1071 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1074 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe intltool-native-0.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe intltool-native-0.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1094 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-native-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe intltool-native-0.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe intltool-native-0.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1115 of 1115 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe vala-native-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-native-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch)
NOTE: Running task 1157 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 1161 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: Running task 1165 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 1210 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 1217 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: Running task 1235 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 1265 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1266 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1271 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Started
WARNING: qemu-native-8.1.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz_bad-checksum_541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087
NOTE: Running task 1361 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 1372 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_fetch)
NOTE: Running task 1376 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: Running task 1389 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_fetch)
NOTE: Running task 1395 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1397 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1400 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1401 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1403 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: Running task 1404 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 1405 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1444 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: Running task 1445 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_unpack)
NOTE: Running task 1456 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Started
NOTE: Running task 1495 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1496 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1514 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_write_config)
NOTE: Running task 1522 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Started
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: Running task 1523 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1524 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 1525 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1526 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: Running task 1527 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1529 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: Running task 1530 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: Running task 1569 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_warn_musl)
NOTE: Running task 1570 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1573 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: Running task 1574 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: Running task 1600 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1612 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Started
NOTE: Running task 1613 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1624 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: Running task 1645 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_fetch)
NOTE: Running task 1647 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1661 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_fetch: Started
NOTE: Running task 1677 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Succeeded
NOTE: Running task 1681 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Succeeded
NOTE: Running task 1682 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: Running task 1685 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: Running task 1775 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 1797 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_fetch)
NOTE: recipe bluez5-5.70-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: Running task 1798 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1799 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1800 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1801 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.70-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: Running task 1802 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1803 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_patch)
NOTE: Running task 1804 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe libical-3.0.17-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_fetch: Started
NOTE: Running task 1805 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe libdrm-2.4.118-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.118-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 1832 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: Running task 1833 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_patch)
NOTE: Running task 1836 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe bluez5-5.70-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_patch: Started
NOTE: Running task 1837 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_patch: Started
NOTE: Running task 1849 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_fetch)
NOTE: Running task 1868 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1916 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_unpack)
NOTE: Running task 1924 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 1925 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1926 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1927 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.118-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1929 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1931 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_generate_toolchain_file)
NOTE: Running task 1933 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe bluez5-5.70-r0: task do_unpack: Succeeded
NOTE: Running task 1963 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_unpack)
NOTE: Running task 1964 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2011 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: Running task 2031 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2032 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: Running task 2033 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2034 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe libdrm-2.4.118-r0: task do_unpack: Succeeded
NOTE: Running task 2035 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_patch)
NOTE: recipe bluez5-5.70-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_unpack: Started
NOTE: Running task 2042 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2087 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 2091 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.118-r0: task do_patch: Started
NOTE: Running task 2113 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_unpack)
NOTE: Running task 2114 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2205 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_write_config)
NOTE: recipe libdrm-2.4.118-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.118-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2235 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 2237 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_fetch)
NOTE: Running task 2238 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 2270 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_fetch)
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 2344 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_write_config)
NOTE: recipe libdrm-2.4.118-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Succeeded
NOTE: Running task 2345 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: Running task 2346 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libslirp-4.7.0-r0: task do_fetch: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_write_config: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2347 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 2349 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe qemu-8.1.3-r0: task do_fetch: Started
NOTE: recipe bluez5-5.70-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libslirp-4.7.0-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2586 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_patch: Started
NOTE: recipe libslirp-4.7.0-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.7.0-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2617 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_unpack)
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2618 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2620 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libslirp-4.7.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_unpack: Succeeded
NOTE: Running task 2622 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_patch)
NOTE: recipe qemu-8.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2623 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_patch: Started
NOTE: recipe qemu-8.1.3-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_patch: Succeeded
NOTE: Running task 2626 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_generate_toolchain_file)
NOTE: recipe libslirp-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2628 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libslirp-4.7.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2629 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe libslirp-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2632 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_patch: Started
WARNING: qemu-native-8.1.2-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-8.1.2.tar.xz - will attempt other sources if available
NOTE: recipe mesa-2_23.2.1-r0: task do_patch: Succeeded
WARNING: qemu-native-8.1.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz_bad-checksum_541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087
NOTE: recipe qemu-8.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2634 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_patch)
NOTE: recipe qemu-8.1.3-r0: task do_patch: Started
NOTE: recipe qemu-8.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2635 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2636 of 3045 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_populate_lic)
NOTE: recipe qemu-8.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemu-8.1.3-r0: task do_populate_lic: Started
NOTE: recipe qemu-8.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe qemu-8.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_deploy_source_date_epoch unihash changed to d14a14a331e5febc5630f69412fc060cce67f4af9af5771d6daeeceb37425871
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_populate_lic unihash changed to 91b0c09d8a3ad2c4ba399953d5f8903965d322281c9662265cb381d24cf666af
NOTE: Setscene tasks completed
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 2636 tasks of which 2516 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215084108.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215084108.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-8.1.2-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-8.1.2.tar.xz
ERROR: qemu-native-8.1.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz\' has sha256 checksum \'541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087\' when \'43cc176804105586f74f90398f34e9f85787dff400d3b640d81f7779fbe265bb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-8.1.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/qemu-native/8.1.2/temp/log.do_fetch.1931487
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch) failed with exit code '1'

--===============5163544547795088655==--

