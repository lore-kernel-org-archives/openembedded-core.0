Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AACE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:21:41 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.24880.1736529693716042887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fHJ/wxZW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025011017213032d2bc49467dd40adf-wamime@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025011017213032d2bc49467dd40adf
        for <openembedded-core@lists.openembedded.org>;
        Fri, 10 Jan 2025 18:21:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tIwrM4q5TP3Lv4OPJ5AQRlgpUNJJocq2yu60Ys56aXc=;
 b=fHJ/wxZWMRXvshch+JrdAH544G8oP5kfZvARo5PndHgALrYAP8osO7o9kzdW/Qx3COK34T
 QhgNBnqNEFVChJw0WIeiphQaAIBNzi+AMB+Yjl6nH+MJ3kxvHTwM+zF9tHdm7w7ZeVmnT+RW
 a52xA6prvsT6a3uMGAcWVrAMCDP+kp9rq5HbwG/AhbvCbgReeqo8S7kpuiJGodEHY2oQmAui
 Is+9i3encOG70hOEyks4pdYMyTTSMmj3GCQwz1+NY6tQcJMay2NPhU7c8r92cI/bzAin7fYM
 qVI92TzY2l1RwKxSuxLnToFcgMEByU/zoXfVHD6ApYwlxbZRlUF6OonA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] gstreamer1.0: ignore CVEs fixed in plugins recipes
Date: Fri, 10 Jan 2025 18:20:42 +0100
Message-Id: <20250110172042.10241-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 17:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209657

From: Peter Marko <peter.marko@siemens.com>

These were fixed in previous commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index b95c67f586..697c6e8b49 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -72,5 +72,14 @@ CVE_PRODUCT = "gstreamer"
 
 # these CVEs are patched in gstreamer1.0-plugins-bad
 CVE_CHECK_IGNORE += "CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444"
+# these CVEs are patched in gstreamer1.0-plugins-base
+CVE_CHECK_IGNORE += "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
+# these CVEs are patched in gstreamer1.0-plugins-good
+CVE_CHECK_IGNORE += " \
+    CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
+    CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
+    CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+"
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.30.2


