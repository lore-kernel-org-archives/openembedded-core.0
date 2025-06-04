Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF285C61DB8
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LI8cEcZS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026744; x=1780562744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9hOUGymOBjlghnVSmSXonieIGhjq9xnfcfEV3koYZo=;
  b=LI8cEcZSgC/dP1H0XPS3P52Km3SnvdQ9KOB0huwhRLgGCcqlvO5JBcO7
   nQcAoiZNA6on9tTlMI0/aLGObHcabHSGua3S0Fl+5hA+VGKAxsD/fuFWR
   3o421g+HtqXPeFXy2Rs8G2ILB3+d60LXsZGVWp4rR8t05MFtCtv/TA6xp
   BrKvLSRspCp5eAhMK2v4VSUwf0aON+UNoK5cgv1nx7tl/aMvEBNZxCuUQ
   0Zkv6Ug/ucOPA94QgeVnU/aSh84JDsRa+7TwjDZlGtuMecQK4qQBrMTB7
   JpB95ePB8ChVg2OWaTfWeBtAO2NoADLHIw+UFdRALXTLPT5hCF1eyPX7P
   w==;
X-CSE-ConnectionGUID: q2vEF1YAQ0GU2WuBgZjbRw==
X-CSE-MsgGUID: DKxY4X92SK64MoPzKZp8OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182748"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182748"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BA67D4C2B
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 198ECD4C19
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:40 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B6CBC1A009A;
	Wed,  4 Jun 2025 16:45:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/45] python3-beartype: upgrade 0.20.2 -> 0.21.0
Date: Wed,  4 Jun 2025 16:45:11 +0800
Message-ID: <20250604084524.864-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217879

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-beartype_0.20.2.bb => python3-beartype_0.21.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.20.2.bb => python3-beartype_0.21.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.20.2.bb b/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.20.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.21.0.bb
index 9941b28fd8..43427c1472 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.20.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "38c60c065ad99364a8c767e8a0e71ba8263d467b91414ed5dcffb7758a2e8079"
+SRC_URI[sha256sum] = "f9a5078f5ce87261c2d22851d19b050b64f6a805439e8793aecf01ce660d3244"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


