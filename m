Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D2CC83F28
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1428.1751386807920747292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CKG7BL8t;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LOgykvp8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6ca1136-a2e0c868-0baa-4c18-b150-09948947a2ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=meS2O53O+B70zI81c/9iCp86ahL5XAMGWkIPRWfrbxw=;
	b=CKG7BL8tTsLHm5ooDPMiwwbEpg+o9v3WqRehYpFQw7FSzgx/KETD6hmxw1CXNq2f
	E4RDLB1/Uc7QsVQKV1y8h3cQA+txwXe/6QzEgSlt6NuLTIoPiKpRBSofsizy2KYWJbp
	zZZo+ks7KfJ6bjLptkYxgndn8Yz12SEXIiAv8HmE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=meS2O53O+B70zI81c/9iCp86ahL5XAMGWkIPRWfrbxw=;
	b=LOgykvp8j/SBX9ga52h2aQPaUY6mUrt4+TzrOjLngRXYvQLqKG292QE2KSJ/tlkA
	NRULcXX8HCV9bOVBNK64hjnxPSRKSTVzbsb7hhlALRWnmLrilw7koFLc+iCdhWww8B6
	WzduBEli9xZOqcvfgWnWZO2tmy4jn/mhxcxtxYa0=
Content-Type: multipart/mixed; boundary="===============1956835339292152764=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20250530 SUCCEEDED
Message-ID: <01010197c6ca1136-a2e0c868-0baa-4c18-b150-09948947a2ea-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219660

--===============1956835339292152764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ltp* to *20250530* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20250130-20250530.patch
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
From e6595c16238a6ce2ac3c016de3b25d7f182bacc8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 11:11:20 +0000
Subject: [PATCH] ltp: upgrade 20250130 -> 20250530

