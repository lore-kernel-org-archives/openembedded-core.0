Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443F6CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:30:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156.1778171429714743071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jyk0OByB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 21F49C5DC60;
	Thu,  7 May 2026 16:31:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59123605CF;
	Thu,  7 May 2026 16:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A44571081949C;
	Thu,  7 May 2026 18:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778171426; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DMzy4mIOIjUy+gnIC5r3P+KHqKrv7gkBJpgCLzRRG6Q=;
	b=Jyk0OByBSgxB9OvBllMJ7emlin0QS7HoqSjqtcD9JRj4EAoWOYaPgyhL8NSVahCLaGW7Ap
	a+RIsxsrYYfbyhDANkRnZgSy0ZBicCTG3glbqnd9iR+C+TiAcVwurSvAm9hcZY0kqghobk
	UG5qjaEeEbm/+1+KYvx2RTdYNsjvfgZwKbFkx0Ebdg/7la914XQf6eQfoiy5hS+8HsVQzs
	qPBusYc1f+eCsAHc40XR8zXB17UET49GVBavdIR3EW+MVHuOJxwQ4BvsQFPBoUCvSmyVze
	+irq3oNbTf0Nnl6Ltx4fjEWaNucG0xO33b+3NCtKwisJUeYt6AmFzd35ML+rxg==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Thu, 07 May 2026 18:30:19 +0200
Subject: [PATCH 3/3] sbom-cve-check-update-nvd-native: Update source
 revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-update-sbom-cve-check-v1-3-3c398db78f5f@bootlin.com>
References: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
In-Reply-To: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236603

Update source revision to v2026.05.07-000006

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin
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


