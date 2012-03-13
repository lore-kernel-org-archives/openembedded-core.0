Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlq-0000Hr-0g
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321825"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:51 -0700
Message-Id: <3f2884b36d90d3c9cd44693f2abfbfb13544279d.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/23] util-linux: explicitly disable udev
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:50 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* util-linux auto-detects libudev for lsblk, so
  disable it, because it's not listed in DEPENDS.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/util-linux/util-linux.inc     |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1a3d293..e2d354f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,7 +38,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --enable-kill --enable-last --enable-mesg --enable-partx \
                 --enable-raw --enable-rdev --enable-reset --disable-login-utils \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
-                --enable-libuuid --enable-libblkid --enable-fsck"
+                --enable-libuuid --enable-libblkid --enable-fsck --without-udev"
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index 744dbaf..bcf92e0 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.7.6



