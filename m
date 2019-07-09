Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED057DE3D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 02:04:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 19:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; d="scan'208";a="159308145"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 19:03:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 10:03:36 +0800
Message-Id: <1562637818-76884-4-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
References: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 4/6] gstreamer1.0-plugins-bad: depend on vulkan-loader now
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
X-List-Received-Date: Tue, 09 Jul 2019 02:04:46 -0000

Depend on vulkan-loader instead of vulkan which has been deprecated.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
index f676b1f..5af01a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
@@ -77,7 +77,7 @@ PACKAGECONFIG[ttml]            = "--enable-ttml,--disable-ttml,libxml2 pango cai
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
+PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan-loader"
 PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[webrtc]          = "--enable-webrtc,--disable-webrtc,libnice"
-- 
2.7.4


