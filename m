Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75505C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:37:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43469.1790537824748149525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a11fmi59;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260927193702883ac9904a000207c0-_83kw9@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260927193702883ac9904a000207c0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:37:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BYWeEB65jetJ7u+BPs2HjYiWWZN86/CBXRn49avb2ZY=;
 b=a11fmi59/1JeXHT98ApfLxQOr1XvnzCB4nCaRrVA8msTFze3w14Uu+itRQbDapjG+fxksy
 K8yCXhzdftWmPfGIVs7Ks6QLftYBOzF8IBzTb3ziBL9547jE3oA2WK0wxvtOjU3UiGKwUFZL
 CpvGWS9pLF2OHQ3ikart4uu86TmyoaYM18JZ5YII2xUTrhdbioFlWz2UV9AFrkocgD0vIUNS
 YRC+6SGeNDCxwstbEnemHW5yQUlSeE7BReKPtNHVjmHYuU79OLSH5Oe0/iebEC4mbaAVdH+H
 4n9mKUFWxfLQ+oy1p3kHvAtDWoa/UzZQ9SsmpsPEfN3eCjjJknmyT2UA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/9] ffmpeg: set status for CVE-2026-58049
Date: Sun, 27 Sep 2026 21:36:03 +0200
Message-ID: <20260927193609.359250-3-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246709

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed in a commit included in tag n9.0.
This is a version-less RedHat CVE.

[1] https://security-tracker.debian.org/tracker/CVE-2026-58049

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
index 4942e873ce..bb070d75c5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
@@ -180,3 +180,4 @@ CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2026-58049] = "fixed-version: this CVE are fixed since v9.0"

