Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C6AC369D3
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:44:27 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.23820.1745747055385689323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NRB8Mtkx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250427094416f7155754b279600ff7-olji8x@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250427094416f7155754b279600ff7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 11:44:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=t2DlqKgcfP1ShaDDpA8Bvw/4rti3M8hsESs9benwQNY=;
 b=NRB8MtkxpgfKJtWBvnKg1QcqZdTsPPFO0Pfz/x8vYRiLuvuwUnj7h8NJ2vQZiy5oDaJl+n
 VXlqAwbVbF/zPdCi2a+8zzDPRY20uYG0oEGxDMpSEUEuQhFYNJwlC7rofKDPnhF2xla0PLNS
 IyqXtKUwsHywlFa4MuLPM0EqVphLofbydLSdsL7Q6Z7PocWh+tElO3WEmaiiX+ImgHg6F7bt
 74B8QLlHG76HqZq+FaAo2B6ziNc8q1ZBbRfw7vth1usNbg1Mgp/VqhI08knn3PmBaO/0abm3
 byQgAWLdTGjfU6Q2NnwHPl4eMKt/tiTiIiZm3vsKOHFsGPBZhKT80dxg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/4] linux/cve-exclusion: update exclusions after script fixes
Date: Sun, 27 Apr 2025 11:43:01 +0200
Message-Id: <20250427094302.12064-3-peter.marko@siemens.com>
In-Reply-To: <20250427094302.12064-1-peter.marko@siemens.com>
References: <20250427094302.12064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 09:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215549

From: Peter Marko <peter.marko@siemens.com>

This will shift fixed version of many CVEs, it does not change status of
any CVE.

Note that the current format of cvelistV5 does not allow us to determine
real value of "fixed_in" without also checking the hashes, but the
result are still fine.
The reason is that many entries are missing original_commit_for_fix
field and thus we see the final "fixed_in" version to be set to backport
to previous branch (e.g. 6.12.23 instead of 6.13).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../linux/cve-exclusion_6.12.inc              | 138 +++++++++---------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 24d5631588..5249572cd4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-04-27 08:54:24.704112+00:00 for version 6.12.23
+# Generated at 2025-04-27 09:28:35.170900+00:00 for version 6.12.23
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.23"
@@ -96,7 +96,7 @@ CVE_STATUS[CVE-2021-46920] = "fixed-version: Fixed from version 5.12"
 
 CVE_STATUS[CVE-2021-46921] = "fixed-version: Fixed from version 5.12"
 
-CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.10.33"
+CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.11.17"
 
 CVE_STATUS[CVE-2021-46923] = "fixed-version: Fixed from version 5.16"
 
@@ -592,7 +592,7 @@ CVE_STATUS[CVE-2021-47177] = "fixed-version: Fixed from version 5.13"
 
 CVE_STATUS[CVE-2021-47178] = "fixed-version: Fixed from version 5.13"
 
-CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 4.9.271"
+CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 5.12.9"
 
 CVE_STATUS[CVE-2021-47180] = "fixed-version: Fixed from version 5.13"
 
@@ -706,7 +706,7 @@ CVE_STATUS[CVE-2021-47237] = "fixed-version: Fixed from version 5.13"
 
 CVE_STATUS[CVE-2021-47238] = "fixed-version: Fixed from version 5.13"
 
-CVE_STATUS[CVE-2021-47239] = "fixed-version: Fixed from version 4.4.274"
+CVE_STATUS[CVE-2021-47239] = "fixed-version: Fixed from version 5.12.13"
 
 CVE_STATUS[CVE-2021-47240] = "fixed-version: Fixed from version 5.13"
 
@@ -1092,7 +1092,7 @@ CVE_STATUS[CVE-2021-47434] = "fixed-version: Fixed from version 5.15"
 
 CVE_STATUS[CVE-2021-47435] = "fixed-version: Fixed from version 5.15"
 
