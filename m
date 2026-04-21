Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31FFF8923A
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20464.1776765434767913708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gnpCGm/o;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765434; x=1808301434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x9aOqUlojPLYkhhkWs5/+99kImLv/ftAeZ1ODwMEcgQ=;
  b=gnpCGm/ocefoK9Iul5uXr92NYAXSa2oFRMAJGvHmVoxBHHEoV+4Alejd
   xqggBSVRz0aX6STpaMgEVPSVRWhOQ0y56qmEey6+gFf0T7Qnv2S5WySrE
   tScMdhB2tTj5Qt4nNDvuRxASE/Mgl9+UoelmOiGHnLGuPP7DZ7d7wTE+/
   5OD8x2ckoH8UQikJLlZJeKtTVxhdZD8YslQVS5M19ayyl+6ld43q7Ipnf
   TyqkCzx+AUhPHQLspOmx2Xt6q+Y9envOaC5cLLimKvYKny9p5zKOAzj+C
   D0EFwV8IZSiaZFBmZgvyLghyl0gzCywEEC/3PyO5ecU5GTvSrReofQnoS
   w==;
X-CSE-ConnectionGUID: 8aYW/kqeRmWseOEQ+taQJA==
X-CSE-MsgGUID: zwuQNx2JScOYXT76wwPj7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608253"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608253"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:13 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4A83E1C00086
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:13 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EFB601800D5E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6E52F140027F;
	Tue, 21 Apr 2026 09:57:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/49] python3-testtools: upgrade 2.8.7 -> 2.9.0
Date: Tue, 21 Apr 2026 17:55:48 +0800
Message-ID: <20260421095559.1856-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235646

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-testtools_2.8.7.bb => python3-testtools_2.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.7.bb => python3-testtools_2.9.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.7.bb b/meta/recipes-devtools/python/python3-testtools_2.9.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.7.bb
rename to meta/recipes-devtools/python/python3-testtools_2.9.0.bb
index db3ec2373d..a7011acd78 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.7.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.0.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "1aa19aaabf9736385fc111a95f94f6b0661c0b41e65ca5129223eb518c63e8b9"
+SRC_URI[sha256sum] = "eb562d1a2157c6d443c8c118861eb452b3655d1842f9b61b8567ad01b32826e3"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.43.0


