Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C046878BFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087732"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:12 +0800
Message-Id: <20180808071515.25581-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 08/11] gstreamer1.0-libav: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:29 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-libav_1.14.1.bb => gstreamer1.0-libav_1.14.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.14.1.bb => gstreamer1.0-libav_1.14.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
index 69be590..57f03e8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
            "
-SRC_URI[md5sum] = "d57b0052f6eccb8e6762def05995133c"
-SRC_URI[sha256sum] = "eff80a02d2f2fb9f34b67e9a26e9954d3218c7aa18e863f2a47805fa7066029d"
+SRC_URI[md5sum] = "da3d4655268bc6766a261065ca737590"
+SRC_URI[sha256sum] = "8a351c39c5cfc2bbd31ca434ec4a290a730a26efbdea962fdd8306dce5c576de"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.7.4


