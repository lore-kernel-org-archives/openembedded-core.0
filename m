Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW168-0002Fr-3w
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500619"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:27 -0700
Message-Id: <2c24d5e1e1d81ceda9f1dc6f1a0be90fc5c6dc28.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [*RFC CONSOLIDATED PULL RFC* 17/23] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:08 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

The ext3 format is pretty much mandatory for qemu usage, so always create it.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 9ef242f..e908f69 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
 MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
 
-IMAGE_FSTYPES ?= "tar.bz2 ext3"
+IMAGE_FSTYPES += "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
 
-- 
1.7.3.4



