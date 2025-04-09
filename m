Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF9AC36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:47:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13548.1744166858101594836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f00vk9Hl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744166858; x=1775702858;
  h=from:to:cc:subject:date:message-id;
  bh=sZ1nLHTE+SyO2GyXZQuM3JzSNTZ/kBHLxW3kvbQa60Q=;
  b=f00vk9Hl5fsG6A7GG0nYOAxP86kKCueaZMHzTvAUQR3iQ42QYQqkTSfs
   GNM7iO9U4jky3TtFQaA+F6su9C9YbNVOl+ZoO37jxBPngM9XVwQwOMHcJ
   jNGanjbzSZOb79zypWanI60xp7SeBms8xuL2ctTEKtxMgako0ODFlppeY
   CgymQyBqwzxgXmXKShPYIk2eDtwXD8ZVVfy1U/918/ffGVUATEFiZ5y00
   Lt8J4MxpkfMqoB5UVRFzMJf4JGDWw3XHLYeRwFCOEeJ04eIfD47E5Sd2U
   VqAUsXbE1C2krD6XocmeFc9oncZT0FHXCV2BXZzDPa9vvkMNau5Kl7Kgx
   Q==;
X-CSE-ConnectionGUID: QxkS/VuERVCSMkQV9qvRwA==
X-CSE-MsgGUID: hC20FwolT4quepsFwOdffA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="175318483"
X-IronPort-AV: E=Sophos;i="6.15,199,1739804400"; 
   d="scan'208";a="175318483"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:46:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B91C6DBB81
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:46:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B8E4D4BF1
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:46:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CAAF1A0078;
	Wed,  9 Apr 2025 10:46:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] sbc: upgrade 2.0 -> 2.1
Date: Wed,  9 Apr 2025 10:46:26 +0800
Message-Id: <1744166786-4539-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214573

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Using SPDX-License-Identifier: LGPL-2.1-or-later to replace the description of license

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-multimedia/sbc/{sbc_2.0.bb => sbc_2.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_2.0.bb => sbc_2.1.bb} (66%)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.0.bb b/meta/recipes-multimedia/sbc/sbc_2.1.bb
similarity index 66%
rename from meta/recipes-multimedia/sbc/sbc_2.0.bb
rename to meta/recipes-multimedia/sbc/sbc_2.1.bb
index d25be9e80c..5f0721878a 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.0.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
@@ -7,14 +7,15 @@ LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-examples = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/sbcenc.c;beginline=1;endline=24;md5=08e7a70b127f4100ff2cd7d629147d8d \
-                    file://sbc/sbc.h;beginline=1;endline=26;md5=0f57d0df22b0d40746bdd29805a4361b"
+                    file://src/sbcenc.c;beginline=1;endline=8;md5=1db4f3850f47b59e79aeedb2668f4b3e \
+                    file://sbc/sbc.h;beginline=1;endline=10;md5=c5a50a7fc33c148ee362e2b46574a87f \
+                    "
 
 DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992"
+SRC_URI[sha256sum] = "426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


