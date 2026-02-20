Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23ADC5AD46
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 17:24:09 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2868.1771608242576597679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 09:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YpUXI3gE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260220172359ca1ae0b3f70002078c-yw4_w4@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260220172359ca1ae0b3f70002078c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 18:23:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LrHLAqcP8+h7/eHoie8pUn6KMTdmuaqMz64VtNgFBNM=;
 b=YpUXI3gEv399nGP27tghyiBmm0P3G8Xq3WPPkqgFwXuyi/uv8IgnPPlIRgsDaS2E2uQl7j
 U4NCpV+uiWQtU58w2C7Nqk7LZMLsE0gG/jZRIblCrhoydISRe4Xnlt3A7+WdkfNC3ffFCJcn
 uObTR2WbAk/wVwXBrFAdYPT3nqgr/zzsWfonlwHtpLuLesSv1wrxn6v6a+r6Ve7BRP9fvqHF
 ph/MQq5M7ymIPhwMbA4WRWVNrVKmm+IPBG9bGxUTFgk4QbscnpHZE8NPqlfCdnXroyKxkkyu
 YTUxNBs2NnDHjc+B+pELtDv56ArIF0rRbCam+Vxuf6nmtthZoV1FeIQw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ffmpeg: ignore CVE-2025-1594
Date: Fri, 20 Feb 2026 18:23:57 +0100
Message-Id: <20260220172357.11834-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 17:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231539

From: Peter Marko <peter.marko@siemens.com>

This CVE was patched via c9a15206bae7f1e85dc3b8812eabb936a7e6d383

Patch was dropped during update to 6.1.4, however NVD DB does not have
this information so it re-appeared in CVE reports.

Set its status accordingly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index c1536015d98..03ec637ddfa 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -48,7 +48,7 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
-CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
 CVE_STATUS[CVE-2025-25469] = "cpe-incorrect: Current version (6.1.4) is not impacted."