-CVE_STATUS[CVE-2021-47436] = "fixed-version: Fixed from version 4.14.252"
+CVE_STATUS[CVE-2021-47436] = "fixed-version: Fixed from version 5.14.14"
 
 CVE_STATUS[CVE-2021-47437] = "fixed-version: Fixed from version 5.15"
 
@@ -1318,7 +1318,7 @@ CVE_STATUS[CVE-2021-47553] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-47554] = "fixed-version: Fixed from version 5.16"
 
-CVE_STATUS[CVE-2021-47555] = "fixed-version: Fixed from version 5.4.163"
+CVE_STATUS[CVE-2021-47555] = "fixed-version: Fixed from version 5.15.6"
 
 CVE_STATUS[CVE-2021-47556] = "fixed-version: Fixed from version 5.16"
 
@@ -1390,7 +1390,7 @@ CVE_STATUS[CVE-2021-47593] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-47594] = "fixed-version: Fixed from version 5.16"
 
-CVE_STATUS[CVE-2021-47595] = "fixed-version: Fixed from version 5.10.88"
+CVE_STATUS[CVE-2021-47595] = "fixed-version: Fixed from version 5.15.11"
 
 CVE_STATUS[CVE-2021-47596] = "fixed-version: Fixed from version 5.16"
 
@@ -1574,11 +1574,11 @@ CVE_STATUS[CVE-2022-48639] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-48640] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48641] = "fixed-version: Fixed from version 4.14.295"
+CVE_STATUS[CVE-2022-48641] = "fixed-version: Fixed from version 5.19.12"
 
 CVE_STATUS[CVE-2022-48642] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48643] = "fixed-version: Fixed from version 5.10.146"
+CVE_STATUS[CVE-2022-48643] = "fixed-version: Fixed from version 5.19.12"
 
 CVE_STATUS[CVE-2022-48644] = "fixed-version: Fixed from version 6.0"
 
@@ -1618,7 +1618,7 @@ CVE_STATUS[CVE-2022-48661] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-48662] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48663] = "fixed-version: Fixed from version 5.10.146"
+CVE_STATUS[CVE-2022-48663] = "fixed-version: Fixed from version 5.19.12"
 
 CVE_STATUS[CVE-2022-48664] = "fixed-version: Fixed from version 6.0"
 
@@ -1634,7 +1634,7 @@ CVE_STATUS[CVE-2022-48669] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2022-48670] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48671] = "fixed-version: Fixed from version 5.4.215"
+CVE_STATUS[CVE-2022-48671] = "fixed-version: Fixed from version 5.19.11"
 
 CVE_STATUS[CVE-2022-48672] = "fixed-version: Fixed from version 6.0"
 
@@ -1770,7 +1770,7 @@ CVE_STATUS[CVE-2022-48750] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48751] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48752] = "fixed-version: Fixed from version 5.10.96"
+CVE_STATUS[CVE-2022-48752] = "fixed-version: Fixed from version 5.16.5"
 
 CVE_STATUS[CVE-2022-48753] = "fixed-version: Fixed from version 5.17"
 
@@ -1822,17 +1822,17 @@ CVE_STATUS[CVE-2022-48776] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48777] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48778] = "fixed-version: Fixed from version 5.4.181"
+CVE_STATUS[CVE-2022-48778] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48779] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48780] = "fixed-version: Fixed from version 5.15.25"
+CVE_STATUS[CVE-2022-48780] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48781] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48782] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48783] = "fixed-version: Fixed from version 5.10.102"
+CVE_STATUS[CVE-2022-48783] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48784] = "fixed-version: Fixed from version 5.17"
 
@@ -1840,7 +1840,7 @@ CVE_STATUS[CVE-2022-48785] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48786] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48787] = "fixed-version: Fixed from version 4.14.268"
+CVE_STATUS[CVE-2022-48787] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48788] = "fixed-version: Fixed from version 5.17"
 
