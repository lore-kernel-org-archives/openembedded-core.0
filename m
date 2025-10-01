Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456FECCD1BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17951.1759325539891320033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UT5Vqw8N;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Smqbqxfm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101999ff96b11-77693808-468c-40b0-9716-1fe2591ec996-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1tlz09HOAWUtwcZ5cZa8kF8YAVMjpzHsC6/PcT7WNts=;
	b=UT5Vqw8NO1Zu0zpDE5pOlP+ol0O2DEoYsztmPVOAX0+iXlcye46NVBByAB/fXWPp
	XOqzznyZ1pqt9RGeAxd6ERiT61JGK1/EKzc6R6VfU48Z9EEoHFO2GWk6bXuem6PXifc
	AkbURqzl47skgd1gUIDY4HZTFqHndDso7x6hqLNc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1tlz09HOAWUtwcZ5cZa8kF8YAVMjpzHsC6/PcT7WNts=;
	b=SmqbqxfmML7ii7jPXsg0lScxy0T7/1oR9upFUTxbKoK/4OZ1Ri82e2QVXxQF0KJy
	5MZclNryZsI4K6Uu9MMY7kVgBgv4FhaN1rDyL2XDjfpFkdVQ1Ei2RZRm5PVeu0Z1IBI
	riJPNdRXeOgrl+90W+WnVuJNnhINc61EsxOdaGBY=
Content-Type: multipart/mixed; boundary="===============6636292019122858751=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20250930 SUCCEEDED
Message-ID: <010101999ff96b11-77693808-468c-40b0-9716-1fe2591ec996-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224264

--===============6636292019122858751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ltp* to *20250930* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20250530-20250930.patch
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
From 8379d9fef42882918112ec3fdd8f4f5a4f22e4e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 10:39:01 +0000
Subject: [PATCH] ltp: upgrade 20250530 -> 20250930

---
 ...0001-Add-__clear_cache-declaration-for-clang.patch |  2 +-
 .../ltp/0001-Remove-OOM-tests-from-runtest-mm.patch   |  6 +++---
 ...-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch | 11 ++++-------
 .../ltp/{ltp_20250530.bb => ltp_20250930.bb}          |  2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20250530.bb => ltp_20250930.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index c95d7220cd..24e8762f77 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From 859d27dd6dfc6e9d26ae9a05f4b32ac45b911887 Mon Sep 17 00:00:00 2001
+From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 936e23ebda..860b2f127f 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 7096737fbbe19d0765f0a8c62ef7667bf4875780 Mon Sep 17 00:00:00 2001
+From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 5566a7742..8014d509b 100644
+index 41d624ad8..1e8c22638 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -70,12 +70,6 @@ ksm07 ksm07
+@@ -69,12 +69,6 @@ ksm07 ksm07
  cpuset01 cpuset01
  cpuset02 cpuset02
  
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
index b4859a6f0a..364e203e23 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -1,4 +1,4 @@
-From 55b48d66857a43c2609fc351293b5601e2eb955d Mon Sep 17 00:00:00 2001
+From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 23 May 2025 15:17:49 +0800
 Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
@@ -20,10 +20,10 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-index 1878bd4..3b799fa 100644
+index f4549adf4..28776f266 100644
 --- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 +++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-@@ -10,7 +10,11 @@
+@@ -12,7 +12,11 @@
  #include "tst_test.h"
  #include "libnewipc.h"
  
