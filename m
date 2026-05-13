Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D70CD4F25
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 20:00:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6163.1778702419112788508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 13:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lBfCa3og;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 531E54E42C78;
	Wed, 13 May 2026 20:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8EB5FE21;
	Wed, 13 May 2026 20:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DCE111AF903E;
	Wed, 13 May 2026 22:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778702416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VJtwNLTqiAKwi8CRSViuUEDSw/d9kp4UDI+cwE0u04w=;
	b=lBfCa3ogyWh90deP6zONovAZOQ4UrNTIYIZ/5RAA2mP+hGB0qfSq4fOURVblmCbRKcdBbl
	5FFEqXDDloH79iNMZS3haWF4gOxgGoRAs1c+DD8xdcXjkbDR/m+cMb4Ni9C30pSH4OuQTZ
	30bt2Z/EFpSoENx/W8z+BV/29ZI1ImHYAKce2pK0/pe0gl7CotQeSjKgxYl7kjrNmYqMY1
	hmjPYDTyruwnmcyoZr4LuqCqZRig5/kUaIlHk75BHxliqiboZrtD6L3+NPOjQQdRaDg46T
	zvkkRP7PnlJOdfSacYmYeQRV6MJh1Vto763e2g2jz6WhvexIjlWxitm4ZyvMWQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 13 May 2026 22:00:07 +0200
Subject: [wrynose][PATCH v2 3/3] sbom-cve-check-update-nvd-native: Update
 source revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-update-sbom-cve-check-wrynose-v2-3-94d0e353dc6c@bootlin.com>
References: <20260513-update-sbom-cve-check-wrynose-v2-0-94d0e353dc6c@bootlin.com>
In-Reply-To: <20260513-update-sbom-cve-check-wrynose-v2-0-94d0e353dc6c@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 20:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237009

Update source revision to v2026.05.07-000006

(cherry picked from commit 3724b93538d3acbec9f48d4c524b51d166071708)
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


