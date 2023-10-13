Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3C0CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:01:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.34422.1697187708713854871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="124032976"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="124032976"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:01:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9977AE8521
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:01:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C5E55D67CA
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:01:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06BB96BC5B;
	Fri, 13 Oct 2023 18:01:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva: upgrade 2.19.0 -> 2.20.0
Date: Fri, 13 Oct 2023 17:01:25 +0800
Message-Id: <1697187685-4366-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--10.530000-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mr4SkIdSwphgZUjspoiX02F67K
	shbXta6wU7j042MPXf81yv2Nfxg1igtUo+vOXxr5LGQFtelDl4tN8rmPQRlvKy89EUWFxaFgf6O
	+FEJQpgBSdKNHCgOqzMuHgW1QxPEas4ry6yQggpsdahq+rGDn/45UafLmrvaGPHMAbjuhwd8VKY
	HUstbYP7mJIvZ2OXZVzR5JYPOv843vnOSC+jk4Dn84FZpy/6JVTSz0JdEAJbQEnSJdoye7EIpbw
	G9fIuITCC8aAmGeO6m04MnVL1Uks39JXYBaBfzuxLSsi9FKAT3BOVz0Jwcxl0fyM5VfgjG2NBdO
	RIzcI4YqwQQ11oEf/SiOf1NDnCI+5UcZtwNsCroURSScn+QSXt0H8LFZNFG7bkV4e2xSge60P08
	un+5hUj0gCi/hXKPUy7X2RlevrjQE13ifgOSGm5RMZUCEHkRt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189042

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* va: drop no longer applicable vaGetDriverNames check
* va: remove unreachable "DRIVER BUG"
* x11/dri2: limit the array handling to avoid out of range access
* va/backend: document the vaGetDriver* APIs
* va/backend: annotate vafool as deprecated
* win32: remove duplicate adapter_luid entry
* va: Added Q416 fourcc (three-plane 16-bit YUV 4:4:4)
* trace: fix minor issue about printf data type and value range
* jpeg: add support for crop and partial decode
* trace: Unlock mutex before return
* trace: Add trace for vaExportSurfaceHandle
* av1: Revise offsets comments for av1 encode
* va: Add new VADecodeErrorType to indicate the reset happended in the driver.
* drm: limit the array size to avoid out of range
* va: fix:set driver number to be zero if vaGetDriverNames failed
* va: fix:don't leak driver names, when override is set
* win32: Only print win32 driver messages in DEBUG builds
* va: Add vendor string on va_TraceInitialize
* va: remove legacy code paths
* drm: remove no longer used helpers
* x11: remove legacy code paths
* x11: allow disabling DRI3 via LIBVA_DRI3_DISABLE env var
* x11: implement vaGetDriverNames
* va/x11/va_nvctrl: remove some dead code
* va/x11/va_fglrx: remove some dead code
* va: optimize code of getting driver name for all protocols/os(wayland,x11,drm,win32,android)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-initial_2.19.0.bb => libva-initial_2.20.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.19.0.bb => libva_2.20.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.19.0.bb => libva-initial_2.20.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.19.0.bb => libva_2.20.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.19.0.bb b/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.19.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.20.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 3388fea32b..486291bced 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "963be798d559df7feebda6fa81aa0dae6f9409c633a37909c44c6aa8af1e2174"
+SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.19.0.bb b/meta/recipes-graphics/libva/libva_2.20.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.19.0.bb
rename to meta/recipes-graphics/libva/libva_2.20.0.bb
-- 
2.34.1


