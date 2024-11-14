Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1341D68B02
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 12:49:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.36486.1731588542259656012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 04:49:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IiPVeKiY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DADEC1C0003;
	Thu, 14 Nov 2024 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731588540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IO+xWTbxwK90HNKtZCZAmEt8rxmFLl7GUyCRZOn0eTk=;
	b=IiPVeKiYjgYG0nXv04917c8sWcLP2REhHNxWdkkEcJQlWoKpQKzclmnm4CHqg291jkx8s6
	uCNCNWZoExEV2wVyyllk4m69Er7Y9MRdZ54AbV1c1fxel1I1E4AlZ2qpxzKB9bXGcLQsgC
	+E8ldsTBY/ULSdLut5E2ct/xJrvBGOoVBoxHsvBvGUOMffna8VgxTEHHniAzAC8EgxuYR9
	OkXfGHnRHGEIuWbuzGZB4CE9LZKJar+qp8Jfyr7uJecEyiNj5WnaF4A9yR1TG7W/J2oIGg
	leb3qJVSkhmc6wS8tysiXjj9NY5UqICWm3UNhCFeTLeX6FfZRRJSM0eZchXg2g==
From: mathieu.dubois-briand@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH] systemtap: Add git revision to PV
Date: Thu, 14 Nov 2024 13:48:56 +0100
Message-Id: <20241114124856.35716-1-mathieu.dubois-briand@bootlin.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 12:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207157

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Systemtap has reproducibility issues, as it relies internally on git
describe. Make sure to have different PV when using different SRCREV, to
prevent possible issues.

Fixes [YOCTO #15288]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 80945ad7f88e..3467e2cba697 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "3a0c9c15163520dd0d9ab07177da62ce9cc2332f"
-PV = "5.1"
+PV = "5.1+git"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.39.5


