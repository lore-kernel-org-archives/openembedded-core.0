Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmX-00042O-5V
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535252"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:01 -0800
Message-Id: <f1193e077d187b9ce18ae0686b1a1f0f9832036d.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/22] Remove last remnants of kernel26 MACHINE_FEATURES
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
X-List-Received-Date: Tue, 10 Jan 2012 06:02:01 -0000

From: Steve Sakoman <steve@sakoman.com>

There is no reason to continue to carry this feature

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf                             |    1 -
 meta/conf/machine/include/qemu.inc                 |    2 +-
 .../update-modules/update-modules_1.0.bb           |    4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b858364..336b1d7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,6 @@ OES_BITBAKE_CONF = "1"
 # Machine properties and task-base stuff
 ##################################################################
 
-MACHINE_FEATURES ?= "kernel26"
 DISTRO_FEATURES ?= ""
 
 # This is used to limit what packages goes into images built, so set big by default
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 3cebfab..10ab76e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,7 +1,7 @@
 PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
-MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
+MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 IMAGE_FSTYPES ?= "tar.bz2 ext3"
 
diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
index 1ea97a8..dc44965 100644
--- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
+++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
@@ -3,8 +3,8 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-RDEPENDS_${PN} = "${@base_contains("MACHINE_FEATURES", "kernel26",  "module-init-tools-depmod","modutils-depmod",d)} "
-PR = "r10"
+RDEPENDS_${PN} = "module-init-tools-depmod"
+PR = "r11"
 
 SRC_URI = "file://update-modules \
            file://COPYING.GPL"
-- 
1.7.6.5



