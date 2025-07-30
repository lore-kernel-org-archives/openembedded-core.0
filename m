Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A976BC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 03:11:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.26594.1753845107206632441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 20:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NZKEcui0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753845107; x=1785381107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AYB/ddP4MjlSLIqCUV51H9PFEkt+9pW2/c3LbNBqLpU=;
  b=NZKEcui0pn+xjuQ/8uSdbSRMtF/+G31mFQg8IuLoDhi0Qm5H3fM/Jpjg
   Edw78r/cNpiAcdhkkQnYYDDOR74lDyauY/zVVeeALLOFDkuT6Ooy+8Mna
   enT2gL8Ox+uwY+Pecm4mHoexQNJgM91aABhg89b7z1ruPXxJFcMwnGOGD
   X3l1QPdihzOA9nYZXmAjYwi35OJM34X0ZfeeK+P4QK1MA3whgrpl293XD
   WNIK9G4OuR+wIS9WAgbQnYMiH2A0l1QX1qm7sLJpNXPDjqtP0jajf6lLE
   uNR4Z6/cb+JAFjMlIAIBzCF5IKaZuXMTjuic3m1vWnUshoylxI7E6a0Bc
   w==;
X-CSE-ConnectionGUID: Qghyk6OdR+ybKHaTXDpzPQ==
X-CSE-MsgGUID: VjIpaRLCQKqSRckR2PGViw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="195262906"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="195262906"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 12:11:45 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5B76E1002B87
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 03:11:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C989718002C1
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 03:11:44 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7DCB91A0071;
	Wed, 30 Jul 2025 11:11:41 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Ross Burton <ross.burton@arm.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH v2 1/2] ltp: upgrade 20250130 -> 20250530
Date: Wed, 30 Jul 2025 11:11:19 +0800
Message-ID: <20250730031121.382-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 03:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221094

Changelog: https://github.com/linux-test-project/ltp/releases/tag/20250530

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-__clear_cache-declaration-for-clang.patch |  6 +-
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  8 +--
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 -----------
 ...01-kernel-kvm-don-t-hardcode-objcopy.patch | 69 -------------------
 .../ltp/{ltp_20250130.bb => ltp_20250530.bb}  |  2 +-
 5 files changed, 8 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode-objcopy.patch
 rename meta/recipes-extended/ltp/{ltp_20250130.bb => ltp_20250530.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index ade6a52b63..c95d7220cd 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From 2d384f268791ecd5ff0f26c8137dd4de0a1c4566 Mon Sep 17 00:00:00 2001
+From 859d27dd6dfc6e9d26ae9a05f4b32ac45b911887 Mon Sep 17 00:00:00 2001
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
index 5b6c780bec..936e23ebda 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
+From 7096737fbbe19d0765f0a8c62ef7667bf4875780 Mon Sep 17 00:00:00 2001
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
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20250130.bb
rename to meta/recipes-extended/ltp/ltp_20250530.bb
index 8de13c6000..192c93b727 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250530.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
+SRCREV = "14331e1ecfcd63426c9d270d88b7bad9f60c6d64"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.43.0


