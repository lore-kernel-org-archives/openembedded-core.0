Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F82DCCD184
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:50:19 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.795.1759953014916360824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jRP+43ed;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202510081950129efad8581d00020764-6tqtgk@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202510081950129efad8581d00020764
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 21:50:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=St/whlRE8w0cGpxqMfi8626DNoZW2qQqfhAwDDI5KwQ=;
 b=jRP+43edJZTrnWFL8xpf0R5Mf4TrbOXF86MKPGbBxBVGV+0JSaOkKzT+Bfe3+RDfgSGEUX
 As/Ju6zKcSeC4OdqGIbMWZ/UtBKB5NW6PVPsJktpA2OFVDUt8XARzOGFes3kpOHP3HwQZJ0k
 g+Oq5FTrg1bTVGWGAA5q+NTt9JtU8BrZaovRAiiaVFwZ71ONkPA5ysReyLI49GbqLBCzNLin
 RKaJbglJmFYgAdOrNwe5i4RRT1v7/e0xgj8GI/M1L1EoCiq/aP4vJuY7qaFSRe98XGSebHOR
 mI64sHf2Sq17w650hJ1jghgJNkx8hXbrBbLA24MjKJRuz90b/75FWZsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] ffmpeg: mark CVE-2023-6601 as patched
Date: Wed,  8 Oct 2025 21:49:59 +0200
Message-Id: <20251008194959.1689404-2-peter.marko@siemens.com>
In-Reply-To: <20251008194959.1689404-1-peter.marko@siemens.com>
References: <20251008194959.1689404-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224595

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is fixed by the same commits as the other 3 CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2023-6601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
index 1ba1006197..d90fd20160 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
@@ -21,7 +21,7 @@ Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
 (cherry picked from commit 91d96dc8ddaebe0b6cb393f672085e6bfaf15a31)
 Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
 
-CVE: CVE-2023-6602 CVE-2023-6604 CVE-2023-6605
+CVE: CVE-2023-6601 CVE-2023-6602 CVE-2023-6604 CVE-2023-6605
 
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9803800e0e8cd8e1e7695f77cfbf4e0db0abfe57]
 

