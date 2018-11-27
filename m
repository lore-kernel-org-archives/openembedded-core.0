Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CFCD06D24B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727716"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:22 +0800
Message-Id: <20181127085524.4826-12-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 12/14] gstreamer1.0-omx: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:46 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{gstreamer1.0-omx_1.14.3.bb => gstreamer1.0-omx_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.3.bb => gstreamer1.0-omx_1.14.4.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
index a3b4902051..39ca1e3854 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d5e4c0650a4de8f6a6301b7070367587"
-SRC_URI[sha256sum] = "6ba7dc5caabce092ea645b5c6de1a82d12ee086d18f692a8f31cbc359b708cb1"
+SRC_URI[md5sum] = "81e67ea03be607b7c548ce911598d754"
+SRC_URI[sha256sum] = "969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.1


