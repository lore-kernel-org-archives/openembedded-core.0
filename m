Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5756D6067C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 13:20:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 08 Dec 2016 05:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,319,1477983600"; d="scan'208";a="1069598230"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 08 Dec 2016 05:20:07 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DEB0A6A4080;
	Thu,  8 Dec 2016 05:19:20 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 15:19:55 +0200
Message-Id: <1481203195-14338-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: rename command line option -p -> -s
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
X-List-Received-Date: Thu, 08 Dec 2016 13:20:06 -0000

Short variant of wic command line option --skip-build-check
is incorretly named -p. It's named -s in wic help and Yocto
documentation.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index fe2c33f..1ad1666 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -107,7 +107,7 @@ def wic_create_subcommand(args, usage_str):
     parser.add_option("-n", "--native-sysroot", dest="native_sysroot",
                       help="path to the native sysroot containing the tools "
                            "to use to build the image")
-    parser.add_option("-p", "--skip-build-check", dest="build_check",
+    parser.add_option("-s", "--skip-build-check", dest="build_check",
                       action="store_false", default=True, help="skip the build check")
     parser.add_option("-f", "--build-rootfs", action="store_true", help="build rootfs")
     parser.add_option("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
-- 
2.1.4


