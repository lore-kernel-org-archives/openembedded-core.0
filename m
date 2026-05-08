Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FDFCD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 10:07:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10415.1778234872870389478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 03:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uzr964qO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8BFC4C5DC6F;
	Fri,  8 May 2026 10:08:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EEEC606FD;
	Fri,  8 May 2026 09:49:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D859E10819772;
	Fri,  8 May 2026 11:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778233771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q/3HsE7CHjHGLEBLMXWQBPxny9/te5X+NH3pwugR8Kw=;
	b=uzr964qO8ntDrmQVVlTGfDGgQ40hso4J/ZaP2hPE3scKL8zYtu4imMYMhTA8LKgepOOW1V
	T6WuvJMoiPprG/YB9N06eLANuCCEGxAxp/eH4TGCEDtwVkIUzNPnYjAWHh57Th/e0gxc/T
	nXApf6hTJr/g7QlIjV7mdDIAi+d1B9pG560gecyA4iN2Uwuj7u4suYoct1LTaRxb0kKNUN
	qYCzLP01N90f+gbE97RdaOaq4jl9PIXsDpdLEU1T/6oKuoZ1fLr+SdjcRQYFsr0T/1zGDt
	lrBW+L0XM4sJd9vfAIO5GAP32tqeNrcJDm5P872dQQdsNG3IzTkVIJ83L8W9Jg==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 08 May 2026 11:49:27 +0200
Subject: [PATCH v2 3/3] sbom-cve-check-update-nvd-native: Update source
 revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-update-sbom-cve-check-v2-3-386df4c5e6a4@bootlin.com>
References: <20260508-update-sbom-cve-check-v2-0-386df4c5e6a4@bootlin.com>
In-Reply-To: <20260508-update-sbom-cve-check-v2-0-386df4c5e6a4@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 10:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236703

Update source revision to v2026.05.07-000006

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
index c868ba09c18d..26a14e6eb169 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.03.19-010002
-SRCREV = "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+# v2026.05.07-000006
+SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


