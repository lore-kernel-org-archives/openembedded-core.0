Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD64BC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:00:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.61968.1638198015254924111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xwXr+5WW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198013; i=@fujitsu.com;
	bh=WaeibklIv5io0g0fZJkvJHb/jeqttQ3nn5U4c3TsL0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xwXr+5WWURG2tBok0uDElKxhKA66x/9yquexMXY/LMTonbDcx9rQe8zOwIcSkS12T
	 Q/f4j590xUosWX1g9N3zbVi5tXUx8wcVCYIicdEB4AxeSE60P7ld7ZnimtfuLNizQI
	 nhv2gM/vCgAPPea1sjMS+89iSQzr4dy113xhh0R7lDhCpLwdsB5FpMizEBoDQN3jLv
	 qgW4Oo1lVy1vSWhg5f7BWOI/2fEjf/dm7es+A/X7JLkA7/ukP7ERsi4iVQ0GeE7jpC
	 /8lw40hAIoa/Gb+f+pplQkfKQLdSDIRgBDSDNPd77w1uUAo4Z1+LsCF+dC1M8Ytgty
	 jumq7kF9XJ4Bg==
Received: from [100.115.32.166] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 27/D5-02703-DFAE4A16;
 Mon, 29 Nov 2021 15:00:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleJIrShJLcpLzFFi42Kxs+FI1P3zakm
  iwf5zRhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aNCbvYC67GV/TsvsDWwLgmuIuRi0NI4DGj
  xPVTV9kgnPNMEnd65jNDOCcYJX5sP8HSxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAtYS6/5NYwKxWQRUJRoOrWEEKecVcJbobFIGCUsIKEhMefieGcTmFHCReDvtNDNIiR
  BQydH/tSBhXgFBiZMzn7BATJeQOPjiBTNEq6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI
  +C0n7AkamVYxWSUWZ6RkluYmZObqGBga6hoamusamukaWeolVuol6qaW65anFJbpGeonlxXqp
  xcV6xZW5yTkpenmpJZsYgQGcUqwsu4Px36VveocYJTmYlER5s5YsSRTiS8pPqcxILM6ILyrNS
  S0+xCjDwaEkwbv/GVBOsCg1PbUiLTMHGE0waQkOHiUR3uIXQGne4oLE3OLMdIjUKcZYjjdrly
  xi5ngLJtvu3QWS7WBy5oKDq5k5ZoHJ++2HgOQDMPm65ecOZiGWvPy8VClx3qSXQEMFQIZmlOb
  BrYQljkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlfg0zhycwrgbvsFdDRTEBHv126GOTo
  kkSElFQD04z7xrt8z0ol7t639Jmc1N3m+klLWF/2fT9QvXxan/e3BTqr2PKcZTlW1rtK+vRmH
  QuKvJlbvv2zd8R8Xnk51beuAd8FPxv02V0Qmrxuo+EXg3Plqi5yAU4Tkt9/fHL2qMuanzx/z2
  /kvLtDX3in2dPjoZPvz77RLn78kM4+du30yILeI+5XeST4NXzUXTj8YuNXhP0+UHpxffmkdw0
  Lv3+T+7HlQIWpioaJVGHapyQPeQ0pfVPdzvgXWov+bVGJmndka7rMu585T45NvaKlq/Te05bF
  mnWOSajF4UqZjgV/gk7NmHtd3nrevT6x9cEnSn5GrXwof3VzftpJ2U8Rt5Z+r+gvLHtu+yk1s
  CTZTomlOCPRUIu5qDgRAE5xKgGXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1638198012!5557!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14433 invoked from network); 29 Nov 2021 15:00:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:00:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 01DD310022A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D10CF100243
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:00:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: OE-core] [PATCH] libunwind: upgrade 1.5.0 -> 1.6.0
Date: Mon, 29 Nov 2021 22:59:51 +0800
Message-ID: <1638197991-118955-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
References: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158943

0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
0001-configure-Do-not-enforce-libdir-for-ppc64.patch
removed since they're included in 1.6.0

refresh the following patches:
0003-x86-Stub-out-x86_local_resume.patch
0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
0006-Fix-for-X32.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...O_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 62 -------------------
 ...gure-Do-not-enforce-libdir-for-ppc64.patch | 35 -----------
 .../0003-x86-Stub-out-x86_local_resume.patch  | 19 +++---
 ...context-mismatches-between-glibc-and.patch | 16 +++--
 .../libunwind/0006-Fix-for-X32.patch          | 13 ++--
 ...{libunwind_1.5.0.bb => libunwind_1.6.0.bb} |  5 +-
 6 files changed, 23 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch
 rename meta/recipes-support/libunwind/{libunwind_1.5.0.bb => libunwind_1.6.0.bb} (77%)

