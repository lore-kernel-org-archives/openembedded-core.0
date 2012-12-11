Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TiS0s-0006ZL-SJ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 16:44:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2012 07:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,259,1355126400"; d="scan'208";a="260538229"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2012 07:29:15 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 17:29:40 +0200
Message-Id: <ac18d9ff0f277bcf66f665ae932b69b78c72212e.1355236839.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355236839.git.constantinx.musca@intel.com>
References: <cover.1355236839.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355236839.git.constantinx.musca@intel.com>
References: <cover.1355236839.git.constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/4] pcmciautils: set correct udevdir and add missing debug files
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
X-List-Received-Date: Tue, 11 Dec 2012 15:44:55 -0000

Fix the following warning:
WARNING: QA Issue: pcmciautils: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/udev
  /usr/lib/udev/pcmcia-socket-startup
  /usr/lib/udev/pcmcia-check-broken-cis
  /usr/lib/udev/.debug
  /usr/lib/udev/.debug/pcmcia-socket-startup
  /usr/lib/udev/.debug/pcmcia-check-broken-cis

[YOCTO #3440]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-bsp/pcmciautils/pcmciautils.inc    | 1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index fa35daf..0942b1f 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -16,6 +16,7 @@ export HOSTCC = "${BUILD_CC}"
 export etcdir = "${sysconfdir}"
 export sbindir = "${base_sbindir}"
 export pcmciaconfdir = "${sysconfdir}/pcmcia"
+export udevdir = "${sysconfdir}/udev"
 export udevrulesdir = "${sysconfdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 202437a..c48df94 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://makefile_fix.patch"
 SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
 SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
 
-PR = "r0"
+PR = "r1"
 
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
+FILES_${PN}-dbg += "${libdir}/udev/.debug ${sysconfdir}/udev/.debug"
 FILES_${PN} += "${libdir}/udev"
-- 
1.7.11.7



