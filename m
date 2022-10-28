Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EB6C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 16:18:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.1418.1666973909960631953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 09:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hCixbnms;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 75F5E1C0004;
	Fri, 28 Oct 2022 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666973908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JL5e1Nh0q2oe4JyS3hpyKUsMRa/l9+44e3fqPLN57Fo=;
	b=hCixbnmsqm6AIm/srHdltMl8xJVCmN23DOVtG1Sd+EUjrYWgwmDYW/hAXNH/1A12do1s6/
	rLU7wf91TgWjDgoPTDgt8Zkogd1fLJBdGBBQYQ35xXKXqins/J8PbUFp8UJQL4/C6WOmz5
	avVrPI5PM3nQMI6tugRnSupwcIW9KK4kbQtOaeWRHWjFwn+gQM6v/zcv5C2eJv+U8PsDpS
	O4K0XjzO/7ftcSpb1dIfqbZE1PZjFOkx+3YQ2u1iKK7C92/Jz9YvWjvHZrCF4NwtMwnl50
	dZbCjKnaZTLecpkKE64/EJt94KEZP4Zmqx5pQiLSFCTA1aUS3a0IGNTh010V2w==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED
Date: Fri, 28 Oct 2022 18:18:26 +0200
Message-Id: <20221028161826.634225-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172267

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14948]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/create-spdx.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index c190ad3889..af6afcc653 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -21,7 +21,6 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
-SPDX_INCLUDE_PACKAGED ??= "0"
 SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
@@ -431,7 +430,6 @@ python do_create_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
-    include_packaged = d.getVar("SPDX_INCLUDE_PACKAGED") == "1"
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
-- 
2.34.1


