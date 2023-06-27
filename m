Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87992C04FE0
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7535.1687850363892851065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122377557"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122377557"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 72650D29EA
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A07FFD9AA2
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D4DD40B4D;
	Tue, 27 Jun 2023 16:19:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xorgproto: upgrade 2022.2 -> 2023.2
Date: Tue, 27 Jun 2023 15:17:16 +0800
Message-Id: <1687850250-20040-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-0.804300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yRIRh9wkXSlFvO2R6qeLYS+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9j2Sjhl7f6GxsXGjbXX5n9h+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaIBjL0CQ2RESzhXydHAg+U3PuPiJRGhwRXT21do3si5cv7rtbD86lA5RBWQd36OKB39+
	vwZbsCvlsvLVSWCTuPhc7RiW1YnX5ltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183459

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: remove " All rights reserved." from Copyright

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-proto/{xorgproto_2022.2.bb => xorgproto_2023.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2022.2.bb => xorgproto_2023.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
index a1cd66c744..94d37c56bc 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
@@ -6,10 +6,10 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
+LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=0b9fe3db4015bcbe920e7c67a39ee3f1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5d13dbf2be08f95323985de53352c4f352713860457b95ccaf894a647ac06b9e"
+SRC_URI[sha256sum] = "b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c"
 
 inherit meson
 
-- 
2.34.1


