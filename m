Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0488C021B4
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14628.1739864485290970726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VeBedTYz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864488; x=1771400488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lW2vnzMzzDZWXCx6+wDjsXm9u+i7koZgIAjSpLrOnys=;
  b=VeBedTYzKrx5wYnaYOSQRsIxZrVNEF6j1PZWGtF2KRjinF2O+E7yaoH2
   etUHdPj7dbpm54pWX/wyc+jbtzj7jgtyi7kvhO2hqb3Lb2Z8YTfsV0An0
   HfSNuf5qIsG8XITMj3kB0Wq0aPbuBz17zwZsHbc7MoHOgKbIVaYQbCru5
   wA7WcoOCpELytxZmEYSp4fsVFXqvNjR0c8H+o5EakPzYn4E0oBDzKw2FW
   WP5BXLKt9FjYj1HoA9ifYZdlbadntkYYaNSagrTvXxQYSPnUQy5uWUBrN
   dZ9tJxyYmUh6gb/MI/AszTyMln7I5fR0QecW8++shNmPTttpM9q828T7k
   Q==;
X-CSE-ConnectionGUID: C89KyznCTwKcRCTek6iWOA==
X-CSE-MsgGUID: pKgQyK3GRO2KOYxLotebpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169232655"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169232655"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E17BADBB91
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A120FD4BD5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 458121A006C;
	Tue, 18 Feb 2025 15:41:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/32] pango: upgrade 1.55.5 -> 1.56.1
Date: Tue, 18 Feb 2025 15:39:18 +0800
Message-Id: <1739864375-21394-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211576

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Avoid criticals when there are no fonts
- fontconfig: Handle lack of FC_FONT_WRAPPER in font cache
- fontconfig: Prefer application fonts even if they are older
- Support setting font features in font descriptions
- serialization: Document the tab array format
- serialization: Accept attributes without range
- win32: Improve the pango_font_map_reload_implementation
- win32: Take variations into account for caching
- layout: Fix measuring ellipsis runs with shapes
- build: Require C11
- build: Require GLib 2.80
- build: Require cairo 1.18

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.55.5.bb => pango_1.56.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.55.5.bb => pango_1.56.1.bb} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.5.bb b/meta/recipes-graphics/pango/pango_1.56.1.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.55.5.bb
rename to meta/recipes-graphics/pango/pango_1.56.1.bb
index 6c7242274f..cb4d779a55 100644
--- a/meta/recipes-graphics/pango/pango_1.55.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.1.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
+SRC_URI[archive.sha256sum] = "426be66460c98b8378573e7f6b0b2ab450f6bb6d2ec7cecc33ae81178f246480"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.43.0


