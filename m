Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E8EC0219A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.42622.1738416045115238196
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ABUh2jln;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=L/evPOCE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194c1abf06a-16b753b6-c80b-4f5b-90ef-0ca68270a549-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V1b+NmJTM1Ik0i2B66g3HzrStNKm6DcOlO5PNFqOv7U=;
	b=ABUh2jlnfg3WrOO960Rvds0H7CEgsup9b+PTi6yLHsI/Gr6e8eyminklaCPvQKXZ
	Kl4xuxEk6kJPjLctSIgKWakEtsKf43yVIEC0Ixx3+zN1SYtRU0AccDtHxamWXVBQHMB
	WZ2WgtS2G5oXIolqlbHcSJcr4F1bBzYJ7OotWRGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V1b+NmJTM1Ik0i2B66g3HzrStNKm6DcOlO5PNFqOv7U=;
	b=L/evPOCEHZSNHDqbj+RpY3JSZ1V6zDo/RxlD8py0XSE2T0ibce5Zuwdd133LzN3U
	pI86/yIhkgXhw1l8TyycIpZjDoGHUMKl2hYcPvxI7jo1OdWb/Pkp+9KZjEs/PqOs4YE
	Hddo/ctdTrU83hIPhMhDiSwoAbTSyg5MRiC6lUdI=
Content-Type: multipart/mixed; boundary="===============5483559188927664408=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20250130 SUCCEEDED
Message-ID: <01010194c1abf06a-16b753b6-c80b-4f5b-90ef-0ca68270a549-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210558

--===============5483559188927664408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ltp* to *20250130* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20240930-20250130.patch
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
From a006d5488de288cf7cac30fbfcd1c8b13e799b10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 09:30:56 +0000
Subject: [PATCH] ltp: upgrade 20240930 -> 20250130

