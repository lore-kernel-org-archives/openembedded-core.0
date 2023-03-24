Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43D4C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:31:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.104503.1679671888608155564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m+AM23Rc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 944E5FF809;
	Fri, 24 Mar 2023 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679671886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CWUwpsSLzWaLNSJ2FZa66rLDyDndSj3k2PAalms6ok0=;
	b=m+AM23RcrSFMN2F5uI9LtNxbXUwgzQ/atRObbsHnfDvt8/CjAgVRxfU+3oFWw7noMvHk4w
	XK3H1NigtmfG+TJHyZdbJ6+oNZz2I0Z974UmVo/ZlrR41/G33I4sVVaHeV+PLMpzS7cDtz
	qad2ndWmWLodJagkBj6Lj48dUo6x0EtcrviqTAZHpRV2zq27wo/Sqm4IJaNKcAb3idHZN6
	kXwQ/4ttjBCNMbW7/F3qjFTBumXoFuvEjmhYq7xB6IEoXQ2LBMXszJ0rHQym8a2trVQPo6
	my8wjNW6xONpMqBmTzfBHiXOuVhAGmyT73l1WtZwXsGen+9Mu6xgGk530I9DLw==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] stress-ng: upgrade 0.15.04 -> 0.15.06
Date: Fri, 24 Mar 2023 16:31:20 +0100
Message-Id: <20230324153120.1126449-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179068

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../stress-ng/{stress-ng_0.15.04.bb => stress-ng_0.15.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.04.bb => stress-ng_0.15.06.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.06.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.06.bb
index 74d8356812d5..31cf2e8987bb 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.06.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "b9a437ec790ad4bcc71d31b2df39d4a601c55fa8"
+SRCREV = "f2a80e4fdba0aaf71d7d3687acb34e3827e68886"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.39.2


