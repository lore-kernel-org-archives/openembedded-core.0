Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLj-0003ik-VD
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299029"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:47 -0700
Message-Id: <16a732e6854dd62858af23994fa7f443607e9944.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [CONSOLIDATED PULL 11/13] util-linux: package agetty seperately
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:16 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Some packages like systemd only want agetty to spawn a console and not drag in all of util-linux just for that.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 71601dc..4b36100 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-
            file://make_include \
            "
 
-PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
+PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
@@ -37,6 +37,7 @@ EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elv
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
+FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${PN}"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 8067ab5..132f28b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.3.4



