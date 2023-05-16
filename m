Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6788DC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:30:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.29738.1684261825223834781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EKBWVJjN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E9C6020004;
	Tue, 16 May 2023 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684261823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gcL3RxlOv/otvX8iW6yGaULPrSm6bfLv/89dXQcJAeA=;
	b=EKBWVJjN8StcgDy10989F/MRlgw8YwDv1j1e9zvIeXHyCZXPsieVEd+jTsUeTRYPzz/3y5
	oLEYspie22jjtyBtq3mZ9YoD/7huSiiaGyEU4GDsGVpYkhBwJl1bqp8nO2kK5pNvLPGefW
	mWJGCTfzMmlyTU69r1zLjOJfW61adQw1dKHSXckKEwZq9w3nUJuntpfgvBK2vmbrkBsnfT
	rtFhwsxzdKYTPSJf38wSGLOymoPw9Y/2KM8R3lG+fnJGApOm8fGM91KgevL/zjZAoaKoDL
	2qeL+4a+7iW5U3CFejFQwOkva5Ui6+ZVRPihuODumP+Q9f8zeKLJcFYPbDkwKQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] alsa-ucm-conf: upgrade 1.2.8 -> 1.2.9
Date: Tue, 16 May 2023 20:30:08 +0200
Message-Id: <20230516183009.1874105-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
References: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181410

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../alsa/{alsa-ucm-conf_1.2.8.bb => alsa-ucm-conf_1.2.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.8.bb => alsa-ucm-conf_1.2.9.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.8.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.9.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.8.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.9.bb
index d30b323a04..073e3b0900 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.9.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "fee4a737830fd25f969d83da46a2b231beb086efd966fcc07d225e7823260ae8"
+SRC_URI[sha256sum] = "374f6833bfd77d0a4675e4aa2bfb79defe850e5a46a5d4542a45962f4b9e272a"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.1


