Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AB9C433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504135"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504135"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298355"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 33/33] libdrm: upgrade 2.4.108 -> 2.4.109
Date: Thu,  9 Dec 2021 09:29:32 +0800
Message-Id: 
 <b8fa0c446ecb3f65d7c134426a07c6244959cdf7.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159433

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3bd5e6ae5c3893fa3dc61b768105d9203b96f3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../drm/{libdrm_2.4.108.bb => libdrm_2.4.109.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.108.bb => libdrm_2.4.109.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.108.bb b/meta/recipes-graphics/drm/libdrm_2.4.109.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.108.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.109.bb
index 66b2c9f54f..fb5ddd82c0 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.108.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.109.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0"
+SRC_URI[sha256sum] = "629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26"
 
 inherit meson pkgconfig manpages
 
-- 
2.33.1


