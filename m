Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R7XUM-0008R9-Qd
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Sep 2011 21:02:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2011 11:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,435,1312182000"; d="scan'208";a="20265178"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.14])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2011 11:56:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Sep 2011 11:56:48 -0700
Message-Id: <49ad7b987ee2f2d89abeb9bd73416ddfad7b871c.1316890497.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316890497.git.sgw@linux.intel.com>
References: <cover.1316890497.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316890497.git.sgw@linux.intel.com>
References: <cover.1316890497.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] qemuimage-testlib: set a default geometry for xterm
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
X-List-Received-Date: Sat, 24 Sep 2011 19:02:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/qemuimage-testlib |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 9ffaa7c..ee9450e 100644
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -467,8 +467,8 @@ Test_Create_Qemu()
 		export MACHINE=$QEMUARCH
 
 		# Create Qemu in localhost VNC Port 1
-		echo "Running xterm -display ${DISPLAY} -e 'TMPDIR=${TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60' &"
-	    	xterm -display ${DISPLAY} -e "TMPDIR=${TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60" &
+		echo "Running xterm -geometry 80x24+10+10 -ls -display ${DISPLAY} -e 'TMPDIR=${TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60' &"
+	    	xterm -geometry 80x24+10+10 -ls -display ${DISPLAY} -e "TMPDIR=${TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60" &
 	
 		# Get the pid of the xterm processor, which will be used in Test_Kill_Qemu
 		PID=$!
-- 
1.7.6



