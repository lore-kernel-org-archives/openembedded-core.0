Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EC4C4707F
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VneeS3W3;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169711; x=1680705711;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lGuP+lsWiHnHw9jzrFzef+/2t665gny0FE24CdsiItg=;
  b=VneeS3W3JDKnObdyABYV+uxpHjqnMyXbenMP8yfUSN2ZM56ySiCjvpGn
   fw1KAVvwMi7Ac7QeHlH8RgseaDVMVnH6/DHHIELTc80KBDL9jJn+StUtK
   sisZth3h+jDZN2W4QMSerjoLCUapwxbEjXL5RC2unKegFt9HzOK0Aitl3
   zliMxL36qhMA2DpjrHBzOks/SGYBX2k/V3Z/weT68hLYhuoUcXTbKiDCK
   noEUR31Lqay0K2FXHhX7NEjPbqu5bIWZwgVtO4nVYRcKyVwpkTkluRVKM
   dS9iXO1SVIc96oZt6SLOy9FfJ7sSpjBOPrbslg589RLOv38F73NmQpvVL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348669"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953517"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:50 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/22] linux-firmware: upgrade 20220209 -> 20220310
Date: Tue,  5 Apr 2022 22:41:22 +0800
Message-Id: 
 <cadec2b988825cfdf9b571cc6227f9a6bcdfa3a4.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164021

From: wangmy <wangmy@fujitsu.com>

License-Update:
 year updated to 2022
 Version of some driver files updated
 Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be1b1d204c89035c54a626db46c5054e553b82c2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...inux-firmware_20220209.bb => linux-firmware_20220310.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
index fe51892eb4..fa0f906db0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
@@ -72,7 +72,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
+                    file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
                     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
+                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
+SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
 
 inherit allarch
 
-- 
2.35.1


