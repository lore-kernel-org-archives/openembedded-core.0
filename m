Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C46FC52D70
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.46594.1722215430009041958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dwTfWvsI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215431; x=1753751431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZRqcud5YQGzDcsLn7bkEBUGTaDz3e5jDObxjEd0LQZc=;
  b=dwTfWvsIh1VIKMGT2HAFH2OMFHHc5O1vgv0dCpZ/fL3RUpJaeJKxRGdX
   hKiTwLo9bAUk5tNyZe7ZT34V9O/0nfDtWS9Y7E/dpH+XBhO7Bc5gAPjNA
   o92MLSRgcBCopuE/n5fOrTkAxWTPDePBaTvcP9bd0w2jgHRNnmH8Dh15+
   cCu8P4eLWWLfKsNkw14NdrHHZj0ktdFSpJBCqnf3fGf7nM2OI0gkRNp21
   Qbd4vM0FD/YScR5F521MxgpOPC+9YmHfvNZY5mjPp0oD2ua5Hj7E+Hv8s
   c587QLJ1QeJAUNFp//P0mXnkcVPRjpVTyTjM0I4SQpBBLR+aApltSo+Jg
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="156246531"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="156246531"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:29 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82490C68ED
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C03B0D39CF
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5400D82D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C6E8D1A0002;
	Mon, 29 Jul 2024 09:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/33] spirv-headers: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:09:58 +0800
Message-Id: <1722215408-27541-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--0.296700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz9MbU3VPgLfat0
	Xj/JQVrgm7cNl3xTwZye7hEhMUKGqAWaRmVDxE9xA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY7GX0c1Ulaly5x7uAXGEprZiQDIJsDspXnQLpYk1dOmJkYs
	Ar0vhtJv+vfH78Rkg8gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG7/nnwJ52QYi+pygCGKFPC+GCMm
	9JQC5ZF7SG6G8yq5R61nlcJ28oOrSdCsXRimMug5N/MNHBCOwniRlqxB7v8rP7T2XR2bbH10yIH
	JrwQa4/lowR12IzYPKyo9QQVDzjD8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202597

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- SPV_ARM_cooperative_matrix_layouts
- Add KHR suffix to OpExtInstWithForwardRefsKHR
- Enforce grammar naming conventions for aliases
- Adds SPV_KHR_relaxed_extended_instruction
- SPV_EXT_replicated_composites
- Fix SPIR-V reserved ranges
- Add utility functions to strinfigy value enums
- VkspReflection non-sematic: add dispatchId in configuration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{spirv-headers_1.3.283.0.bb => spirv-headers_1.3.290.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.283.0.bb => spirv-headers_1.3.290.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
index 5ec7e42b7c..30280a5b5e 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "4f7b471f1a66b6d06462cd4ba57628cc0cd087d7"
+SRCREV = "2acb319af38d43be3ea76bfabf3998e5281d8d12"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.34.1


