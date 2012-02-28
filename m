Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2QJk-0007F0-9p
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 17:54:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2012 08:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112278498"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2012 08:45:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 08:45:55 -0800
Message-Id: <1330447555-11029-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] bootimg: Fix Quoting
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
X-List-Received-Date: Tue, 28 Feb 2012 16:54:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/bootimg.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 1d1a3d0..f4981d8 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -35,8 +35,8 @@ ISODIR = "${S}/iso"
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
-EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
-EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
+EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
@@ -52,8 +52,8 @@ def pcbios_class(d):
 		return "syslinux"
 	return "dummy"
 
-PCBIOS = ${@pcbios(d)}
-PCBIOS_CLASS = ${@pcbios_class(d)}
+PCBIOS = "${@pcbios(d)}"
+PCBIOS_CLASS = "${@pcbios_class(d)}"
 
 inherit ${PCBIOS_CLASS}
 inherit ${EFI_CLASS}
-- 
1.7.7.6



