Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGRbK-0000ob-K4
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:34:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 01:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64658095"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 01:28:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 01:28:05 -0700
Message-Id: <656fc112a14363b6d585366dde8d41d4aa0ddb69.1319012721.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/16] bluez4: Add glib-2.0 to DEPENDS
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
X-List-Received-Date: Wed, 19 Oct 2011 08:34:14 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes

| attrib/utils.c:25:18: fatal error: glib.h: No such file or directory
| compilation terminated.
| make[1]: *** [attrib/utils.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| attrib/interactive.c:27:18: fatal error: glib.h: No such file or
directory
| compilation terminated.
| make[1]: *** [attrib/interactive.o] Error 1
| make: *** [all] Error 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index fc515f6..9158687 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev alsa-lib libusb dbus-glib"
+DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ASNEEDED = ""
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index 52268cf..88ec7a4 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://bluetooth.conf"
 
-- 
1.7.6.2