---
 ...-__clear_cache-declaration-for-clang.patch |  6 +-
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  8 +--
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 -----------
 ...01-kernel-kvm-don-t-hardcode-objcopy.patch | 69 -------------------
 .../ltp/{ltp_20250130.bb => ltp_20250530.bb}  |  4 +-
 5 files changed, 8 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode-objcopy.patch
 rename meta/recipes-extended/ltp/{ltp_20250130.bb => ltp_20250530.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index ade6a52b63..501947fc39 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From 2d384f268791ecd5ff0f26c8137dd4de0a1c4566 Mon Sep 17 00:00:00 2001
+From 3efff29443e6254169cab929149f375bd4e961f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
@@ -19,10 +19,10 @@ Cc: Hui Min Mina Chou <minachou@andestech.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-index a84ba6476..856e22ff3 100644
+index 1dde9e87b..6a6f5fe5e 100644
 --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-@@ -21,6 +21,7 @@
+@@ -19,6 +19,7 @@
  
  #if defined(__clang__)
  	#pragma clang optimize off
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 5b6c780bec..2f50b3187c 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
+From a556bca0b07948b9f2fddfc3f9a768c35a5aae74 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,12 +14,12 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 6a8cd0b9d..8ce3f4416 100644
+index 5566a7742..8014d509b 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -76,12 +76,6 @@ ksm07 ksm07
- 
+@@ -70,12 +70,6 @@ ksm07 ksm07
  cpuset01 cpuset01
+ cpuset02 cpuset02
  
 -oom01 oom01
 -oom02 oom02
diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
deleted file mode 100644
index c6fae88eb9..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 28d823a63ee29f5d72c2aba781a06a7e2651cadc Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@gotplt.org>
-Date: Mon, 7 Apr 2025 06:24:47 -0400
-Subject: [PATCH] cve-2015-3290: Disable AVX for x86_64
-
-When the input compiler enables AVX, stack realignment requirements
-causes gcc to fail to omit %rbp use, due to which the test fails to
-clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
-that the test continues working.
-
-Link: https://lore.kernel.org/ltp/20250407102448.2605506-2-siddhesh@gotplt.org/
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/28d823a63ee29f5d72c2aba781a06a7e2651cadc]
-
-Reviewed-by: Martin Doucha <mdoucha@suse.cz>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
-
----
- testcases/cve/Makefile | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
-index 01b9b9ccb..98c38e908 100644
---- a/testcases/cve/Makefile
-+++ b/testcases/cve/Makefile
-@@ -22,6 +22,12 @@ ifneq (,$(filter $(HOST_CPU),x86 x86_64))
- meltdown: CFLAGS += -msse2
- endif
- 
-+# The test needs to clobber %rbp, which requires frame pointer omission.  Also
-+# for x86_64, disable AVX since that could sometimes require a stack
-+# realignment, which gets in the way of frame pointer omission.
- cve-2015-3290:	CFLAGS += -pthread -fomit-frame-pointer
-+ifeq ($(HOST_CPU),x86_64)
-+cve-2015-3290: CFLAGS += -mno-avx
-+endif
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.37.3
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode-objcopy.patch b/meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode-objcopy.patch
deleted file mode 100644
index 256c8eaa34..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode-objcopy.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 0a42a8ee0ae8c6f1e603c1836b7c9c7fab0ca3a8 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 27 Feb 2025 12:38:50 +0000
-Subject: [PATCH] kernel/kvm: don't hardcode objcopy
-
-testcases/kernel/kvm uses objcopy to contruct a payload binary, but in
-cross builds the host objcopy may not know how to handle target
-binaries:
-
- CC testcases/kernel/kvm/lib_host.o
- objcopy: Unable to recognise the format of the input file `kvm_svm03-payload.elf'
- make[3]: *** [ltp/testcases/kernel/kvm/Makefile:67: kvm_svm03-payload.o] Error 1
-
-This is trivially fixed by searching for an objcopy tool (so
-host-prefixed in cross builds) and using that instead.
-
-Upstream-Status: Backport [a3942c0a5f9b4463e8320e80cd8522a2e008bfd2]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac                  | 1 +
- include/mk/config.mk.in       | 1 +
- testcases/kernel/kvm/Makefile | 4 ++--
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 344b2ae2c..0f2b6f332 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -30,6 +30,7 @@ AC_PROG_RANLIB
- AC_DEFUN([AC_PROG_STRIP], [AC_CHECK_TOOL(STRIP, strip, :)])
- AC_PROG_STRIP
- AC_PROG_YACC
-+AC_CHECK_TOOL([OBJCOPY], [objcopy], [:])
- 
- m4_ifndef([PKG_CHECK_EXISTS],
- 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL])])
-diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
-index 2b7c8a071..4c3da304f 100644
---- a/include/mk/config.mk.in
-+++ b/include/mk/config.mk.in
-@@ -11,6 +11,7 @@ AR			:= @AR@
- CC			:= @CC@
- LEX			:= @LEX@
- RANLIB			:= @RANLIB@
-+OBJCOPY			:= @OBJCOPY@
- STRIP			:= @STRIP@
- YACC			:= @YACC@
- 
-diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index 07bdd9705..e93528a33 100644
---- a/testcases/kernel/kvm/Makefile
-+++ b/testcases/kernel/kvm/Makefile
-@@ -60,11 +60,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
- %-payload.o: %.c lib_guest.o $(ARCH_OBJ)
- ifdef VERBOSE
- 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
--	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
-+	$(OBJCOPY) -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
- 	$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- else
- 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
--	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
-+	@$(OBJCOPY) -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
- 	@$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- 	@echo KVM_CC $(target_rel_dir)$@
- endif
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250530.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20250130.bb
rename to meta/recipes-extended/ltp/ltp_20250530.bb
index fc643c2ab9..5b3c481859 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250530.bb
@@ -24,13 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
+SRCREV = "14331e1ecfcd63426c9d270d88b7bad9f60c6d64"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
-           file://0001-kernel-kvm-don-t-hardcode-objcopy.patch \
-           file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
 inherit autotools-brokensep pkgconfig
-- 
2.47.1


--===============1956835339292152764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/kill09 /opt/ltp/testcases/bin/modify_ldt03 /opt/ltp/runtest/ipc /opt/ltp/testcases/bin/symlink01 /opt/ltp/testcases/bin/pause03 /opt/ltp/testcases/bin/mmap001", added "/opt/ltp/testcases/bin/fcntl40 /opt/ltp/testcases/bin/cpuset02 /opt/ltp/testcases/bin/move_mount03 /opt/ltp/testcases/bin/ioctl_fiemap01 /opt/ltp/testcases/bin/flock07 /opt/ltp/testcases/bin/fanotify24 /opt/ltp/testcases/bin/unshare04 /opt/ltp/testcases/bin/kvm_vmx01 /opt/ltp/testcases/bin/kvm_vmx02 /opt/ltp/testcases/data/ima_violations/violations.policy /opt/ltp/testcases/bin/mmap22 /opt/ltp/testcases/bin/mmap21 /opt/ltp/testcases/bin/unshare03 /opt/ltp/testcases/bin/fcntl40_64 /opt/ltp/testcases/bin/fchownat03 /opt/ltp/testcases/data/ima_measurements/tcb.policy"

--===============1956835339292152764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ltp: SRC_URI changed from "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://0001-Add-__clear_cache-declaration-for-clang.patch file://0001-kernel-kvm-don-t-hardcode-objcopy.patch file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch" to "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://0001-Add-__clear_cache-declaration-for-clang.patch"
packages/core2-64-poky-linux/ltp: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp-dbg: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/pause03 /opt/ltp/testcases/bin/.debug/kill09 /opt/ltp/testcases/bin/.debug/modify_ldt03 /opt/ltp/testcases/bin/.debug/mmap001 /opt/ltp/testcases/bin/.debug/symlink01", added "/opt/ltp/testcases/bin/.debug/fcntl40 /opt/ltp/testcases/bin/.debug/cpuset02 /opt/ltp/testcases/bin/.debug/unshare03 /opt/ltp/testcases/bin/.debug/unshare04 /opt/ltp/testcases/bin/.debug/fanotify24 /opt/ltp/testcases/bin/.debug/mmap21 /opt/ltp/testcases/bin/.debug/mmap22 /opt/ltp/testcases/bin/.debug/fchownat03 /opt/ltp/testcases/bin/.debug/move_mount03 /opt/ltp/testcases/bin/.debug/flock07 /opt/ltp/testcases/bin/.debug/ioctl_fiemap01 /opt/ltp/testcases/bin/.debug/fcntl40_64 /opt/ltp/testcases/bin/.debug/kvm_vmx01 /opt/ltp/testcases/bin/.debug/kvm_vmx02"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 1282396624 to 1320117088 (+3%)
packages/core2-64-poky-linux/ltp/ltp-dev: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp-dev: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp-dev: PKGSIZE changed from 357518 to 361396 (+1%)
packages/core2-64-poky-linux/ltp/ltp-doc: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp-doc: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp-locale: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp-locale: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp-src: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp-src: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20250130/include -> /usr/src/debug/ltp/20250530/include, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20250530/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp
 /20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20250130/testcases/lib/tests -> /usr/src/debug/ltp/20250530/testcases/lib/tests, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll, 
 directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/abs -> /usr/src/debug/ltp/20250530/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/float -> /usr/src/debug/ltp/20250530/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/kallsyms -> /usr/src/debug/ltp/20250530/testcases/kerne
 l/security/kallsyms, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/splice, directory renamed /usr/src
 /debug/ltp/20250130/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20250530/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20250530/testcases/misc/math/nextafter, directory renamed /usr/
 src/debug/ltp/20250130/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20250530/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20250130/libs/ujson -> /usr/src/debug/ltp/20250530/libs/ujson, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20250530/testcases
 /kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20250530/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/sr
 c/debug/ltp/20250130/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/202
 50130/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20250130/testcases/network/sctp -> /usr/src/debug/ltp/20250530/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20250530/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20250130/testcases/o
 pen_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20250530/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src
 /debug/ltp/20250130/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20250530/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20250530/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/f00f -> /usr/src
 /debug/ltp/20250530/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/shutdown -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/shutdown, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pathconf, directory renamed /usr/
 src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20250130/utils/sctp/testlib -> /usr/src/debug/ltp/20250530/utils/sctp/testlib, directory renamed /usr/src/debug
 /ltp/20250130/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/cap_bound -> /usr/src/debug/
 ltp/20250530/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20250130/testcases/network/can/cve -> /usr/src/debug/ltp/20250530/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/confor
 mance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20250530/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_self
  -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/be
 havior/WIFEXITED -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20250130/include/old -> /usr/src/debug/ltp/20250530/include/old, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/waitid -> /usr/src/d
 ebug/ltp/20250530/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20250530/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20250130
 /testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20250530/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/aslr -> /usr/src/debug/ltp/20250530/testcases/kernel/security/aslr, directory renamed /usr/src/debug/ltp/20250130/testcases/network/sockets -> /usr/src/debug/ltp/20250530/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20250130/libs/ipc -> /usr/src/debug/ltp/20250530/libs/ipc, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listmount -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listmount, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20250130/testcases/
 kernel/syscalls/string -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sbrk -> /usr/src/
 debug/ltp/20250530/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20250130/testcases/op
 en_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20250530/testcases
 /kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/float/power -> /usr/src/debug/ltp/20250530/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statmount -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statmount, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/deb
 ug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20250530/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/rt
 -migrate -> /usr/src/debug/ltp/20250530/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/lib -> /usr/src/debug/ltp/20250530/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20250130
 /testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20250130/testcases/network/packet -> /usr/src/debug/ltp/20250530/testcases/network/packet, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20250530/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20250530/test
 cases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munmap, direc
 tory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20250530/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/2
 0250130/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_getoverrun, direc
 tory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20250530/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20250530/testcases/open_posix_test
 suite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/d
 ebug/ltp/20250130/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/202501
 30/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20250130/libs/uinput -> /usr/src/debug/ltp/20250530/libs/uinput, directory renamed /usr/src/debug/ltp/20250130/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20250530/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_ba
 rrierattr_setpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sound -> /usr/src/debug/ltp/20250530/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/io/aio -> /usr/src/debug/ltp/20250530/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20250530/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_
 exit, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20250130/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20250530/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_h
 otplug_test, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/numa -> /usr/src/debug/ltp/20250530/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20250130/libs/vdso -> /usr/src/debug/ltp/20250530/libs/vdso, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20250530/
 testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20250530/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, dir
 ectory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/sr
 c/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20250130/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20250530/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/2025013
 0/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20250530/testcases/ope
 n_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/page -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/input -> /usr/src/debug/ltp/20250530/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/landlock -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/landlock, directory renamed /usr/src/d
 ebug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20250130/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20250530/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pivot_root -> /usr/sr
 c/debug/ltp/20250530/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/sysctl -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/sysctl, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy
  -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, direct
 ory renamed /usr/src/debug/ltp/20250130/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20250530/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20250130/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20250530/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20250530/testcases/open_pos
 ix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20250530/testcases/kernel
 /sched/tool, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/cachestat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/cachestat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20250130/te
 stcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/arch_prctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/arch_prctl, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/sr
 c/debug/ltp/20250130/testcases/kernel/crypto -> /usr/src/debug/ltp/20250530/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20250130/tools/genload -> /usr/src/debug/ltp/20250530/tools/genload, directory renamed /usr/src/debug/ltp/20250130/testcases/ke
 rnel/syscalls/gettid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20250
 530/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20250130/tools/apicmds -> /usr/src/debug/ltp/20250530/tools/apicmds, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mknod, 
 directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20250530/testca
 ses/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getsche
 dpolicy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20250130/libs/newipc -> /usr/src/debug/ltp/20250530/libs/newipc, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/confor
 mance/interfaces/mq_close -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/mem, directory renamed /usr/src/debug/
 ltp/20250130/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscall
 s/clock_settime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20250130/libs/swap -> /usr/src/debug/ltp/20250530/libs/swap, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ustat, directory renamed /u
 sr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/s
 yscalls/setuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20250530/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20250530/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20250530/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mseal -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mseal, directory renamed /usr/src/debug/ltp/2025
 0130/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20250530/testcas
 es/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/creat -> /u
 sr/src/debug/ltp/20250530/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20250130/testcases/network/iptables -> /usr/src/debug/ltp/20250530/testcases/network/iptables, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite
 /conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/fptests -> /usr/src/debug/ltp/20250530/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/process_madvise -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/process_madvise, directory renamed /usr/src/debug/ltp/20250130/utils/sctp/lib -> /usr/src/debug/ltp/20250530/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/202505
 30/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls
 /sched_setaffinity -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20250530/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20250530/testcases/kernel
 /syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/
 sigaddset, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/inte
 rfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/
 fsmount -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/
 src/debug/ltp/20250130/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20250530/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/seccomp -> /usr/src/debug/ltp/20250530
 /testcases/kernel/syscalls/seccomp, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20250530/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/faccessat2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/faccessat2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/atof -> /usr/src/debug/ltp/20250530/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/munlockall, directo
 ry renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/madvise -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/madvise, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20250530/testcase
 s/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mount -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mount, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigtimedwait -> /usr/
 src/debug/ltp/20250530/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20250130/testca
 ses/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20250130/utils/sctp/include/netinet -> /usr/src/debug/ltp/20250530/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/
 ipc/msgget -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20250530/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsync, director
 y renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/include -> /usr/src/debug/ltp/20250530/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20250130/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20250530/testcases/network/multi
 cast/mc_opts, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20250130/pan -> /usr/src/debug/ltp/20250530/pan, directory renamed /usr/src/debug/ltp/20250130/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20250530/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory r
 enamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/cve -> /usr/src/debug/ltp/20250530/testcases/cve, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/in
 terfaces/mlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20250130/testcases/lib -> /usr/src/debug/ltp/20250530/testcases/lib, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/202
 50530/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugemmap -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugemmap, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchmodat2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchmodat2, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -
 > /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20250530/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_conda
 ttr_getclock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20250130/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20250530/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20250
 530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfa
 ces/pthread_condattr_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20250530/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/d
 ebug/ltp/20250130/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20250130/testcases/misc/crash -> /usr/src/debug/ltp/20250530/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getcwd -> /
 usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/pty -> /usr/src/debug/ltp/20250530/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20250530/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20250130/lib -> /usr/src/debug/ltp/20250530/lib, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20250530/testcases/kernel/sysc
 alls/open_tree, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/smack -> /usr/src/debug/ltp/20250530/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20250130/libs/sigwait -> /usr/src/debug/ltp/
 20250530/libs/sigwait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/fs_di, directory renamed /usr/src/deb
 ug/ltp/20250130/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/mmapstress, directo
 ry renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20250530/t
 estcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr
 /src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20250130/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20250530/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_te
 stsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_setschedul
 er, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sockioctl, directory renamed /us
 r/src/debug/ltp/20250130/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20250530/testcases/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20250
 530/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/umip -> /usr/src/debug/ltp/20250530/testcases/kernel/security/umip, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20250130/test
 cases/network/lib6 -> /usr/src/debug/ltp/20250530/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20250530/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20250530/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_syscall_test -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory r
 enamed /usr/src/debug/ltp/20250130/testcases/kernel/uevents -> /usr/src/debug/ltp/20250530/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20250530/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20250130/testcases/network/netstress -> /usr/src/debug/ltp/20250530/testcases/n
 etwork/netstress, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20250130/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20250530/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/doio/inclu
 de, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces
 /sigfillset, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug
 /ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/power_management -> /usr/src/debug/ltp/20250530/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp
 /20250530/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20250530/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20250130/test
 cases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20250130/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20250530/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20250130/testcas
 es/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20250130/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20250530/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mlockall/s
 peculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gethostname -> /usr/src
 /debug/ltp/20250530/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20250130/
 testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20250130/testcases/commands/eject -> /usr/src/debug/ltp/20250530/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20250130/t
 estcases/kernel/sched/nptl -> /usr/src/debug/ltp/20250530/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20250130/utils/sctp/func_tests -> /usr/src/debug/ltp/20250530/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20250530/testc
 ases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/
 20250130/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20250530/testcase
 s/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/fsplough -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/fsplough, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/
 syscalls/wait4 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20250530/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20250530/testcase
 s/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20250530/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20250530/testca
 ses/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/inode, directory renamed
  /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20250530/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/inte
 rfaces/sighold, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20250130/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20250530/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuit
 e/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20250130/testcases/
 open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rw
 lock_trywrlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigtime
 dwait -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cgroup_xattr, directory re
 named /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src
 /debug/ltp/20250130/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20250530/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src
 /debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20250130/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20250530/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/c
 onformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20250530/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, direc
 tory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20250530/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/timer_ge
 toverrun/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20250530/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/lt
 p/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/irq -> /usr/src/debug/ltp/20250530/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20250530/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ip
 c/shmget -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20250530/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20250130/testcas
 es/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20250530/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_
 destroy -> /usr/src/debug/ltp/20250530/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20250530/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20250130/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20250
 530/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, removed "/usr/src/debug/ltp/20250130/include/lapi/stat.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl08.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/ksm/ksm01.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/oom/oom01.c /usr/src/debug/ltp/20250130/include/lapi/faccessat.h /usr/src/debug/ltp/20250130/include/lapi/sched.h /usr/src/debug/ltp/20250130/testcases/kernel/include/numa_helper.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ns05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill07.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/ksm/ksm07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/lt
 p/20250130/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify11.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify21.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/move_mount/move_mount01.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/ksm/ksm_common.h /usr/src/debug/ltp/20250130/include/lapi/sem.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap20.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ficlone02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ns03.c /usr/src/debug/ltp/20250130/include/lapi/membarrier.h /usr/src/debug/ltp/20250130/include/lapi/landlock.h /usr/src/debug/ltp/20250130/testcases/kernel/lib/num
 a_helper.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ns01.c /usr/src/debug/ltp/20250130/include/lapi/fs.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ficlone01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20250130/include/lapi/mman.h /usr/src/debug/ltp/20250130/testcases/kernel/mem/ksm/ksm03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap001.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify17.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl04.c /usr/src/debug/ltp/20250130/testcases/kerne
 l/syscalls/ioctl/ioctl_ns07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flock/flock04.c /usr/src/debug/ltp/20250130/testcases/kernel/include/ksm_helper.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flock/flock06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl09.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill12.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill11.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify16.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill13.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscall
 s/ioctl/ioctl_ficlonerange02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill09.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/move_mount/move_mount02.c /usr/src/debug/ltp/20250130/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20250130/testcases/kernel/kvm/lib_host.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/modify_ldt/modify_ldt03.c /usr/src/debug/ltp/20250130/include/lapi/watch_queue.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ficlone04.c /usr/src/debug/ltp/20250130/include/lapi/pkey.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify_child.c /usr/src/debug/ltp/20250130/include/lapi/futex.h /usr/src/debug/ltp/20250130/testcases
 /kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20250130/include/lapi/openat2.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchownat/fchownat02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flock/flock03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl03.c /usr/src/debug/ltp/20250130/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20250130/include/lapi/kcmp.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flock/flock01.c /usr/src/debug/ltp/20250130/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl05.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/thp/thp03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/paus
 e/pause03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/thp/thp01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify14.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify02.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/include/mem.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify12.c /usr/src/debug/ltp/20250130/testcases/kernel/kvm/kvm_pagefault01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify22.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pause/pause01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill10.c /usr/src/debug/ltp/20250130/include/lapi/bpf.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/symlink/symlink01.c /usr/src/debug/
 ltp/20250130/testcases/kernel/syscalls/symlink/symlink02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/symlink/symlink03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/symlink/symlink04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/kill/kill08.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_sg01.c /usr/src/debug/ltp/2025
 0130/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify19.c /usr/src/debug/ltp/20250130/include/lapi/epoll.h /usr/src/debug/ltp/20250130/testcases/kernel/mem/thp/thp04.c /usr/src/debug/ltp/20250130/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_loop01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_loop02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_loop03.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/lib/mem.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_loop04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_lo
 op05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_loop06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_loop07.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/flock/flock02.c /usr/src/debug/ltp/20250130/include/lapi/syscalls.h /usr/src/debug/ltp/20250130/testcases/kernel/mem/thp/thp02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify18.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify08.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify15.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fchownat/fchownat01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl06
 .c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/pause/pause02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify03.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify13.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify23.c /usr/src/debug/ltp/20250130/include/lapi/fanotify.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20250130/include/lapi/keyctl.h /usr/src/debug/ltp/20250130/include/lapi/ustat.h /usr/src/debug/ltp/20250130/include/lapi/pidfd.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ns04.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20250130/include/lapi/close_range.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/unshare/unshare01.c /usr/src/debug
 /ltp/20250130/testcases/kernel/syscalls/unshare/unshare02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl02.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify10.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify20.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify.h /usr/src/debug/ltp/20250130/testcases/kernel/lib/ksm_helper.c /usr/src/debug/ltp/20250130/include/lapi/io_uring.h /usr/src/debug/ltp/20250130/testc
 ases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c /usr/src/debug/ltp/20250130/include/lapi/common_timers.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20250130/include/lapi/fsmount.h /usr/src/debug/ltp/20250130/include/lapi/readdir.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ns02.c /usr/src/debug/ltp/20250130/testcases/kernel/mem/ksm/ksm05.c /usr/src/debug/ltp/20250130/include/lapi/quotactl.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/ioctl/ioctl_ns06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20250130/testcases/kernel/sys
 calls/fcntl/fcntl33.c /usr/src/debug/ltp/20250130/testcases/kernel/kvm/kvm_svm03.c /usr/src/debug/ltp/20250130/include/lapi/init_module.h /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify06.c /usr/src/debug/ltp/20250130/testcases/kernel/syscalls/fanotify/fanotify09.c", added "/usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify11.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify21.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns06.c /usr/src/debug/ltp/20250530/testcases/kernel/lib/ksm_helper.c /usr/src/debug/ltp/20250530/include/lapi/faccessat.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/f
 anotify07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify17.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/oom/oom.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl04.c /usr/src/debug/ltp/20250530/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/flock/flock03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/202505
 30/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20250530/include/lapi/bpf.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify14.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify04.c /usr/src/debug/ltp/20250530/include/lapi/fsmount.h /usr/src/debug/ltp/20250530/include/lapi/readdir.h /usr/src/debug/ltp/20250530/testcases/kernel/kvm/lib_host.c /usr/src/debug/ltp/20250530/include/lapi/landlock.h /usr/src/debug/ltp/20250530/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify24.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanoti
 fy/fanotify.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap22.c /usr/src/debug/ltp/20250530/include/lapi/mman.h /usr/src/debug/ltp/20250530/include/lapi/resource.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/thp/thp01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify09.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify19.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl08.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/thp/thp02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pause/pause01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify08.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify18.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill08.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify_child.c /usr/src/debug/ltp/20250530/inc
 lude/lapi/pkey.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify22.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify12.c /usr/src/debug/ltp/20250530/include/lapi/syscalls.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c /usr/src/debug/ltp/20250530/include/lapi/keyctl.h /usr/src/debug/ltp/20250530/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20250530/testcases/kernel/kvm/kvm_pagefault01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/flock/flock04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20250530/include/lapi/pidfd.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns07.c /usr/src/debug/ltp/20250530/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/floc
 k/flock02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop03.c /usr/src/debug/ltp/20250530/include/lapi/quotactl.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl
 22.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchownat/fchownat01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/symlink/symlink02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/symlink/symlink03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/symlink/symlink04.c /usr/src/debug/ltp/20250530/include/lapi/fanotify.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify15.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/flock/flock01.c /usr
 /src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/pause/pause02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl09.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns02.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm/ksm_common.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20250530/include/lapi/watch_queue.h /usr/src/debug/ltp/20250530/testcases/kernel/kvm/kvm_svm03.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm/ksm03.c /usr/src/debug/ltp/20250530/include/lapi/init_module.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/move_mount/move_moun
 t03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify13.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify23.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/flock/flock07.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/thp/thp04.c /usr/src/debug/ltp/20250530/include/lapi/epoll.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/move_mount/move_mount01.c /usr/src/debug/ltp/20250530/include/lapi/io_uring.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/thp/thp.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20250530/testcase
 s/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_fiemap01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill11.c /usr/src/debug/ltp/20250530/include/lapi/close_range.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_loop07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap20.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchownat/fchownat02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill03.c /usr/src/debug/ltp/20250530/include/lapi/openat2.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill13.c /usr/src/de
 bug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl40.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20250530/include/lapi/membarrier.h /usr/src/debug/ltp/20250530/testcases/kernel/kvm/kvm_vmx01.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm/ksm01.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/oom/oom01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/unshare01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20250530/testcases/kernel/kvm/kvm_vmx02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/unshare02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/unshare03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/unshare/
 unshare04.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm/ksm07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ns01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/move_mount/move_mount02.c /usr/src/debug/ltp/20250530/include/lapi/sched.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_ficlone01.c /usr/src/debug/ltp/20250530/include/lapi/fs.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm/ksm05.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill07.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/flock/flock06.c /usr/src/debug/ltp/202505
 30/include/lapi/common_timers.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify10.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify20.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify06.c /usr/src/debug/ltp/20250530/include/lapi/ldt.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fanotify/fanotify16.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill06.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20250530/testcases/kernel/include/ksm_helper.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20250530/include/lapi/sem.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill10.c /usr/src/debug/ltp/20250530/include/lapi/kcmp.h /usr/src/debug/ltp/20250530/testcases/ker
 nel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/mmap/mmap21.c /usr/src/debug/ltp/20250530/include/lapi/ustat.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fchownat/fchownat03.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill02.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/kill/kill12.c /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/ioctl/ioctl_sg01.c /usr/src/debug/ltp/20250530/include/lapi/stat.h /usr/src/debug/ltp/20250530/testcases/kernel/mem/thp/thp03.c /usr/src/debug/ltp/20250530/include/lapi/futex.h /usr/src/debug/ltp/20250530/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20250530/testcases/kernel/mem/ksm/ksm_test.h"
packages/core2-64-poky-linux/ltp/ltp-src: PKGSIZE changed from 13525708 to 13459435 (-0%)
packages/core2-64-poky-linux/ltp/ltp-staticdev: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp-staticdev: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp: PV changed from "20250130" to "20250530"
packages/core2-64-poky-linux/ltp/ltp: PKGV changed from 20250130 [default] to 20250530 [default]
packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/kill09 /opt/ltp/testcases/bin/symlink01 /opt/ltp/testcases/bin/modify_ldt03 /opt/ltp/testcases/bin/pause03 /opt/ltp/runtest/ipc /opt/ltp/testcases/bin/mmap001", added "/opt/ltp/testcases/bin/unshare04 /opt/ltp/testcases/bin/flock07 /opt/ltp/testcases/bin/unshare03 /opt/ltp/testcases/bin/kvm_vmx01 /opt/ltp/testcases/bin/kvm_vmx02 /opt/ltp/testcases/bin/cpuset02 /opt/ltp/testcases/data/ima_measurements/tcb.policy /opt/ltp/testcases/bin/fanotify24 /opt/ltp/testcases/bin/move_mount03 /opt/ltp/testcases/bin/fcntl40_64 /opt/ltp/testcases/bin/fchownat03 /opt/ltp/testcases/bin/mmap21 /opt/ltp/testcases/bin/fcntl40 /opt/ltp/testcases/bin/mmap22 /opt/ltp/testcases/bin/ioctl_fiemap01 /opt/ltp/testcases/data/ima_violations/violations.policy"
packages/core2-64-poky-linux/ltp/ltp: PKGSIZE changed from 465322416 to 479825197 (+3%)

--===============1956835339292152764==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20250130-20250530.patch"

RnJvbSBlNjU5NWMxNjIzOGE2Y2UyYWMzYzAxNmRlM2IyNWQ3ZjE4MmJhY2M4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMToxMToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
cDogdXBncmFkZSAyMDI1MDEzMCAtPiAyMDI1MDUzMAoKLS0tCiAuLi4tX19jbGVhcl9jYWNoZS1k
ZWNsYXJhdGlvbi1mb3ItY2xhbmcucGF0Y2ggfCAgNiArLQogLi4uMDAxLVJlbW92ZS1PT00tdGVz
dHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoIHwgIDggKy0tCiAuLi5jdmUtMjAxNS0zMjkwLURpc2Fi
bGUtQVZYLWZvci14ODZfNjQucGF0Y2ggfCA0MiAtLS0tLS0tLS0tLQogLi4uMDEta2VybmVsLWt2
bS1kb24tdC1oYXJkY29kZS1vYmpjb3B5LnBhdGNoIHwgNjkgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL2x0cC97bHRwXzIwMjUwMTMwLmJiID0+IGx0cF8yMDI1MDUzMC5iYn0gIHwgIDQgKy0KIDUg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMjEgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1jdmUtMjAxNS0z
MjkwLURpc2FibGUtQVZYLWZvci14ODZfNjQucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLWtlcm5lbC1rdm0tZG9uLXQtaGFyZGNvZGUt
b2JqY29weS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAve2x0cF8yMDI1
MDEzMC5iYiA9PiBsdHBfMjAyNTA1MzAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1BZGQtX19jbGVhcl9jYWNoZS1kZWNsYXJhdGlvbi1m
b3ItY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLUFkZC1f
X2NsZWFyX2NhY2hlLWRlY2xhcmF0aW9uLWZvci1jbGFuZy5wYXRjaAppbmRleCBhZGU2YTUyYjYz
Li41MDE5NDdmYzM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8w
MDAxLUFkZC1fX2NsZWFyX2NhY2hlLWRlY2xhcmF0aW9uLWZvci1jbGFuZy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLUFkZC1fX2NsZWFyX2NhY2hlLWRlY2xh
cmF0aW9uLWZvci1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmQzODRmMjY4Nzkx
ZWNkNWZmMGYyNmM4MTM3ZGQ0ZGUwYTFjNDU2NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gM2VmZmYyOTQ0M2U2MjU0MTY5Y2FiOTI5MTQ5ZjM3NWJkNGU5NjFmMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBN
b24sIDEwIEp1biAyMDI0IDIyOjUyOjU2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBfX2Ns
ZWFyX2NhY2hlIGRlY2xhcmF0aW9uIGZvciBjbGFuZwpAQCAtMTksMTAgKzE5LDEwIEBAIENjOiBI
dWkgTWluIE1pbmEgQ2hvdSA8bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2h1
Z2V0bGIvaHVnZW1tYXAvaHVnZW1tYXAxNS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vaHVnZXRs
Yi9odWdlbW1hcC9odWdlbW1hcDE1LmMKLWluZGV4IGE4NGJhNjQ3Ni4uODU2ZTIyZmYzIDEwMDY0
NAoraW5kZXggMWRkZTllODdiLi42YTZmNWZlNWUgMTAwNjQ0CiAtLS0gYS90ZXN0Y2FzZXMva2Vy
bmVsL21lbS9odWdldGxiL2h1Z2VtbWFwL2h1Z2VtbWFwMTUuYwogKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9tZW0vaHVnZXRsYi9odWdlbW1hcC9odWdlbW1hcDE1LmMKLUBAIC0yMSw2ICsyMSw3IEBA
CitAQCAtMTksNiArMTksNyBAQAogIAogICNpZiBkZWZpbmVkKF9fY2xhbmdfXykKICAJI3ByYWdt
YSBjbGFuZyBvcHRpbWl6ZSBvZmYKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
dHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50
ZXN0LW1tLnBhdGNoCmluZGV4IDViNmM3ODBiZWMuLjJmNTBiMzE4N2MgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1
bnRlc3QtbW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1S
ZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNzY4MTU5YWE1MzI1N2QyNDc2NDVhMTI1MTg3NzhmNTBiOGZkZjU3OCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYTU1NmJjYTBiMDc5NDhiOWYyZmRkZmMzZjlhNzY4YzM1YTVhYWU3
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ICJNaW5nZGUgKE1hdHRoZXcpIFplbmci
IDxtYXR0aGV3em1kQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjkgSnVsIDIwMjAgMDg6NDc6MDkg
LTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIE9PTSB0ZXN0cyBmcm9tIHJ1bnRlc3QvbW0K
QEAgLTE0LDEyICsxNCwxMiBAQCBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVs
QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL3J1bnRlc3QvbW0gYi9ydW50ZXN0L21tCi1pbmRleCA2YThjZDBiOWQuLjhjZTNmNDQxNiAx
MDA2NDQKK2luZGV4IDU1NjZhNzc0Mi4uODAxNGQ1MDliIDEwMDY0NAogLS0tIGEvcnVudGVzdC9t
bQogKysrIGIvcnVudGVzdC9tbQotQEAgLTc2LDEyICs3Niw2IEBAIGtzbTA3IGtzbTA3Ci0gCitA
QCAtNzAsMTIgKzcwLDYgQEAga3NtMDcga3NtMDcKICBjcHVzZXQwMSBjcHVzZXQwMQorIGNwdXNl
dDAyIGNwdXNldDAyCiAgCiAtb29tMDEgb29tMDEKIC1vb20wMiBvb20wMgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1jdmUtMjAxNS0zMjkwLURpc2FibGUt
QVZYLWZvci14ODZfNjQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAx
LWN2ZS0yMDE1LTMyOTAtRGlzYWJsZS1BVlgtZm9yLXg4Nl82NC5wYXRjaApkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggYzZmYWU4OGViOS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLWN2ZS0yMDE1LTMyOTAtRGlzYWJsZS1BVlgtZm9yLXg4
Nl82NC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gMjhkODIzYTYz
ZWUyOWY1ZDcyYzJhYmE3ODFhMDZhN2UyNjUxY2FkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IFNpZGRoZXNoIFBveWFyZWthciA8c2lkZGhlc2hAZ290cGx0Lm9yZz4KLURhdGU6IE1v
biwgNyBBcHIgMjAyNSAwNjoyNDo0NyAtMDQwMAotU3ViamVjdDogW1BBVENIXSBjdmUtMjAxNS0z
MjkwOiBEaXNhYmxlIEFWWCBmb3IgeDg2XzY0Ci0KLVdoZW4gdGhlIGlucHV0IGNvbXBpbGVyIGVu
YWJsZXMgQVZYLCBzdGFjayByZWFsaWdubWVudCByZXF1aXJlbWVudHMKLWNhdXNlcyBnY2MgdG8g
ZmFpbCB0byBvbWl0ICVyYnAgdXNlLCBkdWUgdG8gd2hpY2ggdGhlIHRlc3QgZmFpbHMgdG8KLWNs
b2JiZXIgJXJicCBpbiBpbmxpbmUgYXNtLiAgRGlzYWJsZSBBVlggdG8gYnVpbGQgdGhlIHRlc3Qg
b24geDg2XzY0IHNvCi10aGF0IHRoZSB0ZXN0IGNvbnRpbnVlcyB3b3JraW5nLgotCi1MaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sdHAvMjAyNTA0MDcxMDI0NDguMjYwNTUwNi0yLXNpZGRo
ZXNoQGdvdHBsdC5vcmcvCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL2NvbW1pdC8yOGQ4MjNhNjNlZTI5ZjVkNzJj
MmFiYTc4MWEwNmE3ZTI2NTFjYWRjXQotCi1SZXZpZXdlZC1ieTogTWFydGluIERvdWNoYSA8bWRv
dWNoYUBzdXNlLmN6PgotUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgot
U2lnbmVkLW9mZi1ieTogU2lkZGhlc2ggUG95YXJla2FyIDxzaWRkaGVzaEBnb3RwbHQub3JnPgot
Ci0tLS0KLSB0ZXN0Y2FzZXMvY3ZlL01ha2VmaWxlIHwgNiArKysrKysKLSAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY3ZlL01ha2VmaWxl
IGIvdGVzdGNhc2VzL2N2ZS9NYWtlZmlsZQotaW5kZXggMDFiOWI5Y2NiLi45OGMzOGU5MDggMTAw
NjQ0Ci0tLS0gYS90ZXN0Y2FzZXMvY3ZlL01ha2VmaWxlCi0rKysgYi90ZXN0Y2FzZXMvY3ZlL01h
a2VmaWxlCi1AQCAtMjIsNiArMjIsMTIgQEAgaWZuZXEgKCwkKGZpbHRlciAkKEhPU1RfQ1BVKSx4
ODYgeDg2XzY0KSkKLSBtZWx0ZG93bjogQ0ZMQUdTICs9IC1tc3NlMgotIGVuZGlmCi0gCi0rIyBU
aGUgdGVzdCBuZWVkcyB0byBjbG9iYmVyICVyYnAsIHdoaWNoIHJlcXVpcmVzIGZyYW1lIHBvaW50
ZXIgb21pc3Npb24uICBBbHNvCi0rIyBmb3IgeDg2XzY0LCBkaXNhYmxlIEFWWCBzaW5jZSB0aGF0
IGNvdWxkIHNvbWV0aW1lcyByZXF1aXJlIGEgc3RhY2sKLSsjIHJlYWxpZ25tZW50LCB3aGljaCBn
ZXRzIGluIHRoZSB3YXkgb2YgZnJhbWUgcG9pbnRlciBvbWlzc2lvbi4KLSBjdmUtMjAxNS0zMjkw
OglDRkxBR1MgKz0gLXB0aHJlYWQgLWZvbWl0LWZyYW1lLXBvaW50ZXIKLStpZmVxICgkKEhPU1Rf
Q1BVKSx4ODZfNjQpCi0rY3ZlLTIwMTUtMzI5MDogQ0ZMQUdTICs9IC1tbm8tYXZ4Ci0rZW5kaWYK
LSAKLSBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0
Lm1rCi0tLSAKLTIuMzcuMwotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRw
L2x0cC8wMDAxLWtlcm5lbC1rdm0tZG9uLXQtaGFyZGNvZGUtb2JqY29weS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEta2VybmVsLWt2bS1kb24tdC1oYXJkY29kZS1v
Ympjb3B5LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyNTZjOGVhYTM0Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEta2VybmVs
LWt2bS1kb24tdC1oYXJkY29kZS1vYmpjb3B5LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNjkg
KzAsMCBAQAotRnJvbSAwYTQyYThlZTBhZThjNmYxZTYwM2MxODM2YjdjOWM3ZmFiMGNhM2E4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+Ci1EYXRlOiBUaHUsIDI3IEZlYiAyMDI1IDEyOjM4OjUwICswMDAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGtlcm5lbC9rdm06IGRvbid0IGhhcmRjb2RlIG9iamNvcHkKLQotdGVzdGNhc2VzL2tl
cm5lbC9rdm0gdXNlcyBvYmpjb3B5IHRvIGNvbnRydWN0IGEgcGF5bG9hZCBiaW5hcnksIGJ1dCBp
bgotY3Jvc3MgYnVpbGRzIHRoZSBob3N0IG9iamNvcHkgbWF5IG5vdCBrbm93IGhvdyB0byBoYW5k
bGUgdGFyZ2V0Ci1iaW5hcmllczoKLQotIENDIHRlc3RjYXNlcy9rZXJuZWwva3ZtL2xpYl9ob3N0
Lm8KLSBvYmpjb3B5OiBVbmFibGUgdG8gcmVjb2duaXNlIHRoZSBmb3JtYXQgb2YgdGhlIGlucHV0
IGZpbGUgYGt2bV9zdm0wMy1wYXlsb2FkLmVsZicKLSBtYWtlWzNdOiAqKiogW2x0cC90ZXN0Y2Fz
ZXMva2VybmVsL2t2bS9NYWtlZmlsZTo2Nzoga3ZtX3N2bTAzLXBheWxvYWQub10gRXJyb3IgMQot
Ci1UaGlzIGlzIHRyaXZpYWxseSBmaXhlZCBieSBzZWFyY2hpbmcgZm9yIGFuIG9iamNvcHkgdG9v
bCAoc28KLWhvc3QtcHJlZml4ZWQgaW4gY3Jvc3MgYnVpbGRzKSBhbmQgdXNpbmcgdGhhdCBpbnN0
ZWFkLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFthMzk0MmMwYTVmOWI0NDYzZTgzMjBl
ODBjZDg1MjJhMmUwMDhiZmQyXQotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGFybS5jb20+Ci0tLS0KLSBjb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICB8IDEgKwot
IGluY2x1ZGUvbWsvY29uZmlnLm1rLmluICAgICAgIHwgMSArCi0gdGVzdGNhc2VzL2tlcm5lbC9r
dm0vTWFrZWZpbGUgfCA0ICsrLS0KLSAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5h
YwotaW5kZXggMzQ0YjJhZTJjLi4wZjJiNmYzMzIgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMK
LSsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTMwLDYgKzMwLDcgQEAgQUNfUFJPR19SQU5MSUIKLSBB
Q19ERUZVTihbQUNfUFJPR19TVFJJUF0sIFtBQ19DSEVDS19UT09MKFNUUklQLCBzdHJpcCwgOild
KQotIEFDX1BST0dfU1RSSVAKLSBBQ19QUk9HX1lBQ0MKLStBQ19DSEVDS19UT09MKFtPQkpDT1BZ
XSwgW29iamNvcHldLCBbOl0pCi0gCi0gbTRfaWZuZGVmKFtQS0dfQ0hFQ0tfRVhJU1RTXSwKLSAJ
W200X2ZhdGFsKFttdXN0IGluc3RhbGwgcGtnLWNvbmZpZyBvciBwa2djb25maWcgYW5kIHBrZy5t
NCBtYWNybyAodXN1YWwgZGVwZW5kZW5jeSksIHNlZSBJTlNUQUxMXSldKQotZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbWsvY29uZmlnLm1rLmluIGIvaW5jbHVkZS9tay9jb25maWcubWsuaW4KLWluZGV4
IDJiN2M4YTA3MS4uNGMzZGEzMDRmIDEwMDY0NAotLS0tIGEvaW5jbHVkZS9tay9jb25maWcubWsu
aW4KLSsrKyBiL2luY2x1ZGUvbWsvY29uZmlnLm1rLmluCi1AQCAtMTEsNiArMTEsNyBAQCBBUgkJ
CTo9IEBBUkAKLSBDQwkJCTo9IEBDQ0AKLSBMRVgJCQk6PSBATEVYQAotIFJBTkxJQgkJCTo9IEBS
QU5MSUJACi0rT0JKQ09QWQkJCTo9IEBPQkpDT1BZQAotIFNUUklQCQkJOj0gQFNUUklQQAotIFlB
Q0MJCQk6PSBAWUFDQ0AKLSAKLWRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2t2bS9NYWtl
ZmlsZSBiL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL01ha2VmaWxlCi1pbmRleCAwN2JkZDk3MDUuLmU5
MzUyOGEzMyAxMDA2NDQKLS0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL01ha2VmaWxlCi0rKysg
Yi90ZXN0Y2FzZXMva2VybmVsL2t2bS9NYWtlZmlsZQotQEAgLTYwLDExICs2MCwxMSBAQCBpbmNs
dWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1rCi0gJS1w
YXlsb2FkLm86ICUuYyBsaWJfZ3Vlc3QubyAkKEFSQ0hfT0JKKQotIGlmZGVmIFZFUkJPU0UKLSAJ
JChDQykgJChHVUVTVF9DUFBGTEFHUykgJChHVUVTVF9DRkxBR1MpICQoR1VFU1RfTERGTEFHUykg
LW8gJCotcGF5bG9hZC5lbGYgJF4gJChHVUVTVF9MRExJQlMpCi0tCW9iamNvcHkgLU8gYmluYXJ5
IC1qIC5pbml0LmJvb3QgLWogLnRleHQgLWogLmRhdGEgLWogLmluaXQgLWogLnByZWluaXRfYXJy
YXkgLWogLmluaXRfYXJyYXkgLS1nYXAtZmlsbD0wICQqLXBheWxvYWQuZWxmICQqLXBheWxvYWQu
YmluCi0rCSQoT0JKQ09QWSkgLU8gYmluYXJ5IC1qIC5pbml0LmJvb3QgLWogLnRleHQgLWogLmRh
dGEgLWogLmluaXQgLWogLnByZWluaXRfYXJyYXkgLWogLmluaXRfYXJyYXkgLS1nYXAtZmlsbD0w
ICQqLXBheWxvYWQuZWxmICQqLXBheWxvYWQuYmluCi0gCSQoS1ZNX0xEKSAteiBub2V4ZWNzdGFj
ayAtciAtVCAkKGFic19zcmNkaXIpL2xpbmtlci9wYXlsb2FkLmxkcyAtLW9mb3JtYXQ9JChCSU5f
Rk9STUFUKSAtbyAkQCAkKi1wYXlsb2FkLmJpbgotIGVsc2UKLSAJQCQoQ0MpICQoR1VFU1RfQ1BQ
RkxBR1MpICQoR1VFU1RfQ0ZMQUdTKSAkKEdVRVNUX0xERkxBR1MpIC1vICQqLXBheWxvYWQuZWxm
ICReICQoR1VFU1RfTERMSUJTKQotLQlAb2JqY29weSAtTyBiaW5hcnkgLWogLmluaXQuYm9vdCAt
aiAudGV4dCAtaiAuZGF0YSAtaiAuaW5pdCAtaiAucHJlaW5pdF9hcnJheSAtaiAuaW5pdF9hcnJh
eSAtLWdhcC1maWxsPTAgJCotcGF5bG9hZC5lbGYgJCotcGF5bG9hZC5iaW4KLSsJQCQoT0JKQ09Q
WSkgLU8gYmluYXJ5IC1qIC5pbml0LmJvb3QgLWogLnRleHQgLWogLmRhdGEgLWogLmluaXQgLWog
LnByZWluaXRfYXJyYXkgLWogLmluaXRfYXJyYXkgLS1nYXAtZmlsbD0wICQqLXBheWxvYWQuZWxm
ICQqLXBheWxvYWQuYmluCi0gCUAkKEtWTV9MRCkgLXogbm9leGVjc3RhY2sgLXIgLVQgJChhYnNf
c3JjZGlyKS9saW5rZXIvcGF5bG9hZC5sZHMgLS1vZm9ybWF0PSQoQklOX0ZPUk1BVCkgLW8gJEAg
JCotcGF5bG9hZC5iaW4KLSAJQGVjaG8gS1ZNX0NDICQodGFyZ2V0X3JlbF9kaXIpJEAKLSBlbmRp
ZgotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9s
dHBfMjAyNTAxMzAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI1MDUzMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHRwL2x0cF8yMDI1MDEzMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9s
dHBfMjAyNTA1MzAuYmIKaW5kZXggZmM2NDNjMmFiOS4uNWIzYzQ4MTg1OSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNTAxMzAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNTA1MzAuYmIKQEAgLTI0LDEzICsyNCwxMSBAQCBUVU5F
X0NDQVJHUzpyZW1vdmU6eDg2LTY0ID0gIi1tZnBtYXRoPXNzZSIKIAogQ0ZMQUdTOmFwcGVuZDpw
b3dlcnBjNjQgPSAiIC1EX19TQU5FX1VTRVJTUEFDRV9UWVBFU19fIgogQ0ZMQUdTOmFwcGVuZDpt
aXBzYXJjaG42NCA9ICIgLURfX1NBTkVfVVNFUlNQQUNFX1RZUEVTX18iCi1TUkNSRVYgPSAiYTdj
MzFkZmY3ZWRjMDg5YTMyZTk5MDc2NWUxMjk1MmNjNGQ3NjY2YSIKK1NSQ1JFViA9ICIxNDMzMWUx
ZWNmY2Q2MzQyNmM5ZDI3MGQ4OGI3YmFkOWY2MGM2ZDY0IgogCiBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1y
dW50ZXN0LW1tLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLV9fY2xlYXJfY2Fj
aGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEt
a2VybmVsLWt2bS1kb24tdC1oYXJkY29kZS1vYmpjb3B5LnBhdGNoIFwKLSAgICAgICAgICAgZmls
ZTovLzAwMDEtY3ZlLTIwMTUtMzI5MC1EaXNhYmxlLUFWWC1mb3IteDg2XzY0LnBhdGNoIFwKICAg
ICAgICAgICAgIgogCiBpbmhlcml0IGF1dG90b29scy1icm9rZW5zZXAgcGtnY29uZmlnCi0tIAoy
LjQ3LjEKCg==

--===============1956835339292152764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1918 targets, 50 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-64 sysroot...done.
Removing 117 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7128c03ccef1d689fa9814b01819dc0f2710db6a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7128c03ccef1d689fa9814b01819dc0f2710db6a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 927 Local 848 Mirrors 0 Missed 79 Current 281 (91% match, 93% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 282 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 289 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 292 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_setscene)
NOTE: Running setscene task 296 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 297 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 298 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 300 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 301 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_qa_setscene)
NOTE: Running setscene task 303 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 305 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 308 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 311 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 314 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 315 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_ipk_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 321 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 324 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 325 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 326 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 327 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_qa_setscene)
NOTE: Running setscene task 328 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 334 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 335 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_deb_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 338 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_deb_setscene)
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_deploy_setscene: Started
NOTE: Running setscene task 339 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_qa_setscene)
NOTE: Running setscene task 340 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_qa_setscene)
NOTE: Running setscene task 343 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 351 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 352 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 355 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 356 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 357 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 358 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 360 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 362 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 363 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 364 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 367 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_deb_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 369 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 372 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 375 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_qa_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_write_deb_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 379 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 381 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 382 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 385 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 386 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 389 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_ipk_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 391 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 397 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 402 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_deb_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 407 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa_setscene)
NOTE: Running setscene task 410 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 412 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_package_qa_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 413 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_ipk_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 414 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package_write_ipk_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 424 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 425 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 427 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 428 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 430 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_deb_setscene)
NOTE: recipe file-5.46-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-8.14.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 433 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 435 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_rpm_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.46-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 436 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 441 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_write_deb_setscene)
NOTE: recipe gzip-1.14-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 443 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 447 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 449 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 451 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 457 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 460 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 465 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_deb_setscene)
NOTE: recipe curl-8.14.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 466 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.08.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 470 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 471 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_ipk_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 472 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_package_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 475 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 476 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_create_spdx_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 484 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 485 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_package_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 489 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 505 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 506 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe bc-1.08.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.3.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gzip-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx_setscene)
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_create_spdx_setscene)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 525 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_packagedata_setscene)
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: Running setscene task 539 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata_setscene)
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 541 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 549 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 554 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 557 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_packagedata_setscene)
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 561 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 564 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 571 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 581 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe iputils-20250605-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iputils-20250605-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 586 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 587 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 590 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 602 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.08.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 604 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe liburcu-0.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 618 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.08.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 622 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liburcu-0.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 639 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe btrfs-tools-6.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iputils-20250605-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 652 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iputils-20250605-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcl8-8.6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_setscene)
NOTE: Running setscene task 695 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ltp-20250530-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ltp-20250530-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 701 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 702 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 704 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 708 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_recipe_qa_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 727 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.35-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 730 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 749 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_setscene: Started
NOTE: Running setscene task 753 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 765 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 768 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_packagedata_setscene)
NOTE: recipe gdb-16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 772 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdb-16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 784 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 795 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 796 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 798 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 799 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 808 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 809 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdb-16.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 815 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdb-16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 828 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 837 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 841 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 855 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 871 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 882 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 884 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 890 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 893 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 894 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 903 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 908 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liburcu-0.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 911 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 913 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 923 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 926 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 929 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 930 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 945 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 948 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 950 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 952 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 957 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 962 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 963 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 966 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 969 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 972 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 974 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 975 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 978 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 979 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 983 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 986 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 990 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 993 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 997 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 998 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1001 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1008 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1017 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1023 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1027 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1028 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1029 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1036 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1037 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1039 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 1040 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1041 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1044 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1047 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1048 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1051 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1054 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1058 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1059 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1060 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1062 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1064 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1066 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1069 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1071 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1077 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1082 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1084 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1089 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1092 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1098 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1100 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1102 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1107 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1115 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1117 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1121 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1124 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.31+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1040 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Running task 1112 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: Running task 1180 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1253 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1327 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Started
NOTE: Running task 1412 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1428 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_fetch)
NOTE: Running task 1433 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_unpack)
NOTE: Running task 1459 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_fetch)
NOTE: Running task 1471 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1481 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_fetch)
NOTE: Running task 1482 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1483 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_fetch)
NOTE: Running task 1484 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_fetch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_unpack)
NOTE: Running task 1501 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe iproute2-6.15.0-r0: task do_fetch: Started
NOTE: recipe ltp-20250530-r0: task do_fetch: Started
NOTE: recipe iproute2-6.15.0-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Started
NOTE: recipe gdb-16.3-r0: task do_fetch: Started
NOTE: Running task 1513 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_unpack)
NOTE: recipe iputils-20250605-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe gdb-16.3-r0: task do_fetch: Succeeded
NOTE: Running task 1521 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_unpack)
NOTE: Running task 1522 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 1523 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_unpack: Started
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: Running task 1536 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_patch)
NOTE: recipe iproute2-6.15.0-r0: task do_unpack: Started
NOTE: Running task 1565 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_fetch)
NOTE: Running task 1579 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe ltp-20250530-r0: task do_fetch: Succeeded
NOTE: recipe gdb-16.3-r0: task do_unpack: Started
NOTE: Running task 1584 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_unpack)
NOTE: recipe iputils-20250605-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Started
NOTE: Running task 1594 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe iputils-20250605-r0: task do_write_config: Started
NOTE: Running task 1612 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_patch)
NOTE: recipe btrfs-tools-6.14-r0: task do_fetch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20250530-r0: task do_unpack: Started
NOTE: Running task 1629 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1639 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iputils-20250605-r0: task do_write_config: Succeeded
NOTE: recipe iputils-20250605-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 1649 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.7.2-r0: task do_patch: Started
NOTE: recipe iproute2-6.15.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1711 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.14-r0: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_patch: Started
NOTE: recipe cronie-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1715 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iputils-20250605-r0: task do_unpack: Succeeded
NOTE: Running task 1716 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_patch: Succeeded
NOTE: Running task 1717 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe iputils-20250605-r0: task do_patch: Started
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch unihash changed to f4c6d348c62852ecf7cfaa24335b91020fc3fe0e90fb38084ced46ef9406392a
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe iputils-20250605-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.14-r0: task do_unpack: Succeeded
NOTE: Running task 1720 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_patch)
NOTE: recipe ltp-20250530-r0: task do_unpack: Succeeded
NOTE: Running task 1721 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_patch)
NOTE: recipe btrfs-tools-6.14-r0: task do_patch: Started
NOTE: recipe ltp-20250530-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.14-r0: task do_patch: Succeeded
NOTE: recipe ltp-20250530-r0: task do_patch: Succeeded
NOTE: Running task 1723 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_deploy_source_date_epoch)
NOTE: Running task 1724 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_populate_lic)
NOTE: recipe ltp-20250530-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20250530-r0: task do_populate_lic: Started
NOTE: recipe gdb-16.3-r0: task do_unpack: Succeeded
NOTE: Running task 1725 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_patch)
NOTE: recipe gdb-16.3-r0: task do_patch: Started
NOTE: recipe ltp-20250530-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_populate_lic unihash changed to 98fe1ef1262d1bc390bae21bdc80b15bff0a86029548642e1d6219e7dade7c2a
NOTE: recipe ltp-20250530-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_deploy_source_date_epoch unihash changed to 4e088bef1c3f8146c3f6aad3409bdef174144d93e02882c56a47d26bf5a9de56
NOTE: recipe gdb-16.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1727 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1125 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1126 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1128 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1130 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1131 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1135 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1136 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1137 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1138 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1140 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1154 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1159 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1184 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1196 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1198 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1200 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2234 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2389 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2505 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2597 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2621 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2623 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20250530-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2715 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe iputils-20250605-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: recipe logrotate-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2792 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2793 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_configure)
NOTE: Running task 2794 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2798 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2812 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_collect_spdx_deps)
NOTE: Running task 2816 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.22.0-r0: task do_configure: Started
NOTE: Running task 2820 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe ltp-20250530-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2850 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2860 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_configure)
NOTE: recipe ltp-20250530-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.15.0-r0: task do_configure: Started
NOTE: Running task 2876 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2893 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_configure)
NOTE: recipe ltp-20250530-r0: task do_configure: Started
NOTE: Running task 2894 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx)
NOTE: recipe ltp-20250530-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iputils-20250605-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2919 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_collect_spdx_deps)
NOTE: Running task 2921 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iputils-20250605-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_configure: Started
NOTE: Running task 2922 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_configure)
NOTE: recipe coreutils-9.7-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe iputils-20250605-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2986 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_ipk)
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2987 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_deb)
NOTE: recipe iputils-20250605-r0: task do_configure: Started
NOTE: Running task 2988 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_rpm)
NOTE: Running task 2989 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2991 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_configure)
NOTE: Running task 2992 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_configure)
NOTE: recipe iproute2-6.15.0-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_ipk: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_deb: Started
NOTE: Running task 3003 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_qa: Started
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.14-r0: task do_configure: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe cronie-1.7.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.15.0-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3006 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iputils-20250605-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 3007 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_ipk unihash changed to 9a4e437fd236dfcb58cf457dc35a6c86ab1afa623f2bc2465ee94afc5fa82492
NOTE: recipe iputils-20250605-r0: task do_compile: Started
NOTE: recipe iputils-20250605-r0: task do_compile: Succeeded
NOTE: Running task 3008 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_install)
NOTE: recipe iputils-20250605-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_qa unihash changed to df02baf33b44667a25697e534cc860c3a33ecd9e97f497dd1f12a5f77015edf8
NOTE: recipe iputils-20250605-r0: task do_install: Succeeded
NOTE: Running task 3009 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package)
NOTE: Running task 3010 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_populate_sysroot)
NOTE: recipe iputils-20250605-r0: task do_package: Started
NOTE: recipe iputils-20250605-r0: task do_populate_sysroot: Started
NOTE: recipe iputils-20250605-r0: task do_populate_sysroot: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_configure: Succeeded
NOTE: Running task 3011 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_deb unihash changed to a737d1926f8687ccfee54395c0b1e4cce34e861824b11b2d8912e612f3cfcbbd
NOTE: recipe logrotate-3.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3012 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_compile)
NOTE: recipe logrotate-3.22.0-r0: task do_compile: Started
NOTE: recipe iputils-20250605-r0: task do_package: Succeeded
NOTE: Running task 3013 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_packagedata)
NOTE: recipe logrotate-3.22.0-r0: task do_compile: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_compile_ptest_base)
NOTE: Running task 3015 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_compile)
NOTE: recipe iputils-20250605-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.7.2-r0: task do_compile: Started
NOTE: recipe logrotate-3.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 3016 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_install)
NOTE: Running task 3017 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_rpm unihash changed to f58fb086df967499f9dd623b280ef2d891a7ec40db3c84d19b0e470f20f17d4c
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe logrotate-3.22.0-r0: task do_install: Started
NOTE: recipe iputils-20250605-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_packagedata unihash changed to 968be835f348eb0fe55b7e66c1970a0821b78cd3d8a9efeab060e72167162228
NOTE: Setscene tasks completed
NOTE: Running task 3018 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_create_spdx)
NOTE: Running task 3019 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_ipk)
NOTE: Running task 3020 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_deb)
NOTE: Running task 3021 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_rpm)
NOTE: Running task 3022 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_qa)
NOTE: recipe iputils-20250605-r0: task do_create_spdx: Started
NOTE: recipe iputils-20250605-r0: task do_package_write_ipk: Started
NOTE: recipe iputils-20250605-r0: task do_package_write_deb: Started
NOTE: recipe cronie-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe iputils-20250605-r0: task do_package_write_rpm: Started
NOTE: recipe iputils-20250605-r0: task do_package_qa: Started
NOTE: Running task 3023 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_install)
NOTE: recipe logrotate-3.22.0-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_install_ptest_base)
NOTE: recipe cronie-1.7.2-r0: task do_install: Started
NOTE: recipe logrotate-3.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe iputils-20250605-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe logrotate-3.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3026 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package)
NOTE: Running task 3027 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_populate_sysroot)
NOTE: recipe iputils-20250605-r0: task do_package_write_ipk: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_ipk unihash changed to d90617303d57c36472daeaa9abb96a9e53781387922d0207d7b9c8fc2a3a8acc
NOTE: recipe iputils-20250605-r0: task do_package_write_deb: Succeeded
NOTE: Running task 3028 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package)
NOTE: Running task 3029 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_populate_sysroot)
NOTE: recipe iputils-20250605-r0: task do_package_qa: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_deb unihash changed to ad83117786d5fdfaff55664df45c469f0a6083f8ce577655818ce9a41b7f07f7
NOTE: recipe logrotate-3.22.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_qa unihash changed to c21585aab6ee3372b13673f56d217bf2f56157afe6d8e729028ccb57e3dbbc47
NOTE: recipe iputils-20250605-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20250605.bb:do_package_write_rpm unihash changed to 1daf123d6a0a77a7f92f695049449871bad3e3bbe839bced5b0f62ce49e8d698
NOTE: recipe cronie-1.7.2-r0: task do_package: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 3030 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: Running task 3031 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_populate_sysroot)
NOTE: recipe logrotate-3.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_populate_sysroot: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.14-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_compile)
NOTE: recipe btrfs-tools-6.14-r0: task do_compile: Started
NOTE: recipe iproute2-6.15.0-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_install)
NOTE: recipe iproute2-6.15.0-r0: task do_install: Started
NOTE: recipe iproute2-6.15.0-r0: task do_install: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package)
NOTE: Running task 3036 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_packagedata)
NOTE: recipe iproute2-6.15.0-r0: task do_package: Started
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Started
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Succeeded
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
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_qa unihash changed to 5c00e87eb5453a0a126900d73ca3eeb4235863aac9b2750db237af8c089289af
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_packagedata)
NOTE: recipe logrotate-3.22.0-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata unihash changed to 5141a33c6d5c6cad15172a5cfaa8f97e885a8e57f4dbfd0c2d0a476519331c32
NOTE: Setscene tasks completed
NOTE: Running task 3044 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_create_spdx)
NOTE: Running task 3045 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_ipk)
NOTE: Running task 3046 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_deb)
NOTE: Running task 3047 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: Running task 3048 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_qa)
NOTE: recipe quota-4.09-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_ipk: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_packagedata unihash changed to 8bc4984eaff8a490214847d3cd0941976270b99297c3f95ab1c692bdea512101
NOTE: recipe quota-4.09-r0: task do_package_write_deb: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 3049 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_create_spdx)
NOTE: recipe quota-4.09-r0: task do_package_qa: Started
NOTE: Running task 3050 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_ipk)
NOTE: Running task 3051 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_deb)
NOTE: Running task 3052 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_rpm)
NOTE: Running task 3053 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_qa)
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_deb: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_qa: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_ipk: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_ipk unihash changed to 27c716d845f20a0b6da1973ab8c998f2c1d8f6ca0439fcd10e5b9ff54a8c8f05
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_ipk unihash changed to d4b37e8fcfd7f6864415309a84f38f5938463d8d9b38c3191dd35117d89dffa7
NOTE: recipe quota-4.09-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_qa unihash changed to 87559c735f9bde0ae4ce24e7db1475835a4b5469a40a2337fc9be6bca17f6adb
NOTE: recipe logrotate-3.22.0-r0: task do_package_qa: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm unihash changed to 460057184177864b05240c8cb4fe797aae8db4966bdc0cfddde03812bbf49004
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_deb unihash changed to a1d7df6eeb1f4141e9c681da0fe395c28eed3a7c3487356a4049b797f47b4c7f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_qa unihash changed to 422b9d3895f5929fac8453debf2a1a5346fc4854986e8bcff4a7c3646b206388
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_rpm unihash changed to 64501e322b842646cba3eb046d21845821875f8e68e99c66c0f712a8abf137ab
NOTE: recipe quota-4.09-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_deb unihash changed to 889d870621f204a528e63b658ef052e125ad3fdc6d98778cbe7443bc6273f3fd
NOTE: recipe btrfs-tools-6.14-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_install)
NOTE: recipe btrfs-tools-6.14-r0: task do_install: Started
NOTE: recipe iproute2-6.15.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package unihash changed to a86a0607daa2634be1d3096d48663814f5e61a14ca5cf96c3642617ff3910af7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_packagedata became valid
NOTE: Running setscene task 1208 of 1208 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3056 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_create_spdx)
NOTE: Running task 3057 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_write_ipk)
NOTE: Running task 3058 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_write_deb)
NOTE: Running task 3059 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_write_rpm)
NOTE: recipe ltp-20250530-r0: task do_configure: Succeeded
NOTE: Running task 3060 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_qa)
NOTE: Running task 3061 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20250530.bb:do_compile)
NOTE: recipe iproute2-6.15.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.15.0-r0: task do_package_write_ipk: Started
NOTE: recipe iproute2-6.15.0-r0: task do_package_write_deb: Started
NOTE: recipe btrfs-tools-6.14-r0: task do_install: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.15.0-r0: task do_package_qa: Started
NOTE: Running task 3062 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_package)
NOTE: recipe ltp-20250530-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.14-r0: task do_package: Started
NOTE: recipe iproute2-6.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.15.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_write_ipk unihash changed to 3a493489682dfab1a2509f6e94fabad68976b1bafcf9089fc4419271d39558ad
NOTE: recipe iproute2-6.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_write_rpm unihash changed to 69be4ce292a3a1408978a69ee600bc55da279f06d01f0e0405e34b7a1e17ee8c
NOTE: recipe iproute2-6.15.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_qa unihash changed to bb14cb61be8aa140a5b24380cd2e34480393a538aac58e675c18614c5761ab93
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_compile: Started
NOTE: recipe iproute2-6.15.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb:do_package_write_deb unihash changed to 987eb15dd4c0f0da7ba2429a6293906fbf6426b09bd3e5eb521f395d09b5bcf9
NOTE: recipe btrfs-tools-6.14-r0: task do_package: Succeeded
NOTE: Running task 3064 of 3097 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.14-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.14-r0: task do_packagedata: Failed
NOTE: recipe lttng-ust-2_2.13.9-r0: task do_compile: Succeeded
NOTE: recipe ltp-20250530-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3064 tasks of which 2933 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701110807.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701110807.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/btrfs-tools/6.14/temp/log.do_packagedata.1048145
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.15-r0 to 0:6.14-r0) [version-going-backwards]
ERROR: btrfs-tools-6.14-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/btrfs-tools/6.14/temp/log.do_packagedata.1048145
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_packagedata) failed with exit code '1'

--===============1956835339292152764==--

