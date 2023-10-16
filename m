Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987BDCDB483
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 10:41:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.117523.1697452867605696012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 03:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8779CFF80A;
	Mon, 16 Oct 2023 10:41:03 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] recipes-rt: update README to match newer override syntax
Date: Mon, 16 Oct 2023 12:40:51 +0200
Message-ID: <20231016-dev-compatible_machine-v1-1-1cc9567d8d20@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: foss@0leil.net
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 10:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189284

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The override syntax uses colon (':') instead of underscore ('_') since
Honister (3.4), so let's update the README to use that new syntax.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 meta/recipes-rt/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/README b/meta/recipes-rt/README
index 7d7558de49..0144d68b70 100644
--- a/meta/recipes-rt/README
+++ b/meta/recipes-rt/README
@@ -10,4 +10,4 @@ If you are creating a new BSP which should use linux-yocto-rt by default,
 use the line above in the $MACHINE.conf in your BSP layer, and specify the
 following in a linux-yocto-rt bbappend recipe:
 
-COMPATIBLE_MACHINE_$MACHINE = $MACHINE
+COMPATIBLE_MACHINE:$MACHINE = $MACHINE

---
base-commit: 9dc27f922f7a1eae448b9a0ffa35a85f71e58735
change-id: 20231016-dev-compatible_machine-dfa2e1a9700e

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

