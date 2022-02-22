Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B07C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:33 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.13654.1645542512877800798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Diemaamc;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542512; x=1677078512;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=P2Y9gl6QggFL041RF0k1QSIPZvF+BjHrbRWL0XEZsn8=;
  b=DiemaamcVadnr+QlP4DGhJicG1eBQbJagpegf1ChNLWkMY3IOze46oc1
   sGYoi+bLIvsjH3J9iuY5EmfLtsI/z+UiaKxEDip45K/x/GJBxUHyP95q/
   FB4J5eO7HUNm6fxUHL1UzXDAChRj0j3t0I1YO+VbSw4wAmdNEq2Mofdox
   G05omK/GSmTkIyJQnH8wtXFmlsXLST+l5EEzaFXo2I3ophUk2+AwaPvq9
   orUUg72AIrbX/bPZRevcI/wp9QGDnbyRss41Hg+YRSJ3z5Qw5rJvNMegD
   aRzdVpR6Xls2AIyg/Pje3HixGvoa+vJmQrf6cV8BHyNYEvU1BWHsGStQ6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232344585"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="232344585"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258537"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/38] gstreamer1.0-omx: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:09 +0800
Message-Id: 
 <8198dff8855a4f23d349bdfbc9f85e156caf16fc.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162153

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.18.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.18.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.6.bb
index b2c1eb3ea0..a220d677aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42"
+SRC_URI[sha256sum] = "b5281c938e959fd2418e989cfb6065fdd9fe5f6f87ee86236c9427166e708163"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.35.1


