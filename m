Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EB3EC8748
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:55:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.37012.1694174138874068822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U1NlLaS/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 093B42000F;
	Fri,  8 Sep 2023 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694174137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gQevMkuDKujbxveYnkRHo8t1xA1gldwAzdh5MJG1uRw=;
	b=U1NlLaS/NSMIpCEuYp13aQMJzMFLmfHUJRgnYJiP+dHTF2Ittv+NE9Cj7diayE1lonR+9Z
	CVMs0+xOqvQktK19Cj5nKPED5d796I93q/6BHBSPWjktDiAEldQR7Ef3BpdV+hgMXUKvqx
	YDS2VV5BLPmqnG8+W3JfTHbURlLMhozMlocjcaUdF9IX4e2DjcPuqa/kDXVAJyJCVWC0CE
	k1ryG09q5o1nJnyq17/XS92fJ33QHqX1zHl7aqLEU+itNAVgOY0tUwNYPQO5NGMFkyPJ1D
	FDUrfGEJklaMJkNQX1vacp3egk7EMKDWNW4ozCXTErrDug7y4pbrbnJxtnGPog==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] base: add newline before LICENSE_FLAGS_DETAILS
Date: Fri,  8 Sep 2023 13:55:27 +0200
Message-Id: <20230908115527.297028-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 11:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187414

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To improve readability and avoid putting one
inside LICENSE_FLAGS_DETAILS.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Suggested by Ross here:
https://lists.openembedded.org/g/openembedded-core/message/187412
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 7c774d250f..f57f9cf827 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -527,7 +527,7 @@ python () {
                 message = "Has a restricted license '%s' which is not listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
                 details = d.getVarFlag("LICENSE_FLAGS_DETAILS", unmatched)
                 if details:
-                    message += details
+                    message += "\n" + details
             bb.debug(1, "Skipping %s: %s" % (pn, message))
             raise bb.parse.SkipRecipe(message)
 
-- 
2.34.1