---
 ...-__clear_cache-declaration-for-clang.patch |  4 +-
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  4 +-
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 42 -------------------
 .../ltp/{ltp_20240930.bb => ltp_20250130.bb}  |  3 +-
 4 files changed, 5 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
 rename meta/recipes-extended/ltp/{ltp_20240930.bb => ltp_20250130.bb} (98%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index ade6a52b63..72c9021332 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From 2d384f268791ecd5ff0f26c8137dd4de0a1c4566 Mon Sep 17 00:00:00 2001
+From 88a33cf63214bfd7ff9377323ebec69281f0748e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
@@ -19,7 +19,7 @@ Cc: Hui Min Mina Chou <minachou@andestech.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-index a84ba6476..856e22ff3 100644
+index ecfd51d0c..e17a12e6a 100644
 --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 @@ -21,6 +21,7 @@
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 5b6c780bec..0e19d585f4 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
+From 196f46e2eaf55722a85d13b6532aff1aa61c880f Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,7 +14,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 6a8cd0b9d..8ce3f4416 100644
+index d8e62af81..85c223b71 100644
 --- a/runtest/mm
 +++ b/runtest/mm
 @@ -76,12 +76,6 @@ ksm07 ksm07
diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 58d665c7dd..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 38ac9ed7a4f7e2dcedb3c13d807ad0575435bab4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Oct 2024 14:37:12 -0700
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-October/040678.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/lapi/sched.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/lapi/sched.h b/include/lapi/sched.h
-index 26fdb628d..e1c7ff011 100644
---- a/include/lapi/sched.h
-+++ b/include/lapi/sched.h
-@@ -15,6 +15,8 @@
- #include "lapi/syscalls.h"
- #include "lapi/sched.h"
- 
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
- 	uint32_t size;
- 
-@@ -44,6 +46,7 @@ static inline int sched_getattr(pid_t pid, struct sched_attr *attr,
- {
- 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
- }
-+#endif
- 
- #ifndef HAVE_CLONE3
- struct clone_args {
diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
similarity index 98%
rename from meta/recipes-extended/ltp/ltp_20240930.bb
rename to meta/recipes-extended/ltp/ltp_20250130.bb
index 3fe8772ea7..908a037959 100644
--- a/meta/recipes-extended/ltp/ltp_20240930.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "60f81419c43f94ec182827ef0b9eb5baeb303419"
+SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
-           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.44.1


--===============5483559188927664408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ltp: SRC_URI changed from "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://0001-Add-__clear_cache-declaration-for-clang.patch file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch" to "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://0001-Add-__clear_cache-declaration-for-clang.patch"
packages/core2-64-poky-linux/ltp: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 1113781832 to 1142977536 (+3%)
packages/core2-64-poky-linux/ltp/ltp-dbg: FILELIST: added "/opt/ltp/testcases/bin/.debug/shell_c_child /opt/ltp/testcases/bin/.debug/listmount02 /opt/ltp/testcases/bin/.debug/listmount03 /opt/ltp/testcases/bin/.debug/listmount01 /opt/ltp/testcases/bin/.debug/listmount04 /opt/ltp/testcases/bin/.debug/fsplough /opt/ltp/testcases/bin/.debug/pty08 /opt/ltp/testcases/bin/.debug/pty09 /opt/ltp/testcases/bin/.debug/ptem04 /opt/ltp/testcases/bin/.debug/ptem05 /opt/ltp/testcases/bin/.debug/ptem06 /opt/ltp/testcases/bin/.debug/ptem02 /opt/ltp/testcases/bin/.debug/ptem03 /opt/ltp/testcases/bin/.debug/madvise12 /opt/ltp/testcases/bin/.debug/statmount01 /opt/ltp/testcases/bin/.debug/statmount02 /opt/ltp/testcases/bin/.debug/statmount03 /opt/ltp/testcases/bin/.debug/statmount04 /opt/ltp/testcases/bin/.debug/statmount05 /opt/ltp/testcases/bin/.debug/statmount06 /opt/ltp/testcases/bin/.debug/statmount07 /opt/ltp/testcases/bin/.debug/statmount08 /opt/ltp/testcases/bin/.debug/rt_sigqueueinfo02 /opt/lt
 p/testcases/bin/.debug/landlock08 /opt/ltp/testcases/open_posix_testsuite/conformance/definitions/aio_h/.debug/aio_h_4-1.run-test /opt/ltp/testcases/bin/.debug/hugemmap34"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp-dbg: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp-dev: PKGSIZE changed from 347136 to 357518 (+3%)
packages/core2-64-poky-linux/ltp/ltp-dev: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp-dev: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp-doc: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp-doc: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp-locale: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp-locale: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp-src: PKGSIZE changed from 13465167 to 13525708 (+0%)
packages/core2-64-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20250130/testcases/kernel/
 syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20240930/testc
 ases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conf
 ormance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20250130/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/numa -> /usr/src/debug/ltp/20250130/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed
  /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20250130/te
 stcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20250130/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/202501
 30/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/time
 r_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/2
 0250130/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/s
 ched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20250130/testca
 ses/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20250130/testcases/ke
 rnel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/sysctl -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/sysctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20250130/testcases/open_posix_te
 stsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20240930/testcases/cve -> /usr/src/debug/ltp/20250130/testcases/cve, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pkeys, directory ren
 amed /usr/src/debug/ltp/20240930/testcases/lib -> /usr/src/debug/ltp/20250130/testcases/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/fptests -> /usr/src/debug/ltp/20250130/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuit
 e/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20240930/include/lapi -> /usr/src/debug/ltp/20250130/include/lapi, directory renamed /usr/src/debug/ltp/20240930/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20250130/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/
 swapoff -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sc
 hed_getaffinity -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/bpf -> /usr/src/debug/lt
 p/20250130/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/kvm -> /usr/src/debug/ltp/20250130/testcases/kernel/kvm, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20250130/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20250130/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/in
 terfaces/clock_nanosleep -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/move
 _mount, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/
 conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20240930/libs/newipc -> /usr/src/debug/ltp/20250130/libs/newipc, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20250130/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sysca
 lls/getpgid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20250130/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20250130/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20250130/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/block/block_dev_user,
  directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/atof -> /usr/src/debug/ltp/20250130/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/2025
 0130/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/i
 notify -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20240930/libs/ujson -> /usr/src/debug/ltp/20250130/libs/ujson, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_tid
 _address, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/io/aio -> /usr/src/debug/ltp/20250130/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_g
 etparam/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mmap -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20240930/
 testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/2024
 0930/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20250
 130/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20250130/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20240930/testc
 ases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/f00f -> /usr/src/debug/ltp/20250130/testcases/misc/f00f, directory renamed /u
 sr/src/debug/ltp/20240930/pan -> /usr/src/debug/ltp/20250130/pan, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20250130/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20
 250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/process_madvise -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/process_madvise, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mount_
 setattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20250130/testcases
 /open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/
 20250130/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20250130/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20250130/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/nextafter -> /usr/src/
 debug/ltp/20250130/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/
 20240930/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/umip -> /usr/src/debug/ltp/20250130/testcases/kernel/security/umip, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20240930/testcases/network/lib6 -> /usr/src/debug/ltp/20250130/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/2
 0240930/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20250130/testcases/open_posix
 _testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src
 /debug/ltp/20240930/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20250130/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20250130/testcases/kernel/syscall
 s/times, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/zram, 
 directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20240930/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20250130/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20240930/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20250130/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_create1 -> /usr/src/de
 bug/ltp/20250130/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/include -> /usr/src/debug/ltp/20250130/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20250130
 /testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20250130/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/
 ltp/20250130/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmodat2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchmodat2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20250130/testcases/kerne
 l/syscalls/nftw, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/abs -> /usr/src/debug/ltp/20250130/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20250130/testca
 ses/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/accept4 -> /usr/s
 rc/debug/ltp/20250130/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/2024093
 0/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20250130/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20240930/include -> /usr/src/debug/ltp/20250130/include, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsync, dire
 ctory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/newuname, directory renamed 
 /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cachestat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/cachestat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/munlock, d
 irectory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20240930/testcases/network/packet -> /usr/src/debug/ltp/20250130/testcases/network/packet, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/float/
 bessel -> /usr/src/debug/ltp/20250130/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/f
 removexattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20240930/tools/apicmds -> /usr/src/debug/ltp/20250130/tools/apicmds, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fcntl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/202
 40930/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20250130/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp
 /20240930/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/inte
 rfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20240930/tools/genload -> /usr/src/debug/ltp/20250130/tools/genload, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20240930/testc
 ases/kernel/syscalls/shutdown -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/shutdown, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20250130/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/aslr -> /usr/src/debug/ltp/20250130/testcases/kernel
 /security/aslr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/socket, directory renamed
  /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20250130/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_ti
 medwait, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/uevents -> /usr/src/debug/ltp/20250130/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20240930/testcases/network/iptables -> /usr/src/debug/ltp/20250130/testcases/network/iptables, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20250130/testcases
 /kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_
 destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/deb
 ug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/timens -> /usr/src/debug/lt
 p/20250130/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchown, dir
 ectory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/202501
 30/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sound -> /usr/src/debug/ltp/20250130/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20250130/t
 estcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20240930/libs/sigwait -> /usr/src/debug/ltp/20250130/libs/sigwait, directory renamed /usr/src/debug/ltp/20240930/testcases
 /kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/dup3, dire
 ctory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20250130/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20240930/utils/sctp/testlib -> /usr/src/debug/ltp/20250130/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sy
 scalls/fgetxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/irq -> /usr/src/debug/ltp/20250130/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigrelse -> /usr
 /src/debug/ltp/20250130/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20250130/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/smack -> /usr/src/debug/ltp/20250130/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20240930/testcas
 es/network/netstress -> /usr/src/debug/ltp/20250130/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20250130/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/faccessat2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/faccessat2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsui
 te/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20240930/libs/swap -> /usr/src/debug/ltp/20250130/libs/swap, di
 rectory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_s
 ettime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20240930/libs/ipc -> /usr/src/debug/ltp/20250130/libs/ipc, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20240930/testcases/open_pos
 ix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20250130/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20250130/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsui
 te/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20240930/test
 cases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20240930/libs/vdso -> /usr/src/debug/ltp/20250130/libs/vdso, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify, directory renamed /usr/src/debug/ltp/2
 0240930/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20250130/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20250130/testcases/ke
 rnel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20250130/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20240930/testcases/network/can/cve -> /usr/src/debug/ltp/20250130/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/c
 puset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20250130/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20250130/testcases/kernel/co
 ntainers/utsname, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_syscall_test -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest05, directory renamed /usr/src/
 debug/ltp/20240930/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_create
  -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20250130/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20250130/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20250130/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20240930/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20250130/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/request_key, directory renamed /usr/
 src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20240930/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20250130/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/alarm, directory renamed /usr/s
 rc/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20240930/testcases/commands/eject -> /usr/src/debug/ltp/20250130/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20240930/testcase
 s/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20250130/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/p
 thread_rwlockattr_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20250130/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/include -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20240930/tes
 tcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20250130/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/2024093
 0/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20250130/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpgrp -> 
 /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/float/
 power -> /usr/src/debug/ltp/20250130/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/lib -> /usr/src/debug/ltp/20250130/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20250130/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20250130/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_te
 stsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/float -> /usr/src/debug/ltp/20250130/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destr
 oy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20250130/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20240930/include/old -> /usr/src/debug/ltp/20250130/include/old, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmat, directory ren
 amed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/2
 0240930/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20250130/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/sp
 eculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/e
 ventfd2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20240930/
 testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate
  -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20240930/utils/sctp/lib -> /usr/src/debug/ltp/20250130/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20250130/testcases/ker
 nel/fs/doio/include, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/page -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flock, directory renamed /usr/
 src/debug/ltp/20240930/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20250
 130/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20240930/testcases/network/sctp -> /usr/src/debug/ltp/20250130/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20250130/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20250130/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20250130/testcases/realtime/func/periodic_cp
 u_load, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pr
 eadv2, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20250130/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/seccomp -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/seccomp, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsui
 te/conformance/interfaces/mmap -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedre
 ceive, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20250130/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20250130/testcases/kernel/sysca
 lls/memfd_create, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_del
 ete -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20240930/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20250130/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /
 usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/
 ustat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/security/kallsyms -> /usr/src/debug/ltp/20250130/testcases/kernel/security/kallsyms, directory renamed /usr/src/debug/ltp/20240930/utils/sctp/func_tests -> /usr/src/debug/ltp/20250130/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/crash -> /usr/src/debug/ltp/20250130/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20240930/testcases/network/nfsv4/acl -> /usr/src/debug/l
 tp/20250130/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20240930/testcases/network/sockets -> /usr/src/debug/ltp/20250130/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getgid, directory ren
 amed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/power_management -> /usr/src/debug/ltp/20250130/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20250130/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getitim
 er, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mseal -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mseal, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20250130/test
 cases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20240930/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20250130/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src
 /debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/arch_prctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/arch_prctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug
 /ltp/20240930/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20240930/lib -> /usr/src/debug/ltp/20250130/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/
 20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20240930/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20250130/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20240930/testcases/o
 pen_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscal
 ls/prctl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/2
 0250130/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20240930/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20250130/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20250130/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/crypto -> /usr/src/debug/ltp/20250130/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/con
 trollers/cpuctl_fj -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20240930/libs/uinput -> /usr/src/debug/ltp/20250130/libs/uinput, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpu
 set_lib -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20250130/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_tests
 uite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20250130/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mount -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mount, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/s
 igprocmask -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20250130/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20250130/test
 cases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setregid, directory renamed /usr/src/
 debug/ltp/20240930/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20240930/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20250130/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/lib -> /usr/src/debug/ltp/20250130/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20250130/testcases/open_po
 six_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20250130/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20250130/testcases/open_posix_test
 suite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20240930
 /testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20240930/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20250130/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/threads/condvar -> /
 usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20250130/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20250130/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20240930/testcases/open_
 posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/include -> /usr/src/debug/ltp/20250130/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20240930/utils/sctp/include/netinet -> /usr/src/debug/ltp/20250130/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20250130/testcases/kernel/s
 yscalls/munmap, directory renamed /usr/src/debug/ltp/20240930/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20250130/testcases/realtime/func/thread_clock, removed "/usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock03.c /usr/src/debug/ltp/20240930/testcases/kernel/input/input04.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock05.c /usr/src/debug/ltp/20240930/testcases/kernel/input/input06.c /usr/src/debug/ltp/20240930/testcases/kernel/pty/hangup01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap12.c /usr/src/debug/
 ltp/20240930/testcases/kernel/input/input02.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test05.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrandom/getrandom05.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrandom/getrandom02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrandom/getrandom01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock_exec.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigqueueinfo/rt_sigqueueinfo.h /usr/src/debug/ltp/20240930/test
 cases/kernel/input/input05.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20240930/testcases/kernel/input/input03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock06.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock04.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test04.c /usr/src/debug/ltp/20240930/testcases/kernel/pty/pty05.c /usr/src/debug/ltp/20240930/testcases/kernel/input/input01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrandom/getrandom03.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test06.c /usr/src/debug/ltp/20240930/testcases/kernel/pty/ptem01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landl
 ock/landlock_tester.h /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test02.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20240930/testcases/kernel/pty/pty04.c /usr/src/debug/ltp/20240930/testcases/kernel/pty/pty01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise11.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20240930/testcases/kernel/pty/pty03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20240930/testcases/kernel/
 syscalls/madvise/madvise05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock_common.h /usr/src/debug/ltp/20240930/testcases/kernel/pty/pty07.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap
 /hugemmap17.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20240930/testcases/kernel/input/input_helper.h /usr/src/debug/ltp/20240930/testcases/kernel/pty/pty02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrandom/getrandom04.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20240930/testcases/kernel/input/input_helper.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigqueueinfo/rt_sigqueueinfo01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c /usr/src/debu
 g/ltp/20240930/testcases/kernel/pty/pty06.c /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/2-1.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise/madvise10.c", added "/usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_test06.c /usr/src/debug/ltp/20250130/testcases/kernel/input/input_common.h /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap12.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty09.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/common.h /usr/src/debug/ltp/20250130/testcase
 s/kernel/input/input03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock06.c /usr/src/debug/ltp/20250130/testcases/kernel/input/input01.c /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/aio_h/2-1.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock08.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20250130/testcases/kernel/input/input05.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_test01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock_common.h /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_test03.c /usr
 /src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock_tester.h /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty08.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap17.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listmount/listmount03.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom/getrandom02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom/getrandom04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount02.c /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_c_child.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listmount/listmount01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount04.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/2
 0250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock_exec.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom/getrandom_var.h /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom/getrandom01.c /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/aio_h/4-1.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount06.c /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_test02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listmount/listmount02.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom/getrandom03.c /usr/src/debug/
 ltp/20250130/testcases/kernel/syscalls/listmount/listmount.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listmount/listmount04.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/ptem06.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/ptem01.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/ptem02.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/ptem03.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/ptem04.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/ptem05.c /usr/src/debug/ltp/20250130/testcases/kernel/input/input06.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty01.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom/getrandom05.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/hangup01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock03.c /usr/src/debug/ltp/20250130/testcases/kern
 el/pty/pty03.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigqueueinfo/rt_sigqueueinfo.h /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount05.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount08.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise11.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise12.c /usr/src/debug/ltp/20250130/testcases/ker
 nel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount01.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_test05.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/de
 bug/ltp/20250130/testcases/kernel/syscalls/statmount/statmount07.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigqueueinfo/rt_sigqueueinfo01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigqueueinfo/rt_sigqueueinfo02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock02.c /usr/src/debug/ltp/20250130/testcases/kernel/pty/pty02.c /usr/src/debug/ltp/20250130/testcases/kernel/input/input02.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap34.c /usr/src/debug/ltp/20250130/testcases/lib/tests/shell_test04.c /usr/src/debug/ltp/20250130/testcases/kernel
 /mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20250130/testcases/kernel/input/input04.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock07.c /usr/src/debug/ltp/20250130/testcases/kernel/fs/fsplough/fsplough.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock/landlock04.c"
packages/core2-64-poky-linux/ltp/ltp-src: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp-src: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp-staticdev: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp-staticdev: PV changed from "20240930" to "20250130"
packages/core2-64-poky-linux/ltp/ltp: PKGSIZE changed from 453267618 to 467075456 (+3%)
packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/datafiles/bin.med /opt/ltp/testcases/bin/datafiles/bin.jmb /opt/ltp/testcases/bin/datafiles/bin.sm /opt/ltp/testcases/bin/ftp01.sh /opt/ltp/testcases/bin/logrotate_tests.sh /opt/ltp/testcases/bin/datafiles/bin.lg", added "/opt/ltp/testcases/bin/rt_sigqueueinfo02 /opt/ltp/testcases/bin/listmount01 /opt/ltp/testcases/bin/landlock08 /opt/ltp/testcases/bin/listmount03 /opt/ltp/testcases/bin/listmount02 /opt/ltp/testcases/bin/listmount04 /opt/ltp/testcases/bin/nfs10.sh /opt/ltp/testcases/bin/ptem05 /opt/ltp/testcases/bin/ptem04 /opt/ltp/testcases/bin/hugemmap34 /opt/ltp/testcases/bin/ptem06 /opt/ltp/testcases/bin/pty09 /opt/ltp/testcases/bin/madvise12 /opt/ltp/testcases/bin/pty08 /opt/ltp/testcases/bin/ptem03 /opt/ltp/testcases/bin/ptem02 /opt/ltp/testcases/bin/fsplough /opt/ltp/testcases/bin/statmount04 /opt/ltp/testcases/bin/statmount05 /opt/ltp/testcases/bin/statmount06 /opt/ltp/testcases/bin/statmount07 /o
 pt/ltp/testcases/bin/statmount01 /opt/ltp/testcases/bin/statmount02 /opt/ltp/testcases/bin/shell_c_child /opt/ltp/testcases/bin/statmount03 /opt/ltp/testcases/open_posix_testsuite/conformance/definitions/aio_h/aio_h_4-1.run-test /opt/ltp/testcases/bin/statmount08 /opt/ltp/testcases/realtime/run.sh"
packages/core2-64-poky-linux/ltp/ltp: PKGV changed from 20240930 [default] to 20250130 [default]
packages/core2-64-poky-linux/ltp/ltp: PV changed from "20240930" to "20250130"

--===============5483559188927664408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/datafiles/bin.sm /opt/ltp/testcases/bin/datafiles/bin.jmb /opt/ltp/testcases/bin/logrotate_tests.sh /opt/ltp/testcases/bin/datafiles/bin.lg /opt/ltp/testcases/bin/datafiles/bin.med /opt/ltp/testcases/bin/ftp01.sh", added "/opt/ltp/testcases/bin/landlock08 /opt/ltp/testcases/bin/rt_sigqueueinfo02 /opt/ltp/testcases/bin/nfs10.sh /opt/ltp/testcases/bin/madvise12 /opt/ltp/testcases/open_posix_testsuite/conformance/definitions/aio_h/aio_h_4-1.run-test /opt/ltp/testcases/bin/hugemmap34 /opt/ltp/testcases/bin/listmount01 /opt/ltp/testcases/bin/ptem06 /opt/ltp/testcases/bin/shell_c_child /opt/ltp/testcases/bin/ptem04 /opt/ltp/testcases/realtime/run.sh /opt/ltp/testcases/bin/ptem02 /opt/ltp/testcases/bin/ptem03 /opt/ltp/testcases/bin/ptem05 /opt/ltp/testcases/bin/statmount03 /opt/ltp/testcases/bin/statmount02 /opt/ltp/testcases/bin/statmount01 /opt/ltp/testcases/bin/statmount07 /opt/ltp/testcases/bin/statmount06 /
 opt/ltp/testcases/bin/statmount05 /opt/ltp/testcases/bin/statmount04 /opt/ltp/testcases/bin/statmount08 /opt/ltp/testcases/bin/fsplough /opt/ltp/testcases/bin/listmount04 /opt/ltp/testcases/bin/listmount02 /opt/ltp/testcases/bin/listmount03 /opt/ltp/testcases/bin/pty08 /opt/ltp/testcases/bin/pty09"

--===============5483559188927664408==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20240930-20250130.patch"

RnJvbSBhMDA2ZDU0ODhkZTI4OGNmN2NhYzMwZmJmY2QxYzhiMTNlNzk5YjEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwOTozMDo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
cDogdXBncmFkZSAyMDI0MDkzMCAtPiAyMDI1MDEzMAoKLS0tCiAuLi4tX19jbGVhcl9jYWNoZS1k
ZWNsYXJhdGlvbi1mb3ItY2xhbmcucGF0Y2ggfCAgNCArLQogLi4uMDAxLVJlbW92ZS1PT00tdGVz
dHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoIHwgIDQgKy0KIC4uLmVkX2F0dHItRG8tbm90LWRlZmlu
ZS1mb3ItZ2xpYmMtMi40MS5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9sdHAv
e2x0cF8yMDI0MDkzMC5iYiA9PiBsdHBfMjAyNTAxMzAuYmJ9ICB8ICAzICstCiA0IGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1zY2hlZF9hdHRyLURvLW5vdC1k
ZWZpbmUtZm9yLWdsaWJjLTIuNDEucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHRwL3tsdHBfMjAyNDA5MzAuYmIgPT4gbHRwXzIwMjUwMTMwLmJifSAoOTglKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtQWRkLV9fY2xlYXJfY2FjaGUt
ZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9s
dHAvMDAwMS1BZGQtX19jbGVhcl9jYWNoZS1kZWNsYXJhdGlvbi1mb3ItY2xhbmcucGF0Y2gKaW5k
ZXggYWRlNmE1MmI2My4uNzJjOTAyMTMzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2x0cC9sdHAvMDAwMS1BZGQtX19jbGVhcl9jYWNoZS1kZWNsYXJhdGlvbi1mb3ItY2xhbmcu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1BZGQtX19jbGVh
cl9jYWNoZS1kZWNsYXJhdGlvbi1mb3ItY2xhbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDJkMzg0ZjI2ODc5MWVjZDVmZjBmMjZjODEzN2RkNGRlMGExYzQ1NjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDg4YTMzY2Y2MzIxNGJmZDdmZjkzNzczMjNlYmVjNjkyODFmMDc0OGUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogRGF0ZTogTW9uLCAxMCBKdW4gMjAyNCAyMjo1Mjo1NiAtMDcwMAogU3ViamVjdDogW1BB
VENIXSBBZGQgX19jbGVhcl9jYWNoZSBkZWNsYXJhdGlvbiBmb3IgY2xhbmcKQEAgLTE5LDcgKzE5
LDcgQEAgQ2M6IEh1aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3RlY2guY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tl
cm5lbC9tZW0vaHVnZXRsYi9odWdlbW1hcC9odWdlbW1hcDE1LmMgYi90ZXN0Y2FzZXMva2VybmVs
L21lbS9odWdldGxiL2h1Z2VtbWFwL2h1Z2VtbWFwMTUuYwotaW5kZXggYTg0YmE2NDc2Li44NTZl
MjJmZjMgMTAwNjQ0CitpbmRleCBlY2ZkNTFkMGMuLmUxN2ExMmU2YSAxMDA2NDQKIC0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvbWVtL2h1Z2V0bGIvaHVnZW1tYXAvaHVnZW1tYXAxNS5jCiArKysgYi90
ZXN0Y2FzZXMva2VybmVsL21lbS9odWdldGxiL2h1Z2VtbWFwL2h1Z2VtbWFwMTUuYwogQEAgLTIx
LDYgKzIxLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAw
MDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBh
dGNoCmluZGV4IDViNmM3ODBiZWMuLjBlMTlkNTg1ZjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1SZW1vdmUtT09N
LXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzY4MTU5
YWE1MzI1N2QyNDc2NDVhMTI1MTg3NzhmNTBiOGZkZjU3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMTk2ZjQ2ZTJlYWY1NTcyMmE4NWQxM2I2NTMyYWZmMWFhNjFjODgwZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ICJNaW5nZGUgKE1hdHRoZXcpIFplbmciIDxtYXR0aGV3
em1kQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjkgSnVsIDIwMjAgMDg6NDc6MDkgLTA0MDAKIFN1
YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIE9PTSB0ZXN0cyBmcm9tIHJ1bnRlc3QvbW0KQEAgLTE0LDcg
KzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9ydW50ZXN0
L21tIGIvcnVudGVzdC9tbQotaW5kZXggNmE4Y2QwYjlkLi44Y2UzZjQ0MTYgMTAwNjQ0CitpbmRl
eCBkOGU2MmFmODEuLjg1YzIyM2I3MSAxMDA2NDQKIC0tLSBhL3J1bnRlc3QvbW0KICsrKyBiL3J1
bnRlc3QvbW0KIEBAIC03NiwxMiArNzYsNiBAQCBrc20wNyBrc20wNwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1zY2hlZF9hdHRyLURvLW5vdC1kZWZpbmUt
Zm9yLWdsaWJjLTIuNDEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAx
LXNjaGVkX2F0dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggNThkNjY1YzdkZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLXNjaGVkX2F0dHItRG8tbm90LWRlZmluZS1mb3It
Z2xpYmMtMi40MS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gMzhh
YzllZDdhNGY3ZTJkY2VkYjNjMTNkODA3YWQwNTc1NDM1YmFiNCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBXZWQsIDMw
IE9jdCAyMDI0IDE0OjM3OjEyIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNjaGVkX2F0dHI6IERv
IG5vdCBkZWZpbmUgZm9yIGdsaWJjID49IDIuNDEKLQotZ2xpYmMgMi40MSsgaGFzIGFkZGVkIFsx
XSBkZWZpbml0aW9ucyBmb3Igc2NoZWRfc2V0YXR0ciBhbmQgc2NoZWRfZ2V0YXR0ciBmdW5jdGlv
bnMKLWFuZCBzdHJ1Y3Qgc2NoZWRfYXR0ci4gVGhlcmVmb3JlLCBpdCBuZWVkcyB0byBiZSBjaGVj
a2VkIGZvciBoZXJlIGFzIHdlbGwgYmVmb3JlCi1kZWZpbmluZyBzY2hlZF9hdHRyCi0KLURlZmlu
ZSBzY2hlZF9hdHRyIGNvbmRpdGlvbmFsbHkgb24gU0NIRURfQVRUUl9TSVpFX1ZFUjAKLQotRml4
ZXMgYnVpbGRzIHdpdGggZ2xpYmMvdHJ1bmsKLQotWzFdIGh0dHBzOi8vc291cmNld2FyZS5vcmcv
Z2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdGRpZmY7aD0yMTU3MWNhMGQ3MDMwMjkwOWNmNzI3MDdi
MmE3NzM2Y2YxMjE5MGEwO2hwPTI5OGJjNDg4ZmRjMDQ3ZGEzNzQ4MmY0MDAzMDIzY2I5YWRlZjc4
ZjgKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbGlzdHMubGludXguaXQv
cGlwZXJtYWlsL2x0cC8yMDI0LU9jdG9iZXIvMDQwNjc4Lmh0bWxdCi1TaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gaW5jbHVkZS9sYXBpL3NjaGVkLmgg
fCAzICsrKwotIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGFwaS9zY2hlZC5oIGIvaW5jbHVkZS9sYXBpL3NjaGVkLmgKLWluZGV4IDI2ZmRi
NjI4ZC4uZTFjN2ZmMDExIDEwMDY0NAotLS0tIGEvaW5jbHVkZS9sYXBpL3NjaGVkLmgKLSsrKyBi
L2luY2x1ZGUvbGFwaS9zY2hlZC5oCi1AQCAtMTUsNiArMTUsOCBAQAotICNpbmNsdWRlICJsYXBp
L3N5c2NhbGxzLmgiCi0gI2luY2x1ZGUgImxhcGkvc2NoZWQuaCIKLSAKLSsvKiBzY2hlZF9hdHRy
IGlzIG5vdCBkZWZpbmVkIGluIGdsaWJjIDwgMi40MSAqLwotKyNpZm5kZWYgU0NIRURfQVRUUl9T
SVpFX1ZFUjAKLSBzdHJ1Y3Qgc2NoZWRfYXR0ciB7Ci0gCXVpbnQzMl90IHNpemU7Ci0gCi1AQCAt
NDQsNiArNDYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBzY2hlZF9nZXRhdHRyKHBpZF90IHBpZCwg
c3RydWN0IHNjaGVkX2F0dHIgKmF0dHIsCi0gewotIAlyZXR1cm4gc3lzY2FsbChfX05SX3NjaGVk
X2dldGF0dHIsIHBpZCwgYXR0ciwgc2l6ZSwgZmxhZ3MpOwotIH0KLSsjZW5kaWYKLSAKLSAjaWZu
ZGVmIEhBVkVfQ0xPTkUzCi0gc3RydWN0IGNsb25lX2FyZ3MgewpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNDA5MzAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbHRwL2x0cF8yMDI1MDEzMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI0MDkzMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNTAxMzAuYmIKaW5kZXggM2ZlODc3MmVhNy4uOTA4
YTAzNzk1OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNDA5
MzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNTAxMzAuYmIKQEAg
LTI0LDEyICsyNCwxMSBAQCBUVU5FX0NDQVJHUzpyZW1vdmU6eDg2LTY0ID0gIi1tZnBtYXRoPXNz
ZSIKIAogQ0ZMQUdTOmFwcGVuZDpwb3dlcnBjNjQgPSAiIC1EX19TQU5FX1VTRVJTUEFDRV9UWVBF
U19fIgogQ0ZMQUdTOmFwcGVuZDptaXBzYXJjaG42NCA9ICIgLURfX1NBTkVfVVNFUlNQQUNFX1RZ
UEVTX18iCi1TUkNSRVYgPSAiNjBmODE0MTljNDNmOTRlYzE4MjgyN2VmMGI5ZWI1YmFlYjMwMzQx
OSIKK1NSQ1JFViA9ICJhN2MzMWRmZjdlZGMwODlhMzJlOTkwNzY1ZTEyOTUyY2M0ZDc2NjZhIgog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC5naXQ7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJl
bW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtQWRkLV9fY2xlYXJfY2FjaGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoIFwKLSAg
ICAgICAgICAgZmlsZTovLzAwMDEtc2NoZWRfYXR0ci1Eby1ub3QtZGVmaW5lLWZvci1nbGliYy0y
LjQxLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40
NC4xCgo=

--===============5483559188927664408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 94 recipes from the core2-64 sysroot...done.
Removing 118 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bc032481eab5a2d01d222418913b530a53af703d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 936 Local 846 Mirrors 0 Missed 90 Current 289 (90% match, 92% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 293 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_setscene)
NOTE: Running setscene task 297 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 301 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 308 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 310 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 314 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 322 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_qa_setscene)
NOTE: Running setscene task 323 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 325 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_deploy_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 328 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 330 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 335 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 336 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 337 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 338 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 340 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 344 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_deb_setscene)
NOTE: recipe curl-8.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 348 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 357 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 360 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_deb_setscene)
NOTE: recipe which-2.21-r0: task do_package_qa_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 363 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_ipk_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bc-1.08.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 365 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_qa_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 366 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 367 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_ipk_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.08.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 368 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 369 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.08.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 370 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 372 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_qa_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 375 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 379 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 387 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_deb_setscene)
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 388 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_qa_setscene)
NOTE: Running setscene task 389 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 390 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 391 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 392 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 393 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_deb_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 394 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 400 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_package_write_deb_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 403 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 410 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_ipk_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 411 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa_setscene)
NOTE: recipe file-5.46-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 418 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.46-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 423 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_qa_setscene)
NOTE: Running setscene task 430 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 434 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 435 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.46-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 437 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 440 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 442 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 449 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 450 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_qa_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 451 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 459 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 462 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_package_qa_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_package_qa_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 464 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_deb_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_qa_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 474 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.11.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_package_write_ipk_setscene)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 478 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_qa_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_package_qa_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 481 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_deb_setscene)
NOTE: recipe tar-1.35-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 488 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_ipk_setscene)
NOTE: recipe bc-1.08.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 490 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_qa_setscene)
NOTE: recipe gzip-1.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_deb_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_qa_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 498 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 501 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 506 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_deb_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 509 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 512 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 516 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe bc-1.08.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 518 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 519 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 525 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 531 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 537 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 539 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 541 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 550 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 557 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 561 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 571 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 601 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 605 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 610 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 614 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.11.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.0.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 626 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 627 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 630 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_packagedata_setscene)
NOTE: recipe bc-1.08.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburcu-0.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 643 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-1.08.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iputils-20240905-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdb-16.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdb-16.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 695 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 697 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 704 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 716 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.35-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 726 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot_setscene)
NOTE: recipe gzip-1.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 728 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 734 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 738 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 739 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_setscene)
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 751 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 770 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe gdb-16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdb-16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 788 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 813 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 815 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe cpio-2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 830 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liburcu-0.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 833 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 836 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 838 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bc-1.08.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 843 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 846 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 849 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 851 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 856 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 862 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 869 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 878 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 880 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 885 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 889 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 905 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 907 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 910 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 919 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 922 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 928 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 934 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 944 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe curl-8.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 948 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 956 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 958 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 971 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 977 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 978 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 981 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 983 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 986 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 994 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 998 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1000 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1002 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1008 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1012 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1014 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1018 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1019 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1023 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/75.6.0/temp/log.do_packagedata_setscene.835283
NOTE: Running setscene task 1026 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1029 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1031 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1034 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1038 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1039 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1041 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_package_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1042 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1046 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1048 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1049 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1054 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1059 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1067 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1102 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: Running task 1291 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Started
NOTE: Running task 1391 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_fetch)
NOTE: Running task 1419 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_fetch)
NOTE: Running task 1430 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_recipe_qa)
NOTE: Running task 1441 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_fetch)
NOTE: Running task 1442 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.1.bb:do_fetch)
NOTE: Running task 1443 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1444 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_fetch)
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_write_config)
NOTE: Running task 1525 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb:do_fetch)
NOTE: Running task 1535 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_fetch: Started
NOTE: recipe iproute2-6.12.0-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20250130-r0: task do_recipe_qa: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Started
NOTE: recipe gdb-16.1-r0: task do_fetch: Started
NOTE: Running task 1620 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_unpack)
NOTE: recipe iproute2-6.12.0-r0: task do_fetch: Succeeded
NOTE: recipe iputils-20240905-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1649 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_unpack)
NOTE: Running task 1654 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe gdb-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1655 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 1656 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.1.bb:do_unpack)
NOTE: Running task 1657 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe iputils-20240905-r0: task do_write_config: Started
NOTE: recipe btrfs-tools-6.12-r0: task do_fetch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_package_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_unpack: Started
NOTE: Running setscene task 1069 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1070 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1071 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1072 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iputils-20240905-r0: task do_write_config: Succeeded
NOTE: recipe iproute2-6.12.0-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running setscene task 1073 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_populate_sysroot_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Started
NOTE: recipe gdb-16.1-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Started
NOTE: recipe ltp-20250130-r0: task do_recipe_qa: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1074 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1076 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1658 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1664 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.12.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1665 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_patch)
NOTE: recipe libcap-2.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1666 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Started
NOTE: Running setscene task 1079 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe ltp-20250130-r0: task do_fetch: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1082 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_recipe_qa_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.12.0-r0: task do_patch: Started
NOTE: Running task 1668 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1669 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running setscene task 1085 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iputils-20240905-r0: task do_unpack: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1089 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cronie-1.7.2-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1090 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1671 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe ltp-20250130-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1678 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_unpack)
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.12.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1093 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1094 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_patch: Started
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ltp-20250130-r0: task do_unpack: Started
NOTE: Running setscene task 1095 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1096 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1097 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1098 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1099 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running setscene task 1100 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1101 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1105 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe iputils-20240905-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1107 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1125 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1689 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1690 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: Running setscene task 1129 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Started
NOTE: Running task 1697 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1137 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1715 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1717 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb:do_unpack)
NOTE: recipe iputils-20240905-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.12-r0: task do_unpack: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1139 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iputils-20240905-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch unihash changed to f4c6d348c62852ecf7cfaa24335b91020fc3fe0e90fb38084ced46ef9406392a
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1755 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe ltp-20250130-r0: task do_unpack: Succeeded
NOTE: Running task 1756 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe ltp-20250130-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1757 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb:do_patch)
NOTE: recipe gdb-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1758 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.12-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe gdb-16.1-r0: task do_patch: Started
NOTE: recipe ltp-20250130-r0: task do_patch: Succeeded
NOTE: Running task 1760 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_deploy_source_date_epoch)
NOTE: Running task 1761 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.12-r0: task do_patch: Succeeded
NOTE: recipe ltp-20250130-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20250130-r0: task do_populate_lic: Started
NOTE: recipe ltp-20250130-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20250130-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_populate_lic unihash changed to 274f9f702b0bd9a0c62685bdd57cc1e47af2f345be7dbc77acd26ba8616caf88
NOTE: recipe gdb-16.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1142 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1144 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1145 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1150 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1151 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1152 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1155 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1167 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1171 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1174 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1178 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1186 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1188 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1190 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1192 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1197 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1198 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1199 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1210 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2191 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2281 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2553 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2578 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2639 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2663 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2665 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2666 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata: Started
NOTE: Running task 2829 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2830 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20250130-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2832 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iputils-20240905-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2858 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_collect_spdx_deps)
NOTE: Running task 2873 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_collect_spdx_deps)
NOTE: Running task 2880 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2900 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20250130-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2901 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure)
NOTE: recipe iproute2-6.12.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2992 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_configure)
NOTE: recipe iputils-20240905-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe ltp-20250130-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20250130-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2993 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Started
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.12.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.12.0-r0: task do_configure: Started
NOTE: recipe ltp-20250130-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2994 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_configure)
NOTE: recipe iputils-20240905-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iputils-20240905-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2995 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_configure: Started
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_configure)
NOTE: recipe iputils-20240905-r0: task do_configure: Started
NOTE: recipe cronie-1.7.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2997 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_compile)
NOTE: recipe iproute2-6.12.0-r0: task do_compile: Started
NOTE: recipe iputils-20240905-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_compile)
NOTE: recipe iputils-20240905-r0: task do_compile: Started
NOTE: recipe iputils-20240905-r0: task do_compile: Succeeded
NOTE: Running task 2999 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_install)
NOTE: recipe iputils-20240905-r0: task do_install: Started
NOTE: recipe iputils-20240905-r0: task do_install: Succeeded
NOTE: Running task 3000 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package)
NOTE: Running task 3001 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_populate_sysroot)
NOTE: recipe iputils-20240905-r0: task do_package: Started
NOTE: recipe iputils-20240905-r0: task do_populate_sysroot: Started
NOTE: recipe iputils-20240905-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iputils-20240905-r0: task do_package: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3002 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_compile)
NOTE: Running task 3003 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_packagedata)
NOTE: recipe cronie-1.7.2-r0: task do_compile: Started
NOTE: recipe iputils-20240905-r0: task do_packagedata: Started
NOTE: recipe iputils-20240905-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_packagedata unihash changed to 23ecca95d29c22ceacd3ae0ff2da38e1b42340f62a45a78b736bda1152bc2604
NOTE: Setscene tasks completed
NOTE: Running task 3004 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_create_spdx)
NOTE: Running task 3005 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_ipk)
NOTE: Running task 3006 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_deb)
NOTE: Running task 3007 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_rpm)
NOTE: Running task 3008 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_qa)
NOTE: recipe iputils-20240905-r0: task do_create_spdx: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_deb: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_rpm: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_ipk: Started
NOTE: recipe iputils-20240905-r0: task do_package_qa: Started
NOTE: recipe cronie-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_install)
NOTE: recipe cronie-1.7.2-r0: task do_install: Started
NOTE: recipe iputils-20240905-r0: task do_create_spdx: Succeeded
NOTE: recipe iputils-20240905-r0: task do_package_write_deb: Succeeded
NOTE: recipe iputils-20240905-r0: task do_package_qa: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_deb unihash changed to 8fe0613e5f674caa63e18c1ab0b966d5faa4707d8fff52af8cba71dcd2652d54
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_qa unihash changed to 57a4bbc477388f95a26416a72d61c1d744ba430f00f4dea655ad5f84bee02be8
NOTE: Running task 3010 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package)
NOTE: Running task 3011 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_populate_sysroot)
NOTE: recipe iputils-20240905-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iputils-20240905-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_rpm unihash changed to 09fe7dcc29a2cd4aec3789194ac6f24b0773c5d7f2462ccb5a2c2ee20d50f076
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_ipk unihash changed to a009a3e85e8118a55147f90693ec99eeb7690b63c2db104f349c41adfb65ad50
NOTE: recipe cronie-1.7.2-r0: task do_package: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.12.0-r0: task do_compile: Succeeded
NOTE: Running task 3012 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_install)
NOTE: recipe iproute2-6.12.0-r0: task do_install: Started
NOTE: recipe cronie-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 3013 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_packagedata)
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.12.0-r0: task do_install: Succeeded
NOTE: Running task 3014 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_package)
NOTE: Running task 3015 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_populate_sysroot)
NOTE: recipe iproute2-6.12.0-r0: task do_package: Started
NOTE: recipe iproute2-6.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3016 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_create_spdx)
NOTE: Running task 3017 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_ipk)
NOTE: Running task 3018 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_deb)
NOTE: Running task 3019 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_rpm)
NOTE: Running task 3020 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_qa)
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Started
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_qa: Started
NOTE: recipe iproute2-6.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_qa unihash changed to 5c00e87eb5453a0a126900d73ca3eeb4235863aac9b2750db237af8c089289af
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3022 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Started
NOTE: recipe ltp-20250130-r0: task do_configure: Succeeded
NOTE: Running task 3023 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_compile)
NOTE: recipe iproute2-6.12.0-r0: task do_package: Succeeded
NOTE: recipe ltp-20250130-r0: task do_compile: Started
NOTE: Running task 3024 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_packagedata)
NOTE: recipe iproute2-6.12.0-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_configure: Succeeded
NOTE: Running task 3025 of 3142 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_compile: Started
NOTE: recipe iproute2-6.12.0-r0: task do_packagedata: Failed
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 LIBC=musl HOSTCC=gcc  HOST_CFLAGS=-isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/usr/include -O2 -pipe HOST_LDFLAGS=-L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/usr/
 lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread KVM_LD=x86_64-poky-linux-musl-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot
