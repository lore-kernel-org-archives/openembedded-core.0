Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCD4C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:23 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.13730.1645542498672687251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eXeFCoXn;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542502; x=1677078502;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JRcZEuv02hWV9DMe+msCz+nZwwBsGgfoPHPPH11HPy4=;
  b=eXeFCoXn9MwGswD/3DTaqk5FVI9Lq+aTovIUVG6gl/ApyHLfAsq4mODM
   uNGn0qesoMnKg7Isaw/XrqxMCuEorqfozFgyDXYZyfu9VeknPh1OM21OR
   9omL4TVUqa1CpKdBtSauwrqfp9EpOrJCypaYclf26SIbYw9h7WntgfQoF
   7O6zmF/M18OaHc9fWJNlN8udD3ftEEJgiZ/1l2qGoRl8uwXglgXrDgTpq
   X/9+f8Rf1F6GkGOF3vw+acwR1DCugffjAFDFkU/HqzLr3CbRTAA3YF5ts
   TerLNdCM0+KNDTL9Keydlf6mHVD5Lzge7ooA5i1CYBUb0NbgoMJHP/B0P
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314960826"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="314960826"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258515"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/38] gstreamer1.0-vaapi: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:07 +0800
Message-Id: 
 <f29af25b097b3e86e08b2d841365fe9336764dd2.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162142

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...streamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.18.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.6.bb
index 9a68a3fadf..f3255e5554 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b"
+SRC_URI[sha256sum] = "ab6270f1e5e4546fbe6f5ea246d86ca3d196282eb863d46e6cdcc96f867449e0"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.35.1


