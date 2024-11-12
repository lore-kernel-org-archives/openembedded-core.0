Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E348CD3ABF4
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.82728.1731403511524592684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MMuq9w50;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403511; x=1762939511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IM4DYwEvmqZehbqUk5H8fxLD/dPVAecdrfO3Tb2Sry8=;
  b=MMuq9w50f94BViojvOwjo/owNX/Bk92AP0Ol4GTfQ+RbzIsJoBoIwHAj
   ZxoXYEqZ1AgXlUQD6ct0v/0wAoK/l1hOqNe7lMPQ4yJUIh3DXycP/6Hu9
   FIH6p50Zkq8DtDRJPHL3cx7A3DUnzIpWg1Q6FdNx8IWU8EU2LmhHwRyCG
   eOMBqti/lKXJlWCUkXimKyipUg4zt0Vv0vNzg1NEJoTRlVzxUICKRLtNI
   MY6zlXTm34ehdh5+hOmZBYc4TQSlcWSrQz1izAsYgzwproxMb0kQxpJMm
   9IoJHHKa8V02aWah4JsLzb73Ky1X/QqVGuEkXfMEx+QR5iidTbwPtJmhM
   g==;
X-CSE-ConnectionGUID: mrht6pvOQ6Oqo06d+x3cbw==
X-CSE-MsgGUID: a45tFsv9RGOgMOwGQuKcyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168063866"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168063866"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D57ED5011
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E35C2CF7DC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7093220071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F4F11A000A;
	Tue, 12 Nov 2024 17:25:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/47] libsdl2: upgrade 2.30.8 -> 2.30.9
Date: Tue, 12 Nov 2024 17:24:13 +0800
Message-Id: <1731403483-21399-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.621900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XZj7E6vHnuNZcsgu/IQFPzpsoi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBRlltS4T76BIXA1w91cxFC159jfZpwyY/TelC
	X0D9G5SFOW+4rrxLwdy16lluO4ak8ZvxkRv2+WZQ1iYq2CgTrYCTYNxscGXi/sfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207003

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.8.bb => libsdl2_2.30.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.8.bb => libsdl2_2.30.9.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.9.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.9.bb
index d46f014502..0371b2e745 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.9.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "380c295ea76b9bd72d90075793971c8bcb232ba0a69a9b14da4ae8f603350058"
+SRC_URI[sha256sum] = "24b574f71c87a763f50704bbb630cbe38298d544a1f890f099a4696b1d6beba4"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


