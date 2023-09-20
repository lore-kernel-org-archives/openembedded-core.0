Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2E9CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:15:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.33289.1695201295225407363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lzOJHfkq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 482476000A;
	Wed, 20 Sep 2023 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695201293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IkQK9x/bexe4ZG2NRp8zRSpk/Nf+oc7xCpv8Zas/kzw=;
	b=lzOJHfkqHNudwXRIxi/77ZUQTzYEvLm7k1acgekSvIQMdnYWfyk4H+taGwaI0xnBLqs8RA
	opRt0lNAWczJuahtZ90jrXcvUh8uvXjGrIlDCXkEe0Tdho6IC1bXLB5ciR8t8J3qxfNKh6
	S6Wafdlmg+ZXwbGBn9sY5IxvkxE6PTXoGgcKUkW03KhZHlX3x0K3GDRtyxWZXsQli7bBcL
	zlHcxVIFcw1GLOHvL3LluqTVYhAxk9cG6p+7zqBlLPA1dRpYKYfRRLll73lwA4A1IHUZUU
	O8zgOjv/yP7P4P6Ev1EShigC5EhvrbXhBPQmNRaMDTPamZij4vQZManB1W1ceg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] alsa-lib: fix patch Upstream-Status
Date: Wed, 20 Sep 2023 11:14:33 +0200
Message-Id: <20230920091434.1452002-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 300
X-GND-Status: SPAM
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187906

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Using "Backport" instead of "Accepted", as instructed on
https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...1-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
index a75300f51f..9a7ba0d847 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
@@ -13,7 +13,7 @@ control.c: In function 'snd_ctl_open_conf':
       |                                    ^~~~~~~~
 
 Fixes: https://github.com/alsa-project/alsa-lib/issues/350
-Upstream-Status: Accepted
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c]
 Signed-off-by: Jaroslav Kysela <perex@perex.cz>
 ---
  include/global.h | 10 +++++-----
-- 
2.34.1


