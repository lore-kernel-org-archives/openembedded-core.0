Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BABC54E4A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8422.1709105612417738887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sFuXw8cm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105612; x=1740641612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZnJqEtBpSycjZpZEHMRJ0e3KGg1g7AF4TrAdvMTxG3g=;
  b=sFuXw8cmMVR3tIwj7WJLtSsmmwtZoTyLMJpFMl9ToLaa8QYri4SgDMKb
   n4GeJJE6EQyEt0zzwcaTwh9iLhuEj7ar6L6rBYgNFLkd9p4FztFeIXlpt
   gA60yN9ReI6apg99G9ymDD/VByRxzv0V5DIesmRMRMJrKv0qWPY5AnE3y
   aYr3x7CkkR1k7lvwfzz9RvkAmrkoiEkFh+s1F5n0uMRXXOonIIFWi/+m1
   xA9Nmi6FFXyrZHdsVPhveZy+hZldDWxN8goLd3GuhSwYU7twxKgSorKka
   zEARyQni7sVKzioqPMzktWPyQtifrklsBU1p/fnGXFvsp834+Z87JwV71
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150123417"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150123417"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BB5312E22A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48AEDD6210
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D889B2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 847E61A006A;
	Wed, 28 Feb 2024 15:33:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/48] libxvmc: upgrade 1.0.13 -> 1.0.14
Date: Wed, 28 Feb 2024 15:32:28 +0800
Message-Id: <1709105575-24259-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl5q8/xv2Um1avoLR4+zsDTtB00
	/kkeBTwBTX+8VRaFPcj+mQz2oAiXA0h3vHEEliouXr8ohVW+HQKLpZaQycnISkto8Ng8X25Uutc
	CpYnzZFtM61EiaxIBUvt0xL5gbJzvyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196347

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxvmc_1.0.13.bb => libxvmc_1.0.14.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.13.bb => libxvmc_1.0.14.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
index d6d009831a..af18afc62d 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
@@ -16,4 +16,4 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[sha256sum] = "0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c"
+SRC_URI[sha256sum] = "e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9"
-- 
2.34.1


