Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B1CC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:04 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=knejTc2z;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056863; x=1677592863;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9AW47YY8tm0tNjgteP9xdELfnUn0W5vFcjrjtLnVDQ0=;
  b=knejTc2zjfXA6Qmok1qC6/LYLo9gyJllJg86ID0UM8z7GCdGX2AyWvAj
   c1eyWoMswcZdbvYunRz08Fva9N7QEWAKqeTUGQRGb0xZDprdwRZXz6XiH
   ajqm3z0p830KhCxSgwLbsGYI9azNDwQPuCYnXR5feS99/WGNqH9h7T5do
   ngQFpiJhLO7LMX5cTVys5Mcu0zukmZ4PdJXej0UVypG4xI8XSRkzgQwn1
   FEVrAHphZBUza0nADcW2Rf7GfisHUz4R1ZaAI4Pg0fQyEAAtCz9MlepvD
   0rV9X6h87kb3ckFdito0LkInDgAtH3bChfpHyQ9V/jDQFdYRKpp9zpMyi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857103"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857103"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:03 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092420"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/39] gstreamer1.0-plugins-ugly: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 22:00:05 +0800
Message-Id: 
 <85a95f43ae2c6639899f5e378be81af738ff8709.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162471

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 09373e8c33cd0c585e146b55d9f7680832f2ad09)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-ugly_1.18.4.bb => gstreamer1.0-plugins-ugly_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.4.bb => gstreamer1.0-plugins-ugly_1.18.5.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
index 932fa7f6fb..eae0c75d15 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "218df0ce0d31e8ca9cdeb01a3b0c573172cc9c21bb3d41811c7820145623d13c"
+SRC_URI[sha256sum] = "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.35.1


