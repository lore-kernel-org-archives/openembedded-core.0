Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6DBC83F2E
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2991.1752566914416300964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LaCVQoVi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566914; x=1784102914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bWUxXJai+vRAd//Q1MQhdftr/1g7JgBbXB4/4oDcvYM=;
  b=LaCVQoViI2D8Ru4wrUlr7JHxqU21Ob0bQdFqtIjc4oYZeTq7R7ek8KEN
   R1eXd/V4tO8P6Ix8ljH4IaMCivNSyFuQpC/qWxKGfrAvHxIG5uZk5+md8
   uB39rX/cQYR6Aq85ZOodkvJs+tw8L4wTLmgSx04MVC4Yw2TuEJMaYqfIz
   fD29dsM8oIXBBWp7g7CiCom2k6MDbVqJEgILCQ4UcTfffBZfsLjkeo6Lk
   l6PUN35x9jOCS0ZNYjnvMpcgoj5B3Zaz38iu8VSQcGbPjuRHTGJugXNDZ
   Cy1B5/of1V0ygDJusjvau75r6J8OrvksYVweHgNUXhcRSjEPrQHLARBau
   g==;
X-CSE-ConnectionGUID: VUPzzYDoSGq+Cx71ZlMROg==
X-CSE-MsgGUID: EWReJdWMRFWHtZXZGb27UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="206364871"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="206364871"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:33 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id CF85AC00233
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 37878C01811
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C22A61A0078;
	Tue, 15 Jul 2025 16:08:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/19] ninja: upgrade 1.13.0 -> 1.13.1
Date: Tue, 15 Jul 2025 16:08:12 +0800
Message-ID: <20250715080819.622-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220282

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/ninja/{ninja_1.13.0.bb => ninja_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.13.0.bb => ninja_1.13.1.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.0.bb b/meta/recipes-devtools/ninja/ninja_1.13.1.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.13.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.1.bb
index a5fa8f1c9e..dcaa889c04 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
+SRCREV = "79feac0f3e3bc9da9effc586cd5fea41e7550051"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.43.0


