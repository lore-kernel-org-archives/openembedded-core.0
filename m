Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D182571CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 01:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="777844875"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2016 01:37:45 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9573E6A4006;
	Wed, 26 Oct 2016 01:37:09 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:24 +0300
Message-Id: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 01/16] libinput: Upgrade 1.4.1 -> 1.5.0
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:51 -0000

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