diff --git a/meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
deleted file mode 100644
index 437b878365..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 599f10ac3a24e419a93f97fddbe14de01b1185ea Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 13 May 2014 23:32:27 +0200
-Subject: [PATCH 1/6] Add AO_REQUIRE_CAS to fix build on ARM < v6
-
-ARM earlier than ARMv6, such as ARMv4 and ARMv5 do not provide
-optimize atomic operations in libatomic_ops. Since libunwind is using
-such operations, it should define AO_REQUIRE_CAS before including
-<atomic_ops.h> so that libatomic_ops knows it should use emulated
-atomic operations instead (even though they are obviously a lot more
-expensive).
-
-Also, while real atomic operations are all inline functions and
-therefore linking against libatomic_ops was not required, the emulated
-atomic operations actually require linking against libatomic_ops, so
-the commented AC_CHECK_LIB test in acinclude.m4 is uncommented to make
-sure we link against libatomic_ops.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Pending
-Taken from:
-https://raw.githubusercontent.com/rdnetto/teapot-buildroot/master/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
-
----
- acinclude.m4          | 8 +-------
- include/libunwind_i.h | 1 +
- 2 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 497f7c2..9c15af1 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -22,11 +22,5 @@ fi])
- AC_DEFUN([CHECK_ATOMIC_OPS],
- [dnl Check whether the system has the atomic_ops package installed.
-   AC_CHECK_HEADERS(atomic_ops.h)
--#
--# Don't link against libatomic_ops for now.  We don't want libunwind
--# to depend on libatomic_ops.so.  Fortunately, none of the platforms
--# we care about so far need libatomic_ops.a (everything is done via
--# inline macros).
--#
--#  AC_CHECK_LIB(atomic_ops, main)
-+  AC_CHECK_LIB(atomic_ops, main)
- ])
-diff --git a/include/libunwind_i.h b/include/libunwind_i.h
-index 36cf7a1..33b4ca3 100644
---- a/include/libunwind_i.h
-+++ b/include/libunwind_i.h
-@@ -124,6 +124,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
-         (pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
- 
- #ifdef HAVE_ATOMIC_OPS_H
-+# define AO_REQUIRE_CAS
- # include <atomic_ops.h>
- static inline int
- cmpxchg_ptr (void *addr, void *old, void *new)
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch b/meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch
deleted file mode 100644
index 751f1b3404..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 154c7465de2aeb9a8ba3416bbed6e6e07f58c583 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 11 Mar 2021 21:52:28 -0800
-Subject: [PATCH] configure: Do not enforce libdir for ppc64
-
-OE has its own multilib configuration, therefore hardcoding libdir
-breaks that, instead respect the settings coming from build environment
-via configure options.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c8d68f7..254440f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -206,12 +206,6 @@ fi
- AM_CONDITIONAL(USE_DWARF, [test x$use_dwarf = xyes])
- AC_MSG_RESULT([$use_dwarf])
- 
--if test x$target_arch = xppc64; then
--        libdir='${exec_prefix}/lib64'
--        AC_MSG_NOTICE([PowerPC64 detected, lib will be installed ${libdir}]);
--        AC_SUBST([libdir])
--fi
--
- AC_MSG_CHECKING([whether to restrict build to remote support])
- if test x$target_arch != x$host_arch; then
-   CPPFLAGS="${CPPFLAGS} -DUNW_REMOTE_ONLY"
--- 
-2.30.2
-
diff --git a/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch b/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch
index 508ed6af38..f02f13f79c 100644
--- a/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch
+++ b/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch
@@ -1,7 +1,7 @@
-From f6866b9e4a6341c50eb1d923dbf48eca2ca40140 Mon Sep 17 00:00:00 2001
+From 0b2243f19d4ea12a2a68478a5aed503947a800af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 22 Mar 2016 16:19:29 +0000
-Subject: [PATCH 3/6] x86: Stub out x86_local_resume()
+Subject: [PATCH] x86: Stub out x86_local_resume()
 
 its purpose seems
 to be unwinding across signal handler boundaries, which cannot happen
@@ -13,14 +13,14 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- src/x86/Gos-linux.c | 22 +---------------------
- 1 file changed, 1 insertion(+), 21 deletions(-)
+ src/x86/Gos-linux.c | 26 +-------------------------
+ 1 file changed, 1 insertion(+), 25 deletions(-)
 
 diff --git a/src/x86/Gos-linux.c b/src/x86/Gos-linux.c
-index fb9a5e3..c25ae0c 100644
+index d448dce..c25ae0c 100644
 --- a/src/x86/Gos-linux.c
 +++ b/src/x86/Gos-linux.c
-@@ -284,27 +284,7 @@ x86_r_uc_addr (ucontext_t *uc, int reg)
+@@ -284,31 +284,7 @@ x86_r_uc_addr (ucontext_t *uc, int reg)
  HIDDEN int
  x86_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
  {
@@ -38,17 +38,18 @@ index fb9a5e3..c25ae0c 100644
 -      struct sigcontext *sc = (struct sigcontext *) c->sigcontext_addr;
 -
 -      Debug (8, "resuming at ip=%x via sigreturn(%p)\n", c->dwarf.ip, sc);
+-#if !defined(__ANDROID__)
 -      x86_sigreturn (sc);
+-#endif
 -    }
 -  else
 -    {
 -      Debug (8, "resuming at ip=%x via setcontext()\n", c->dwarf.ip);
+-#if !defined(__ANDROID__)
 -      setcontext (uc);
+-#endif
 -    }
 +  *(volatile char *)0=0;
    return -UNW_EINVAL;
  }
  
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch b/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
index edaa822be1..e58a71b741 100644
--- a/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
+++ b/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
@@ -1,7 +1,8 @@
-From 02919d74b1599979884f9cee466ed392d9fc4819 Mon Sep 17 00:00:00 2001
+From 24c751f9d21e892a9833e1b70a696b07872b0f7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Jul 2016 01:07:53 +0000
-Subject: [PATCH 5/6] ppc32: Consider ucontext mismatches between glibc and
+Subject: [PATCH] ppc32: Consider ucontext mismatches between glibc and
+
  musl
 
 This helps in porting libunwind onto musl based systems
