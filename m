Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B6C3ABD9
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.45971.1747040639732804618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oyw2j17k;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040646; x=1778576646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uD47tXeMoVTAG/VPL2gPgAWGUcbE8BscAkrioBb0Cyc=;
  b=oyw2j17keEYYtokCyPH9HKBsC0uayL3KAFX46D03XA9Ce2RKaSMaR2ZS
   ITQA9CFsko+jaxRfVePDcXpzz0KceiFLbzuXs3JuWXinhGLJ7X4tQYi6W
   gTKtFmO/RcVw3l7MecQwQKPM/cAAgmnHmRwgEGqF9aA4qQZODY04O1xI5
   ++o49SPE/SVc4KuVIAjYWJZtsxhZLZKf2GHWj2/k2+dvrcCUq2b5xEYD2
   1o//tppSYG9PHBuT/Igszxh5FiHzO3Y/xJmSLsP4mIuwIt7jWfU6VMKpG
   eihIGwZkoynsFt+mAgvC/Q9IV5AvK/VCVgk74mnOp5+dTPAHeNPvyTd4c
   Q==;
X-CSE-ConnectionGUID: hW0USChWR7aFDPlc0Osa/Q==
X-CSE-MsgGUID: lIqZ6xwUSK6r+k7v9kZ8Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178629716"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178629716"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 49D42D6F06
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 187DDD5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C63CA1A00A0;
	Mon, 12 May 2025 17:04:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 46/56] python3-pip: upgrade 25.0.1 -> 25.1.1
Date: Mon, 12 May 2025 17:03:29 +0800
Message-Id: <1747040619-7566-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216341

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_25.0.1.bb => python3-pip_25.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_25.0.1.bb => python3-pip_25.1.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip_25.0.1.bb b/meta/recipes-devtools/python/python3-pip_25.1.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_25.0.1.bb
rename to meta/recipes-devtools/python/python3-pip_25.1.1.bb
index e54e63cba5..431ba182c6 100644
--- a/meta/recipes-devtools/python/python3-pip_25.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.1.1.bb
@@ -27,7 +27,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "88f96547ea48b940a3a385494e181e29fb8637898f88d88737c5049780f196ea"
+SRC_URI[sha256sum] = "3de45d411d308d5054c2168185d8da7f9a2cd753dbac8acbfa88a8909ecd9077"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.43.0


