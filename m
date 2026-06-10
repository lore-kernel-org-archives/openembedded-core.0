Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E73CD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:12 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16351.1781085003213446145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K2w+D4t+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085003; x=1812621003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M2b3PBLr4At+ADn15miHfcVhaowX96M/8tNPEUIDVVU=;
  b=K2w+D4t+Kl3OLTpf0Y4vW7eEc+EHanheF6yg3T/JtYB99B6sJIBFHkAs
   NJ1KkPblhL2TuLPSpGw8a8VLKRWGv9Vj+scOc8tWjHrYLEHgZQNgvZKuW
   Zu48eR/WIxrSOZWIlEHgR+K/Pa6HVUHVHytDKUjoAwhomHibJhvV4coAE
   EJyaEPuUDw2w3gUQ/LSuM5c4L1N6Ll7eAhakmzHbvotsrqQRjl7sEvNNg
   xRmlMi4+nrFhY8hMSMaf4fsP1oZ9GKA66S2wCXq04HTJD8kLvTFBMwIx1
   u0d7mK1StV5hHVo0yWMZSohsgZs0UhDH4c6FIc6mtZbdD9BoZ/sYQMDQI
   Q==;
X-CSE-ConnectionGUID: WR1y5CPpQX+5NgkoPa+Bqg==
X-CSE-MsgGUID: vS+Dgr18SGGnAYaPklnfbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="221348024"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="221348024"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:58 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DBF9142A309
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:56 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 8B80510000D4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A6556140027B;
	Wed, 10 Jun 2026 09:49:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/16] fontconfig: upgrade 2.17.1 -> 2.18.1
Date: Wed, 10 Jun 2026 17:49:24 +0800
Message-ID: <20260610094932.2264-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238334

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build-Added-missing-target-rule-dependencies.patch
musl-fix.patch
removed since they're included in 2.18.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ded-missing-target-rule-dependencies.patch | 31 ---------
 .../fontconfig/fontconfig/musl-fix.patch      | 66 -------------------
 ...tconfig_2.17.1.bb => fontconfig_2.18.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 100 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.17.1.bb => fontconfig_2.18.1.bb} (92%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
deleted file mode 100644
index 40b25cc926..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0bba79bfd3d8a216794d15af97ce4abefd4b8748 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Florian=20=22sp1rit=22=E2=80=8B?= <sp1rit@disroot.org>
-Date: Sat, 9 Aug 2025 20:22:43 +0200
-Subject: [PATCH] build: Added missing target rule-dependencies
-
-02b835b62 did not appropriately ensure, that the patternlib_internal
-target waits until the {ft_,}alias_headers have finished generating the
-headers that it depends on.
-
-Upstream-Status: Backport [0bba79bfd3d8a216794d15af97ce4abefd4b8748]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index c4d65d6c..10866aa8 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -9,7 +9,7 @@ endif
- # Factor our pattern manipulation code into its own library
- # to break the depedency cycle:
- # FontConfig pattern handling - Fontations code - FontConfig.
--pattern_sources = [ 'fcpat.c', fcstdint_h, fclang_h ]
-+pattern_sources = [ 'fcpat.c', fcstdint_h, fclang_h, alias_headers, ft_alias_headers ]
- pattern_lib = static_library('patternlib_internal',
-                                     pattern_sources,
-                                     include_directories: incbase,
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch b/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
deleted file mode 100644
index c4508bd15a..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 75cc3e6ef0e451f42d3464ed4d639304ad9a4f58 Mon Sep 17 00:00:00 2001
-From: Akira TAGOH <akira@tagoh.org>
-Date: Thu, 3 Jul 2025 03:31:49 +0900
-Subject: [PATCH] test: Fix a build issue with musl libc
-
-Fixes https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/484
-
-Changelog: fixed
-Upstream-Status: Backport [https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/75cc3e6ef0e451f42d3464ed4d639304ad9a4f58]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- test/test-mt-fccfg.c | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/test/test-mt-fccfg.c b/test/test-mt-fccfg.c
-index 24ad7583..3b7d843d 100644
---- a/test/test-mt-fccfg.c
-+++ b/test/test-mt-fccfg.c
-@@ -1,9 +1,12 @@
- /* Copyright (C) 2025 fontconfig Authors */
- /* SPDX-License-Identifier: HPND */
-+#ifdef HAVE_CONFIG_H
-+#  include "config.h"
-+#endif
-+
- #include <fontconfig/fontconfig.h>
- 
- #include <stdio.h>
--#define __USE_XOPEN
- #include <pthread.h>
- #include <stdlib.h>
- 
-@@ -13,6 +16,21 @@ struct thr_arg_s {
-     int thr_num;
- };
- 
-+#ifdef _WIN32
-+int
-+setenv (const char *name, const char *value, int o)
-+{
-+    size_t len = strlen (name) + strlen (value) + 1;
-+    char  *s = malloc (len + 1);
-+    int    ret;
-+
-+    snprintf (s, len, "%s=%s", name, value);
-+    ret = _putenv (s);
-+    free (s);
-+    return ret;
-+}
-+#endif
-+
- static void *
- run_test_in_thread (void *arg)
- {
-@@ -61,7 +79,7 @@ test (void)
-     if (c1 == c2)
- 	return 1;
-     /* To make visible if we have any references */
--    putenv ("FC_DEBUG=16");
-+    setenv ("FC_DEBUG", "16", 1);
-     FcFini();
- 
-     return 0;
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
similarity index 92%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
index 0d0fcfcceb..76b2652738 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
@@ -22,10 +22,8 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 
 SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
-           file://musl-fix.patch \
-           file://0001-build-Added-missing-target-rule-dependencies.patch \
            "
-SRC_URI[sha256sum] = "9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541"
+SRC_URI[sha256sum] = "2300f3dbfa7253b3a44f4feecdbc8dfa45dde5dc2cfb71fceaf31f394cb41031"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.43.0


