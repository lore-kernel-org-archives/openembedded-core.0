Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50857C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:26 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.63732.1744073537535858062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WxrN3ttU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073538; x=1775609538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=axMRSidS/VZtNf5u6bci0VKFibvHnp15o8az2LdmC/c=;
  b=WxrN3ttUcKFXVy0VZAJM69V8TnmWTOjsTrlRHgHdWyTe4jGpavb8EEcY
   PZkgAUPjzu8k/AJ6JSVZFtbfeWtyhhZqPmPw8W4+jdBM2A+aOBRuJUPcD
   WMmYfYIiaC51nowWA1JTnB/aKnfCrJFllYb+cJ6i32CR3RwtpZ2qydXw7
   XhivHQirDryPMv2Y2lLuNd/c135tvLww8Vsu3thGixJIkMjMv87Zwt5KR
   8KtHEOOP/f99Eq2VmrTvBnVocSrUGFflZYTzK7nm615Aio7F1hSnDUekx
   RXRrivspV3bJgehNcGPqY+IlIKiCYlsCZJcCtmWogpVn0u004JUoeDYgu
   w==;
X-CSE-ConnectionGUID: wpl1SGtfTpuaaM99pL6Q6A==
X-CSE-MsgGUID: o68rlxogQpqjUjFvBn/doA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195697856"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="195697856"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9327FC2266
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:52:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62564D4C00
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:52:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7071C1A0078;
	Tue,  8 Apr 2025 08:51:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/15] sbc: upgrade 2.0 -> 2.1
Date: Tue,  8 Apr 2025 08:51:41 +0800
Message-Id: <1744073502-27695-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214498

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Using SPDX-License-Identifier: LGPL-2.1-or-later to replace the description of license

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-multimedia/sbc/{sbc_2.0.bb => sbc_2.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_2.0.bb => sbc_2.1.bb} (80%)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.0.bb b/meta/recipes-multimedia/sbc/sbc_2.1.bb
similarity index 80%
rename from meta/recipes-multimedia/sbc/sbc_2.0.bb
rename to meta/recipes-multimedia/sbc/sbc_2.1.bb
index d25be9e80c..d3b4996784 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.0.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
@@ -7,14 +7,15 @@ LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-examples = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/sbcenc.c;beginline=1;endline=24;md5=08e7a70b127f4100ff2cd7d629147d8d \
-                    file://sbc/sbc.h;beginline=1;endline=26;md5=0f57d0df22b0d40746bdd29805a4361b"
+                    file://src/sbcenc.c;beginline=1;endline=24;md5=1db4f3850f47b59e79aeedb2668f4b3e \
+                    file://sbc/sbc.h;beginline=1;endline=26;md5=c5a50a7fc33c148ee362e2b46574a87f \
+                    "
 
 DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992"
+SRC_URI[sha256sum] = "426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


