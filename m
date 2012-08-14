Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCF-0000Xj-FB
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181140"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:12:55 +0300
Message-Id: <f874764a988ad65fa72e75fc8ff2b56797b384da.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 08/64] patch: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/patch/patch.inc      |    7 +------
 meta/recipes-devtools/patch/patch_2.5.9.bb |    2 +-
 meta/recipes-devtools/patch/patch_2.6.1.bb |    2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 21c06c6..332b97a 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -9,10 +9,5 @@ S = "${WORKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
 
-do_install_append () {
-        mv ${D}${bindir}/patch ${D}${bindir}/patch.${BPN}
-}
-
-ALTERNATIVE_NAME = "patch"
-ALTERNATIVE_PATH = "patch.${BPN}"
+ALTERNATIVE_${PN} = "patch"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-devtools/patch/patch_2.5.9.bb b/meta/recipes-devtools/patch/patch_2.5.9.bb
index 4d27cbd..c29b240 100644
--- a/meta/recipes-devtools/patch/patch_2.5.9.bb
+++ b/meta/recipes-devtools/patch/patch_2.5.9.bb
@@ -5,7 +5,7 @@ SRC_URI += " file://debian.patch \
 	   file://install.patch \
            file://unified-reject-files.diff \
            file://global-reject-file.diff "
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI[md5sum] = "dacfb618082f8d3a2194601193cf8716"
diff --git a/meta/recipes-devtools/patch/patch_2.6.1.bb b/meta/recipes-devtools/patch/patch_2.6.1.bb
index fce3656..5055747 100644
--- a/meta/recipes-devtools/patch/patch_2.6.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.6.1.bb
@@ -1,7 +1,7 @@
 require patch.inc
 LICENSE = "GPLv3"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += " file://global-reject-file.diff "
 
-- 
1.7.7.6



