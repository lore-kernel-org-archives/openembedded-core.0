Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD79EC36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 06:37:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.16181.1742971021100365423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 23:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U6Uw/VYY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742971021; x=1774507021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xkW2pvu+pXAnRN/jX2VNuq9x/PVk5F/aLoPxj1JWh9E=;
  b=U6Uw/VYYygOIWmDdLoA5y+iD58Q7bMlNID1RLz6CpCxaTGNt/AxRX27L
   E2tkrtP9gX8j5LWhNduj1L8Hkm0QoKI5qlfqyH9O0PIcB+hSQhrJPpy+v
   d3XRi/gWMkQB+AHxBTXXvArlF0vPj/LVZn5kT7+vchelaj/Wlw2QRVCdD
   LhQoV9QK9aMphjD3D37LqoQ/ZnzQwkmkz4durHMODMNPDRv+YVw90TJMQ
   y2RcPVj6YB+dqt7FxK+gIOgcoq2cVPUjW/8ZJLf/G6HV4u0utCTMIrCzM
   ylCEfq1NY6wFh/qXB1Y68GRqiI2+z6UTEHTqgoIKYOYft2VwmlbA5jajo
   g==;
X-CSE-ConnectionGUID: TtoVztkFRf6e6vsQlYa+0A==
X-CSE-MsgGUID: Gmg/uVWgQqm/K15wpJN+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="194317892"
X-IronPort-AV: E=Sophos;i="6.14,277,1736780400"; 
   d="scan'208";a="194317892"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:36:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08519DBB81
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6B10D4BE8
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:52 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 29C4F1A00A0;
	Wed, 26 Mar 2025 14:36:52 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leihaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 4/7] gstreamer1.0-vaapi: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 14:36:44 +0800
Message-Id: <20250326063647.1941-4-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326063647.1941-1-leimaohui@fujitsu.com>
References: <20250326063647.1941-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 06:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213638

From: Lei Maohui <leihaohui@fujitsu.com>

Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
---
 ...treamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.26.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
index c634de7c6a..8ed84d0ebe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "39ab3d2a381c99a9e10f46182ed57c6baaeaa8be810bd2f84f162c8be299753c"
+SRC_URI[sha256sum] = "573931d455f5a96f63db7c8d35d51322b8d287816e8c6a77d84cfbb9fa1351f1"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


