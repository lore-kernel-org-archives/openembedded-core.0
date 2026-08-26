Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EF8C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:48 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7745.1787732325303315244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LwLDexxm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732325; x=1819268325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JJNxXFd4jyufEPgXGolJxKn5U3Kjw7FN/3IkCuXxyH4=;
  b=LwLDexxmK+18TGUiJmllolexK9vpHV+AweSEuLmuaK1/dRYKLqDb4i+Q
   wEDz25wpTTRoD3nH9h7rGpnj68for85c0iCECKYMSDSYR3zmPrs9oV0Tm
   E1F7E0pCqcQwJB7XoGboRxi3Ye7hZlNVrFdK4MVZ/e4KF6NXUrqx7wLcX
   LT1BGNHqonp2r0SXQOx/4S6l80RreJUbioU0u/xA4T5GrtC6XYHeGAV6u
   xBTsWlOVHISASK0HULlzjJ2SVpEhpzRYvwY/nzm+xAXqABnyRKrrWkS3w
   FJ4Cleg/Ex0ALZXAQQkyYr3vvDJwZRQX7sUB/DnYJ/TMcupjX4GdvikgQ
   g==;
X-CSE-ConnectionGUID: TCIGuvtQQuqbi1GlVM24mQ==
X-CSE-MsgGUID: xVWgxQ77RcWT7OSNthgrLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252690516"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252690516"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9A83F1C000E7
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 51CC21C00967
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5D57B8214FD;
	Wed, 26 Aug 2026 08:18:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/17] libical: upgrade 4.0.4 -> 4.0.5
Date: Wed, 26 Aug 2026 16:18:26 +0800
Message-ID: <20260826081832.1059-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244351

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_4.0.4.bb => libical_4.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.4.bb => libical_4.0.5.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.4.bb b/meta/recipes-support/libical/libical_4.0.5.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.4.bb
rename to meta/recipes-support/libical/libical_4.0.5.bb
index 516c7a95b0..8ec656edd2 100644
--- a/meta/recipes-support/libical/libical_4.0.4.bb
+++ b/meta/recipes-support/libical/libical_4.0.5.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://flags.patch \
            "
-SRC_URI[sha256sum] = "c851cdb46da5e6397881dafaa592c5516fb49da05dd1bb095f711a6d20eac422"
+SRC_URI[sha256sum] = "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b8965102581401e67c9c"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.43.0


