Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RkwgL-0005ec-Ih
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 12:49:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 03:41:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111059451"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2012 03:41:57 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 19:53:24 +0800
Message-Id: <5c2967aa775549c8d0a2318d2be5b3f9b63dcecf.1326282692.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1326282692.git.shane.wang@intel.com>
References: <cover.1326282692.git.shane.wang@intel.com>
In-Reply-To: <cover.1326282692.git.shane.wang@intel.com>
References: <cover.1326282692.git.shane.wang@intel.com>
Subject: [PATCH 1/2] stat: add recipe stat with version 3.3
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
X-List-Received-Date: Wed, 11 Jan 2012 11:49:31 -0000

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
1.7.6



