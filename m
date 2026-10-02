Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746D0CA5FE0
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6168.1790926594631399500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AMEgfmjR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E7F184E41109
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6DF1603DC;
	Fri,  2 Oct 2026 07:36:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4FF910328448;
	Fri,  2 Oct 2026 09:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yZ8LxR3RG71FYFaWB7mWis5uxuOMTlxMzjnBrqLgIc=;
	b=AMEgfmjRWl0Nmg7VlGnDPbJd306vukX2qHsupa4Ar8Jb8iIzJ5RPZdIOnRb4bld5LZU9rC
	ftTH6/7phAhRN1Bk2p27mcQNwJYk8PtNco5nUcic1vEVhASrgAF/ao7QkPeJJFk4BuQnpj
	mvh6n2vc9k/jf8Aex3FSebxs9nyxzIFiPtLqZqqDTrjzR6Wptwiqn+ODWCKhBiTivVBwsu
	VZuTG185PhleEZiM+s71dQoiEANTeT+fPXCzw2EFddT+9Ww+IojlTk4PnfmjKTFfCEVDWU
	Y6EOvIl4Rm+hexZfNdeVXIxct+JT8N+fYFwUhxbnn5/DaMK2lYEK8/6veqRKHQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:12 +0200
Subject: [PATCH 9/9] ltp: upgrade 20260529 -> 20260930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-9-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Jiaying Song <jiaying.song.cn@windriver.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=5178;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=w84skV/SuIplcSy1bMkeQsDgM8GOLWMzpFzx3HPGN1Q=;
 b=JDpe6JHB0CzH74/FyNZzccV9JG7DNsKBz2YZ0ODJHd/A1ljJfv8Un7niGvAo5dnRt//aw6sUP
 M9f+OA9R19ABRZREh9AYBRVVFMNm8ELSLv/RSyi613YGD7zdh3kZuI0
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247082

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch |  4 ++--
 .../ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch        |  6 +++---
 ...-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch | 10 +++++-----
 meta/recipes-extended/ltp/{ltp_20260529.bb => ltp_20260930.bb} |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index 07778ec6fd6f..bf3971a35895 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From cefa5ede50985803124fd09e9c6f2d07e2471e1b Mon Sep 17 00:00:00 2001
+From 98f188582170393606be73a15890858337602a73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
@@ -19,7 +19,7 @@ Cc: Hui Min Mina Chou <minachou@andestech.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-index f2984e2dc..5685bb864 100644
+index 7796ac776..2ac9eeac7 100644
 --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 3a5ac2b5a055..0cb8580a898c 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From b7bf6f49fdc98dc0aac9ca6f2d581688e083ed7a Mon Sep 17 00:00:00 2001
+From 7018f4fbcc8433aef5cde84be4101ad6674e4b04 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,7 +14,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 41d624ad8..1e8c22638 100644
+index c9d460c41..e536a3225 100644
 --- a/runtest/mm
 +++ b/runtest/mm
 @@ -69,12 +69,6 @@ ksm07 ksm07
@@ -29,4 +29,4 @@ index 41d624ad8..1e8c22638 100644
 -
  swapping01 swapping01 -i 5
  
- thp01 thp01 -I 120
+ thp01 thp01
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
index e38e9c3e21b9..c307be28e8bc 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -1,4 +1,4 @@
-From 89c83185e757ddaeb0262c17a10f605056f53916 Mon Sep 17 00:00:00 2001
+From 725ae507600f409cc7736a823fe6babdfcf210ad Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 23 May 2025 15:17:49 +0800
 Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
@@ -16,13 +16,13 @@ Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2025-May/043647
 
 Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
 ---
- testcases/kernel/syscalls/ipc/semctl/semctl08.c | 8 +++++---
+ testcases/kernel/syscalls/semctl/semctl08.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)
 
-diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+diff --git a/testcases/kernel/syscalls/semctl/semctl08.c b/testcases/kernel/syscalls/semctl/semctl08.c
 index 083179c92..a98eb35d6 100644
---- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-+++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+--- a/testcases/kernel/syscalls/semctl/semctl08.c
++++ b/testcases/kernel/syscalls/semctl/semctl08.c
 @@ -12,7 +12,11 @@
  #include "tst_test.h"
  #include "tse_newipc.h"
diff --git a/meta/recipes-extended/ltp/ltp_20260529.bb b/meta/recipes-extended/ltp/ltp_20260930.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20260529.bb
rename to meta/recipes-extended/ltp/ltp_20260930.bb
index f3e20daf8571..7e6aa4f815f6 100644
--- a/meta/recipes-extended/ltp/ltp_20260529.bb
+++ b/meta/recipes-extended/ltp/ltp_20260930.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "3a64d78f58bdceba93ed321e91215fb969a047ed"
+SRCREV = "2279d708c817db657611a30c427c7d06c4360049"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https;tag=${PV} \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \

-- 
2.47.3