@@ -1878,7 +1878,7 @@ CVE_STATUS[CVE-2022-48804] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48805] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48806] = "fixed-version: Fixed from version 5.4.180"
+CVE_STATUS[CVE-2022-48806] = "fixed-version: Fixed from version 5.16.10"
 
 CVE_STATUS[CVE-2022-48807] = "fixed-version: Fixed from version 5.17"
 
@@ -1940,13 +1940,13 @@ CVE_STATUS[CVE-2022-48835] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48836] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48837] = "fixed-version: Fixed from version 4.9.308"
+CVE_STATUS[CVE-2022-48837] = "fixed-version: Fixed from version 5.16.17"
 
 CVE_STATUS[CVE-2022-48838] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48839] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48840] = "fixed-version: Fixed from version 5.15.31"
+CVE_STATUS[CVE-2022-48840] = "fixed-version: Fixed from version 5.16.17"
 
 CVE_STATUS[CVE-2022-48841] = "fixed-version: Fixed from version 5.17"
 
@@ -2092,13 +2092,13 @@ CVE_STATUS[CVE-2022-48912] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48913] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48914] = "fixed-version: Fixed from version 4.19.233"
+CVE_STATUS[CVE-2022-48914] = "fixed-version: Fixed from version 5.16.13"
 
 CVE_STATUS[CVE-2022-48915] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48916] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48917] = "fixed-version: Fixed from version 4.9.305"
+CVE_STATUS[CVE-2022-48917] = "fixed-version: Fixed from version 5.16.13"
 
 CVE_STATUS[CVE-2022-48918] = "fixed-version: Fixed from version 5.17"
 
@@ -2236,7 +2236,7 @@ CVE_STATUS[CVE-2022-48985] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-48986] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-48987] = "fixed-version: Fixed from version 4.9.336"
+CVE_STATUS[CVE-2022-48987] = "fixed-version: Fixed from version 6.0.13"
 
 CVE_STATUS[CVE-2022-48988] = "fixed-version: Fixed from version 6.1"
 
@@ -2382,7 +2382,7 @@ CVE_STATUS[CVE-2022-49068] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49069] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49070] = "fixed-version: Fixed from version 5.15.34"
+CVE_STATUS[CVE-2022-49070] = "fixed-version: Fixed from version 5.17.3"
 
 CVE_STATUS[CVE-2022-49071] = "fixed-version: Fixed from version 5.18"
 
@@ -2778,7 +2778,7 @@ CVE_STATUS[CVE-2022-49270] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49271] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49272] = "fixed-version: Fixed from version 5.10.110"
+CVE_STATUS[CVE-2022-49272] = "fixed-version: Fixed from version 5.17.2"
 
 CVE_STATUS[CVE-2022-49273] = "fixed-version: Fixed from version 5.18"
 
@@ -3920,7 +3920,7 @@ CVE_STATUS[CVE-2023-52523] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-52524] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 4.14.327"
+CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 6.5.7"
 
 CVE_STATUS[CVE-2023-52526] = "fixed-version: Fixed from version 6.6"
 
@@ -3970,7 +3970,7 @@ CVE_STATUS[CVE-2023-52574] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-52576] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 4.14.327"
+CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 6.5.6"
 
 CVE_STATUS[CVE-2023-52578] = "fixed-version: Fixed from version 6.6"
 
@@ -4246,7 +4246,7 @@ CVE_STATUS[CVE-2023-52743] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52744] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52745] = "fixed-version: Fixed from version 5.4.232"
+CVE_STATUS[CVE-2023-52745] = "fixed-version: Fixed from version 6.1.12"
 
 CVE_STATUS[CVE-2023-52746] = "fixed-version: Fixed from version 6.2"
 
@@ -4622,7 +4622,7 @@ CVE_STATUS[CVE-2023-52975] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52976] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 4.14.306"
+CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 6.1.11"
 
 CVE_STATUS[CVE-2023-52978] = "fixed-version: Fixed from version 6.2"
 
