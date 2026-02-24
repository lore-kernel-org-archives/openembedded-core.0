Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24945F3C9A1
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:54:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23554.1771948443617361770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=r4O/iU0T;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B1464E410A3
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:54:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4ED75FD9D;
	Tue, 24 Feb 2026 15:54:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33DB3103691C6;
	Tue, 24 Feb 2026 16:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771948441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m4K50wSTzh2jJphz9kPbiNWNqNEiTyi2Kcx15gpVNVg=;
	b=r4O/iU0TZCsogBCHqjyTJgujy38HMi7cFGBTI897eqjHDUpbk8LYkCC798DynSKTlpcpg2
	Kvn63vm3gurTBqPsmyqzqpyLxDk4BaH9SdECmFjaWuqOoSZe/ezDpnCYJLBwjYBxpOGTSB
	zp+6uB07LD6lq+5FiRBQTUnazNBrTlrVvNlEFg4PTMVUUERKujs6DuULxBg79WUB9KAzUD
	DzW5zHXNBxJWgMh/pZFSPQw2dFSRCSaJ9ciuSpf4mnhSRdwEbb9o+w7uopnztbYhsMBbzl
	YZjRF3OxJvYbvQt8Ag2tNVN/PIihXKKgV1dDpCuHTMzHfx1bYx4HAiRRVgMeew==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 24 Feb 2026 16:53:44 +0100
Subject: [PATCH 2/5] python3-hatch-build-scripts: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-add-sbom-cve-check-v1-2-1c76fbd7f01b@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231870

 - Build dependency of python3-spdx-python-model.
 - Part of the dependency chain for sbom-cve-check

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../python/python3-hatch-build-scripts_1.0.0.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0.0.bb b/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0.0.bb
new file mode 100644
index 000000000000..ba7d8b40ffc5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A plugin for Hatch that runs build scripts and saves their artifacts"
+HOMEPAGE = "https://pypi.org/project/hatch_build_scripts/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9ad584cda56221c7eaf48c23a5874a2a"
+
+PYPI_PACKAGE = "hatch_build_scripts"
+SRC_URI[sha256sum] = "563735e2f265c9e1b92dece6f762309114505ffaf6e5d51d462eb6a3b4f14640"
+
+inherit pypi python_hatchling
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


