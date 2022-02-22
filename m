Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B18C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.13730.1645542498672687251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iGif+Og/;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542501; x=1677078501;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Tps8TY1swgXUvRF9E0hSCNzCEGYNahawD3aEm53uuY8=;
  b=iGif+Og/gdiFlatTuNXx2jE18D/dCMNv/XSts6YOjPUsSYLiqNdrKTOJ
   o1dy6yeu6zki8w/TIRtUmGPec2WzyV9xNwz0bVLd9n/XumEWs6uFTqbjp
   oEecWs3Bi+//ML0S/O0PbvAVle+/0csXr7IxEbd4tpuk3lW7XJ4NID5rM
   Z/uGj25tUxx+U6SW0PUdTHdmSxhc6c8E9huBDoLun9G2+Q8UI8sS9HK/V
   fRUpipaLemc11oqS83tQ4fsl7f+Sjg+8lcwsGg1xN8Al+ddVoD/PQoaYE
   AxVMRvw237ey48ZiVyLCLmlBYEnACg5ZeQEf84UF8lba+AMQw+nc6LSQR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314960817"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="314960817"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258504"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:07:59 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/38] gstreamer1.0-plugins-ugly: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:06 +0800
Message-Id: 
 <6dce072fc11524f7c7baeb55f32c051b5268cf34.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162141

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
index 9777aaee19..5b31627141 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
+SRC_URI[sha256sum] = "4969c409cb6a88317d2108b8577108e18623b2333d7b587ae3f39459c70e3a7f"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.35.1


