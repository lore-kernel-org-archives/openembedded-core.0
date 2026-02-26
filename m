Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3025FD8FE0
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:02:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74944.1772125315098081363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sY0zMxrC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 99C941A1577;
	Thu, 26 Feb 2026 17:01:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 707355FDE9;
	Thu, 26 Feb 2026 17:01:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE30A103693FF;
	Thu, 26 Feb 2026 18:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772125308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7xLK6dvGTmM6ZBn4pxHA+Smeu5BXYsHtbpKNAGsZU7o=;
	b=sY0zMxrC7yJUMCBMAwHDPcskfN2G42iTdCQuShJGG7MQhlB+iepNX9lcv+nAcoT3WKTdaM
	gWb5p7XXtu151MeEmO4nyMmDyA4JxnCW4LA4hUz33tnPFT0ZCAmsSv40zWBo6cVLpyOWS4
	VSKS1wZTe9enO0VrQrL1q/xfuUk0p4vhDb7MiWyWFMVVeiGHBssTAJ+2L53xeCvA0D9yJG
	5JDDgWUhYfFZPkuaE26WGeJ9R3nKZvxSZyszRB2XxOA+nEtEuVet7Scjjmju8JPXGjxc1X
	/pcRokCmoRL//cTTJyp3e871QQyeEKBD2dr+/vtCN7lK9sufBSKqpVQUQKEoOQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Thu, 26 Feb 2026 18:01:19 +0100
Subject: [PATCH v3 5/6] sbom-cve-check: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-add-sbom-cve-check-v3-5-2e60423f4d35@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232044

Provide sbom-cve-check (native) executable.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                |  1 +
 .../python/python3-sbom-cve-check_1.1.0.bb              | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3bc1d00bc1c7..c43107ccdccd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -714,6 +714,7 @@ RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com
 RECIPE_MAINTAINER:pn-python3-roman-numerals = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-sbom-cve-check = "Benjamin Robin <benjamin.robin@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
diff --git a/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb b/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
new file mode 100644
index 000000000000..3d1c581e9f86
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Lightweight SBOM CVE analysis tool"
+HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
+SECTION = "devel/python"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
+
+PYPI_PACKAGE = "sbom_cve_check"
+SRC_URI[sha256sum] = "953256ac99851ba59bc8649b8023303007ff2981edbc4ee395011bd91c118095"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-spdx-python-model \
+    python3-pyyaml \
+"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


