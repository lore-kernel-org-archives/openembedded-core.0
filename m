Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C866C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:37:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42545.1790537833663729111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ik/IOsS1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260927193711dc22758f5200020746-gvwzcq@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260927193711dc22758f5200020746
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:37:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PUx1PzQW+dkHbM7fO0TF+rRud2+7ri9xEmhfwKA7cdg=;
 b=ik/IOsS1GxBFyAFAHzDguAjDV1jM2mrraNFmCXuvO4JarguNpkrms+TH/4BxG0tFGcGTrx
 ZiHT4XmPWxlMS/DKpMxFRURgcfaFegksQh5A6eMZlvgyAUR6vLzh+883t4JOsjoOBINzYWWd
 Eh40ELRSh43u5eGDfVsSWPzhLKYScb7m6BBHnMojO7x7V41vYafp2idNxf0ZCemItJPL7drm
 EH6iKkabmXUYSJm751r9KXgi8Obs6Jxfg02oGHzsaYa3pnrT9ROuUd78FosT2cjOUMdk3Lt6
 nC+OYqjibvvF0AuijdFO7DWyad+NSyxVWqy3MjMJ+zesWMiNA6zGbzFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/9] ffmpeg: set status for 6 CVEs
Date: Sun, 27 Sep 2026 21:36:04 +0200
Message-ID: <20260927193609.359250-4-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246710

From: Peter Marko <peter.marko@siemens.com>

Per their Debian status, they are fixed in tag n9.0.1.
All these have git hash as fixed version so it cannot be compared to
in Yocto cve-check.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
index bb070d75c5..af92a0b0df 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
@@ -181,3 +181,6 @@ CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2026-58049] = "fixed-version: this CVE are fixed since v9.0"
+CVE_STATUS_GROUPS += "CVE_BACKPORTS_v9_0_1"
+CVE_BACKPORTS_v9_0_1 = "CVE-2026-75141 CVE-2026-75142 CVE-2026-75143 CVE-2026-75144 CVE-2026-75145 CVE-2026-75146 CVE-2026-75147"
+CVE_BACKPORTS_v9_0_1[status] = "cpe-stable-backport: fix backported to v9.0.1"

