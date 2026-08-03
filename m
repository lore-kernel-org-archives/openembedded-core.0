Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1311C5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:26:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39443.1785749170510446209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XR2sWcN6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9DEE24E410B1;
	Mon,  3 Aug 2026 09:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D2616029B;
	Mon,  3 Aug 2026 09:26:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E45AE11C17D00;
	Mon,  3 Aug 2026 11:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785749167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0SeEOPNoNjvSOqhOyhoP3MqaoB9XiHauy0+1W6/G59M=;
	b=XR2sWcN6qeRFGHHWTPueXhHw+rDzwhg0QDaAa4s5rm0Bhph61RP+RA/gTu9E3EjiqxDsae
	PSSeYca2z8IpbjIF63BOQxVo6PZxACRHkStXu/etyVHCSmmXKcgkTClzaB+0sokitS6IYu
	F8CQeCKHyGsJw8IrcMoV+inkvlD3DobA4PJLJvi+/Nup8xMoXsOWBcvDDccBNqp/Up85J2
	NIaIyS/Bo23xratOzrthLPx4de9EKnxjbEQTv1U+9czX47QvQhQsXhZVdLUeUdWjsSXnUn
	HoBIxadBjJZLjoSvygn7ipdZLbBEHeAOyF8yDdmmwxvOCsHz7b4SigaYpdbmQQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 03 Aug 2026 11:25:57 +0200
Subject: [PATCH 1/3] python3-sbom-cve-check: update to version 1.3.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-update-sbom-cve-check-1-3-3-v1-1-c0e5e198030e@bootlin.com>
References: <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
In-Reply-To: <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 09:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242639

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.3

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...{python3-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
index f14901e3008f..2aca1005694b 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
+SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
 
 inherit pypi python_hatchling
 

-- 
2.55.0


