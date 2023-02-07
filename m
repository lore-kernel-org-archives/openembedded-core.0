Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF79C64EC6
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 14:31:31 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.84654.1675780288070299416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 06:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pPP0I-0004wL-4F; Tue, 07 Feb 2023 15:31:26 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPP0F-003J4I-Vm; Tue, 07 Feb 2023 15:31:25 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPP0G-004lTJ-By; Tue, 07 Feb 2023 15:31:24 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/2] recipe_sanity: fix old override syntax
Date: Tue,  7 Feb 2023 15:31:14 +0100
Message-Id: <20230207143115.1135748-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 14:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176816

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes/recipe_sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 1c2e24c6a176..a5cc4315fb86 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -16,7 +16,7 @@ def bad_runtime_vars(cfgdata, d):
     for var in d.getVar("__recipe_sanity_badruntimevars").split():
         val = d.getVar(var, False)
         if val and val != cfgdata.get(var):
-            __note("%s should be %s_${PN}" % (var, var), d)
+            __note("%s should be %s:${PN}" % (var, var), d)
 
 __recipe_sanity_reqvars = "DESCRIPTION"
 __recipe_sanity_reqdiffvars = ""
-- 
2.30.2


