Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1A2C54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:21:54 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1102.1747772509859627251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TTm8sx6b;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250520202147d3e8fb74bfc50d4540-9j_txf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250520202147d3e8fb74bfc50d4540
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:21:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WIsB0Ak1TGGUOT+QCbOVhOHQzLTOpeEfPfgA6hT+VR0=;
 b=TTm8sx6boExVhfIM9OwJ8xIlmzozZxdUmTm9VBZY2TzTf3oLHCs5OQM3nitzaPWI/noJ1m
 X9t4Jry2Ga1+ezT6oN/LmBnIWsrd+2NDGAHePmH4pTjaUrA6/EAeNw9Au/R1ZBV9rf33hKrp
 gcZCo6hsrd8tHjM3EdzyAaqc3Uwm8HCDQRNNQLiajdVxLhFHXuFwY6cYu8h1VZrhQf5rgd7S
 Tv+KiiAh5B/HkzIKi80SYbbRe+fy6ryxUY96v1/+OFaoCA8jcG7JCigMD0It1cKfDs/EcvLM
 s9OrNtMcP+J+K1oiANnmv+NCydelrR8cMhKuKqv+2gYziypjem7vmgig==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 3/8] sqlite3: mark CVE-2025-29087 as patched
Date: Tue, 20 May 2025 22:20:28 +0200
Message-Id: <20250520202033.2352749-3-peter.marko@siemens.com>
In-Reply-To: <20250520202033.2352749-1-peter.marko@siemens.com>
References: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216945

From: Peter Marko <peter.marko@siemens.com>

Description of CVE-2025-29087 and CVE-2025-3277 are very similar.
There is no lonk from NVD, but [1] and [2] from Debian mark these two
CVEs as duplicates with the same link for patch.

[1] https://security-tracker.debian.org/tracker/CVE-2025-29087
[2] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
index 8264d4443a..60da0b773d 100644
--- a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
 FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
 
 CVE: CVE-2025-3277
+CVE: CVE-2025-29087
 Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

