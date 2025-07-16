Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC7EC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:43:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15696.1752648184562221963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g9M/0qUM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648184; x=1784184184;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ts+tq8Q/ZrFVFT1NUUIbyF8pyHTSvsJwMV0zYp6Jo/g=;
  b=g9M/0qUMMYGwqGaZo113onoIY/fl6L2wEBnfuMhKEUkuKDkSYFGyjZCG
   pdeGx8c3P63VwMUlgtBzXAK83ChHjKYRrP22lUDrCFGZYnXG2xJjJ8Ulz
   6KfxboG6bai65Ov6N0KW1vXQSYXhnnhXx3NyY0ZkRPnbsFXnBc6bhMjjE
   pRZi6WI37JDBlXoMmUaDGoCOCMbzYLQbMh1fzCeIDvD5P7DPsA2EmXdZ/
   glwleVusQPx14g5k6szkQ5A+FUySB2KV6U/kWjUo4jU1ItsX12/oQOokG
   XOF+82nJv64/nrZuoZwh7KSLm1CKoMjM7cEZtrWFTbTX+ZxJXqS0nxd7Y
   A==;
X-CSE-ConnectionGUID: GoimLsNlQNemu42//ti2kQ==
X-CSE-MsgGUID: uL0guMUASU+3xwxdhxCgIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="206473965"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="206473965"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:43:03 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0843F1002B9D
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:43:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 635E214003B4
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:43:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 116FE1A0071;
	Wed, 16 Jul 2025 14:42:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] rt-tests: upgrade 2.8 -> 2.9
Date: Wed, 16 Jul 2025 14:42:57 +0800
Message-ID: <20250716064257.1831-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220433

From: Wang Mingyu <wangmy@fujitsu.com>

0001-sched_attr-Do-not-define-for-glibc-2.41.patch
removed since it's included in 2.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 44 -------------------
 meta/recipes-rt/rt-tests/rt-tests.inc         |  6 +--
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  1 -
 3 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 915f8baa61..0000000000
--- a/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e1f5f9379a68471c9f5fb0859e87dd84001b0b6f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Jan 2025 15:03:59 -0800
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
-Upstream-Status: Submitted [https://lore.kernel.org/linux-rt-users/20250128230838.2311298-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Clark Williams <williams@redhat.com>
-Cc: John Kacur <jkacur@redhat.com>
-Cc: rt-users <linux-rt-users@vger.kernel.org>
----
- src/include/rt-sched.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
-index 80171c7..9cf0e3a 100644
---- a/src/include/rt-sched.h
-+++ b/src/include/rt-sched.h
-@@ -42,6 +42,8 @@
- #define __NR_sched_getattr		275
- #endif
- 
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
- 	uint32_t size;
- 	uint32_t sched_policy;
-@@ -68,4 +70,6 @@ int sched_getattr(pid_t pid,
- 		  unsigned int size,
- 		  unsigned int flags);
- 
-+#endif /* SCHED_ATTR_SIZE_VER0 */
-+
- #endif /* __RT_SCHED_H__ */
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index a2e8558c4c..2042768d5a 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,6 +1,6 @@
-SRCREV = "f5b910a90b6f5ab0ef6df392e009ffe1429d53af"
-PV = "2.8"
+SRCREV = "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
+PV = "2.9"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https;tag=v${PV}"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index 5fa980dbdf..1f48e143d4 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -13,7 +13,6 @@ SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
             file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
-            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            "
 
 # rt-tests needs PI mutex support in libc
-- 
2.43.0


