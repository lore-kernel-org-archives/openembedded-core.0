Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B74DCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:02:29 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.1026.1759870946253920372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aZlF0DVz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202510072102151c297d73420002076e-a532ji@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202510072102151c297d73420002076e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Oct 2025 23:02:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q02cvyRuIE7cYjpX6+i1GbW4t//BB/qaypMaiasBgzs=;
 b=aZlF0DVzYNH5wFaMczRTYGmYI8HN5S1wrzyKHCQ3uIx8yFVoHGnKHTbPG6Gh0X6rnJaS/G
 RTDPJ4l5zk1ze47YrZyW4eapqmRLRy//ffiJA/hLnoPtYjBIlHMXSxroPOcrJxXaIyqMi2Jq
 68BmOyMZD5tXDCsrNFe1N9drnmvYykONkLC82x3h1C0zp5aKg78wHwUjwQVu8/YhXNgQvnJz
 f+4ZDjATjgwZG+NYg9Iuy/vXOYZ0fa9kTvSGOJjztkRewQD6uzc8y7ekoD1fntRrdJdLURcg
 59u/Md2sM8fZ3qSQnhr3vDBF5HCfgukxuvpy0wCGV0WMyodOKB2Y5ZdQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] gstreamer1.0: ignore CVEs fixed in plugins
Date: Tue,  7 Oct 2025 23:02:12 +0200
Message-Id: <20251007210213.1569226-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 21:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224563

From: Peter Marko <peter.marko@siemens.com>

All these CVEs were fixed in recent commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gstreamer/gstreamer1.0_1.22.12.bb           | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index 3f28459e2d0..cfc66745e3b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -74,17 +74,26 @@ CVE_PRODUCT = "gstreamer"
 
 CVE_STATUS[CVE-2024-0444] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BAD"
+CVE_STATUS_PLUGINS_BAD = " \
+    CVE-2025-3887 \
+"
+CVE_STATUS_PLUGINS_BAD[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad"
+
 CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BASE"
-CVE_STATUS_PLUGINS_BASE = "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
-CVE_STATUS_PLUGINS_BASE[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-base"
+CVE_STATUS_PLUGINS_BASE = " \
+    CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835 \
+    CVE-2025-47806 CVE-2025-47807 CVE-2025-47808 \
+"
+CVE_STATUS_PLUGINS_BASE[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-base"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_GOOD"
 CVE_STATUS_PLUGINS_GOOD = " \
     CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
     CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
     CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
-    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 CVE-2025-47183 CVE-2025-47219 \
 "
-CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-good"
+CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-good"
 
 PTEST_BUILD_HOST_FILES = ""

