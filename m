Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE49CF89228
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20451.1776765395379089110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iSVtA2s4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765406; x=1808301406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uCUOGLNbami7zt+CuxXvZVLlrNYaedGe/RfqOCBb/dE=;
  b=iSVtA2s4OJ9nSjyHPLLMA8GYTsDpCU5MGsvov9Wrai2kxDiiIuAhbZnS
   +DKEcXISGZtmbrLfIn1W7Oi7h35jA/0xXDKUR9/TmR/WTk38q8yA9h38v
   EHxaPjc0/t7uTuMoRnmF4128qjzZGGYTFHAVFsyiDRRtg60IeFTrG9ixU
   3MTPVpl9CIhZ+zVlKrcRDK9/T6x8cbVb/Lq3I6Ml/hrjgoK7Xf+Qpu1la
   0SofuZdsALHp3H0RYzvHqhECEP4ksCH2LJ4fXmVza5Gc+KkCfpMf+BVCt
   Nj+mQ+COS3FJvNOPese8wGs7q0atLHv2G88MdQhTwgvpthySKYL8I/zo1
   g==;
X-CSE-ConnectionGUID: ZOGAxhx5SXGDYuIKn7tYLw==
X-CSE-MsgGUID: W7X/vYjCT5aQROZHNGyQkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="242133440"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="242133440"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:45 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CA77E1002BBA
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 85A75140035D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2770D14002C3;
	Tue, 21 Apr 2026 09:56:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/49] pango: upgrade 1.57.0 -> 1.57.1
Date: Tue, 21 Apr 2026 17:55:31 +0800
Message-ID: <20260421095559.1856-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235629

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed:
- #867 Bad font substitution causes application crashes
- #869 MacOS: subprojects/cairo/meson.build:1:0: ERROR: Value "gnu11,c11" (of
  type "string") (sid)
- #870 MacOS: subprojects/pango/utils/viewer-cocoa.m:23:10: fatal error:
  'cairo/cairo.h' file not found (sid)
- #871 gtk4-widget-factory crashes with pango error on macOS when an emoji is
  entered into a text field
- #876 Inconsistency between documentation and code in
  pango_context_set_font_description
- #882 The hex box characters generated in PDF can not be copied
- #885 warning: assignment discards 'const' qualifier from pointer target type
  [-Wdiscarded-qualifiers]
- !884 Revert "meson: Rework introspection handling"
- !890 Update the code to support Unicode 17.0.0
- !892 Include fcfreetype.h where needed
- !893 meson: Update freetype2 wrap to fix ci warnings
- !894 Respect explicit language attribute when itemizing
- !895 Fix some subproject woes
- !896 meson: Add support for cross-compiling using Apple subsystems
- !897 (break.c) pass sentences to handle_sentences
- !898 add support for g_autoptr(PangoScriptIter)
- !900 fontmap: Mark get_family as nullable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.57.0.bb => pango_1.57.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.57.0.bb => pango_1.57.1.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.57.0.bb b/meta/recipes-graphics/pango/pango_1.57.1.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.57.0.bb
rename to meta/recipes-graphics/pango/pango_1.57.1.bb
index 5dc8a67dfe..a9129dad4c 100644
--- a/meta/recipes-graphics/pango/pango_1.57.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.57.1.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "890640c841dae77d3ae3d8fe8953784b930fa241b17423e6120c7bfdf8b891e7"
+SRC_URI[archive.sha256sum] = "e65d6d117080dc3aeeb7d8b4b3b518f7383aa2e6cfce23117c623cd624764c2f"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.43.0


