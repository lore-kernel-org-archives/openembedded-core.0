Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A683C43217
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.1700.1650941656313754698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=S2D2l4wG;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941660; x=1682477660;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EL3fYsUJoNCIUOxRSX7pm0R6GVF2RxAwk4SP6ZI5wSo=;
  b=S2D2l4wGpbiTkAMsxjpXxQbAo2QwvvxVpbvhV6hLLrey4PcgEBno8ikk
   +9S+iedH7GLyJvfeyt0MlKMwwoVOIYPFnmIx8LE81wol0JrHc1SFnxoxE
   DIEpQABSU5j5zXdtal9vabxzHU5MzPNhzFL8xzI/PgfwfJ4ZfDAFlmNjq
   94IUnaZ/ZWQS/gu4gJuQWxC4aBv9LlaZhDS6nUrCl/6uawm98iDnNUZyL
   Nq+CiS6U0GEoLq250zsNwGnVq/Pb4QBWZ9M1ro2z2NLSGRWopnQsDSRIm
   bMMSZTuslf5D1xnuatoA9RzRR0LnXCtftDaxvYrm+uT+BB0VyvJeJyFYe
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950977"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950977"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439881"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 6/7] linux-firmware: correct license for ar3k
 firmware
Date: Tue, 26 Apr 2022 10:54:04 +0800
Message-Id: 
 <c246ed4215821d145c86633df7097047855621c5.1650941226.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164853

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

According to the WHENCE file, some a3k firmware files are licensed
under the special ar3k license, while others are licensed under the more
generic Atheros license. Document this by adding extending the
LICENSE:${PN}-ar3k and depending on both of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8e651814af706285d64b532095fcd6f5f02629ba)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index c7d9e1126e..4a443d14d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -352,7 +352,7 @@ FILES:${PN}-carl9170 = " \
 RDEPENDS:${PN}-carl9170 += "${PN}-gplv2-license"
 
 # For QualCommAthos
-LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
+LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
@@ -376,7 +376,7 @@ FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
 
-RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license"
+RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
-- 
2.35.1


