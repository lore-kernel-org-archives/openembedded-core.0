Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMn-00065Z-FJ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292913"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:39 -0700
Message-Id: <fd9992ae35020ec1132c7080ddfc9439e98bde99.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/41] pseudo: Update to 1.3.1 (fixing chroot crash)
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:18 -0000

From: Peter Seebach <peter.seebach@windriver.com>

Yocto bug #2639.  If a chroot path was long, expanding absolute
paths within the chroot path could overrun a buffer.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_1.3.bb   |    8 --------
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
new file mode 100644
index 0000000..d64e0e5
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r11"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "aa7dbe925d065187833e1171746e9a94"
+SRC_URI[sha256sum] = "dc896c06b0f5bc253faaeb21ed78157db7ef7553e3ecae15a1eb6faf64942110"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
deleted file mode 100644
index 187b46d..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r10"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "5832bb70e6dce1a17b9b33a9c5c4b923"
-SRC_URI[sha256sum] = "2f30e2e9ec966cec3a321fc2ed80408ee77ad6c0cd73aaf36f88b98e008f8508"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1852fab..2f58072 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
-PV = "1.3+git${SRCPV}"
-PR = "r25"
+SRCREV = "2e0189ba5368b1e88d509d0ab82bccb15cfb3653"
+PV = "1.3.1+git${SRCPV}"
+PR = "r26"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.7.6



