Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292AAE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.66665.1735579767690204810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D23iU+0u;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412301729254147038d0f0c3e5f75-cofqyz@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412301729254147038d0f0c3e5f75
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:29:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mniHIYHBb6ur396x/Enb4wZUhUvYr0tn4owDWL3M3bI=;
 b=D23iU+0uW7UsKc2jcvHphe8dpXLbpBHaVmy7wtHe8lPSr8LR/qECRsBUjz3jyZt2fd0HJ4
 0GiDoWLqQmB2wkRdjqWH6fNFL7Xoy5GT4viT4c0kymNNGiLOBVQZfIgHRdUGfWWeXlR6B1tN
 u3E5RFvlMBPOzTLUMogn943l5VoQyoAMS/MiUhu8/FB5X7L19aVWLFEsHq+FZlgm/UUdto4E
 aOdcoNV1lhGX3lYBdSqzYR4f2bkr2wN+NyPPYeB+7iX9m4NB7rulhXTorj8rhu0Gdp2cHM7N
 VgUn/ZY2GkC8ucyGpv3cv9cqZzTUbw8efrf873A4lRt4Izl5DDU8oonw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 16/16] gstreamer1.0: ignore CVEs fixed in plugins recipes
Date: Mon, 30 Dec 2024 18:27:23 +0100
Message-Id: <20241230172723.3644270-16-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209180

From: Peter Marko <peter.marko@siemens.com>

These were fixed in previous commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gstreamer/gstreamer1.0_1.22.12.bb               | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index e5a820e1adb..3f28459e2d0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -74,4 +74,17 @@ CVE_PRODUCT = "gstreamer"
 
 CVE_STATUS[CVE-2024-0444] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BASE"
+CVE_STATUS_PLUGINS_BASE = "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
+CVE_STATUS_PLUGINS_BASE[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-base"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_GOOD"
+CVE_STATUS_PLUGINS_GOOD = " \
+    CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
+    CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
+    CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+"
+CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-good"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.30.2


