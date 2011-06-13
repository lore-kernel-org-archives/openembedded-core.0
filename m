Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW169-0002Fx-3b
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500631"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:31 -0700
Message-Id: <56ad736c00251bdb8f2d79e7e1bfed51a00bd16f.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 21/23] rxvt-unicode: Fix SRC_URI & LIC_FILES Checksum
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
index 9657e21..db18169 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
@@ -7,12 +7,12 @@ output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/main.C;beginline=1;endline=31;md5=633e23cdeb89fe980ded9a3af4f335c2"
+                    file://src/main.C;beginline=1;endline=31;md5=775485398a09fa7aee6f90464af88432"
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
 	   file://rxvt.png"
-PR = "r0"
+PR = "r1"
 
 inherit autotools update-alternatives
 
@@ -61,5 +61,5 @@ do_install_append () {
 
 FILES_${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
 
-SRC_URI[md5sum] = "a23aa40b31e843878b6f9c44768de430"
-SRC_URI[sha256sum] = "1c238f7e545b1a8da81239b826fb2a7d196c73effbcbd211db7a50995a0a067a"
+SRC_URI[md5sum] = "1bed5bfeed026e0bfafa0e9e4f62aa37"
+SRC_URI[sha256sum] = "0452c00066774ef6e32fcd0a1e6f09230392ea9f6f42e1c2ef7b91d6fcb82d85"
-- 
1.7.3.4



