Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF03C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.12714.1724136734165970101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FSlkn0hE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136739; x=1755672739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gl9+5oaiMwM1G0cspqHH6TvZ8CfbQNd5EBvYihNCsL0=;
  b=FSlkn0hE5qj42OAaqn4cP6wqJB8X0GSVHQni3nAZk+YvIaJfV/I2k4mw
   jiHY+8IQiC3tCR816XoQiwXWHYcLEI9bkIz0lLzlWCZdID3QxatnoGcvK
   l34Cq1u+vwVJuOQ3g4+cEMJdl7tMIS5iganUYV9B57yD73iL4Sh+fXNo+
   G4b2VV1TkLX6whQ6yMJLt90pOM/a+zljWV0pnbbdF4mekyO178C0ePbi6
   t3FyCqnlIeiH8LCuTf6eEXTLC+FVLR+ZRFjGRfR+gZqr7nNY4ai9nZGEz
   UZCjztxh2Cfz+wvDddm2Zc7E2rM5pA8nCTdvpdb9xW3gtRVD/YZhGzrEQ
   g==;
X-CSE-ConnectionGUID: mT8XyjEWTN+Z/FXlDFHtYA==
X-CSE-MsgGUID: SkHdFZJMQj2Icx8R4muM/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="170301735"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="170301735"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF037D8016
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21F5AD753E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4400216766
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D1EF1A000C;
	Tue, 20 Aug 2024 14:52:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/24] libxtst: upgrade 1.2.4 -> 1.2.5
Date: Tue, 20 Aug 2024 14:51:33 +0800
Message-Id: <1724136703-20023-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--2.317400-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnRgHZ8655DOPFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtfUe
	ErNKFJickV258kQg+PQ/vULMASHMuVLYf/ZENdjHMo8RGcZRE1zLFZ8/+8qiN8IHqfdtv5dRhh9
	GYR9dg+yO/zSKOYxY7xw627SFZc7PyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203535

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxtst_1.2.4.bb => libxtst_1.2.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.4.bb => libxtst_1.2.5.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
index db0621ba2e..df381b7d65 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
@@ -15,6 +15,6 @@ PROVIDES = "xtst"
 PE = "1"
 
 XORG_PN = "libXtst"
-SRC_URI[sha256sum] = "84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8"
+SRC_URI[sha256sum] = "b50d4c25b97009a744706c1039c598f4d8e64910c9fde381994e1cae235d9242"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


