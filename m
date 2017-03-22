Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B137E77B7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190251; x=1521726251;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DqaAsptBlCPAt+95+ZoJlAco+frG/3pg9R1fem8143k=;
	b=xz1FcpvMv0lpHGdeks9jI6efaYHjLawWCQI/TA89TqGvXV1ZTrIX8dGq
	aU2QAAS7vshp3JjTaEVagZShK5LbsA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="63641998"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2017 06:44:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7B86C2C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:44:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:30 +0200
Message-Id: <ca7b81dd4a82d6d1a6c6ef612ab93ee2beb01e02.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/10] wic: remove empty plugin methods
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:10 -0000

Removed do_install_disk and do_configure_partition methods from
bootimage-partition, fsimage and rawcopy plugins as they're empy
and not used.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 20 --------------------
 scripts/lib/wic/plugins/source/fsimage.py           | 19 -------------------
 scripts/lib/wic/plugins/source/rawcopy.py           | 19 -------------------
 3 files changed, 58 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 4afc8a2..13fddbd 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -44,26 +44,6 @@ class BootimgPartitionPlugin(SourcePlugin):
     name = 'bootimg-partition'
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image. Do nothing.
-        """
-        pass
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(). Possibly prepare
-        configuration files of some sort.
-
-        """
-        pass
-
-    @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 8fbe44d..f781499 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -32,25 +32,6 @@ class FSImagePlugin(SourcePlugin):
     name = 'fsimage'
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image. Do nothing.
-        """
-        pass
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(). Possibly prepare
-        configuration files of some sort.
-        """
-        pass
-
-    @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 431afce..e1c4f5e 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -33,25 +33,6 @@ class RawCopyPlugin(SourcePlugin):
     name = 'rawcopy'
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image. Do nothing.
-        """
-        pass
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(). Possibly prepare
-        configuration files of some sort.
-        """
-        pass
-
-    @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
-- 
2.1.4


