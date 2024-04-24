Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE75AC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 23:44:26 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4368.1714002259324876045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 16:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IXs8hjoW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714002259; x=1745538259;
  h=from:to:cc:subject:date:message-id;
  bh=QYxb1RmpzEh1B9Yb4FnJ89AnNimoGtUp9JwzMtZ7b7k=;
  b=IXs8hjoWOHng9qwVxmDha3jyaXk79jNWp71U75s2dUNzIQ/JoZ5HllgW
   fmtCFZ+Hv0RIAlMhlWYzZXjBtsZy3ayvh5hcYrq25TtSlF3r9p2cHC+Ea
   YoF63bv9kupy+bsuVF67vKNIqU81Qlf7p3Si25/6IynoWUcI/U9SafucP
   rHdcIj0qyjJByyJXeSkvSp2o/KK+D0pFN29FBNe1nzj1DKHPXItvILxHt
   I6EcFKsgU1Efk4Cw5lfZhtn7/2laWkH7vtx1EGBA6jHs12uosIxte3QHx
   cAuroQcEXzmyCNnI4dALfVph7CxMHN0v8TA45YN8H7ADY/YMaS3Yh+bTk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="145093890"
X-IronPort-AV: E=Sophos;i="6.07,227,1708354800"; 
   d="scan'208";a="145093890"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 08:44:16 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83B53D9DC3
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 08:44:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6F9FBDB7C
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 08:44:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A050202CBE5D
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 08:44:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A772F1A0002;
	Thu, 25 Apr 2024 07:44:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] mesa: upgrade 24.0.3 -> 24.0.5
Date: Thu, 25 Apr 2024 07:43:57 +0800
Message-Id: <1714002237-18796-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28342.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28342.003
X-TMASE-Result: 10--1.466600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhHfUZT83lbkEO79
	DJRUi35pWwhqFGcExMuK8WnR386CVqtQiwhvr7wUTuctSpiuWyU2ZWOmuJUS2fuzwJAEkzruHqx
	sBjV0bTaESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLPGAg
	u24D5RfdM96T64n/R5e0Tf2y8KbDVTdTbpK1uKhi8S5Fq91FJe2ZEx8sjr3yvm/LYG5GtFe45j5
	on8LrAJffv5OR4R0xeIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 23:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198691

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.mesa3d.org/relnotes/24.0.5.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_24.0.3.bb => mesa-gl_24.0.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.3.bb => mesa-gl_24.0.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1c9fa66c72..77e9c80fcb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
+SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.3.bb b/meta/recipes-graphics/mesa/mesa_24.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.5.bb
-- 
2.34.1


