Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DDE177829F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 30 Jun 2017 07:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,287,1496127600"; d="scan'208";a="105682517"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2017 07:56:16 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 595945800C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:16 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:18 +0300
Message-Id: <1498834581-12279-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/11] gstreamer1.0-omx: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:17 -0000

Upgrade to 1.12.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.1.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.1.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.1.bb
index dfeefa5..bf4432c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "cedb230f1c47d0cf4b575d70dff66ff2"
-SRC_URI[sha256sum] = "45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2"
+SRC_URI[md5sum] = "c9ae4cfc8e7479949ec75da034f85727"
+SRC_URI[sha256sum] = "13faf0eb679c37a01f64c47f23018c2d894fa0ff1c3b98d4b1d1c69a7b3ca183"
 
 S = "${WORKDIR}/gst-omx-${PV}"
-- 
2.4.0


