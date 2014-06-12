Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B211F66010
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147349"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:26 -0700
Message-Id: <97e4ffe1ba0564a850d320b0a66a803c6427a2b6.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 07/10] pointer: convert to conf-files and remove
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf-files}/pointercal                         |   0
 .../conf-files}/qemuarm/pointercal                 |   0
 .../conf-files}/qemuarmv6/pointercal               |   0
 .../conf-files}/qemuarmv7/pointercal               |   0
 .../conf-files}/qemumips/pointercal                |   0
 .../conf-files}/qemuppc/pointercal                 | Bin
 .../conf-files}/qemux86-64/pointercal              |   0
 .../conf-files}/qemux86/pointercal                 |   0
 meta/recipes-bsp/pointercal/pointercal/COPYING     |   2 --
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |  22 ---------------------
 10 files changed, 24 deletions(-)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuarm/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuarmv6/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuarmv7/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemumips/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuppc/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemux86-64/pointercal (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemux86/pointercal (100%)
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/COPYING
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal_0.0.bb

diff --git a/meta/recipes-bsp/pointercal/pointercal/pointercal b/meta/recipes-bsp/conf-files/conf-files/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemuarm/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemuarm/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemuarmv6/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemuarmv6/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemuarmv7/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemuarmv7/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemumips/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemumips/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemuppc/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemuppc/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemux86-64/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemux86-64/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal b/meta/recipes-bsp/conf-files/conf-files/qemux86/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
rename to meta/recipes-bsp/conf-files/conf-files/qemux86/pointercal
diff --git a/meta/recipes-bsp/pointercal/pointercal/COPYING b/meta/recipes-bsp/pointercal/pointercal/COPYING
deleted file mode 100644
index 63f5293..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/COPYING
+++ /dev/null
@@ -1,2 +0,0 @@
-This is a blank COPYING file, and should be filled in by original author in future.
-
diff --git a/meta/recipes-bsp/pointercal/pointercal_0.0.bb b/meta/recipes-bsp/pointercal/pointercal_0.0.bb
deleted file mode 100644
index 5029c4a..0000000
--- a/meta/recipes-bsp/pointercal/pointercal_0.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Touchscreen calibration data"
-SECTION = "base"
-PR = "r11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
-
-SRC_URI = "file://pointercal \
-           file://COPYING"
-
-S = "${WORKDIR}"
-
-do_install() {
-	# Only install file if it has a contents
-	if [ -s ${S}/pointercal ]; then
-	        install -d ${D}${sysconfdir}/
-	        install -m 0644 ${S}/pointercal ${D}${sysconfdir}/
-	fi
-}
-
-ALLOW_EMPTY_${PN} = "1"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-INHIBIT_DEFAULT_DEPS = "1"
\ No newline at end of file
-- 
1.8.3.2


