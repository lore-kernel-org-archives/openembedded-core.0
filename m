Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37926.1793174829607863246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 01:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uEqUgZTk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 989FDC4FECC
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1B3C60769
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AD40103290AA;
	Wed, 28 Oct 2026 09:07:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4ds7sLCtMqut6g2lMJY2NNW3b8S9jYcFf7PyTb8TV2g=;
	b=uEqUgZTksB8xwU23EBOmmKYGA4dGBcbtCjgRE2Uv1WPJEtNm4s3s60UYhkjlXX2arZFV2h
	fLUmdU6ldAmTLMm02LM+c0kR2eSC8uGq43xLwCaZ5s+4hoGVdlARS5Z79vsWjEts/9KyOZ
	epI/Pmkt7VEhpUxfjpKrl7uBz1Mno21b2E7U7JlgcVGmuVDdOdKStpwOPi99wt5lRTD4yc
	052IGhM4QsVg+dK1zDS6zjJEA2/zdsJN8PWZ09a1iMBnlgAOQXR0RTPDBLIl5XQlw/HaAQ
	ZK0rYZOrl1AguT47HeXG6vP7bv0ZsvI1/hPuU014clac+667YDnCdkDaLvYWgA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:06:59 +0100
Subject: [PATCH 1/3] python3-sphinx-design: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-sphinx-tags-v1-1-65bf95b5f2d8@bootlin.com>
References: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
In-Reply-To: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=My+e4Cp/wGRbPmdMM87c0cVXPE/KwyHXOvhNyZgpHIw=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBq4a0kD+KLCOe/P/2xYAGGHE1rWdhhzHZvPr7pH
 K3ntpQgOCuJAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGtJAAKCRDRgEFAKaOo
 NlGTD/UWfIo0w+SBHH0Xmsv12UzJP8ruPXdbWXTP9P2Ii+6PzHUnWqCA6jo0TvhoiUsB63e6vMR
 DQd6SLTEJC4hoicZnRcqp3wdnYzizK7K5Jl1kT99BXPP+nIyp/G/NUFbaAQP94dJgH8heJAB0ZR
 h1oWtI0OcCT3RqLA7HZqJUPnmxCqpbhwt/7h17X1dB2xLgFtcBcImT8wbk8hZiOhq21YJFAMPCd
 LrFdk9CUcY1aHTFHwiQyFSn4wzaBoS/0RufrLJRjY+EWsxfuPCKKf4AVL0zZ5JIodAODjB3h/XV
 bNZPIvDFYiCrJaSBy7UASuI6j4MGi6rH4sUn/uwi9I/Z2X402thOf4oRU9bBGcpUzrFJLWE/nT0
 D+I07N6lm+lSizOhRpHsWtyA/ruh4l2YcpI6EPb9Fq96YPrpu16Wb2lWnD8t99lEQVcNTkr2Ysg
 miEGGcH1p0Yo65XnO5guqKD76PC+L8fM9je7QCfcz6vcBurV7GcfBFEJqcfwFQNG8M7+Jsecv9v
 qBx4lMSsRHD9D1o0nYbZCVpVoceLdV456ePeniK2zarmcBH7IMreYBXy4a9lCirKFlTumgng1zR
 lo3LD4+e1+d+YT8GLjNWop7W7HHSe7UBBt5jtu2KZFrJvTqOlfmIAyFeOIpalJLkCDjgEeM3Dho
 wNWVcZaMscNIN
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248794

The python3-sphinx-design recipe is a dependency of the sphinx-tags
extension and will be used in the Yocto Project documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                    |  1 +
 meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 74db3e44e9..6e37eb1095 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -731,6 +731,7 @@ RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <marta.rybczynska@yg
 RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-argparse = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-copybutton = "Antonin Godard <antonin.godard@bootlin.com>"
+RECIPE_MAINTAINER:pn-python3-sphinx-design = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb b/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb
new file mode 100644
index 0000000000..908ac0846e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A sphinx extension for designing beautiful, view size responsive web components"
+HOMEPAGE = "https://sphinx-design.readthedocs.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=484a29024499c025d11c52f22a6f0bb8"
+
+SRC_URI[sha256sum] = "d2a3f5b19c24b916adb52f97c5f00efab4009ca337812001109084a740ec9b7a"
+
+inherit pypi python_flit_core
+
+PYPI_PACKAGE = "sphinx_design"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.55.0

