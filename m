Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71894C43219
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.31506.1653878169199906147
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kk4UpOHa;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878169; x=1685414169;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vW8/45FZllvw5u2/OWkaZ9VE6xThkG6gmN3eDFIZOi4=;
  b=kk4UpOHaIPTBe5AJ3bX2SgMmKbzNoddqY88hxOTp5GUWufXazDlGwx1Y
   F+bRpLJYDPb7KOmfeuLvUCduhvAJ/FcSW38jkQuFAgPfZsTTBZL9yFanQ
   zJtJ+fCaZobAmjl43eVLLaxPzGCZ1ctlVT1nQuWhr/HmmrKNLkL73Jaqz
   MfaMU/uUFi2FMVVo35Fjhf+onIBnXAQKl1Ou+AXGAwj+Gs8L82QTP8B0J
   RwS1b+D7EGhuoAys2Plvjxvvxm+B+QZ+tSNOc2YYGv6BHinCwxTeSLazA
   NPQ0WipwqWmQexJy997ivoxZJZIlFAzqR5F/GrZw4o0bRxo7Me9Df+54I
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876409"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876409"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313490"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/12] linux-firmware: upgrade 20220411 -> 20220509
Date: Mon, 30 May 2022 10:35:51 +0800
Message-Id: 
 <847a200fb0d2107732430da61b50c41c64493251.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166245

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85b1fef733683be09a1efdb2d8b8ffe543053ace)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20220411.bb => linux-firmware_20220509.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 4a443d14d1..ed6cdb5c16 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
+                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
+SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
 
-- 
2.35.3


