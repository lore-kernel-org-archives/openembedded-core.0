Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2B477CFB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:36:59 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 01 Jun 2017 03:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="109594801"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2017 03:37:00 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6E25E5800D3;
	Thu,  1 Jun 2017 03:36:59 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:47 +0300
Message-Id: <ce44766152188d41f983eb5aa94fe0dcb4dd2956.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/10] libinput: Upgrade 1.6.1 -> 1.7.2
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
X-List-Received-Date: Thu, 01 Jun 2017 10:36:59 -0000

Includes a major feature releas, release notes for that one:
https://lists.freedesktop.org/archives/wayland-devel/2017-March/033531.html

inherit lib_package to get the binaries into libinput-bin package.
This changes the final library package name so add
RPROVIDES/RREPLACES/RCONFLICTS.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland/{libinput_1.6.1.bb => libinput_1.7.2.bb}           | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.2.bb} (74%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.6.1.bb b/meta/recipes-graphics/wayland/libinput_1.7.2.bb
similarity index 74%
rename from meta/recipes-graphics/wayland/libinput_1.6.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.7.2.bb
index c8714f2..f4693b6 100644
--- a/meta/recipes-graphics/wayland/libinput_1.6.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.7.2.bb
@@ -10,10 +10,10 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "7e282344f8ed7ec5cf87ca9fc22674fb"
-SRC_URI[sha256sum] = "9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8"
+SRC_URI[md5sum] = "d138d62c528fbf9aba300a97bae453cb"
+SRC_URI[sha256sum] = "0b1e5a6c106ccc609ccececd9e33e6b27c8b01fc7457ddb4c1dd266e780d6bc2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
@@ -23,3 +23,7 @@ PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
 EXTRA_OECONF += "--with-udev-dir=${UDEVDIR}"
+
+RPROVIDES_${PN} = "libinput"
+RREPLACES_${PN} = "libinput"
+RCONFLICTS_${PN} = "libinput"
-- 
2.1.4


