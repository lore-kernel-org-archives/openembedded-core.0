Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsC8k-0002b5-Sd
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:49:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jan 2013 04:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="242951816"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 07 Jan 2013 04:34:06 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 14:37:19 +0200
Message-Id: <1357562239-2200-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] scons: updated to 2.2.0
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
X-List-Received-Date: Mon, 07 Jan 2013 12:49:28 -0000

The license file was updated with a "2012" in the "Copyright" line,
nothing else changed in the license text.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...ons-native_2.1.0.bb => python-scons-native_2.2.0.bb} |    2 +-
 meta/recipes-devtools/python/python-scons_2.1.0.bb      |   15 ---------------
 meta/recipes-devtools/python/python-scons_2.2.0.bb      |   15 +++++++++++++++
 3 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.1.0.bb => python-scons-native_2.2.0.bb} (91%)
 delete mode 100644 meta/recipes-devtools/python/python-scons_2.1.0.bb
 create mode 100644 meta/recipes-devtools/python/python-scons_2.2.0.bb

diff --git a/meta/recipes-devtools/python/python-scons-native_2.1.0.bb b/meta/recipes-devtools/python/python-scons-native_2.2.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python-scons-native_2.1.0.bb
rename to meta/recipes-devtools/python/python-scons-native_2.2.0.bb
index ec3f2f4..701e0f7 100644
--- a/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
+++ b/meta/recipes-devtools/python/python-scons-native_2.2.0.bb
@@ -2,4 +2,4 @@ require python-scons_${PV}.bb
 inherit native pythonnative
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
-PR = "r2"
+PR = "r0"
diff --git a/meta/recipes-devtools/python/python-scons_2.1.0.bb b/meta/recipes-devtools/python/python-scons_2.1.0.bb
deleted file mode 100644
index 8c5aa07..0000000
--- a/meta/recipes-devtools/python/python-scons_2.1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "A Software Construction Tool"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ab8b65435c2e520ed18e67459f1f9bb9"
-SRCNAME = "scons"
-
-PR = "r2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "47daf989e303a045b76c11236df719df"
-SRC_URI[sha256sum] = "4139ed14f60dd2ebcd47c59984d14705636180eb27b3d1b2949489e514b1921d"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
diff --git a/meta/recipes-devtools/python/python-scons_2.2.0.bb b/meta/recipes-devtools/python/python-scons_2.2.0.bb
new file mode 100644
index 0000000..b796ae8
--- /dev/null
+++ b/meta/recipes-devtools/python/python-scons_2.2.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A Software Construction Tool"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61e6307bb15ee490a9ec01fd27022d7e"
+SRCNAME = "scons"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f737f474a02d08156c821bd2d4d4b632"
+SRC_URI[sha256sum] = "f7fcd11a7af7ec13d587a2f7cf14a92e3223eea64bf078454a9856ec0ab465b9"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
-- 
1.7.10.4



