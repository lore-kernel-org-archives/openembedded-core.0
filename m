Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkX1o-00046J-Gf
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:30:28 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 01:15:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,299,1355126400"; d="scan'208";a="265310969"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 01:15:48 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:16:18 +0200
Message-Id: <fc5ac72e09b464ee6eee1c1489de718238944b9a.1355732782.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
Subject: [PATCH 2/7] udev: replace base_libdir with nonarch_base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 09:30:29 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-core/udev/udev.inc    | 24 ++++++++++++------------
 meta/recipes-core/udev/udev_182.bb |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 4705b9b..9f83821 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -32,16 +32,16 @@ inherit autotools pkgconfig update-rc.d
 
 # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
 sbindir = "${base_sbindir}"
-libexecdir = "${base_libdir}" 
+libexecdir = "${nonarch_base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
-                --with-rootlibdir=${base_libdir} \
+                --with-rootlibdir=${nonarch_base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids \
                 ac_cv_file__usr_share_pci_ids=no \
                 ac_cv_file__usr_share_hwdata_pci_ids=no \
                 ac_cv_file__usr_share_misc_pci_ids=yes \
                 --sbindir=${base_sbindir} \
-                --libexecdir=${base_libdir} \
-                --with-rootlibdir=${base_libdir} \
+                --libexecdir=${nonarch_base_libdir} \
+                --with-rootlibdir=${nonarch_base_libdir} \
                 --with-rootprefix= \
                "
 
@@ -59,20 +59,20 @@ FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
 RRECOMMENDS_${PN} += "udev-utils"
 
 FILES_${PN}-dbg += "${libexecdir}/.debug"
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
+FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/"
+FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
+FILES_libudev = "${nonarch_base_libdir}/libudev.so.*"
+FILES_libudev-dbg = "${nonarch_base_libdir}/.debug/libudev.so.*"
 FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
                      ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
-FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
-FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
+FILES_libgudev = "${nonarch_base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
+FILES_libgudev-dbg = "${nonarch_base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
+FILES_udev-acl = "${nonarch_base_libdir}/udev/udev-acl ${nonarch_base_libdir}/udev/rules.d/70-acl.rules"
 
 FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
 
@@ -94,7 +94,7 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
 
 	# hid2hci has moved to bluez4. removed in udev as of version 169
-	rm -f ${D}${base_libdir}/udev/hid2hci
+	rm -f ${D}${nonarch_base_libdir}/udev/hid2hci
 
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index c41de9f..0ae9f8c 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r2"
+PR = "r3"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.11.7



