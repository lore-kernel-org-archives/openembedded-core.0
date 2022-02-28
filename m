Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6060C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CucnUOSI;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056856; x=1677592856;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lSU9DZQOYHZeUjYP2e7lgPzO8SiidVg5IkbvuDwR2bY=;
  b=CucnUOSI4qIgckYVmicbjL5POyNGgQIq3lNWtdRePMClnJemndvrecjo
   4Nj8CUsjU110Dnsv3jltHfBIfTM9YUd1sIrlgObD+CbXp5pbtZ6ktaK1h
   zAUvfu//IZmBI7jfmeQoFU66uOLbUgLWRaxK4v1a3+XWVI5+grpUy5o84
   vRgbzyTN5vKfLnutW32DWjgxCT9deiLOP6XeWRNxwHL30pBE+LouRgHLs
   imyjNem3zwLHdidmuqt3innAMgCiRShosM3GRGD5SjocNF4PdNjp9b71/
   Dcco0PfrjOXnHHll4G9lNC90/lgKIWLmVeip/2jQTWlZ7sNAYje9DoF+b
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857036"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857036"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092317"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/39] gstreamer1.0-vaapi: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 22:00:00 +0800
Message-Id: 
 <7ecce4b6a68f3d1a1bbf4e2cb763531e48d50da1.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162466

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a46b9209b5f2f45b4206a7819e00c48795885093)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...streamer1.0-vaapi_1.18.4.bb => gstreamer1.0-vaapi_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.4.bb => gstreamer1.0-vaapi_1.18.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
index a268d79541..23ed535c8b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "92db98af86f3150d429c9ab17e88d2364f9c07a140c8f445ed739e8f10252aea"
+SRC_URI[sha256sum] = "4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.35.1


