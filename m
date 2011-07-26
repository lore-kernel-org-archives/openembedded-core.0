Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QlgtF-0001NR-Fh
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:37:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 05:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,269,1309762800"; d="scan'208";a="34603587"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 05:33:21 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 20:30:54 +0800
Message-Id: <73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311682779.git.edwin.zhai@intel.com>
References: <cover.1311682779.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1311682779.git.edwin.zhai@intel.com>
References: <cover.1311682779.git.edwin.zhai@intel.com>
Subject: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 12:37:38 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
new file mode 100644
index 0000000..5a868f7
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+
+LICENSE = "MIT/X11"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d9a6926aaad6b8f38bb4f995fe088466\
+                    file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
+
+DEPENDS = "virtual/libx11 libxi"
+
+inherit autotools
+
+RDEPENDS_${PN} = "xinput"
+
+SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz"
+SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
+SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
+
+S = "${WORKDIR}/xinput_calibrator-${PV}"
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
+}
-- 
1.7.1



