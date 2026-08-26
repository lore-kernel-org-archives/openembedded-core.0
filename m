Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3520FC61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7840.1787733260344870898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oYidO9Ue;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0E381A184C
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F35C604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC54F11C7AC8C;
	Wed, 26 Aug 2026 10:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t6OjKyJypQyy6G+0Au2KcPpmgs7DKd4IM6pY+SicqIQ=;
	b=oYidO9Ue5tl8hfKuWJ+lr8og5Az1v+7JSenb7i7aAdG3m1PU2EnwxIMyTyYO9iLa+g4evo
	Y7pJr+vMnZNahOEUTTuSjdFvg1fj8bmo/H4GFBb5JWeeP+86QCXiN48op2oH+U5jQ50e8t
	PoIhWqNE8iqZlVXM3d7eqBpbh67sgQNvK5ID3sxRrGEV1ZkwK4D91+1omCTETCdm3Bnrr/
	o/Xp4bS40Hkh7c8tpvhpAG+2QcVPtWc/0RnaafIbJokCdm8dtQQF+67EOCjeie8dR8DBRf
	A58A3Q/51Aw6VkK+UaN7RrFPfKQIB5ZvpOWPcifqQA3ZxccCm776alfzaJ1kkg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:45 +0200
Subject: [PATCH 6/8] python3-pbr: upgrade 7.1.0 -> 7.1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-6-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1000;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=hvqRkFfR65xwHbNx/eeHbXo841bTqoje/I2O84y5vaY=;
 b=TN9l+JUVrS62ARxj8PprwGWHctbs8/Y2mKrZ25ARDF2c/4ASpmGhE3iVrWWKFVOOzML6nETJE
 Xw4osUqmKaYDORMzSd567ZW8Mf7vZb8CY4wk9AmCUQhdM7YQFTFUQ6U
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244374

Changelog:

* Fix hook ordering race that drops subpackages from wheels

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-pbr_7.1.1.bb => python3-pbr_7.1.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.1.bb b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.1.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.2.bb
index 987c1615f1ea..9aeb50268df4 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "973da2aee9961d7cb278aa74e1829f6daafec9dd8ee8c1655cbf3f5843bfe083"
+SRC_URI[sha256sum] = "4639b87cc91d0d58471b7bda1f28b7d0849ba43d7935c4c482f3c74fef719804"

-- 
2.47.3


