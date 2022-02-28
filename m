Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA564C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aeZBEPLs;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056876; x=1677592876;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=10mQerKbyuYObAbqYuZnKkoYBofwG9x1D4pqL9gcKjk=;
  b=aeZBEPLsPKR0X3RRLrx/hpaw4K+4L46Snfezo32HGe6QE3GlzDfno9WZ
   /6ehSvB8dW/kyD/zJfThuijvKatmAxpKPdM0Ih39wkJ/nPSuq3KKiAnJc
   EMbZeJ0jcMquYHPuPg2xo6Z7f+my+dHLGL4VtSu3ErywdxZziMHUh90Ll
   3O37XxAGnju3ftecvOp4Y4YHftJDEKVHVit6sScl80Sybx57MHAAyNC80
   uD1NgTYYceUOpMXFBE2UsBOdYvGnhGTJKYzwD98l7eMApUduKoLvtpVUf
   9BRS25CYD81em8ilqKMSPC3V7jGcHoZyp8mCVRGXPbzkjqRH+Omp5W4sQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857240"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857240"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092540"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/39] gstreamer1.0-vaapi: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:11 +0800
Message-Id: 
 <5697581a53f0e30a9726b5fa6cc2f09a04be053b.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162477

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
index 23ed535c8b..a604b5ebce 100644
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


