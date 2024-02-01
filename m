Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B45C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:37:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.9233.1706765839874113729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YYcuhU5l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706765840; x=1738301840;
  h=from:to:cc:subject:date:message-id;
  bh=YjmUedAFkCWKwxMFnlU1SaSDlAzc2hij2pUqjyX5cx8=;
  b=YYcuhU5lwK+IBA5yZSpk2VprEcuX108TO92AkL84P4phPGquEQ5wMpFX
   xdqlx8BlqRH0/ZOxX42WY0fjPLOYp1qyNhPPihOTIsi2BEii1LJ706Vyy
   LbUbDo+ZmPfw+GakfYOx8DeOlfPSVdrT83dUuM0AvUwyqSz3a66n0Z/HP
   VxvnrtpQi+EdRM8mS/JccsRFgvpuxXyM3oLjRmbarFajRUEs0TidO60L4
   Le/Xmfcz1AyJrhA4c1Vpm8f4rCfisPYAATe1XI01r6xvVh0scf2ftLEgR
   jnYfnmhlzweIkBSOzIatFyPI2HPHD3Rola7n47fq8DeyfpEOhPwKe8vwC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147480078"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147480078"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:37:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E151178342
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:37:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FD84D5628
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:37:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C19BE20097F23
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:37:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3DC911A006A;
	Thu,  1 Feb 2024 13:37:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ltp: upgrade 20230929 -> 20240129
Date: Thu,  1 Feb 2024 13:26:24 +0800
Message-Id: <1706765184-12808-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--9.303300-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yazGfgakLdjakdS3kPlaZyVUjspoiX02F+ik
	wR/RlN8aKqrQ7lLcMnwt/DPtuO0OwdzZGrP764sO/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW7rCDPw9MoAWPSukMc7yu8PzYigC8AbwLJKzjuZtPtIBEi8rgutezVp/IJW6NffSU0PZU
	wDeFsZ8QZq27D6ySm7fJL38u1VtO6HYSb76u64f9N9TX8X49sz8SkdpG2/n9cW257yDx+xvg5Tw
	1h6c3V7wBHMV/o12gkYx0Kf86aACa1i/8UCZ5uOngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiTtcUcO57Fctxsy5tF9NINLF84+IeQszBj4vbylRU8SOH7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194570

From: Wang Mingyu <wangmy@fujitsu.com>

0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
revmoed since it's included in 20240129

0001-Remove-OOM-tests-from-runtest-mm.patch
refreshed for 20240129

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 10 +++----
 ...-syscalls-fcntl-define-_LARGEFILE64_.patch | 28 -------------------
 .../ltp/{ltp_20230929.bb => ltp_20240129.bb}  |  3 +-
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
 rename meta/recipes-extended/ltp/{ltp_20230929.bb => ltp_20240129.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 6d945700be..a5e7b37976 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
+From 02136a4490b7d9b31e691cdd50adef95378c781b Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -9,15 +9,16 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
 [ pvorel: rebased for 20210927 ]
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
 ---
  runtest/mm | 6 ------
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 6537666a9..e5a091a5a 100644
+index d859b331c..3c2962f44 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
+@@ -74,12 +74,6 @@ ksm07 ksm07
  
  cpuset01 cpuset01
  
@@ -30,6 +31,3 @@ index 6537666a9..e5a091a5a 100644
  swapping01 swapping01 -i 5
  
  thp01 thp01 -I 120
--- 
-2.33.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
deleted file mode 100644
index dbe63f2170..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f4f75ce9218b469d91b536218de3323977edc529 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 13 Jun 2023 15:10:33 +0200
-Subject: [PATCH] testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE
-
-This is required for off64_t to be available on musl systems.
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/1047]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- testcases/kernel/syscalls/fcntl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/fcntl/Makefile b/testcases/kernel/syscalls/fcntl/Makefile
-index df663a50a..aac774111 100644
---- a/testcases/kernel/syscalls/fcntl/Makefile
-+++ b/testcases/kernel/syscalls/fcntl/Makefile
-@@ -17,6 +17,6 @@ include $(abs_srcdir)/../utils/newer_64.mk
- 
- %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
- 
--CPPFLAGS		+= -D_GNU_SOURCE
-+CPPFLAGS		+= -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/ltp/ltp_20230929.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20230929.bb
rename to meta/recipes-extended/ltp/ltp_20240129.bb
index 5c43346883..5cd33bb6a3 100644
--- a/meta/recipes-extended/ltp/ltp_20230929.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
+SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://disable_hanging_tests.patch \
-           file://0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


