Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 734B2737EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:29:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2015 04:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="709844659"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Apr 2015 04:29:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id A21AD6A408D;
	Tue,  7 Apr 2015 04:29:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 14:29:25 +0300
Message-Id: <1428406165-20618-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: code cleanup: bad indentation
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
X-List-Received-Date: Tue, 07 Apr 2015 11:29:29 -0000

Fixed pylint warning 'Bad indentation'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index feff302..524156d 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -69,8 +69,8 @@ def callback_rootfs_dir(option, opt, value, parser):
     if '=' in value:
         (key, rootfs_dir) = value.split('=')
     else:
-       key = 'ROOTFS_DIR'
-       rootfs_dir = value
+        key = 'ROOTFS_DIR'
+        rootfs_dir = value
 
     parser.values.rootfs_dir[key] = rootfs_dir
 
@@ -207,8 +207,8 @@ def wic_create_subcommand(args, usage_str):
 
     krootfs_dir = options.rootfs_dir
     if krootfs_dir is None:
-         krootfs_dir = {}
-         krootfs_dir['ROOTFS_DIR'] = rootfs_dir
+        krootfs_dir = {}
+        krootfs_dir['ROOTFS_DIR'] = rootfs_dir
 
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
-- 
2.1.4


