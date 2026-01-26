Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6B4CF65F4
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19054.1769430927850852754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gp7bTkRd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430928; x=1800966928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fq7cgp8oHESFDbONqIR2vtWnsX65QEfXO0BTEkN9+GA=;
  b=Gp7bTkRdIn+enQ8B+o14RaMp4HBuGPobFJX9AZ6C7A4zReO0tQi3Uw8Q
   mcACOthDWh5V/qaNTBb9kZW0HXQWt2u0kZ8HLjrZ337qRKVPNeOVSl/q7
   77urd43kuP/Ygj0qhQUCHUVLv3sEzN6PExUbaKazQ+Tz1LlRA6uTL9BAc
   L97kGwg/XFu3yI8CmlsukHMMcHQBwNOZOLgc0yZAd0PxDkerIByKFVY7m
   jvqdQ2gLLAQ70p9SlLrFQGPYcx82HGN2teM9IH13+HjZPuv62pilX189u
   mywtil4TFn8+S9lhZnfV2KjF3Kij52Hs0kWCitI8vG2W0ytrKeAa5DJgZ
   Q==;
X-CSE-ConnectionGUID: q4/9VNfZTHSOylVD+Rtufw==
X-CSE-MsgGUID: 4EaDFcjMTuCjlkHUXRrLJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="215715590"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="215715590"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1F320676C
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:26 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C4A9AC012A2
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2D1B8405981;
	Mon, 26 Jan 2026 12:35:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/17] harfbuzz: upgrade 12.3.0 -> 12.3.1
Date: Mon, 26 Jan 2026 20:35:01 +0800
Message-ID: <20260126123517.1020-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229985

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_12.3.0.bb => harfbuzz_12.3.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.0.bb => harfbuzz_12.3.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
index 12cc3bf2fc..d69f617cbd 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7"
+SRC_URI[sha256sum] = "3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


