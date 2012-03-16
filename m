Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LO6-0001xo-4C
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:51:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139660296"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:42:33 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:33 +0800
Message-Id: <7b01528de6330257d3be0fd40b8db9e3c3828656.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 36/60] pixman: upgrade to 0.25.2
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
X-List-Received-Date: Fri, 16 Mar 2012 00:51:22 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 .../{pixman_0.24.4.bb => pixman_0.25.2.bb}         |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.24.4.bb => pixman_0.25.2.bb} (84%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index eef29e1..35b055e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4626,7 +4626,7 @@ RECIPE_MAINTAINER_pn-libxkbfile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-pixman = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pixman = "not done"
-RECIPE_LATEST_VERSION_pn-pixman = "0.24.2"
+RECIPE_LATEST_VERSION_pn-pixman = "0.24.4"
 RECIPE_NO_OF_PATCHES_pn-pixman = "0"
 RECIPE_INTEL_SECTION_pn-pixman = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "2 months"
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
index 1382bb0..4cff6f9 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
@@ -18,5 +18,5 @@ PE = "1"
 
 EXTRA_OECONF="--disable-gtk"
 
-SRC_URI[md5sum] = "89eb7db8853681bbcea626b161de0488"
-SRC_URI[sha256sum] = "5f4b384aa39e82a582bdc8835e2e81b28176db851dd1f7ff32d682d026a23bb5"
+SRC_URI[md5sum] = "8d5722f6f61db50034303947a40f5e7b"
+SRC_URI[sha256sum] = "06d83ce5a5f2f8ab3761e88a2de1576b6596bb436190166a242b9d75a68bc1d8"
-- 
1.7.6



