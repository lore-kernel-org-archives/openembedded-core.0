Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hm-0006ZY-7x
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980246"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:27 -0700
Message-Id: <591db57893e40b68fda67ec462baf3a09216b839.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/32] sysvinit: Change ${PN} to ${BPN} in file names
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:47 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Some files in sysvinit are named with ${PN}. In multilib case, ${PN}
will be prefixed with "lib32-" or "lib64-". Use ${BPN} instead.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |   52 ++++++++++++------------
 1 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index bda8a51..663e298 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r4"
+PR = "r5"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
@@ -65,41 +65,41 @@ do_install () {
 		install -d ${D}${sysconfdir}/rc$level.d
 		ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
 	done
-	mv                 ${D}${base_sbindir}/init               ${D}${base_sbindir}/init.${PN}
-	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${PN}
-	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
-	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
-	mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${PN}
-	mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${PN}
-	mv ${D}${bindir}/last ${D}${bindir}/last.${PN}
-	mv ${D}${bindir}/mesg ${D}${bindir}/mesg.${PN}
-	mv ${D}${bindir}/wall ${D}${bindir}/wall.${PN}
+	mv                 ${D}${base_sbindir}/init               ${D}${base_sbindir}/init.${BPN}
+	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${BPN}
+	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${BPN}
+	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${BPN}
+	mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${BPN}
+	mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${BPN}
+	mv ${D}${bindir}/last ${D}${bindir}/last.${BPN}
+	mv ${D}${bindir}/mesg ${D}${bindir}/mesg.${BPN}
+	mv ${D}${bindir}/wall ${D}${bindir}/wall.${BPN}
 }
 
 pkg_postinst_${PN} () {
-	update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 200
-	update-alternatives --install ${base_sbindir}/reboot reboot reboot.${PN} 200
-	update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${PN} 200
-	update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff.${PN} 200
-	update-alternatives --install ${bindir}/last last last.${PN} 200
-	update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 200
-	update-alternatives --install ${bindir}/wall wall wall.${PN} 200
+	update-alternatives --install ${base_sbindir}/halt halt halt.${BPN} 200
+	update-alternatives --install ${base_sbindir}/reboot reboot reboot.${BPN} 200
+	update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${BPN} 200
+	update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff.${BPN} 200
+	update-alternatives --install ${bindir}/last last last.${BPN} 200
+	update-alternatives --install ${bindir}/mesg mesg mesg.${BPN} 200
+	update-alternatives --install ${bindir}/wall wall wall.${BPN} 200
 }
 
 pkg_prerm_${PN} () {
-	update-alternatives --remove halt halt.${PN}
-	update-alternatives --remove reboot reboot.${PN}
-	update-alternatives --remove shutdown shutdown.${PN}
-	update-alternatives --remove poweroff poweroff.${PN}
-	update-alternatives --remove last last.${PN}
-	update-alternatives --remove mesg mesg.${PN}
-	update-alternatives --remove wall wall.${PN}
+	update-alternatives --remove halt halt.${BPN}
+	update-alternatives --remove reboot reboot.${BPN}
+	update-alternatives --remove shutdown shutdown.${BPN}
+	update-alternatives --remove poweroff poweroff.${BPN}
+	update-alternatives --remove last last.${BPN}
+	update-alternatives --remove mesg mesg.${BPN}
+	update-alternatives --remove wall wall.${BPN}
 }
 
 pkg_postinst_sysvinit-pidof () {
-	update-alternatives --install ${base_bindir}/pidof pidof pidof.${PN} 200
+	update-alternatives --install ${base_bindir}/pidof pidof pidof.${BPN} 200
 }
 
 pkg_prerm_sysvinit-pidof () {
-	update-alternatives --remove pidof pidof.${PN}
+	update-alternatives --remove pidof pidof.${BPN}
 }
-- 
1.7.6



