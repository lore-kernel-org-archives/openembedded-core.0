Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UUQO0-00070C-PA
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 01:43:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 16:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,529,1363158000"; d="scan'208";a="299349133"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2013 16:25:16 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 16:27:38 -0700
Message-Id: <509f81736f95919be413293c2286c739da1de06f.1366673258.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Darren Hart <dvhart@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Look for RTL license in the right directory
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
X-List-Received-Date: Mon, 22 Apr 2013 23:43:18 -0000

The rtl-license package FILES was pointing to the wrong directory as it
was removed from there in commit:

acd3735 linux-firmware: Remove duplicaed license from rtlwifi subdir

This resulted in a do_rootfs failure for core-image-sato-sdk for fri2
with ipk when the linux-firmware-dev package tried to install
linux-firmware-rtl-license which wasn't created as it was empty.

Tested on core-image-sato-sdk build for fri2 on dylan commit:
789b2b7e0cca404ff8ba8ed5ba823d215e6ba5b4

Cc: Saul Wold <sgw@linux.intel.com>
Cc: Beth Flanagan <elizabeth.flanagan@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ef036cf..414f47a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -94,7 +94,7 @@ FILES_${PN}-sd8686 = " \
 "
 
 FILES_${PN}-rtl-license = " \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+  /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
-- 
1.7.5.4



