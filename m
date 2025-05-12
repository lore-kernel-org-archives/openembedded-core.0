Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34796C54754
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.45914.1747040638623560703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SUvBfXFh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040642; x=1778576642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dZh39mKNslukXrbZqDDGjSbgRu8YF3YLSydi+v5p+cM=;
  b=SUvBfXFhVocnRq8czVdAzo5Up9XzaVrKgbP6SIIH3/xfILfLMYSCJCWD
   qJaD4cp4ZZNZDN7ntpez57EUzY9B1oK/kPtEC16dQGuae3dEeFO2Yq+lp
   aEQIivmL964o0NQM6ueL7SpL2HVHMxNej57ca8k1dDrR54f2Ln3uL6+jR
   pXVvEDy3tNlrMX0ccFTyG3GqtGfioAiVq1gp30BdvwiiQE19TvB8AXwcd
   t0z0HqZ4wsl7+BCdL4KPmbi1lqnglo/cvtV6oH1otCF71HNgGTbUUhrj0
   DpiSuopEpDqYn+8iMW/3PjyBl9XSapQRArOOMxUX32U8nHZJo6aPkUOmk
   Q==;
X-CSE-ConnectionGUID: dLU2dPk4Tt+Qt+tt3pwGJg==
X-CSE-MsgGUID: /ieMFqr3Qn+S46jlUFMF+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199533790"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199533790"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C5FA0D5054
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9186ACFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F0F11A009B;
	Mon, 12 May 2025 17:03:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/56] libsdl2: upgrade 2.32.4 -> 2.32.6
Date: Mon, 12 May 2025 17:03:10 +0800
Message-Id: <1747040619-7566-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216321

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.32.4.bb => libsdl2_2.32.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.32.4.bb => libsdl2_2.32.6.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
index 28338b0936..75710b962a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "f15b478253e1ff6dac62257ded225ff4e7d0c5230204ac3450f1144ee806f934"
+SRC_URI[sha256sum] = "6a7a40d6c2e00016791815e1a9f4042809210bdf10cc78d2c75b45c4f52f93ad"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.43.0


