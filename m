Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8584EB28FF
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:24 +0000 (UTC)
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2788.1770398659359776018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D16W3HzM1G;
	Fri,  6 Feb 2026 18:24:17 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D14KMQz8nB;
	Fri,  6 Feb 2026 18:24:17 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:57 +0100
Subject: [PATCH 5/7] mesa: remove libxml2-native dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-5-166935b0e379@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230636

From: Quentin Schulz <quentin.schulz@cherry.de>

Native libxml2 is only needed for xmllint which in turn is only needed
when build-tests meson option is enabled, which defaults to disabled and
isn't enabled by the recipe.

We may need to revisit this if we add ptest support in mesa I assume.

Let's remove it from the DEPENDS for now.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b2dfc6130d..8e5f9657fd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -44,7 +44,7 @@ do_install:append() {
 }
 
 # All dependencies **MUST** be -native. If not, then add a PACKAGECONFIG for it.
-DEPENDS = "makedepend-native flex-native bison-native libxml2-native chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+DEPENDS = "makedepend-native flex-native bison-native chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust

-- 
2.53.0


