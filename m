Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D553CD584C
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:44 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3121.1767781894816704126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XidokGid;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781894; x=1799317894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r1qgq6Uls7cNdC0wMPatukt/9FCxCvAS2LCVavTLfjQ=;
  b=XidokGidx4PIbG3dCM6Me9xycOZaoyIr2HhXXlJdKk03dSocnTVdP2or
   xQaW60eExtVQSWsvg6VW++dTsXkAijYA/6Bo03KrzUulv0WPc7pV3IVNo
   eFNhrXRzcxT6j3xwinISzqyfWVWDRiiqn5hxf4/3ujzFSJc9hjZNgv97j
   kXiTIDvm+/tCns1UghO7GM/KwKEU78IQNKzlTHEn6LwvPmCKSR3aCtNRh
   Y2WFVu4kVllNcqjrjXHa+oZfTibkag5X1+WxkUj4OI8c/l7eDwt/xpZjW
   0zklsseom6nA3B6WAgwhUDmqVszljcM/AlKpAN7rCITVxiygiOi8rMJ57
   Q==;
X-CSE-ConnectionGUID: M7yrOXHZTXyvbIfRvE+MJw==
X-CSE-MsgGUID: FagQUwqaSkeCx8F90Hed7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="213016843"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="213016843"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:33 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3DB211C1C722
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:33 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E70EFC011A8
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1607D1017327;
	Wed,  7 Jan 2026 10:31:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/15] python3-hypothesis: upgrade 6.148.7 -> 6.149.0
Date: Wed,  7 Jan 2026 18:30:56 +0800
Message-ID: <20260107103102.458-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228979

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.148.7.bb => python3-hypothesis_6.149.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.148.7.bb => python3-hypothesis_6.149.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
index a8c0421025..7f72029d23 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b96e817e715c5b1a278411e3b9baf6d599d5b12207ba25e41a8f066929f6c2a6"
+SRC_URI[sha256sum] = "27afa07824fbb7785369dfae8e2574ec2ae0b1bdce50f3a327dfc069b79b0a44"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


