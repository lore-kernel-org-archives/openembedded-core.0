Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 859E575A22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:54:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 02:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="732871093"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2015 02:53:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 4488A6A4083;
	Tue, 23 Jun 2015 02:53:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:53:01 +0300
Message-Id: <1435053182-8028-6-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 5/6] wic: Make code more pythonic
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
X-List-Received-Date: Tue, 23 Jun 2015 09:54:10 -0000

Used more pythonic way to make a list.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index d5c34b4..47950f8 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -216,23 +216,13 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
         sys.exit(1)
 
-    direct_args = list()
-    direct_args.insert(0, compressor or "")
-    direct_args.insert(0, oe_builddir)
-    direct_args.insert(0, image_output_dir)
-    direct_args.insert(0, wks_file)
-    direct_args.insert(0, rootfs_dir)
-    direct_args.insert(0, bootimg_dir)
-    direct_args.insert(0, kernel_dir)
-    direct_args.insert(0, native_sysroot)
-    direct_args.insert(0, "direct")
-
     if debug:
         msger.set_loglevel('debug')
 
     cr = creator.Creator()
 
-    cr.main(direct_args)
+    cr.main(["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
+             wks_file, image_output_dir, oe_builddir, compressor or ""])
 
     print "\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file
 
-- 
2.1.4


