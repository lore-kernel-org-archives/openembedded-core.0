Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B6B6175879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:54:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 02:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="748754121"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2015 02:53:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 1CE566A4083;
	Tue, 23 Jun 2015 02:53:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:52:58 +0300
Message-Id: <1435053182-8028-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/6] wic: Add new argument to wic_create function
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
X-List-Received-Date: Tue, 23 Jun 2015 09:54:07 -0000

Added 'compressor' argument to wic_create to pass a name of
compressor utility to the wic engine.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 29099ee..047c40d 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -179,7 +179,8 @@ def list_source_plugins():
 
 
 def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, scripts_path, image_output_dir, debug):
+               native_sysroot, scripts_path, image_output_dir,
+               compressor, debug):
     """Create image
 
     wks_file - user-defined OE kickstart file
@@ -189,6 +190,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     native_sysroot - absolute path to the build's native sysroots dir
     scripts_path - absolute path to /scripts dir
     image_output_dir - dirname to create for image
+    compressor - compressor utility to compress the image
 
     Normally, the values for the build artifacts values are determined
     by 'wic -e' from the output of the 'bitbake -e' command given an
diff --git a/scripts/wic b/scripts/wic
index 8869fba..f9be972 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -228,7 +228,7 @@ def wic_create_subcommand(args, usage_str):
     print "Creating image(s)...\n"
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                       native_sysroot, scripts_path, image_output_dir,
-                      options.debug)
+                      options.compressor, options.debug)
 
 
 def wic_list_subcommand(args, usage_str):
-- 
2.1.4


