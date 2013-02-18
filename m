Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U7QQF-0007jk-PR
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:06:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Feb 2013 04:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="292587498"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2013 04:50:10 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:50:29 +0200
Message-Id: <1361191830-19106-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1361191830-19106-1-git-send-email-cristian.iorga@intel.com>
References: <1361191830-19106-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/2] sbc: SBC audio codec
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 13:06:24 -0000

recipe added;
needed by pulseaudio.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/sbc/sbc_1.0.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-multimedia/sbc/sbc_1.0.bb

diff --git a/meta/recipes-multimedia/sbc/sbc_1.0.bb b/meta/recipes-multimedia/sbc/sbc_1.0.bb
new file mode 100644
index 0000000..21ea9d8
--- /dev/null
+++ b/meta/recipes-multimedia/sbc/sbc_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "SBC Audio Codec"
+DESCRIPTION = "Bluetooth low-complexity, subband codec (SBC) library."
+HOMEPAGE = "https://www.bluez.org"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://sbc/sbc.h;beginline=1;endline=25;md5=0a7e4f502980cc3ee0541341fa2db47e"
+
+PR = "r0"
+
+DEPENDS = "libsndfile1"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${PN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "aa2bc39c4a09aade064efea4bbbc4b2d"
+SRC_URI[sha256sum] = "bf970aa21226c594bb04ba3d949770c8fd91dc8f953556305f20c1016b16b882"
+
+inherit autotools
-- 
1.7.10.4



