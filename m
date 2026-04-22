Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8019F9EDF9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 15:31:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85532.1776871895779365570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 08:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wKgTPm3Y;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E77F94E42AB3;
	Wed, 22 Apr 2026 15:31:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8D095FA8F;
	Wed, 22 Apr 2026 15:31:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69EBF10460C0D;
	Wed, 22 Apr 2026 17:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776871893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hEs2EbIiwTWHyA+eLuDoSLzi/nhVxCvqfyOpIWUo62I=;
	b=wKgTPm3Ywjtk4Bai7Sat4/iLKRlz6BITMT3Yo8w5Mn0jyrLUynH1v7wJYoEys7uXNtsjiq
	/LhnesAf9eF58vheIS/pcpZN09bOShNjdIQWkZ0hIUVnkw+3A3CThJ2ep1EAG74qfiD+7x
	HOgYjWYIE+dMen6b7bp9Fu5/lHx9SFjV1EC0jGPA7fQayFbUspYw3ZY/RUJwYKElXsDDkg
	tw9vXglII2qoR+XcgT9wt1aKhkWPIJtHsO34U+qz/369nme40+UzqciFsxNjZPA7ATo+5t
	Jz7OGXlEdl1hrvRX739PaCl9evrHF5B88UnjIIsVSWIX4Smmot30EolHP881EQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 22 Apr 2026 17:31:28 +0200
Subject: [PATCH 3/3] python3-sbom-cve-check: Update to version 1.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-update-sbom-cve-check-and-depends-v1-3-4646f840ce48@bootlin.com>
References: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
In-Reply-To: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 15:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235733

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.0

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 ...o-use-correct-type-for-the-version-attrib.patch | 31 ----------------------
 ...ck_1.2.0.bb => python3-sbom-cve-check_1.3.0.bb} |  4 +--
 2 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch b/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch
deleted file mode 100644
index 392f0b99ea70..000000000000
--- a/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1a5ae49c520d3569ed12f0c6373b4223d428f92b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 9 Apr 2026 11:55:19 +0100
-Subject: [PATCH] export_yocto: use correct type for the version attribute
-
-This should be a string, not an integer:
-
-https://git.openembedded.org/openembedded-core/tree/meta/classes/cve-check.bbclass?h=yocto-5.2.4#n235
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/sbom_cve_check/export/export_yocto.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sbom_cve_check/export/export_yocto.py b/src/sbom_cve_check/export/export_yocto.py
-index c8261f4..78d72c0 100644
---- a/src/sbom_cve_check/export/export_yocto.py
-+++ b/src/sbom_cve_check/export/export_yocto.py
-@@ -172,7 +172,7 @@ class YoctoCveCheckExport(BaseExport):
-         :return: Generator context.
-         """
-         yield
--        json_obj = {"version": 1, "package": self._packages}
-+        json_obj = {"version": "1", "package": self._packages}
-         with self._open_output_as_text() as f:
-             json.dump(json_obj, f, indent=2)
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
similarity index 69%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
index 2a09d8ea4c38..96fc167ecbc3 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
@@ -5,9 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0b01474c541fb4b9d29d36f86fae6d0f27ff2b991fcb59b2fbeb70c1eaa09664"
-
-SRC_URI += "file://0001-export_yocto-use-correct-type-for-the-version-attrib.patch"
+SRC_URI[sha256sum] = "dad6f9df848f6dd7b69922baef0ec187b66ad0847fe0cf62614529e27203e842"
 
 inherit pypi python_hatchling
 

-- 
2.53.0


