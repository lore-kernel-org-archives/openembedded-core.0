Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFtg6-0005Eu-BJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 22:53:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 13:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127622504"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.141])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2012 13:43:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 13:43:56 -0700
Message-Id: <1333658636-12725-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] runqemu-internal: Add console=tty
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
X-List-Received-Date: Thu, 05 Apr 2012 20:53:10 -0000

Adding this to the nfs to match the ext3 kernelcmdline, this re-enables
keyboard input on the qemuppc.

[YOCTO #2058]

Thanks to Yi Zhao <yi.zhao@windriver.com> for the initial patch suggestion

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 92f245a..1831a09 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -404,7 +404,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
             cleanup
             return
         fi
-        KERNCMDLINE="root=/dev/nfs console=ttyS0 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
     fi
 fi
-- 
1.7.7.6



