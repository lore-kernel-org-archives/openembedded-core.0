Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLg-0003ik-So
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299009"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:40 -0700
Message-Id: <0be04e2931ec1f7d5bd3ff538913081e2e8ec04f.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 04/13] tar: upgrade to v1.26
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:13 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 ...tive_1.25.bb => tar-replacement-native_1.26.bb} |    0
 meta/recipes-extended/tar/tar.inc                  |    1 +
 meta/recipes-extended/tar/tar_1.25.bb              |    9 ---------
 meta/recipes-extended/tar/tar_1.26.bb              |    9 +++++++++
 4 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.25.bb => tar-replacement-native_1.26.bb} (100%)
 delete mode 100644 meta/recipes-extended/tar/tar_1.25.bb
 create mode 100644 meta/recipes-extended/tar/tar_1.26.bb

diff --git a/meta/recipes-extended/tar/tar-replacement-native_1.25.bb b/meta/recipes-extended/tar/tar-replacement-native_1.26.bb
similarity index 100%
rename from meta/recipes-extended/tar/tar-replacement-native_1.25.bb
rename to meta/recipes-extended/tar/tar-replacement-native_1.26.bb
diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 6e77051..bbed65c 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -3,6 +3,7 @@ DESCRIPTION = "GNU tar saves many files together into a single tape \
 or disk archive, and can restore individual files from the archive."
 HOMEPAGE = "http://www.gnu.org/software/tar/"
 SECTION = "base"
+PRIORITY = "optional"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
diff --git a/meta/recipes-extended/tar/tar_1.25.bb b/meta/recipes-extended/tar/tar_1.25.bb
deleted file mode 100644
index cdb6f54..0000000
--- a/meta/recipes-extended/tar/tar_1.25.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require tar.inc
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-PR = "r0"
-
-SRC_URI[md5sum] = "6e497f861c77bbba2f7da4e10270995b"
-SRC_URI[sha256sum] = "f3f6ce41b8e0f327abd05c95990f113ddafbae131e10f79a99728ed46458494b"
diff --git a/meta/recipes-extended/tar/tar_1.26.bb b/meta/recipes-extended/tar/tar_1.26.bb
new file mode 100644
index 0000000..26fdc4a
--- /dev/null
+++ b/meta/recipes-extended/tar/tar_1.26.bb
@@ -0,0 +1,9 @@
+require tar.inc
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "2cee42a2ff4f1cd4f9298eeeb2264519"
+SRC_URI[sha256sum] = "5a5369f464502a598e938029c310d4b3abd51e6bb8dfd045663e61c8ea9f6d41"
-- 
1.7.3.4



