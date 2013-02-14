Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U687S-0007ZV-MI
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 00:21:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2013 15:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,666,1355126400"; d="scan'208";a="285948078"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.50])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2013 15:05:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 15:05:30 -0800
Message-Id: <1360883130-17845-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Cc: Matthew McClintock <msm@freescale.com>
Subject: [PATCH for danny] glib: disable selinux for native builds
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
X-List-Received-Date: Thu, 14 Feb 2013 23:21:48 -0000

From: Matthew McClintock <msm@freescale.com>

This improves reusabiliy of sstate-cache across different hosts

Signed-odd-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb | 2 +-
 meta/recipes-core/glib-2.0/glib.inc           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 10c0b61..a939045 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r6"
+PR = "r7"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8b099f2..8086c86 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -28,7 +28,7 @@ S = "${WORKDIR}/glib-${PV}"
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
 
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
-EXTRA_OECONF_virtclass-native = "${CORECONF}"
+EXTRA_OECONF_virtclass-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
-- 
1.8.1.2



