Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F1CC28B23
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 19:42:11 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.20000.1741376522285171002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 11:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TU4rq0+u;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250307194200dee672631bdf4c57eb-bwqxz4@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250307194200dee672631bdf4c57eb
        for <openembedded-core@lists.openembedded.org>;
        Fri, 07 Mar 2025 20:42:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4TJCmGnXi3nd6RDqNS8DMUpC1W1xf+BhsJIZK9sw+Jw=;
 b=TU4rq0+u4IofaTi3bT0l+naXRYliDZj4nSmUSqlMeJPSUisASqzNQ3UMl+ffHpzNZGnjGH
 YYbDukt+E88E5nJAfX+gXXWVpq8BPn9GZe4h2bUWumbK3ti7C2tTEHdiVq2oLp+cmthlQSjw
 aKsTSmExUhLZHIm4qkjuc0L4YS97Iz50rMnq3OSwBKIxLO0jk7UbMGKI+H9ax4/DyobMTdQ5
 c3Zqhq6ZUqAMehydE0br6mhDZsfJHCxauexYuY7dCqW3YrIFBOeCemQ/wLCH8Dc0wr3YM3Kv
 NSZ5Ezk+P4IO3NeH3Z3Zm4YHsczq94whRg1aqQo2JDjJ1ZdJXSqEHedw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] puzzles: ignore three new CVEs for a different puzzles
Date: Fri,  7 Mar 2025 20:41:03 +0100
Message-Id: <20250307194103.11040-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 19:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212464

From: Ross Burton <ross.burton@arm.com>

As we just match on product by default, ignore three CVEs which are
for the "Puzzles" WordPress theme by ThemeREX (CPE themerex:puzzles).

(From OE-Core rev: 87326573c82ac1e8dc335319442236ef2341501e)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index e9403ee130..48886b3039 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,6 @@ STOP
     done
 }
 
+CVE_STATUS[CVE-2024-13769] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2024-13770] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2025-0837] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"

