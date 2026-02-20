Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E8EC5AD46
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 17:40:49 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3263.1771609242441338107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 09:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=i3ca2U7T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260220174039bab5212d0e000207b7-ip_aiv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260220174039bab5212d0e000207b7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 18:40:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=N2li32hhHoYYMrTUKvlpzuLL3TLnl24jMM6vwgZSliU=;
 b=i3ca2U7TKQmlkcYzWAvlX4vV6rirsuliQbA2AdMaZCh/0LAcD9DdGThdp9yQioV+PR0BTN
 ckpxX9C/9xS7H4f3HSCGgefBkV84zYBk6WfAfeSLwPYPgs8o2z8ITvFTnhM0BMdyoo15fzRb
 oqxvgVVkBznAuJBjnYTz1JFq7nMISbDxX6e2aKxUzV2BCvb0nK+SR5cbc3+tkmIFTmZhPG4t
 UGQ7+3loGbCXYyRQnTDgjhNSQrNjNmMDsyk5lssAbT4ri8GK7XMuHANofknrML1+csyNe0UT
 Wm8ui+70lWPNhijLwm1Zq7XgRjiJXPfW+vtXDNh2Kk6golCJBE1DPfpQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Fri, 20 Feb 2026 18:40:37 +0100
Message-Id: <20260220174037.13822-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 17:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231540

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 5e94bc29751..2cbc6696eb2 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -21,3 +21,5 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+CVE_STATUS[CVE-2024-56431] = "fixed-version:branch 1.1 is not affected, vulnerable code is not present yet"

