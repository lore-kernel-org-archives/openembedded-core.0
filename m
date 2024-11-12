Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7F6D12D66
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.82427.1731403530911454151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jtSCpuFw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403531; x=1762939531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SYPpebQll5iCbhDIJLYdnaPNf60beR8p/XgkTAQbhwM=;
  b=jtSCpuFwUnVcoRRM1/JHOVuOZjJooO3HsM2y4kHO7potYoGVeLyXROwW
   NAgyQPAMCb6vWGP6n867DrlSeQyEr/I9M7If//9mRL7w7qSroJ3C+Kbw9
   6va13ahBJ2U28tUyQVfugcCWGGL40jEXrSUI9rqOVpTaXTqc5dugPkm4f
   e5NuDowh7xpXWfcnf9YAR1dF+Hj/uLXAwhafLsiauuv6Qx+xl+W8SUY3T
   noks5p68tnqegGFeu3gO/7prZJwIeJb8Yb5zyJafVgr5+4nxMH3TnxAv2
   c6+Zj/t0AUVJ/yfHymFqw9ARdLX76F3XaEbPiMril9lf86UQTWEn4602I
   w==;
X-CSE-ConnectionGUID: d0dvVf/NTF2J3+FrUpaN7Q==
X-CSE-MsgGUID: VQ72PQ19RY+ZYuV73FKnRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168413912"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168413912"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1F29D9C0E
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E949E498B
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA18A20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A69A1A000A;
	Tue, 12 Nov 2024 17:25:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/47] libxcursor: upgrade 1.2.2 -> 1.2.3
Date: Tue, 12 Nov 2024 17:24:16 +0800
Message-Id: <1731403483-21399-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwP/hxxPCwzUoPEQdG7H66TyHEqm8QYBtMONut
	ukRNdpz+46IYW+X2KAbcqCoVvb327K9W8Ne05FP0SHQtEAni96JRhLck41sfWnLCpKanz9vi3g+
	w28UA/c9UrlN6RQuu4gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207007

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxcursor_1.2.2.bb => libxcursor_1.2.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.2.2.bb => libxcursor_1.2.3.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb
index 159ac4f7fa..29a73a3061 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb
@@ -18,6 +18,6 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[sha256sum] = "53d071bd2cc56e517a30998d5e685c8a74556ddada43c6985d14da9a023a88ee"
+SRC_URI[sha256sum] = "fde9402dd4cfe79da71e2d96bb980afc5e6ff4f8a7d74c159e1966afb2b2c2c0"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


