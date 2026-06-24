Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B71CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:54:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12314.1782320055300005347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TEGFqsDs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A3BF81A0925;
	Wed, 24 Jun 2026 16:54:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 729C5601C5;
	Wed, 24 Jun 2026 16:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2F9E106C84E1;
	Wed, 24 Jun 2026 18:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782320052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fNTz5ejRpYfVlB3lio0cXKiJtj4JFBW5tx60Tk+a0i0=;
	b=TEGFqsDsDqnFohr3GKb8fVQBBXWgn3+4pXF8EgqGtjzfFZXEBtDmMzZJBb279VcTL+KfQr
	jsttnQtQnbXMPq4Avn6BoXPY4Difpahq0WSj3zTG3nvcVzZ1ElOnCS3JU++Rg0lF3fqpJA
	ian7aC6vpKXyhCJFOU0/WAx8JOt/bDMK3OzrCbWIHyzX0sXIqbqyN70tfr55LZQV8jn5iR
	WCVMOCJHNE06A3GaVVGk5MAtV1Sye0xtzSqpb3q6qUunRuMFZHTFPDREJfEXmdkVjgCluJ
	QskN8qgAqnoWVzcQ85TTe7FVIKIf6AcAwr20KMLLn9pMWMQCv5UUZpIXpz18wA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 24 Jun 2026 18:53:54 +0200
Subject: [PATCH 2/4] python3-sbom-cve-check: update to version 1.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-update-sbom-cve-check-1-3-2-v1-2-f7ab738bd785@bootlin.com>
References: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
In-Reply-To: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239528

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.2

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...{python3-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
index 8120848a667d..f14901e3008f 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
+SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
 
 inherit pypi python_hatchling
 

-- 
2.54.0


