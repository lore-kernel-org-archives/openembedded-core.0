Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADF9C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.26269.1750065415509386391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ms+3iauf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065416; x=1781601416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvCB4+Oga2ACq2XNSPHFT6Q37rEMN/itw9wKmozffVA=;
  b=Ms+3iaufumr3gJ2oX6xVZLMfpot0YXUAmGFXjCUbkQqf9Kv2o4sdOvL7
   PHv9MDr0cXvtexYYF3F132kg+PxP4V/KtUDzwECxa8+uVf7YFHlKp+NEI
   SbrUPLqp3mcdb2Rl7YulSMQsXggNy1eOb7Z7CR8IJwhWyQ3EyfBvTETwL
   z9Y4OkcCRmhK8Wqf5Hj38RkFPGunbOq1laHxXNtSncXLd8yC5AsbNh+x7
   w1cqMUSDsBlchZfgCUDH6pNfWOg0jJW17VyJc4pNQUk+35qKWLsqkAxIf
   8yTKoCATb3aZ8k969BEtOjR4q3y50TPKOoYsmsjJh22PviNj6gGGRolk4
   w==;
X-CSE-ConnectionGUID: JQpH2us4QFSf+7NACQrhqQ==
X-CSE-MsgGUID: vp6k4kzOR62ZfmFxXYAO5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="191320665"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="191320665"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BD5DD4C24
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CA2CAD7624
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:49 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0ED341A000B;
	Mon, 16 Jun 2025 17:16:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/24] libdrm: upgrade 2.4.124 -> 2.4.125
Date: Mon, 16 Jun 2025 17:16:23 +0800
Message-ID: <20250616091643.918-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218783

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.124.bb => libdrm_2.4.125.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.124.bb => libdrm_2.4.125.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.124.bb b/meta/recipes-graphics/drm/libdrm_2.4.125.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.124.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.125.bb
index 78f31ccb95..a256f73145 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.124.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.125.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379"
+SRC_URI[sha256sum] = "d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a"
 
 inherit meson pkgconfig manpages
 
-- 
2.43.0


