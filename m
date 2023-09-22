Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812E6CD4F55
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:29:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.18675.1695378574854829592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HP7QMayj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40346FF802;
	Fri, 22 Sep 2023 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695378572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nkwWiJxxgC9fZh7+y+y5fJIIDdF5IB0iuDPt6pXndRo=;
	b=HP7QMayjUnJfIujaLht+5rjY5dqQVDy4YpB4oBA/+IqiR1M5EviO2eTC9G/lipTLmSQhiN
	9CgN5YlDCQx3RJ5n+/cESiwOtogePHYmTYAgaPEDaTwxPy0wD8QHa4d+FWbg25mCWPeWvv
	4/sknEkCy5xrnYcgpiuG7hh3Q0PBSFn+68DQTj3jD6Yw7PrNb3mZB5mypY1Y9F/PYcwjzL
	aSnLziAFjinnMguKHnXOpz+UJP+6bmVYJcoGDvOVv4/wF37MYmOLOJ7JCpuEm+79F9w024
	48xIiAEOWgjH8dFViESv5STRLHayC42zO0ZgYosnW+wJP7tFDTNDp5iyLCs/sA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] maintainers.inc: add self for flac recipe
Date: Fri, 22 Sep 2023 12:29:19 +0200
Message-Id: <20230922102919.1341896-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 10:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188094

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e977c84fc8..7697324335 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -173,7 +173,7 @@ RECIPE_MAINTAINER:pn-expect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ffmpeg = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-flac = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-font-util = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.34.1


