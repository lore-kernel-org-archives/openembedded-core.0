Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBFBC3ABCE
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.6527.1746763073189332218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iBBakKIA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763073; x=1778299073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+6y6VUX2OYAqlUi+C1iRt2/b2WUVOsUNoQsFypprKBU=;
  b=iBBakKIAEBa1iKaTxe72rwNezfGceazzHN5OXNxLUKHhmJcfn05f4/Nf
   rVqlByf8zSFbeDLnQkKp8+jrGWhO2iN+i39mgWE9JSDSCKDhqPev/dyAe
   98vXMklxyuYG8ziiDhtIiqm38TRwCxOgwbblDSM9nzldKO8cMKFbrX3sM
   Y8KIiiYYtmqy++9/RhFV+6HOR+q/CdiJuj9tN8w6+f8/E8x7QfQE4dkXH
   +ENcDpNS7ZVoGNkbQ+RVKBmwEtDaEvo8GLAJrG4AGsDDp1z0WiDHqsHnP
   AeadY4ON87lSu17Fyk9rOWXzfoWWWKFX1g4rqByox5FE0xsiGbnTnOjFL
   Q==;
X-CSE-ConnectionGUID: i08qarfuRLafbse1tSnlQw==
X-CSE-MsgGUID: kSOfjsvXRYmO8X1J4bYjWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="198066387"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="198066387"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19757C2260
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C9BC1BDC94
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D6D21A009A;
	Fri,  9 May 2025 11:57:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/19] spirv-tools: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:14 +0800
Message-Id: <1746762980-12783-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spir/{spirv-tools_1.4.309.0.bb => spirv-tools_1.4.313.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.309.0.bb => spirv-tools_1.4.313.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
index 3a8006e2f1..57dce4f3fd 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "f289d047f49fb60488301ec62bafab85573668cc"
+SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"
-- 
2.43.0


