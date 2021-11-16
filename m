Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D37C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:36 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.5107.1637033071172269122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220822430"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="220822430"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567023948"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/14] linux-firmware: upgrade 20210919 -> 20211027
Date: Tue, 16 Nov 2021 11:24:11 +0800
Message-Id: 
 <0fb5bbcf194e042d7504791173d35fdeab4a6861.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158328

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares listed

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ca3fb1c7f11e04bf8d8bf59901ddd60178cb13c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20210919.bb => linux-firmware_20211027.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
index 03eb1a29f0..76aed9d443 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=76f012f7e9b2260d34eccf5726374f08 \
+                    file://WHENCE;md5=d627873bd934d7c52b2c8191304a8eb7 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2fb22a5d7d23bf1f5800ab8152b39a00a445fbf4923de5a01b59d3f6253f0a9f"
+SRC_URI[sha256sum] = "bc2657dd8eb82386a9a7ec6df9ccf31c32c7e9073c05d37786c1edc273f9440a"
 
 inherit allarch
 
-- 
2.33.1


