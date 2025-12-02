Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6FED11715
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:52:40 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.617.1764694351975571442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 08:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLRdp1NT7zHWp;
	Tue,  2 Dec 2025 17:52:30 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLRdn5Sk5zwv6;
	Tue,  2 Dec 2025 17:52:29 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 02 Dec 2025 17:52:13 +0100
Subject: [PATCH 2/2] buildtools-docs-tarball: add
 python3-sphinxcontrib-svg2pdfconverter to the SDK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-svg2pdf-v1-2-bf4bd322e528@cherry.de>
References: <20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de>
In-Reply-To: <20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 16:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227178

From: Quentin Schulz <quentin.schulz@cherry.de>

This will soon be required for building the Yocto docs so let's add it
to the SDK toolchain.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-core/meta/buildtools-docs-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index 98d47f7b71..3fc28fad93 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -10,6 +10,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-python3-sphinx-argparse \
     nativesdk-python3-sphinx-copybutton \
     nativesdk-python3-sphinx-rtd-theme \
+    nativesdk-python3-sphinxcontrib-svg2pdfconverter \
     nativesdk-python3-pyyaml \
     nativesdk-rsvg \
     "

-- 
2.52.0


