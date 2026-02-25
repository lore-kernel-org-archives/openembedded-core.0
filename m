Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69409FD3756
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:37:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44113.1772023008461795525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D1zMwHtf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 784A7C16544
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B8535FDE6;
	Wed, 25 Feb 2026 12:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D34510368F91;
	Wed, 25 Feb 2026 13:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772023005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ncwBr4bI6LeRExmjjz20l63Solgzb7hpLmCNQQdMidM=;
	b=D1zMwHtfS9akrajMiDfRa7ceb1p/CNfoUPs0hIWUXvjxQxO2Y+D22SfVZyllSmadsfd/c5
	0ugg4Vb6RTKUkrTL6M2cx5LdpKTcjSxnRhp/M+GHlyvrndazARmVa511eiU6Fa4oEbSLCt
	PrUI9XKe+QSBVQ3nqHnoaGUPAbKyXXK14JFy5jkTGn7bVPcacTRuy37CVfjNsAERMQvXzB
	2gHjhTteeWswa1P/ecu1MOoWf2V/rKfcoqvXSu9fQZ37npoFUUOY2MgsqOWFCcMb2iwOn6
	e44MN1UZrWZyf8HFyA2NLg9YaFmu8oi0QcURPIW/ey/FbgBAGOcuk9U3KtWwvg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 25 Feb 2026 13:36:30 +0100
Subject: [PATCH v2 2/6] python3-shacl2code: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-add-sbom-cve-check-v2-2-eeffa285b901@bootlin.com>
References: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
In-Reply-To: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231958

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