@@ -4634,7 +4634,7 @@ CVE_STATUS[CVE-2023-52981] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52982] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52983] = "fixed-version: Fixed from version 5.15.93"
+CVE_STATUS[CVE-2023-52983] = "fixed-version: Fixed from version 6.1.11"
 
 CVE_STATUS[CVE-2023-52984] = "fixed-version: Fixed from version 6.2"
 
@@ -4720,11 +4720,11 @@ CVE_STATUS[CVE-2023-53025] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53026] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 5.10.165"
+CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 6.1.8"
 
-CVE_STATUS[CVE-2023-53029] = "fixed-version: Fixed from version 5.15.91"
+CVE_STATUS[CVE-2023-53029] = "fixed-version: Fixed from version 6.1.8"
 
-CVE_STATUS[CVE-2023-53030] = "fixed-version: Fixed from version 5.15.91"
+CVE_STATUS[CVE-2023-53030] = "fixed-version: Fixed from version 6.1.8"
 
 CVE_STATUS[CVE-2023-53031] = "fixed-version: Fixed from version 6.2"
 
@@ -4818,7 +4818,7 @@ CVE_STATUS[CVE-2024-26623] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26625] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26626] = "fixed-version: Fixed from version 6.1.77"
+CVE_STATUS[CVE-2024-26626] = "fixed-version: Fixed from version 6.7.4"
 
 CVE_STATUS[CVE-2024-26627] = "fixed-version: Fixed from version 6.8"
 
@@ -5114,9 +5114,9 @@ CVE_STATUS[CVE-2024-26778] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26779] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26780] = "fixed-version: Fixed from version 6.1.81"
+CVE_STATUS[CVE-2024-26780] = "fixed-version: Fixed from version 6.7.9"
 
-CVE_STATUS[CVE-2024-26781] = "fixed-version: Fixed from version 5.10.212"
+CVE_STATUS[CVE-2024-26781] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26782] = "fixed-version: Fixed from version 6.8"
 
@@ -5138,11 +5138,11 @@ CVE_STATUS[CVE-2024-26790] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26791] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26792] = "fixed-version: Fixed from version 6.1.81"
+CVE_STATUS[CVE-2024-26792] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26793] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26794] = "fixed-version: Fixed from version 6.6.21"
+CVE_STATUS[CVE-2024-26794] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26795] = "fixed-version: Fixed from version 6.8"
 
@@ -5154,7 +5154,7 @@ CVE_STATUS[CVE-2024-26798] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26799] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26800] = "fixed-version: Fixed from version 6.6.21"
+CVE_STATUS[CVE-2024-26800] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26801] = "fixed-version: Fixed from version 6.8"
 
@@ -5528,7 +5528,7 @@ CVE_STATUS[CVE-2024-26995] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-26996] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-26997] = "fixed-version: Fixed from version 4.19.313"
+CVE_STATUS[CVE-2024-26997] = "fixed-version: Fixed from version 6.8.8"
 
 CVE_STATUS[CVE-2024-26998] = "fixed-version: Fixed from version 6.9"
 
@@ -5580,7 +5580,7 @@ CVE_STATUS[CVE-2024-27021] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-27022] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-27023] = "fixed-version: Fixed from version 6.1.80"
+CVE_STATUS[CVE-2024-27023] = "fixed-version: Fixed from version 6.7.7"
 
 CVE_STATUS[CVE-2024-27024] = "fixed-version: Fixed from version 6.8"
 
@@ -5848,7 +5848,7 @@ CVE_STATUS[CVE-2024-35813] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35814] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35815] = "fixed-version: Fixed from version 4.19.312"
+CVE_STATUS[CVE-2024-35815] = "fixed-version: Fixed from version 6.7.12"
 
 CVE_STATUS[CVE-2024-35816] = "fixed-version: Fixed from version 6.8"
 
