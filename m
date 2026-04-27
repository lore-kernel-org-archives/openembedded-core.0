Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB41FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:10:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40199.1777284649675547144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ak2j9THB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260427101045e41f87635e00020716-0_dcd7@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260427101045e41f87635e00020716
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Apr 2026 12:10:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ffCEOACH0306OWlpaO2/W9VEG/wNoe1mN6883eu955c=;
 b=Ak2j9THBN0o/9rxaOgRN4Z5jdwL3OxIq4F8nRM6+tEazm+R8jVz/FKVdYPhw6EH3Ya1dc4
 AbOefItvKa0N9xlrZELWgxSC5+SKBFasPoJnOiOwb7JoqgYRG5GqP6Oasx6m5SFfzOmdILWl
 H/gNjP7uDUVBANvnYd/WRbELXegjfyKHW+yvn/bLBUijTAjfWQCULPKcJD0hOwWu45qfjUY1
 /X9XPynuY1XahKHcntyMAReHXMlWKg6phCQRxRYwcA26NAMXTeGDYhlBwpFpT8jc6/WJTcS6
 ORGtKd3aybzpDvgq37ZOsTctvSTZMgtqYrh7bNxVolvpPa7DP/t3zAQg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] ffmpeg: set status for 4 CVEs
Date: Mon, 27 Apr 2026 12:10:42 +0200
Message-ID: <20260427101042.5132-1-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-6-peter.marko@siemens.com>
References: <20260426185025.13217-6-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236001

From: Peter Marko <peter.marko@siemens.com>

These reappeared after update of sbom-cve-check tooling.
Fixed version found by links from Debian security tracker.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 7bb7de3d25..b6d3ceb6dc 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -176,6 +176,10 @@ CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
 CVE_STATUS_WRONG_CPE = "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
 CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used version"
 
+CVE_STATUS[CVE-2022-2566] = "fixed-version: these CVEs are fixed since v5.1.1"
+CVE_STATUS[CVE-2025-9951] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"

