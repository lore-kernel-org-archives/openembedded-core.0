Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4989A731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 30 Aug 2016 02:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; 
   d="scan'208";a="2629191"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2016 02:31:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 88D3B6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:36 +0300
Message-Id: <420378ded741a0df6a317b66f8fedb3f7f081425.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/18] image.bbclass: deploy images to DEPLOYDIR
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:10 -0000

Changed deployment directory from DEPLOY_DIR_IMAGE to DEPLOYDIR
to make sstate machinery to do final deployment and generate
manifest.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c06dee2..82a07d5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -440,7 +440,7 @@ python () {
             cmds.append("\t" + image_cmd)
         else:
             bb.fatal("No IMAGE_CMD defined for IMAGE_FSTYPES entry '%s' - possibly invalid type name or missing support class" % t)
-        cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
+        cmds.append(localdata.expand("\tcd ${DEPLOYDIR}"))
 
         # Since a copy of IMAGE_CMD_xxx will be inlined within do_image_xxx,
         # prevent a redundant copy of IMAGE_CMD_xxx being emitted as a function.
@@ -558,7 +558,7 @@ python set_image_size () {
 #
 python create_symlinks() {
 
-    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
+    deploy_dir = d.getVar('DEPLOYDIR', True)
     img_name = d.getVar('IMAGE_NAME', True)
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
-- 
2.1.4


