Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D27FC7EE24
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.26247.1750065413231284673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sIXxgggk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065417; x=1781601417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2iOSmD1EjnVakaNEQMJoylYekpmPbmIpQ/Q1fAKhU0k=;
  b=sIXxgggk+wfLsuh85f2+6IwD9xZqnlK0bh+XPuqna0e6lrOYyPAj4UVr
   kgEQUIrOuoe2XHu2d4pJHTpbUdT4tRmRnkAcnq2ujDiEPmzKhNzGHsHmq
   N1RlIeEzeO3JPjGeK9ncryvFu62nA8UZ6KTP8Z9VSjr7dGIT+kAPvrz2A
   3zDGUcipgtz+Fp9xkSOK4dSWZzW6z8Bq5iUf5N7TSQ7ErjSaL7DLQ2WEu
   +iPiGnMFHsKOXqXrGaO3TDn2Nuf/BVpDI4J/833+LnINc/GJm2D2hL5nO
   01gQ+zbLXRNTwNHl25LaT5Rc4rMQ0blhFcIpF0qj0x3ETyXWDczdtmZbr
   A==;
X-CSE-ConnectionGUID: XeWLs+6eSu+cyZPCezb1YA==
X-CSE-MsgGUID: ExGkFkHaT1W8sbt48ezhOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202821355"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202821355"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C3B6D4C24
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D600DD4C03
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66D711A000B;
	Mon, 16 Jun 2025 17:16:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/24] pixman: upgrade 0.46.0 -> 0.46.2
Date: Mon, 16 Jun 2025 17:16:31 +0800
Message-ID: <20250616091643.918-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218785

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{pixman_0.46.0.bb => pixman_0.46.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.46.0.bb => pixman_0.46.2.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
index 925a7d7b29..1662260447 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
@@ -8,7 +8,7 @@ SECTION = "x11/libs"
 DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d"
+SRC_URI[sha256sum] = "3e0de5ba6e356916946a3d958192f15505dcab85134771bfeab4ce4e29bbd733"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.43.0


