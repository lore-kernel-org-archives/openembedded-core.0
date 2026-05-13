Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BFBCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 20:00:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6044.1778702417629749450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 13:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eQxAGYk9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0DB0D1A35A4;
	Wed, 13 May 2026 20:00:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D81275FE21;
	Wed, 13 May 2026 20:00:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A74411AF9038;
	Wed, 13 May 2026 22:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778702415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tKRqQ48aEF4OVYVke4WgXDhig8eZcTtMxHlW6Qh2K+4=;
	b=eQxAGYk9fRAZ68SxAzASlCtRGUxM91FGI6JglwN08Cm3FKsmcNtBtgj3OxaUPzpyA5dQCs
	sA62PaQ3lXJwZ8DUOfANxQdePqhshZBrT4X6kHFoJGr7N95k2Y9G0cn1Wa8IhhRLTwiQel
	47IBpcexodzOXWWWCNNSvdtxUnoka8Ud9Vjcu4fJM7994N4lP4Tp7RKV5y1PHuDF3YbNJl
	nvihJ+hbEPYQX7OaTvKAYHqVh3Zi9N7+oERw2WAH6eXif47tlZ4Y+yBC2JlaH/uVeDTUZ/
	nr42WKhieayVx/Kzg2Y9A+65IdA8On3CMP+WltWGFbn+5EmZt7EKtNq584Nn5w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 13 May 2026 22:00:06 +0200
Subject: [wrynose][PATCH v2 2/3] sbom-cve-check-update-cvelist-native:
 Update source revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-update-sbom-cve-check-wrynose-v2-2-94d0e353dc6c@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237008

Update source revision to cve_2026-05-07_1300Z

(cherry picked from commit 30b1f91d2a8cb1df5d4a65d2b55a3d26ff76937f)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index 338712216590..3763e7f21f7a 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# 2026-03-19_baseline
-SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+# cve_2026-05-07_1300Z
+SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


