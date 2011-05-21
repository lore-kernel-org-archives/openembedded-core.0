Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNr7i-0000fO-QY
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 20:42:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2011 11:39:04 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2011 11:39:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2011 11:37:58 -0700
Message-Id: <010c68e069913963e3e9f36dcf058410827870c5.1306002889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
Subject: [PATCH 2/8] update-alternatives-dpkg: Update to dpkg base 1.15.8.7
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
X-List-Received-Date: Sat, 21 May 2011 18:42:03 -0000

[YOCTO #1062]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../update-alternatives-dpkg.inc                   |    6 ++++--
 .../update-alternatives-dpkg_1.13.22.bb            |    7 -------
 .../update-alternatives-dpkg_1.15.8.7.bb           |   13 +++++++++++++
 3 files changed, 17 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
 create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb

diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
index 9b53df8..63bfe95 100644
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
@@ -5,10 +5,12 @@ programs fulfilling the same or similar functions and how they can be installed
 time."
 LICENSE = "GPL"
 SECTION = "base"
-SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
 S = "${WORKDIR}/dpkg-${PV}"
 PACKAGE_ARCH = "all"
-PR = "r2"
+PR = "r0"
+
+inherit gettext
 
 do_patch () {
     cat ${S}/scripts/update-alternatives.pl | \
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
deleted file mode 100644
index 5d38d5d..0000000
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require update-alternatives-dpkg.inc
-
-PROVIDES += "virtual/update-alternatives"
-RPROVIDES_${PN} += "update-alternatives"
-EXTRA_RDEPENDS = "perl dpkg"
-EXTRA_RDEPENDS_virtclass-native = ""
-RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
new file mode 100644
index 0000000..15f3ced
--- /dev/null
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
@@ -0,0 +1,13 @@
+require update-alternatives-dpkg.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
+SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
+
+
+PROVIDES += "virtual/update-alternatives"
+RPROVIDES_${PN} += "update-alternatives"
+EXTRA_RDEPENDS = "perl dpkg"
+EXTRA_RDEPENDS_virtclass-native = ""
+RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"
-- 
1.7.3.4



