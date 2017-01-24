Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1D977250
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 24 Jan 2017 02:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="56570541"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 24 Jan 2017 02:42:28 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A16396A4006;
	Tue, 24 Jan 2017 02:41:31 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:17 +0200
Message-Id: <512ccdb5dee4b7e40baac2716db59f7165ef4f81.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/9] libinput: Upgrade 1.5.0 -> 1.6.0
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:29 -0000

Bug fixes, new quirks and touchpad acceleration improvements.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/wayland/{libinput_1.5.0.bb => libinput_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.5.0.bb => libinput_1.6.0.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.5.0.bb b/meta/recipes-graphics/wayland/libinput_1.6.0.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/libinput_1.5.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.6.0.bb
index 3c07b0b..d5b2cef 100644
--- a/meta/recipes-graphics/wayland/libinput_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.6.0.bb
@@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "26030dae25f1ac584b0e428c90473339"
-SRC_URI[sha256sum] = "5a96559385ecfaa30f9e72ea89eb8ebbc97caf68e458f451f4ed62315311081c"
+SRC_URI[md5sum] = "ed9b435d411462d24d88a87728f6c9d6"
+SRC_URI[sha256sum] = "b7534f518d735c643aedca2fb4694683dfddc8d0600cfb628c87a18e65255832"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


