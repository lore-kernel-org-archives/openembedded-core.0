Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 82D526E5FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 14:32:27 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 09 Dec 2016 06:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="40619029"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 09 Dec 2016 06:32:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 155966A4006;
	Fri,  9 Dec 2016 06:31:37 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 16:32:08 +0200
Message-Id: <1481293928-8104-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-setup-builddir: create usage output
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
X-List-Received-Date: Fri, 09 Dec 2016 14:32:29 -0000

Created usage output for oe-setup-builddir script.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-setup-builddir | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index e53f73c..ef49551 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -23,6 +23,14 @@ if [ -z "$BUILDDIR" ]; then
     exit 1
 fi
 
+if [ "$1" = '--help' -o "$1" = '-h' ]; then
+    echo 'Usage: oe-setup-builddir'
+    echo ''
+    echo "OpenEmbedded setup-builddir - setup build directory $BUILDDIR"
+    echo ''
+    exit 2
+fi
+
 mkdir -p "$BUILDDIR/conf"
 
 if [ ! -d "$BUILDDIR" ]; then
-- 
2.1.4


