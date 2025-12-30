Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055CDE95A6B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61208.1767086264445490295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WsrJ1RfB;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086263; x=1798622263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dsPwce5CFU/ZXWiV8ZsLDnj9XkTZatYEYgO7ehCGlOU=;
  b=WsrJ1RfB4aVnBVIFMp1SdMMUntDQ+HI0dZGM8zmg2XKHSdhezSOeo+wd
   c0ho5ST7HoMzRa9xnzzUTJdxPDIjmoRd7BkxGgZJPEa8FCLWVQz0PlODP
   OilFo3L+gNLCSMlNkfQtJGa7DgE7B/CPOkVf2ifax0kAVmOjoDZZGpFp+
   Puuf7jPYpQIMEMkRtH2OwymebwcwgQ9F8+VRSgXXCd1z3RMFX+H7Dhae4
   tVJR2lrJjeWwhPdlxy714JA6i/iHv3JIKcXK5lnI0jaARzIn5SfRIZ7bt
   p1ZHnVYHpivxe8/IpcjbTLoZbS8RBCI7aIl8GsZ9zdFZIz3dzGYfJQ6Se
   Q==;
X-CSE-ConnectionGUID: W4YPzgZITQer72PsOs5H1A==
X-CSE-MsgGUID: ODgYNoboTSif9OgGlE8viA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="203284987"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="203284987"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D7B221C1C701
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8C52D1400381
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id ED8141800587;
	Tue, 30 Dec 2025 09:17:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/12] ninja: upgrade 1.13.1 -> 1.13.2
Date: Tue, 30 Dec 2025 17:17:08 +0800
Message-ID: <20251230091714.1501-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228649

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix Ninja exit code when interrupted

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/ninja/{ninja_1.13.1.bb => ninja_1.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.13.1.bb => ninja_1.13.2.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.1.bb b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.13.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.2.bb
index dcaa889c04..e750c78c46 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "79feac0f3e3bc9da9effc586cd5fea41e7550051"
+SRCREV = "3441b633c2fe2c494e958780ba0f4227b1327634"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.43.0


