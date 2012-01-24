Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpVXg-000194-JJ
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 02:51:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2012 17:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99817350"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.67])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2012 17:43:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 17:43:35 -0800
Message-Id: <1327369415-15572-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH] qemuimage-testlib: rename qemuppc image
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
X-List-Received-Date: Tue, 24 Jan 2012 01:51:24 -0000

A recent set of changes changed the kernel name from bzImage to vmlinux,
this test needs to change also.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/qemuimage-testlib |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index d0d1b74..222e363 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -440,9 +440,9 @@ Test_Create_Qemu()
 	
 	if [ "$QEMUARCH" = "qemux86" -o "$QEMUARCH" = "qemux86-64" ]; then
 		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k bzImage -a ${QEMUARCH})
-	elif [ "$QEMUARCH" = "qemuarm" -o "$QEMUARCH" = "spitz" -o "$QEMUARCH" = "borzoi" -o "$QEMUARCH" = "akita" -o "$QEMUARCH" = "nokia800" -o "$QEMUARCH" = "qemuppc" ]; then
+	elif [ "$QEMUARCH" = "qemuarm" -o "$QEMUARCH" = "spitz" -o "$QEMUARCH" = "borzoi" -o "$QEMUARCH" = "akita" -o "$QEMUARCH" = "nokia800" ]; then
 		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k zImage -a ${QEMUARCH})
-	elif [ "$QEMUARCH" = "qemumips" ]; then
+	elif [ "$QEMUARCH" = "qemumips" -o "$QEMUARCH" = "qemuppc" ]; then
 		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k vmlinux -a ${QEMUARCH})
 	fi
 
-- 
1.7.6.5



