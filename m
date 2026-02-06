Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC640ECD9BA
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:24 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2835.1770398658108463234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D02zgSzP8t;
	Fri,  6 Feb 2026 18:24:16 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D00kKdzDNY;
	Fri,  6 Feb 2026 18:24:16 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:53 +0100
Subject: [PATCH 1/7] mesa: upgrade 25.3.3 -> 25.3.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-1-166935b0e379@cherry.de>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
In-Reply-To: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-bab12
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230632

From: Quentin Schulz <quentin.schulz@cherry.de>

Upgrade mesa to the latest stable release.

See https://docs.mesa3d.org/relnotes/25.3.4.html for release notes and
sha256sum.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1607fddd4b..d075210015 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
-PV = "25.3.3"
+SRC_URI[sha256sum] = "3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb"
+PV = "25.3.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

-- 
2.53.0


