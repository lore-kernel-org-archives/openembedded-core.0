Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89705D12D48
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 11:32:46 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13022.1764761561688814798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 03:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLwVH6XkkzhbH;
	Wed,  3 Dec 2025 12:32:39 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLwVH1cKTzJ6c;
	Wed,  3 Dec 2025 12:32:39 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v3 0/2] buildtools-docs-tarball: add new Sphinx extension
 svg2pdfconverter
Date: Wed, 03 Dec 2025 12:32:30 +0100
Message-Id: <20251203-svg2pdf-v3-0-879d05cb101b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQ7CIBBFr9LMWgwdSkVX3sO4oDAUNm0Dhtg03
 F3alYlxM8mb/Pc2SBQDJbg1G0TKIYV5qiBODRivp5FYsJUBOcq2HpbyiIt1jITkl85YZUhDXS+
 RXHgfpcezsg/pNcf1COd2//42css4G1w3WIFIEtXdeIpxPVuCvZHxj4fVk3hVstc49FZ/e6WUD
 51KHybWAAAA
X-Change-ID: 20251202-svg2pdf-e35074cd8cea
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 11:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227217

This will soon be required to build the Yocto docs, so add a recipe for
the Sphinx extension and add it to the docs tarball.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v3:
- added Antonin as maintainer of the newly added recipe (thanks!),
- removed changes from patch 1 to
  scripts/lib/recipetool/create_buildsys_python.py as those weren't
  supposed to be sent in this series,
- Link to v2: https://patch.msgid.link/20251202-svg2pdf-v2-0-529856a2b6da@cherry.de

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

 meta/conf/distro/include/maintainers.inc             |  1 +
 meta/recipes-core/meta/buildtools-docs-tarball.bb    |  1 +
 .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)
---
base-commit: ac7327583aef83fd400190506f3147623de38b68
change-id: 20251202-svg2pdf-e35074cd8cea

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


