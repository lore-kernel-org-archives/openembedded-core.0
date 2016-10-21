Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74426719CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256671"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:21:59 +0300
Message-Id: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/15] libinput: Upgrade 1.4.1 -> 1.5.0
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:16 -0000

A large part of this release cycle was internal cleanups and
improvements to the test suite, only few new features were added.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/wayland/{libinput_1.4.1.bb => libinput_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.4.1.bb => libinput_1.5.0.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.4.1.bb b/meta/recipes-graphics/wayland/libinput_1.5.0.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/libinput_1.4.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.5.0.bb
index 3580392..3c07b0b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.4.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.5.0.bb
@@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "2e7ba577ed74d8d1baeb07dbd4fb912a"
-SRC_URI[sha256sum] = "26e7b3ab499358caba499705680ea7e5851af2bd37dc32f2be64181610d6392a"
+SRC_URI[md5sum] = "26030dae25f1ac584b0e428c90473339"
+SRC_URI[sha256sum] = "5a96559385ecfaa30f9e72ea89eb8ebbc97caf68e458f451f4ed62315311081c"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


