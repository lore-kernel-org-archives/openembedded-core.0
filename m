Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 479FD6D205
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727702"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:19 +0800
Message-Id: <20181127085524.4826-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 09/14] gstreamer1.0-libav: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:42 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-libav_1.14.3.bb => gstreamer1.0-libav_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.14.3.bb => gstreamer1.0-libav_1.14.4.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.4.bb
index aaa217e7d4..5c9c372f04 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.4.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
            "
-SRC_URI[md5sum] = "e4a2ad307f101b53c7d417d4d0b36955"
-SRC_URI[sha256sum] = "9b03529bb45785ad1b6b1f4856c52a832ad5fc472285ce49174439e8015ab677"
+SRC_URI[md5sum] = "58342db11dbb201a66a62577dcf7bab5"
+SRC_URI[sha256sum] = "dfd78591901df7853eab7e56a86c34a1b03635da0d3d56b89aa577f1897865da"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.17.1


