Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9FF72F1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:30:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 07:30:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="227958634"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2017 07:30:12 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 33E556A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:30:10 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:23:07 +0200
Message-Id: <900dba94edfcd467402362d6fe66319d2afa6f62.1487690169.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487690169.git.ed.bartosh@linux.intel.com>
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/6] wic: use image recipe sysroot as default
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
X-List-Received-Date: Tue, 21 Feb 2017 15:30:11 -0000

Switched from using wic-tools recipe sysroot to using
image sysroot in wic script. This way is more logical
and consistent with the way wic uses other artifacts.

[YOCTO #11017]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index f32cb19..99721dc 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -190,7 +190,7 @@ def wic_create_subcommand(args, usage_str):
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE",
-                                         "wic-tools", cache=False)
+                                         options.image_name) #, cache=False)
     else:
         if options.build_rootfs:
             raise WicError("Image name is not specified, exiting. "
-- 
2.1.4


