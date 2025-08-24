Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DA3CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:06:41 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.17329.1756044392356069030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LkWRqHDQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250824140630e3f5c157ebef6196ed-oi4klc@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250824140630e3f5c157ebef6196ed
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:06:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gLNFA3W9QkqxqsXe/azt2ceXSqVo15xAA9CMRrwIbMw=;
 b=LkWRqHDQsiOB0a5/ZEHq6KfPXy02qrUXcnEw21k4vjIEcOcXm4ZzVIHrg0VBISt5c/kPaT
 e3IgX6rkeCEN8IQ7GHdIDF6v1tKlig5pZzQJ4RBbsUi6Q6tPj1x39T/nFez24YWOoCD/K+Ea
 Fa7SgaVqlv43atfaVkgbzob2zsbyQ1cJCIJYQjtHqkpgDJuaZuFIZNw+QtK0Pp0sRkqNxqJ6
 r8DraxrIBAAjshnEhDrUjeKY83dYuM3yfF6BtRErPDvt7H4Y4Y573r9Xhz89PGDiQeGRJ63c
 PjKmCnboGxURTa4yYwh9Y6tImmJPb22qIDaop3hESmSAqPO3JsoGENKA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] go-binary-native: ignore CVE-2025-0913
Date: Sun, 24 Aug 2025 16:05:41 +0200
Message-Id: <20250824140541.1095321-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222379

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
 

