Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2D04062132
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:47:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2016 08:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; d="scan'208";a="1053176061"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2016 08:47:06 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 77F9A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:46:43 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 18:46:51 +0300
Message-Id: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] gstreamer1.0-omx: provide RECIPE_NO_UPDATE_REASON
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 15:47:09 -0000

Newer version of gstreamer1.0-omx(1.9.x) requires gstreamer1.0 >= 1.9.x

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
index 74358a7..40c4858 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "d24e8c0153c35dfefee3e26b1c2c35f8"
 SRC_URI[sha256sum] = "0b4874961e6488ad9e5808114bd486ea981c540907262caab1419355fd82d745"
 
 S = "${WORKDIR}/gst-omx-${PV}"
+
+RECIPE_NO_UPDATE_REASON = "Version 1.9.2 requires gstreamer-1.0 >= 1.9.2"
-- 
2.4.0


