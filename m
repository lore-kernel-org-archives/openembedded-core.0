Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B614D755C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 01:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="1094557262"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2017 01:55:21 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 35EF96A4080;
	Tue, 14 Feb 2017 01:54:19 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:55:05 +0200
Message-Id: <84a2962afa5f78d5c60a12fc6da436bc61b95e41.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/11] libinput: Upgrade 1.6.0 -> 1.6.1
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:22 -0000

Small release with mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/wayland/{libinput_1.6.0.bb => libinput_1.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.6.0.bb => libinput_1.6.1.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.6.0.bb b/meta/recipes-graphics/wayland/libinput_1.6.1.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/libinput_1.6.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.6.1.bb
index d5b2cef..c8714f2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.6.1.bb
@@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "ed9b435d411462d24d88a87728f6c9d6"
-SRC_URI[sha256sum] = "b7534f518d735c643aedca2fb4694683dfddc8d0600cfb628c87a18e65255832"
+SRC_URI[md5sum] = "7e282344f8ed7ec5cf87ca9fc22674fb"
+SRC_URI[sha256sum] = "9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


