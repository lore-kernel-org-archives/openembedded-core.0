Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFAFC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 19:41:11 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.19981.1741376467923205385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 11:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=j/sySZ/3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250307194104206f5e07a54a418d08-zllzwv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250307194104206f5e07a54a418d08
        for <openembedded-core@lists.openembedded.org>;
        Fri, 07 Mar 2025 20:41:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=59TO8CwPZAjOsI/oNzIvF7TVqvKNnHR1JSJd+AlTxsw=;
 b=j/sySZ/3Bq+ZeF0nsPf+Xwax/tWHZLn+17YF1nBrtmTUAPJwiDjxxslHNKwIOIHI/jVsfc
 sQxnOdf2JlKu0kBal7AnCITGRSn5PI0NJbqmAhnrgoAzsg9nNpTyK+p6mvvxlXhWe6jIymOe
 VIdZGI9hKHwPmGFXRo80Z1y2zieXPt6521wsnVtk3nizu3dCZNo2IPmy9LbjuKvp1EvnYTEZ
 YfOGgjhzx+ZNKF5YD2SuoNMMuvnLB9RKD6zPjYopQaxeI95D0dBB+6vTHyuceLmwhmzu0W88
 /JWW65Mq4BqZ5YAM2LqIPnbdWiMjd0HqZ4JmaR9vd9dyX1c87UZcL7AA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] puzzles: ignore three new CVEs for a different puzzles
Date: Fri,  7 Mar 2025 20:40:12 +0100
Message-Id: <20250307194012.10982-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 19:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212463

From: Peter Marko <peter.marko@siemens.com>

As we just match on product by default, ignore three CVEs which are
for the "Puzzles" WordPress theme by ThemeREX (CPE themerex:puzzles).

(From OE-Core rev: 87326573c82ac1e8dc335319442236ef2341501e)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted to different kirkstone CVE_STATUS format.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 0104f2672a..436d444896 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,5 @@ STOP
     done
 }
 
+# cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles
+CVE_CHECK_IGNORE += "CVE-2024-13769 CVE-2024-13770 CVE-2025-0837"

