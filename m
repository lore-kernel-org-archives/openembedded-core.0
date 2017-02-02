Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A33C71DA5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:55:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 02 Feb 2017 05:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="38781334"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2017 05:55:57 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 648A36A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 05:54:57 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 15:32:59 +0200
Message-Id: <c4cafae51559e41d596ef50da48014e54ee38b72.1486041986.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486041986.git.ed.bartosh@linux.intel.com>
References: <cover.1486041986.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/3] wic: get rid of image_output_dir variable
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
X-List-Received-Date: Thu, 02 Feb 2017 13:55:57 -0000

Used options.outdir instead of image_output_dir.
There is no sense to use extra variable for this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 33355ee..17e8231 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -203,10 +203,6 @@ def wic_create_subcommand(args, usage_str):
                   "kickstart (.wks) filename)\n" % args[0])
             sys.exit(1)
 
-    image_output_dir = ""
-    if options.outdir:
-        image_output_dir = options.outdir
-
     if not options.image_name:
         rootfs_dir = ''
         if 'ROOTFS_DIR' in options.rootfs_dir:
@@ -254,7 +250,7 @@ def wic_create_subcommand(args, usage_str):
 
     print("Creating image(s)...\n")
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                      native_sysroot, scripts_path, image_output_dir,
+                      native_sysroot, scripts_path, options.outdir,
                       options.compressor, options.bmap, options.debug)
 
 
-- 
2.1.4


