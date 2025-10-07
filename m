Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E53DCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:02:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1088.1759870959798302080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=egB3M4Ll;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202510072102362189a5ac8b0002074c-lap1pk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202510072102362189a5ac8b0002074c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Oct 2025 23:02:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vamNafAaFPbQVKh0INrxwwON6ph/UiHyZu63+w23oy4=;
 b=egB3M4LlfXZVbiZ9kSZ3EcX+JkSjhmwajkM2TwQgsZFoZW/46wR6M3SlhMpsAJfAt5bqpX
 eXdKPeDtJeZOVw79C6R7VWgKVacjAHrrWku7WQ4eTNxFb3e1oOpy1x53LiEXAvpQ5HoO2sxy
 CNk7RiXAo1iHk+htEsLSfSROw56Um7NKPW0WaqLOO7MvtLg5XhKuq1Pq1vq0lgornKh9O/+8
 6bPwxASSck4o5ZQtTzwzoHAM3jG9qtN211N3YvQyu5CBh6egcCaLt9qo72PdYAsvCgmLr54y
 n7zozpO4xyqNloljIVPwCJqwdB/9BWWXdKVN/1Tt9w07WbsUWVXk4JXA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] gstreamer1.0: ignore CVEs fixed in plugins
Date: Tue,  7 Oct 2025 23:02:32 +0200
Message-Id: <20251007210233.1569271-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 21:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224564

From: Peter Marko <peter.marko@siemens.com>

All these CVEs were fixed in recent commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gstreamer/gstreamer1.0_1.20.7.bb                 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 697c6e8b49..b9b9551bc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -71,15 +71,21 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 CVE_PRODUCT = "gstreamer"
 
 # these CVEs are patched in gstreamer1.0-plugins-bad
-CVE_CHECK_IGNORE += "CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444"
+CVE_CHECK_IGNORE += "\
+    CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444 \
+    CVE-2025-3887 \
+"
 # these CVEs are patched in gstreamer1.0-plugins-base
-CVE_CHECK_IGNORE += "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
+CVE_CHECK_IGNORE += " \
+    CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835 \
+    CVE-2025-47806 CVE-2025-47807 CVE-2025-47808 \
+"
 # these CVEs are patched in gstreamer1.0-plugins-good
 CVE_CHECK_IGNORE += " \
     CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
     CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
     CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
-    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 CVE-2025-47183 CVE-2025-47219 \
 "
 
 PTEST_BUILD_HOST_FILES = ""

