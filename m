Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA1BCCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3012.1762386486857325243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ftOjaQmJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386488; x=1793922488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f1WQtbdhZjRQdo1LprT8rj0AR75pMYdxs+/7GcP2WWk=;
  b=ftOjaQmJM85xd5WOWdzTlNQ6NJYFwT/7MPy4jv7pqH/90IhPO5AM9dyG
   VEJzzRAVQSpxetXFMsarA6rVWQZMP9FMctt/urCE5YGfOtXvKrRywv2YW
   t3GhOEnnzCkAR0A+h5HWcup6AAaehFvnSozU4axxp7pGF8edqq8vLcSBP
   dg6Fg3NsZFnifM8Jnj2y/lCqkVfK5qA0P6ULc34CLSIsg+EFF4BmQsa+8
   8lnE7074XEekoxwot3nWdtb6imQBKobH1r/VXChI/Kj+9qqOdsi9W4wCv
   8B04jCuE9X9KaE6hY+UlaBcB/7pcO1N6/mhWkvQSjBxuRdy7KwyYl/cHg
   A==;
X-CSE-ConnectionGUID: 6VPTg6JXQNyLVNJm/d+51g==
X-CSE-MsgGUID: c6I9WxfYSMixV3lsDyFsZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="217613218"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="217613218"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4C5F51C001B6
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 05EEC1C0017C
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7C054140008B;
	Wed,  5 Nov 2025 23:48:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/29] libdrm: upgrade 2.4.125 -> 2.4.128
Date: Thu,  6 Nov 2025 07:47:10 +0800
Message-ID: <20251105234712.446-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225957

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.125.bb => libdrm_2.4.128.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.125.bb => libdrm_2.4.128.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.125.bb b/meta/recipes-graphics/drm/libdrm_2.4.128.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.125.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.128.bb
index a256f73145..8796a7a3d0 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.125.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.128.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a"
+SRC_URI[sha256sum] = "3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac"
 
 inherit meson pkgconfig manpages
 
-- 
2.43.0


