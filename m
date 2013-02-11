Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U53BW-0001qA-Fl
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 00:53:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2013 15:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,646,1355126400"; d="scan'208";a="285917432"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.192])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2013 15:37:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 15:37:18 -0800
Message-Id: <1360625838-5453-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] tzcode/tzdata: Update to 2012j
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
X-List-Received-Date: Mon, 11 Feb 2013 23:53:20 -0000
X-List-Received-Date: Mon, 11 Feb 2013 23:53:20 -0000

Readme update to indicate status of project and authorship

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/tzcode/tzcode-native_2011i.bb | 25 ----------------------
 .../recipes-extended/tzcode/tzcode-native_2012j.bb | 24 +++++++++++++++++++++
 .../tzdata/{tzdata_2012d.bb => tzdata_2012j.bb}    |  4 ++--
 3 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2011i.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2012j.bb
 rename meta/recipes-extended/tzdata/{tzdata_2012d.bb => tzdata_2012j.bb} (98%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011i.bb b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
deleted file mode 100644
index a23a5d5..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD"
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
-
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2011n.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "cf7f4335b7c8682899fa2814e711c1b2"
-SRC_URI[tzcode.sha256sum] = "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
-SRC_URI[tzdata.md5sum] = "20dbfb28efa008ddbf6dd34601ea40fa"
-SRC_URI[tzdata.sha256sum] = "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bdea1d2385e38cd"
-
-
-S = "${WORKDIR}"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb b/meta/recipes-extended/tzcode/tzcode-native_2012j.bb
new file mode 100644
index 0000000..47f9f2a
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2012j.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d27"
+
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2012j.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "868b5d0dbf0e115ae4eb39a932ad0c4c"
+SRC_URI[tzcode.sha256sum] = "ee4361b3b4ae201a270857c84d0f063c2a2191b3e4cd7414ea4622bb8bae9a82"
+RC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
+SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
+
+S = "${WORKDIR}"
+
+inherit native
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012j.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2012d.bb
rename to meta/recipes-extended/tzdata/tzdata_2012j.bb
index 4811072..25220cc 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012j.bb
@@ -16,8 +16,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "fc0f54b76054800394f8c366ea1eeea7"
-SRC_URI[tzdata.sha256sum] = "46c0e92a7aa89c3cfe571b585ceb6958bb444604aea3e09587f2cbe474c95575"
+SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
+SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
 
 S = "${WORKDIR}"
 
-- 
1.8.0.2



