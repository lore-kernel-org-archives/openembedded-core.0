Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AF8C54751
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.45917.1747040640301092208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CegVWynF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040644; x=1778576644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W5sSLEmFl/VeDBH/qwgvkSJkuSnh5CR8n+FJ5qxe7PU=;
  b=CegVWynFjgJkYo41H/kU9crTFHiz3AZABbY4xQOa3/mlq+BCoRuBb1MI
   eXLp/cB9HyJr08rVx1uB0vMJY5rx+kxTWJc7WW10l3C9kTeOGmjXBeOj8
   mJsSL0bb8aVblDbhnkp8i72xPYXC2JDIdG/ij/ecZWQMw8c/2FUlct2Ow
   lgApTshCYaS7eO2uVWTsY4DZngmAb/C1bA9+BWDYsGkOqY27VaZFa3pir
   zd9CgX4kwOvgOfTWOOTAiIMKBaHV4LD84ev8JZ/pSeGoIB++RMRVhwAc+
   XPbir3W7ctjQgcMvBB4TS+6k2AlgAB57GQNezvpRX5pJOfnn0bERnZPBt
   g==;
X-CSE-ConnectionGUID: pT216ePQSvu2lcIrN0vfRA==
X-CSE-MsgGUID: 6jIHlGmpT1qmQ71njigAiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178046172"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178046172"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A581D5004
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 498D2D5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07B7C1A00A0;
	Mon, 12 May 2025 17:03:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/56] pixman: upgrade 0.44.2 -> 0.46.0
Date: Mon, 12 May 2025 17:03:17 +0800
Message-Id: <1747040619-7566-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216333

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{pixman_0.44.2.bb => pixman_0.46.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.44.2.bb => pixman_0.46.0.bb} (95%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
similarity index 95%
rename from meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
index 2e5bb172f5..c1c71fd420 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
@@ -8,7 +8,7 @@ SECTION = "x11/libs"
 DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "6349061ce1a338ab6952b92194d1b0377472244208d47ff25bef86fc71973466"
+SRC_URI[sha256sum] = "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.43.0