@@ -36,13 +36,10 @@ index 1878bd4..3b799fa 100644
  
  static void run(void)
  {
-@@ -47,6 +51,4 @@ static struct tst_test test = {
+@@ -49,6 +53,4 @@ static struct tst_test test = {
  	.test_all = run,
  	.needs_tmpdir = 1,
  };
 -#else
 -TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
  #endif
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20250530.bb b/meta/recipes-extended/ltp/ltp_20250930.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20250530.bb
rename to meta/recipes-extended/ltp/ltp_20250930.bb
index 9ea5de10ee..1514aca8fe 100644
--- a/meta/recipes-extended/ltp/ltp_20250530.bb
+++ b/meta/recipes-extended/ltp/ltp_20250930.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "14331e1ecfcd63426c9d270d88b7bad9f60c6d64"
+SRCREV = "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.47.1


--===============6636292019122858751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ltp: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 1318507080 to 1342361472 (+2%)
packages/x86-64-v3-poky-linux/ltp/ltp-dbg: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/kill07 /opt/ltp/testcases/bin/.debug/munmap02 /opt/ltp/testcases/bin/.debug/lchown03_16 /opt/ltp/testcases/bin/.debug/shmt06 /opt/ltp/testcases/bin/.debug/eject_check_tray /opt/ltp/testcases/bin/.debug/lchown03", added "/opt/ltp/testcases/bin/.debug/mount08 /opt/ltp/testcases/bin/.debug/statmount09 /opt/ltp/testcases/bin/.debug/cve-2025-21756 /opt/ltp/testcases/bin/.debug/lsm_get_self_attr01 /opt/ltp/testcases/bin/.debug/lsm_set_self_attr01 /opt/ltp/testcases/bin/.debug/lsm_get_self_attr03 /opt/ltp/testcases/bin/.debug/lsm_get_self_attr02 /opt/ltp/testcases/bin/.debug/clock_settime04 /opt/ltp/testcases/bin/.debug/lsm_list_modules02 /opt/ltp/testcases/bin/.debug/cve-2025-38236 /opt/ltp/testcases/bin/.debug/lsm_list_modules01 /opt/ltp/testcases/bin/.debug/landlock10 /opt/ltp/testcases/bin/.debug/epoll_pwait06 /opt/ltp/testcases/bin/.debug/listxattr04 /opt/ltp/testcases/bin/.debug/munmap04 /opt/l
 tp/testcases/bin/.debug/file_attr04 /opt/ltp/testcases/bin/.debug/file_attr01 /opt/ltp/testcases/bin/.debug/file_attr02 /opt/ltp/testcases/bin/.debug/file_attr03 /opt/ltp/testcases/bin/.debug/unshare05 /opt/ltp/testcases/bin/.debug/ioctl_pidfd06 /opt/ltp/testcases/bin/.debug/ioctl_pidfd05 /opt/ltp/testcases/bin/.debug/ioctl_pidfd04 /opt/ltp/testcases/bin/.debug/ioctl_pidfd03 /opt/ltp/testcases/bin/.debug/ioctl_pidfd02 /opt/ltp/testcases/bin/.debug/ioctl_pidfd01 /opt/ltp/testcases/bin/.debug/set_thread_area02 /opt/ltp/testcases/bin/.debug/ioctl10 /opt/ltp/testcases/bin/.debug/mount_setattr02 /opt/ltp/testcases/bin/.debug/landlock09"
packages/x86-64-v3-poky-linux/ltp/ltp-dbg: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp-dev: PKGSIZE changed from 361396 to 370410 (+2%)
packages/x86-64-v3-poky-linux/ltp/ltp-dev: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp-dev: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp-doc: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp-doc: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp-locale: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp-locale: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp-src: PKGSIZE changed from 13460358 to 13458284 (-0%)
packages/x86-64-v3-poky-linux/ltp/ltp-src: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20250530/testcases/network/packet -> /usr/src/debug/ltp/20250930/testcases/network/packet, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/atof -> /usr/src/debug/ltp/20250930/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clo
 ck_nanosleep -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20250930/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20250930/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20250530/testcases/network/iptables -> /usr/src/debug/ltp/20250930/testcases/network/iptables, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/include -> /usr/src/debug/ltp/20250930/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_adjti
 me, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20250530/tools/apicmds -> /usr/src/debug/ltp/20250930/tools/apicmds, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/202505
 30/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/l
 tp/20250930/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20250530/tools/genload -> /usr/src/debug/ltp/20250930/tools/genload, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/de
 bug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interface
 s/aio_error -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20250930/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20250930/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20250930/testcases/kernel
 /fs/fs_di, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/strncpy, dir
 ectory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20250530/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20250930/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/
 pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20250530/libs/vdso -> /usr/src/debug/ltp/20250930/libs/vdso, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/pidns, directory renamed /usr/src/deb
 ug/ltp/20250530/testcases/kernel/syscalls/shutdown -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/shutdown, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/202505
 30/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interface
 s/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/process_madvise -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/process_madvise, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugemmap -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugemmap, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/inte
 rfaces/sigpending, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20250530/libs/sigwait -> /usr/src/debug/ltp/20250930/libs/sigwait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/numa -> /usr/src/debug/ltp/20250930/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/umount2, directory rena
 med /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/lib -> /usr/src/debug/ltp/20250930/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debu
 g/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20250530/include/old -> /usr/src/debug
 /ltp/20250930/include/old, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_tes
 tsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20250530/test
 cases/kernel/syscalls/accept -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/defi
 nitions/signal_h -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/float -> /usr/src/debug/ltp/20250930/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20250930/testcase
 s/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/open_tree, directory re
 named /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20250930
 /testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20250930/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20250530/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20250930/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/f00f -> /usr/src/debug/ltp/20250930/testcases/misc/f00f, directory renamed /usr/src/debug/
 ltp/20250530/libs/ujson -> /usr/src/debug/ltp/20250930/libs/ujson, directory renamed /usr/src/debug/ltp/20250530/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20250930/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20250530/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20250930/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/ka
 llsyms -> /usr/src/debug/ltp/20250930/testcases/kernel/security/kallsyms, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kerne
 l/syscalls/mincore -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_syscall_test -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20250530/libs/uinput -> /usr/src/debug/ltp/20250930/libs/uinput, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20250530/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20250930/utils/benc
 hmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20250530/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20250930/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20250930/testcase
 s/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20250530/utils/sctp/testlib -> /usr/src/debug/ltp/20250930/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20250530/testcases/network/lib6 -> /usr/src/debug/ltp/20250930/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/s
 yscalls/readv -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigwait, directory renamed
  /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/seccomp -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/seccomp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20250930/testcases/kernel/de
 vice-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/fsplough -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/fsplough, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/lib -> /usr/src/debug/ltp/20250930/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, di
 rectory renamed /usr/src/debug/ltp/20250530/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20250930/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20250530/utils/sctp/include/netinet -> /usr/src/debug/ltp/20250930/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20
 250530/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20250930/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, di
 rectory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20250930/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/cfs-schedu
 ler, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20250530/utils/sctp/lib -> /usr/src/debug/ltp/20250930/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/definitions/errno_h, director
 y renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/202505
 30/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/abs -> /usr/src/debug/ltp/20250930/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug
 /ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fanotify, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/fptests -> /usr/src/debug/ltp/20250930/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20250930/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/eventfd -> /usr/src/deb
 ug/ltp/20250930/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/include -> /usr/src/debug/ltp/20250930/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/lt
 p/20250930/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pkeys -> /usr/sr
 c/debug/ltp/20250930/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spi
 n_lock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/2025093
 0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/
 debug/ltp/20250530/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20250930/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex
 attr_setprotocol -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/smack -> /usr/src/debug/ltp/20250930/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcance
 l -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execlp -> /u
 sr/src/debug/ltp/20250930/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20250530/testcases/network/sockets -> /usr/src/debug/ltp/20250930/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls
 /clone3 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/inter
 faces/sigfillset, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20250530/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20250930/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20250530/testcases/ope
 n_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20250930/
 testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20250530/utils/sctp/func_tests -> /usr/src/debug/ltp/20250930/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/con
 formance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20250930/testcases/kernel/syscall
 s/symlink, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20250930/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/aslr -> /usr/src/debug/ltp/20250930/testcases/kernel/security/aslr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20250930/testcases/kerne
 l/syscalls/pselect, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, dir
 ectory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20250930/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20250530/testcases/realti
 me/func/pi-tests -> /usr/src/debug/ltp/20250930/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20250930/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getresgi
 d, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20250930/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_delete -> /usr/src/debug
 /ltp/20250930/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20250930/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20250530/testcases/network/can/cve -> /usr/src/debug/ltp/20250930/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20250530/testc
 ases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20250530
 /testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/splice, directory renamed /
 usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20250930/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20250530/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20250930/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/inter
 faces/aio_suspend -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/int
 erfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock ->
  /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/page -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20250930/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscal
 ls/flistxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20250530/testcases/lib/tests -> /usr/src/debug/ltp/20250930/testcases/lib/tests, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/
 execveat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fcntl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/
 src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/uevents -> /usr/src/debug/ltp/20250930/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20250930/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20
 250930/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/timer_gettime, directory renamed
  /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mkdir -> /us
 r/src/debug/ltp/20250930/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20250930/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/l
 tp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20250530/lib -> /usr/src/debug/ltp/20250930/lib, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debu
 g/ltp/20250930/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20250530/libs/newipc -> /usr/src/debug/ltp/20250
 930/libs/newipc, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug
 /ltp/20250530/testcases/kernel/security/umip -> /usr/src/debug/ltp/20250930/testcases/kernel/security/umip, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20250930
 /testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20250530/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20250930/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20250930/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/con
 formance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/fs_fill, dir
 ectory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/lt
 p/20250530/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/power_management -> /usr/src/debug/ltp/2025
 0930/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mseal -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mseal, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20250930/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20250930/testcases/kernel/sysca
 lls/pread, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20250530/testcases/kern
 el/syscalls/madvise -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/madvise, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src
 /debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sound -> /usr/src/debug/ltp/20250930/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20250530/testca
 ses/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mmap, directory renamed /usr/src/debug/ltp/20250530/testcases/k
 ernel/syscalls/sendto -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/sysctl -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/sysctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/io/aio -> /usr/src/debug/ltp/20250930/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20250930/testcases/kerne
 l/syscalls/execve, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, direct
 ory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setpgi
 d, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/r
 emovexattr, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20250930/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/
 syscalls/io_setup -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/openat2, directory renam
 ed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/input -> /usr/src/debug/ltp/20250930/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/arch_prctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/arch_prctl, directory renamed /usr/src/debug/ltp/20250530/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20250930/testcases/network/multicast/mc_member, direct
 ory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20250930/t
 estcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20250
 530/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20250530/testcases/network/netstress -> /usr/src/debug/ltp/20250930/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/kvm -> /usr/src/debug/ltp/20250930/testcases/kernel/kvm, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20250930/testcases
 /kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/crash -> /usr/src/debug/ltp/20250930/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/2
 0250530/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20250930/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/d
 ebug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20250930/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20250530/testcases/kerne
 l/syscalls/munlock -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchmodat2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fchmodat2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/s
 rc/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20250930/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/contai
 ners/mqns -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20250930/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/cachestat -> /usr/src/debug/lt
 p/20250930/testcases/kernel/syscalls/cachestat, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/pty -> /usr/src/debug/ltp/20250930/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20250530
 /testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listmount -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/listmount, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20
 250930/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20250930/testcases/rea
 ltime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/irq -> /usr/src/debug/ltp/20250930/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20250930/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setitimer
 , directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20250530/testcases/lib -> /usr/src/debug/ltp/20250930/testcases/lib, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20
 250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/de
 bug/ltp/20250530/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20250930/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/io/ltp-aiodio
  -> /usr/src/debug/ltp/20250930/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getxattr, directory renamed /usr/sr
 c/debug/ltp/20250530/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls
 /bpf, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20250930/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/s
 yscalls/epoll -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20250530/libs/ipc -> /usr/src/de
 bug/ltp/20250930/libs/ipc, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debu
 g/ltp/20250530/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/faccessat2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/faccessat2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_ctl, directory renamed /us
 r/src/debug/ltp/20250530/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20250930/testcases/open
 _posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/
 20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20250930/t
 estcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/float/power -> /usr/src/debug/ltp/20250930/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20250930/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20250930/testcases/kernel/sys
 calls/mlock2, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/hyperthreading/ht_affinity,
  directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20250930/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/unlinkat, directory ren
 amed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20250930/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/c
 onformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20250930/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/specul
 ative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20250930/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/sched_football -> /u
 sr/src/debug/ltp/20250930/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/deb
 ug/ltp/20250530/pan -> /usr/src/debug/ltp/20250930/pan, directory renamed /usr/src/debug/ltp/20250530/testcases/network/sctp -> /usr/src/debug/ltp/20250930/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20250930/testcases/kernel/s
 yscalls/mkdirat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20250930/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_yield -> /usr/src/debu
 g/ltp/20250930/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20250530/te
 stcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20250930/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20250930/testcases/ope
 n_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20250530/libs/swap -> /usr/src/debug/ltp/20250930/libs/swap, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20250530/
 testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20250930/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20250930/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20250930/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20250530/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20250930/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20250930/testcases/kernel/sched/sched_stress, dir
 ectory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20250530/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20250930/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20250530/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20250930/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp
 /20250530/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/crypto -> /usr/src/debug/ltp/20250930/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20250930/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> 
 /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20250530/testc
 ases/kernel/syscalls/flock -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/flock, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/nftw -> /usr/src/deb
 ug/ltp/20250930/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20250930/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20250930/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20250930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20250530/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20250930/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20250930/testcase
 s/kernel/syscalls/setgroups, removed "/usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lchown/lchown03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns04.c /usr/src/debug/ltp/20250530/include/lapi/landlock.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl05.c /usr/src/debug/ltp/20250530/include/ujson_common.h /usr/src/debug/ltp/20250530/include/ujson_reader.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_settime/clock_settime01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns02.c /usr/src/debug/ltp/20250530/include/lapi/ioctl.h /usr/src/debug/ltp/20250530/include/tst_timer_test.h /usr/src/debug/ltp/20250530/include/tst_cmd.h /usr/src/debug/ltp/20250530/testcases/commands/eject/eject_check_tray.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl08.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/u
 nshare04.c /usr/src/debug/ltp/20250530/include/tst_safe_file_at.h /usr/src/debug/ltp/20250530/include/tst_hugepage.h /usr/src/debug/ltp/20250530/include/tst_safe_clocks.h /usr/src/debug/ltp/20250530/include/lapi/io_uring.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/unshare01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/unshare02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/unshare03.c /usr/src/debug/ltp/20250530/include/tst_tmpdir.h /usr/src/debug/ltp/20250530/include/ipcmsg.h /usr/src/debug/ltp/20250530/include/libswap.h /usr/src/debug/ltp/20250530/include/tst_af_alg.h /usr/src/debug/ltp/20250530/include/tst_crypto.h /usr/src/debug/ltp/20250530/include/ipcsem.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock06.c /usr/src/debug/ltp/20250530/include/tst_netlink.h /usr/src/debug/ltp/20250530/testcases/cve/icmp_rate_limit01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl03.c /usr/src/de
 bug/ltp/20250530/testcases/kernel/syscalls/lchown/lchown01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munmap/munmap03.c /usr/src/debug/ltp/20250530/include/lapi/common_timers.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill08.c /usr/src/debug/ltp/20250530/testcases/cve/tcindex01.c /usr/src/debug/ltp/20250530/include/lapi/fsmount.h /usr/src/debug/ltp/20250530/include/lapi/readdir.h /usr/src/debug/ltp/20250530/include/tst_sched.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock05.c /usr/src/debug/ltp/20250530/include/tst_arch.h /usr/src/debug/ltp/20250530/include/tst_safe_pthread.h /usr/src/debug/ltp/20250530/testcases/cve/cve-2014-0196.c /usr/src/debug/ltp/20250530/testcases/cve/cve-2016-7042.c /usr/src/debug/ltp/20250530/include/tst_res_flags.h /usr/src/debug/ltp/20250530/include/tst_safe_fil
 e_ops.h /usr/src/debug/ltp/20250530/testcases/cve/cve-2016-7117.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_thread_area/set_thread_area01.c /usr/src/debug/ltp/20250530/include/tst_clocks.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount07.c /usr/src/debug/ltp/20250530/include/tst_rtctime.h /usr/src/debug/ltp/20250530/include/tst_epoll.h /usr/src/debug/ltp/20250530/include/lapi/mman.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/i
 octl_loop06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_sg01.c /usr/src/debug/ltp/20250530/include/tst_rand_data.h /usr/src/debug/ltp/20250530/include/tst_taint.h /usr/src/debug/ltp/20250530/include/tst_checksum.h /usr/src/debug/ltp/20250530/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl07.c /usr/src/debug/ltp/20250530/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock_exec.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/
 statmount/statmount04.c /usr/src/debug/ltp/20250530/include/tst_net.h /usr/src/debug/ltp/20250530/include/lapi/sched.h /usr/src/debug/ltp/20250530/testcases/cve/stack_clash.c /usr/src/debug/ltp/20250530/include/tst_safe_prw.h /usr/src/debug/ltp/20250530/include/tst_security.h /usr/src/debug/ltp/20250530/include/tst_sig_proc.h /usr/src/debug/ltp/20250530/include/tst_sys_conf.h /usr/src/debug/ltp/20250530/include/tst_bool_expr.h /usr/src/debug/ltp/20250530/include/lapi/futex.h /usr/src/debug/ltp/20250530/include/tst_safe_io_uring.h /usr/src/debug/ltp/20250530/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munmap/munmap01.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listxattr/listxattr03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount02.c /usr/src/debug/ltp/20250530/testcases/kerne
 l/syscalls/landlock/landlock08.c /usr/src/debug/ltp/20250530/include/tst_get_bad_addr.h /usr/src/debug/ltp/20250530/include/lapi/epoll.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock04.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20250530/include/tst_process_state.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20250530/testcases/cve/meltdown.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount_setattr/mount_setattr01.c /usr/src/debug/ltp/20250530/include/tst_atomic.h /usr/src/debug/ltp/20250530/include/tst_safe_macros_inline.h /usr/src/debug/ltp/20250530/testcases/cve/cve-2016-10044.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount03.c /
 usr/src/debug/ltp/20250530/include/tst_checkpoint.h /usr/src/debug/ltp/20250530/include/tst_kconfig.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl06.c /usr/src/debug/ltp/20250530/include/tst_assert.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill05.c /usr/src/debug/ltp/20250530/include/tst_cpu.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount05.c /usr/src/debug/ltp/20250530/include/tst_buffers.h /usr/src/debug/ltp/20250530/include/tst_uid.h /usr/src/debug/ltp/20250530/include/lapi/pkey.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount08.c /usr/src/debug/ltp/20250530/include/lapi/ustat.h /usr/src/debug/ltp/20250530/include/lapi/pidfd.h /usr/src/debug/ltp/20250530/include/tst_fs.h /usr/src/debug/ltp/20250530/include/lapi/resource.h /usr/src/debug/ltp/20250530/include/safe_stdio_fn.h /usr/src/debug/ltp/20250530/include/t
 st_checkpoint_fn.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt09.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listxattr/listxattr02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount03.c /usr/src/debug/ltp/20250530/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20250530/include/lapi/keyctl.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt07.c /usr/src/debug/ltp/20250530/include/tst_wallclock.h /usr/src/debug/ltp/20250530/include/lapi/faccessat.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_thread_area/set_thread_area.h /usr/src/debug/ltp/20250530/include/tst_device.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h /usr/src/debug/ltp/20250530/include/tst_cgroup.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listxattr/listxattr01.c /usr/src/debug/ltp/20250530/include/lapi/openat2.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt06.c /usr/src/debug/ltp/2025
 0530/include/libsigwait.h /usr/src/debug/ltp/20250530/testcases/cve/cve-2015-3290.c /usr/src/debug/ltp/20250530/testcases/cve/cve-2017-2618.c /usr/src/debug/ltp/20250530/testcases/cve/cve-2017-2671.c /usr/src/debug/ltp/20250530/include/lapi/stat.h /usr/src/debug/ltp/20250530/include/lapi/sem.h /usr/src/debug/ltp/20250530/include/tst_mkfs.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait/epoll_pwait01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait/epoll_pwait02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait/epoll_pwait04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait/epoll_pwait05.c /usr/src/debug/ltp/20250530/include/lapi/ldt.h /usr/src/debug/ltp/20250530/include/safe_file_ops_fn.h /usr/src/debug/ltp/20250530/include/lapi/rt_sigaction.h /usr/src/debug/lt
 p/20250530/include/lapi/membarrier.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill02.c /usr/src/debug/ltp/20250530/include/safe_net_fn.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill12.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_fiemap01.c /usr/src/debug/ltp/20250530/include/lapi/syscalls.h /usr/src/debug/ltp/20250530/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20250530/include/tst_coredump.h /usr/src/debug/ltp/20250530/include/parse_vdso.h /usr/src/debug/ltp/20250530/include/time64_variants.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill10.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange02.c /usr/src/debug/ltp/20250530/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20250530/include/tst_netdevice.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns05.c /usr/src/debug/lt
 p/20250530/include/tst_fd.h /usr/src/debug/ltp/20250530/include/libnewipc.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_settime/clock_settime02.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt10.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lchown/lchown02.c /usr/src/debug/ltp/20250530/include/lapi/close_range.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock03.c /usr/src/debug/ltp/20250530/include/lapi/quotactl.h /usr/src/debug/ltp/20250530/testcases/cve/cve-2022-4378.c /usr/src/debug/ltp/20250530/include/tst_safe_timerfd.h /usr/src/debug/ltp/20250530/include/tst_safe_macros.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl09.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock01.c /usr/src/debug/ltp/20250530/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20250530/include/lapi/fs.h /usr/src/debug/ltp/20250530/t
 estcases/kernel/syscalls/landlock/landlock_common.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt08.c /usr/src/debug/ltp/20250530/include/lapi/watch_queue.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock07.c /usr/src/debug/ltp/20250530/include/tst_test.h /usr/src/debug/ltp/20250530/include/tst_pid.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_settime/clock_settime03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount01.c /usr/src/debug/ltp/20250530/include/tst_test_macros.h /usr/src/debug/ltp/20250530/include/safe_macros_fn.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt/shmt03.c /usr/src/debug/ltp/20250530/include/lapi/fanotify.h /usr/src/debug/ltp/20250530/include/lapi/kcmp.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munmap/munmap02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount.h /usr/src/debug/ltp/20250530/include/lapi/bpf.h /usr/src/debug/ltp/20250530/i
 nclude/tst_clone.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns03.c /usr/src/debug/ltp/20250530/include/ujson_utf.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock/landlock_tester.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount/statmount07.c /usr/src/debug/ltp/20250530/include/lapi/init_module.h /usr/src/debug/ltp/20250530/include/tst_module.h /usr/src/debug/ltp/20250530/include/tst_parse.h /usr/src/debug/ltp/20250530/include/tst_timer.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns01.c /usr/src/debug/ltp/20250530/testcases/cve/cve-2017-16939.c /usr/src/debug/ltp/20250530/testcases/cve/cve-2017-17052.c /usr/src/debug/ltp/20250530/testcases/cve/cve-2017-17053.c /usr/src/debug/ltp/20250530/include/tst_private.h /usr/src/debug/ltp/20250530/include/tst_capability.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill03.c /usr/src/debug/ltp/20250530/include/tst_kvercmp.h /usr/src/debug/ltp/20250530
 /testcases/kernel/syscalls/kill/kill13.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20250530/include/tst_memutils.h /usr/src/debug/ltp/20250530/include/tst_kernel.h /usr/src/debug/ltp/20250530/include/tst_uinput.h /usr/src/debug/ltp/20250530/include/tst_ansi_color.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill11.c", added "/usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount06.c /usr/src/debug/ltp/20250930/include/tst_wallclock.h /usr/src/debug/ltp/20250930/include/lapi/fs.h /usr/src/debug/ltp/20250930/include/ujson_common.h /usr/src/debug/ltp/20250930/include/ujson_reader.h /usr/src/debug/ltp/20250930/include/lapi/stat.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lis
 txattr/listxattr04.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2025-21756.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2025-38236.c /usr/src/debug/ltp/20250930/include/tst_safe_timerfd.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount04.c /usr/src/debug/ltp/20250930/include/lapi/futex.h /usr/src/debug/ltp/20250930/include/tst_cpu.h /usr/src/debug/ltp/20250930/include/safe_file_ops_fn.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/listxattr/listxattr03.c /usr/src/debug/ltp/20250930/include/tst_safe_prw.h /usr/src/debug/ltp/20250930/include/tst_security.h /usr/src/debug/ltp/20250930/include/tst_sig_proc.h /usr/src/debug/ltp/20250930/include/tst_sys_conf.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lchown/lchown02.c /usr/src/debug/ltp/20250930/include/tst_net.h /usr/src/debug/ltp/20250930/include/tst_res_flags.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls
 /listxattr/listxattr02.c /usr/src/debug/ltp/20250930/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/listxattr/listxattr01.c /usr/src/debug/ltp/20250930/include/tst_cmd.h /usr/src/debug/ltp/20250930/testcases/cve/cve-2022-4378.c /usr/src/debug/ltp/20250930/include/lapi/close_range.h /usr/src/debug/ltp/20250930/include/time64_variants.h /usr/src/debug/ltp/20250930/include/tst_uinput.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock10.c /usr/src/debug/ltp/20250930/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20250930/include/tst_private.h /usr/src/debug/ltp/20250930/include/tst_hugepage.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock06.c /usr/src/debug/ltp/20250930/include/tst_kvercmp.h /usr/src/debug/ltp/20250930/include/tst_atomic.h /usr/src/debug/ltp/20250930/include/tst_kernel.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock05.c /usr/src/debug/ltp/20250930/testcases
 /kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ns04.c /usr/src/debug/ltp/20250930/include/lapi/watch_queue.h /usr/src/debug/ltp/20250930/include/tst_sched.h /usr/src/debug/ltp/20250930/include/tst_clone.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock08.c /usr/src/debug/ltp/20250930/include/lapi/bpf.h /usr/src/debug/ltp/20250930/include/libsigwait.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl10.c /usr/src/debug/ltp/20250930/include/lapi/pkey.h /usr/src/debug/ltp/20250930/include/tst_test_macros.h /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt07.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ficlone02.c /usr/src/debug/ltp/20250930/include/safe_stdio_fn.h /usr/src/debug/ltp/20250930/include/tst_safe_io_uring.h /usr/src/debug/ltp/20250930/include/tst_crypto.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ficlone04.c /usr/src/
 debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_pidfd01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock_common.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/munmap/munmap03.c /usr/src/debug/ltp/20250930/include/tst_netlink.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl09.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ficlone01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c /usr/src/debug/ltp/20250930/include/tst_af_alg.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount02.c /usr/src/debug/ltp/20250930/testcases/cve/icmp_rate_limit01.c /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt10.c /usr/src/debug/ltp/20250930/include/tst_safe_pthread.h /usr/src/debug/ltp/20250930/include/lapi/membarrier.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/munmap/munmap01.c /usr/src
 /debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c /usr/src/debug/ltp/20250930/include/lapi/pidfd.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock03.c /usr/src/debug/ltp/20250930/include/tst_safe_macros_inline.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ns02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount08.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount07.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20250930/include/tst_parse.h /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt05.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/file_attr/file_attr04.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount05.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/file_attr/file_attr02.c /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt08.c /usr/src/debug/ltp/20250930/testcase
 s/kernel/syscalls/kill/kill08.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_settime/clock_settime04.c /usr/src/debug/ltp/20250930/include/lapi/sem.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount02.c /usr/src/debug/ltp/20250930/include/tst_test.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill06.c /usr/src/debug/ltp/20250930/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_list_modules02.c /usr/src/debug/ltp/20250930/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20250930/testcases/cve/cve-2017-16939.c /usr/src/debug/ltp/20250930/include/lapi/ustat.h /usr/src/debug/ltp/20250930/include/lapi/init_module.h /usr/src/debug/ltp/20250930/include/libswap.h /usr/src/debug/ltp/20250930/testcases/cve/cve-2017-17052.c /usr/src/debug/ltp/20250930/include/tst_timer.h /usr/src/debug/ltp/20250930/testcases/cve/cve-2017-17053.c /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt09.c /usr/src/d
 ebug/ltp/20250930/include/lapi/io_uring.h /usr/src/debug/ltp/20250930/include/tst_rtctime.h /usr/src/debug/ltp/20250930/include/tst_checksum.h /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt03.c /usr/src/debug/ltp/20250930/include/tst_mkfs.h /usr/src/debug/ltp/20250930/include/tst_device.h /usr/src/debug/ltp/20250930/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock_exec.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait04.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait05.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait06.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_p
 idfd.h /usr/src/debug/ltp/20250930/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock04.c /usr/src/debug/ltp/20250930/include/lapi/fsmount.h /usr/src/debug/ltp/20250930/include/lapi/readdir.h /usr/src/debug/ltp/20250930/include/tst_timer_test.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/unshare/unshare01.c /usr/src/debug/ltp/20250930/include/tst_tmpdir.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c /usr/src/debug/ltp/20250930/include/tst_safe_clocks.h /usr/src/debug/ltp/20250930/include/ipcmsg.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2014-0196.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2016-7042.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2016-7117.c /usr/src/debug/ltp/20250930/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl08.c /usr/src/debug/ltp/202509
 30/testcases/kernel/syscalls/statmount/statmount.h /usr/src/debug/ltp/20250930/include/lapi/keyctl.h /usr/src/debug/ltp/20250930/include/parse_vdso.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock_tester.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange02.c /usr/src/debug/ltp/20250930/include/tst_safe_file_ops.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_get_self_attr03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_fiemap01.c /usr/src/debug/ltp/20250930/include/lapi/mman.h /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt04.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_loop01.c /usr/src/debug/ltp/20250930/testcases/kernel/sysc
 alls/ioctl/ioctl_loop02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_loop03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_loop04.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_loop05.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_loop06.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_loop07.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lchown/lchown01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount09.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount08.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/file_attr/file_attr03.c /usr/src/debug/ltp/20250930/include/lapi/resource.h /usr/src/debug/ltp/20250930/include/tst_cgroup.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_settime/clock_settime03.c /usr/src/debug/ltp/20250930/testc
 ases/kernel/syscalls/ioctl/ioctl_ns01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/file_attr/file_attr01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill02.c /usr/src/debug/ltp/20250930/include/tst_assert.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill12.c /usr/src/debug/ltp/20250930/include/lapi/landlock.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_list_modules01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ns07.c /usr/src/debug/ltp/20250930/include/tst_ansi_color.h /usr/src/debug/ltp/20250930/include/tst_kconfig.h /usr/src/debug/ltp/20250930/testcases/kernel/mem/shmt/shmt02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill10.c /usr/src/debug/ltp/20250930/include/lapi/faccessat.h /usr/src/debug/ltp/20250930/include/tst_rand_data.h /usr/src/debug/ltp/20250930/include/tst_capability.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount_setattr/mount_setattr01.c /usr/src/deb
 ug/ltp/20250930/include/lapi/sched.h /usr/src/debug/ltp/20250930/include/lapi/syscalls.h /usr/src/debug/ltp/20250930/include/tst_memutils.h /usr/src/debug/ltp/20250930/include/tst_buffers.h /usr/src/debug/ltp/20250930/include/tst_safe_macros.h /usr/src/debug/ltp/20250930/include/safe_macros_fn.h /usr/src/debug/ltp/20250930/testcases/cve/tcindex01.c /usr/src/debug/ltp/20250930/include/tst_uid.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl07.c /usr/src/debug/ltp/20250930/include/tst_module.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_settime/clock_settime01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_get_self_attr01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_set_self_attr01.c /usr/src/debug/ltp/20250930/include/tst_bool_expr.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/set_thread_area/set_thread_area01.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl05.c /usr/src/debug/ltp/2025
 0930/include/ipcsem.h /usr/src/debug/ltp/20250930/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/set_thread_area/set_thread_area02.c /usr/src/debug/ltp/20250930/include/lapi/quotactl.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_get_self_attr02.c /usr/src/debug/ltp/20250930/include/tst_netdevice.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/clock_settime/clock_settime02.c /usr/src/debug/ltp/20250930/include/lapi/kcmp.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20250930/include/tst_clocks.h /usr/src/debug/ltp/20250930/include/tst_taint.h /usr/src/debug/ltp/20250930/include/lapi/common_timers.h /usr/src/debug/ltp/20250930/include/lapi/ldt.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill05.c /usr/src/debug/ltp
 /20250930/include/tst_pid.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount07.c /usr/src/debug/ltp/20250930/include/tst_arch.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_sg01.c /usr/src/debug/ltp/20250930/include/safe_net_fn.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill/kill13.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/unshare/unshare02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/unshare/unshare03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/unshare/unshare04.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2016-10044.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/unshare/unshare05.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock01.c /usr/src/debug/ltp/20250930/include/tst_coredump.h /usr/src/debug/ltp/20250930/testcases/cve/meltdown.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/kill
 /kill11.c /usr/src/debug/ltp/20250930/include/lapi/fanotify.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock07.c /usr/src/debug/ltp/20250930/include/libnewipc.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ns06.c /usr/src/debug/ltp/20250930/include/tst_fd.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ns05.c /usr/src/debug/ltp/20250930/testcases/cve/stack_clash.c /usr/src/debug/ltp/20250930/include/lapi/lsm.h /usr/src/debug/ltp/20250930/include/lapi/ioctl.h /usr/src/debug/ltp/20250930/include/lapi/openat2.h /usr/src/debug/ltp/20250930/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/landlock/landlock09.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/statmount/statmount03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount_setattr/mount_setattr02.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/munmap/munmap04.c /usr/src/debug/ltp/20250930/include/tst_safe_fi
 le_at.h /usr/src/debug/ltp/20250930/include/tst_get_bad_addr.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/lsm/lsm_common.h /usr/src/debug/ltp/20250930/testcases/cve/cve-2015-3290.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2017-2618.c /usr/src/debug/ltp/20250930/testcases/cve/cve-2017-2671.c /usr/src/debug/ltp/20250930/include/tst_epoll.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl06.c /usr/src/debug/ltp/20250930/include/ujson_utf.h /usr/src/debug/ltp/20250930/include/lapi/epoll.h /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl04.c /usr/src/debug/ltp/20250930/testcases/kernel/syscalls/ioctl/ioctl_ns03.c /usr/src/debug/ltp/20250930/include/tst_process_state.h /usr/src/debug/ltp/20250930/include/tst_fs.h"
packages/x86-64-v3-poky-linux/ltp/ltp-src: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp-staticdev: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp-staticdev: PKGV changed from 20250530 [default] to 20250930 [default]
packages/x86-64-v3-poky-linux/ltp/ltp: PKGSIZE changed from 480701301 to 490241920 (+2%)
packages/x86-64-v3-poky-linux/ltp/ltp: PV changed from "20250530" to "20250930"
packages/x86-64-v3-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/shmt06 /opt/ltp/testcases/bin/kill07 /opt/ltp/testcases/bin/eject-tests.sh /opt/ltp/testcases/bin/lchown03 /opt/ltp/testcases/bin/lchown03_16 /opt/ltp/testcases/bin/eject_check_tray /opt/ltp/testcases/bin/munmap02", added "/opt/ltp/testcases/bin/ioctl_pidfd04 /opt/ltp/testcases/bin/ioctl_pidfd05 /opt/ltp/testcases/bin/ioctl_pidfd06 /opt/ltp/testcases/bin/ioctl_pidfd01 /opt/ltp/testcases/bin/ioctl_pidfd02 /opt/ltp/testcases/bin/ioctl_pidfd03 /opt/ltp/testcases/bin/statmount09 /opt/ltp/testcases/bin/lsm_get_self_attr03 /opt/ltp/testcases/bin/lsm_get_self_attr02 /opt/ltp/testcases/bin/lsm_get_self_attr01 /opt/ltp/testcases/bin/lsm_set_self_attr01 /opt/ltp/testcases/bin/tst_run.sh /opt/ltp/testcases/bin/lsm_list_modules01 /opt/ltp/testcases/bin/lsm_list_modules02 /opt/ltp/testcases/bin/cve-2025-38236 /opt/ltp/testcases/bin/ioctl10 /opt/ltp/testcases/bin/clock_settime04 /opt/ltp/testcases/bin/landlock09 /opt/
 ltp/testcases/bin/epoll_pwait06 /opt/ltp/testcases/bin/set_thread_area02 /opt/ltp/testcases/bin/unshare05 /opt/ltp/testcases/bin/listxattr04 /opt/ltp/testcases/bin/file_attr04 /opt/ltp/testcases/bin/file_attr02 /opt/ltp/testcases/bin/landlock10 /opt/ltp/testcases/bin/file_attr03 /opt/ltp/testcases/bin/file_attr01 /opt/ltp/testcases/bin/mount08 /opt/ltp/testcases/bin/cve-2025-21756 /opt/ltp/testcases/bin/mount_setattr02 /opt/ltp/testcases/bin/munmap04"
packages/x86-64-v3-poky-linux/ltp/ltp: PKGV changed from 20250530 [default] to 20250930 [default]

--===============6636292019122858751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/kill07 /opt/ltp/testcases/bin/lchown03 /opt/ltp/testcases/bin/eject-tests.sh /opt/ltp/testcases/bin/munmap02 /opt/ltp/testcases/bin/eject_check_tray /opt/ltp/testcases/bin/lchown03_16 /opt/ltp/testcases/bin/shmt06", added "/opt/ltp/testcases/bin/statmount09 /opt/ltp/testcases/bin/landlock10 /opt/ltp/testcases/bin/landlock09 /opt/ltp/testcases/bin/mount_setattr02 /opt/ltp/testcases/bin/munmap04 /opt/ltp/testcases/bin/cve-2025-38236 /opt/ltp/testcases/bin/epoll_pwait06 /opt/ltp/testcases/bin/set_thread_area02 /opt/ltp/testcases/bin/file_attr01 /opt/ltp/testcases/bin/file_attr03 /opt/ltp/testcases/bin/file_attr02 /opt/ltp/testcases/bin/lsm_get_self_attr02 /opt/ltp/testcases/bin/lsm_list_modules02 /opt/ltp/testcases/bin/lsm_list_modules01 /opt/ltp/testcases/bin/listxattr04 /opt/ltp/testcases/bin/file_attr04 /opt/ltp/testcases/bin/lsm_get_self_attr03 /opt/ltp/testcases/bin/lsm_get_self_attr01 /opt/ltp/testcas
 es/bin/lsm_set_self_attr01 /opt/ltp/testcases/bin/mount08 /opt/ltp/testcases/bin/ioctl10 /opt/ltp/testcases/bin/unshare05 /opt/ltp/testcases/bin/tst_run.sh /opt/ltp/testcases/bin/cve-2025-21756 /opt/ltp/testcases/bin/ioctl_pidfd06 /opt/ltp/testcases/bin/ioctl_pidfd05 /opt/ltp/testcases/bin/ioctl_pidfd04 /opt/ltp/testcases/bin/ioctl_pidfd03 /opt/ltp/testcases/bin/ioctl_pidfd02 /opt/ltp/testcases/bin/ioctl_pidfd01 /opt/ltp/testcases/bin/clock_settime04"

--===============6636292019122858751==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20250530-20250930.patch"

RnJvbSA4Mzc5ZDlmZWY0Mjg4MjkxODExMmVjM2ZkZDhmNGY1YTRmMjJlNGU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMDozOTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
cDogdXBncmFkZSAyMDI1MDUzMCAtPiAyMDI1MDkzMAoKLS0tCiAuLi4wMDAxLUFkZC1fX2NsZWFy
X2NhY2hlLWRlY2xhcmF0aW9uLWZvci1jbGFuZy5wYXRjaCB8ICAyICstCiAuLi4vbHRwLzAwMDEt
UmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0Y2ggICB8ICA2ICsrKy0tLQogLi4u
LXNlbWN0bDA4LVNraXAtc2VtY3RsMDgtd2hlbi1fX1VTRV9USU1FNjRfUkUucGF0Y2ggfCAxMSAr
KysrLS0tLS0tLQogLi4uL2x0cC97bHRwXzIwMjUwNTMwLmJiID0+IGx0cF8yMDI1MDkzMC5iYn0g
ICAgICAgICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAve2x0cF8yMDI1MDUz
MC5iYiA9PiBsdHBfMjAyNTA5MzAuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1BZGQtX19jbGVhcl9jYWNoZS1kZWNsYXJhdGlvbi1mb3It
Y2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLUFkZC1fX2Ns
ZWFyX2NhY2hlLWRlY2xhcmF0aW9uLWZvci1jbGFuZy5wYXRjaAppbmRleCBjOTVkNzIyMGNkLi4y
NGU4NzYyZjc3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAx
LUFkZC1fX2NsZWFyX2NhY2hlLWRlY2xhcmF0aW9uLWZvci1jbGFuZy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLUFkZC1fX2NsZWFyX2NhY2hlLWRlY2xhcmF0
aW9uLWZvci1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODU5ZDI3ZGQ2ZGZjNmU5
ZDI2YWU5YTA1ZjRiMzJhYzQ1YjkxMTg4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YTJjZTA0Y2I4MmQ1NDVmM2RiYWI3MWRlN2ZhNTVlYWFkM2RmMzA2MyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24s
IDEwIEp1biAyMDI0IDIyOjUyOjU2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBfX2NsZWFy
X2NhY2hlIGRlY2xhcmF0aW9uIGZvciBjbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2x0cC9sdHAvMDAwMS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1m
cm9tLXJ1bnRlc3QtbW0ucGF0Y2gKaW5kZXggOTM2ZTIzZWJkYS4uODYwYjJmMTI3ZiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1SZW1vdmUtT09NLXRlc3Rz
LWZyb20tcnVudGVzdC1tbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0
cC8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA3MDk2NzM3ZmJiZTE5ZDA3NjVmMGE4YzYyZWY3NjY3YmY0ODc1NzgwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYjkxNDZkZDMyMmFmOThhN2JiOTZhZDBkODRlYzM3
NjU4OWM2Y2RlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIk1pbmdkZSAoTWF0dGhl
dykgWmVuZyIgPG1hdHRoZXd6bWRAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyOSBKdWwgMjAyMCAw
ODo0NzowOSAtMDQwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgT09NIHRlc3RzIGZyb20gcnVu
dGVzdC9tbQpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBl
dHIudm9yZWxAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvcnVudGVzdC9tbSBiL3J1bnRlc3QvbW0KLWluZGV4IDU1NjZhNzc0Mi4uODAx
NGQ1MDliIDEwMDY0NAoraW5kZXggNDFkNjI0YWQ4Li4xZThjMjI2MzggMTAwNjQ0CiAtLS0gYS9y
dW50ZXN0L21tCiArKysgYi9ydW50ZXN0L21tCi1AQCAtNzAsMTIgKzcwLDYgQEAga3NtMDcga3Nt
MDcKK0BAIC02OSwxMiArNjksNiBAQCBrc20wNyBrc20wNwogIGNwdXNldDAxIGNwdXNldDAxCiAg
Y3B1c2V0MDIgY3B1c2V0MDIKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
dHAvbHRwLzAwMDEtc3lzY2FsbHMtc2VtY3RsMDgtU2tpcC1zZW1jdGwwOC13aGVuLV9fVVNFX1RJ
TUU2NF9SRS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtc3lzY2Fs
bHMtc2VtY3RsMDgtU2tpcC1zZW1jdGwwOC13aGVuLV9fVVNFX1RJTUU2NF9SRS5wYXRjaAppbmRl
eCBiNDg1OWE2ZjBhLi4zNjRlMjAzZTIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbHRwL2x0cC8wMDAxLXN5c2NhbGxzLXNlbWN0bDA4LVNraXAtc2VtY3RsMDgtd2hlbi1fX1VT
RV9USU1FNjRfUkUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAw
MS1zeXNjYWxscy1zZW1jdGwwOC1Ta2lwLXNlbWN0bDA4LXdoZW4tX19VU0VfVElNRTY0X1JFLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1NWI0OGQ2Njg1N2E0M2MyNjA5ZmMzNTEyOTNiNTYw
MWUyZWI5NTVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOTM2NGE3NThkZjlkODlh
MDk2ODg5NDM3NmY4MmY2MzY0NDFhZGRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
SmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwg
MjMgTWF5IDIwMjUgMTU6MTc6NDkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3lzY2FsbHMvc2Vt
Y3RsMDg6IFNraXAgc2VtY3RsMDggd2hlbiBfX1VTRV9USU1FNjRfUkVESVJFQ1RTCkBAIC0yMCwx
MCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25A
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2Vt
Y3RsL3NlbWN0bDA4LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9zZW1jdGwvc2Vt
Y3RsMDguYwotaW5kZXggMTg3OGJkNC4uM2I3OTlmYSAxMDA2NDQKK2luZGV4IGY0NTQ5YWRmNC4u
Mjg3NzZmMjY2IDEwMDY0NAogLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2Vt
Y3RsL3NlbWN0bDA4LmMKICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaXBjL3NlbWN0
bC9zZW1jdGwwOC5jCi1AQCAtMTAsNyArMTAsMTEgQEAKK0BAIC0xMiw3ICsxMiwxMSBAQAogICNp
bmNsdWRlICJ0c3RfdGVzdC5oIgogICNpbmNsdWRlICJsaWJuZXdpcGMuaCIKICAKQEAgLTM2LDEz
ICszNiwxMCBAQCBpbmRleCAxODc4YmQ0Li4zYjc5OWZhIDEwMDY0NAogIAogIHN0YXRpYyB2b2lk
IHJ1bih2b2lkKQogIHsKLUBAIC00Nyw2ICs1MSw0IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3Qg
dGVzdCA9IHsKK0BAIC00OSw2ICs1Myw0IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9
IHsKICAJLnRlc3RfYWxsID0gcnVuLAogIAkubmVlZHNfdG1wZGlyID0gMSwKICB9OwogLSNlbHNl
CiAtVFNUX1RFU1RfVENPTkYoInRlc3QgcmVxdWlyZXMgc3RydWN0IHNlbWlkNjRfZHMgdG8gaGF2
ZSB0aGUgdGltZV9oaWdoIGZpZWxkcyIpOwogICNlbmRpZgotLS0gCi0yLjM0LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNTA1MzAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI1MDkzMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI1MDUzMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNTA5MzAuYmIKaW5kZXggOWVh
NWRlMTBlZS4uMTUxNGFjYThmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0
cC9sdHBfMjAyNTA1MzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAy
NTA5MzAuYmIKQEAgLTI0LDcgKzI0LDcgQEAgVFVORV9DQ0FSR1M6cmVtb3ZlOng4Ni02NCA9ICIt
bWZwbWF0aD1zc2UiCiAKIENGTEFHUzphcHBlbmQ6cG93ZXJwYzY0ID0gIiAtRF9fU0FORV9VU0VS
U1BBQ0VfVFlQRVNfXyIKIENGTEFHUzphcHBlbmQ6bWlwc2FyY2huNjQgPSAiIC1EX19TQU5FX1VT
RVJTUEFDRV9UWVBFU19fIgotU1JDUkVWID0gIjE0MzMxZTFlY2ZjZDYzNDI2YzlkMjcwZDg4Yjdi
YWQ5ZjYwYzZkNjQiCitTUkNSRVYgPSAiZDI1NTBmZmJiY2ZlMTYzMjEyY2Q3ZTljMTMyZGI2NWFl
MGZhMDZlZCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVj
dC9sdHAuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaCBcCi0tIAoyLjQ3
LjEKCg==

--===============6636292019122858751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 117 recipes from the qemux86_64 sysroot...done.
Removing 105 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b81e371cf9214839d6281c31ea5e598dc2486096"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b81e371cf9214839d6281c31ea5e598dc2486096"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 920 Local 840 Mirrors 0 Missed 80 Current 288 (91% match, 93% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 289 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 292 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 295 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 296 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 298 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 311 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 314 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 316 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 317 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 322 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 325 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_write_deb_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 328 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_deb_setscene)
NOTE: recipe file-5.46-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 332 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 333 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 336 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 339 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 340 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 344 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 346 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_package_qa_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 349 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_qa_setscene)
NOTE: Running setscene task 350 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_ipk_setscene)
NOTE: recipe curl-8.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 356 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 361 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 363 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-8.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 367 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 368 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 370 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: recipe which-2.21-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 372 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_qa_setscene)
NOTE: Running setscene task 373 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_deb_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 377 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 379 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 380 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 384 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_rpm_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 386 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_deb_setscene)
NOTE: recipe file-5.46-r0: task do_package_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_deb_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 388 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 391 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: recipe file-5.46-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 396 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 397 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_ipk_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 398 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Started
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 400 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 402 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_deb_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 404 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 411 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_deb_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 417 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 419 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_qa_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 420 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_write_deb_setscene)
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 421 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_qa_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 427 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 428 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_qa_setscene)
NOTE: Running setscene task 429 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_qa_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_deb_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_qa_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 430 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_deb_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 431 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_ipk_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 435 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 437 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 438 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_qa_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 445 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 447 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 448 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 450 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 454 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 455 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_create_spdx_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 456 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 464 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 466 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_package_qa_setscene)
NOTE: Running setscene task 467 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_write_ipk_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 470 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 471 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 472 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_deploy_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 477 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_qa_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 481 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 483 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_deb_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 486 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 487 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 488 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 497 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 504 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 505 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 515 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_create_spdx_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_packagedata_setscene)
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 529 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 543 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gzip-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.3.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 548 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iputils-20250605-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe iputils-20250605-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 570 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_packagedata_setscene)
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 577 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 578 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 584 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libtirpc/1.3.6/temp/log.do_packagedata_setscene.3014628
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 586 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 588 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.08.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 592 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_create_spdx_setscene)
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe gdb-16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 600 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdb-16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 613 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 627 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 631 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe iputils-20250605-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quota-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 639 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_recipe_qa_setscene)
NOTE: recipe gzip-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 648 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iputils-20250605-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdb-16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 652 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 662 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package_setscene)
NOTE: recipe gdb-16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe btrfs-tools-6.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.35-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 696 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_create_spdx_setscene)
NOTE: recipe tar-1.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 713 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe quota-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa_setscene)
NOTE: recipe cpio-2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 724 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_package_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 735 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 738 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 748 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 755 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 756 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 757 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe gzip-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 767 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gzip-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 786 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 796 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/tcl8/8.6.16/temp/log.do_packagedata_setscene.3016776
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 801 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 813 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcl8-8.6.16-r0: task do_package_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 827 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 831 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 837 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 859 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 865 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 867 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 876 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 883 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 886 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 890 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 907 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 912 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 917 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 921 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 928 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 936 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 948 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 950 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 952 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 958 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 960 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 961 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 966 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 981 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 985 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 986 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe tcl8-8.6.16-r0: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 988 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 989 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 990 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1001 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1002 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1003 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1014 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1023 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcl8-8.6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1040 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1041 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe tcl8-8.6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1046 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1048 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1049 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1052 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1054 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1056 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1058 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1059 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1062 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1065 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_setscene)
NOTE: Running setscene task 1068 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1072 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 1074 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1085 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1087 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1088 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1100 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1115 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1117 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1120 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1109 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1318 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_fetch)
NOTE: Running task 1327 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1328 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1420 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_fetch)
NOTE: Running task 1445 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_fetch)
NOTE: Running task 1455 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_recipe_qa)
NOTE: Running task 1468 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_fetch)
NOTE: Running task 1469 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_fetch)
NOTE: Running task 1470 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_fetch)
NOTE: Running task 1471 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1543 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_unpack)
NOTE: Running task 1546 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_write_config)
NOTE: Running task 1557 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_fetch: Started
NOTE: recipe iproute2-6.16.0-r0: task do_fetch: Started
NOTE: recipe ltp-20250930-r0: task do_recipe_qa: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.10-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1618 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_unpack)
NOTE: recipe gdb-16.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1124 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe iputils-20250605-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Started
NOTE: recipe quota-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 1628 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_unpack)
NOTE: Running task 1635 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_unpack)
NOTE: recipe gdb-16.3-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1656 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_unpack)
NOTE: Running task 1670 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1671 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_fetch: Started
NOTE: recipe iputils-20250605-r0: task do_write_config: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_unpack: Started
NOTE: recipe quota-4.10-r0: task do_unpack: Started
NOTE: recipe iproute2-6.16.0-r0: task do_unpack: Started
NOTE: recipe iputils-20250605-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gdb-16.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Started
NOTE: recipe quota-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1689 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe iputils-20250605-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20250930-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1691 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1692 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_unpack)
NOTE: Running task 1693 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_patch)
NOTE: Running task 1694 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_fetch)
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_patch)
NOTE: recipe quota-4.10-r0: task do_patch: Started
NOTE: recipe iproute2-6.16.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1696 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_patch)
NOTE: recipe ltp-20250930-r0: task do_fetch: Started
NOTE: recipe iputils-20250605-r0: task do_unpack: Started
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Started
NOTE: recipe cronie-1.7.2-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.16.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1706 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-6.16.0-r0: task do_patch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Succeeded
NOTE: recipe quota-4.10-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.16-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe ltp-20250930-r0: task do_fetch: Succeeded
NOTE: Running task 1711 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_unpack)
NOTE: recipe iproute2-6.16.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1713 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_patch)
NOTE: Running task 1714 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe cronie-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1715 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20250930-r0: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iputils-20250605-r0: task do_unpack: Succeeded
NOTE: Running task 1716 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_patch)
NOTE: recipe iputils-20250605-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch unihash changed to 8075a07d99670ead44b9c1d6f57315698cd0aaa7e998eb78346afd1f0654c927
NOTE: recipe iputils-20250605-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1719 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe btrfs-tools-6.16-r0: task do_unpack: Succeeded
NOTE: Running task 1720 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_patch: Succeeded
NOTE: recipe ltp-20250930-r0: task do_unpack: Succeeded
NOTE: Running task 1722 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_patch)
NOTE: recipe ltp-20250930-r0: task do_patch: Started
NOTE: recipe gdb-16.3-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_patch)
NOTE: recipe gdb-16.3-r0: task do_patch: Started
NOTE: recipe ltp-20250930-r0: task do_patch: Succeeded
NOTE: Running task 1724 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_deploy_source_date_epoch)
NOTE: Running task 1725 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_populate_lic)
NOTE: recipe ltp-20250930-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20250930-r0: task do_populate_lic: Started
NOTE: recipe ltp-20250930-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_populate_lic unihash changed to 5da9db0dab0f6891831d7f4510ad82f0f3c1f9dd801dad606f5a30548117780b
NOTE: recipe ltp-20250930-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdb-16.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1727 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1125 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1126 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1131 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1133 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1135 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1136 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1138 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1140 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1148 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1152 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1159 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1160 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1166 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1169 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1175 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1181 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1184 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1200 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2234 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2388 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2505 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2596 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2598 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_packagedata)
NOTE: Running task 2606 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata)
NOTE: Running task 2618 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2623 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2714 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2785 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_collect_spdx_deps)
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata: Started
NOTE: recipe ltp-20250930-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2816 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_collect_spdx_deps)
NOTE: recipe iputils-20250605-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2826 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_collect_spdx_deps)
NOTE: Running task 2829 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_collect_spdx_deps)
NOTE: Running task 2847 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20250930-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iputils-20250605-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2898 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_configure)
NOTE: Running task 2899 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: recipe ltp-20250930-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20250930-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2929 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.22.0-r0: task do_configure: Started
NOTE: Running task 2930 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_configure)
NOTE: recipe iproute2-6.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2931 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.16.0-r0: task do_configure: Started
NOTE: Running task 2935 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2949 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_ipk)
NOTE: Running task 2950 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_deb)
NOTE: Running task 2951 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_rpm)
NOTE: recipe quota-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2952 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_qa)
NOTE: recipe ltp-20250930-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2963 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: recipe iputils-20250605-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iputils-20250605-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2988 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_ipk: Started
NOTE: Running task 2994 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_deb: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_qa: Started
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: recipe iputils-20250605-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2995 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3000 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_collect_spdx_deps)
NOTE: Running task 3002 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_compile)
NOTE: recipe btrfs-tools-6.16-r0: task do_configure: Started
NOTE: recipe quota-4.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.16.0-r0: task do_compile: Started
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_configure)
NOTE: recipe quota-4.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3006 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_configure)
NOTE: recipe cronie-1.7.2-r0: task do_configure: Started
NOTE: recipe quota-4.10-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_ipk unihash changed to b6660dd5d7535a4d8d2260c18d59f49633aff02f4f7530435c5fe61d7559d045
NOTE: recipe iputils-20250605-r0: task do_configure: Succeeded
NOTE: Running task 3007 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_compile)
NOTE: recipe iputils-20250605-r0: task do_compile: Started
NOTE: recipe iputils-20250605-r0: task do_compile: Succeeded
NOTE: Running task 3008 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_install)
NOTE: recipe iputils-20250605-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm unihash changed to a200a0019ad7eb133e8dc649a2d1519c512b531dbea7fcd6848b8cbec52e6562
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_qa unihash changed to 019b37061e94bb982e2a553c28411b93261fd220d9420d847a2a6495c77eafb1
NOTE: recipe iputils-20250605-r0: task do_install: Succeeded
NOTE: Running task 3009 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package)
NOTE: Running task 3010 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_populate_sysroot)
NOTE: recipe iputils-20250605-r0: task do_populate_sysroot: Started
NOTE: recipe iputils-20250605-r0: task do_package: Started
NOTE: recipe iputils-20250605-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_deb unihash changed to 2f4806fb2be19ba4381aa7b7d7e03ab187d72560c0f675e9b65b5873ab730bef
NOTE: Running task 3011 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3012 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_compile)
NOTE: recipe logrotate-3.22.0-r0: task do_compile: Started
NOTE: recipe iputils-20250605-r0: task do_package: Succeeded
NOTE: Running task 3013 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_packagedata)
NOTE: recipe iputils-20250605-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_rpm unihash changed to 42f28081476e7eb455594fa270359e221b21383e9d777c46f4b80089d8c837a0
NOTE: Running task 3014 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_compile)
NOTE: recipe iputils-20250605-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_packagedata unihash changed to 0e776e23dab5647ff16dc9ade0976b07cb48a94e4c16c67e19f350af6f807ddb
NOTE: recipe cronie-1.7.2-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3015 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_create_spdx)
NOTE: Running task 3016 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_ipk)
NOTE: Running task 3017 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_deb)
NOTE: Running task 3018 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_rpm)
NOTE: Running task 3019 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_qa)
NOTE: recipe logrotate-3.22.0-r0: task do_compile: Succeeded
NOTE: Running task 3020 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_compile_ptest_base)
NOTE: recipe iputils-20250605-r0: task do_create_spdx: Started
NOTE: recipe quota-4.10-r0: task do_configure: Succeeded
NOTE: recipe iputils-20250605-r0: task do_package_write_ipk: Started
NOTE: recipe iputils-20250605-r0: task do_package_write_deb: Started
NOTE: Running task 3021 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_compile)
NOTE: recipe iputils-20250605-r0: task do_package_write_rpm: Started
NOTE: recipe iputils-20250605-r0: task do_package_qa: Started
NOTE: recipe logrotate-3.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe quota-4.10-r0: task do_compile: Started
NOTE: recipe logrotate-3.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3022 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_install)
NOTE: recipe cronie-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3023 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_install)
NOTE: recipe iputils-20250605-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_install: Started
NOTE: recipe cronie-1.7.2-r0: task do_install: Started
NOTE: recipe iputils-20250605-r0: task do_package_write_ipk: Succeeded
NOTE: recipe iputils-20250605-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_ipk unihash changed to a9df78ae90a47945534dd0e7b6108c8aa67ef3bd87f3c1e5400d63d4af4fdeca
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_qa unihash changed to 3877a21f10d854012465d37eed8fe5e4132ff4faff52316dcdf6309ffb6587d2
NOTE: recipe iputils-20250605-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iputils-20250605-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_rpm unihash changed to 9c8576508768d3239cc628df5aae87eada2b33f16e8a0804df12c064db22c57a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_deb unihash changed to e9d97563b275a42fd59f418782ec751f3c5db4629ffd2d5d36fc6b688f549dda
NOTE: recipe logrotate-3.22.0-r0: task do_install: Succeeded
NOTE: recipe quota-4.10-r0: task do_compile: Succeeded
NOTE: Running task 3024 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_install)
NOTE: recipe cronie-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 3025 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_install_ptest_base)
NOTE: Running task 3026 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package)
NOTE: Running task 3027 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_populate_sysroot)
NOTE: recipe quota-4.10-r0: task do_install: Started
NOTE: recipe logrotate-3.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe cronie-1.7.2-r0: task do_package: Started
NOTE: recipe logrotate-3.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3028 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package)
NOTE: Running task 3029 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_populate_sysroot)
NOTE: recipe logrotate-3.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe quota-4.10-r0: task do_install: Succeeded
NOTE: Running task 3030 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package)
NOTE: Running task 3031 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_populate_sysroot)
NOTE: recipe quota-4.10-r0: task do_package: Started
NOTE: recipe quota-4.10-r0: task do_populate_sysroot: Started
NOTE: recipe logrotate-3.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe quota-4.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.16-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_compile)
NOTE: recipe btrfs-tools-6.16-r0: task do_compile: Started
NOTE: recipe iproute2-6.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_install)
NOTE: recipe iproute2-6.16.0-r0: task do_install: Started
NOTE: recipe cronie-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_packagedata)
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.16.0-r0: task do_install: Succeeded
NOTE: Running task 3035 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package)
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_package: Started
NOTE: Running task 3037 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_create_spdx)
NOTE: Running task 3038 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_ipk)
NOTE: Running task 3039 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_deb)
NOTE: Running task 3040 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_rpm)
NOTE: Running task 3041 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_qa)
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_qa: Started
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_qa unihash changed to 74cdd210216f439dffefdf0f3c52ed5a89f5fa930e96bb252c52fb5544c17385
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.10-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_packagedata)
NOTE: recipe quota-4.10-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_packagedata)
NOTE: recipe logrotate-3.22.0-r0: task do_packagedata: Started
NOTE: recipe quota-4.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_packagedata unihash changed to 8ce61c8af76158059fc779bb1a10d9bd61353254c93e515322a3b3bd84be30b6
NOTE: Setscene tasks completed
NOTE: Running task 3044 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_create_spdx)
NOTE: Running task 3045 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_write_ipk)
NOTE: Running task 3046 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_write_deb)
NOTE: Running task 3047 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_write_rpm)
NOTE: Running task 3048 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_qa)
NOTE: recipe quota-4.10-r0: task do_create_spdx: Started
NOTE: recipe quota-4.10-r0: task do_package_write_ipk: Started
NOTE: recipe quota-4.10-r0: task do_package_write_deb: Started
NOTE: recipe quota-4.10-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.10-r0: task do_package_qa: Started
NOTE: recipe logrotate-3.22.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_packagedata unihash changed to 1d37b7b9c9ec662e5714a7f5790f4d3efc17d393a664f4a60b7f6f87aef65e54
NOTE: Setscene tasks completed
NOTE: Running task 3049 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_create_spdx)
NOTE: Running task 3050 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_ipk)
NOTE: Running task 3051 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_deb)
NOTE: Running task 3052 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_rpm)
NOTE: Running task 3053 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_qa)
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_deb: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_qa: Started
NOTE: recipe quota-4.10-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.10-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_write_ipk unihash changed to 564d7c09c70bbe45934918ca2b2061486ae62dd1d59279c9edff1c4901c6d0fe
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.10-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_qa unihash changed to 26eaf0b90c82695219790a272e43c75277685ab633968838a4ceecebfe185935
NOTE: recipe quota-4.10-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_write_rpm unihash changed to 23dfa9813ecdb6522efa8dc23992a6395157dd8e2baccb3a0076b20aed88d807
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_ipk unihash changed to 4291c5b12b8223f8d5ad7ab1e454da4c9003c3b3cb07156eb136c60fad578c39
NOTE: recipe logrotate-3.22.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_qa unihash changed to 46763840c5bd6b86271df3e300166ce2b54e9d7e0471987ab068efab112e4ff9
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_deb unihash changed to cb237f7a30ffa9b780518dda3665a7fc742fa35d8a021b8cb5509cd19be377c9
NOTE: recipe btrfs-tools-6.16-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_install)
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_rpm unihash changed to 1e2e0538e8014eaa9b7f0c0b341c41b75e95f905f27c3a53ab6a3c8acf3c2f22
NOTE: recipe quota-4.10-r0: task do_package_write_deb: Succeeded
NOTE: recipe btrfs-tools-6.16-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.10.bb:do_package_write_deb unihash changed to 27660daa207aae48662bdd521140963729a96e3e118f5557a01b7c3ce6b88f6d
NOTE: recipe iproute2-6.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package unihash changed to 4e2d3f8beb2bce875cb01e7e2fffc7361c047b8b3197572e55da5431efa2ea9b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_packagedata became valid
NOTE: Running setscene task 1208 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_install: Succeeded
NOTE: recipe ltp-20250930-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250930.bb:do_compile)
NOTE: Running task 3056 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_package)
NOTE: recipe iproute2-6.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3058 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_create_spdx)
NOTE: Running task 3059 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_write_ipk)
NOTE: recipe ltp-20250930-r0: task do_compile: Started
NOTE: Running task 3060 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_write_deb)
NOTE: recipe btrfs-tools-6.16-r0: task do_package: Started
NOTE: Running task 3061 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_write_rpm)
NOTE: Running task 3062 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_qa)
NOTE: recipe iproute2-6.16.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.16.0-r0: task do_package_write_ipk: Started
NOTE: recipe iproute2-6.16.0-r0: task do_package_write_deb: Started
NOTE: recipe iproute2-6.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.16.0-r0: task do_package_qa: Started
NOTE: recipe iproute2-6.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_write_ipk unihash changed to 90b56b292b63ce95835072019c84b95b0115589d159d477ee61e3609695cff77
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_configure: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_package_qa: Succeeded
NOTE: Running task 3063 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_qa unihash changed to 4526538257643e034c5954be64bf61e262c60a407736e8b5b77ea8daf457694b
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_write_rpm unihash changed to 61a1077d727839b2c7052f7735f88dd22aa7b350fa67acba89f8c4fe51dd9340
NOTE: recipe btrfs-tools-6.16-r0: task do_package: Succeeded
NOTE: Running task 3064 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_packagedata)
NOTE: recipe iproute2-6.16.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package_write_deb unihash changed to 44ccb5e07b7741e20cd38fe2003e3732d720b03cf5f0855f8ab4d3c0eb4cbc33
NOTE: recipe btrfs-tools-6.16-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_packagedata: Failed
NOTE: recipe lttng-ust-2_2.14.0-r0: task do_compile: Succeeded
NOTE: recipe ltp-20250930-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3064 tasks of which 2933 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001103550.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001103550.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/btrfs-tools/6.16/temp/log.do_packagedata.3064654
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-src went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-dbg went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-lib went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-ptest went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-staticdev went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-dev went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-doc went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8-locale went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: QA Issue: Package version for package tcl8 went backwards which would break package feeds (from 0:8.6.17-r0 to 0:8.6.16-r0) [version-going-backwards]
ERROR: tcl8-8.6.16-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.17-r0 to 0:6.16-r0) [version-going-backwards]
ERROR: btrfs-tools-6.16-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/btrfs-tools/6.16/temp/log.do_packagedata.3064654
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_packagedata) failed with exit code '1'

--===============6636292019122858751==--

