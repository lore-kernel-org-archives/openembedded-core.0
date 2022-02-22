Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC26C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BlGKrTCq;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542533; x=1677078533;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6eu7TU0nhq2cli+gC9OLRIy3BN/qksYsnTOVOTvUg7M=;
  b=BlGKrTCq0dJlmIUF2sf4m52l6/tk5GU+Hy8/LODdhPbg8e4tWKPKq/IK
   WV1jinpKntXU2rclohPJfnz8UTPZgRpFhROAPkmD39a0kxmwT6y/Dd5n4
   vZchJvNqaXXDECvBdqAPkZOqFWdL2YHp/ZrmTbVAiTOYf6qrHYx67F4MN
   ra5d/p6VdMpuqmNxzkgqn9BVm8U3Gw/mb4MksPKmqqIp1+S2Zu523Lbba
   F9fPC/7S4Hj0xA9RHY0sF0z9uln8JP7llSdn3HsGoWrp1h77ZwjEKQQb5
   aAWs1sCxyvV6ArPpvxhGG+RbYB39olDWI59G8BjUcL9XEQZmYbWMp4EQV
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305326"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305326"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258816"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 33/38] linux-firmware: upgrade 20211216 -> 20220209
Date: Tue, 22 Feb 2022 23:07:34 +0800
Message-Id: 
 <af1ad9a159258b0e74f76130c4145a69ba596609.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162169

From: wangmy <wangmy@fujitsu.com>

License-Update:
Version of some driver files updated
Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a2a64082d2a4845bebe802afed2a65dac994043)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20211216.bb => linux-firmware_20220209.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
index 5f1b696092..fe51892eb4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
+                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
+SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
 
 inherit allarch
 
-- 
2.35.1


