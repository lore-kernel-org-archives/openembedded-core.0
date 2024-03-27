Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566B5C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 03:21:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.29093.1711509665703210556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 20:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hZ0cPO2u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711509666; x=1743045666;
  h=from:to:cc:subject:date:message-id;
  bh=SVdgr5hGPrRpP9GOR2yyqMckiTUSO1ZhWoQyE2qJoy4=;
  b=hZ0cPO2u0BJI7DnYc/JeLgXn24o30qrG6n1cUutO4rxB3vnptGHjnxJ8
   nZhcsoK4yIAbImBXQnZRrlWQtO4Z+XP7dhetJ3ysAcKAUX4VcdPEMFnVU
   2HJIRh33CZ4up+1kC6tGvwVd3YYwCrLj7yEGAhsxIPz7OEzr3XdjkbOrr
   RnrRJLLAbcSn2ORTTFIHCUyV/bAtdBWkokrYpdaAp0tTT8VGF1nubqhyz
   rnwAoMlLGKsOwk4VkyPKjqDR25vrj4RNCZaU7YfeX21hR0KRTDG0bIfxX
   gm+iqEmhUNi0b6YiTIIPfYpmKBFI3hDl7tpHsHKn1DwWOhbeQkBrcubIV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="153504178"
X-IronPort-AV: E=Sophos;i="6.07,157,1708354800"; 
   d="scan'208";a="153504178"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 12:21:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC0BDC67E4
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:21:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E4F033742F
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:20:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65FD96BF4E
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:20:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E45DF1A006A;
	Wed, 27 Mar 2024 11:20:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] mesa: upgrade 24.0.2 -> 24.0.3
Date: Wed, 27 Mar 2024 11:20:54 +0800
Message-Id: <1711509655-3262-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28276.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28276.004
X-TMASE-Result: 10--2.040900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yTo39wOA02LhTJDl9FKHbrmysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74BrGKPhWryBmTUFVPU8vgTqUo/
	dNrdzOT96eNzRMFhZMjHmILAEyG7Dpljg/F9ExYR1e7Xbb6Im2lXgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1C5SerplSkh4QLyIyXUitUnSh6K1RNVx+K4Q6dFzydfTXk91MgdLqi+Z5+
	L0lcoBTDAWWBSb5M1Pp1yHNX9Fhxjgw2OZFCshFMi5lZCU5YJRTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 03:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197545

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
refreshed for 24.0.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Revert-meson-do-not-pull-in-clc-for-clover.patch | 13 +++++--------
 .../mesa/{mesa-gl_24.0.2.bb => mesa-gl_24.0.3.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                 |  2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb}         |  0
 4 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.2.bb => mesa-gl_24.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index f6d95c8982..1711e22585 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -1,4 +1,4 @@
-From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
+From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 8 Mar 2024 15:53:11 +0100
 Subject: [PATCH] Revert "meson: do not pull in clc for clover"
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 25e92ea5f95..3956e19c08f 100644
+index 2db6185..741b5d1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -818,6 +818,7 @@ if _opencl != 'disabled'
+@@ -813,6 +813,7 @@ if _opencl != 'disabled'
      error('The Clover OpenCL state tracker requires rtti')
    endif
  
@@ -29,7 +29,7 @@ index 25e92ea5f95..3956e19c08f 100644
    with_gallium_opencl = true
    with_opencl_icd = _opencl == 'icd'
  else
-@@ -842,7 +843,7 @@ if with_gallium_rusticl
+@@ -837,7 +838,7 @@ if with_gallium_rusticl
  endif
  
  dep_clc = null_dep
@@ -39,7 +39,7 @@ index 25e92ea5f95..3956e19c08f 100644
  endif
  
 diff --git a/src/compiler/meson.build b/src/compiler/meson.build
-index 8d73544c6d8..1dae56d1b2b 100644
+index 8d73544..1dae56d 100644
 --- a/src/compiler/meson.build
 +++ b/src/compiler/meson.build
 @@ -79,7 +79,7 @@ subdir('nir')
@@ -51,6 +51,3 @@ index 8d73544c6d8..1dae56d1b2b 100644
    subdir('clc')
  endif
  if with_gallium
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a8088e6fb6..b08ec873a0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
+SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.2.bb b/meta/recipes-graphics/mesa/mesa_24.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.3.bb
-- 
2.34.1


