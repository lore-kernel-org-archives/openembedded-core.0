Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE0CC54E41
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 15:03:33 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.27277.1709219010845134070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 07:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Sc9qbMm6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D43AC240008;
	Thu, 29 Feb 2024 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709219009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rYHR62IF/zlphKoxUd3ixyyrY1VHYZsBu2o0ESBYpe8=;
	b=Sc9qbMm6rNhThfFedUUFEedBUdk1AgNpW6awhpIfBxVNaFg0SFwfrMQZKXnLeETX0yyYND
	RDWpW63uIam4wRQDMlny2TbJTvJDTtkk/z0CJiRZ38ZcWgPZxSi33S+3TlxGowcbd2hSBv
	nOYWnVjpGbqDdYwXGQOr/H/0It7iNV3FOjxf79X38wYF41XfUfNPWjhb0hcxccv61RBhIa
	ISu/sMihvGZhCkTFJ+gNBfBN6NuSeZhXuStmPJDD0v9yXHUM//PaG3KPmPdTC/EKl6cynR
	eI71VWmr4lVss8NfryhnYtzz3o2ppiHs87alI8nYcbcII73eNiMOSw5BUJKbIQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] core-image-full-cmdline: add package-management
Date: Thu, 29 Feb 2024 16:03:04 +0100
Message-Id: <20240229150304.3643093-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 15:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196436

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Add "package-management" image feature to the core-image-full-cmdline image,
to support package upgrade testing.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/images/core-image-full-cmdline.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-full-cmdline.bb b/meta/recipes-extended/images/core-image-full-cmdline.bb
index 4e1cf58d55..b034cd0aeb 100644
--- a/meta/recipes-extended/images/core-image-full-cmdline.bb
+++ b/meta/recipes-extended/images/core-image-full-cmdline.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A console-only image with more full-featured Linux system \
 functionality installed."
 
-IMAGE_FEATURES += "splash ssh-server-openssh"
+IMAGE_FEATURES += "splash ssh-server-openssh package-management"
 
 IMAGE_INSTALL = "\
     packagegroup-core-boot \
-- 
2.34.1


