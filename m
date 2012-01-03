Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrA-0004Y7-3A
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752207"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:36 -0800
Message-Id: <d55adc43cbddafcd989141466a78ab55660c71e8.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 050/113] udev: split utilities onto udev-utils
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:23 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc    |    6 +++++-
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index a228e5f..c5d969b 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -36,7 +36,7 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
-PACKAGES =+ "udev-acl udev-consolekit"
+PACKAGES =+ "udev-acl udev-consolekit udev-utils"
 PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
 PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
@@ -47,6 +47,8 @@ INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
+RRECOMMENDS_${PN} += "udev-utils"
+
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
@@ -61,6 +63,8 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
+FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
+
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
 
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index b993a13..d661044 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.6.4



