Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E11FC4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:14 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783336"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783336"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:11 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786388"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/37] gstreamer1.0-omx: 1.18.4 -> 1.18.5
Date: Tue, 26 Oct 2021 23:57:41 +0800
Message-Id: 
 <0ede8a6546e54fd4e4c0ebe829e354a8bb4ae7c6.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157413

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 65ed3c4e6c0fbade647ec31a6a77f06ed4e97e7a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
index 7baccfe288..b2c1eb3ea0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043"
+SRC_URI[sha256sum] = "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.31.1


