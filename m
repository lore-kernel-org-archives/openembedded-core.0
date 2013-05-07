Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZe6N-0006wG-7U
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 11:23:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2013 02:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="333057266"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2013 02:04:24 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 12:08:02 +0300
Message-Id: <1367917682-23214-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-scons: upgraded to 2.3.0
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
X-List-Received-Date: Tue, 07 May 2013 09:23:16 -0000
X-List-Received-Date: Tue, 07 May 2013 09:23:16 -0000

"2013" was added in the 'Copyright' line in LICENSE.txt.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...ons-native_2.2.0.bb => python-scons-native_2.3.0.bb} |    2 +-
 meta/recipes-devtools/python/python-scons_2.2.0.bb      |   15 ---------------
 meta/recipes-devtools/python/python-scons_2.3.0.bb      |   14 ++++++++++++++
 3 files changed, 15 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.2.0.bb => python-scons-native_2.3.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python-scons_2.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python-scons_2.3.0.bb

diff --git a/meta/recipes-devtools/python/python-scons-native_2.2.0.bb b/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.2.0.bb
rename to meta/recipes-devtools/python/python-scons-native_2.3.0.bb
index 701e0f7..87450b6 100644
--- a/meta/recipes-devtools/python/python-scons-native_2.2.0.bb
+++ b/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
@@ -1,5 +1,5 @@
 require python-scons_${PV}.bb
 inherit native pythonnative
 DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
 PR = "r0"
+RDEPENDS_${PN} = ""
diff --git a/meta/recipes-devtools/python/python-scons_2.2.0.bb b/meta/recipes-devtools/python/python-scons_2.2.0.bb
deleted file mode 100644
index b796ae8..0000000
--- a/meta/recipes-devtools/python/python-scons_2.2.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "A Software Construction Tool"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61e6307bb15ee490a9ec01fd27022d7e"
-SRCNAME = "scons"
-
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "f737f474a02d08156c821bd2d4d4b632"
-SRC_URI[sha256sum] = "f7fcd11a7af7ec13d587a2f7cf14a92e3223eea64bf078454a9856ec0ab465b9"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
diff --git a/meta/recipes-devtools/python/python-scons_2.3.0.bb b/meta/recipes-devtools/python/python-scons_2.3.0.bb
new file mode 100644
index 0000000..1110f6e
--- /dev/null
+++ b/meta/recipes-devtools/python/python-scons_2.3.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A Software Construction Tool"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98e9a1e6029e715255c52032a1eba637"
+SRCNAME = "scons"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "083ce5624d6adcbdaf2526623f456ca9"
+SRC_URI[sha256sum] = "9442069999cf4b2caa94a5886ab4c2c71de1718ed5e9176c18e2b6dbca463b4b"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
-- 
1.7.10.4



