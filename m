Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EBFFE771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 24 Jan 2017 06:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="217011586"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2017 06:06:45 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 13FA26A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:05:47 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:49 +0200
Message-Id: <e73446f7723dc99082425b561677c2b10eaa34a3.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/8] wic: change default output directory
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:11 -0000

Set default output directory to current dir.

[YOCTO #10783]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index 8918cb4..54cbe96 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -88,7 +88,7 @@ def wic_create_subcommand(args, usage_str):
     """
     parser = optparse.OptionParser(usage=usage_str)
 
-    parser.add_option("-o", "--outdir", dest="outdir",
+    parser.add_option("-o", "--outdir", dest="outdir", default='.',
                       help="name of directory to create image in")
     parser.add_option("-e", "--image-name", dest="image_name",
                       help="name of the image to use the artifacts from "
-- 
2.1.4


