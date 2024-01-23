Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C4CC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:47:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.7669.1705999661163650396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Ej0Tv/Kq;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705999660; x=1737535660;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w8SUi3JI5ocPep9LoJTWso7DJ3XESmcp1XVM2ILxOIs=;
  b=Ej0Tv/KqtRIxXZgcddlrahHoMIEyBmid09HBfiMT8Daa33JRpElqT6vj
   MmL9Wy0muj5kCOrCDN5u/VaZV6GFXhd8U9K3VXYJBEJ5plGSs8AzrRC6K
   qCdQ+ZsWM6dnkRiSY8i/6o9YrxfNkEQQGiYUALE1hOqadm2/J/6YGU6Dq
   sdna9Vma5B3oA24FLtZsBAUZD4bWBk9Ml0HnU4usBJn0q1vH/OerMoBMI
   s5v/ou55OEhShrpGeGxhhf0S7I0Yl7tCRNnL60gTaGCH/nU8l1HrOqn6U
   Ds65508UqXllMiueQyPew//MoSO/Ug2403TLEixj77RxD6bsZZm9SRXfm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432617010"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="432617010"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="820012979"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="820012979"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.153.8])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] bluez5: upgrade 5.71 -> 5.72
Date: Tue, 23 Jan 2024 16:47:31 +0800
Message-ID: <20240123084734.223154-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194214

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch       | 6 +++---
 ...sts-add-a-target-for-building-tests-without-runnin.patch | 4 ++--
 .../0004-src-shared-util.c-include-linux-limits.h.patch     | 4 ++--
 .../bluez5/{bluez5_5.71.bb => bluez5_5.72.bb}               | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.71.bb => bluez5_5.72.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 3546c7c305b..b1e93dbe19e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From e8808a2f5e17d375411c7409eaffb17e72f65022 Mon Sep 17 00:00:00 2001
+From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -27,10 +27,10 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index f92d860..a5f7117 100644
+index 5e06d4e..4864d36 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4479,7 +4479,7 @@ int main(int argc, char *argv[])
+@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index be050935515..881494a3543 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From 3724958858b0ee430f37fb83388c3737d2039a3a Mon Sep 17 00:00:00 2001
+From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index e7221bd..9595fd1 100644
+index e738eb3..dab17dd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -710,6 +710,9 @@ endif
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 6ef135327d0..516d8590697 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From ad069fadfcce2cf70f45b1c4a42665448675297e Mon Sep 17 00:00:00 2001
+From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index 34491f4..412f3ad 100644
+index c0c2c4a..036dc0d 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.71.bb b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.71.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.72.bb
index b9bc3dd1b67..9fda960ea72 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.71.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8"
+SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0


