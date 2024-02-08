Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF92C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:44:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.13547.1707381858390492321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HsfnAiIT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5399D1C0006;
	Thu,  8 Feb 2024 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707381856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TbMGnNdczAMebU4T1Zo2uzKnnUmFVWZUtGLxfnRk1QE=;
	b=HsfnAiITYDt3O/WfraOuQyMZUCUE0HwkPH+o2LDmFTnog0IxwwUDDbCqFm8OS++UkSgjYZ
	SuN5hQ46JGcGzD6JMn+d9QwERUiaTLeS9aEH83iS1YMIJG8QbzzEujC2DXax6jEHQ4Cd+n
	mWFQOHt8H2ZjAUODbbPK+5q/j+uY/t4xvjaqvU83H48N9+cPzpW790j/BdAXfe0+BYgmLy
	FN10D5JzyIfR49D1W8uBOBubvafBbgPO0ahJXllDIxDS0PqPfmJOQ0dfvPIuxqfrb99Pun
	ZlXJL8FZiHRcHhKxFmjCQo2mFpw4JfkzWzGtG2Ne9ZZR4HPhC80vIIFXqcI+kA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 3/4] alsa-ucm-conf: upgrade 1.2.10 -> 1.2.11
Date: Thu,  8 Feb 2024 09:44:05 +0100
Message-Id: <20240208084406.3621627-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
References: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195117

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Upstream release update
  See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../alsa/{alsa-ucm-conf_1.2.10.bb => alsa-ucm-conf_1.2.11.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.10.bb => alsa-ucm-conf_1.2.11.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
index f4fd284db8..ce1a42c9b8 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "9c21e3f01ff00baa758df17e867cd36e24ebb41a6bec49737e99105e16f2ae97"
+SRC_URI[sha256sum] = "387c01cf30e2a1676d7b8f72b2681cf219abca70dd1ec2a9e33add5bf3feae81"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.1


