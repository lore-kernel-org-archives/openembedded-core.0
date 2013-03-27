Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UKmIR-0001Fi-LH
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 10:05:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Mar 2013 01:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,917,1355126400"; d="scan'208";a="308016444"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2013 01:48:24 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 10:48:23 +0200
Message-Id: <1364374103-12809-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemux86*.conf: replace XSERVER weak assignment with a hard one
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
X-List-Received-Date: Wed, 27 Mar 2013 09:05:41 -0000

Because the qemu.inc is now included before the XSERVER assignment, the
xf86-video-vmware and xf86-video-vmmouse are not built and the X for
qemux86 and qemux86-64 does not start.

[YOCTO #4124]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/conf/machine/qemux86-64.conf |    2 +-
 meta/conf/machine/qemux86.conf    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 90007fb..ff666af 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -14,7 +14,7 @@ KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-XSERVER ?= "xserver-xorg \
+XSERVER = "xserver-xorg \
            mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 7a7cbfd..5f107be 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -14,7 +14,7 @@ KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-XSERVER ?= "xserver-xorg \
+XSERVER = "xserver-xorg \
            mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
-- 
1.7.9.5



