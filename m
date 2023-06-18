Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994B4EB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 21:26:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13909.1687123583315062840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 14:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G7bT92t9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687123581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8+VkUdxV7BEkvX2jMHiTA9zypmoAUT+TgPEvOU+zulM=;
	b=G7bT92t9Js9F01rAeLm6puQcBnFrm3BVkY0iAxoxvQrkD3ekNoZbr91Nmxg3tmHLZLbsx9
	X4cYi6Dj43NAq4kcx1x9D1YD4ztPG81aPJEKJkbhF51HtKAuhUEPX4KdY4y0XQJhn6cufm
	4xCw78alWDunzqeXFTUoRXEN1E2n3GKmCeD3lP7ZibUdy0PaL/j7DFPA/1yO06OOFVOcFV
	M4D8XhUZTF8L/SFzojlsArKQdDHomCSlea3GNDNg9ype06nBSDKIgWY8WMy4+uJz0FFMTH
	fHQ/Fla+qA59Tgh5tRr2hEMvO8m88yownLfrb1Wruag7fkiM1dPYPRwZ8AR0WA==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D1DA40003;
	Sun, 18 Jun 2023 21:26:20 +0000 (UTC)
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] base-passwd: fix patchreview warning
Date: Sun, 18 Jun 2023 23:26:17 +0200
Message-Id: <20230618212617.232149-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183064

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fix:

Malformed Upstream-Status 'Upstream status' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
Unknown Upstream-Status value 'says' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../base-passwd/base-passwd/0007-Add-wheel-group.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index 00eaec38a294..d77122789d5e 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -2,7 +2,7 @@
 We need to have a wheel group which has some system privileges to consult the
 systemd journal or manage printers with cups.
 
-Upstream status says the group does not exist by default.
+Upstream says the group does not exist by default.
 
 Upstream-Status: Inappropriate [enable feature]
 
-- 
2.40.1


