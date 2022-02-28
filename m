Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FC8C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19882.1646056851264633887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Nk3amCu8;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056852; x=1677592852;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W5LQy4nGY4Iwd++BYzjAX+bRwsZKD+PbBqGER4bb+fw=;
  b=Nk3amCu8fATpDPeVRXvVlLyMf3HExPF7DxmHEkCL6CFyEteFl0QxY4AJ
   gJ6RNIUR1RfjjL/GX/gsNdR0CmHC7fXj4WJsuer/y0p7VWq2GQrqnRN74
   oERBgVmUB8RcTQnyQsd1p0B1X/u0E5UbDH/8Uk0YWbWVUHQ8noY8O+f1o
   6IZsfJuqP4a1aTk2XW8LirGSgcur/0yKSHKw2aY/tHsb0TRf+zgbeG2C5
   zaHtMxER4vruBjsoomd63bvhqCMtoGymvBHL7r7mjDkHOgrJam8M5Ue5W
   JJuhGOKjdlb38rmrpFougfOuY+xpK+0fNIIkAbQdwGMJElO2zngvgggFr
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232856983"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232856983"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092211"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/39] gstreamer1.0-plugins-base: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 21:59:55 +0800
Message-Id: 
 <89fd2e074eefab0dda55816944169eb56a975a20.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162461

From: Jose Quaresma <quaresma.jose@gmail.com>

Drop backport patches:
    * 4ef5c91697a141fea7317aff7f0f28e5a861db99.patch

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit de0ee4323a19a27b6bcef7cc791d0373c311ef22)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-base_1.18.4.bb => gstreamer1.0-plugins-base_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.4.bb => gstreamer1.0-plugins-base_1.18.5.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
index 728a99e08b..4e57873577 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323"
+SRC_URI[sha256sum] = "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.35.1


