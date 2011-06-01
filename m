Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerm-00041j-Cw
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203797"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:34 -0700
Message-Id: <7b99d5340c7f99540328c90fd3d4c4014b542e7c.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/32] util-linux: update to 2.19.1
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:19 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../MCONFIG                                        |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../swapargs.h                                     |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 meta/recipes-core/util-linux/util-linux.inc        |    6 ++----
 .../{util-linux_2.17.2.bb => util-linux_2.19.1.bb} |   11 +++++------
 10 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.17.2.bb => util-linux_2.19.1.bb} (82%)

diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG b/meta/recipes-core/util-linux/util-linux-2.19.1/MCONFIG
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
rename to meta/recipes-core/util-linux/util-linux-2.19.1/MCONFIG
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/defines.h b/meta/recipes-core/util-linux/util-linux-2.19.1/defines.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
rename to meta/recipes-core/util-linux/util-linux-2.19.1/defines.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/make_include b/meta/recipes-core/util-linux/util-linux-2.19.1/make_include
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/make_include
rename to meta/recipes-core/util-linux/util-linux-2.19.1/make_include
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
rename to meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h b/meta/recipes-core/util-linux/util-linux-2.19.1/swapargs.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
rename to meta/recipes-core/util-linux/util-linux-2.19.1/swapargs.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-compile.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
rename to meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-compile.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-2.16-mount_lock_path.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
rename to meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-2.16-mount_lock_path.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-replace-siginterrupt.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
rename to meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-replace-siginterrupt.patch
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 489ec1a..71601dc 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,7 +7,7 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f \
                     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://licenses/COPYING.GPL;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
@@ -18,7 +18,7 @@ DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native_append = " lzo-native"
 
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
            file://swapargs.h \
            file://defines.h \
@@ -31,8 +31,6 @@ PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu"
 
-S = "${WORKDIR}/util-linux-ng-${PV}"
-
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
   --disable-login-utils --enable-write --enable-arch --enable-mount --with-fsprobe=builtin --enable-libuuid --enable-libblkid --enable-fsck"
diff --git a/meta/recipes-core/util-linux/util-linux_2.17.2.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
similarity index 82%
rename from meta/recipes-core/util-linux/util-linux_2.17.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.19.1.bb
index f6bdfd4..7fe7497 100644
--- a/meta/recipes-core/util-linux/util-linux_2.17.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,16 +1,15 @@
-MAJOR_VERSION = "2.17"
-PR = "r7"
+MAJOR_VERSION = "2.19"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
 LICENSE_util-linux-lscpu = "GPLv3+"
 
-SRC_URI += "file://uclibc-compile.patch \
-	          file://util-linux-ng-replace-siginterrupt.patch \
+SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
                   file://util-linux-ng-2.16-mount_lock_path.patch"
 
-SRC_URI[md5sum] = "4635725a3eef1c57090bac8ea5e082e6"
-SRC_URI[sha256sum] = "c9ae801b6a5ab20b7749a278a8bf6830ef53adc5e8b7eb0ac1a9f410c774118f"
+SRC_URI[md5sum] = "3eab06f05163dfa65479c44e5231932c"
+SRC_URI[sha256sum] = "d3eac4afcc687b3ae1ffedcab2dc12df84c7ba7045cce31386d2b7040a011c7d"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
-- 
1.7.3.4



