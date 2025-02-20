Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2689C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 18:35:17 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.4661.1740076512200813441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 10:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=J97/hZvz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502201835099043956a38deaa7cb2-ib5in8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502201835099043956a38deaa7cb2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Feb 2025 19:35:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=s96LrIXhlKnr2CALxC89V0qKi/jLMOoc+CEIR2wijsM=;
 b=J97/hZvz63FdWSD8XD8dXpJlh/Al94wx4+8bVUQHcc1tcgtRBmlliCANi2/z25Et8HLe8b
 z9foP0+Ko87BxyRyr5Z/hOxGzBHr5XwBT8ywhkeG31i4jbg4htNLve8fNf5jVGNuA/LPzLm+
 9F4//ZT2fm6mLWCakGIU7dFmme5zKgnlr40o03CJQ1YJFPkXKOgFGAzGH7XTH9seWt12tt3y
 YTOvqRdjKmE5w6adb2yBNwM6q+XUejZxJUCDhLCSbk4ZYUhmFLBTcrHY8hPDGtBKxPFFIqOS
 +Q2nXPD9pfEfCdz0+mOfWg3+3PNUoreGWGkKQW+HXnDZf64xlPS0k6mQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] ffmpeg: ignore CVE-2024-7272
Date: Thu, 20 Feb 2025 19:34:16 +0100
Message-Id: <20250220183416.179109-2-peter.marko@siemens.com>
In-Reply-To: <20250220183416.179109-1-peter.marko@siemens.com>
References: <20250220183416.179109-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 18:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211774

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in 5.1, so 5.0.1 is not affected.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index bded23bc35..900545a5f0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -75,6 +75,11 @@ CVE_CHECK_IGNORE += "CVE-2024-22861"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/ca09d8a0dcd82e3128e62463231296aaf63ae6f7
 CVE_CHECK_IGNORE += "CVE-2024-22862"
 
+# This vulnerability was introduced in 5.1 and fixed in 5.2 (backported also to 5.1.6), so 5.0.x is not affected
+# introduced: https://github.com/FFmpeg/FFmpeg/commit/8a5896ec1f635ccf0d726f7ba7a06649ebeebf25
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/9903ba28c28ab18dc7b7b6fb8571cc8b5caae1a6
+CVE_CHECK_IGNORE += "CVE-2024-7272"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

