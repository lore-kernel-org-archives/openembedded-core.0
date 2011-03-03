Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvEky-0001xm-Ab
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:04:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2011 12:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,259,1297065600"; d="scan'208";a="663580410"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2011 12:02:47 -0800
Message-Id: <da65d2bd3d1f83d84b728f4cddfd6418cd953241.1299182375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 10:24:37 +0800
Date: Thu, 03 Mar 2011 12:02:46 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 07/10] recipe: add chkconfig for LSB command test
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
X-List-Received-Date: Thu, 03 Mar 2011 20:04:18 -0000

From: Kang Kai <kai.kang@windriver.com>

chkconfig is a system tool for maintaining the /etc/rc*.d hierarchy,
and LSB command test will check 2 links point to command  chkconfig

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.49.bb |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
new file mode 100644
index 0000000..bbaba71
--- /dev/null
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
+
+DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
+information for system services.  Chkconfig manipulates the numerous \
+symbolic links in /etc/rc.d, to relieve system administrators of some \
+of the drudgery of manually editing the symbolic links."
+
+HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
+
+DEPENDS = "libnewt gettext popt"
+
+PR = "r0"
+
+SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${P}.tar.bz2"
+SRC_URI[md5sum] = "9b5e91d25f4f3b21f4c0bdf55a721431"
+SRC_URI[sha256sum] = "775100a9d6f70fbd8f33ed24b560b6842161fc496c21b1fc6d2aed646f9d855f"
+
+inherit autotools
+
+do_install_append() {
+#    mkdir -p ${D}/etc/rc.d/init.d
+#   mkdir -p  ${D}/etc/rc.d/rc{0,1,2,3,4,5,6}.d
+    mkdir -p ${D}/etc/chkconfig.d
+}
-- 
1.7.1.1



