Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1810160DFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 18:31:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2014 10:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,541,1389772800"; d="scan'208";a="487909701"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.165])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2014 10:30:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2014 20:30:47 +0200
Message-Id: <1393353047-23946-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] runqemu: Use readlink instead of realpath
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
X-List-Received-Date: Tue, 25 Feb 2014 18:31:37 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 57c5de4..573def1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -464,7 +464,7 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
 fi
 # ROOTFS is now set for all cases, now expand it to be an absolute path, it should exist at this point
 
-ROOTFS=`realpath $ROOTFS`
+ROOTFS=`readlink -f $ROOTFS`
 
 echo ""
 echo "Continuing with the following parameters:"
-- 
1.8.3.1


