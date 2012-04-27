Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNevC-0002an-P5
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 08:44:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Apr 2012 23:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136033476"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2012 23:35:14 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 14:34:25 +0800
Message-Id: <73c8a145ecf05cacf2bd6fc47feb8a573b521663.1335508325.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <f640dfb6acb1d703fefae61226547773f82a2a07.1335508325.git.lianhao.lu@intel.com>
References: <f640dfb6acb1d703fefae61226547773f82a2a07.1335508325.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1335508325.git.lianhao.lu@intel.com>
References: <cover.1335508325.git.lianhao.lu@intel.com>
Subject: [PATCH V2 7/7] xf86-input-vmmouse: use base_libdir for udev rules.
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
X-List-Received-Date: Fri, 27 Apr 2012 06:44:52 -0000

Use the base_libdir to set the udev rules directory.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../xorg-driver/xf86-input-vmmouse_12.8.0.bb       |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb
index 150a9ed..e626a67 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb
@@ -1,7 +1,7 @@
 require xorg-driver-input.inc
 
 DESCRIPTION = "X.Org X server -- VMWare mouse input driver"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "15fce165117706cd5e774a8aa58122ce"
 SRC_URI[sha256sum] = "a8a6ec0b567c48c130ccb830e15dfc2b201831841de0c2cc56bd87256d2d869a"
@@ -12,6 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=622841c068a9d7625fbfe7acffb1a8fc"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
+EXTRA_OECONF = "\
+		--with-udev-rules-dir=${base_libdir}/udev/rules.d \
+		"
+
 do_install_append () {
 	# We don't care about hal
 	rm -rf ${D}${datadir}/hal/
-- 
1.7.0.4



