Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F06A072F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:39:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 01:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="53864445"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2017 01:39:25 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 8147D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:39:23 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 11:41:14 +0200
Message-Id: <1488274875-10233-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] gstreamer1.0-omx_1.2.0: remove recipe
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
X-List-Received-Date: Tue, 28 Feb 2017 09:39:25 -0000

Removing this recipe since we have the latest gstreamer1.0-omx_1.10.4
in place.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
deleted file mode 100644
index 3b4580f..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require gstreamer1.0-omx.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "d24e8c0153c35dfefee3e26b1c2c35f8"
-SRC_URI[sha256sum] = "0b4874961e6488ad9e5808114bd486ea981c540907262caab1419355fd82d745"
-
-S = "${WORKDIR}/gst-omx-${PV}"
-- 
2.4.0


