Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE26FEFB6D
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 21:45:52 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127765.1772315149496913503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 13:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=h1gQsIeI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260228214546b2db8e8dc0000207d1-tnc3oa@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260228214546b2db8e8dc0000207d1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Feb 2026 22:45:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eaYUuonTB3PaeMH5IUtkoDEIPUMv5luXZU2cu8vQjOs=;
 b=h1gQsIeI7++NtRp3TmLI2KuP+dN+0yi6080+24SbRAdxes1OTzDnMlTWw3UNz+UeFqQ6Bz
 knp+8ZpSSBO+cMEqDjR0afDyp09rS15IXxl7I7rGufpXjvOBnljDddvS5kr1vSQeZ7QTRwwr
 o7+E2cAKrawPfKA5dig4kIkjww3yNJ0zkd2xgs73s8R6mQcrFhpY5VIWeu2/2vJFYB1Q29ld
 y5Jr7qxn7at0zy+A/D51u+g/8oqb+ztFmec84x4oVEGs2I2dYA8NdSBcY7+FtU88lbr0zxRz
 BXtN4syyVbXFrL+I3olK+V67JaN4RQM/M8LGfqHQAx1zOi59ktxVsNFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] ffmpeg: set status for CVE-2025-12343
Date: Sat, 28 Feb 2026 22:45:01 +0100
Message-Id: <20260228214501.451765-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 21:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232128

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2025-12343
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/b8d5f65b9e89d893f27cf00799dbc15fc0ca2f8e
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/263e819aa45cd3c48bf6887be02b4ec504c02048

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index d564b47fd6..7bb7de3d25 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -178,3 +178,4 @@ CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used vers
 
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
+CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"

