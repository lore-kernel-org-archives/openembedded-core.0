Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 427C96C72F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 06:41:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 22:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,518,1384329600"; d="scan'208";a="455317868"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 22:41:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 22:41:08 -0800
Message-Id: <1387521668-26329-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
References: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] util-linux: remove non PN based -dev packages
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
X-List-Received-Date: Fri, 20 Dec 2013 06:41:10 -0000

All dev related items should be packaged in the core PN package not in seperate packages.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 9f5fd01..2527fbe 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -32,10 +32,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libmount util-linux-libmount-dev \
-             util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
+             util-linux-libmount util-linux-libuuid \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-uuidd \
+             util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs \
              util-linux-partx ${PN}-bash-completion"
 
@@ -77,11 +76,8 @@ FILES_util-linux-reset = "${base_bindir}/reset"
 FILES_util-linux-partx = "${sbindir}/partx"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
-FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
-FILES_util-linux-libmount-dev = "${libdir}/libmount.so ${libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
 FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
@@ -107,6 +103,8 @@ RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 
+RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
+
 SYSTEMD_PACKAGES = "${PN}-uuidd"
 SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.service"
 
-- 
1.8.3.1


