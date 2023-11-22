Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953B7C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:59:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.15230.1700643588798490387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119366751"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119366751"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:59:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 235EAD9DA8
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:59:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 667F2DA231
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:59:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F47C20079128;
	Wed, 22 Nov 2023 17:59:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.117 -> 2.4.118
Date: Wed, 22 Nov 2023 16:57:42 +0800
Message-Id: <1700643462-9414-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10-1.174100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGG2dw0j7ViZrngIgpj8eDcBpkajQR5gb3u4MDNBmYzhg32m
	PO5tnascnRE+fI6etkjzVAOH0ri9sJhi0o3GutHGDkC7OtAOWvxUUUbm716ugq8lkPn/BUc5Mhd
	EvDTamlOazsEAR521GTCRwg09G6sF9Vkazft3CBEu/kTKv9giuqwOHO1Fdn0Kb4tj0DvxRUIs9r
	o6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191028

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.117.bb => libdrm_2.4.118.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.117.bb => libdrm_2.4.118.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.117.bb b/meta/recipes-graphics/drm/libdrm_2.4.118.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.117.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.118.bb
index 3e6fb16e15..7e0b23e219 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.117.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.118.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b"
+SRC_URI[sha256sum] = "a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88"
 
 inherit meson pkgconfig manpages
 
-- 
2.34.1


