Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CADC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:31:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6171.1787722313959664283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gaO17Lzq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C0064E413BB
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6489604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53DF811C7AB22;
	Wed, 26 Aug 2026 07:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787722307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H4LgOzokvLWzfFbJuWSX72/FdHng8eKiN9WCXkezPKw=;
	b=gaO17Lzqx7NIL2pJvQYyQQejNszgpnNOH9NmPkbKat6zObCtvHNGypnyVgSs6DKVmk2UK6
	qjlxVq2dQJJV9iEdx0Ewy2lvILPRULeA/fPoZwvqFp+w49HYVD5Ej/3exCiCcS7yoF7N4q
	Nboy4AZGjPpLxpSsgPWmYYj/U0wiLWjCbhZDQ/uAx11eOKivdXPB8q4aAumhpWGYgaUCiw
	iD10mXy6zyr7T49ZzgOhMgvRnHVoMRn8HIuwvAqIE7SnluNSoIzE6MDORKM67YzMRM+/nZ
	gYYc/5joIi/pi0jySdqyQrDQ1EKxm+h3WVutmZOeScEC8tCisBtBWb7JJJ/OKw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 07:31:25 +0200
Subject: [PATCH 1/2] python3-pbr: upgrade 7.1.0 -> 7.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-v1-1-7a93b2311f69@bootlin.com>
References: <20260826-mathieu-updates-v1-0-7a93b2311f69@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-v1-0-7a93b2311f69@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787722301; l=924;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=eGJ5Ra6vcOVP7vG3P+d+kFwmI84Efo8xcVK/pmQXUDo=;
 b=b8/D7GcXx/WjneZSXq/GA7Cgp4xKGBRgVIUDkhf0UFNfmBGsYRL8+lxGJ9Yx8z9S84V2cyRcR
 5WrjPY20mzvBq3a2/nWyJA44BBHFdfWz4L1g+Wb9Muy6k8mOoIzWzdZ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244292

Changelog:

* Fix hook ordering race that drops subpackages from wheels
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.1.bb
index 7fc227e6bbdb..987c1615f1ea 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "973da2aee9961d7cb278aa74e1829f6daafec9dd8ee8c1655cbf3f5843bfe083"

-- 
2.47.3


