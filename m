Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbQ-0005lt-0Q
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609039"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:24 -0700
Message-Id: <1b04a9a64caf12a3e5bfa06f940464de82c8852e.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: ilkka.tengvall@nsn.com
Subject: [CONSOLIDATED PULL 20/20] tzcode: Update to 2011g
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
X-List-Received-Date: Mon, 06 Jun 2011 06:51:47 -0000

[YOCTO #1080]

Thanks to ilkka.tengvall@nsn.com

Cc: ilkka.tengvall@nsn.com
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/tzcode/tzcode-native_2009r.bb |   19 ---------------
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |   25 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2009r.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2011g.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2009r.bb b/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
deleted file mode 100644
index 886687a..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
-
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz \
-           ftp://elsie.nci.nih.gov/pub/tzdata2009s.tar.gz"
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
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb b/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
new file mode 100644
index 0000000..95ba7ef
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
+
+SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "ecb564279b28c5b184421c525d997d6c"
+SRC_URI[tzcode.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
+SRC_URI[tzdata.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
+SRC_URI[tzdata.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+
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
-- 
1.7.3.4



