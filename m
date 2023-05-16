Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C7DC7EE24
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:30:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.29649.1684261818627635794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PPOAAusX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7505B60007;
	Tue, 16 May 2023 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684261816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Y10Z8fdZaqGIb2sbSo5dPJAyQXr3G+41DCwJLJejG8=;
	b=PPOAAusXrJMu7sL4ePAO8vMb63rQpUzLefarAwmSPkTYVZxFuOhdoDuJoScfUyyVpo4+hc
	NfjqwHK8qaY51n9rnjszH2cA4E2wvXGNwY5HoAN0+qAJwQQuILNSlWK1EUkwN3ZiPu7xNx
	U22q6dsdn2YzjxfI6w4nqsDixiFZWZUWskIhKoUu+VH4pqgP2h9HLIENch4+3D5VdE9WmH
	8yLZ9AtBdbE+1GPK0ro7QhcU1wSsdLOjN4KjdWNiucZhKW4MmXaqA3XDOOyAaAWRafSede
	rIBqw+T+C4Xx4rCJjZbuKCbcctU9LvZtDxRyncfttZcCbpQSQTAxD/TEiMCX1w==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] alsa-lib: upgrade 1.2.8 -> 1.2.9
Date: Tue, 16 May 2023 20:30:06 +0200
Message-Id: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181408

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../alsa/{alsa-lib_1.2.8.bb => alsa-lib_1.2.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.8.bb => alsa-lib_1.2.9.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
index bf968c920b..a8bf09904d 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1ab01b74e33425ca99c2e36c0844fd6888273193bd898240fe8f93accbcbf347"
+SRC_URI[sha256sum] = "dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


