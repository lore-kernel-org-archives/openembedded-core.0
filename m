Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RclWu-0001JE-NF
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:17:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88245195"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 14:10:40 -0800
Message-Id: <eb15d82b9878cf8756b31b944f46c7b55c64ba5c.1324332440.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
Subject: [PATCH 02/10] udev: tidy the LICENSE fields
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
X-List-Received-Date: Mon, 19 Dec 2011 22:17:57 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>

fix udev
---
 meta/recipes-core/udev/udev-new.inc |    4 ++--
 meta/recipes-core/udev/udev.inc     |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index eac7903..e302c03 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -2,8 +2,8 @@ SUMMARY = "/dev/ and hotplug management daemon"
 DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
 /dev/, handles hotplug events and loads drivers at boot time."
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LICENSE_${PN} = "GPLv2+"
+LICENSE = "GPLv2.0+ & LGPLv2.1+"
+LICENSE_${PN} = "GPLv2.0+"
 LICENSE_libudev = "LGPLv2.1+"
 LICENSE_libgudev = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index d731816..eb096ee 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -1,7 +1,7 @@
 SUMMARY = "/dev/ and hotplug management daemon"
 DESCRIPTION = "udev is a program which dynamically creates and removes device nodes from \
 /dev/. It responds to /sbin/hotplug device events and requires a 2.6 kernel."
-LICENSE = "GPL"
+LICENSE = "GPLv2.0+ & LGPLv2.1+"
 
 SRC_URI += " \
 	   file://udev.rules \
@@ -11,7 +11,7 @@ SRC_URI += " \
 	   file://mount.sh \
 	   file://network.sh \
 	   file://local.rules \
-       file://udev-cache \
+           file://udev-cache \
            file://init"
 
 UDEV_DEVFS_RULES ?= "0"
-- 
1.7.7.4



