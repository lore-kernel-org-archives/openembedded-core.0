Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A63FCA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 13:07:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.16390.1756040862811777766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 06:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LysUGMsz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202508241307402109419fc8c76cfd3a-1plynj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202508241307402109419fc8c76cfd3a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 15:07:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gLNFA3W9QkqxqsXe/azt2ceXSqVo15xAA9CMRrwIbMw=;
 b=LysUGMszdoD98Sn5xDRoPnyubyK6QmqOUK80yUjGPhvoFwULbHQ4cnVh8cYzJuDwLcfJuN
 daTJslCfTwHOO3k+ehyhCLJ+iwvTqy6Mp0Z3hKk4+LpXA+9jCR4vIdk3PoOmPTdTr3dTocGe
 qhvXeQzAPiReRE9Pj2lUjlb0VlyF4NC90yO9VNpMLNSBlJZmig8EpzH3qQhLGjzK7qgphtxR
 XAHHV7E9JuzHr6ZWuMH3Mfk+3QndXiwNFGgiUtYBj7phivOIPvBeIlRc0YZjRQpJbiov/Yah
 wRdIguzXpO+osRH5puWLAwttM/VxVBRlV6DyggVx5QKoubLRVGypmT+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] go-binary-native: ignore CVE-2025-0913
Date: Sun, 24 Aug 2025 15:06:54 +0200
Message-Id: <20250824130654.1095026-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 13:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222373

From: Peter Marko <peter.marko@siemens.com>

This was already done for all other go recipes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index b15b60a691..7688a090f4 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 

