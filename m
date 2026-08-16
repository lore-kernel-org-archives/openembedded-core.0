Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002ACC5DF6D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 18:42:40 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14980.1786905749908570734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 11:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=P0P1hs3f;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202608161842267e1d8e90f5000207fa-z1fiym@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202608161842267e1d8e90f5000207fa
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 20:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M8O0+7nowAvuyGwJnl55MKHMGRWyeBQzDFperVcmxNQ=;
 b=P0P1hs3fjYgbO4gAW0lh+IB4lSlS4Ag1XlK0bzDH3bYFgSw61Z/L4AnzzAVPnEhmocZmPr
 OwiJlxS3utA+rW0Pf/fH38wK0dR2PRfYx1Hm+yrX7ho/ODtmRGn5/Spr5dM3h8kCyzovqGRk
 LMRMnihcfTpR2H3AHyMEx7XeSKbitONtMvICvnmuSqSWFRHOtacxmyZ0zlY2QuzLWPS9JFt2
 XLWASDdJ5gJ9caBojub68Duoe4RhDd34r7u1BOcWcqarwrhzRkK8fpK3VIGLSRFoPTWW2zbD
 o83NxGiTIQq0UxtJfz5+vkzxj3IQQ8T+TdqVfDUB7q4vcUvJS1dqljhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] scripts/esdk-tools: remove broken link wic
Date: Sun, 16 Aug 2026 20:42:14 +0200
Message-ID: <20260816184214.3096165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 18:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243545

From: Peter Marko <peter.marko@siemens.com>

Commit b9e2a2f584376076c4552bef7309c81b9fe986c0 removed wic from OE-Core
repository, so this link now points to nowhere.
wic is now used from recipe sysroot so this link is obsolete.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 scripts/esdk-tools/wic | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 scripts/esdk-tools/wic

diff --git a/scripts/esdk-tools/wic b/scripts/esdk-tools/wic
deleted file mode 120000
index a9d908aa25..0000000000
--- a/scripts/esdk-tools/wic
+++ /dev/null
@@ -1 +0,0 @@
-../wic
\ No newline at end of file

