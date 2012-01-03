Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrN-0004pi-Q2
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752241"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:54 -0800
Message-Id: <a9893cb681ca7cf35635a7f169b16238764372ea.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 068/113] rxvt-unicode: Update to 9.14
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:34 -0000

COPYING file has been reformatted whites space changes

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.12.bb => rxvt-unicode_9.14.bb} |    9 +++++----
 4 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.12.bb => rxvt-unicode_9.14.bb} (88%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.12/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.12.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.14.bb
similarity index 88%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.12.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.14.bb
index 5625245..c349249 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.12.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.14.bb
@@ -1,14 +1,15 @@
 SECTION = "x11/utils"
-DEPENDS = "virtual/libx11 libxt libxft"
 DESCRIPTION = "rxvt-unicode is a clone of the well known \
 terminal emulator rxvt, modified to store text in Unicode \
 (either UCS-2 or UCS-4) and to use locale-correct input and \
 output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/main.C;beginline=1;endline=31;md5=775485398a09fa7aee6f90464af88432"
 
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
+
 PR = "r0"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
@@ -16,8 +17,8 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-SRC_URI[md5sum] = "945af37d661c8c45a7cac292160e7c70"
-SRC_URI[sha256sum] = "1db334204bfb264b3134e01d9d3cf446c5ac7d47514909435f914f3906f37e7e"
+SRC_URI[md5sum] = "022235a9a8b012c29e72c49177be6ce4"
+SRC_URI[sha256sum] = "29928a33be6b3fb0edd126df2c3d35e1900f8268b546ce54430780c550fa1d52"
 
 inherit autotools update-alternatives
 
-- 
1.7.6.4



