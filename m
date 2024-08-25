Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72319C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 21:42:46 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.40013.1724622163122662089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 14:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=I/rsETF2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024082521423844aa1588b0d105b4b8-gkzc0n@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024082521423844aa1588b0d105b4b8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Aug 2024 23:42:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BBGhwmheMQDQ5yr1yV1kI/QTLmpWCjKvZAPuIKmAo2E=;
 b=I/rsETF2t3exmb3L5PS53OlcwllYD5HGPj+I4y3m7JytJMJsAxK3Sxuh2FhJbtMpHII239
 wRMF2jv/1QOPYIAQaP1+eAhl0CMrfzfoITRlJ/jMxSO7b2SYBg/gsgGT6Bz04D9C/YDQXjvo
 2uO4LV6jSrqqW56836YOTbsde6r/Npnsg1e9rdKqLmScwAr0f6Jx/5YfILX3c8heawm3Trr4
 2X/3knjBM9CxrLK1a48NIdmAI26OBUAoDP5N8yB8lELDOGLa4GHvypAZBpipbbQ0ZqtTWvPj
 WgBlgmK5GifvhIKoST8aquqwJVmhk3qW5E/k0SkHqkTH+7RF/rM64m1w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libyaml: Ignore CVE-2024-35325
Date: Sun, 25 Aug 2024 23:41:44 +0200
Message-Id: <20240825214144.2479176-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 21:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203732

This is similar CVE as the previous ones from the same author.
https://github.com/yaml/libyaml/issues/303 explain why this is misuse
(or wrong use) of libyaml.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 334d9113d2..aa7fc5e914 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35325] = "upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303"
 CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
-- 
2.30.2


