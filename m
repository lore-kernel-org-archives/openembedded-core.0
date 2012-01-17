Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ar-0006iI-2T
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632894"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:01 -0800
Message-Id: <5c6f55c4c757a0313e00fac4a39e2c9fd79a0913.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/62] stat: add recipe stat with version 3.3
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:37 -0000
X-List-Received-Date: Tue, 17 Jan 2012 08:40:37 -0000

From: Shane Wang <shane.wang@intel.com>

stat is brought into Yocto because the latest version hdparm 9.37 depends on it, and add license checksum.

The recipe was imported from the OpenEmbedded server
(http://git.openembedded.org/openembedded/tree/recipes/stat) as of commit ids
709c4d66e0b107ca606941b988bad717c0b45d9b,
44985d56bc556786812a0a02d6219afd31a7381d,
b3246d96069fd11caee42ec6ebcbf6dca2d62449.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 meta/recipes-extended/stat/stat_3.3.bb |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/stat/stat_3.3.bb

diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
new file mode 100644
index 0000000..0c38742
--- /dev/null
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -0,0 +1,26 @@
+SECTION = "console/utils"
+DESCRIPTION = "Display all information about a file that the stat() call provides and all information a filesystem that statfs() provides."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
+                    file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+BBCLASSEXTEND = "native"
+
+PR = "r0"
+
+SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz"
+SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
+SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
+
+do_install() {
+	install -d ${D}${bindir} ${D}${mandir}/man1
+	install -m 755 stat ${D}${bindir}
+	install -m 644 stat.1 ${D}${mandir}/man1
+}
+
+#do_install_virtclass-native() {
+#	install -d ${D}${bindir}
+#	install -m 755 stat ${D}${bindir}
+#}
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.7.6.5



