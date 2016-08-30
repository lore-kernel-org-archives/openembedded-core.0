Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2471A738AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 30 Aug 2016 02:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="162395264"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2016 02:31:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 220D66A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:54 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:42 +0300
Message-Id: <8e130a56b862146308bb027d91c32ca223e2cf06.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/18] rootfs-postcommands.bbclass: generate manifest in DEPLOYDIR
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:15 -0000

Updated manifest path as deployment directory is changed
from DEPLOY_DIR_IMAGE to DEPLOYDIR.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index b38b6a5..f8a63b0 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -15,7 +15,7 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
 # Write manifest
-IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
+IMAGE_MANIFEST = "${DEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
@@ -217,7 +217,7 @@ python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
 
-    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
+    deploy_dir = d.getVar('DEPLOYDIR', True)
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
 
-- 
2.1.4


