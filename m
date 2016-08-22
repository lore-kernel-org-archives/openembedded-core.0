Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 48EC9762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984590"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:13 +0300
Message-Id: <02bdce73fffda984beeede88e836248d727127c8.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/9] libinput: Upgrade 1.3.0 -> 1.4.1
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:25 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/wayland/{libinput_1.3.0.bb => libinput_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.3.0.bb => libinput_1.4.1.bb} (84%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.3.0.bb b/meta/recipes-graphics/wayland/libinput_1.4.1.bb
similarity index 84%
rename from meta/recipes-graphics/wayland/libinput_1.3.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.4.1.bb
index 13724d5..c3905f3 100644
--- a/meta/recipes-graphics/wayland/libinput_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.4.1.bb
@@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "5f8bc2c746bfbc9454143f78e5b477a9"
-SRC_URI[sha256sum] = "998a75fb261d161efaa7da44411cdc9a32a953280e4ffc6322ca19f057d0c1ea"
+SRC_URI[md5sum] = "2e7ba577ed74d8d1baeb07dbd4fb912a"
+SRC_URI[sha256sum] = "26e7b3ab499358caba499705680ea7e5851af2bd37dc32f2be64181610d6392a"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


