Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D9DFE6BE64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 14:58:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Sep 2013 07:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,866,1371106800"; d="scan'208";a="357896259"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.38])
	by azsmga001.ch.intel.com with ESMTP; 09 Sep 2013 07:58:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Mon,  9 Sep 2013 07:58:37 -0700
Message-Id: <c5ef7706ea79bf327809ef89d054ed439ba36256.1378738373.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1378738373.git.sgw@linux.intel.com>
References: <cover.1378738373.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] qemu.inc: remove apm as a MACHINE_FEATURE
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
X-List-Received-Date: Mon, 09 Sep 2013 14:58:41 -0000

APM is not only obsolete, but requires a kernel config enabled and is meaningless for QEMU VM

[YOCTO #5121]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 545f8d1..95d7e66 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -11,7 +11,7 @@ XSERVER ?= "xserver-xorg \
             xf86-video-fbdev \
             xf86-input-keyboard"
 
-MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
+MACHINE_FEATURES = "alsa pcmcia bluetooth irda usbgadget screen"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-- 
1.8.3.1


