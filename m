Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A688A6EE8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:08:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 23:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,511,1389772800"; d="scan'208";a="458638486"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.1])
	by orsmga001.jf.intel.com with ESMTP; 19 Feb 2014 23:08:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 23:08:25 -0800
Message-Id: <1392880105-22054-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] runqemu-export-rootfs: Fix missing # in comment
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
X-List-Received-Date: Thu, 20 Feb 2014 07:08:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu-export-rootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 79403ab..40ab201 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -121,7 +121,7 @@ case "$1" in
 		echo "Error starting nfsd"
 		exit 1
 	fi
-	 Check to make sure everything started ok.
+	# Check to make sure everything started ok.
 	if [ ! -f $NFSPID ]; then
 		echo "rpc.nfsd did not start correctly"
 		exit 1
-- 
1.8.3.1


