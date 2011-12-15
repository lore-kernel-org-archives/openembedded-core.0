Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RbKs2-0005Es-4R
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 00:37:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87086683"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.105])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 15:30:35 -0800
Message-Id: <eec8014c76be16e9a58c34f5a448231a74abd445.1323991540.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
Subject: [PATCH 02/10] udev: fix LICENSE fields to be SPDX compliant
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
X-List-Received-Date: Thu, 15 Dec 2011 23:37:50 -0000

Additionally I'm not sure where the LGPL license came from, the COPYING
file and Fedora both say GPL v2 or later so drop the LGPL entry for now.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/udev/udev-new.inc |    2 +-
 meta/recipes-core/udev/udev.inc     |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index eac7903..769d54a 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -2,7 +2,7 @@ SUMMARY = "/dev/ and hotplug management daemon"
 DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
 /dev/, handles hotplug events and loads drivers at boot time."
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0+"
 LICENSE_${PN} = "GPLv2+"
 LICENSE_libudev = "LGPLv2.1+"
 LICENSE_libgudev = "LGPLv2.1+"
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index d731816..2e501fa 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -1,7 +1,7 @@
 SUMMARY = "/dev/ and hotplug management daemon"
 DESCRIPTION = "udev is a program which dynamically creates and removes device nodes from \
 /dev/. It responds to /sbin/hotplug device events and requires a 2.6 kernel."
-LICENSE = "GPL"
+LICENSE = "GPL-2.0+"
 
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



