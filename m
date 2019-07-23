Return-Path: <daniel.ammann@bytesatwork.ch>
X-Greylist: delayed 466 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Jul 2019 10:21:23 UTC
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6477D58A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 10:21:23 +0000 (UTC)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net
	[83.150.40.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: daniel)
	by bytesatwork.ch (Postfix) with ESMTPSA id DCCA3101C2A74;
	Tue, 23 Jul 2019 12:13:36 +0200 (CEST)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2019 12:13:34 +0200
Message-Id: <20190723101334.5337-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] image_types: Remove remnants of hdddirect
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
X-List-Received-Date: Tue, 23 Jul 2019 10:21:23 -0000

hdddirect was removed in commit 929ba563f1bc7195c4981b8e139c432b2cc388ea.

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta/classes/image_types.bbclass | 2 +-
 meta/classes/syslinux.bbclass    | 5 -----
 scripts/runqemu                  | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index fd98a7d1bd..617aa4ccd8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -324,7 +324,7 @@ RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
 
 # bmap requires python3 to be in the PATH
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 031dacbf7d..894f6b3718 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -75,11 +75,6 @@ syslinux_hddimg_install() {
 	syslinux ${IMGDEPLOYDIR}/${IMAGE_NAME}.hddimg
 }
 
-syslinux_hdddirect_install() {
-	DEST=$1
-	syslinux $DEST
-}
-
 python build_syslinux_cfg () {
     import copy
     import sys
diff --git a/scripts/runqemu b/scripts/runqemu
index 4079f2b17d..3aa74f3d6d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -188,7 +188,7 @@ class BaseConfig(object):
         self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
-        self.vmtypes = ('hddimg', 'hdddirect', 'iso')
+        self.vmtypes = ('hddimg', 'iso')
         self.fsinfo = {}
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
         # Use different mac section for tap and slirp to avoid
-- 
2.11.0


