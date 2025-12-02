Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED16FD1171A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:52:40 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.613.1764694351416121230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 08:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLRdn1FB3zKK3;
	Tue,  2 Dec 2025 17:52:29 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLRdm4DqszvXn;
	Tue,  2 Dec 2025 17:52:28 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] buildtools-docs-tarball: add new Sphinx extension
 svg2pdfconverter
Date: Tue, 02 Dec 2025 17:52:11 +0100
Message-Id: <20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIKFbXJZuVJCSpptqbGpgbpKcYpGcmqgEVF1QlJqWWQE2KTq2thYAyKy
 7TlkAAAA=
X-Change-ID: 20251202-svg2pdf-e35074cd8cea
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 16:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227176

This will soon be required to build the Yocto docs, so add a recipe for
the Sphinx extension and add it to the docs tarball.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      python3-sphinxcontrib-svg2pdfconverter: add new recipe
      buildtools-docs-tarball: add python3-sphinxcontrib-svg2pdfconverter to the SDK

 meta/recipes-core/meta/buildtools-docs-tarball.bb     |  1 +
 .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: ac7327583aef83fd400190506f3147623de38b68
change-id: 20251202-svg2pdf-e35074cd8cea

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


