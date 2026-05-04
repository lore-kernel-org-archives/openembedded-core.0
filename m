Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F441CD3427
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 19:53:37 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23691.1777924412817976445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 12:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Y3JHl9+M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260504195331ec72fb5a6200020759-n2s_yl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260504195331ec72fb5a6200020759
        for <openembedded-core@lists.openembedded.org>;
        Mon, 04 May 2026 21:53:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ms0fGIFyk8GVg4pBsdxtFhrItHtQ5A5iZ9bBSMSxWrU=;
 b=Y3JHl9+MW10nVKmEeBeMfYrCzd2hZe7GcS34/E3jCOYxVQvReUkldhXw/mp3nKhuBs2cKz
 2wyGOAOTgpZqNXaaAIH+UsvxmBxmPsVr7251wtJNH7m0QKViZ28wJpGeQMFG3NPf/2zMbuqS
 BsDgTxcL68ynURupkRIQa8wdRG7ZaViRRip8irqhOxYBPurmajgOEo08mwaORHAYiZX8Fq50
 wUO+L89Z4Fr79Xab2/bvO8h6vlR4JDbvbWjxYS4S9Z9domAHGSuPTujMT6aLk5ZDSqddmOgK
 VVsD91++Ed56s8fr5eFvLYtcS1lcF+MHO1SVwpwzDUlyyta5XP5pWgjg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/5] libarchive: set status of CVE-2026-5745
Date: Mon,  4 May 2026 21:52:46 +0200
Message-ID: <20260504195246.1190112-5-peter.marko@siemens.com>
In-Reply-To: <20260504195246.1190112-1-peter.marko@siemens.com>
References: <20260504195246.1190112-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 19:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236457

From: Peter Marko <peter.marko@siemens.com>

Debian security tracker [1] links Github issue [2] which points to PR
[3] which has been fixed on 3.8 branch with [4].

[1] https://security-tracker.debian.org/tracker/CVE-2026-5745
[2] https://github.com/libarchive/libarchive/issues/2904#issuecomment-4257068822
[3] https://github.com/libarchive/libarchive/pull/2905/changes
[4] https://github.com/libarchive/libarchive/commit/8c04ac3c91841cdf75dc9de4a405cd7c69

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index 577362ef8b..e8c3a3bfe3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -91,3 +91,4 @@ RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
+CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"

