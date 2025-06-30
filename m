Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71D9C83F03
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.35288.1751274805183499294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NHNmAYaX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274809; x=1782810809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NTP6jAF3hj/GhnBfyVRxrcsBy/ykt8ZC///fQ9Hgyf4=;
  b=NHNmAYaX9h6+DpNj8TOxcs71gYhU8oC8StJ3A/HPdQZVSjxSeWAgHDcI
   zrRQ1FSMHOTPFu7ws4tK8Q860MBOzIWsX4xSSd+82sI4MdIkIc/boIRXl
   ZltLHYX9e5H4gunn8RFOguyFSmEwTDrkL2osKm763LunD0AGa4F3WrfME
   aSd2eeD4dpJnXhVPip/Bl4js72xVO76LY7mFgXad/fPwHuK7iIQ1SofzZ
   Evhyf5Crp48iiS/usN8wDs1YlC96uzKxgHsZpVUS6UF9RbqfWfdCz1UNZ
   Ys4pYhzuyCJQV1Q69ojrZ5if1r2Xbf225Y37sIoLvzsvI6SowrXWIpFxJ
   A==;
X-CSE-ConnectionGUID: txtUOO3BQ2mt2/G27qVI8g==
X-CSE-MsgGUID: jVqESY21SwCMPyWwrmHqew==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="207712153"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="207712153"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:28 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 12CCA1C02137
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:28 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id 89F6E14003F6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EADB0CFA20
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:26 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 765C91A0073;
	Mon, 30 Jun 2025 17:13:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/37] libogg: upgrade 1.3.5 -> 1.3.6
Date: Mon, 30 Jun 2025 17:12:55 +0800
Message-ID: <20250630091315.1897-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219475

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Update minimum cmake version to 3.6
   This fixes incompatibility with cmake >= 4.0
 * Fix UBsan issues
 * Improve allocation failure handling
 * Fix various compiler warnings
 * Fix various autotool warnings
 * Improve continuous integration testing scripts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libogg/{libogg_1.3.5.bb => libogg_1.3.6.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.5.bb => libogg_1.3.6.bb} (87%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.5.bb b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
similarity index 87%
rename from meta/recipes-multimedia/libogg/libogg_1.3.5.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.6.bb
index 402d700aa1..4810f156f2 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705"
+SRC_URI[sha256sum] = "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061"
 
 inherit autotools pkgconfig
-- 
2.43.0


