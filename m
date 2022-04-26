Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A6AC4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.1700.1650941656313754698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IS3JKsmQ;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941657; x=1682477657;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Kg2gjhyI74UlXm/8p6Pu3kLV/dI1gti5HWshaaSERA4=;
  b=IS3JKsmQbn1cf0pHYVMNMsxYQhdrgTaaJeXwx04TOLgOn/AgzIJGVLWr
   A8l6E0RDU0+Bt2t0WBn+WJLvqFXYxCK/rO0P3CldwQoU6Qi1yTwZM+hzW
   OpD+jYUTMm97TTAb6xCm4w5oSIphiYtGb3QTpxixnvvgTkm9SMcAFQBbC
   tK17oB9s0AlwX1haONik/X9nLOoT6T+8O/i69osggDlw0+G8i+t5IUrgi
   BbLoTcR91vIT00cYEL++FVKDqdWhgAcPyFHASboHDkiKtlecwOQ/wHKTj
   4gf5w3nK+KPfWdAQvW3GdVoxAm4CuJv5kAcnhMdftunILsSoF0FcKx7BK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950967"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950967"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439854"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 4/7] linux-firmware: upgrade 20220310 -> 20220411
Date: Tue, 26 Apr 2022 10:54:02 +0800
Message-Id: 
 <9c9594ca55e498313d89f609af12ef3f507c7e69.1650941226.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650941226.git.anuj.mittal@intel.com>
References: <cover.1650941226.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 02:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164851

From: wangmy <wangmy@fujitsu.com>

License-Update:
    Version of driver files updated
    Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01684df3a51be476081ee21eb54c24fef00acb3f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20220310.bb => linux-firmware_20220411.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index fa0f906db0..c7d9e1126e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
+                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
+SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
 
 inherit allarch
 
-- 
2.35.1


