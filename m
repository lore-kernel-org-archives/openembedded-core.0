Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B21C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:20 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504128"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504128"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298335"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 32/33] libdrm: upgrade 2.4.107 -> 2.4.108
Date: Thu,  9 Dec 2021 09:29:31 +0800
Message-Id: 
 <760aa9e2c011c1c055548a63eb2430a7377bf8bb.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159432

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11ad9b4fd2a8d53a472344c3b47487fccbc96f7e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../drm/{libdrm_2.4.107.bb => libdrm_2.4.108.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.107.bb => libdrm_2.4.108.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.107.bb b/meta/recipes-graphics/drm/libdrm_2.4.108.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.107.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.108.bb
index b645898481..66b2c9f54f 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.107.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.108.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888"
+SRC_URI[sha256sum] = "a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0"
 
 inherit meson pkgconfig manpages
 
-- 
2.33.1


