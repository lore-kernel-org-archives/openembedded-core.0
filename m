Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE13F3C9A0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:54:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23415.1771948442543877539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YcFxFUDl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD8B64E4109C;
	Tue, 24 Feb 2026 15:54:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E2395FD9D;
	Tue, 24 Feb 2026 15:54:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04494103691CC;
	Tue, 24 Feb 2026 16:53:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771948439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i/xRJAbXyRaCY0HpHpXbv+VCTIglhRRsSsbQNiOcCOQ=;
	b=YcFxFUDlYILoAiZGx0s8ytrUYwdE/+nvWUkuFeYmup+MzELcY4iTJ1HsNlbCRPQ2X3tWIe
	jL6GVbqs1yhrxYFOgGOHB9VCOtW4oR3x+Lk58l5RjvVZVDBwLi+7F4AnlLol7p75WLABa5
	wmT2yorQH08vEv1fRbZu0DSJLjAAhsA/4wUSD2dok0YVKTNjyzgs0kR2x//rY/v0QNwwio
	IyXNzBJww5kgdSoejauekDaIJf05/vgff8yNFGrl3HVo5c3dxRVxtLVYrg91bDJimD76v6
	gSAT2M+uufMK5069/66t4tvetd+M+ofc6Gd299wP8DpFE+UaIA5bUaa2lXF62w==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 24 Feb 2026 16:53:43 +0100
Subject: [PATCH 1/5] python3-shacl2code: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-add-sbom-cve-check-v1-1-1c76fbd7f01b@bootlin.com>
References: <20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com>
In-Reply-To: <20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231869

 - Build dependency of python3-spdx-python-model.
 - Part of the dependency chain for sbom-cve-check

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../python/python3-shacl2code_0.0.24.bb                 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
new file mode 100644
index 000000000000..93ed9a253040
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Convert SHACL model to code bindings"
+HOMEPAGE = "https://pypi.org/project/shacl2code/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
+
+PYPI_PACKAGE = "shacl2code"
+SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-jinja2 \
+    python3-rdflib \
+"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


