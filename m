Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7326CCD3447
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:30:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152.1778171426068101324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zZaiic29;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FEA71A3556;
	Thu,  7 May 2026 16:30:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E5D7605CF;
	Thu,  7 May 2026 16:30:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52EB8108194E1;
	Thu,  7 May 2026 18:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778171422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrErO1Y0K1UFb96k0LiFlIHeKhVu31FLB4AQkTSV/yU=;
	b=zZaiic29JHLK7MfAMWY3V8evUpIlNyjRumH/lazXs1dXnPMyYrJV5pAt5iALIsSY0ckiC+
	4XBQnkMfrRtxOQEMOIrKMZ63VjdEmNWzBo5sZ6NpafSCQPKkoQMZgGo6GNYDBbjCT5Wdcz
	B64hiAwqNGsRiEZ3ldXbcKpFFjx8E0nk7PhzV6UZxGIjbr7mfexNVfmodb6qhlvxZdLl1y
	mUp7+Q63PkjqYefCAN6a5TfFOpE1IkZe6J11QPG2uoS+/N6mDxxW0XL8a3owc/4o4T42fd
	p+dXNxfdRVY2Y+WYDzUtnqYzcoFUUdJo31DQdKrukFIlHE5MlA8R06rJIvmWGA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Thu, 07 May 2026 18:30:17 +0200
Subject: [PATCH 1/3] python3-sbom-cve-check: Update to version 1.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-update-sbom-cve-check-v1-1-3c398db78f5f@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236601

For details on this new release which fixes various bugs, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.1

Also, update the LICENSE, which is now GPL-2.0-or-later instead of
GPL-2.0-only, to be compatible with the licence dependencies.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...ython3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
similarity index 76%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
index 96fc167ecbc3..8120848a667d 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Lightweight SBOM CVE analysis tool"
 HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
 SECTION = "devel/python"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "dad6f9df848f6dd7b69922baef0ec187b66ad0847fe0cf62614529e27203e842"
+SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
 
 inherit pypi python_hatchling
 

-- 
2.54.0


