Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A37E78D60
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43623.1770627847417331896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ti6EGkDd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627848; x=1802163848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ImB0HDZfM7BkICHgtC19sMFJbhKP4wvaAfK6N/wQqUw=;
  b=Ti6EGkDdDHNR7m/GLqx81Aq9xdNDxhfdTpLf0zp8A9mb1MKQSGTMuwRU
   m0X9Bucy585IZ2w7bweQMB3nIOswQOJe0vUUWWO7xh+a5PXnmYS4yoZLi
   Onn7UcFTvweI7y/UR1SLxE4Ebf3ZCBvhzs+xWVKTXnREXvLOu93eCR0Lc
   itCZ+4ykj7BqOSs8ZkOavDwccyNitxFIN5B6I3FGTiHa9IHudeb/G27hl
   tbMysGupxYaAXXE8bJGfjBnv4A2lYQuzoDOgc175xZNeE4y533RNseGxb
   MlIXh6S6+BB62WPR4u6pd3UF5k8CTu10fLcY2/kXYI6+kE3MDriw+uH0f
   Q==;
X-CSE-ConnectionGUID: 9lqtu/iJQviHudxmv9fN1w==
X-CSE-MsgGUID: 0tJflnNTTWSF8pITVl6jHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449801"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449801"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:08 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id BC7C7407569
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:07 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 59AEE18002CC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B3640101A403;
	Mon,  9 Feb 2026 09:04:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/39] python3-pathspec: upgrade 1.0.3 -> 1.0.4
Date: Mon,  9 Feb 2026 17:03:02 +0800
Message-ID: <20260209090317.1468-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230735

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Using re2 fails if pyre2 is also installed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathspec_1.0.3.bb => python3-pathspec_1.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_1.0.3.bb => python3-pathspec_1.0.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb b/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
index 58651bced2..bcdc04dfb0 100644
--- a/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "bac5cf97ae2c2876e2d25ebb15078eb04d76e4b98921ee31c6f85ade8b59444d"
+SRC_URI[sha256sum] = "0210e2ae8a21a9137c0d470578cb0e595af87edaa6ebf12ff176f14a02e0e645"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


