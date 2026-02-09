Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C870FE78D56
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43850.1770627843825718856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AQJXzD6u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627842; x=1802163842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ohfUuJHy1NyJQpIToYqpRZ+Xn9H5ytT1NAP3cXIm6Q8=;
  b=AQJXzD6uiocU0bGYAAe3LpvZxRn1Y6Ur+F9YQediKyJc5zsMk+aqN7M5
   RDzIMIO1juzfBiuoF++i8kpUpaMvaTsssYq84YYXu6YITY7vekyzjOmUH
   vQBCww0dgFey7u1QWaKtFlKPgMeST+WWorLVlbKaMXRfdxSrStBFgJyBa
   Enlt+7yhnWOpUuuMGd8ZmF9pkgoL9cFZaUbRo9d5JcDH6PBDQn9U5CpII
   23N4YA5GvBzkFiwYnIRyBj0ahXHbcDa7+7zMn0gqsGItGWIZTHlVtzX0X
   XY8XB5wFbCMljvAFym8otiDsdaSUCCnVAQsCHNXpVIPvAPtR9bdFLcon/
   w==;
X-CSE-ConnectionGUID: pKl/ijhmSY2VORZ+uE0ZSQ==
X-CSE-MsgGUID: d04JxRLLT6mrFC9ys5gFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="228980468"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="228980468"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:01 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 52494100034F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:02 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E6643C00881
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4CAD0101BB75;
	Mon,  9 Feb 2026 09:03:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/39] python3-dbusmock: upgrade 0.37.2 -> 0.38.1
Date: Mon,  9 Feb 2026 17:02:59 +0800
Message-ID: <20260209090317.1468-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230732

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- polkitd: Add RegisterAuthenticationAgentWithOptions
- logind: Add SetWallMessage
- README: Update outdated and broken examples, move to addCleanup()
- Move all license comments to SPDX-License-Identifier
- tests: Skip test_readme_examples if README.md is not present

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.37.2.bb => python3-dbusmock_0.38.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.37.2.bb => python3-dbusmock_0.38.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index afbf0f0c57..bc81b362ee 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "e0c7354f6887036ee519f2fbba55ce14bb21c3ffceab06c085d15bbbda2b1d03"
+SRC_URI[sha256sum] = "221b65e1c2e48de9fd11bf7e8c165adaf91648f49a11f390d086a498386f2984"
 
 PYPI_PACKAGE = "python_dbusmock"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


