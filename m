Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A76BCE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:34:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.33564.1695202442642512559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TLZrwvd4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 062321C0015;
	Wed, 20 Sep 2023 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695202440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kv4TlwZ1wIi3x7MzXuG+LMpSZFwi2dKUk7rTbciytV4=;
	b=TLZrwvd4XV/xAurXrkUKJn3sBQBoOZxrwXIYrycXlg96YHH+1/z5u7Ro5oBNEuQnpKsbcA
	GkQYDT47L6oXNLjJFobnevyXRqSO+n5jx2GTfvlDIO/EZ+E7bEOAkJrhpEa/W8JPxUere8
	yP9bU+jMBdLu2NjnxruXmlzffsm8gODD68Mi/dkdHyYQvETOfvDM8uxSbQyD1MmpN828b5
	6Sbee/D9VJ33ni3hQjCfZ09sTJ9IKF+irpJUmsHQ+eGMd6tbLdzpvaviK2IX7KeIySFCof
	0HSvtI185jW7sZX4VAptCjKmEbFizgednK0so5alakfR42ESKDvqsuqBGnC0og==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] shadow: fix patch Upstream-Status
Date: Wed, 20 Sep 2023 11:33:22 +0200
Message-Id: <20230920093323.2020324-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187910

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace "Accepted" by "Backport" as specified on
https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../shadow/files/0001-Fix-can-not-print-full-login.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
index 37ba5f3dc2..89f9c05c8d 100644
--- a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
+++ b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
@@ -7,7 +7,7 @@ Date:   Tue Dec 27 17:40:17 2022 +0530
     Login timed out message prints only first few bytes when write is immediately followed by exit.
     Calling exit from new handler provides enough time to display full message.
 
-Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
 
 diff --git a/src/login.c b/src/login.c
 index 116e2cb3..c55f4de0 100644
-- 
2.34.1


