Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC42CC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 21:45:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2637.1707342330548318082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 13:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eYSWPl1v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1385560003;
	Wed,  7 Feb 2024 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707342328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYbcEo063N795jQQOnqrGAXWCrpPq/OVnFktIs79xc8=;
	b=eYSWPl1vUOsdj15vBoLRbqqm6FGRNQTmCKejsFi/ZuI9/vK/Clxc5yXiaBRWMm5h+Xl2s0
	s3tusNjdU+PHUqcz2nHSOhhMMAZMSYVkaCqq0DDhDJXtdMWXaie4F8JLcbQEx2uRSBuvt+
	JwrQFLR1Z58yOQOiszPgwX91m6+F7snCYcDCft9budqV4pbGC3OivBItEOvDdyZjC8XkFC
	gzWXabfkZmtIHt+0owCCu0cK27R/WAVo7y0GS2e001RSHskB3ANsd9buPY5n2o62x0ytEq
	4W7aHbm/1wkSRrr6DhA3N7JaqThUX9MbfktMDtNdQ2SUCsgUC53oAXORzpHyFQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/4] alsa-ucm-conf: upgrade 1.2.10 -> 1.2.11
Date: Wed,  7 Feb 2024 22:45:06 +0100
Message-Id: <20240207214507.3603517-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
References: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195082

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Upstream release update
  See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11
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


