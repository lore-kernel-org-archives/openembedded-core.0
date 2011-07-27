Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuN-00028l-9Z
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949312"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:02 -0700
Message-Id: <4d55f8599fec45515cc913e2c12eb502d34f4814.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 12/35] libcap: Update to 2.22 with License Clarification
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libcap/libcap.inc     |    4 ++--
 meta/recipes-support/libcap/libcap_2.20.bb |    6 ------
 meta/recipes-support/libcap/libcap_2.22.bb |    6 ++++++
 3 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/libcap_2.20.bb
 create mode 100644 meta/recipes-support/libcap/libcap_2.22.bb

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index efa46d6..67f7579 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "support for getting/setting POSIX.1e capabilities"
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 
 # no specific GPL version required
-LICENSE = "BSD | GPL"
-LIC_FILES_CHKSUM = "file://License;md5=731de803c1ccbcb05a9b3523279c8d7f"
+LICENSE = "BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "libpam attr perl-native-runtime"
 # attr and pam are disabled by EXTRA_OEMAKE_virtclass-native
diff --git a/meta/recipes-support/libcap/libcap_2.20.bb b/meta/recipes-support/libcap/libcap_2.20.bb
deleted file mode 100644
index a2b49c6..0000000
--- a/meta/recipes-support/libcap/libcap_2.20.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libcap.inc
-
-PR = "r3"
-
-SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
-SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
new file mode 100644
index 0000000..bb49c03
--- /dev/null
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -0,0 +1,6 @@
+require libcap.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "ce64058bdb3f086ddbfca8ce6c919845"
+SRC_URI[sha256sum] = "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c4061ac98b78c04050f"
-- 
1.7.3.4



