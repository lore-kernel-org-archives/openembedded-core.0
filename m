Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADBBCAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:10 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.12670.1758809169365033079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OuDzE9oa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250925140607c534a7e7ae0002078b-j2k8_l@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250925140607c534a7e7ae0002078b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vmiUwpx/WQw6Yitq/PfuEKUgfg5q20qM2dBNgU6mJ1U=;
 b=OuDzE9oaQ6M3FfynTTPy5zctgKfLaC3x3trvpa/9+crpXJawVLEMFSiSiIMjhPcRuRSAjh
 ND2EnJlC/cISf8ww2mT6TXOD5sGghKhDuhfSV4OkGZZHJV7qUmHOj9eMSkv9kGxtdazhTa21
 d9GzKWLOgCuhH1mrC/j0HQ+HFIaLw2T/hJSQ8YUcUN3sWnUsc1p5k4WUQ3DPPnaMrO5K1qxK
 lfa+xHVw8cBunEimKc7YzDPemE35J6aNYGGpcMXP/DW0JMza2S6npNhU5trk9h9oZiy0/zOu
 b2Y6N8oKvYiqIIut4Og1QcDY0Mn2AaXaYJ04+8pXRl5tArFr3fpule1w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 03/10] gstreamer1.0: set status of CVE-2025-3887 to patched
Date: Thu, 25 Sep 2025 16:05:07 +0200
Message-Id: <20250925140514.1103300-3-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224032

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in plugins-bad.
See [1] and [2] which is included in 1.24.13.
These commits are backport of [3] to 1.24.
Commits fixing this CVE were copied from [4].

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e4351ef03f1331410b0c1216a6178d885f37e495
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ed4c2ce380f7168bd4a3423f4398eb341cb931c7
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8884
[4] https://security-tracker.debian.org/tracker/CVE-2025-3887

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
index 71a360ae7b3..d15b7daab8c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
@@ -77,4 +77,8 @@ CVE_STATUS_STABLE_BACKPORT[status] = "cpe-stable-backport: these CVEs are patche
 
 CVE_STATUS[CVE-2025-2759] = "not-applicable-platform: affects installation packages for non Linux OSes"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BAD"
+CVE_STATUS_PLUGINS_BAD = "CVE-2025-3887"
+CVE_STATUS_PLUGINS_BAD[status] = "cpe-incorrect: these CVEs is patched in current version of gstreamer1.0-plugins-bad"
+
 PTEST_BUILD_HOST_FILES = ""

