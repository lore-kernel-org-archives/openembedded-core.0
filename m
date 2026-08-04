Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD14C55ABE
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9676.1785816332625987997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lk9rmdXP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816336; x=1817352336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bIYykSxHI3D9qCPKuXttetCrcWfIeKOyGa0nS0yaXsY=;
  b=Lk9rmdXPnDJWgmn6SlKdpZq7R0smP76QH4+frskq3qz5RDpJnZWlK4b3
   kAyhQyDUikY7I1Qsa2WVzsD2e0h8ReKotRwD+g4cgNS1pmqM6qsfMIM5f
   pkL9m9r4rj3B5gs53kYu9O39DP1/CzNtUGiKSaLJ+XbtoW+7IJoAzyIfM
   m3m3/DQtDvK9Wy6T92r0zoCP/zV0OX7xHoXl33KCeJTNVstKSXK2ddh8w
   5Qu6n9IUEQkx2oFZmmf5IofieUlsWxT5+FJ1rEarJFePAeisaYOzON4tP
   +bQp18xYV5SGELZzKPpLo0mk810QJpLRGND9Hp/d0A8kvsgDcs8iRyy0O
   g==;
X-CSE-ConnectionGUID: leJ3/ZQ+TZCRJFEPehJ0aA==
X-CSE-MsgGUID: aXN2iAA4RIWWL4CnGpTxkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249534813"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249534813"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CEA4A82070A
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:30 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 857B018471C4
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 941D81800B07;
	Tue,  4 Aug 2026 04:05:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 8/8] xwininfo,xvinfo,xmodmap: upgrade 1.1.6 -> 1.1.7,1.1.5 -> 1.1.6,1.0.11 -> 1.0.12xwininfo,xvinfo,xmodmap: upgrade 1.1.6 -> 1.1.7,1.1.5 -> 1.1.6,1.0.11 -> 1.0.12
Date: Tue,  4 Aug 2026 12:05:08 +0800
Message-ID: <20260804040509.1454-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242684

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year of xmodmap updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xmodmap_1.0.11.bb => xmodmap_1.0.12.bb}         | 4 ++--
 .../xorg-app/{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb}             | 2 +-
 .../xorg-app/{xwininfo_1.1.6.bb => xwininfo_1.1.7.bb}         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.11.bb => xmodmap_1.0.12.bb} (73%)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.6.bb => xwininfo_1.1.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
index dc955aa977..633c70ee04 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
@@ -9,9 +9,9 @@ from the user's session startup script to configure the keyboard \
 according to personal tastes."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76caa89655fe179dbb374831c98ca65f"
 
 PE = "1"
-SRC_URI[sha256sum] = "9a2f8168f7b0bc382828847403902cb6bf175e17658b36189eac87edda877e81"
+SRC_URI[sha256sum] = "fc54b9b5bbf2ae58ba8f9d42bd051c41c7438377400c42c17d7496d19e1bb3ce"
 
 SRC_URI_EXT = "xz"
diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
index d7e5d917ef..75f9b26a85 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
@@ -11,4 +11,4 @@ DEPENDS += " libxv"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3ede71ecb26d9614ccbc6916720285e95a2c7e0c5e19b8570eaaf72ad7c5c404"
+SRC_URI[sha256sum] = "a436945e6a4ab70590358eec2b85d26970f7de480d27e8a25af8fe8421e88ae2"
diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
index d410f7d519..6fc49e8729 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
@@ -12,4 +12,4 @@ DEPENDS += "libxext libxmu gettext-native"
 PE = "0"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f"
+SRC_URI[sha256sum] = "bee14d594cc86cc59aae1015c1b452a71bf60c304131e2716ca1cf0df733b4ac"
-- 
2.43.0


