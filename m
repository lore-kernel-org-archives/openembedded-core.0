Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD331C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 19:42:51 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.20018.1741376570316339761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 11:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Sf/wBPRD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250307194248dbf0a67efda67174f9-b6pllo@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250307194248dbf0a67efda67174f9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 07 Mar 2025 20:42:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yjCf/4XRKHlBcsIvFOHLhOpHT50YmVCpVTRcx7h+rE0=;
 b=Sf/wBPRDq4sq1ECC+RNktEvPz6q0anAHMYs44/E+04dHdI78v0NzEFNbkshPSJnz8F83c4
 gzmSCZU4Q2Fkxlpr7P8GbUxoOY5XPreXMgE8KJptiyJcLrMY1Achp91S2jVbIFZBDj21q87+
 P+FEq+TwiukBm2F7sIPnswCnrEjBRWl6vS0RjXV+gMBJPAuzBgR3I4VypyZv6RE9yksdK/Q+
 LUtllOfR7h4jF5UZgr9apuQQnQ2jb2sS3eeo1/HFkhP9koU15svPxhIVgyAqTmZ39q77PTb2
 X6Vfcq4tYSrBINNmsnLawY5TuVlfx8yd6ejTTNvOt5CjjDl85UDWtQzA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH] puzzles: ignore three new CVEs for a different puzzles
Date: Fri,  7 Mar 2025 20:41:59 +0100
Message-Id: <20250307194159.11091-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 19:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212465

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
index b47d3d3f30..be61abad50 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,6 @@ STOP
     done
 }
 
+CVE_STATUS[CVE-2024-13769] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2024-13770] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2025-0837] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"

