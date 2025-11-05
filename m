Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BA8CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2996.1762386448160184465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PaMGBgAI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386448; x=1793922448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mbj5DkfR7da7W5QzwrVjXgSujtcZPfBx8pac8TmYb0A=;
  b=PaMGBgAInDdbv8pNI47P9TnGCtlTGJzl+wYjcm9A7Xhub+BkE0ffELpD
   290UaA/5GdQDuXy+hIztA+nyHrQmymUoWwLyWMlLqeaUHZXW8uucKorrY
   ZY72t4NR5Onuqd4NlG6ZuEriXQXr6Ith2/85uMGVx0PKf09NQ39gvbrwK
   Pz0Rt5aTp0L76vWXi757un92wOoe59qLBu7FHliq1zW34ZOaKwRsdZqyS
   bNf63tV6oVvVdmzthiSYFD9nhEBYsofkhGdUprDa+COK9tJQFUVgawgss
   /0Pg1qR5IBWP/sM5r2R94fVy6FlPT2gz7d7nNJY9VaXqR0qmVqO72XSh3
   A==;
X-CSE-ConnectionGUID: bqpdcD8kS+OmISSP7Dsu0A==
X-CSE-MsgGUID: 87ZBIaftTIyvqGxZnVaJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197067408"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197067408"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:26 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 92375C000AF
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4F2C7C008AC
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D729114005B7;
	Wed,  5 Nov 2025 23:47:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/29] ccache: upgrade 4.12 -> 4.12.1
Date: Thu,  6 Nov 2025 07:46:48 +0800
Message-ID: <20251105234712.446-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225935

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 
-- 
2.43.0


