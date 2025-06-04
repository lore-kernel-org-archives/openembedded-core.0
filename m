Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB82AC61CE8
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11713.1749026733689315424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aWuqz8vz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026737; x=1780562737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pnss3QW+Ia2bQ1GfV3q9R7ZOLCKJrJ/GBdjpZ8fcoSQ=;
  b=aWuqz8vzHhrC+vgYgovfTXdAhkphkbiytLiUiV7o2Sm6Kzf8TLfLSmhp
   dO8OWi+m/RGXi0iy9LhMM+P1KTq1Z50YmGHKfwsGeComyh+dG8lwGrtbK
   OezTTAMgrquabL4kCjB6doofBqkOxOFcbmPmXf30U41PJ+mBM93Cc1xS1
   br4oDsuIggGSPHJJYDvHKFoqdHgEvoLRABv0T8CBAhA+VX/Ex+maKy+SC
   kvu2gxVRV0DFTrpru3/BifZllqGmnyKffrcM2Z3102eWdkxBvMjhYlqj2
   vqWICd6iEjlcCz3CZn23Csj9PVlGwg9+YvwVplZ6WqOxBgmmmyiATbxpF
   g==;
X-CSE-ConnectionGUID: tGColuUhTDOtz4b0D2YD5g==
X-CSE-MsgGUID: JKdjHAO5RQyr/KgmbktQMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="202109479"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="202109479"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18B63DBBCA
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4F68D7527
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:33 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6DC8D1A0078;
	Wed,  4 Jun 2025 16:45:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/45] gstreamer1.0-vaapi: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:54 +0800
Message-ID: <20250604084524.864-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217860

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-vaapi_1.26.1.bb => gstreamer1.0-vaapi_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.1.bb => gstreamer1.0-vaapi_1.26.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
index e922815162..7079641bc4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1fc779690cd8d6c5ef3cd84e5a552f864815ea8d9c269370c8d21e0b6d5337c9"
+SRC_URI[sha256sum] = "0e24194236ed3b7f06f90e90efdf17f3f5ee39132e20081189a6c7690601051a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


