Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95007C369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 16:59:12 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.14574.1746291542911023982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 09:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bCefPFhs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025050316585983fb15ba6bd2cce899-fb9jqh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025050316585983fb15ba6bd2cce899
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 May 2025 18:59:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=u+e5viFfD6uEO1uVqyi+1M0miRLlh74kvvxUVFW12Q0=;
 b=bCefPFhsODb5KQJWlmtzfz+XNa8E+4gQOzS4VL7kkEozwuPdtWyEGEjPlwKGzja9DKnRBq
 YBEk4t+IokbmiHuC8Yvm0jy1Xk3sF6W2QlVEdiy3nrC0PJVFNg2HfftQV+bO6zs2a8heCWsT
 408YeaRxa/Od2Sdq/T51NaZmXxBQxOsFwLZPv6m0FqD6qnb1/ep+Km0EBYO08mevfbA/4cAB
 vgJsSN5VqgYUGrWiY9Tey0Wj8+1YCcE9dvjG4AOw/JQ6DZq1wW+Vy1br7OTSVQg5hutg3ToQ
 Xy0wz61wBYASXoAElpn0+kgfMbAI2C+im5FP71VnsaDOc1/weyYpg94A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] sqlite3: mark CVE-2025-29087 as patched
Date: Sat,  3 May 2025 18:58:02 +0200
Message-Id: <20250503165802.680253-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 16:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215933

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
index 4e2ed5f1e0..b8225b5069 100644
--- a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
 FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
 
 CVE: CVE-2025-3277
+CVE: CVE-2025-29087
 Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

