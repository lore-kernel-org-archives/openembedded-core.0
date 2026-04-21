Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3237F89240
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20411.1776765439600231906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PK6u86s+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765439; x=1808301439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lE82CY4Q/76mBNes8d3yHpHzxR69oNocxO2/h46IUt4=;
  b=PK6u86s+ZPr2aDQKjUJN94eD52l0BVsS4u09WX49X4DUqLK6wwBerBT+
   UccWy+Z2P7javskqrQXJ9Z9BCIUeuJEYLMEaW61DQoRS1kAkBTYqo+5jp
   1mfeXfc4BzYvbSIQkOquHebRQMoeVLiUwQlIDhuciuvMaHj+MXUeXgR0o
   NtnSBqaZMrGYm2yFkbbD+rhbBDjxuo+6QKKBbvPeLUUQ1hddGtIF8dHUS
   R1qFBXe7w98HHIy/y+HCBMMLejDsZ3NN3w2DzfehEYibIL34e2/fJ362w
   EEYwAVe4+KopBA26l0Eu0TGMd0a2e9jiW491JUdFiog24I+UelLPq7WdJ
   w==;
X-CSE-ConnectionGUID: BpixX0lrSbGXgShx7P9ipw==
X-CSE-MsgGUID: Kb81HFPQSOWbQNLLKcr5lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237674615"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237674615"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1349B1C00081
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:18 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B44171800D43
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 395C214002C2;
	Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/49] re2c: upgrade 4.4 -> 4.5.1
Date: Tue, 21 Apr 2026 17:55:51 +0800
Message-ID: <20260421095559.1856-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235649

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2026-2903.patch
removed since it's included in 4.5.1

Changelog
=========
- Added missing include files to the distribution
- Updated the documentation to mention the new include files.
- Migrated include files to Unicode 17.0.0 standard.
- Added Unicode include files:
  + include/unicode_blocks.re
  + include/unicode_properties.re
- Implemented Unicode case mapping for case-insensitive string literals
- Fixed segmentation fault on erroneous input during determinization.
- Updated paper A closer look at TDFA

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../re2c/re2c/CVE-2026-2903.patch             | 68 -------------------
 .../re2c/{re2c_4.4.bb => re2c_4.5.1.bb}       |  5 +-
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
 rename meta/recipes-support/re2c/{re2c_4.4.bb => re2c_4.5.1.bb} (86%)

diff --git a/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch b/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
deleted file mode 100644
index 266891fa49..0000000000
--- a/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From febeb977936f9519a25d9fbd10ff8256358cdb97 Mon Sep 17 00:00:00 2001
-From: Ulya Trofimovich <skvadrik@gmail.com>
-Date: Tue, 3 Feb 2026 21:33:11 +0000
-Subject: [PATCH] Fix null pointer dereference when actions are used without
- rules.
-
-Null pointer dereference happened because the root TNFA state was null:
-there were no rules for a block, but determinization still happened.
-
-In this case re2c should emit an error and never even attempt
-determinization. It was properly handled for blocks with start
-conditions, but not for normal blocks.
-
-This addresses #571 "[Bug] Segmentation Fault (NULL Dereference) in
-re2c::closure_leftmost_dfs during determinization".
-
-CVE: CVE-2026-2903
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/parse/ast.cc                | 19 +++++++++++++++----
- test/conditions/cond_error_10.c |  2 +-
- 2 files changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/src/parse/ast.cc b/src/parse/ast.cc
-index 91865e801..986cfb7da 100644
---- a/src/parse/ast.cc
-+++ b/src/parse/ast.cc
-@@ -332,10 +332,6 @@ Ret check_and_merge_special_rules(AstGrams& grams, const opt_t* opts, Msg& msg,
-                 all_conds_have_it = false; \
-             } else if (g.name == STAR_COND) { \
-                 star_action = g.action[0]; \
--            } else if (g.rules.empty()) { \
--                RET_FAIL(msg.error(g.action[0]->loc, \
--                    "%s action for non-existing condition `%s` found", \
--                    str, g.name.c_str())); \
-             } \
-         } \
-         if (star_action && all_conds_have_it) { \
-@@ -422,6 +418,21 @@ Ret check_and_merge_special_rules(AstGrams& grams, const opt_t* opts, Msg& msg,
-         }
-     }
- 
-+    for (const AstGram& g : grams) {
-+        if (g.rules.empty()) {
-+#define CHECK_ACTION(action, str) do { \
-+            if (!g.action.empty()) { \
-+                RET_FAIL(msg.error(g.action[0]->loc, \
-+                    "%s action %sbut no rules found", str, incond(g.name).c_str())); \
-+            } \
-+} while(0)
-+            CHECK_ACTION(entry, "entry");
-+            CHECK_ACTION(pre_rule, "pre-rule");
-+            CHECK_ACTION(post_rule, "post-rule");
-+#undef CHECK_ACTION
-+        }
-+    }
-+
-     // zero condition must be the first one.
-     auto zero = std::find_if(
-             grams.begin(), grams.end(), [](const AstGram& g) { return g.name == ZERO_COND; });
-diff --git a/test/conditions/cond_error_10.c b/test/conditions/cond_error_10.c
-index 571028a22..3bfde301b 100644
---- a/test/conditions/cond_error_10.c
-+++ b/test/conditions/cond_error_10.c
-@@ -1 +1 @@
--conditions/cond_error_10.re:7:5: error: pre-rule action for non-existing condition `c` found
-+conditions/cond_error_10.re:7:5: error: pre-rule action in condition 'c' but no rules found
diff --git a/meta/recipes-support/re2c/re2c_4.4.bb b/meta/recipes-support/re2c/re2c_4.5.1.bb
similarity index 86%
rename from meta/recipes-support/re2c/re2c_4.4.bb
rename to meta/recipes-support/re2c/re2c_4.5.1.bb
index ea9364c483..ee3774017f 100644
--- a/meta/recipes-support/re2c/re2c_4.4.bb
+++ b/meta/recipes-support/re2c/re2c_4.5.1.bb
@@ -6,10 +6,9 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://CVE-2026-2903.patch"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
+SRC_URI[sha256sum] = "ffea067c11aa668bcb42885be6e6cd000302000b7747d2bb213299ec66b7864e"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


