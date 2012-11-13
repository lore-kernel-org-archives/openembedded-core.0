Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfX-0006Sf-BM
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907474"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:49 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:28 +0200
Message-Id: <034b43e78929b3e9f2bf6ee32a72de885f2cebe8.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 11/12] xf86-input-synaptics: add mtdev dependency
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
X-List-Received-Date: Tue, 13 Nov 2012 12:32:43 -0000

After upgrading xserver to 1.13, multitouch support is automatically
enabled in xf86-input-synaptics. Hence, the need for mtdev dependency.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-driver/xf86-input-synaptics_1.6.2.bb      |    4 ++--
 .../xorg-driver/xf86-input-synaptics_git.bb        |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
index 193bd08..8a94bfd 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
@@ -12,11 +12,11 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "9914022a173e3f0ccfe7137ab84f6133"
 SRC_URI[sha256sum] = "c3f7d6a085d480c352f030aeb43db2e5560d1468ed34be24d44a0fc3fda25920"
 
-DEPENDS += "libxi"
+DEPENDS += "libxi mtdev"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
index 3b3db59..73b8089 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
@@ -10,9 +10,9 @@ advanced features of the touchpad to become available."
 
 SRCREV = "934bc0012f948c52aadc8eda912f7728fb7394a2"
 PV = "0.15.2+git${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics;protocol=git"
 S = "${WORKDIR}/git"
 
-DEPENDS += "libxi"
+DEPENDS += "libxi mtdev"
-- 
1.7.9.5