@@ -5864,7 +5864,7 @@ CVE_STATUS[CVE-2024-35822] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35823] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-35824] = "fixed-version: Fixed from version 6.1.84"
+CVE_STATUS[CVE-2024-35824] = "fixed-version: Fixed from version 6.7.12"
 
 CVE_STATUS[CVE-2024-35825] = "fixed-version: Fixed from version 6.8"
 
@@ -6126,7 +6126,7 @@ CVE_STATUS[CVE-2024-35960] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35962] = "fixed-version: Fixed from version 5.10.216"
+CVE_STATUS[CVE-2024-35962] = "fixed-version: Fixed from version 6.8.7"
 
 CVE_STATUS[CVE-2024-35963] = "fixed-version: Fixed from version 6.9"
 
@@ -6168,7 +6168,7 @@ CVE_STATUS[CVE-2024-35981] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35982] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35983] = "fixed-version: Fixed from version 5.4.275"
+CVE_STATUS[CVE-2024-35983] = "fixed-version: Fixed from version 6.8.9"
 
 CVE_STATUS[CVE-2024-35984] = "fixed-version: Fixed from version 6.9"
 
@@ -6194,7 +6194,7 @@ CVE_STATUS[CVE-2024-35994] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35995] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35996] = "fixed-version: Fixed from version 5.15.158"
+CVE_STATUS[CVE-2024-35996] = "fixed-version: Fixed from version 6.8.9"
 
 CVE_STATUS[CVE-2024-35997] = "fixed-version: Fixed from version 6.9"
 
@@ -6306,7 +6306,7 @@ CVE_STATUS[CVE-2024-36884] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36886] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36887] = "fixed-version: Fixed from version 6.6.31"
+CVE_STATUS[CVE-2024-36887] = "fixed-version: Fixed from version 6.8.10"
 
 CVE_STATUS[CVE-2024-36888] = "fixed-version: Fixed from version 6.9"
 
@@ -6418,7 +6418,7 @@ CVE_STATUS[CVE-2024-36941] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36943] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36944] = "fixed-version: Fixed from version 5.15.159"
+CVE_STATUS[CVE-2024-36944] = "fixed-version: Fixed from version 6.8.10"
 
 CVE_STATUS[CVE-2024-36945] = "fixed-version: Fixed from version 6.9"
 
@@ -6454,7 +6454,7 @@ CVE_STATUS[CVE-2024-36960] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36962] = "fixed-version: Fixed from version 6.1.91"
+CVE_STATUS[CVE-2024-36962] = "fixed-version: Fixed from version 6.8.10"
 
 CVE_STATUS[CVE-2024-36963] = "fixed-version: Fixed from version 6.9"
 
@@ -6888,9 +6888,9 @@ CVE_STATUS[CVE-2024-40918] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-40919] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-40920] = "fixed-version: Fixed from version 6.1.95"
+CVE_STATUS[CVE-2024-40920] = "fixed-version: Fixed from version 6.9.6"
 
-CVE_STATUS[CVE-2024-40921] = "fixed-version: Fixed from version 6.1.95"
+CVE_STATUS[CVE-2024-40921] = "fixed-version: Fixed from version 6.9.6"
 
 CVE_STATUS[CVE-2024-40922] = "fixed-version: Fixed from version 6.10"
 
@@ -7030,7 +7030,7 @@ CVE_STATUS[CVE-2024-40991] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-40992] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-40993] = "fixed-version: Fixed from version 6.1.96"
+CVE_STATUS[CVE-2024-40993] = "fixed-version: Fixed from version 6.9.7"
 
 CVE_STATUS[CVE-2024-40994] = "fixed-version: Fixed from version 6.10"
 
