Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TvD3O-00087L-8i
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:24:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2013 12:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="244286484"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2013 12:08:45 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 22:08:47 +0200
Message-Id: <1358280527-14078-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH V4 3/3] qemu: machine override ability added
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
X-List-Received-Date: Tue, 15 Jan 2013 20:24:43 -0000

Add override ability to qemu to allow qemu specific
configurations for any qemu machine.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/machine/include/qemu.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 5d59a7f..c1012ab 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
+MACHINEOVERRIDES .= ":qemuall"
+
 IMAGE_FSTYPES += "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
-- 
1.7.10.4



