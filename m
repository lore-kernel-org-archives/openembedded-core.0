Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF66C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:25:05 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.1446.1643423096684358192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OKGHjztu;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643423097;
  x=1674959097;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1A+gd4TbOdFUe+eSFP/3JBSpe7NOWF2hPSXnHc4x9KA=;
  b=OKGHjztu+18BnJf/9+DT2wnMynMKgyPVv3QR6w+UeflvwEvHI89du0mx
   Rdj0MMm3NelFLppzh/p8mu5sDBLBKi8SRzZ9si6uMBQFfyxq8vywagd1h
   2ir+jeQU8+EUe6UM23YGzPF3fmHTKMjpwPrLNoLsjIC0XrM9TMHGad33J
   GZZG9VBpOwZj5c9YxrIaSmWJol2nMCabk6VCYkpOQ2hGXugRefqfvexB1
   9xq0yCl221OThhN1paY9noJ456VuHrNFMWgXHwgnLGd6tIQEVgTYz6EoG
   uPcLjoZcTMK9+CHGfDOUzi+ny9peRTCyb3SQolIY5AiaTy9HOcSjfS6pD
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] sstatetests: Correct a typo in a comment
Date: Sat, 29 Jan 2022 03:24:26 +0100
Message-ID: <20220129022426.15872-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220129022426.15872-1-pkj@axis.com>
References: <20220129022426.15872-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:25:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161093

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 96b2d115ed..3038b40021 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -177,7 +177,7 @@ class SStateTests(SStateBase):
         # QA checks for this test. It may report errors otherwise.
         self.append_config('ERROR_QA:remove = "version-going-backwards"')
 
-        # For not this only checks if random sstate tasks are handled correctly as a group.
+        # For now this only checks if random sstate tasks are handled correctly as a group.
         # In the future we should add control over what tasks we check for.
 
         sstate_archs_list = []

