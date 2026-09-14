Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38166C88E6F
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 16:49:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2310.1789404571591377635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 09:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xkqI+Mzh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 367FD4E404EB;
	Mon, 14 Sep 2026 16:49:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B050260323;
	Mon, 14 Sep 2026 16:49:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7194811C7AFE0;
	Mon, 14 Sep 2026 18:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789404567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WbXXeUvk3wf0Fet4S197neEN5sl1Z6KLf0Cgdrx3A+k=;
	b=xkqI+Mzh/LWUPIUtYsNtoQ8aF4WYjLsVZcYrioVlpoIC/pASJpsGXP6+9TfpWP6kedR3v0
	Cw9HTiRFK5iMrzfvR3TDZt7Hu1xsggZ8f/+luv+raL2ao2jc2Tn3BTzUuQQNoK2wGfAgJ7
	i7YZU+g5/2Sr7VHPOE3hRakcoUUANXSd1AHg1VP4hrnvLCSC1HvZK/IjK6x/FC54cZ8rPe
	rMVgmaFgY/9f+zH3FUL7KrkaXobgh0SVOQtjXjkbiIrXAIf61vFECJeQXj3NzICR1KzCg9
	LKKT9VowubO12LgR/ztkOz9OVPkKbugX//sb6IzOQ+xqEZnWOKod05hxn420BQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 14 Sep 2026 18:49:26 +0200
Subject: [PATCH] python3-sbom-cve-check: update to version 1.3.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-sbom-cve-check-update-1-3-5-v1-1-5d2d69902368@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDuQpKZUr1JcmMm0TsUfMioF8
 e6N7fKDx9tBOQkr1MUOiTdRmcYMeymAunZ8MUrMBmfczVS2RA3TgLQxUsfU4zrHdmG0eEWP7mx
 8GcPdeMiHOfFTPr/7o/lb1/BmWs4lHMcX+YjRWH8AAAA=
X-Change-ID: 20260914-sbom-cve-check-update-1-3-5-2260954db805
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 16:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245788

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...{python3-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
index c26ce6e6b309..83d420835daf 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
+SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
 
 inherit pypi python_hatchling
 

---
base-commit: f94ae3d6ba49aef86f497998c0e0232a5039510a
change-id: 20260914-sbom-cve-check-update-1-3-5-2260954db805

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


