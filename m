Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39473C04A6A
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 21:17:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.199.1691183858962744888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 14:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M/RVp+rM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD63FFF803;
	Fri,  4 Aug 2023 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691183857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VU6hS+89jNF++DRGElMx2JckmBZzy4HTeH3nyU3gSig=;
	b=M/RVp+rMI8Ui6R7P0vkMD6wfejoWKtQN5FnItrmqgqJOSdPGwRkHBMMpLvJwFmrj20wOjm
	kL840sAqHRf/BbD15wW1in4p43E7/bgNbA5I9qdP6WWC0COm/ph6d+kbVZmcUyP/oRi9qg
	Z+XLhIwy3+D+5ZgJx6qoMAb1wdkaWPL8Csr3WtDUsfeRjtpbnP++eVtT/R5pINFwUSrupc
	UzPcuelOsad/+kFpzE8n6xGrgT3X38NN6Db93wf/sqPI+4IIatADyHYlbEYkNK5UHPRKWQ
	AdEUD6gw5dnZi/ODVDm9SSDJQrPl9DVEjGgUI2OyMZqFXgIYGPPqiSXknYQRdw==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] base-files: bump PR because conf files are now sorted
Date: Fri,  4 Aug 2023 23:17:22 +0200
Message-ID: <20230804211722.238452-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 21:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185542

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ff83567bd919..0d38657c6208 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Miscellaneous files for the base system"
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r89"
+PR = "r90"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
-- 
2.41.0


