Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41F5C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:21:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.24519.1704180103829931552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="133448554"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="133448554"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:21:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D366CC15F
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:21:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 904AD15345
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:21:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E4B466BF42
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:21:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80CEF1A0070;
	Tue,  2 Jan 2024 15:21:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 23.3.1 -> 23.3.2
Date: Tue,  2 Jan 2024 15:21:29 +0800
Message-Id: <1704180089-8513-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-1.377900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUhwlOfYeSqxkdS3kPlaZyXfUZT83lbkEO79
	DJRUi35pWwhqFGcExMuK8WnR386CVqtQiwhvr7wUTuctSpiuWyUUi4Ehat0547V5fSMRD1zqpC0
	eXDBJ89FzYlQyzrfdqXyS9/LtVbTuvFKGh3d2fLAqy6shOlK/47Fk511UyURnD2veI3/hwm/X7Q
	qxdrFbPuLzNWBegCW2wgn7iDBesS0nRE+fI6etkkk4tYvooJZyEId2CSU8bAItxjy/rOICJ+ibu
	mfm1RSKYFQx3Hum8mZrotSuhKQSqA+VwSNRzN1fr2XCQZG7HerE5MX1wFsCM0u/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193210

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-check-for-all-linux-host_os-combinations.patch
refreshed for 23.3.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...son.build-check-for-all-linux-host_os-combinations.patch | 6 +++---
 .../mesa/{mesa-gl_23.3.1.bb => mesa-gl_23.3.2.bb}           | 0
 meta/recipes-graphics/mesa/mesa.inc                         | 2 +-
 .../mesa/{mesa_23.3.1.bb => mesa_23.3.2.bb}                 | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.3.1.bb => mesa-gl_23.3.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.3.1.bb => mesa_23.3.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index a555c5f865..fadd6ee201 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From b251af67df5a6840d2e9cc06edae2c387f8778f1 Mon Sep 17 00:00:00 2001
+From f2fe76d506f356de055b8eca83a7c9d0744a40af Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 22385d8..15f48a6 100644
+index 35cc5f1..9a49c0d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -121,7 +121,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
@@ -32,7 +32,7 @@ index 22385d8..15f48a6 100644
  
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-@@ -909,7 +909,7 @@ if cc.has_function('fmemopen')
+@@ -956,7 +956,7 @@ if cc.has_function('fmemopen')
  endif
  
  # TODO: this is very incomplete
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.3.1.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.3.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.3.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5f5c8ceb4c..ddbebccd9b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
 "
 
-SRC_URI[sha256sum] = "6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6"
+SRC_URI[sha256sum] = "3cfcb81fa16f89c56abe3855d2637d396ee4e03849b659000a6b8e5f57e69adc"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.3.1.bb b/meta/recipes-graphics/mesa/mesa_23.3.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_23.3.2.bb
-- 
2.34.1


