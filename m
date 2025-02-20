Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4735C021AA
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 00:31:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.38716.1740011470770252682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 16:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ft8Vymyd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740011471; x=1771547471;
  h=from:to:cc:subject:date:message-id;
  bh=a75OVgz4pBlYYbJizUvGfwdtgOoqYwuFpG/2s9rJNYM=;
  b=ft8Vymyd+rXdx5TZJkT5ojrWaSx7Z2WJbVwXP4JavUA0kD326ePQhqgs
   vDr/5aaNfCwdnnQkHquK5tchvkZS40WIf3alT9Sbxu1fNKKpGTkLBtsVa
   4UWmqK11ivcJstuUXX94mifRMIG6geXuTYbKWPCTGqbyaYx3ND3DkZ0mQ
   zigjOYQtXESPz+qJIc3SrchW8o5064ANVMkc0MeNnFp4NtY/aTRTfop/k
   w1SVp/d7hWcOPBzCaSdtVZLuncmXVvMFd2yGVAPlv2HMq0T7ZVZHJ4csm
   G4cy3+U7XzIbEwm2BRJq4WQG5/kAQWW5LFvIYNCI8RxQmGT84UnBEEcwt
   Q==;
X-CSE-ConnectionGUID: MvW/J5OsSx+hxCgzvgpcBw==
X-CSE-MsgGUID: 2KkbSbkARI2pGCWcAJX9gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="190613385"
X-IronPort-AV: E=Sophos;i="6.13,300,1732546800"; 
   d="scan'208";a="190613385"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 09:31:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79D07D4811
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 09:31:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FE66D52E3
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 09:31:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B27721A000B;
	Thu, 20 Feb 2025 08:31:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] pango: upgrade 1.55.5 -> 1.56.1
Date: Thu, 20 Feb 2025 08:31:00 +0800
Message-Id: <1740011460-3468-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 00:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211735

From: Wang Mingyu <wangmy@fujitsu.com>

Add python3-docutils-native to provide rst2html5

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
 .../pango/{pango_1.55.5.bb => pango_1.56.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.55.5.bb => pango_1.56.1.bb} (90%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.5.bb b/meta/recipes-graphics/pango/pango_1.56.1.bb
similarity index 90%
rename from meta/recipes-graphics/pango/pango_1.55.5.bb
rename to meta/recipes-graphics/pango/pango_1.56.1.bb
index 6c7242274f..6ee43f356a 100644
--- a/meta/recipes-graphics/pango/pango_1.55.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.1.bb
@@ -18,9 +18,9 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
+SRC_URI[archive.sha256sum] = "426be66460c98b8378573e7f6b0b2ab450f6bb6d2ec7cecc33ae81178f246480"
 
-DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
+DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi python3-docutils-native"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
-- 
2.43.0