@@ -7146,7 +7146,7 @@ CVE_STATUS[CVE-2024-41050] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-41051] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-41052] = "fixed-version: Fixed from version 6.6.41"
+CVE_STATUS[CVE-2024-41052] = "fixed-version: Fixed from version 6.9.10"
 
 CVE_STATUS[CVE-2024-41053] = "fixed-version: Fixed from version 6.10"
 
@@ -7324,7 +7324,7 @@ CVE_STATUS[CVE-2024-42101] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-42102] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-42103] = "fixed-version: Fixed from version 5.15.163"
+CVE_STATUS[CVE-2024-42103] = "fixed-version: Fixed from version 6.9.9"
 
 CVE_STATUS[CVE-2024-42104] = "fixed-version: Fixed from version 6.10"
 
@@ -7800,7 +7800,7 @@ CVE_STATUS[CVE-2024-43895] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-43896] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-43897] = "fixed-version: Fixed from version 5.15.167"
+CVE_STATUS[CVE-2024-43897] = "fixed-version: Fixed from version 6.10.5"
 
 CVE_STATUS[CVE-2024-43899] = "fixed-version: Fixed from version 6.11"
 
@@ -7904,7 +7904,7 @@ CVE_STATUS[CVE-2024-44966] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-44967] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-44968] = "fixed-version: Fixed from version 6.1.105"
+CVE_STATUS[CVE-2024-44968] = "fixed-version: Fixed from version 6.10.5"
 
 CVE_STATUS[CVE-2024-44969] = "fixed-version: Fixed from version 6.11"
 
@@ -8156,7 +8156,7 @@ CVE_STATUS[CVE-2024-46732] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-46733] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-46734] = "fixed-version: Fixed from version 5.15.167"
+CVE_STATUS[CVE-2024-46734] = "fixed-version: Fixed from version 6.10.10"
 
 CVE_STATUS[CVE-2024-46735] = "fixed-version: Fixed from version 6.11"
 
@@ -8410,7 +8410,7 @@ CVE_STATUS[CVE-2024-46863] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-46864] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-46865] = "fixed-version: Fixed from version 5.10.227"
+CVE_STATUS[CVE-2024-46865] = "fixed-version: Fixed from version 6.10.11"
 
 CVE_STATUS[CVE-2024-46866] = "fixed-version: Fixed from version 6.11"
 
@@ -9004,7 +9004,7 @@ CVE_STATUS[CVE-2024-50030] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50031] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50032] = "fixed-version: Fixed from version 6.6.57"
+CVE_STATUS[CVE-2024-50032] = "fixed-version: Fixed from version 6.11.4"
 
 CVE_STATUS[CVE-2024-50033] = "fixed-version: Fixed from version 6.12"
 
@@ -9124,7 +9124,7 @@ CVE_STATUS[CVE-2024-50095] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50096] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50097] = "fixed-version: Fixed from version 6.6.57"
+CVE_STATUS[CVE-2024-50097] = "fixed-version: Fixed from version 6.11.4"
 
 CVE_STATUS[CVE-2024-50098] = "fixed-version: Fixed from version 6.12"
 
@@ -9348,7 +9348,7 @@ CVE_STATUS[CVE-2024-50208] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50209] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50210] = "fixed-version: Fixed from version 5.10.229"
+CVE_STATUS[CVE-2024-50210] = "fixed-version: Fixed from version 6.11.6"
 
 CVE_STATUS[CVE-2024-50211] = "fixed-version: Fixed from version 6.12"
 
@@ -9422,7 +9422,7 @@ CVE_STATUS[CVE-2024-50247] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50248] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50249] = "fixed-version: Fixed from version 5.15.171"
+CVE_STATUS[CVE-2024-50249] = "fixed-version: Fixed from version 6.11.7"
 
 CVE_STATUS[CVE-2024-50250] = "fixed-version: Fixed from version 6.12"
 
