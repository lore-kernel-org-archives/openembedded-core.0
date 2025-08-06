Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D93AC87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:56:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.20541.1754470573113351616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jx2Vv7xf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754470573; x=1786006573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tDl0BOyKH3ehcDBZLnzOQ2QS+4vts+emDsbt/L6OPyo=;
  b=Jx2Vv7xfUHNbdyZyPqZ/eVjjk8hYSqrMWwt1e4SEr+5bohOMNWTcbqFv
   xkAKy3d8ZoZ2CJ6chlEHx51LBD8foxGQUnLo76uHl+U83hNv5+78ZQwUI
   uA7X/942V19VeELmsIdt3dz8BRHRua9PBziWKwGy/udmiK5nlgfHJT+2c
   zk+Wmfp1PcLANMTZNPEnGyjzaxO/1/+Dg9Otyv7gEM/uLzauBHijyCTZP
   e6mjVqMHZz2xZ6M4ZbDMoyT+Twejxsp4zpL85EMUvXhflGagbgUW1xGGd
   brYhgJ+zdBXGjTo1cWDSTBDjdAKhvc3mxLS3I6q+RchwBtT5KMIymYjcw
   g==;
X-CSE-ConnectionGUID: t/48Y51eTm+fOGUQWbIxog==
X-CSE-MsgGUID: Y/bexriIRJ2nytH8GgEUEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="208632584"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="208632584"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 17:56:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 23B6B42A31A
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D05601802AFA
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id CAE842005D00
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:08 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90A2A1A0170;
	Wed,  6 Aug 2025 16:39:49 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 6/9] vulkan-volk: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:26 +0800
Message-ID: <20250806083929.747-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221509

Changelog:
https://github.com/zeux/volk/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
index cde1be1671..17a290ed1d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
+SRCREV = "a8da8ef3368482b0ee9b0ec0c6079a16a89c6924"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


