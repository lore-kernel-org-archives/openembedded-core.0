Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C50BE8B376
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:41:12 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6401.1770158465742940225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Hdh6PaKS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202602032241025c059ae034000207ad-6lyg3i@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202602032241025c059ae034000207ad
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:41:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TSeaj8QByxdzBbhYsOpnu9alTRNalb+TO5NQbkDmDm8=;
 b=Hdh6PaKSFAql3pQIRi2vGqWZ+SnICXvMnkm6kCZccq+OJL6mEp47+1NfAhjSJKHBXh6FBL
 NiGET/Jny8trCmunqJUaWl8fgA52EcQBubeTAg/rGK2BLy5voUNTk3LUqqtfoLeQZ2HOarmy
 X5E5fFP3MpQdMpq4idR5X46KQuvERMtrt2fRN+vQaaYc30K7d2ZduR2K7q+n4ia6vlzr9Liw
 RMZ2iM5BnKPqBobDOyurb2wkTCiks1Dn16VyuMI232dkfrbsybp3APqZpDNLZSwqp+HgmPdg
 aee4oPqfocdPhYjDazoK3IC0w6+JLUOHymmUN4hDWghjRTrp0s2ET2Ug==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] ffmpeg: ignore 10 CVEs
Date: Tue,  3 Feb 2026 23:40:22 +0100
Message-Id: <20260203224022.1920641-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230487

From: Peter Marko <peter.marko@siemens.com>

First group of CVEs got a bogus cpe update listing all tags since v7.0.
All CVEs were fixed in v7.0 except CVE-2025-22921 fixed in v8.0.

Second group has date CPE (2025-01-13) instead of version (v8.0).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index d7afdd14f3..d564b47fd6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -171,3 +171,10 @@ FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 CVE_PRODUCT = "ffmpeg libswresample libavcodec"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE = "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
+CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used version"
+
+CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
+CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"

