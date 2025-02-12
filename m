Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F540C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:39:48 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.22316.1739381985600786541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Km/gYTtG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025021217394195163ee3ccea637587-rtjnvp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025021217394195163ee3ccea637587
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Feb 2025 18:39:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vaSWw9S6b6TK6tyZd0tuu9hj/w0O2ErRli+TCWnnRvQ=;
 b=Km/gYTtGaFluTj4HspnIyVXevfSJOKBPVLCQpxHW0J/D97omb404Id6aDjCNOVC3frEOFN
 8MFOsaa/l05rQI5WSAkIYlRY/5vdwSAcqOKW0cVZiVl9iea8so2HjQ3rCYAe+YIkcA7CFMch
 Sd1xCFetodYbWgB8+Agj/8630MrN2U0WR8y7bOsJD5sYBG8xgRgrBr5OXHGFjhAUyt4DeDfz
 YH2ni2aCWB9T+oJb7C4E5eFJnnUCZcPtCEIRtcmEzZugKJg8Jki/manDOKl0P+TD65TytoQ1
 nYUBbnFVLcbdAVDaF2HcsVJfYSbZSZAQF8BuoloiDJZYaGWbJAuAEvYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][styhead][PATCH] subversion: ignore CVE-2024-45720
Date: Wed, 12 Feb 2025 18:38:47 +0100
Message-Id: <20250212173847.9923-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211264

From: Peter Marko <peter.marko@siemens.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720

This CVE is relevant only for subversion running on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
index 1ef3d498a5..679228cbb8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
@@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
 
 CVE_PRODUCT = "apache:subversion"
 
+CVE_STATUS[CVE-2024-45720] = "not-applicable-platform: Issue only applies on Windows"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[boost] = "--with-boost=${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"

