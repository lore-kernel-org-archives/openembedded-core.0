Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07369CAC5AF
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.273.1758229693715013407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=e/mhWKRo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025091821081175b0c802a7000207da-fjbz2w@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025091821081175b0c802a7000207da
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mBv4YH3kw6M5NcYb0EldzR7fnI5fUgqrL7iIHC8HWDA=;
 b=e/mhWKRopH2RscPKrXjRI1yUBa+TwG+EOJcy+sJqvlSnWszgXQFph1MqjZ2PkB0upojzxp
 ps34pjDtHelxuvvHrFCJkrAOM3E06KiaMw7hrHpWOuLi1oFy685QkBQ6JTpV1BsoTWISmbPt
 7ef5Emn6YfQ3D5Nee7iIXqVcOhXaTT7o/pC2VqmDE0W7Kb/dv/a6oB4nD4sBGVhA8CIygMuu
 ZbKcQxfjSLfNO2t3YKCiTZzlROmlPffhgIyY+waz5OWYOSGLGQCtgeG51mpxMrq87PEdNDbv
 +p7AQTPF2uR21jripSe3GkVryHIsSYw1pS4RsSO4T6JtkL0xq0Evteog==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/19] oe-selftest: cpp-example meson version warning
Date: Thu, 18 Sep 2025 23:07:04 +0200
Message-ID: <20250918210754.477049-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223662

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Newer versions of meson throw a warning if newer features are used
without explicit declaration of the required meson version.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/files/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/cpp/files/meson.build b/meta-selftest/recipes-test/cpp/files/meson.build
index 0e2b55f3a2b..74a0e0173ce 100644
--- a/meta-selftest/recipes-test/cpp/files/meson.build
+++ b/meta-selftest/recipes-test/cpp/files/meson.build
@@ -6,7 +6,8 @@
 
 project('meson-example', 'cpp',
     version: '1.0.0',
-    default_options: ['cpp_std=c++17']
+    default_options: ['cpp_std=c++17'],
+    meson_version: '>=1.1.0'
     )
 
 jsoncdep = dependency('json-c')
-- 
2.51.0


