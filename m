Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7144FD0C841
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:51 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55857.1768299943388267146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sjxqz4Ch;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299943; x=1799835943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hkEgoC9LkGX1gqT4UyFH+RADbZi6tCSVQQFFhxBbqJU=;
  b=Sjxqz4ChIfqc/v0SYzAhHnPFcr4d7cFWndqeMotouI6hVlXooTsbmr4U
   6S0iT4GWbVbER2u+HnsfAFwgtlZtOC5m7ecApLYWKEFlKQMYVvBdckCh9
   mB3boZxqr/FWAJaKRcMm2P9NV2LgQpNB5PI8ic8oEyTiRtIHY8uS+kfJ4
   BBOg/cGJ69KwEZroyqofcOUB2SOadjeYr4afAVELuh51/oYFvR78RLe2c
   itkh0jKL+BCwQ8ZYb7fIvjsAySKoShkE/dRjFhSNWdAxMQBvGFt8sCqiB
   3iB9xkqaPgtJAFKis6Vl3CMqmaiXjGQaapIjh+6UH2QIwxC0WeHYk7Le7
   g==;
X-CSE-ConnectionGUID: KQ3bS91bR1+Hd4Wa9oROWw==
X-CSE-MsgGUID: r4OkX60zSIShIs5MuyhKOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213580642"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213580642"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:41 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D67D1BB88
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 99E941802AF1
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D0162826FFA;
	Tue, 13 Jan 2026 10:25:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/18] python3-pathspec: upgrade 0.12.1 -> 1.0.3
Date: Tue, 13 Jan 2026 18:25:02 +0800
Message-ID: <20260113102509.728-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229251

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathspec_0.12.1.bb => python3-pathspec_1.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.12.1.bb => python3-pathspec_1.0.3.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb b/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
index 2c80b24c28..58651bced2 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712"
+SRC_URI[sha256sum] = "bac5cf97ae2c2876e2d25ebb15078eb04d76e4b98921ee31c6f85ade8b59444d"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


