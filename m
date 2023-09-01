Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FFBCA0FE8
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 13:01:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5659.1693573285195678325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gJ4hiXot;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573285; x=1725109285;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sPCzikf0JzVZw7n8GAZQm91eYh/LvpVIMOGmv6lCHCk=;
  b=gJ4hiXot6fzvroIM4Q1FutydcS0csekl1m+1WeDkUJ/Qz4NtC62oDlk4
   gkMf6vaJ93rJ9rDcJq8u/uDqXPpOBvlPSlyXEh4PpXZ3Yw4Tff7vffqP8
   hWs/QsYCwudSHEQSj5YllR7OuilBNxE+IfOZzXCUT5QZiQvpIWEirIx2K
   G1WyYmi8UmL/8iuX3UER2XhAZnndLk1zDjcnAx/CoJCNidU/8NY44vFVk
   eoGwU/bWcfHLPwuJugbynFCjHrT+8aTCziNpo0Vomb0UKeWD0t+ss22Fz
   qN8cuk9owltdiMzCGx8yRPQ4+3kt8SXiIOXuCJhvCdjP6TjyCvvBmzMNU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361239733"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="361239733"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739924057"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="739924057"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 01 Sep 2023 06:01:20 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch 1/4] python3: upgrade 3.11.2 -> 3.11.3
Date: Fri,  1 Sep 2023 20:41:40 +0800
Message-Id: <20230901124143.1639925-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 13:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187006

From: Alexander Kanavin <alex.kanavin@gmail.com>

(cherry picked from commit 7d5bb3a4690ef61a1fee21773b4717e829789e32)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch        | 2 +-
 ...1-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 .../python3/12-distutils-prefix-is-inside-staging-area.patch    | 2 +-
 .../python/{python3_3.11.2.bb => python3_3.11.3.bb}             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.11.2.bb => python3_3.11.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 96e5e81342..c9253832cf 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 7d296dc635ad3ac2792955ce37e140a4104b098f Mon Sep 17 00:00:00 2001
+From 6cb667f37beacd832cb409e5244b3c90dfad32f7 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 86971f4048..d5b7ce2b95 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From cab8b8b1390165a93dfb27c48c1cc4c3e4280dfd Mon Sep 17 00:00:00 2001
+From 4ed481f4928c361970e78f27c4d9be8700af176b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index e080b5c562..5ee4e4f126 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 79e7ed59750612e57647847957ab85709307ea38 Mon Sep 17 00:00:00 2001
+From 4c39252c71d8bca81fdc43753c83a59f8668c619 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.2.bb
rename to meta/recipes-devtools/python/python3_3.11.3.bb
index f3be9768bf..0563a0ab9b 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.3.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af"
+SRC_URI[sha256sum] = "8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.37.3


