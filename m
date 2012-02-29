Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1S2XSN-0001pP-1b
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 01:31:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 16:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="112841783"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.126])
	by orsmga001.jf.intel.com with ESMTP; 28 Feb 2012 16:23:18 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:23:16 -0800
Message-Id: <0d6796d36dede0968c1f164e05f9be2969f3b29d.1330474667.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330474667.git.elizabeth.flanagan@intel.com>
References: <cover.1330474667.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] bootimg.bbclass: Quoting fixes
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
X-List-Received-Date: Wed, 29 Feb 2012 00:31:47 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

More quoting issues during an fri build. Fixing as per standard.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/bootimg.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 1d1a3d0..dd37034 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -35,8 +35,8 @@ ISODIR = "${S}/iso"
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
-EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
-EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
+EFI = '${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}'
+EFI_CLASS = '${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}'
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
@@ -52,8 +52,8 @@ def pcbios_class(d):
 		return "syslinux"
 	return "dummy"
 
-PCBIOS = ${@pcbios(d)}
-PCBIOS_CLASS = ${@pcbios_class(d)}
+PCBIOS = '${@pcbios(d)}'
+PCBIOS_CLASS = '${@pcbios_class(d)}'
 
 inherit ${PCBIOS_CLASS}
 inherit ${EFI_CLASS}
-- 
1.7.1



