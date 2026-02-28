Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57522FD0042
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 21:46:02 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127766.1772315154712020529
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 13:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eCJuM/jG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260228214552ddfd1ed39b000207c9-cypwpl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260228214552ddfd1ed39b000207c9
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Feb 2026 22:45:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OEg/QkjjmEJdsuYGM2KeIRXPXsrD36HROuIiOzVzN7g=;
 b=eCJuM/jGDGH7UkdAYTLVo4UMuoHog6pT5jB7oNXe34Tcc7mX60R6T4cKb+BAOG5ys4DIUl
 +F9yFfhlrU4UYpDGwEQ91Hpp/Wj5Vgnsa/GfIFPVYlY2QMpl6z1jh3sgZmojFX7Uuc/JVKYr
 HMv7qrPhSMpS7YRaAgHhyNLXCYaV41zlIA3GUeaMuxeSlvKs+SuRhQs6xTqjVBfFGCKX/Z/8
 caX7JO8deKoKLci8Kabrm24lcCppAvk2P/G0+IpdeFxXCbTxu6Jws6kM3C+usurHIG2C+l34
 UzQ7dgJeFSjhd2Aaw9RZXGLZUTn85aRjpob/UIvpLasYBgWy8vtXRgXg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] ffmpeg: set status for CVE-2025-12343
Date: Sat, 28 Feb 2026 22:45:11 +0100
Message-Id: <20260228214511.451781-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 21:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232129

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2025-12343
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/b8d5f65b9e89d893f27cf00799dbc15fc0ca2f8e
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/263e819aa45cd3c48bf6887be02b4ec504c02048

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index 1e59bfa33f..0970575b3c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -177,3 +177,4 @@ CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used vers
 
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
+CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"

