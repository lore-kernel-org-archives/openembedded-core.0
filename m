Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23D8FF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 18:51:24 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25131.1777229475867452063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 11:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Uo7Ovg9T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202604261851145562a10bc7000207ea-6gyq0d@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202604261851145562a10bc7000207ea
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 20:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jV3phYW+SzkzlpW7wQQma/VrIcuq6cbZmIx+MbJmg/w=;
 b=Uo7Ovg9TZD+i3sd5BA2Dd2DAE+N9Kyve40gsIk9FhgtFTd+CHdlu9cUKane2+Sp+SEZoHP
 Hj4FvjRL8rV5T0YnnJRmJsTRzI5hXiHcuXvgxC/4H1mr2jhdyilz/QzgtpYhNVWsnuAGqeqK
 bVzMENWCYr0XRXTaVdMtutFH7RauClsAi5JfjyuT0ChbEmNMjI/UcvzR5B+JTBTTy88WnG2S
 F9lejfJKAy9olHqz7UmSraNgNWcfSGL4pBWVKARZMrslFrhOO8kSJVAkfuwV3n3SNJX1GhdR
 ++8a9R2pHalVmU8bJXctYtAt0qN568yC/DVBq83RR6kIHWI4KuOgDHqg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 6/6] ffmpeg: set status for 5 CVEs
Date: Sun, 26 Apr 2026 20:50:25 +0200
Message-ID: <20260426185025.13217-6-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-1-peter.marko@siemens.com>
References: <20260426185025.13217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 18:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235966

From: Peter Marko <peter.marko@siemens.com>

These reappeared after update of sbom-cve-check tooling.
Fixed version found by links from Debian security tracker.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 7bb7de3d25..9780abe184 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -176,6 +176,11 @@ CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
 CVE_STATUS_WRONG_CPE = "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
 CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used version"
 
+CVE_STATUS[CVE-2022-2566] = "fixed-version: these CVEs are fixed since v5.1.1"
+CVE_STATUS[CVE-2025-9951] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-69693] = "fixed-version: this CVE are fixed since v8.1"

