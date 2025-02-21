Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3A9C021B2
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 02:30:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.14617.1740105020501362957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 18:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TlSbrRfK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740105020; x=1771641020;
  h=from:to:cc:subject:date:message-id;
  bh=lfQb1FWzgkegEUgloBRkAS1IHB2n5bmBQeCBMUt7j7A=;
  b=TlSbrRfKAvBAfXeTf6REnKJ37wsHx9hhfVQvpS/Hxaq2nxQkjlwd3vGj
   wz4ptajQaxKy7aQIWPUCx8L2DgdynGlcV0YU/U5LhinxgxDDKmvT9Q15e
   7ji4mLxPoXZHHjWQ30R7/PC/QpYTdZiKs5XxLM+k8AwH8RiEcZM2u+PN4
   sHnOL5orwE6rkIvLNTOeUhILZIOWqnGs5wsESpbNrZ5+55JhP8qyzEq27
   fHCfpYALw8QI9kj2b/TinpB95d3K9rnvBRJ+AIv7cfDu2JjrUYNt/HbGH
   R4vtG23qdxtUB9t2IHH6kny81YuvnY1DrcYFeaCT4isVTYBlRu5jLbWrz
   g==;
X-CSE-ConnectionGUID: 3cHre0PtRIGd29B74xZfcg==
X-CSE-MsgGUID: /kwmaiOLR7Cx/PyTc55H7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="178088750"
X-IronPort-AV: E=Sophos;i="6.13,303,1732546800"; 
   d="scan'208";a="178088750"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 11:30:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADD8CDBBB1
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 11:30:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 734CED53F8
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 11:30:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DC5111A000B;
	Fri, 21 Feb 2025 10:30:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] pango: upgrade 1.55.5 -> 1.56.1
Date: Fri, 21 Feb 2025 10:30:08 +0800
Message-Id: <1740105008-12758-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 02:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211785

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
 .../pango/{pango_1.55.5.bb => pango_1.56.1.bb}                 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.55.5.bb => pango_1.56.1.bb} (87%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.5.bb b/meta/recipes-graphics/pango/pango_1.56.1.bb
similarity index 87%
rename from meta/recipes-graphics/pango/pango_1.55.5.bb
rename to meta/recipes-graphics/pango/pango_1.56.1.bb
index 6c7242274f..883a2c82c8 100644
--- a/meta/recipes-graphics/pango/pango_1.55.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.1.bb
@@ -18,9 +18,10 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
+SRC_URI[archive.sha256sum] = "426be66460c98b8378573e7f6b0b2ab450f6bb6d2ec7cecc33ae81178f246480"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
+DEPENDS:append = "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
-- 
2.43.0


