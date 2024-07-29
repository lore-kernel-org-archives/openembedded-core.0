Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62E0C3DA49
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.46940.1722215434845099292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HhpgTzx7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215435; x=1753751435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YGKvFfUKGwbRorZNTxG6x86caynSMzDOO9JKV1C26b8=;
  b=HhpgTzx7iIugN2CvEbfgXVEenGsakfGnSnOFF+hUIXNf6JdlXvu3/8ui
   36Pxrv0NFXxJ66Pf1uzHXWIAvbuVIvpHjx0WuHafNagyuMfY8ghb/HBpo
   0T4kJCV6IsVJWsR8LchC78QabSn5zKOs6USb6IRR7GeoU3SaMXlBVJ0ge
   uqPLYenZ6ZsijHf5ZqY6teZfpAY0wqNq4nOzN0sE1Bh82Hvy9IeUpqnjm
   1juGbaPrsekXKAN5/beQzlsnPdw43Hf08BLHqyx9b8gtUzRp0G53i7mCl
   mtczuwvEiu3WsUDCOq4n70RDfH4uklKR+GQ3fPkDrSvHtWZfjMPkLEMWP
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="156880018"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="156880018"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60659C68F4
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 94348D39ED
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18243401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B2EF71A0002;
	Mon, 29 Jul 2024 09:10:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/33] vulkan-tools: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:10:04 +0800
Message-Id: <1722215408-27541-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--0.256600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX5WiD0nzhO6Guce7gFxhKa2YkAyCbA7KV50C6WJNXTpiezJ
	3Mv1/YUvi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJX/7ZWI5DFFfG+qyTeiumrn50
	pOwsLXlan0ToXGneC/7rnA/fLi+PUJVQBf000jln2T5Ne+KFuHfmhw2XvrT/+DZsZ6129X6ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202607

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.3.283.0.bb => vulkan-tools_1.3.290.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.283.0.bb => vulkan-tools_1.3.290.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
index a76f60735f..9ef7d4daea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.283;protocol=https"
-SRCREV = "38321da9031f5909f1ca2dbafac8840ef6b2c144"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "53a6ba7c235cbe0b0f3e85e3de6d9070bcfec710"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


