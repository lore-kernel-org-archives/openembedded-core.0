Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CE9C43217
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.13884.1645542499491252734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LD3Ilq8r;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542500; x=1677078500;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bncBQkAXw1GlbvHiSRhXBrSDP6ZnXmxxjjxfhYNnMXc=;
  b=LD3Ilq8rIGNkuQw/xIqOdLxOsxJ0P5Zqw0PrxtIe893v3H2UNNBlxSWy
   G2pzmAP7sR18naJw9EzkDzeMz01ahUo7brO/ZdBwXEnMGv9Jbay0YUTXM
   pACeSnRl4LRVnswfQ+7nutpE4QaNtdfEAA/TxiqQavgGECYeohfs3YhV5
   uLtSvLyYU+1qEeL22U28iJG/JE/fTwGy+BG2e9Hqo363thAH5EDdGac8s
   EQIm/bXbVnaqpgOuhnlZ6+Xw2I/LDMKcDhlhdJAoRquXYHQFkvbpCwfdX
   kIEQ46oM6uzj9S6VyEi5CNoPeYdaQgE1FiWQW7xBmrLu77cET0Dxg6t/O
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314960799"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="314960799"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:07:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258487"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:07:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/38] gstreamer1.0-plugins-good: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:04 +0800
Message-Id: 
 <94acc0b188020b26460eb2575bd23190a6a1315c.1645536711.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/162139

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
index ade935df9e..a43b8095c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b"
+SRC_URI[sha256sum] = "26723ac01fcb360ade1f41d168c7c322d8af4ceb7e55c8c12ed2690d06a76eed"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.35.1