| make -C "lib" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/lib/Makefile" all
| make -C "libs" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/libs/Makefile" all
| if git describe >/dev/null 2>&1; then \
| 	git describe > "Version"; \
| else \
| 	cp /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/VERSION "Version"; \
| fi
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/libs'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/lib'
| GEN ltp-version.h
| In file included from parse_opts.c:39:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| CC lib/tst_ansi_color.o
| CC lib/cloner.o
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:539:22: warning: unused parameter 'wrd' [-Wunused-parameter]
|   539 |                 long wrd)       /* to allow future features, use zero for now */
|       |                 ~~~~~^~~
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1114:22: warning: unused parameter 'wrd' [-Wunused-parameter]
|  1114 |                 long wrd)       /* to allow future features, use zero for now */
|       |                 ~~~~~^~~
| CC lib/get_path.o
| CC libs/ipc/libmsgctl.o
| CC libs/ipc/libipc.o
| AR libltpipc.a
| CC lib/safe_stdio.o
| RANLIB libltpipc.a
| tst_af_alg.c: In function 'init_sockaddr_alg':
| tst_af_alg.c:62:9: warning: 'strncpy' specified bound 64 equals destination size [-Wstringop-truncation]
|    62 |         strncpy((char *)addr->salg_name, algname, sizeof(addr->salg_name));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC lib/random_range.o
| CC lib/tst_assert.o
| CC lib/tst_arch.o
| CC lib/parse_opts.o
| CC lib/safe_pthread.o
| tst_capability.c:82:6: warning: conflicting types for 'tst_cap_setup' due to enum/integer mismatch; have 'void(struct tst_cap *, unsigned int)' [-Wenum-int-mismatch]
|    82 | void tst_cap_setup(struct tst_cap *caps, unsigned int action_mask)
|       |      ^~~~~~~~~~~~~
| In file included from ../include/tst_test.h:41,
|                  from tst_capability.c:9:
| ../include/tst_capability.h:133:6: note: previous declaration of 'tst_cap_setup' with type 'void(struct tst_cap *, enum tst_cap_act)'
|   133 | void tst_cap_setup(struct tst_cap *cap, enum tst_cap_act action_mask);
|       |      ^~~~~~~~~~~~~
| CC lib/tst_checksum.o
| CC lib/tst_af_alg.o
| CC libs/newipc/libnewipc.o
| CC lib/tst_checkpoint.o
| AR libltpnewipc.a
| RANLIB libltpnewipc.a
| CC lib/safe_file_ops.o
| CC lib/tst_capability.o
| CC lib/tst_buffers.o
| CC lib/tst_bool_expr.o
| CC lib/tst_coredump.o
| CC lib/tst_clone.o
| CC lib/tst_cpu.o
| CC lib/tst_crypto.o
| CC lib/safe_net.o
| CC lib/tst_dir_is_empty.o
| CC lib/tst_fs_has_free.o
| CC lib/tst_fill_file.o
| CC lib/tst_clocks.o
| CC lib/tst_cmd.o
| CC libs/numa/tst_numa.o
| AR libltpnuma.a
| RANLIB libltpnuma.a
| CC lib/tst_epoll.o
| CC lib/tst_fs_type.o
| CC lib/tst_get_bad_addr.o
| CC lib/tlibio.o
| CC lib/tst_fill_fs.o
| CC lib/tst_fs_setup.o
| CC lib/tst_fs_link_count.o
| CC lib/tst_ioctl.o
| CC lib/tst_hugepage.o
| In file included from tst_netlink.c:13:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
|       |  ^~~~~~~
| CC lib/tst_kernel.o
| CC lib/tst_mkfs.o
| CC lib/tst_parse_opts.o
| CC lib/tst_fd.o
| CC lib/tst_kvercmp.o
| CC lib/tst_module.o
| CC lib/tst_device.o
| CC lib/tst_rand_data.o
| CC lib/tst_path_has_mnt_flags.o
| CC lib/tst_memutils.o
| CC lib/safe_macros.o
| CC lib/tst_net.o
| CC lib/tst_process_state.o
| CC lib/tst_cgroup.o
| CC lib/tst_pid.o
| CC lib/tst_resource.o
| tst_sig.c: In function 'tst_sig':
| tst_sig.c:210:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   210 |                         if (fork_flag == FORK)
|       |                            ^
| tst_sig.c:213:17: note: here
|   213 |                 default:
|       |                 ^~~~~~~
| CC libs/sigwait/sigwait.o
| AR libltpsigwait.a
| RANLIB libltpsigwait.a
| CC lib/tst_rtctime.o
| CC lib/tst_sig.o
| CC lib/tst_safe_io_uring.o
| CC lib/tst_sig_proc.o
| CC lib/tst_safe_timerfd.o
| CC lib/tst_netlink.o
| CC lib/tst_security.o
| CC lib/tst_status.o
| CC lib/tst_safe_file_at.o
| CC lib/tst_safe_sysv_ipc.o
| CC lib/tst_netdevice.o
| CC lib/tst_thread_state.o
| CC lib/tst_kconfig.o
| CC lib/tst_supported_fs_types.o
| CC lib/tst_taint.o
| CC lib/tst_res.o
| CC lib/tst_sys_conf.o
| CC lib/tst_test_macros.o
| CC lib/tst_virt.o
| CC lib/tst_uid.o
| CC libs/swap/libswap.o
| AR libltpswap.a
| CC lib/tst_tmpdir.o
| RANLIB libltpswap.a
| CC lib/tst_timer.o
| CC lib/tst_wallclock.o
| CC lib/tst_safe_macros.o
| CC lib/tst_timer_test.o
| CC libs/uinput/tst_uinput.o
| AR libltpuinput.a
| RANLIB libltpuinput.a
| CC libs/ujson/ujson_common.o
| CC libs/ujson/ujson_utf.o
| CC libs/ujson/ujson_writer.o
| CC lib/tst_test.o
| AR libltp.a
| CC libs/ujson/ujson_reader.o
| AR libujson.a
| RANLIB libltp.a
| RANLIB libujson.a
| CC libs/vdso/vdso_helpers.o
| CC libs/vdso/parse_vdso.o
| AR libltpvdso.a
| RANLIB libltpvdso.a
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/libs'
| CC lib/newlib_tests/test01
| CC lib/newlib_tests/test05
| CC lib/newlib_tests/test13
| CC lib/newlib_tests/test19
| CC lib/newlib_tests/test06
| CC lib/newlib_tests/test07
| CC lib/newlib_tests/test02
| CC lib/newlib_tests/test04
| CC lib/newlib_tests/test14
| CC lib/newlib_tests/test09
| CC lib/newlib_tests/test08
| CC lib/newlib_tests/test03
| CC lib/newlib_tests/test11
| CC lib/newlib_tests/test15
| CC lib/newlib_tests/test20
| CC lib/newlib_tests/test_assert
| CC lib/newlib_tests/test22
| CC lib/newlib_tests/test_exec_child
| CC lib/newlib_tests/test_children_cleanup
| CC lib/newlib_tests/test_exec
| CC lib/newlib_tests/test_kconfig01
| CC lib/newlib_tests/test_kconfig02
| CC lib/newlib_tests/test_kconfig
| CC lib/newlib_tests/test_kconfig03
| CC lib/newlib_tests/test_macros01
| CC lib/newlib_tests/test_guarded_buf
| CC lib/newlib_tests/test_macros03
| CC lib/newlib_tests/test_macros04
| CC lib/newlib_tests/test_macros05
| CC lib/newlib_tests/test_macros06
| CC lib/newlib_tests/test_macros02
| CC lib/newlib_tests/test_runtime01
| CC lib/newlib_tests/test_runtime02
| CC lib/newlib_tests/test_zero_hugepage
| CC lib/newlib_tests/tst_capability02
| CC lib/newlib_tests/tst_cgroup01
| CC lib/newlib_tests/tst_capability01
| CC lib/newlib_tests/test_parse_filesize
| CC lib/newlib_tests/tst_bool_expr
| CC lib/newlib_tests/tst_device
| CC lib/newlib_tests/tst_cgroup02
| CC lib/newlib_tests/tst_expiration_timer
| CC lib/newlib_tests/tst_needs_cmds01
| CC lib/newlib_tests/tst_needs_cmds03
| CC lib/newlib_tests/tst_needs_cmds02
| CC lib/newlib_tests/tst_needs_cmds04
| CC lib/newlib_tests/tst_needs_cmds06
| CC lib/newlib_tests/tst_needs_cmds07
| CC lib/newlib_tests/tst_print_result
| CC lib/newlib_tests/tst_needs_cmds08
| CC lib/newlib_tests/tst_needs_cmds05
| CC lib/newlib_tests/test_timer
| CC lib/newlib_tests/tst_res_flags
| CC lib/newlib_tests/tst_safe_fileops
| CC lib/newlib_tests/tst_res_hexd
| CC lib/newlib_tests/tst_safe_sscanf
| CC lib/newlib_tests/tst_strstatus
| CC lib/newlib_tests/variant
| CC lib/newlib_tests/tst_fuzzy_sync01
| CC lib/newlib_tests/tst_fuzzy_sync02
| CC lib/newlib_tests/tst_fuzzy_sync03
| tst_dataroot03.c: In function 'main':
| tst_dataroot03.c:51:36: warning: '/datafiles' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |                                    ^~~~~~~~~~
| tst_dataroot03.c:51:9: note: 'snprintf' output between 11 and 4106 bytes into a destination of size 4096
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| tst_dataroot02.c: In function 'main':
| tst_dataroot02.c:51:36: warning: '/datafiles' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |                                    ^~~~~~~~~~
| tst_dataroot02.c:51:9: note: 'snprintf' output between 11 and 4106 bytes into a destination of size 4096
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC lib/tests/tst_cleanup_once
| CC lib/tests/tst_checkpoint_wake_timeout
| CC lib/tests/tst_checkpoint
| CC lib/tests/tst_checkpoint_wait_timeout
| CC lib/tests/tst_fs_fill_hardlinks
| CC lib/tests/tst_device
| CC lib/tests/tst_record_childstatus
| CC lib/tests/tst_fs_fill_subdirs
| CC lib/tests/tst_strerrno
| CC lib/tests/tst_strsig
| CC lib/tests/tst_process_state
| CC lib/tests/tst_dataroot03
| CC lib/tests/tst_dataroot01
| CC lib/tests/tst_dataroot02
| CC lib/tests/tst_safe_macros
| CC lib/tests/trerrno
| CC lib/tests/tst_tmpdir_test
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/lib'
| make -C "pan" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/pan/Makefile" all
| make -C "utils" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/utils/Makefile" all
| make -C "testcases" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/testcases/Makefile" all
| make -C "tools" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/tools/Makefile" all
| make -C "metadata" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/metadata/Makefile" all
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/pan'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/utils'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/testcases'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/metadata'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/tools'
| In file included from ltp-bump.c:36:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| make[4]: Nothing to be done for 'all'.
| In file included from zoolib.h:42,
|                  from ltp-bump.c:41:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| make[3]: Nothing to be done for 'all'.
| In file included from zoolib.h:42,
|                  from zoolib.c:55:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| In file included from zoolib.h:42,
|                  from ltp-pan.c:71:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| make[3]: Nothing to be done for 'all'.
| CC pan/splitstr.o
| CC pan/ltp-bump.o
| CC testcases/commands/eject/eject_check_tray
| zoolib.c: In function 'cat_args':
| zoolib.c:386:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
|   386 |         *cmd = '\0';
|       |         ~~~~~^~~~~~
| zoolib.c:380:20: note: destination object of size 0 allocated by 'malloc'
|   380 |         if ((cmd = malloc(size)) == NULL) {
|       |                    ^~~~~~~~~~~~
| CC pan/zoolib.o
| CC tools/apicmds/ltpapicmd.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_brk
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_brkm
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_exit
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_res
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_resm
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_ncpus
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_ncpus_conf
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_ncpus_max
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -L../../lib  ltpapicmd.o  -lfts -lltp -o tst_fs_has_free
| LD pan/ltp-bump
| CC testcases/commands/file/datafiles/in
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC utils/benchmark/ebizzy-0.3/ebizzy
| make[3]: Nothing to be done for 'all'.
| make[4]: Nothing to be done for 'all'.
| make -C "lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/utils/sctp/lib/Makefile" all
| make -C "testlib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/utils/sctp/testlib/Makefile" all
| genload.c: In function 'main':
| genload.c:95:13: warning: variable 'do_timeout' set but not used [-Wunused-but-set-variable]
|    95 |         int do_timeout = 0;
|       |             ^~~~~~~~~~
| stress.c: In function 'main':
| stress.c:95:13: warning: variable 'do_timeout' set but not used [-Wunused-but-set-variable]
|    95 |         int do_timeout = 0;
|       |             ^~~~~~~~~~
| genload.c: In function 'hogcpu':
| genload.c:468:16: warning: variable 'd' set but not used [-Wunused-but-set-variable]
|   468 |         double d;
|       |                ^
| stress.c: In function 'hogcpu':
| stress.c:468:16: warning: variable 'd' set but not used [-Wunused-but-set-variable]
|   468 |         double d;
|       |                ^
| In file included from sctputil.c:52:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC testcases/commands/ldd/datafiles/lddfile2.o
| connectx.c:78:12: warning: 'sctp_connectx_orig' alias between functions of incompatible types 'int(int)' and 'int(int,  struct sockaddr *, int)' [-Wattribute-alias=]
|    78 | extern int sctp_connectx_orig (int)
|       |            ^~~~~~~~~~~~~~~~~~
| connectx.c:67:5: note: aliased declaration here
|    67 | int __sctp_connectx(int fd, struct sockaddr *addrs, int addrcnt)
|       |     ^~~~~~~~~~~~~~~
| CC testcases/commands/ldd/datafiles/lddfile1.o
| CC testcases/commands/ldd/datafiles/main.o
| CC testcases/commands/ldd/datafiles/lddfile3.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl
 /ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -shared -o lddfile1.obj.so lddfile1.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl
 /ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -shared -o lddfile2.obj.so lddfile2.o
| CC utils/sctp/lib/opt_info.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl
 /ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -shared -o lddfile3.obj.so lddfile3.o
| CC utils/sctp/lib/peeloff.o
| CC utils/sctp/lib/addrs.o
| CC utils/sctp/lib/bindx.o
| CC testcases/commands/ldd/datafiles/lddfile4.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl
 /ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -shared -o lddfile4.obj.so lddfile4.o
| CC testcases/commands/ldd/datafiles/lddfile5.o
| CC utils/sctp/lib/sendmsg.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl
 /ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -shared -o lddfile5.obj.so lddfile5.o
| CC utils/sctp/lib/recvmsg.o
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl
 /ltp/20250130/git=/usr/src/debug/ltp/20250130  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -O -o lddfile.out main.o lddfile1.obj.so lddfile2.obj.so lddfile3.obj.so lddfile4.obj.so lddfile5.obj.so
| CC utils/sctp/lib/connectx.o
| AR libsctp.a
| RANLIB libsctp.a
| rm lddfile2.o lddfile1.o lddfile4.o lddfile3.o lddfile5.o
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC testcases/commands/nm/datafiles/f2.o
| CC utils/sctp/testlib/sctputil.o
| CC testcases/commands/nm/datafiles/f1.o
| CC testcases/commands/nm/datafiles/f3.o
| x86_64-poky-linux-musl-gcc-ar rcs lib.a f1.o f2.o f3.o
| AR libsctputil.a
| CC testcases/commands/nm/datafiles/f2
| CC testcases/commands/nm/datafiles/f3
| CC testcases/commands/nm/datafiles/f1
| RANLIB libsctputil.a
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| In file included from test_1_to_1_connectx.c:56:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| In file included from test_1_to_1_connect.c:57:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| In file included from test_1_to_1_rtoinfo.c:51:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[4]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC pan/ltp-pan.o
| CC utils/sctp/func_tests/test_1_to_1_rtoinfo
| CC utils/sctp/func_tests/test_1_to_1_recvfrom
| LD pan/ltp-pan
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/pan'
| HOSTCC metadata/metaparse
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/metadata/parse.sh > ltp.json
| CC utils/sctp/func_tests/test_1_to_1_nonblock
| CC utils/sctp/func_tests/test_1_to_1_connectx
| CC utils/sctp/func_tests/test_1_to_1_accept_close
| CC utils/sctp/func_tests/test_1_to_1_events
| CC utils/sctp/func_tests/test_1_to_1_addrs
| In file included from test_1_to_1_shutdown.c:44:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_1_to_1_connect
| CC tools/genload/stress
| CC utils/sctp/func_tests/test_1_to_1_recvmsg
| CC utils/sctp/func_tests/test_1_to_1_initmsg_connect
| CC utils/sctp/func_tests/test_1_to_1_send
| CC tools/genload/genload
| make[2]: Nothing to be done for 'all'.
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/tools'
| In file included from test_assoc_abort.c:52:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| In file included from test_assoc_shutdown.c:51:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_1_to_1_sendto
| CC testcases/cve/cve-2016-7042
| CC utils/sctp/func_tests/test_1_to_1_shutdown
| CC testcases/cve/cve-2016-10044
| CC utils/sctp/func_tests/test_1_to_1_sendmsg
| CC utils/sctp/func_tests/test_1_to_1_socket_bind_listen
| CC testcases/cve/cve-2017-16939
| CC testcases/cve/cve-2015-3290
| In file included from test_autoclose.c:52:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| In file included from test_basic.c:55:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_assoc_shutdown
| CC utils/sctp/func_tests/test_1_to_1_threads
| CC testcases/cve/cve-2017-17052
| CC utils/sctp/func_tests/test_assoc_abort
| In file included from test_fragments.c:63:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_1_to_1_sockopt
| CC testcases/cve/cve-2017-2618
| CC utils/sctp/func_tests/test_autoclose
| CC testcases/cve/cve-2017-17053
| CC testcases/cve/cve-2014-0196
| CC utils/sctp/func_tests/test_connect
| CC testcases/cve/cve-2022-4378
| In file included from test_sctp_sendrecvmsg.c:53:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_connectx
| In file included from test_sockopt.c:55:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_basic
| CC testcases/cve/cve-2016-7117
| CC utils/sctp/func_tests/test_fragments
| CC utils/sctp/func_tests/test_basic_v6.o
| CC utils/sctp/func_tests/test_fragments_v6.o
| In file included from test_tcp_style.c:48:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
|       |  ^~~~~~~
| In file included from test_timetolive.c:67:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| In file included from test_fragments.c:63:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| In file included from test_basic.c:55:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC testcases/cve/icmp_rate_limit01
| CC utils/sctp/func_tests/test_getname_v6.o
| CC testcases/cve/tcindex01
| CC utils/sctp/func_tests/test_inaddr_any_v6.o
| CC testcases/cve/stack_clash
| CC utils/sctp/func_tests/test_inaddr_any
| CC testcases/cve/meltdown
| CC utils/sctp/func_tests/test_peeloff_v6.o
| CC utils/sctp/func_tests/test_sctp_sendrecvmsg_v6.o
| CC utils/sctp/func_tests/test_sockopt_v6.o
| CC utils/sctp/func_tests/test_getname
| CC utils/sctp/func_tests/test_tcp_style_v6.o
| In file included from test_sockopt.c:55:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| In file included from test_sctp_sendrecvmsg.c:53:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_recvmsg
| CC utils/sctp/func_tests/test_timetolive_v6.o
| CC utils/sctp/func_tests/test_peeloff
| In file included from test_tcp_style.c:48:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
|       |  ^~~~~~~
| In file included from test_timetolive.c:67:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
|       |  ^~~~~~~
| CC utils/sctp/func_tests/test_sctp_sendrecvmsg
| CC testcases/cve/cve-2017-2671
| LD utils/sctp/func_tests/test_fragments_v6
| CC utils/sctp/func_tests/test_timetolive
| LD utils/sctp/func_tests/test_inaddr_any_v6
| LD utils/sctp/func_tests/test_getname_v6
| LD utils/sctp/func_tests/test_basic_v6
| CC utils/sctp/func_tests/test_tcp_style
| LD utils/sctp/func_tests/test_peeloff_v6
| In file included from abort01.c:30:
| abort01.c: In function 'setup':
| ../../../../include/tst_test.h:121:55: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'rlim_t' {aka 'long long unsigned int'} [-Wformat=]
|   121 |                 tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
|       |                                                       ^~~~~~~~~
| abort01.c:81:25: note: in expansion of macro 'tst_brk'
|    81 |                         tst_brk(TCONF, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
|       |                         ^~~~~~~
| LD utils/sctp/func_tests/test_sctp_sendrecvmsg_v6
| CC utils/sctp/func_tests/test_sockopt
| LD utils/sctp/func_tests/test_timetolive_v6
| CC testcases/kernel/syscalls/abort/abort01
| In file included from accept01.c:20:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| LD utils/sctp/func_tests/test_tcp_style_v6
| LD utils/sctp/func_tests/test_sockopt_v6
| rm test_fragments_v6.o test_getname_v6.o test_basic_v6.o test_peeloff_v6.o test_tcp_style_v6.o test_inaddr_any_v6.o test_sockopt_v6.o test_sctp_sendrecvmsg_v6.o test_timetolive_v6.o
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/utils'
| CC testcases/kernel/syscalls/accept/accept01
| CC testcases/kernel/syscalls/accept/accept03
| CC testcases/kernel/syscalls/accept/accept02
| CC testcases/kernel/syscalls/accept4/accept4_01
| CC testcases/kernel/syscalls/access/access03
| CC testcases/kernel/syscalls/access/access04
| CC testcases/kernel/syscalls/access/access02
| CC testcases/kernel/syscalls/access/access01
| CC testcases/kernel/syscalls/acct/acct02_helper
| CC testcases/kernel/syscalls/acct/acct01
| CC testcases/kernel/syscalls/acct/acct02
| CC testcases/kernel/syscalls/add_key/add_key02
| CC testcases/kernel/syscalls/add_key/add_key03
| CC testcases/kernel/syscalls/add_key/add_key04
| CC testcases/kernel/syscalls/add_key/add_key01
| CC testcases/kernel/syscalls/add_key/add_key05
| CC testcases/kernel/syscalls/adjtimex/adjtimex01
| CC testcases/kernel/syscalls/adjtimex/adjtimex03
| CC testcases/kernel/syscalls/adjtimex/adjtimex02
| CC testcases/kernel/syscalls/alarm/alarm03
| CC testcases/kernel/syscalls/alarm/alarm06
| CC testcases/kernel/syscalls/alarm/alarm02
| CC testcases/kernel/syscalls/alarm/alarm05
| CC testcases/kernel/syscalls/alarm/alarm07
| CC testcases/kernel/syscalls/arch_prctl/arch_prctl01
| CC testcases/kernel/syscalls/bind/bind02
| CC testcases/kernel/syscalls/bind/bind03
| CC testcases/kernel/syscalls/bind/bind01
| CC testcases/kernel/syscalls/bind/bind04
| CC testcases/kernel/syscalls/bind/bind05
| CC testcases/kernel/syscalls/bind/bind06
| CC testcases/kernel/syscalls/bpf/bpf_common.o
| CC testcases/kernel/syscalls/bpf/bpf_prog01
| CC testcases/kernel/syscalls/bpf/bpf_prog04
| CC testcases/kernel/syscalls/bpf/bpf_prog06
| CC testcases/kernel/syscalls/bpf/bpf_prog07
| CC testcases/kernel/syscalls/bpf/bpf_map01
| CC testcases/kernel/syscalls/bpf/bpf_prog02
| CC testcases/kernel/syscalls/bpf/bpf_prog03
| CC testcases/kernel/syscalls/bpf/bpf_prog05
| CC testcases/kernel/syscalls/brk/brk02
| CC testcases/kernel/syscalls/brk/brk01
| CC testcases/kernel/syscalls/cacheflush/cacheflush01
| CC testcases/kernel/syscalls/cachestat/cachestat03
| CC testcases/kernel/syscalls/cachestat/cachestat04
| CC testcases/kernel/syscalls/cachestat/cachestat02
| CC testcases/kernel/syscalls/cachestat/cachestat01
| CC testcases/kernel/syscalls/capget/capget01
| CC testcases/kernel/syscalls/capget/capget02
| CC testcases/kernel/syscalls/capset/capset01
| CC testcases/kernel/syscalls/capset/capset04
| CC testcases/kernel/syscalls/capset/capset03
| CC testcases/kernel/syscalls/capset/capset02
| CC testcases/kernel/syscalls/chdir/chdir04
| CC testcases/kernel/syscalls/chdir/chdir01
| CC testcases/kernel/syscalls/chmod/chmod05
| CC testcases/kernel/syscalls/chmod/chmod07
| CC testcases/kernel/syscalls/chmod/chmod03
| CC testcases/kernel/syscalls/chmod/chmod08
| CC testcases/kernel/syscalls/chmod/chmod01
| CC testcases/kernel/syscalls/chmod/chmod09
| CC testcases/kernel/syscalls/chmod/chmod06
| CC testcases/kernel/syscalls/chown/chown01_16.o
| CC testcases/kernel/syscalls/chown/chown02_16.o
| CC testcases/kernel/syscalls/chown/chown03_16.o
| CC testcases/kernel/syscalls/chown/chown04_16.o
| CC testcases/kernel/syscalls/chown/chown05_16.o
| CC testcases/kernel/syscalls/chown/chown01.o
| CC testcases/kernel/syscalls/chown/chown02.o
| CC testcases/kernel/syscalls/chown/chown05.o
| CC testcases/kernel/syscalls/chown/chown04.o
| CC testcases/kernel/syscalls/chown/chown03.o
| LD testcases/kernel/syscalls/chown/chown01
| LD testcases/kernel/syscalls/chown/chown02
| LD testcases/kernel/syscalls/chown/chown04
| LD testcases/kernel/syscalls/chown/chown05
| LD testcases/kernel/syscalls/chown/chown03
| LD testcases/kernel/syscalls/chown/chown01_16
| LD testcases/kernel/syscalls/chown/chown02_16
| LD testcases/kernel/syscalls/chown/chown04_16
| LD testcases/kernel/syscalls/chown/chown05_16
| LD testcases/kernel/syscalls/chown/chown03_16
| rm chown01.o chown03.o chown02.o chown04_16.o chown05.o chown02_16.o chown01_16.o chown04.o chown03_16.o chown05_16.o
| CC testcases/kernel/syscalls/chroot/chroot01
| CC testcases/kernel/syscalls/chroot/chroot04
| CC testcases/kernel/syscalls/chroot/chroot02
| CC testcases/kernel/syscalls/chroot/chroot03
| CC testcases/kernel/syscalls/clock_adjtime/clock_adjtime02
| CC testcases/kernel/syscalls/clock_adjtime/clock_adjtime01
| CC testcases/kernel/syscalls/clock_getres/clock_getres01
| BUILD libvdso.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime02
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime01
| CC testcases/kernel/syscalls/clock_gettime/leapsec01
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime03
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime04
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep02
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03
| CC testcases/kernel/syscalls/clock_settime/clock_settime02
| CC testcases/kernel/syscalls/clock_settime/clock_settime03
| CC testcases/kernel/syscalls/clock_settime/clock_settime01
| clone02.c: In function 'sig_child_defined_handler':
| clone02.c:452:43: warning: unused parameter 'pid' [-Wunused-parameter]
|   452 | static void sig_child_defined_handler(int pid)
|       |                                       ~~~~^~~
| CC testcases/kernel/syscalls/clone/clone01
| CC testcases/kernel/syscalls/clone/clone05
| CC testcases/kernel/syscalls/clone/clone04
| CC testcases/kernel/syscalls/clone/clone06
| CC testcases/kernel/syscalls/clone/clone03
| CC testcases/kernel/syscalls/clone/clone07
| CC testcases/kernel/syscalls/clone/clone09
| CC testcases/kernel/syscalls/clone/clone02
| CC testcases/kernel/syscalls/clone/clone08
| CC testcases/kernel/syscalls/clone3/clone303
| CC testcases/kernel/syscalls/clone3/clone302
| CC testcases/kernel/syscalls/clone3/clone301
| CC testcases/kernel/syscalls/close/close02
| CC testcases/kernel/syscalls/close/close01
| In file included from close_range01.c:28:
| close_range01.c: In function 'setup':
| ../../../../include/tst_test.h:121:55: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'rlim_t' {aka 'long long unsigned int'} [-Wformat=]
|   121 |                 tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
|       |                                                       ^~~~~~~~~
| close_range01.c:63:17: note: in expansion of macro 'tst_brk'
|    63 |                 tst_brk(TCONF, "NOFILE limit max too low: %lu < 1000",
|       |                 ^~~~~~~
| CC testcases/kernel/syscalls/close_range/close_range02
| CC testcases/kernel/syscalls/close_range/close_range01
| CC testcases/kernel/syscalls/cma/process_vm_readv02
| CC testcases/kernel/syscalls/cma/process_vm_writev02
| CC testcases/kernel/syscalls/cma/process_vm_readv03
| CC testcases/kernel/syscalls/cma/process_vm01
| CC testcases/kernel/syscalls/confstr/confstr01
| In file included from connect01.c:50:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| CC testcases/kernel/syscalls/connect/connect02
| CC testcases/kernel/syscalls/connect/connect01
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range03
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range02
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range01
| CC testcases/kernel/syscalls/creat/creat07_child
| CC testcases/kernel/syscalls/creat/creat04
| CC testcases/kernel/syscalls/creat/creat03
| CC testcases/kernel/syscalls/creat/creat01
| CC testcases/kernel/syscalls/creat/creat07
| CC testcases/kernel/syscalls/creat/creat05
| CC testcases/kernel/syscalls/creat/creat06
| CC testcases/kernel/syscalls/creat/creat09
| CC testcases/kernel/syscalls/creat/creat08
| CC testcases/kernel/syscalls/delete_module/delete_module01
| CC testcases/kernel/syscalls/delete_module/delete_module03
| CC testcases/kernel/syscalls/delete_module/delete_module02
| CC testcases/kernel/syscalls/dup/dup02
| CC testcases/kernel/syscalls/dup/dup04
| CC testcases/kernel/syscalls/dup/dup05
| CC testcases/kernel/syscalls/dup/dup07
| CC testcases/kernel/syscalls/dup/dup01
| CC testcases/kernel/syscalls/dup/dup03
| CC testcases/kernel/syscalls/dup/dup06
| CC testcases/kernel/syscalls/dup2/dup201
| CC testcases/kernel/syscalls/dup2/dup206
| CC testcases/kernel/syscalls/dup2/dup204
| CC testcases/kernel/syscalls/dup2/dup207
| CC testcases/kernel/syscalls/dup2/dup203
| CC testcases/kernel/syscalls/dup2/dup202
| CC testcases/kernel/syscalls/dup2/dup205
| CC testcases/kernel/syscalls/dup3/dup3_02
| CC testcases/kernel/syscalls/dup3/dup3_01
| CC testcases/kernel/syscalls/epoll/epoll-ltp
| CC testcases/kernel/syscalls/epoll_create/epoll_create01
| CC testcases/kernel/syscalls/epoll_create/epoll_create02
| CC testcases/kernel/syscalls/epoll_create1/epoll_create1_01
| CC testcases/kernel/syscalls/epoll_create1/epoll_create1_02
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl02
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl03
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl05
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl04
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl01
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait03
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait02
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait04
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait05
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait01
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait03
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait07
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait02
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait05
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait04
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait06
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait01
| CC testcases/kernel/syscalls/eventfd/eventfd05
| CC testcases/kernel/syscalls/eventfd/eventfd01
| CC testcases/kernel/syscalls/eventfd/eventfd04
| CC testcases/kernel/syscalls/eventfd/eventfd02
| CC testcases/kernel/syscalls/eventfd/eventfd03
| CC testcases/kernel/syscalls/eventfd/eventfd06
| CC testcases/kernel/syscalls/eventfd2/eventfd2_01
| CC testcases/kernel/syscalls/eventfd2/eventfd2_02
| CC testcases/kernel/syscalls/eventfd2/eventfd2_03
| CC testcases/kernel/syscalls/execl/execl01_child
| CC testcases/kernel/syscalls/execl/execl01
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/metadata'
| CC testcases/kernel/syscalls/execle/execle01_child
| CC testcases/kernel/syscalls/execle/execle01
| CC testcases/kernel/syscalls/execlp/execlp01_child
| CC testcases/kernel/syscalls/execlp/execlp01
| CC testcases/kernel/syscalls/execv/execv01_child
| CC testcases/kernel/syscalls/execv/execv01
| execve03.c: In function 'setup':
| execve03.c:97:32: warning: '/fake' directive writing 5 bytes into a region of size between 1 and 1024 [-Wformat-overflow=]
|    97 |         sprintf(test_name3, "%s/fake", test_name5);
|       |                                ^~~~~
| execve03.c:97:9: note: 'sprintf' output between 6 and 1029 bytes into a destination of size 1024
|    97 |         sprintf(test_name3, "%s/fake", test_name5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/execve/execve_child
| CC testcases/kernel/syscalls/execve/execve01_child
| CC testcases/kernel/syscalls/execve/execve02
| CC testcases/kernel/syscalls/execve/execve01
| CC testcases/kernel/syscalls/execve/execve06
| CC testcases/kernel/syscalls/execve/execve05
| CC testcases/kernel/syscalls/execve/execve06_child
| CC testcases/kernel/syscalls/execve/execve04
| CC testcases/kernel/syscalls/execve/execve03
| execveat02.c: In function 'setup':
| execveat02.c:80:35: warning: '%s' directive writing 22 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    80 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |                                   ^~
| execveat02.c:80:9: note: 'sprintf' output between 24 and 535 bytes into a destination of size 512
|    80 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| execveat02.c:81:35: warning: '%s' directive writing 24 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    81 |         sprintf(app_sym_path, "%s/%s", cur_dir_path, TEST_ERL_SYMLINK);
|       |                                   ^~
| execveat02.c:81:9: note: 'sprintf' output between 26 and 537 bytes into a destination of size 512
|    81 |         sprintf(app_sym_path, "%s/%s", cur_dir_path, TEST_ERL_SYMLINK);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| execveat01.c: In function 'setup':
| execveat01.c:72:35: warning: '%s' directive writing 22 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    72 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |                                   ^~
| execveat01.c:72:9: note: 'sprintf' output between 24 and 535 bytes into a destination of size 512
|    72 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/execveat/execveat_child
| CC testcases/kernel/syscalls/execveat/execveat_errno
| CC testcases/kernel/syscalls/execveat/execveat01
| CC testcases/kernel/syscalls/execveat/execveat02
| CC testcases/kernel/syscalls/execveat/execveat03
| CC testcases/kernel/syscalls/execvp/execvp01
| CC testcases/kernel/syscalls/execvp/execvp01_child
| CC testcases/kernel/syscalls/exit/exit01
| CC testcases/kernel/syscalls/exit/exit02
| CC testcases/kernel/syscalls/exit_group/exit_group01
| CC testcases/kernel/syscalls/faccessat/faccessat01
| CC testcases/kernel/syscalls/faccessat/faccessat02
| CC testcases/kernel/syscalls/faccessat2/faccessat201
| CC testcases/kernel/syscalls/faccessat2/faccessat202
| CC testcases/kernel/syscalls/fadvise/posix_fadvise01_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise02_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise02
| CC testcases/kernel/syscalls/fadvise/posix_fadvise03
| CC testcases/kernel/syscalls/fadvise/posix_fadvise04_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise01
| CC testcases/kernel/syscalls/fadvise/posix_fadvise04
| LD testcases/kernel/syscalls/fadvise/posix_fadvise02_64
| CC testcases/kernel/syscalls/fadvise/posix_fadvise03_64.o
| LD testcases/kernel/syscalls/fadvise/posix_fadvise01_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise03_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise04_64
| rm posix_fadvise03_64.o posix_fadvise02_64.o posix_fadvise04_64.o posix_fadvise01_64.o
| CC testcases/kernel/syscalls/fallocate/fallocate02
| CC testcases/kernel/syscalls/fallocate/fallocate03
| CC testcases/kernel/syscalls/fallocate/fallocate01
| CC testcases/kernel/syscalls/fallocate/fallocate05
| CC testcases/kernel/syscalls/fallocate/fallocate04
| CC testcases/kernel/syscalls/fallocate/fallocate06
| CC testcases/kernel/syscalls/fanotify/fanotify01
| CC testcases/kernel/syscalls/fanotify/fanotify12
| CC testcases/kernel/syscalls/fanotify/fanotify15
| CC testcases/kernel/syscalls/fanotify/fanotify14
| CC testcases/kernel/syscalls/fanotify/fanotify13
| CC testcases/kernel/syscalls/fanotify/fanotify18
| CC testcases/kernel/syscalls/fanotify/fanotify11
| CC testcases/kernel/syscalls/fanotify/fanotify17
| CC testcases/kernel/syscalls/fanotify/fanotify16
| CC testcases/kernel/syscalls/fanotify/fanotify09
| CC testcases/kernel/syscalls/fanotify/fanotify10
| CC testcases/kernel/syscalls/fanotify/fanotify_child
| CC testcases/kernel/syscalls/fanotify/fanotify23
| CC testcases/kernel/syscalls/fanotify/fanotify22
| CC testcases/kernel/syscalls/fanotify/fanotify20
| CC testcases/kernel/syscalls/fanotify/fanotify08
| CC testcases/kernel/syscalls/fanotify/fanotify07
| CC testcases/kernel/syscalls/fanotify/fanotify19
| CC testcases/kernel/syscalls/fanotify/fanotify21
| CC testcases/kernel/syscalls/fanotify/fanotify02
| CC testcases/kernel/syscalls/fanotify/fanotify04
| CC testcases/kernel/syscalls/fanotify/fanotify05
| CC testcases/kernel/syscalls/fanotify/fanotify06
| CC testcases/kernel/syscalls/fanotify/fanotify03
| CC testcases/kernel/syscalls/fchdir/fchdir02
| CC testcases/kernel/syscalls/fchdir/fchdir03
| CC testcases/kernel/syscalls/fchdir/fchdir01
| CC testcases/kernel/syscalls/fchmod/fchmod02
| CC testcases/kernel/syscalls/fchmod/fchmod03
| CC testcases/kernel/syscalls/fchmod/fchmod01
| CC testcases/kernel/syscalls/fchmod/fchmod05
| CC testcases/kernel/syscalls/fchmod/fchmod06
| CC testcases/kernel/syscalls/fchmod/fchmod04
| CC testcases/kernel/syscalls/fchmodat/fchmodat02
| CC testcases/kernel/syscalls/fchmodat/fchmodat01
| CC testcases/kernel/syscalls/fchmodat2/fchmodat2_02
| CC testcases/kernel/syscalls/fchmodat2/fchmodat2_01
| CC testcases/kernel/syscalls/fchown/fchown01_16.o
| CC testcases/kernel/syscalls/fchown/fchown02_16.o
| CC testcases/kernel/syscalls/fchown/fchown03_16.o
| CC testcases/kernel/syscalls/fchown/fchown04_16.o
| CC testcases/kernel/syscalls/fchown/fchown05_16.o
| CC testcases/kernel/syscalls/fchown/fchown01.o
| CC testcases/kernel/syscalls/fchown/fchown04.o
| CC testcases/kernel/syscalls/fchown/fchown02.o
| CC testcases/kernel/syscalls/fchown/fchown05.o
| LD testcases/kernel/syscalls/fchown/fchown01_16
| LD testcases/kernel/syscalls/fchown/fchown04
| CC testcases/kernel/syscalls/fchown/fchown03.o
| LD testcases/kernel/syscalls/fchown/fchown01
| LD testcases/kernel/syscalls/fchown/fchown02_16
| LD testcases/kernel/syscalls/fchown/fchown02
| LD testcases/kernel/syscalls/fchown/fchown05
| LD testcases/kernel/syscalls/fchown/fchown03
| LD testcases/kernel/syscalls/fchown/fchown05_16
| LD testcases/kernel/syscalls/fchown/fchown04_16
| LD testcases/kernel/syscalls/fchown/fchown03_16
| rm fchown04_16.o fchown05.o fchown02_16.o fchown02.o fchown03_16.o fchown03.o fchown04.o fchown01.o fchown05_16.o fchown01_16.o
| CC testcases/kernel/syscalls/fchownat/fchownat01
| CC testcases/kernel/syscalls/fchownat/fchownat02
| CC testcases/kernel/syscalls/fcntl/fcntl03
| CC testcases/kernel/syscalls/fcntl/fcntl12
| CC testcases/kernel/syscalls/fcntl/fcntl02
| CC testcases/kernel/syscalls/fcntl/fcntl01
| fcntl16.c: In function 'catch_alarm':
| fcntl16.c:338:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   338 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl16.c: In function 'catch_usr1':
| fcntl16.c:343:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   343 | void catch_usr1(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_usr2':
| fcntl16.c:352:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   352 | void catch_usr2(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_int':
| fcntl16.c:361:20: warning: unused parameter 'sig' [-Wunused-parameter]
|   361 | void catch_int(int sig)
|       |                ~~~~^~~
| CC testcases/kernel/syscalls/fcntl/fcntl14
| CC testcases/kernel/syscalls/fcntl/fcntl18
| CC testcases/kernel/syscalls/fcntl/fcntl09
| CC testcases/kernel/syscalls/fcntl/fcntl11
| CC testcases/kernel/syscalls/fcntl/fcntl13
| CC testcases/kernel/syscalls/fcntl/fcntl10
| CC testcases/kernel/syscalls/fcntl/fcntl08
| CC testcases/kernel/syscalls/fcntl/fcntl04
| CC testcases/kernel/syscalls/fcntl/fcntl07
| CC testcases/kernel/syscalls/fcntl/fcntl05
| CC testcases/kernel/syscalls/fcntl/fcntl15
| CC testcases/kernel/syscalls/fcntl/fcntl17
| CC testcases/kernel/syscalls/fcntl/fcntl23
| CC testcases/kernel/syscalls/fcntl/fcntl16
| CC testcases/kernel/syscalls/fcntl/fcntl22
| CC testcases/kernel/syscalls/fcntl/fcntl24
| CC testcases/kernel/syscalls/fcntl/fcntl27
| CC testcases/kernel/syscalls/fcntl/fcntl25
| CC testcases/kernel/syscalls/fcntl/fcntl01_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl26
| CC testcases/kernel/syscalls/fcntl/fcntl19
| CC testcases/kernel/syscalls/fcntl/fcntl29
| CC testcases/kernel/syscalls/fcntl/fcntl02_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl03_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl04_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl32
| CC testcases/kernel/syscalls/fcntl/fcntl05_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl30
| CC testcases/kernel/syscalls/fcntl/fcntl07_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl35
| CC testcases/kernel/syscalls/fcntl/fcntl08_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl09_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl37
| CC testcases/kernel/syscalls/fcntl/fcntl10_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl11_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl38
| CC testcases/kernel/syscalls/fcntl/fcntl12_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl34
| CC testcases/kernel/syscalls/fcntl/fcntl13_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl14_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl33
| CC testcases/kernel/syscalls/fcntl/fcntl15_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl16_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl17_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl18_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl20
| CC testcases/kernel/syscalls/fcntl/fcntl19_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl31
| CC testcases/kernel/syscalls/fcntl/fcntl20_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl39
| CC testcases/kernel/syscalls/fcntl/fcntl21_64.o
| fcntl16.c: In function 'catch_alarm':
| fcntl16.c:338:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   338 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl16.c: In function 'catch_usr1':
| fcntl16.c:343:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   343 | void catch_usr1(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_usr2':
| fcntl16.c:352:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   352 | void catch_usr2(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_int':
| fcntl16.c:361:20: warning: unused parameter 'sig' [-Wunused-parameter]
|   361 | void catch_int(int sig)
|       |                ~~~~^~~
| CC testcases/kernel/syscalls/fcntl/fcntl22_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl23_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl24_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl25_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl26_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl36
| CC testcases/kernel/syscalls/fcntl/fcntl21
| CC testcases/kernel/syscalls/fcntl/fcntl30_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl29_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl27_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl31_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl32_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl33_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl34_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl35_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl36_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl37_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl38_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl39_64.o
| LD testcases/kernel/syscalls/fcntl/fcntl01_64
| LD testcases/kernel/syscalls/fcntl/fcntl02_64
| LD testcases/kernel/syscalls/fcntl/fcntl03_64
| LD testcases/kernel/syscalls/fcntl/fcntl04_64
| LD testcases/kernel/syscalls/fcntl/fcntl08_64
| LD testcases/kernel/syscalls/fcntl/fcntl09_64
| LD testcases/kernel/syscalls/fcntl/fcntl07_64
| LD testcases/kernel/syscalls/fcntl/fcntl11_64
| LD testcases/kernel/syscalls/fcntl/fcntl10_64
| LD testcases/kernel/syscalls/fcntl/fcntl05_64
| LD testcases/kernel/syscalls/fcntl/fcntl13_64
| LD testcases/kernel/syscalls/fcntl/fcntl12_64
| LD testcases/kernel/syscalls/fcntl/fcntl14_64
| LD testcases/kernel/syscalls/fcntl/fcntl15_64
| LD testcases/kernel/syscalls/fcntl/fcntl16_64
| LD testcases/kernel/syscalls/fcntl/fcntl30_64
| LD testcases/kernel/syscalls/fcntl/fcntl27_64
| LD testcases/kernel/syscalls/fcntl/fcntl29_64
| LD testcases/kernel/syscalls/fcntl/fcntl32_64
| LD testcases/kernel/syscalls/fcntl/fcntl31_64
| LD testcases/kernel/syscalls/fcntl/fcntl26_64
| LD testcases/kernel/syscalls/fcntl/fcntl37_64
| LD testcases/kernel/syscalls/fcntl/fcntl35_64
| LD testcases/kernel/syscalls/fcntl/fcntl33_64
| LD testcases/kernel/syscalls/fcntl/fcntl34_64
| LD testcases/kernel/syscalls/fcntl/fcntl36_64
| LD testcases/kernel/syscalls/fcntl/fcntl21_64
| LD testcases/kernel/syscalls/fcntl/fcntl23_64
| LD testcases/kernel/syscalls/fcntl/fcntl24_64
| LD testcases/kernel/syscalls/fcntl/fcntl39_64
| LD testcases/kernel/syscalls/fcntl/fcntl22_64
| LD testcases/kernel/syscalls/fcntl/fcntl38_64
| LD testcases/kernel/syscalls/fcntl/fcntl25_64
| LD testcases/kernel/syscalls/fcntl/fcntl20_64
| LD testcases/kernel/syscalls/fcntl/fcntl19_64
| LD testcases/kernel/syscalls/fcntl/fcntl18_64
| LD testcases/kernel/syscalls/fcntl/fcntl17_64
| rm fcntl35_64.o fcntl08_64.o fcntl03_64.o fcntl23_64.o fcntl29_64.o fcntl25_64.o fcntl30_64.o fcntl34_64.o fcntl37_64.o fcntl19_64.o fcntl14_64.o fcntl20_64.o fcntl21_64.o fcntl31_64.o fcntl15_64.o fcntl07_64.o fcntl12_64.o fcntl26_64.o fcntl10_64.o fcntl22_64.o fcntl13_64.o fcntl02_64.o fcntl11_64.o fcntl17_64.o fcntl38_64.o fcntl24_64.o fcntl16_64.o fcntl04_64.o fcntl18_64.o fcntl09_64.o fcntl33_64.o fcntl32_64.o fcntl05_64.o fcntl27_64.o fcntl39_64.o fcntl36_64.o fcntl01_64.o
| CC testcases/kernel/syscalls/fdatasync/fdatasync01
| CC testcases/kernel/syscalls/fdatasync/fdatasync03
| CC testcases/kernel/syscalls/fdatasync/fdatasync02
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr03
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr01
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr02
| CC testcases/kernel/syscalls/finit_module/finit_module01
| CC testcases/kernel/syscalls/finit_module/finit_module02
| CC testcases/kernel/syscalls/flistxattr/flistxattr02
| CC testcases/kernel/syscalls/flistxattr/flistxattr01
| CC testcases/kernel/syscalls/flistxattr/flistxattr03
| CC testcases/kernel/syscalls/flock/flock01
| CC testcases/kernel/syscalls/flock/flock02
| CC testcases/kernel/syscalls/flock/flock03
| CC testcases/kernel/syscalls/flock/flock06
| CC testcases/kernel/syscalls/flock/flock04
| make[4]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fork/fork03
| CC testcases/kernel/syscalls/fork/fork05
| CC testcases/kernel/syscalls/fork/fork04
| CC testcases/kernel/syscalls/fork/fork01
| CC testcases/kernel/syscalls/fork/fork10
| CC testcases/kernel/syscalls/fork/fork13
| CC testcases/kernel/syscalls/fork/fork07
| CC testcases/kernel/syscalls/fork/fork_procs
| CC testcases/kernel/syscalls/fork/fork14
| CC testcases/kernel/syscalls/fork/fork08
| CC testcases/kernel/syscalls/fork/fork09
| CC testcases/kernel/syscalls/fpathconf/fpathconf01
| CC testcases/kernel/syscalls/fremovexattr/fremovexattr02
| CC testcases/kernel/syscalls/fremovexattr/fremovexattr01
| CC testcases/kernel/syscalls/fsconfig/fsconfig02
| CC testcases/kernel/syscalls/fsconfig/fsconfig03
| CC testcases/kernel/syscalls/fsconfig/fsconfig01
| CC testcases/kernel/syscalls/fsetxattr/fsetxattr01
| CC testcases/kernel/syscalls/fsetxattr/fsetxattr02
| CC testcases/kernel/syscalls/fsmount/fsmount01
| CC testcases/kernel/syscalls/fsmount/fsmount02
| CC testcases/kernel/syscalls/fsopen/fsopen01
| CC testcases/kernel/syscalls/fsopen/fsopen02
| CC testcases/kernel/syscalls/fspick/fspick01
| CC testcases/kernel/syscalls/fspick/fspick02
| CC testcases/kernel/syscalls/fstat/fstat02_64.o
| CC testcases/kernel/syscalls/fstat/fstat03_64.o
| In file included from fstat03.c:19:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/wait.h:1:2: warning: #warning redirecting incorrect #include <wait.h> to <sys/wait.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <wait.h> to <sys/wait.h>
|       |  ^~~~~~~
| In file included from fstat03.c:19:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/wait.h:1:2: warning: #warning redirecting incorrect #include <wait.h> to <sys/wait.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <wait.h> to <sys/wait.h>
|       |  ^~~~~~~
| LD testcases/kernel/syscalls/fstat/fstat02_64
| CC testcases/kernel/syscalls/fstat/fstat02
| LD testcases/kernel/syscalls/fstat/fstat03_64
| CC testcases/kernel/syscalls/fstat/fstat03
| rm fstat02_64.o fstat03_64.o
| CC testcases/kernel/syscalls/fstatat/fstatat01
| CC testcases/kernel/syscalls/fstatfs/fstatfs01_64.o
| CC testcases/kernel/syscalls/fstatfs/fstatfs02_64.o
| LD testcases/kernel/syscalls/fstatfs/fstatfs01_64
| CC testcases/kernel/syscalls/fstatfs/fstatfs02
| CC testcases/kernel/syscalls/fstatfs/fstatfs01
| LD testcases/kernel/syscalls/fstatfs/fstatfs02_64
| rm fstatfs02_64.o fstatfs01_64.o
| CC testcases/kernel/syscalls/fsync/fsync04
| CC testcases/kernel/syscalls/fsync/fsync03
| CC testcases/kernel/syscalls/fsync/fsync01
| CC testcases/kernel/syscalls/fsync/fsync02
| CC testcases/kernel/syscalls/ftruncate/ftruncate01_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate03_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate04_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate03
| CC testcases/kernel/syscalls/ftruncate/ftruncate01
| CC testcases/kernel/syscalls/ftruncate/ftruncate04
| LD testcases/kernel/syscalls/ftruncate/ftruncate03_64
| LD testcases/kernel/syscalls/ftruncate/ftruncate04_64
| LD testcases/kernel/syscalls/ftruncate/ftruncate01_64
| rm ftruncate03_64.o ftruncate01_64.o ftruncate04_64.o
| CC testcases/kernel/syscalls/futex/futex_wake01
| CC testcases/kernel/syscalls/futex/futex_wait04
| CC testcases/kernel/syscalls/futex/futex_cmp_requeue02
| CC testcases/kernel/syscalls/futex/futex_wait05
| CC testcases/kernel/syscalls/futex/futex_wait02
| CC testcases/kernel/syscalls/futex/futex_wait03
| CC testcases/kernel/syscalls/futex/futex_wait01
| CC testcases/kernel/syscalls/futex/futex_waitv02
| CC testcases/kernel/syscalls/futex/futex_waitv03
| CC testcases/kernel/syscalls/futex/futex_cmp_requeue01
| CC testcases/kernel/syscalls/futex/futex_waitv01
| CC testcases/kernel/syscalls/futex/futex_wait_bitset01
| CC testcases/kernel/syscalls/futex/futex_wake03
| CC testcases/kernel/syscalls/futex/futex_wake02
| CC testcases/kernel/syscalls/futex/futex_wake04
| CC testcases/kernel/syscalls/futimesat/futimesat01
| BUILD libnuma.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/get_mempolicy/get_mempolicy02
| CC testcases/kernel/syscalls/get_mempolicy/get_mempolicy01
| CC testcases/kernel/syscalls/get_robust_list/get_robust_list01
| make[4]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getcpu/getcpu02
| CC testcases/kernel/syscalls/getcpu/getcpu01
| CC testcases/kernel/syscalls/getcwd/getcwd03
| CC testcases/kernel/syscalls/getcwd/getcwd02
| CC testcases/kernel/syscalls/getcwd/getcwd04
| CC testcases/kernel/syscalls/getcwd/getcwd01
| CC testcases/kernel/syscalls/getdents/getdents02
| CC testcases/kernel/syscalls/getdents/getdents01
| CC testcases/kernel/syscalls/getdomainname/getdomainname01
| CC testcases/kernel/syscalls/getegid/getegid01_16.o
| CC testcases/kernel/syscalls/getegid/getegid02_16.o
| CC testcases/kernel/syscalls/getegid/getegid01.o
| CC testcases/kernel/syscalls/getegid/getegid02.o
| LD testcases/kernel/syscalls/getegid/getegid02_16
| LD testcases/kernel/syscalls/getegid/getegid01_16
| LD testcases/kernel/syscalls/getegid/getegid01
| LD testcases/kernel/syscalls/getegid/getegid02
| rm getegid01.o getegid01_16.o getegid02_16.o getegid02.o
| CC testcases/kernel/syscalls/geteuid/geteuid01_16.o
| CC testcases/kernel/syscalls/geteuid/geteuid02_16.o
| CC testcases/kernel/syscalls/geteuid/geteuid02.o
| CC testcases/kernel/syscalls/geteuid/geteuid01.o
| LD testcases/kernel/syscalls/geteuid/geteuid02
| LD testcases/kernel/syscalls/geteuid/geteuid02_16
| LD testcases/kernel/syscalls/geteuid/geteuid01_16
| LD testcases/kernel/syscalls/geteuid/geteuid01
| rm geteuid01_16.o geteuid02_16.o geteuid01.o geteuid02.o
| CC testcases/kernel/syscalls/getgid/getgid01_16.o
| CC testcases/kernel/syscalls/getgid/getgid03_16.o
| CC testcases/kernel/syscalls/getgid/getgid01.o
| LD testcases/kernel/syscalls/getgid/getgid01
| CC testcases/kernel/syscalls/getgid/getgid03.o
| LD testcases/kernel/syscalls/getgid/getgid01_16
| LD testcases/kernel/syscalls/getgid/getgid03_16
| LD testcases/kernel/syscalls/getgid/getgid03
| rm getgid01.o getgid03_16.o getgid01_16.o getgid03.o
| CC testcases/kernel/syscalls/getgroups/getgroups01_16.o
| CC testcases/kernel/syscalls/getgroups/getgroups03_16.o
| CC testcases/kernel/syscalls/getgroups/getgroups01.o
| CC testcases/kernel/syscalls/getgroups/getgroups03.o
| LD testcases/kernel/syscalls/getgroups/getgroups01_16
| LD testcases/kernel/syscalls/getgroups/getgroups01
| LD testcases/kernel/syscalls/getgroups/getgroups03_16
| LD testcases/kernel/syscalls/getgroups/getgroups03
| rm getgroups01.o getgroups01_16.o getgroups03_16.o getgroups03.o
| CC testcases/kernel/syscalls/gethostbyname_r/gethostbyname_r01
| CC testcases/kernel/syscalls/gethostid/gethostid01
| CC testcases/kernel/syscalls/gethostname/gethostname01
| CC testcases/kernel/syscalls/gethostname/gethostname02
| CC testcases/kernel/syscalls/getitimer/getitimer02
| CC testcases/kernel/syscalls/getitimer/getitimer01
| CC testcases/kernel/syscalls/getpagesize/getpagesize01
| CC testcases/kernel/syscalls/getpeername/getpeername01
| CC testcases/kernel/syscalls/getpgid/getpgid02
| CC testcases/kernel/syscalls/getpgid/getpgid01
| CC testcases/kernel/syscalls/getpgrp/getpgrp01
| CC testcases/kernel/syscalls/getpid/getpid01
| CC testcases/kernel/syscalls/getpid/getpid02
| CC testcases/kernel/syscalls/getppid/getppid02
| CC testcases/kernel/syscalls/getppid/getppid01
| CC testcases/kernel/syscalls/getpriority/getpriority01
| CC testcases/kernel/syscalls/getpriority/getpriority02
| CC testcases/kernel/syscalls/getrandom/getrandom03
| CC testcases/kernel/syscalls/getrandom/getrandom04
| CC testcases/kernel/syscalls/getrandom/getrandom01
| CC testcases/kernel/syscalls/getrandom/getrandom02
| CC testcases/kernel/syscalls/getrandom/getrandom05
| CC testcases/kernel/syscalls/getresgid/getresgid01_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid03_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid02_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid01.o
| CC testcases/kernel/syscalls/getresgid/getresgid02.o
| CC testcases/kernel/syscalls/getresgid/getresgid03.o
| LD testcases/kernel/syscalls/getresgid/getresgid02
| LD testcases/kernel/syscalls/getresgid/getresgid01
| LD testcases/kernel/syscalls/getresgid/getresgid02_16
| LD testcases/kernel/syscalls/getresgid/getresgid01_16
| LD testcases/kernel/syscalls/getresgid/getresgid03_16
| LD testcases/kernel/syscalls/getresgid/getresgid03
| rm getresgid03.o getresgid03_16.o getresgid01_16.o getresgid02_16.o getresgid01.o getresgid02.o
| CC testcases/kernel/syscalls/getresuid/getresuid02_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid01_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid03_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid02.o
| CC testcases/kernel/syscalls/getresuid/getresuid01.o
| CC testcases/kernel/syscalls/getresuid/getresuid03.o
| LD testcases/kernel/syscalls/getresuid/getresuid01
| LD testcases/kernel/syscalls/getresuid/getresuid02
| LD testcases/kernel/syscalls/getresuid/getresuid02_16
| LD testcases/kernel/syscalls/getresuid/getresuid03
| LD testcases/kernel/syscalls/getresuid/getresuid01_16
| LD testcases/kernel/syscalls/getresuid/getresuid03_16
| rm getresuid02_16.o getresuid02.o getresuid01_16.o getresuid01.o getresuid03.o getresuid03_16.o
| CC testcases/kernel/syscalls/getrlimit/getrlimit01
| CC testcases/kernel/syscalls/getrlimit/getrlimit02
| CC testcases/kernel/syscalls/getrlimit/getrlimit03
| CC testcases/kernel/syscalls/getrusage/getrusage01
| CC testcases/kernel/syscalls/getrusage/getrusage04
| CC testcases/kernel/syscalls/getrusage/getrusage02
| CC testcases/kernel/syscalls/getrusage/getrusage03_child
| CC testcases/kernel/syscalls/getrusage/getrusage03
| CC testcases/kernel/syscalls/getsid/getsid01
| CC testcases/kernel/syscalls/getsid/getsid02
| CC testcases/kernel/syscalls/getsockname/getsockname01
| CC testcases/kernel/syscalls/getsockopt/getsockopt02
| CC testcases/kernel/syscalls/getsockopt/getsockopt01
| CC testcases/kernel/syscalls/gettid/gettid01
| CC testcases/kernel/syscalls/gettid/gettid02
| CC testcases/kernel/syscalls/gettimeofday/gettimeofday01
| CC testcases/kernel/syscalls/gettimeofday/gettimeofday02
| CC testcases/kernel/syscalls/getuid/getuid01.o
| CC testcases/kernel/syscalls/getuid/getuid03_16.o
| CC testcases/kernel/syscalls/getuid/getuid01_16.o
| LD testcases/kernel/syscalls/getuid/getuid01
| LD testcases/kernel/syscalls/getuid/getuid03_16
| CC testcases/kernel/syscalls/getuid/getuid03.o
| LD testcases/kernel/syscalls/getuid/getuid01_16
| LD testcases/kernel/syscalls/getuid/getuid03
| rm getuid03.o getuid03_16.o getuid01.o getuid01_16.o
| CC testcases/kernel/syscalls/getxattr/getxattr03
| CC testcases/kernel/syscalls/getxattr/getxattr04
| CC testcases/kernel/syscalls/getxattr/getxattr01
| CC testcases/kernel/syscalls/getxattr/getxattr02
| CC testcases/kernel/syscalls/getxattr/getxattr05
| CC testcases/kernel/syscalls/init_module/init_module01
| CC testcases/kernel/syscalls/init_module/init_module02
| inotify02.c: In function 'verify_inotify':
| inotify02.c:99:39: warning: '.rename1' directive output may be truncated writing 8 bytes into a region of size between 1 and 256 [-Wformat-truncation=]
|    99 |         snprintf(fname2, BUF_SIZE, "%s.rename1", fname1);
|       |                                       ^~~~~~~~
| inotify02.c:99:9: note: 'snprintf' output between 9 and 264 bytes into a destination of size 256
|    99 |         snprintf(fname2, BUF_SIZE, "%s.rename1", fname1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| inotify02.c:116:39: warning: '.rename2' directive output may be truncated writing 8 bytes into a region of size between 1 and 256 [-Wformat-truncation=]
|   116 |         snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
|       |                                       ^~~~~~~~
| inotify02.c:116:9: note: 'snprintf' output between 9 and 264 bytes into a destination of size 256
|   116 |         snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/inotify/inotify06
| CC testcases/kernel/syscalls/inotify/inotify11
| CC testcases/kernel/syscalls/inotify/inotify04
| CC testcases/kernel/syscalls/inotify/inotify03
| CC testcases/kernel/syscalls/inotify/inotify05
| CC testcases/kernel/syscalls/inotify/inotify02
| CC testcases/kernel/syscalls/inotify/inotify01
| CC testcases/kernel/syscalls/inotify/inotify08
| CC testcases/kernel/syscalls/inotify/inotify12
| CC testcases/kernel/syscalls/inotify/inotify07
| CC testcases/kernel/syscalls/inotify/inotify10
| CC testcases/kernel/syscalls/inotify/inotify09
| CC testcases/kernel/syscalls/inotify_init/inotify_init1_01
| CC testcases/kernel/syscalls/inotify_init/inotify_init1_02
| CC testcases/kernel/syscalls/io_cancel/io_cancel02
| CC testcases/kernel/syscalls/io_cancel/io_cancel01
| CC testcases/kernel/syscalls/io_destroy/io_destroy01
| CC testcases/kernel/syscalls/io_destroy/io_destroy02
| CC testcases/kernel/syscalls/io_getevents/io_getevents02
| CC testcases/kernel/syscalls/io_getevents/io_getevents01
| CC testcases/kernel/syscalls/io_pgetevents/io_pgetevents01
| CC testcases/kernel/syscalls/io_pgetevents/io_pgetevents02
| CC testcases/kernel/syscalls/io_setup/io_setup01
| CC testcases/kernel/syscalls/io_setup/io_setup02
| CC testcases/kernel/syscalls/io_submit/io_submit02
| CC testcases/kernel/syscalls/io_submit/io_submit01
| CC testcases/kernel/syscalls/io_submit/io_submit03
| CC testcases/kernel/syscalls/io_uring/io_uring02
| CC testcases/kernel/syscalls/io_uring/io_uring01
| CC testcases/kernel/syscalls/ioctl/ioctl03
| CC testcases/kernel/syscalls/ioctl/ioctl07
| CC testcases/kernel/syscalls/ioctl/ioctl05
| CC testcases/kernel/syscalls/ioctl/ioctl04
| CC testcases/kernel/syscalls/ioctl/ioctl06
| CC testcases/kernel/syscalls/ioctl/ioctl08
| CC testcases/kernel/syscalls/ioctl/ioctl01
| CC testcases/kernel/syscalls/ioctl/ioctl09
| CC testcases/kernel/syscalls/ioctl/ioctl02
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone01
| CC testcases/kernel/syscalls/ioctl/ioctl_loop03
| CC testcases/kernel/syscalls/ioctl/ioctl_loop01
| CC testcases/kernel/syscalls/ioctl/ioctl_ns03
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlonerange02
| CC testcases/kernel/syscalls/ioctl/ioctl_loop02
| CC testcases/kernel/syscalls/ioctl/ioctl_loop05
| CC testcases/kernel/syscalls/ioctl/ioctl_loop07
| CC testcases/kernel/syscalls/ioctl/ioctl_ns01
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone04
| CC testcases/kernel/syscalls/ioctl/ioctl_loop04
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01
| CC testcases/kernel/syscalls/ioctl/ioctl_loop06
| CC testcases/kernel/syscalls/ioctl/ioctl_ns04
| CC testcases/kernel/syscalls/ioctl/ioctl_ns07
| CC testcases/kernel/syscalls/ioctl/ioctl_ns02
| CC testcases/kernel/syscalls/ioctl/ioctl_ns05
| CC testcases/kernel/syscalls/ioctl/ioctl_ns06
| CC testcases/kernel/syscalls/ioctl/ioctl_sg01
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone03
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone02
| CC testcases/kernel/syscalls/ioperm/ioperm01
| CC testcases/kernel/syscalls/ioperm/ioperm02
| CC testcases/kernel/syscalls/iopl/iopl01
| CC testcases/kernel/syscalls/iopl/iopl02
| CC testcases/kernel/syscalls/ioprio/ioprio_set01
| CC testcases/kernel/syscalls/ioprio/ioprio_set02
| CC testcases/kernel/syscalls/ioprio/ioprio_get01
| CC testcases/kernel/syscalls/ioprio/ioprio_set03
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl03
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl02
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl05
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl01
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl04
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl12
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl06
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgget/msgget01
| CC testcases/kernel/syscalls/ipc/msgget/msgget02
| CC testcases/kernel/syscalls/ipc/msgget/msgget04
| CC testcases/kernel/syscalls/ipc/msgget/msgget03
| CC testcases/kernel/syscalls/ipc/msgget/msgget05
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv01
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv06
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv08
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv03
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv05
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv02
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv07
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd01
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd02
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd05
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd06
| CC testcases/kernel/syscalls/ipc/msgstress/msgstress01
| BUILD libipc.a
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| semctl06.c: In function 'term':
| semctl06.c:283:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   283 | static void term(int sig)
|       |                  ~~~~^~~
| In file included from semctl07.c:23:
| semctl07.c: In function 'verify_semctl':
| ../../../../../include/tst_test.h:74:55: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
|    74 |                 tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
|       |                                                       ^~~~~~~~~
| semctl07.c:41:17: note: in expansion of macro 'tst_res'
|    41 |                 tst_res(TFAIL, "sem_nsems = %lu, expected %lu",
|       |                 ^~~~~~~
| ../../../../../include/tst_test.h:74:55: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
|    74 |                 tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
|       |                                                       ^~~~~~~~~
| semctl07.c:44:17: note: in expansion of macro 'tst_res'
|    44 |                 tst_res(TPASS, "sem_nsems = %lu", arg.buf->sem_nsems);
|       |                 ^~~~~~~
| CC testcases/kernel/syscalls/ipc/semctl/semctl08
| CC testcases/kernel/syscalls/ipc/semctl/semctl02
| CC testcases/kernel/syscalls/ipc/semctl/semctl03
| CC testcases/kernel/syscalls/ipc/semctl/semctl07
| CC testcases/kernel/syscalls/ipc/semctl/semctl05
| CC testcases/kernel/syscalls/ipc/semctl/semctl04
| CC testcases/kernel/syscalls/ipc/semctl/semctl01
| CC testcases/kernel/syscalls/ipc/semctl/semctl06
| semctl09.c: In function 'do_semctl':
| semctl09.c:61:16: warning: storing the address of local variable 'info' in 'un.buf' [-Wdangling-pointer=]
|    61 |         un.buf = &info;
|       |         ~~~~~~~^~~~~~~
| semctl09.c:59:25: note: 'info' declared here
|    59 |         struct semid_ds info;
|       |                         ^~~~
| semctl09.c:51:20: note: 'un' declared here
|    51 | static union semun un;
|       |                    ^~
| CC testcases/kernel/syscalls/ipc/semctl/semctl09
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/semget/semget02
| CC testcases/kernel/syscalls/ipc/semget/semget05
| CC testcases/kernel/syscalls/ipc/semget/semget01
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| semop05.c: In function 'main':
| semop05.c:74:16: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
|    74 |         int i, rc;
|       |                ^~
| semop05.c: In function 'waiter':
| semop05.c:123:20: warning: unused parameter 'foo' [-Wunused-parameter]
|   123 | void *waiter(void *foo)
|       |              ~~~~~~^~~
| semop05.c: In function 'poster':
| semop05.c:142:20: warning: unused parameter 'foo' [-Wunused-parameter]
|   142 | void *poster(void *foo)
|       |              ~~~~~~^~~
| CC testcases/kernel/syscalls/ipc/semop/semop05
| CC testcases/kernel/syscalls/ipc/semop/semop04
| CC testcases/kernel/syscalls/ipc/semop/semop03
| CC testcases/kernel/syscalls/ipc/semop/semop01
| CC testcases/kernel/syscalls/ipc/semop/semop02
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmat/shmat02
| CC testcases/kernel/syscalls/ipc/shmat/shmat04
| CC testcases/kernel/syscalls/ipc/shmat/shmat01
| CC testcases/kernel/syscalls/ipc/shmat/shmat03
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| shmctl08.c: In function 'check_mode':
| shmctl08.c:41:31: warning: comparison of integer expressions of different signedness: 'mode_t' {aka 'unsigned int'} and 'short int' [-Wsign-compare]
|    41 |         if (ds->shm_perm.mode == exp_mode) {
|       |                               ^~
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl03
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl08
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl06
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl07
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl02
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl04
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl01
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl05
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmdt/shmdt02
| CC testcases/kernel/syscalls/ipc/shmdt/shmdt01
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmget/shmget04
| CC testcases/kernel/syscalls/ipc/shmget/shmget05
| CC testcases/kernel/syscalls/ipc/shmget/shmget03
| CC testcases/kernel/syscalls/ipc/shmget/shmget02
| CC testcases/kernel/syscalls/ipc/shmget/shmget06
| CC testcases/kernel/syscalls/kcmp/kcmp03
| CC testcases/kernel/syscalls/kcmp/kcmp01
| CC testcases/kernel/syscalls/kcmp/kcmp02
| CC testcases/kernel/syscalls/keyctl/keyctl08
| CC testcases/kernel/syscalls/keyctl/keyctl01
| CC testcases/kernel/syscalls/keyctl/keyctl06
| CC testcases/kernel/syscalls/keyctl/keyctl03
| CC testcases/kernel/syscalls/keyctl/keyctl04
| CC testcases/kernel/syscalls/keyctl/keyctl09
| CC testcases/kernel/syscalls/keyctl/keyctl07
| CC testcases/kernel/syscalls/keyctl/keyctl02
| CC testcases/kernel/syscalls/keyctl/keyctl05
| BUILD libipc.a
| BUILD libnewipc.a
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| kill07.c: In function 'main':
| kill07.c:90:39: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
|    90 |         int exno, status, nsig, asig, ret;
|       |                                       ^~~
| kill07.c:90:13: warning: variable 'exno' set but not used [-Wunused-but-set-variable]
|    90 |         int exno, status, nsig, asig, ret;
|       |             ^~~~
| kill07.c: In function 'sighandler':
| kill07.c:177:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   177 | void sighandler(int sig)
|       |                 ~~~~^~~
| kill10.c: In function 'ack_ready':
| kill10.c:365:47: warning: unused parameter 'data' [-Wunused-parameter]
|   365 | void ack_ready(int sig, siginfo_t * si, void *data)
|       |                                         ~~~~~~^~~~
| kill10.c: In function 'ack_done':
| kill10.c:392:46: warning: unused parameter 'data' [-Wunused-parameter]
|   392 | void ack_done(int sig, siginfo_t * si, void *data)
|       |                                        ~~~~~~^~~~
| kill10.c: In function 'set_create_procs':
| kill10.c:477:27: warning: unused parameter 'sig' [-Wunused-parameter]
|   477 | void set_create_procs(int sig)
|       |                       ~~~~^~~
| kill10.c: In function 'graceful_exit':
| kill10.c:608:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   608 | void graceful_exit(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'set_signal_parents':
| kill10.c:613:29: warning: unused parameter 'sig' [-Wunused-parameter]
|   613 | void set_signal_parents(int sig)
|       |                         ~~~~^~~
| kill10.c: In function 'clear_signal_parents':
| kill10.c:620:31: warning: unused parameter 'sig' [-Wunused-parameter]
|   620 | void clear_signal_parents(int sig)
|       |                           ~~~~^~~
| kill10.c: In function 'set_confirmed_ready':
| kill10.c:627:30: warning: unused parameter 'sig' [-Wunused-parameter]
|   627 | void set_confirmed_ready(int sig)
|       |                          ~~~~^~~
| kill10.c: In function 'reset_counter':
| kill10.c:635:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   635 | void reset_counter(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'reply_to_child':
| kill10.c:643:25: warning: unused parameter 'sig' [-Wunused-parameter]
|   643 | void reply_to_child(int sig, siginfo_t * si, void *data)
|       |                     ~~~~^~~
| kill10.c:643:52: warning: unused parameter 'data' [-Wunused-parameter]
|   643 | void reply_to_child(int sig, siginfo_t * si, void *data)
|       |                                              ~~~~~~^~~~
| kill10.c: In function 'wakeup':
| kill10.c:670:17: warning: unused parameter 'sig' [-Wunused-parameter]
|   670 | void wakeup(int sig)
|       |             ~~~~^~~
| kill02.c: In function 'setup':
| kill02.c:603:13: warning: variable 'errno_buf' set but not used [-Wunused-but-set-variable]
|   603 |         int errno_buf;          /*indicates the errno if pipe set up fails.             */
|       |             ^~~~~~~~~
| kill09.c: In function 'alarm_handler':
| kill09.c:195:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   195 | void alarm_handler(int sig)
|       |                    ~~~~^~~
| kill12.c: In function 'main':
| kill12.c:168:39: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
|   168 |                                 } else;
|       |                                       ^
| kill12.c:79:13: warning: variable 'core' set but not used [-Wunused-but-set-variable]
|    79 |         int core;
|       |             ^~~~
| kill12.c:77:19: warning: variable 'exno' set but not used [-Wunused-but-set-variable]
|    77 |         int nsig, exno, nexno, status;
|       |                   ^~~~
| In file included from kill11.c:25:
| kill11.c: In function 'setup':
| ../../../../include/tst_test.h:121:55: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'rlim_t' {aka 'long long unsigned int'} [-Wformat=]
|   121 |                 tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
|       |                                                       ^~~~~~~~~
| kill11.c:112:25: note: in expansion of macro 'tst_brk'
|   112 |                         tst_brk(TCONF, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
|       |                         ^~~~~~~
| CC testcases/kernel/syscalls/kill/kill08
| In function 'parent_rout',
|     inlined from 'parent_rout' at kill02.c:256:6:
| kill02.c:277:9: warning: 'strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   277 |         strncpy(buf_tmp1, pipe_buf, 1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:283:9: warning: 'strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   283 |         strncpy(buf_tmp2, pipe_buf, 1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:397:17: warning: 'strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   397 |                 strncpy(buf_tmp1, pipe_buf, 1);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/kill/kill07
| CC testcases/kernel/syscalls/kill/kill09
| CC testcases/kernel/syscalls/kill/kill03
| CC testcases/kernel/syscalls/kill/kill05
| CC testcases/kernel/syscalls/kill/kill11
| CC testcases/kernel/syscalls/kill/kill12
| CC testcases/kernel/syscalls/kill/kill06
| CC testcases/kernel/syscalls/kill/kill13
| CC testcases/kernel/syscalls/kill/kill02
| CC testcases/kernel/syscalls/kill/kill10
| CC testcases/kernel/syscalls/landlock/landlock_exec
| CC testcases/kernel/syscalls/landlock/landlock01
| CC testcases/kernel/syscalls/landlock/landlock06
| CC testcases/kernel/syscalls/landlock/landlock05
| CC testcases/kernel/syscalls/landlock/landlock03
| CC testcases/kernel/syscalls/landlock/landlock02
| CC testcases/kernel/syscalls/landlock/landlock08
| CC testcases/kernel/syscalls/landlock/landlock07
| CC testcases/kernel/syscalls/landlock/landlock04
| CC testcases/kernel/syscalls/lchown/lchown01_16.o
| CC testcases/kernel/syscalls/lchown/lchown02_16.o
| CC testcases/kernel/syscalls/lchown/lchown03_16.o
| LD testcases/kernel/syscalls/lchown/lchown01_16
| CC testcases/kernel/syscalls/lchown/lchown01.o
| LD testcases/kernel/syscalls/lchown/lchown03_16
| CC testcases/kernel/syscalls/lchown/lchown03.o
| CC testcases/kernel/syscalls/lchown/lchown02.o
| LD testcases/kernel/syscalls/lchown/lchown02_16
| LD testcases/kernel/syscalls/lchown/lchown01
| LD testcases/kernel/syscalls/lchown/lchown03
| LD testcases/kernel/syscalls/lchown/lchown02
| rm lchown01_16.o lchown03.o lchown02_16.o lchown03_16.o lchown01.o lchown02.o
| CC testcases/kernel/syscalls/lgetxattr/lgetxattr02
| CC testcases/kernel/syscalls/lgetxattr/lgetxattr01
| CC testcases/kernel/syscalls/link/link08
| CC testcases/kernel/syscalls/link/link02
| CC testcases/kernel/syscalls/link/link04
| CC testcases/kernel/syscalls/link/link05
| CC testcases/kernel/syscalls/linkat/linkat02
| CC testcases/kernel/syscalls/linkat/linkat01
| In file included from listen01.c:50:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/recipe-sysroot/usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
|       |  ^~~~~~~
| CC testcases/kernel/syscalls/listen/listen01
| In file included from listmount01.c:22:
| listmount.h: In function 'listmount':
| listmount.h:18:16: error: variable 'req' has initializer but incomplete type
|    18 |         struct mnt_id_req req = {
|       |                ^~~~~~~~~~
| listmount.h:19:18: error: 'struct mnt_id_req' has no member named 'size'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                  ^~~~
| In file included from listmount.h:12:
| ../../../../include/lapi/mount.h:84:31: warning: excess elements in struct initializer
|    84 | # define MNT_ID_REQ_SIZE_VER0 24
|       |                               ^~
| listmount.h:19:25: note: in expansion of macro 'MNT_ID_REQ_SIZE_VER0'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                         ^~~~~~~~~~~~~~~~~~~~
| ../../../../include/lapi/mount.h:84:31: note: (near initialization for 'req')
|    84 | # define MNT_ID_REQ_SIZE_VER0 24
|       |                               ^~
| listmount.h:19:25: note: in expansion of macro 'MNT_ID_REQ_SIZE_VER0'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                         ^~~~~~~~~~~~~~~~~~~~
| listmount.h:20:18: error: 'struct mnt_id_req' has no member named 'mnt_id'
|    20 |                 .mnt_id = mnt_id,
|       |                  ^~~~~~
| listmount.h:20:27: warning: excess elements in struct initializer
|    20 |                 .mnt_id = mnt_id,
|       |                           ^~~~~~
| listmount.h:20:27: note: (near initialization for 'req')
| listmount.h:21:18: error: 'struct mnt_id_req' has no member named 'param'
|    21 |                 .param = last_mnt_id,
|       |                  ^~~~~
| listmount.h:21:26: warning: excess elements in struct initializer
|    21 |                 .param = last_mnt_id,
|       |                          ^~~~~~~~~~~
| listmount.h:21:26: note: (near initialization for 'req')
| listmount.h:18:27: error: storage size of 'req' isn't known
|    18 |         struct mnt_id_req req = {
|       |                           ^~~
| In file included from listmount02.c:24:
| listmount.h: In function 'listmount':
| listmount.h:18:27: warning: unused variable 'req' [-Wunused-variable]
| listmount.h:18:16: error: variable 'req' has initializer but incomplete type
|    18 |         struct mnt_id_req req = {
|       |                ^~~~~~~~~~
| listmount.h:19:18: error: 'struct mnt_id_req' has no member named 'size'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                  ^~~~
| In file included from listmount.h:12:
| ../../../../include/lapi/mount.h:84:31: warning: excess elements in struct initializer
|    84 | # define MNT_ID_REQ_SIZE_VER0 24
|       |                               ^~
| listmount.h:19:25: note: in expansion of macro 'MNT_ID_REQ_SIZE_VER0'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                         ^~~~~~~~~~~~~~~~~~~~
| ../../../../include/lapi/mount.h:84:31: note: (near initialization for 'req')
|    84 | # define MNT_ID_REQ_SIZE_VER0 24
|       |                               ^~
| listmount.h:19:25: note: in expansion of macro 'MNT_ID_REQ_SIZE_VER0'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                         ^~~~~~~~~~~~~~~~~~~~
| listmount.h:20:18: error: 'struct mnt_id_req' has no member named 'mnt_id'
|    20 |                 .mnt_id = mnt_id,
|       |                  ^~~~~~
| listmount.h:20:27: warning: excess elements in struct initializer
|    20 |                 .mnt_id = mnt_id,
|       |                           ^~~~~~
| listmount.h:20:27: note: (near initialization for 'req')
| listmount.h:21:18: error: 'struct mnt_id_req' has no member named 'param'
|    21 |                 .param = last_mnt_id,
|       |                  ^~~~~
| listmount.h:21:26: warning: excess elements in struct initializer
|    21 |                 .param = last_mnt_id,
|       |                          ^~~~~~~~~~~
| listmount.h:21:26: note: (near initialization for 'req')
| listmount.h:18:27: error: storage size of 'req' isn't known
|    18 |         struct mnt_id_req req = {
|       |                           ^~~
| listmount.h:18:27: warning: unused variable 'req' [-Wunused-variable]
| make[4]: *** [../../../../include/mk/rules.mk:45: listmount01] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: *** [../../../../include/mk/rules.mk:45: listmount02] Error 1
| listmount04.c: In function 'run':
| listmount04.c:124:20: error: invalid use of undefined type 'struct mnt_id_req'
|   124 |                 req->mnt_id = tc->mnt_id;
|       |                    ^~
| listmount04.c:125:20: error: invalid use of undefined type 'struct mnt_id_req'
|   125 |                 req->param = tc->param;
|       |                    ^~
| listmount04.c:126:20: error: invalid use of undefined type 'struct mnt_id_req'
|   126 |                 req->size = tc->size;
|       |                    ^~
| listmount04.c:127:20: error: invalid use of undefined type 'struct mnt_id_req'
|   127 |                 req->spare = tc->spare;
|       |                    ^~
| In file included from listmount03.c:15:
| listmount.h: In function 'listmount':
| listmount.h:18:16: error: variable 'req' has initializer but incomplete type
|    18 |         struct mnt_id_req req = {
|       |                ^~~~~~~~~~
| listmount.h:19:18: error: 'struct mnt_id_req' has no member named 'size'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                  ^~~~
| In file included from listmount.h:12:
| ../../../../include/lapi/mount.h:84:31: warning: excess elements in struct initializer
|    84 | # define MNT_ID_REQ_SIZE_VER0 24
|       |                               ^~
| listmount.h:19:25: note: in expansion of macro 'MNT_ID_REQ_SIZE_VER0'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                         ^~~~~~~~~~~~~~~~~~~~
| ../../../../include/lapi/mount.h:84:31: note: (near initialization for 'req')
|    84 | # define MNT_ID_REQ_SIZE_VER0 24
|       |                               ^~
| listmount.h:19:25: note: in expansion of macro 'MNT_ID_REQ_SIZE_VER0'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                         ^~~~~~~~~~~~~~~~~~~~
| listmount.h:20:18: error: 'struct mnt_id_req' has no member named 'mnt_id'
|    20 |                 .mnt_id = mnt_id,
|       |                  ^~~~~~
| listmount.h:20:27: warning: excess elements in struct initializer
|    20 |                 .mnt_id = mnt_id,
|       |                           ^~~~~~
| listmount.h:20:27: note: (near initialization for 'req')
| listmount.h:21:18: error: 'struct mnt_id_req' has no member named 'param'
|    21 |                 .param = last_mnt_id,
|       |                  ^~~~~
| listmount.h:21:26: warning: excess elements in struct initializer
|    21 |                 .param = last_mnt_id,
|       |                          ^~~~~~~~~~~
| listmount.h:21:26: note: (near initialization for 'req')
| listmount.h:18:27: error: storage size of 'req' isn't known
|    18 |         struct mnt_id_req req = {
|       |                           ^~~
| listmount04.c: At top level:
| listmount04.c:140:44: error: invalid application of 'sizeof' to incomplete type 'struct mnt_id_req'
|   140 |                 { &request, .size = sizeof(struct mnt_id_req) },
|       |                                            ^~~~~~
| listmount.h:18:27: warning: unused variable 'req' [-Wunused-variable]
| make[4]: *** [../../../../include/mk/rules.mk:45: listmount04] Error 1
| make[4]: *** [../../../../include/mk/rules.mk:45: listmount03] Error 1
| make[3]: *** [../../../include/mk/generic_trunk_target.inc:108: all] Error 2
| make[2]: *** [../../include/mk/generic_trunk_target.inc:108: all] Error 2
| make[1]: *** [../include/mk/generic_trunk_target.inc:108: all] Error 2
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/git/testcases'
| make: *** [Makefile:85: testcases-all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811, line 175
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811, line 159
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811, line 154
| 	#4: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811, line 149
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811, line 188
NOTE: recipe ltp-20250130-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 3025 tasks of which 2936 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201092950.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201092950.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.12.0/temp/log.do_packagedata.888586
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/log.do_compile.887811
Summary: There were 33 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bridge went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.13.0-r0 to 0:6.12.0-r0) [version-going-backwards]
ERROR: iproute2-6.12.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.12.0/temp/log.do_packagedata.888586
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb:do_packagedata) failed with exit code '1'
ERROR: ltp-20250130-r0 do_compile: oe_runmake failed
ERROR: ltp-20250130-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/run.do_compile.887811' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20250130/temp/log.do_compile.887811
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250130.bb:do_compile) failed with exit code '1'

--===============5483559188927664408==--