@@ -9580,7 +9580,7 @@ CVE_STATUS[CVE-2024-53058] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53059] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53060] = "fixed-version: Fixed from version 4.19.324"
+CVE_STATUS[CVE-2024-53060] = "fixed-version: Fixed from version 6.11.8"
 
 CVE_STATUS[CVE-2024-53061] = "fixed-version: Fixed from version 6.12"
 
@@ -9600,7 +9600,7 @@ CVE_STATUS[CVE-2024-53068] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53069] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53070] = "fixed-version: Fixed from version 5.15.172"
+CVE_STATUS[CVE-2024-53070] = "fixed-version: Fixed from version 6.11.8"
 
 CVE_STATUS[CVE-2024-53071] = "fixed-version: Fixed from version 6.12"
 
@@ -9654,7 +9654,7 @@ CVE_STATUS[CVE-2024-53095] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53096] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53097] = "fixed-version: Fixed from version 5.10.230"
+CVE_STATUS[CVE-2024-53097] = "fixed-version: Fixed from version 6.11.9"
 
 CVE_STATUS[CVE-2024-53098] = "fixed-version: Fixed from version 6.12"
 
@@ -9730,7 +9730,7 @@ CVE_STATUS[CVE-2024-53134] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53135] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53136] = "fixed-version: Fixed from version 4.19.325"
+CVE_STATUS[CVE-2024-53136] = "fixed-version: Fixed from version 6.11.10"
 
 CVE_STATUS[CVE-2024-53137] = "fixed-version: Fixed from version 6.12"
 
@@ -11198,7 +11198,7 @@ CVE_STATUS[CVE-2025-21792] = "cpe-stable-backport: Backported in 6.12.16"
 
 CVE_STATUS[CVE-2025-21793] = "cpe-stable-backport: Backported in 6.12.16"
 
-CVE_STATUS[CVE-2025-21794] = "fixed-version: Fixed from version 6.12.16"
+CVE_STATUS[CVE-2025-21794] = "cpe-stable-backport: Backported in 6.12.16"
 
 CVE_STATUS[CVE-2025-21795] = "cpe-stable-backport: Backported in 6.12.16"
 
@@ -11380,7 +11380,7 @@ CVE_STATUS[CVE-2025-21883] = "cpe-stable-backport: Backported in 6.12.18"
 
 CVE_STATUS[CVE-2025-21885] = "cpe-stable-backport: Backported in 6.12.18"
 
-CVE_STATUS[CVE-2025-21886] = "fixed-version: Fixed from version 6.12.18"
+CVE_STATUS[CVE-2025-21886] = "cpe-stable-backport: Backported in 6.12.18"
 
 CVE_STATUS[CVE-2025-21887] = "cpe-stable-backport: Backported in 6.12.18"
 
@@ -11454,7 +11454,7 @@ CVE_STATUS[CVE-2025-21921] = "cpe-stable-backport: Backported in 6.12.19"
 
 CVE_STATUS[CVE-2025-21922] = "cpe-stable-backport: Backported in 6.12.19"
 
-CVE_STATUS[CVE-2025-21923] = "fixed-version: Fixed from version 6.12.19"
+CVE_STATUS[CVE-2025-21923] = "cpe-stable-backport: Backported in 6.12.19"
 
 CVE_STATUS[CVE-2025-21924] = "cpe-stable-backport: Backported in 6.12.19"
 
@@ -11620,7 +11620,7 @@ CVE_STATUS[CVE-2025-22004] = "cpe-stable-backport: Backported in 6.12.21"
 
 CVE_STATUS[CVE-2025-22005] = "cpe-stable-backport: Backported in 6.12.21"
 
-CVE_STATUS[CVE-2025-22006] = "fixed-version: Fixed from version 6.12.21"
+CVE_STATUS[CVE-2025-22006] = "cpe-stable-backport: Backported in 6.12.21"
 
 CVE_STATUS[CVE-2025-22007] = "cpe-stable-backport: Backported in 6.12.21"
 

