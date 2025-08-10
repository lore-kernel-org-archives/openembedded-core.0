Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70890C87FDA
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 08:19:47 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.22526.1754813982004766219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 01:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XJKQD5op;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025081008193988fb357f33976eb011-nvw8_f@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025081008193988fb357f33976eb011
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 Aug 2025 10:19:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+L83g08TMxptzg6ojvGV5dd5f7nhLId10nC9EvhrBIU=;
 b=XJKQD5opjaXYQI4ajDr3X8bgUx/YPOcdsFP8uqv8QGXSyBXIFTil/lqH7ilfKFwtkf5IRW
 sx85uA/NQ4fvSYZLLp17UXgVfS60W5M8lbEgiMO6u4wPEnhagJiROcjqYOqlfV7yEIUh9F3t
 qR0HRxWh+3ZXUS6UEfWuM2PAdjGcm1u1JeTP575kv0bAEjEj05tuSbfBzPZarOgdML8gJlV7
 IuCYesBVX35J18F8fMf5Y2aVz88zzVk6krY2Naz9M457cmVN8/mU2fNb7OAT//MRAkmuZ7d0
 ogC/2EBuHQN0hofSR+H2hpwpZn645KJLExEuB4jmkggdV7YKfQqZL23w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] go: ignore CVE-2025-0913
Date: Sun, 10 Aug 2025 10:18:53 +0200
Message-Id: <20250810081853.11729-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 08:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221695

From: Peter Marko <peter.marko@siemens.com>

This is problem on Windows platform only.

Per NVD report [1], CPE has "and" clause
Running on/with
 cpe:2.3:o:microsoft:windows:-:*:*:*:*:*:*:*

Also linked patch [2] changes Windows files only (and tests).

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-0913
[2] https://go-review.googlesource.com/c/go/+/672396

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 033f770f64..36356349d2 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -73,4 +73,4 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 CVE_CHECK_IGNORE += "CVE-2021-29923"
 
 # This are specific to Microsoft Windows
-CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284"
+CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284 CVE-2025-0913"

