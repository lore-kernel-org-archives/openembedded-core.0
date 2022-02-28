Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA154C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HtqdZCBc;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056867; x=1677592867;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+ZTaLArL9y+0YMlZWcIlXlKz7iN0eZMpc/nFU5aoDyY=;
  b=HtqdZCBcx1Ewgqe9Tt826MlaTlsrAD6+68DBAYKQ/W2f5AdMkGYWTFLW
   b31IJPs0I1avC4DVaTkDPbTzrd0v331NqYOisu+JgBof3NIKV4pwuhMUs
   Iljv+sdCQ9LmDoYYIBE/Lfgw4GfArzejllFIe9SLmRNVpLV3juxoIShn2
   U0QLnk8yumtu/4Ev8Fc6UyFRQEigHYLq7IxQsIXwkC9XYtrkH5tkrmd85
   Hc2nwhqtV5Qu8mYGRKW/IlCC+qlzyWnnnABIiK/5dwv4XnmlH0dG3/p8q
   ksZqkZ3vTx9R7ykiV5AQJvxU6Q5Sj5552UNudjGHCG11n00zI5zOHlmL6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857152"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857152"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092460"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/39] gstreamer1.0-plugins-base: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:07 +0800
Message-Id: 
 <47f0d3779bbb2bc14a7c751cc81d028c981c9078.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162473

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-base_1.18.5.bb => gstreamer1.0-plugins-base_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.5.bb => gstreamer1.0-plugins-base_1.18.6.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.6.bb
index 4e57873577..4e7fc62ec7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
+SRC_URI[sha256sum] = "56a9ff2fe9e6603b9e658cf6897d412a173d2180829fe01e92568549c6bd0f5b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.35.1


