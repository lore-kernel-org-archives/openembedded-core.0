Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUc-0002Sz-0o
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540465"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:18 -0700
Message-Id: <355c39f9357576bdb72b2534b3df4c4374eceba1.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/28] rxvt-unicode: Update to 9.12
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
X-List-Received-Date: Fri, 14 Oct 2011 05:42:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.11.bb => rxvt-unicode_9.12.bb} |   10 ++++++----
 4 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.11 => rxvt-unicode-9.12}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.11 => rxvt-unicode-9.12}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.11 => rxvt-unicode-9.12}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.11.bb => rxvt-unicode_9.12.bb} (93%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.12.bb
similarity index 93%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.12.bb
index db18169..5625245 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.12.bb
@@ -8,11 +8,16 @@ same time, including Xft fonts."
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.C;beginline=1;endline=31;md5=775485398a09fa7aee6f90464af88432"
+
+PR = "r0"
+
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
 	   file://rxvt.png"
-PR = "r1"
+
+SRC_URI[md5sum] = "945af37d661c8c45a7cac292160e7c70"
+SRC_URI[sha256sum] = "1db334204bfb264b3134e01d9d3cf446c5ac7d47514909435f914f3906f37e7e"
 
 inherit autotools update-alternatives
 
@@ -60,6 +65,3 @@ do_install_append () {
 }
 
 FILES_${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
-
-SRC_URI[md5sum] = "1bed5bfeed026e0bfafa0e9e4f62aa37"
-SRC_URI[sha256sum] = "0452c00066774ef6e32fcd0a1e6f09230392ea9f6f42e1c2ef7b91d6fcb82d85"
-- 
1.7.6.2



