Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6A2CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:34:47 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.1204.1760477683392758590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fMwILaIU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202510142134399d3d28d9fd00020704-yjcy6g@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202510142134399d3d28d9fd00020704
        for <openembedded-core@lists.openembedded.org>;
        Tue, 14 Oct 2025 23:34:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZIWCl6DPPrF2vcy5IPnH8PLcSzRAzz22SkpBzdeQoiM=;
 b=fMwILaIUvY05EYPMtiS5d7nTrCSvi31nEbdVvESpZ0lvNWBbCYOXTj3u9/SEOFpOvQogB+
 e1vM3SreJqXtvKJqMz47uyQcv2AY5oiKYjd8XXVVE0zDEqHvvbSbJErh8Yis0QFl8zIEiST7
 fkIxDKmcFCK0T4LP+E+ewigR8+JArnPpmVq8wXa2f7lK94Hun3BakmJe2v4kH0IfmnRkBBFT
 1NBEZlekCCdVIBwiPp8hm1bKne+JT4YoNqmVZU3zOFijxjPLvQOdy1iwfhJqC1jDauZmE32s
 ffvqv5uX8KORtiVPdJSqkJJE6U4y819s8PpvWZKR9rxOquZcavImnMdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] gnupg: mark CVE-2025-30258 as patched
Date: Tue, 14 Oct 2025 23:34:23 +0200
Message-Id: <20251014213423.587231-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 21:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224853

From: Peter Marko <peter.marko@siemens.com>

Per NVD report [1] this CVE is fixed by [2].
This commit was backported to 2.4.8 via [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-30258
[2] https://dev.gnupg.org/rG48978ccb4e20866472ef18436a32744350a65158
[3] https://gitlab.com/freepg/gnupg/-/commit/da0164efc7f32013bc24d97b9afa9f8d67c318bb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
index 9c5de263c56..a6e777abf89 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -82,3 +82,4 @@ BBCLASSEXTEND = "native nativesdk"
 lcl_maybe_fortify:mipsarch = ""
 
 CVE_STATUS[CVE-2022-3219] = "upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
+CVE_STATUS[CVE-2025-30258] = "cpe-stable-backport: fir for this CVE was backported to version 2.4.8"

