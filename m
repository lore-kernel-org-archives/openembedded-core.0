Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCB0C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EmsTi2HP;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056854; x=1677592854;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tcmIXkHR9LQzaakf2eBi1sk66d/khJVHAHjCqRxYg/w=;
  b=EmsTi2HPqQ4+cvyQ0ctKKmlgUoJB/2hr/nDDtCov/phkklMBpTuSG+9R
   8f/ZGCbFWSEm+lJdwO+pxQUuctikoGa9ZB8eNKYPuDhdu2MD+Agzhg/J/
   VP1E26iHVCu4M47ffNGFrzutNnhEWnikmj7jfFDOjpxTOJI85kNw62+BK
   0ZZ0elQH62poEvMiwRWnDDZfqPkSgjKQJYMzsZI2P5Lz1qeF0uctUCFfU
   M48+DlvXO4rMeiKwBEwKgbB3EnePYcyuZ9ZTYLrrnkyHSb3Ih0kO+Uuzq
   K+cg89TeKe2o9SzPcS52ApCjNC48G/kU5lp5u18mtWfDziGOH1isIFQbY
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857011"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857011"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092275"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:50 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/39] gstreamer1.0-rtsp-server: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 21:59:58 +0800
Message-Id: 
 <802c2b2fc83f05d4b6f38bedabcb51f2f18e7a36.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162464

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 809db373816ed896048f551275589bac0f04ff92)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rtsp-server_1.18.4.bb => gstreamer1.0-rtsp-server_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.4.bb => gstreamer1.0-rtsp-server_1.18.5.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
index f7bfe98985..50426ad46d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a46bb8de40b971a048580279d2660e616796f871ad3ed00c8a95fe4d273a6c94"
+SRC_URI[sha256sum] = "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.35.1


