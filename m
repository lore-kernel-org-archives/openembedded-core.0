Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CEFC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 12:12:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33555.1788783121148911271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 05:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ra7Azv65;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5079C1A1A32;
	Mon,  7 Sep 2026 12:11:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E9D160383;
	Mon,  7 Sep 2026 12:11:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F1EB11C7AF23;
	Mon,  7 Sep 2026 14:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788783118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZoVohEGstA3HnQZr2GjwfXysRYc4tqSbasE0hu6MdSA=;
	b=Ra7Azv65O1jjk9dssUmb9tO0STfNl0qkFNsyr7+7hPn/iuug6QOiFVICyxHxPvrtl9nSaj
	+oMOHn81hRIGYZYXESTNCMIdcqSR9mS7Z1VVypf9UOliDhWqAVYuzlemgXQvDpDTHYU9sk
	lzAvLOkPSOHakilpG6CwR4W+R09oG1tpDI05gilkT5YjxYUSWx8dQzYXYnOrz6O/B2tcd4
	or0mUOKwh/SXRwJCu0AZpuGtCZ9g4z9aHQMHtyOl0QCC0GWLV/RUmDKjMN//3p+ATJ7aoR
	TrG4j8UfL+VTkaHUqIPymTU2HzIEn0Y/2RjWoeu227m7pkNqgwT/5VPBWiwmQQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 07 Sep 2026 14:11:54 +0200
Subject: [PATCH 1/2] python3-sbom-cve-check: update to version 1.3.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-sbom-cve-check-update-1-3-4-v1-1-93034b6bd44c@bootlin.com>
References: <20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
In-Reply-To: <20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 12:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245249

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.4

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
index 2aca1005694b..c26ce6e6b309 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
+SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
 
 inherit pypi python_hatchling
 

-- 
2.55.0


