Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C632FD8FD6
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:01:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74828.1772125299900504083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=STMHU9D+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65C251A1577;
	Thu, 26 Feb 2026 17:01:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BE715FDE9;
	Thu, 26 Feb 2026 17:01:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D57E103693FA;
	Thu, 26 Feb 2026 18:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772125293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ncwBr4bI6LeRExmjjz20l63Solgzb7hpLmCNQQdMidM=;
	b=STMHU9D+MJlTfYKk+tQU4jYtGr4FNZ9FhdQXxGbXOTkIjhwZSryOs04k5YFR4M5soI4SRo
	grnYSGlm+qYh0qTXNnX4EIr40t4D8TCoLWxcWGl32hrsZvaRo65whzamCVnJDys0KQoJhJ
	yZtWMRRjxlAnvBtc+/6it9z+o2EsdY9qIvdLia6KKHWwhS5Oo1aH889cmh9a8MjQaiKS8t
	I0fvnmAdZi0xhBf90k5cwWRSvNsNo3gPyFLdFvORQa6mV9bbz8bmOPvadh0o+3I/c/n8vs
	VwC6vTbDNegmvXRyq0z3v3lXY8XStgX/6a5MBJGPC6vA9Zg4g1dVtErn0ycIoA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Thu, 26 Feb 2026 18:01:16 +0100
Subject: [PATCH v3 2/6] python3-shacl2code: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-add-sbom-cve-check-v3-2-2e60423f4d35@bootlin.com>
References: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
In-Reply-To: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232041

 - Build dependency of python3-spdx-python-model.
 - Part of the dependency chain for sbom-cve-check

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                |  1 +
 .../python/python3-shacl2code_0.0.24.bb                 | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1a3490d6d625..b3913a04140c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -718,6 +718,7 @@ RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko
 RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-shacl2code = "Benjamin Robin <benjamin.robin@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
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


