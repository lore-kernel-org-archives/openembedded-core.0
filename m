Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326C2CED25D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9171.1728452975929969153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UC9RgoXW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452978; x=1759988978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KHMykXZwVHE9ldiThG0zKetqiBz4OZnVVCRawWHKy1s=;
  b=UC9RgoXW1+8sW6+qW3KY4YUB5zoM7Op8TbLlsSbm9J/50fu5yzhSNLR3
   /KPTNYwq8PaJPSGFIuV+o9j/xJy6Q9wolMG/Yx3mA3DdVJPeMIgr4x4xl
   WP4I+nlMBTmsGV+16/e5uGwmEV4Yv8QM9SLOqsWgNobO2ngj9S1R2W66L
   nFnyXkduG75rRCkdYNZg0IGfcv6VeMG9YFEZV2U73I6zxiv5cysWLIsH3
   WE4cKYmp+PewDohIX+ms2+o3LCIGymp8rca0gh7yCcGPHtm05+xgnl4xy
   Fabuw8frFik+UUhJd6s6Xy4Whc3TbUrJa5Jef06/5EGzAFfHSrXp6OUjk
   w==;
X-CSE-ConnectionGUID: KUgMKcb4Su+OavUSAI2QkQ==
X-CSE-MsgGUID: g3vw7IEPTy+lCPerC14UoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="164586945"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="164586945"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 245ECC68E5
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59E6AD50FA
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0A9CE5A18
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BE591A000A;
	Wed,  9 Oct 2024 13:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/26] libsdl2: upgrade 2.30.7 -> 2.30.8
Date: Wed,  9 Oct 2024 13:48:58 +0800
Message-Id: <1728452955-25051-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--0.611800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjhA4WtAM986SSD
	VKe738VfhNk7HPtAZP+aTlPB3GZ9vxZBX4eaTpnnDOL14/DRHdAMY91gOjONY5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3vVbHa5Rs8t8TGavmGo0vWHpyu/FxYOKE86a
	y9NNiI8eLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w6EIuwQ9Ms6ORqGs
	jHHETxdpa90sYHVUi9TKJ936e1QkzGyklRnVBXcjQvzfDQPpT6oqqHNSRqy/NW/6RAs7KyrdTvt
	K15yRaiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205319

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fixed a crash in XInput code at startup
- Fixed flooding the OS with I/O when a PS4/PS5 controller is disconnected
- Added SDL_VIDEO_DOUBLE_BUFFER support to the Wayland backend
- SDL_WINDOWEVENT_EXPOSED is sent appropriately when using Wayland
- Fixed hang at startup in audio code when the application has large stack usage on Linux
- Fixed initializing KMSDRM on older Linux systems
- The pre-built SDL2.dll no longer depends on ucrtbase.dll

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.7.bb => libsdl2_2.30.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.7.bb => libsdl2_2.30.8.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
index 25bbe2067a..d46f014502 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "2508c80438cd5ff3bbeb8fe36b8f3ce7805018ff30303010b61b03bb83ab9694"
+SRC_URI[sha256sum] = "380c295ea76b9bd72d90075793971c8bcb232ba0a69a9b14da4ae8f603350058"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


