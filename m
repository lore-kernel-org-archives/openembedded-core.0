Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E9CC43217
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915811"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915811"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956796"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/26] linux-firmware: upgrade 20210919 -> 20211027
Date: Tue,  9 Nov 2021 22:37:39 +0800
Message-Id: 
 <38d613df4854d269493d019d24606161d49b4659.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158025

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
index 48c01d99fe..97d42e98e2 100644
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
2.31.1


