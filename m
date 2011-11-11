Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhR-0000NG-Tp
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:43:03 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010359"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:34 -0800
Message-Id: <770ddb59db03667c307a5b3b9bf6172250666d55.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 8/9] util-linux: split mcookie into a package
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
X-List-Received-Date: Fri, 11 Nov 2011 08:43:07 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4db577c..dcf0ed9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -30,7 +30,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-	     util-linux-chkdupexe util-linux-mkfs"
+	     util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
@@ -45,6 +45,7 @@ FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
 FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${PN} ${sbindir}/swapoff.${PN}"
 FILES_util-linux-losetup = "${base_sbindir}/losetup.${PN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
+FILES_util-linux-mcookie = "${bindir}/mcookie"
 FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${PN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index fb5637e..e2fb727 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r9"
+PR = "r10"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.6.4



