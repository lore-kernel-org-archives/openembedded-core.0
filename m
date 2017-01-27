Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C65C8774C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 27 Jan 2017 12:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="218484526"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jan 2017 12:43:17 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6B1DC6A4082
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:19 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:48 +0200
Message-Id: <507d4056d829958f0e5297df006981d4ce27b26d.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 11/11] isoimage-isohybrid: renamed variable hdd_dir
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:17 -0000

Renamed variable hdd_dir to deploy_dir as this variable is
assigned to the value of DEPLOY_DIR_IMAGE.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index e4637a3..bceaa84 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -249,7 +249,7 @@ class IsoImagePlugin(SourcePlugin):
         part.rootfs_dir = rootfs_dir
 
         # Prepare rootfs.img
-        hdd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+        deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
         img_iso_dir = get_bitbake_var("ISODIR")
         rootfs_img = "%s/rootfs.img" % img_iso_dir
         if not os.path.isfile(rootfs_img):
@@ -282,12 +282,12 @@ class IsoImagePlugin(SourcePlugin):
         # Support using a different initrd other than default
         if source_params.get('initrd'):
             initrd = source_params['initrd']
-            if not hdd_dir:
+            if not deploy_dir:
                 msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-            cp_cmd = "cp %s/%s %s" % (hdd_dir, initrd, cr_workdir)
+            cp_cmd = "cp %s/%s %s" % (deploy_dir, initrd, cr_workdir)
         else:
             # Prepare initial ramdisk
-            initrd = "%s/initrd" % hdd_dir
+            initrd = "%s/initrd" % deploy_dir
             if not os.path.isfile(initrd):
                 initrd = "%s/initrd" % img_iso_dir
             if not os.path.isfile(initrd):
-- 
2.1.4


