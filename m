Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ED7C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:00:15 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.25108.1647439214146856936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FXl2L4b9;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 213E5240019;
	Wed, 16 Mar 2022 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647439212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7GGqL73j30xNH5b48dvZg7RLpgM8Nh50IfCgQouANtA=;
	b=FXl2L4b9dDHc3BCyAA9MqgeXcXSfXsZrfzBLIZSU8G0roAQ2HM2V0vvBwx89RceMkOLjKX
	lZwxWTEeDmLHD4/XRUV9CwWHnF237WZVpr1shiMqIFqWUj1RW6rcJLM1dCPU044+LBakKV
	+bACurBhQhbMjyubAlbcBNSh6yf+u1lY5mPpCUxBIF2UkAqS1HEzDiJm6cypOCiuR65Y3n
	kEzemLyyLS6rMs9VowBP6htdNga776jARjxOqT9ZYQHVCc29iTQziZnzV3wKIsj8UXRalb
	xNt7wyutNguBJGTacLYXAEnyJWJrS16oFWLdRUUL4adFdsUQAVEcfCT25T06Bg==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] convert-variable-renames.py: add more problematic words
Date: Wed, 16 Mar 2022 15:00:07 +0100
Message-Id: <20220316140007.184425-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 14:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163332

Listed on https://inclusivenaming.org/

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/contrib/convert-variable-renames.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/convert-variable-renames.py
index 856c001e11..304f5484ed 100755
--- a/scripts/contrib/convert-variable-renames.py
+++ b/scripts/contrib/convert-variable-renames.py
@@ -53,9 +53,14 @@ removed_list = [
 ]
 
 context_check_list = [
+"abort",
 "blacklist",
+"slave",
+"sanity check",
+"sanity test",
+"segregate",
+"segregation",
 "whitelist",
-"abort",
 ]
 
 def processfile(fn):
-- 
2.25.1


