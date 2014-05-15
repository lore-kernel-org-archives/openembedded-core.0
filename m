Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AD2D765FD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 15:58:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 May 2014 08:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1060,1389772800"; d="scan'208";a="432626702"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.90])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2014 08:58:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2014 08:58:37 -0700
Message-Id: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] libusb1: Update to 1.0.18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 May 2014 15:58:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch      | 0
 .../recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} | 7 ++-----
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libusb/{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} (78%)

diff --git a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
rename to meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bb b/meta/recipes-support/libusb/libusb1_1.0.18.bb
similarity index 78%
rename from meta/recipes-support/libusb/libusb1_1.0.9.bb
rename to meta/recipes-support/libusb/libusb1_1.0.18.bb
index d57425b..c64f1db 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
@@ -8,14 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
-           file://obsolete_automake_macros.patch \
           "
 
-SRC_URI[md5sum] = "7f5a02375ad960d4e33a6dae7d63cfcb"
-SRC_URI[sha256sum] = "e920eedc2d06b09606611c99ec7304413c6784cba6e33928e78243d323195f9b"
+SRC_URI[md5sum] = "4a6d049923efc6496f1d383054dac1a6"
+SRC_URI[sha256sum] = "c73f5cec45a5de94418da4e151b7232958571926984acfb9bce02b9424e83720"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
1.8.3.1


