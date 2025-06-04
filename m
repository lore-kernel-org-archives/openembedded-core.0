Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4DDC71133
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11713.1749026733689315424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jmS2fmqm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026733; x=1780562733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dgu1FrPoD5CzVX3rH7N2w4Zklq5hDTwvh5JiIZnCY8g=;
  b=jmS2fmqm6oXYsopWHUnB0k+wQQVD/MFX0OtEPBom/AhqRcnIol35DaqD
   E46+8xxrIwJfVfiWtXgDxO+81A3+bQd9cHWFDrW+dleATJYzmvW187huH
   IYSM2VI1whWaNHKs0BEM1D56rLKAH/skXDJ1HTaqIRYVBdl+Pv6tMY0EF
   YlS7g32vCLwZV3mE/srZMeEDeWk3eKtXCyTd37bEMbJi6p5rF+TLU0uNA
   KDiu2FMtldlDBNPqqBXRTOoI20VwsJIVyxjGf89H08jFBMVjuc6xQjl7s
   gwhgvvyhD4fr/peOQhk1oP985k1ncXTtcll9EoIS3SB1H30RtwtwTQqdg
   A==;
X-CSE-ConnectionGUID: SQrKt9CGT22BNnq/OpMCCw==
X-CSE-MsgGUID: aVWNeQNLSieHVtpH2qzctw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="202109471"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="202109471"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74F08E0ABD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27BF3D4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:29 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A3BC1A0078;
	Wed,  4 Jun 2025 16:45:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/45] enchant2: upgrade 2.8.4 -> 2.8.6
Date: Wed,  4 Jun 2025 16:44:42 +0800
Message-ID: <20250604084524.864-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217851

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.8.4.bb => enchant2_2.8.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.4.bb => enchant2_2.8.6.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.4.bb b/meta/recipes-support/enchant/enchant2_2.8.6.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.4.bb
rename to meta/recipes-support/enchant/enchant2_2.8.6.bb
index a5479a0e7d..66de313d9d 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.4.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.6.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e28f98208df5f99320d6a05cd49f83420bf71e69052debe3b343c9bb15c833ed"
+SRC_URI[sha256sum] = "c4cd0889d8aff8248fc3913de5a83907013962f0e1895030a3836468cd40af5b"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.43.0


