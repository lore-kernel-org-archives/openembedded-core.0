Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23674C55ABC
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9672.1785816316780011266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I1houZSA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816321; x=1817352321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bf0OFg4tqZUFfVhhaT12UnGh2uZYhKjogPrHkiFCufg=;
  b=I1houZSAVYbQjxJbQDwUR6Q8WNZTw4ldOItrM+8ZJyVyV1TMM/bZaYgM
   7sPb39TvoVxM09UOQLY7D3QBEJqoBPBSqhT7NDcdyyQANsWHgOVwXQTC6
   htMwAoOc5BRDyT8ZrEDhVG9uOV6q6RHEXGmIrIDfcbltetsqk+U+MMAjc
   I8bQw6yRiHfKINaDmJSABL15S3FrQ7Ve8yAcLdh5/Xx9BJNsdgY1RH7O7
   qYp2zoBEWjjJeHZz0INQGd7/5hdrBwvZVHbi7k+4oATY91Fmg0G27xtcm
   6n7QcLVuJmoy2ZL+pspQ5FKQN3+OiPofdHVxoXSRprZpwvcX6Vv8MM5zF
   g==;
X-CSE-ConnectionGUID: Dmzk004cSJukZwQUd0Y3vw==
X-CSE-MsgGUID: T0K9zOkvSxyy2kzytyQtYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253187896"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253187896"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4CA4B42A337
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:17 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F0C9A18915C9
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1BDA71800514;
	Tue,  4 Aug 2026 04:05:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/8] libdisplay-info: upgrade 0.3.0 -> 0.4.0
Date: Tue,  4 Aug 2026 12:05:02 +0800
Message-ID: <20260804040509.1454-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242678

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libdisplay-info_0.3.0.bb => libdisplay-info_0.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.3.0.bb => libdisplay-info_0.4.0.bb} (92%)

diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
similarity index 92%
rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
index 380c12b867..d993bf1061 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
 DEPENDS = "hwdata-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "47a5590e9c4eb35d67651b8c05a55f1a48259329"
+SRCREV = "c67a3e9bedb05ab61c7443704a1a107e76254595"
 
 inherit meson pkgconfig lib_package
-- 
2.43.0


