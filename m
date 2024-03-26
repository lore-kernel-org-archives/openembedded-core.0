Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA02C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7936.1711413454417569341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bmH1A8KU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413455; x=1742949455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8Mpf0HLb4XYljsn+K+BVq45hYbubpQqnbxJ1jgt/JXE=;
  b=bmH1A8KUVIKO6kwiHNXyMZA7Ath5s43Pxfkb0y3iJbGY3edUPwtqz8BH
   jquWyk1+PBoKwAQf00WTu69v1rW86O2Ef8nxHPFo5+aRbPYPnU47mW8yL
   lRhvimuDy+lSuh9KLgHKo8sK+3x9qVWR9ZuNGO+vgGwhIrRxrbLlgWRcj
   bgKfwjuUlrV+Wy5TbkxcEUpUCvzENUo5aqABAP3DURS5fsHBMVAdvw0t+
   IxMo+3kMW8Q4uk4fGPDbCCgwIoXC+MgrWs8FtjfVd0FNkcvGxRdQArZX0
   yGKBG7vCHXknqheESoPlA6lCPg5jfUSqg8gxwgCNvzkC3igoZKWu23FAx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153607387"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153607387"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D98AF10A32B
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F7CCCF7F1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97EEC6B4C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4362E1A006A;
	Tue, 26 Mar 2024 08:37:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 17/34] mesa: upgrade 24.0.2 -> 24.0.3
Date: Tue, 26 Mar 2024 08:34:35 +0800
Message-Id: <1711413292-3025-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--2.040900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yTo39wOA02LhTJDl9FKHbrmysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74BrGKPhWryBmTUFVPU8vgTqUo/
	dNrdzOT96eNzRMFhZMjHmILAEyG7Dpljg/F9ExYR1e7Xbb6Im2lXgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1KM/YLUgK1bzyITVI5ewBSTi2Ow4SMPNj3/2oBFL986gKbrvDrEtLrzhpZ
	jbMJlIYsg2wOeWF1HxAj/DJTDjP3AGyG2AwFHo38r64759oAVlTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197506

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
refreshed for 24.0.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Revert-meson-do-not-pull-in-clc-for-clover.patch | 13 +++++--------
 meta/recipes-graphics/mesa/mesa.inc                 |  2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb}         |  0
 3 files changed, 6 insertions(+), 9 deletions(-)
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


