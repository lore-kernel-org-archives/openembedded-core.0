Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8E-0007hP-9L
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173263"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:49 -0700
Message-Id: <2e6a0990769a96858249bc8d264dde6274e871b8.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/17] gzip: upgrade to 1.5
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:10 -0000

From: Scott Garman <scott.a.garman@intel.com>

LIC_FILES_CHKSUM updated due to trivial copyright date change.

Use new update-alternatives syntax.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-extended/gzip/gzip.inc    |    7 +++++--
 meta/recipes-extended/gzip/gzip_1.4.bb |   10 ----------
 meta/recipes-extended/gzip/gzip_1.5.bb |   10 ++++++++++
 3 files changed, 15 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-extended/gzip/gzip_1.4.bb
 create mode 100644 meta/recipes-extended/gzip/gzip_1.5.bb

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 1d608a6..a4b1abe 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 # change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gzip.h;firstline=8;endline=20;md5=e2ec6b91fbe43a18f6081f3bbae46a01"
+                    file://gzip.h;firstline=8;endline=20;md5=d31380638987e6789f06bc96a29a9a16"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
@@ -22,5 +22,8 @@ do_install_append () {
 
 inherit update-alternatives
 
-ALTERNATIVE_LINKS = "${base_bindir}/gunzip ${base_bindir}/gzip ${base_bindir}/zcat"
 ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "gunzip gzip zcat"
+ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
+ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
+ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
diff --git a/meta/recipes-extended/gzip/gzip_1.4.bb b/meta/recipes-extended/gzip/gzip_1.4.bb
deleted file mode 100644
index 54dd50a..0000000
--- a/meta/recipes-extended/gzip/gzip_1.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gzip.inc
-
-PR = "r2"
-
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "e381b8506210c794278f5527cba0e765"
-SRC_URI[sha256sum] = "d166cfd3da380da1bd535633e8890bfb5664f9e68870a611d1dc01a3e9f711ee"
diff --git a/meta/recipes-extended/gzip/gzip_1.5.bb b/meta/recipes-extended/gzip/gzip_1.5.bb
new file mode 100644
index 0000000..7a811e2
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip_1.5.bb
@@ -0,0 +1,10 @@
+require gzip.inc
+
+PR = "r0"
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "11b76536941ee1c0221fe6eefbcb32cb"
+SRC_URI[sha256sum] = "b5d56e8ffc9918e8c941fab56e04121194f9870adeeb859e09c09eac264035a3"
-- 
1.7.7.6



