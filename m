Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4900ED12668
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 18:06:11 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2436.1764698760358560150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 10:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLTGZ2zpkz13B4;
	Tue,  2 Dec 2025 19:05:58 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLTGY5Y79zKfm;
	Tue,  2 Dec 2025 19:05:57 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 0/2] buildtools-docs-tarball: add new Sphinx extension
 svg2pdfconverter
Date: Tue, 02 Dec 2025 19:05:43 +0100
Message-Id: <20251202-svg2pdf-v2-0-529856a2b6da@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMQQqDMBBFryKzbkoyGipd9R7FhSYTMxuViYSK5
 O5N3Xbz4X0e74REwpTg2ZwglDnxulTAWwMujstMin1lQI3W1FEpz7j5oKi1+tE53zsaodqbUOD
 PVXoPlSOnfZXjCmfze/8b2SitptBNvkUki/3LRRI57p5gKKV8AQpN5wCeAAAA
X-Change-ID: 20251202-svg2pdf-e35074cd8cea
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 18:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227183

This will soon be required to build the Yocto docs, so add a recipe for
the Sphinx extension and add it to the docs tarball.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- fixed incorrect PYPI_PACKAGE that was set by `devtool add`,
- fixed default UPSTREAM_CHECK_PYPI_PACKAGE so latest version is found,
  sphinxcontrib-svg2pdfconverter (the default) is used only until 1.2.2
  (included),
- Link to v1: https://patch.msgid.link/20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de

---
Quentin Schulz (2):
      python3-sphinxcontrib-svg2pdfconverter: add new recipe
      buildtools-docs-tarball: add python3-sphinxcontrib-svg2pdfconverter to the SDK

 meta/recipes-core/meta/buildtools-docs-tarball.bb    |  1 +
 .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++++++++
 scripts/lib/recipetool/create_buildsys_python.py     |  8 ++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)
---
base-commit: ac7327583aef83fd400190506f3147623de38b68
change-id: 20251202-svg2pdf-e35074cd8cea

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


