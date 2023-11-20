Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289B4C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:12:45 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.17229.1700518363133524277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OiRwI0Vt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2023112022123940dcc89de33be5ae77-ewqg_x@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2023112022123940dcc89de33be5ae77
        for <openembedded-core@lists.openembedded.org>;
        Mon, 20 Nov 2023 23:12:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=43T4xStfIY1d60eP9zLU8CYIHFVbQZ4gURA4cZLJIEw=;
 b=OiRwI0Vt1l10yZF/yf5oawbaJBK3Pq52hXQ/yhCu/L6n7AyKQ+OtbWE1WVnSruO3G+f+gK
 aEam3ScpLlwijA94mCwBcxFOiyoJXQuXcch7qf17Np3dLNu1BeF293HT7sEUMHm0gWr7WE70
 BXOVABkLqZfOgW7y++pKxoANtvog8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] go: ignore CVE-2023-45283 and CVE-2023-45284
Date: Mon, 20 Nov 2023 23:11:54 +0100
Message-Id: <20231120221154.139701-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 22:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190938

From: Peter Marko <peter.marko@siemens.com>

These CVEs affect path handling on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 461819d80f..a0974629fb 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -54,5 +54,5 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
 CVE_CHECK_IGNORE += "CVE-2021-29923"
 
-# This is specific to Microsoft Windows
-CVE_CHECK_IGNORE += "CVE-2022-41716"
+# This are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284"
-- 
2.30.2


