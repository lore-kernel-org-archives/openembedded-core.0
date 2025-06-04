Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E4BC7113E
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11723.1749026741228461368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jN2SKs9w;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026742; x=1780562742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xlXbPy9UFpsIMzwm/sDp7eAfYRPAsISz+wBAFs706q8=;
  b=jN2SKs9wsPXaidzP6xb0QxwrB92GiYMjSOzbQIIPgYfL4j7A3e5/ih3T
   ni2uBAMJm7J8GVJ3kTKNBARnBR5XPo6h0QlODCx3jJOV0BqhOKO/AhYxw
   YbHkn49FC0QOsLjhikFWdtA1IEJ8Ofa5C/ayXw9hH9+lyeuQbtenAsdup
   dEBH1LV0AFnadRBsHi2xU6aswwPD6cQO9yRIpghCqTsqQKfdrdBj7dDjv
   tmmdbdkEnew55n8kZ0TQNk4SsW7AmFp2t18fYgxW/AhmL4o+ojZ2wmVBg
   6wFv447TP5H7avn5cyszBcO+FAkC18Mh8FaSq6Q/JS6E76kShcZIAKK6h
   Q==;
X-CSE-ConnectionGUID: 9ZeO/FHZTg20/rwCXfK0+g==
X-CSE-MsgGUID: nNabbATnTkq9AnFNE6J4NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="180576709"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="180576709"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 13596E8FDB
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C2B66D4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:38 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37F8D1A009A;
	Wed,  4 Jun 2025 16:45:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/45] libxkbcommon: upgrade 1.9.2 -> 1.10.0
Date: Wed,  4 Jun 2025 16:45:07 +0800
Message-ID: <20250604084524.864-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217873

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.9.2.bb => libxkbcommon_1.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.9.2.bb => libxkbcommon_1.10.0.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
index 77ee8ce500..e10bbf7af0 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
 
-SRCREV = "dd642359f8d43c09968e34ca7f1eb1121b2dfd70"
+SRCREV = "7888474d0296dcad50c9ba4adfdfdf2be02d35e1"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
-- 
2.43.0


