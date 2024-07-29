Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E8BC52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:41 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46587.1722215420520138463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Io9vp96n;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215434; x=1753751434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7KCs4PH6Kvm6cF3gzNf553Lgz6pZuUpz+R4TNkJzm/I=;
  b=Io9vp96nnoWRCA5ver716gThwZXQbKk+yPXGVChrZYhu6H4YkfGRP3Am
   xYF5ccgGEzD5JJ/myy20sj8H1B22xAX6XuoaYRk9IC8vQyfuZR/AAM7Bk
   bJvu5O/dg3+l0ETpI62p2yvJHiMUPuzzaxvWQRRjA1e8oQLR8gPlTZcxh
   5Bdqi348Q/9W1zGFjMueKY27ahWRQsfpFyjjDavlngbvjp5Ho+iI/PtXf
   /FFw0jLTuoitd6j2Rfzt7yIAGPV0xyQbnnI/FzWDKOMdZGU1w1uHMsW4e
   dYEWdr/hYK52Uz9c/uoPfg7fFZjwpCcMgna2DG1NtR+zHMRGSBKEMGwr8
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="148298443"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="148298443"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C4E0D9233
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DE904BF3C0
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7932882D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B8D21A000D;
	Mon, 29 Jul 2024 09:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/33] vulkan-validation-layers: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:10:06 +0800
Message-Id: <1722215408-27541-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--1.473600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX5WiD0nzhO6Guce7gFxhKa2YkAyCbA7KVws5GlXF672zo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9E4kYXbobxJbJtwx+p5fx651ap9wyDd4XDPX7BYUgzxuBmtq
	siaeyM4MZnZqnLrHtxpkEt+6yqmqgjUXFkf3ZDjkz5B+xUI45ahGjYFwJdDesstkteWu89JOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202603

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ers_1.3.283.0.bb => vulkan-validation-layers_1.3.290.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.283.0.bb => vulkan-validation-layers_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
index 2f1efba856..cfb8954f87 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.283;protocol=https"
-SRCREV = "d5bed3e26b3d487e8d21f0cc39039351eac921a7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.290;protocol=https"
+SRCREV = "a92629196a4fed15e59c74aa965dd47bd5ece3b7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


