Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68784FD3752
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:36:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44223.1772023009672094701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ARBXYhKl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33FB51A137E;
	Wed, 25 Feb 2026 12:36:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08FB95FDE6;
	Wed, 25 Feb 2026 12:36:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 471A410369130;
	Wed, 25 Feb 2026 13:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772023007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fUlD5Ngb/RcTuKA/xSX1sd8GFTY4xHRHVrAq47clQwA=;
	b=ARBXYhKlJS9eStzwhIqU/YQ2LEypsf8AsriKb9vgkCXC+LfWBA8Ub2I7Q2cdeKbJJ59JOk
	ECz2CFFrVXR6VFZ+KEkLb8I6uX82W0lY3d7JkrMKqj9NYrn7m8YGVTSGXZkyIXiW57rDL9
	phwtqFujp8aQReAW4RQaAe4rQSLlAjAj0YSn7THWv5A8hXlfj0puW1JLrF/mitsRWQVnel
	lLIZeDaWPwJBw8t76fD6qvPzzzb0JmA6YW3npil5tmTCQkTSbx6cPrTo9gs0dTqoLffQrg
	jVcYAdlheZOTrAN0NVaYl4tpMPFzEkFyt4UYIG/S8Y/LFyNMs/XxbBuYeUl/HQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 25 Feb 2026 13:36:31 +0100
Subject: [PATCH v2 3/6] python3-hatch-build-scripts: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-add-sbom-cve-check-v2-3-eeffa285b901@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231959

 - Build dependency of python3-spdx-python-model.
 - Part of the dependency chain for sbom-cve-check

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                     |  1 +
 .../python/python3-hatch-build-scripts_1.0.0.bb              | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b3913a04140c..d65960f8e1bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -649,6 +649,7 @@ RECIPE_MAINTAINER:pn-python3-extras = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-hatch-build-scripts = "Benjamin Robin <benjamin.robin@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-vcs = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
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


