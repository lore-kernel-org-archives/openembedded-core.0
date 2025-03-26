Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6382EC36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 03:57:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.14536.1742961462945331171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 20:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bapuTKep;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742961463; x=1774497463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CuzGZg3d1KJv04mgh1GDdpcS8s5Ulj1nnI56twv0y1U=;
  b=bapuTKepBNseN6hHnmq+Xk8NsRWK+U9N/ohhftRrXRqGwUVcrs7H6dUv
   UEIQA1q7QklCBab1krWEEIEmgpYHYnm5b5INk2hvNbRoxSykA5RGlk6md
   TRWjQ2f2+VlsGpcK/h/i2q5Bkh4A6zTHEWvDRcWANUU04LibWJQ1QGIW6
   OvO3KmYKnTqmdsnK00zYWI+t+xcRfN2cB5qaIVErpl8BVQGrIjg3qShe9
   +F+kDxZ/LZMx5ueIdPgLfi5zapPKIssF3wM0ssjjiES++eYU2dxeVD30l
   80gojZQojUUQBnNCnp4x8Pfq37IUlLUj2HNmJXldTNGBowIRB15OfOVcA
   Q==;
X-CSE-ConnectionGUID: NrWG1o+KTo+Bwy/G5VFpgw==
X-CSE-MsgGUID: H+TsUpL4T1OJSHdSBS4hzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="182708066"
X-IronPort-AV: E=Sophos;i="6.14,276,1736780400"; 
   d="scan'208";a="182708066"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:57:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39650D6191
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E46B6D50EE
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:37 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 52F091A009A;
	Wed, 26 Mar 2025 11:57:37 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 4/7] gstreamer1.0-vaapi: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 11:56:36 +0800
Message-Id: <20250326035639.1919-4-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326035639.1919-1-leimaohui@fujitsu.com>
References: <20250326035639.1919-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 03:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213629

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
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


