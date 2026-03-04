Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320D6EB7EC9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15016.1772620362413443645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UXZ6Hqzc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620363; x=1804156363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y5moNb5xATjLasOgVHOtqNXllVwMYWwlX5nDKyaqock=;
  b=UXZ6Hqzc2PUNdUs0Y4jpvWGJpk3qWN5pM/xl59SRkZrsbckNj0J67so3
   Lgmd5S8A+jyT0i6fH+I42rwXvK6BoU7xoB/mRI0LPkXcqxzkm3Ej9PqoR
   TFQ/7VhKqEvXho58pjS8tnCsXiB9lXMsSfc5P1WI35ZatpsT6qGfot9Uq
   COY8KEzE27vyCx0w3XCXqZATnbKAjvO4lWrIMaqMkgBBnIMQe1BXgke4q
   1qQYIVwkTRwMWYpdsQ9vklZTNs8yca5kAHD6b7r7jI24GntO8w7kNCUv/
   8Xh1WJo2gSiyxgKWW+5uDX0VxaZbYSTDr3yHT+NMHRq4NhI9JEU1oGqZt
   w==;
X-CSE-ConnectionGUID: j4Cx8KfkTau+HtHqX1Nh8A==
X-CSE-MsgGUID: AhHWuQ7MSbCQOsn8wn8X0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="236144002"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="236144002"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CF1DA1C00087
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:40 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 8277A1004142
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C6A2B100718D;
	Wed,  4 Mar 2026 10:32:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:32:03 +0800
Message-ID: <20260304103203.1649-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232369

From: Wang Mingyu <wangmy@fujitsu.com>

0002-tests-add-support-for-install-the-tests.patch
refreshed for 1.28.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...2-tests-add-support-for-install-the-tests.patch | 14 +++++++-------
 ...treamer1.0_1.26.9.bb => gstreamer1.0_1.28.0.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb => gstreamer1.0_1.28.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ccfc869813..720a6f0c97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
+From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -12,17 +12,17 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
  meson.build                  |  4 ++++
- meson_options.txt            |  1 +
+ meson.options                |  1 +
  tests/check/meson.build      | 22 +++++++++++++++++++++-
  tests/check/template.test.in |  3 +++
  4 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 0a77e90..cadfaeb 100644
+index 8adc055..b5c9e5b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -664,6 +664,10 @@ if bashcomp_dep.found()
+@@ -667,6 +667,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644
  plugins_install_dir = join_paths(get_option('libdir'), 'gstreamer-1.0')
  
  pkgconfig = import('pkgconfig')
-diff --git a/meson_options.txt b/meson_options.txt
+diff --git a/meson.options b/meson.options
 index 39255cf..78af552 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
+--- a/meson.options
++++ b/meson.options
 @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
index c66f614629..63633fea05 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
+SRC_URI[sha256sum] = "6c8676bc39a2b41084fd4b21d2c37985c69ac979c03ce59575db945a3a623afd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


