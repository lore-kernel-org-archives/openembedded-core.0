Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6E0C6FA86
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:47:26 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6663.1663850836619751898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=amuKTIV4;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1663850837;
  x=1695386837;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1HJoK78qts8h+R4qpV8nAlYAJ+xlfORk7hYYXnWuyfM=;
  b=amuKTIV47nAvt9//9PSHe2LHLtNUaXLlF5MVmlLv6nGZ0qjKO5e8WFay
   uVsdbjZF5Iw+vQVWdLGZwcz1yEzkn9De9zqctYKXE9OAiB2EAKq8ey6tF
   jPEVBNiXt/CryZlhqVrRYc5xfQ8GhN6V5CYlOhiNFA+2ROGSYen2hLUAP
   VwmZjt0nX7RfFIIv+g541VmJOR1PtOfewPSgM+QS0Txn+fwxUKjxfenxD
   6Ib1opf51+TZRW/k/n9rzaictiDMbu+8hQJ28DmOgL8knD9M++r0JaGOb
   Jbd4nUjf8julAoFkQlJH+Bx29sN4zzWdr6FZlpXUR2aLowgHXnt8c7rXx
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] .templateconf: Mark "meta/conf" as an invalid path for
 templates
Date: Thu, 22 Sep 2022 14:47:07 +0200
Message-ID: <20220922124708.2218995-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:47:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170978

Previously this was hardcoded in oe-setup-builddir.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .templateconf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.templateconf b/.templateconf
index e399e06acd..8e4a9ebdc6 100644
--- a/.templateconf
+++ b/.templateconf
@@ -1,2 +1,3 @@
 # Template settings
 TEMPLATECONF=${TEMPLATECONF:-meta/conf/templates/default}
+INVALID_TEMPLATECONFS=meta/conf

