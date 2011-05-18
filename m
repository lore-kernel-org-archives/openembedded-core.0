Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFx-0003uu-G6
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:19 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:36 -0700
Message-Id: <ca78f121158034700487392e72ce229b18e43222.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 07/30] lsbsetup: Rename this file and add a link for lsb test
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
X-List-Received-Date: Wed, 18 May 2011 22:30:17 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1079]

Rename this file version from 0.9 to 1.0.
Link time environment for Hong Kong time for lsb test.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Added yocto bugid

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbsetup_0.9.bb |   25 -------------------------
 meta/recipes-extended/lsb/lsbsetup_1.0.bb |   27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup_0.9.bb
 create mode 100644 meta/recipes-extended/lsb/lsbsetup_1.0.bb

diff --git a/meta/recipes-extended/lsb/lsbsetup_0.9.bb b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
deleted file mode 100644
index f3651e2..0000000
--- a/meta/recipes-extended/lsb/lsbsetup_0.9.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "auto-setup environment for lsb test"
-SECTION = "console/utils"
-PRIORITY = "required"
-LICENSE = "GPLv2"
-PR = "r3"
-
-LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786ce5bbe9ac58042945583"
-
-SRC_URI = "file://LSB_Setup.sh"
-
-S=${WORKDIR}
-
-do_install() {
-        # Only install file if it has a contents
-        install -d ${D}/usr/bin
-        install -m 0755 ${S}/LSB_Setup.sh ${D}/usr/bin
-        install -d  ${D}/usr/lib/lsb
-        ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-        ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
-        ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
-}
-
-FILES_${PN} += "${libdir}/lsb \
-               ${libdir}/* \
-               "
diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
new file mode 100644
index 0000000..247f9bc
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "auto-setup environment for lsb test"
+SECTION = "console/utils"
+PRIORITY = "required"
+LICENSE = "GPLv2"
+PR = "r3"
+
+LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786ce5bbe9ac58042945583"
+
+SRC_URI = "file://LSB_Setup.sh"
+
+S=${WORKDIR}
+
+do_install() {
+    # Only install file if it has a contents
+    install -d ${D}/usr/bin
+    install -d ${D}/${sysconfdir}
+    install -m 0755 ${S}/LSB_Setup.sh ${D}/usr/bin
+    install -d  ${D}/usr/lib/lsb
+    ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
+    ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+    ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
+    ln -sf ${datadir}/zoneinfo/Asia/Hong_Kong ${D}${sysconfdir}/localtime
+}
+
+FILES_${PN} += "${libdir}/lsb \
+               ${libdir}/* \
+               "
-- 
1.7.3.4



