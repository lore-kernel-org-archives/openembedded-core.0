Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF9267016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144621"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:27 +0300
Message-Id: <ae9648c995c00cccebcbbabbf6f85d8b8a74f499.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/13] libinput: Upgrade 1.1.4 -> 1.3.0
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
X-List-Received-Date: Thu, 12 May 2016 07:21:05 -0000

Add PACKAGECONFIG for libwacom (which we currently do not
have in oe-core) as the default is --enable-libwacom.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland/{libinput_1.1.4.bb => libinput_1.3.0.bb}                 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.1.4.bb => libinput_1.3.0.bb} (75%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.1.4.bb b/meta/recipes-graphics/wayland/libinput_1.3.0.bb
similarity index 75%
rename from meta/recipes-graphics/wayland/libinput_1.1.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.3.0.bb
index 4167679..13724d5 100644
--- a/meta/recipes-graphics/wayland/libinput_1.1.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.3.0.bb
@@ -10,13 +10,14 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "0945318141c1a9f52857bbf65d175f32"
-SRC_URI[sha256sum] = "302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5fab5b6"
+SRC_URI[md5sum] = "5f8bc2c746bfbc9454143f78e5b477a9"
+SRC_URI[sha256sum] = "998a75fb261d161efaa7da44411cdc9a32a953280e4ffc6322ca19f057d0c1ea"
 
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[libwacom] = "--enable-libwacom,--disable-libwacom,libwacom"
 PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 
 FILES_${PN} += "${libdir}/udev/"
-- 
2.1.4


