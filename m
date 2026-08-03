Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E73C55822
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:02:40 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4367.1785794556879185485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eGzLmUMo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260803220234c4086411e500020706-g_ycdv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260803220234c4086411e500020706
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0cycqHjOmFrSj1G1DJ61M8qwyRtt+rBzPRBJzWq0ehk=;
 b=eGzLmUMoZJ/JiJ1JckaYibMdtisJ+oSTJqopeAsry/3I60ahLleAOt0/qpPzE0haVszHfk
 2aPT7y6yU6KTXuhrFHvGN3ZQkdSDGmkSmtvgHw2B7xjh3BYM9o2jdyPW1qCsBNKvq2jVjy74
 JMtTBfRbeZVtWK5E5RODU9qMcfGf/vSSjJA4Dk1lQpLJgrEMpg7YkAYzoS+GIxmOxAu0nfv5
 H3yWs4IWsvdNiouyB/d3zjpXiO/UGWCNX1smp0nQGi6kpykkaTwe+s+94b+bXklTm+T1dVtc
 wLdJ5Qi6FzdgoVAyLK/xo8ikyQnlhytckoYx4q2T5f03es96goOAm42g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 03/15] ffmpeg: upgrade 8.0.1 -> 8.0.3
Date: Tue,  4 Aug 2026 00:01:43 +0200
Message-ID: <20260803220157.1520377-3-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242659

From: Peter Marko <peter.marko@siemens.com>

Changelog:
* https://github.com/FFmpeg/FFmpeg/blob/n8.0.2/Changelog
* https://github.com/FFmpeg/FFmpeg/blob/n8.0.3/Changelog

Resolves CVEs:
* CVE-2025-69693
* CVE-2026-30997
* CVE-2026-30998
* CVE-2026-30999
* CVE-2026-40962
* CVE-2026-8461

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ffmpeg/{ffmpeg_8.0.1.bb => ffmpeg_8.0.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.0.1.bb => ffmpeg_8.0.3.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index b6d3ceb6dc..f2a729fc41 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41"
+SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"

