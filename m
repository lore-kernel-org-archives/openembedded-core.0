Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CADDB71BC4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 15:27:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 08 Dec 2016 07:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="200470675"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2016 07:27:37 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EC2106A4080;
	Thu,  8 Dec 2016 07:26:50 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 17:27:23 +0200
Message-Id: <1481210843-15173-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-run-native: standardize usage output
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
X-List-Received-Date: Thu, 08 Dec 2016 15:27:37 -0000

Made usage output of oe-run-native to look similar to the
output of other oe scripts.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-run-native | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 496e34f..7e26ea3 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -22,8 +22,15 @@
 #
 
 if [ $# -lt 1 -o "$1" = '--help' -o "$1" = '-h' ] ; then
-    echo "Usage: $0 <native tool> [parameters]"
-    exit 1
+    echo 'oe-run-native: error: the following arguments are required: <native tool>'
+    echo 'Usage: oe-run-native tool [parameters]'
+    echo ''
+    echo 'OpenEmbedded run-native - runs native tools'
+    echo ''
+    echo 'arguments:'
+    echo '  tool                Native tool to run'
+    echo ''
+    exit 2
 fi
 
 SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
-- 
2.1.4


