Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30D4E71064
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:26:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.15408.1695299191366627356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 05:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DjxO+bCF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BB3B6000A;
	Thu, 21 Sep 2023 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695299189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5VjT2XIIwpmgn0LN6fdHVoggA5vBOConsLlZIzyio4=;
	b=DjxO+bCFKs346s6mIElTH7dYL5oZUXV2ByoXPxN/Vqz8AVMg4oYpZdoXd4ZuxBkKaL34kd
	W7Q7bPGkWmmPu75RspUPYJV5RaCR/7o/cTqhKgsZTv36S+4UGNQPAAU1KgdpGBtPt19T+U
	47li2wkuE5h5Xjhp1bdj9dgVWIkmiKI/fWPQ0supgZG7rzff1shcWYYFYLYt1prOiBiMVy
	yBrZsl5KaAifgXTiEDR6xtMA88nyn8pfgRzy00mnfLF2gSltp7dRY4DhiNyAYdAggJ9Z1F
	VVG/haQ/Pt5m8MENmEP8gH2G7hb5BT6Q6W69xu1wjXLiV0OB8CnCGDYvmOzdNg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] lib/oe/qa: update guidelines link for Upstream-Status
Date: Thu, 21 Sep 2023 14:26:12 +0200
Message-Id: <20230921122612.3287830-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921122612.3287830-1-michael.opdenacker@bootlin.com>
References: <20230921122612.3287830-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 12:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187992

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/lib/oe/qa.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 94955f78ba..f8ae3c743f 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -217,7 +217,7 @@ def check_upstream_status(fullpath):
     import re
     kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
     strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
-    guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
+    guidelines = "https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status"
 
     with open(fullpath, encoding='utf-8', errors='ignore') as f:
         file_content = f.read()
-- 
2.34.1


