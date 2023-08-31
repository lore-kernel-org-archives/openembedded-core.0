Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23C8C83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:33:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8418.1693449181341695147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109547004"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109547004"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:32:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EA174E8529
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 32944CF7CB
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A98CE6BEF6;
	Thu, 31 Aug 2023 11:32:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.115 -> 2.4.116
Date: Thu, 31 Aug 2023 10:32:42 +0800
Message-Id: <1693449162-27730-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10-1.174100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGG2dw0j7ViZrngIgpj8eDcBpkajQR5gb3u4MDNBmYzhg32m
	PO5tnascnRE+fI6etkginSbrVWP8qbqwZd/WfE3dKa9K/Q8PDM5/0ezdDMLhQK69UGAT8tNOL+Y
	W+NgZ0oGLCiAqlJkwH75FWpzzZ61oWImulwNyZVEu/kTKv9giuqwOHO1Fdn0Kb4tj0DvxRUIs9r
	o6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186936

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.115.bb => libdrm_2.4.116.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.115.bb => libdrm_2.4.116.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.115.bb b/meta/recipes-graphics/drm/libdrm_2.4.116.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.115.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.116.bb
index 50206f2ba8..f0aaf314c6 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.115.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.116.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb"
+SRC_URI[sha256sum] = "46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a"
 
 inherit meson pkgconfig manpages
 
-- 
2.34.1