@@ -29,7 +30,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 92 insertions(+), 79 deletions(-)
 
 diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
-index ba30244..c5312d9 100644
+index 7b45455..f8d6886 100644
 --- a/src/ppc32/Ginit.c
 +++ b/src/ppc32/Ginit.c
 @@ -48,12 +48,12 @@ uc_addr (ucontext_t *uc, int reg)
@@ -227,7 +228,7 @@ index c6ba806..b79f15c 100644
  
  #endif
 diff --git a/src/ptrace/_UPT_reg_offset.c b/src/ptrace/_UPT_reg_offset.c
-index c82d1c9..6c31baa 100644
+index b7dd3b7..bfaf756 100644
 --- a/src/ptrace/_UPT_reg_offset.c
 +++ b/src/ptrace/_UPT_reg_offset.c
 @@ -27,6 +27,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
@@ -242,8 +243,5 @@ index c82d1c9..6c31baa 100644
 +# undef pt_regs
 +#endif
  
- #ifdef HAVE_ASM_PTRACE_OFFSETS_H
- # include <asm/ptrace_offsets.h>
--- 
-2.20.1
-
+ #ifdef HAVE_ASM_PTRACE_H
+ # include <asm/ptrace.h>
diff --git a/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch b/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
index 37ae8124cc..9941612387 100644
--- a/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
+++ b/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
@@ -1,7 +1,7 @@
-From 7a4fd5933cc795df85cdd85168fe54fbaec4dcec Mon Sep 17 00:00:00 2001
+From f2eae0af620925b3686410470fc6fbc66ec1dc52 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 13 Dec 2016 09:50:34 -0700
-Subject: [PATCH 6/6] Fix for X32
+Subject: [PATCH] Fix for X32
 
 Apply patch to fix the X32 build from https://github.com/sjnewbury/x32.
 
@@ -13,10 +13,10 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/x86_64/Gos-linux.c b/src/x86_64/Gos-linux.c
-index bd14234..be1cb5b 100644
+index b489329..0550005 100644
 --- a/src/x86_64/Gos-linux.c
 +++ b/src/x86_64/Gos-linux.c
-@@ -145,8 +145,8 @@ x86_64_sigreturn (unw_cursor_t *cursor)
+@@ -146,8 +146,8 @@ x86_64_sigreturn (unw_cursor_t *cursor)
  
    Debug (8, "resuming at ip=%llx via sigreturn(%p)\n",
               (unsigned long long) c->dwarf.ip, sc);
@@ -25,8 +25,5 @@ index bd14234..be1cb5b 100644
 +  __asm__ __volatile__ ("mov %q0, %%rsp;"
 +                        "mov %q1, %%rax;"
                          "syscall"
-                         :: "r"(sc), "i"(SYS_rt_sigreturn)
+                         :: "r"((uint64_t)sc), "i"(SYS_rt_sigreturn)
                          : "memory");
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libunwind/libunwind_1.5.0.bb b/meta/recipes-support/libunwind/libunwind_1.6.0.bb
similarity index 77%
rename from meta/recipes-support/libunwind/libunwind_1.5.0.bb
rename to meta/recipes-support/libunwind/libunwind_1.6.0.bb
index 9b515b58f4..81b364fc5e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.5.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.0.bb
@@ -1,17 +1,14 @@
 require libunwind.inc
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
-           file://0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
            file://0003-x86-Stub-out-x86_local_resume.patch \
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
-           file://0001-configure-Do-not-enforce-libdir-for-ppc64.patch \
            "
 SRC_URI:append:libc-musl = " file://musl-header-conflict.patch"
 
-SRC_URI[md5sum] = "c6923dda0675f6a4ef21426164dc8b6a"
-SRC_URI[sha256sum] = "90337653d92d4a13de590781371c604f9031cdb50520366aa1e3a91e1efb1017"
+SRC_URI[sha256sum] = "7194c20dda841b26917c0579e6467b53f7ad2e3f9452e5c77f3c3829c4656b70"
 
 EXTRA_OECONF:append:libc-musl = " --disable-documentation --disable-tests --enable-static"
 
-- 
2.25.1


