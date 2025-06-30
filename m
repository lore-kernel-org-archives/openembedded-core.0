Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4577DC83037
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.35179.1751274812522132575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m95AD5dv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274813; x=1782810813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZSvcXTA+ZM9UVnegb2BpZw+Dl5gaXHU7JxplrDWUWUU=;
  b=m95AD5dvig3xjhqjivgd1zfxySbFl07+PpmGRI+LClCIehbW79OjO6Po
   dx5D/PEwjIqeELe2WbgHhbtt8+TW0Wut+GXxlLfAa1uaULnVZQbK6u59D
   ue6LVLM00mCA+Q6mL9msiMOnHsOESsJTynd04GbH/aPPHz8F1aoJI9bdl
   DKRCbex3k0bpanRjNYP1k+aN+MDJdBT1radVjBPaVynMXW7/FWNmtql0p
   mcp3DufHG5MHSTuj4W+BSGdRe0xnQPvD5OFGK6H1jgx2sHxeUS75GuZ5C
   VMd+HJad663pEUjCR4606qKoeGMvBRX6NEe7VsXHGI/21mvH4dlpxDshz
   Q==;
X-CSE-ConnectionGUID: vDWlo2ZcTzygHEp45gnOdw==
X-CSE-MsgGUID: ug6L4P2yQlihBQngR4bgzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="183439933"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="183439933"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CE3AD1C0213B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:30 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id 13DD5140039D
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 82720CFA20
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:28 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E59B1A0074;
	Mon, 30 Jun 2025 17:13:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/37] mesa: upgrade 25.1.3 -> 25.1.4
Date: Mon, 30 Jun 2025 17:13:00 +0800
Message-ID: <20250630091315.1897-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219486

From: Wang Mingyu <wangmy@fujitsu.com>

0001-freedreno-don-t-encode-build-path-into-binaries.patch
refreshed for 25.1.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on-t-encode-build-path-into-binaries.patch | 23 +++++++++----------
 meta/recipes-graphics/mesa/mesa.inc           |  4 ++--
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 953a724dc0..059ff46cef 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From 1e76f138b1eb3102a84e032961e560aeb9c70a6b Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Date: Tue, 16 Jul 2024 12:32:47 +0300
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -13,13 +13,14 @@ it manually when running the tests.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 ---
- src/freedreno/afuc/meson.build   | 4 ++++
- src/freedreno/decode/meson.build | 4 +++-
- src/freedreno/meson.build        | 2 +-
- 3 files changed, 8 insertions(+), 2 deletions(-)
+ src/freedreno/afuc/meson.build        | 4 ++++
+ src/freedreno/decode/meson.build      | 4 +++-
+ src/freedreno/meson.build             | 2 +-
+ src/freedreno/registers/gen_header.py | 7 ++++---
+ 4 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
-index bb7cebf5a748..351cc31ef2de 100644
+index bb7cebf..351cc31 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
 @@ -56,10 +56,12 @@ if with_tests
@@ -50,7 +51,7 @@ index bb7cebf5a748..351cc31ef2de 100644
      )
      test('afuc-disasm',
 diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
-index 469eeb4eb597..dfa1c12d0d9f 100644
+index 469eeb4..915ba11 100644
 --- a/src/freedreno/decode/meson.build
 +++ b/src/freedreno/decode/meson.build
 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
@@ -72,7 +73,7 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
  
      test('crashdec-' + name,
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index 98e49b8fcf0e..145e72597eb9 100644
+index 29e1bc4..afb7426 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
@@ -85,9 +86,10 @@ index 98e49b8fcf0e..145e72597eb9 100644
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
 diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen_header.py
+index e1cfb5f..4e3db12 100644
 --- a/src/freedreno/registers/gen_header.py
 +++ b/src/freedreno/registers/gen_header.py
-@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
+@@ -889,13 +889,14 @@ The rules-ng-ng source files this header was generated from are:
  """)
  	maxlen = 0
  	for filepath in p.xml_files:
@@ -105,6 +107,3 @@ diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen
  	if p.copyright_year:
  		current_year = str(datetime.date.today().year)
  		print()
----
-2.39.2
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6b42a238cc..3d9e9ec91f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-dont-build-clover-frontend.patch \
 "
 
-SRC_URI[sha256sum] = "ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f6585436ca6e3cddba7f"
-PV = "25.1.3"
+SRC_URI[sha256sum] = "164872a5e792408aa72fecd52b7be6409724c4ad81700798675a7d801d976704"
+PV = "25.1.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


