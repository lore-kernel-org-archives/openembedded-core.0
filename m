Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C93C61DB2
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.11660.1749026746197751398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VExWHnv7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026746; x=1780562746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ActsipXF6SBIztkd94lYGgTXT+P6AyjkR1GIq2lAtuw=;
  b=VExWHnv7YjQz9gjmN/en09PIIVPqR4haaQ/qY61AZvbKLpxQdhhTo5Eq
   tlr7VEMdbtyDrxwGEjZi5a9bdjAMKxDP/2gtmanB5T1SnUSqMdGyngVI0
   yvy2M6FyrYNVHcqR75aGpNExBJgkGJbJKxpilpelVkUvkH8dlOtCN76Qa
   JUYvDcxRj/NLHuoRBQx1v7q0wGDq2zDTtsMnzhLGz0IzcWBCN0b1JmCJN
   jAyXluOWVzsOid0GOvxXYOIx1deMzHojdCkzOgyv2g4uVS3RKtv9b18eE
   JntWjiJKNqurIbScTgtRR/c/3PgwOpgDrcTHlmhV1qsH6jXG4Efk6VqID
   Q==;
X-CSE-ConnectionGUID: ryaZnqQOSnCNz6+yf2jZtA==
X-CSE-MsgGUID: ULzW6Ax2T9uqgHre/ZeBvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="189666635"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="189666635"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A0E32AB73
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 36B33D4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:41 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D26971A0078;
	Wed,  4 Jun 2025 16:45:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/45] python3-hypothesis: upgrade 6.131.14 -> 6.132.0
Date: Wed,  4 Jun 2025 16:45:14 +0800
Message-ID: <20250604084524.864-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217885

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-hypothesis_6.131.14.bb => python3-hypothesis_6.132.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.131.14.bb => python3-hypothesis_6.132.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb b/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb
index 269ed936b6..52688b8765 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "347edc46cfe9bfcfb0598c4c927ed8fd573edfc8bacd2162023c4cf16accb702"
+SRC_URI[sha256sum] = "55868060add41baa6176ed9c3456655678d140c74e3514bdf03381dae6391403"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


