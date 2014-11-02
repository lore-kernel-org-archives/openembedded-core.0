Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id A4CF370692
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Nov 2014 10:48:44 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id Aaoj1p0080BVjqb01aokWb; Sun, 02 Nov 2014 03:48:45 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Nov 2014 04:48:37 -0600
Message-Id: <1414925318-15353-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1414925318-15353-1-git-send-email-pab@pabigot.com>
References: <1414925318-15353-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 1/2] image_types.bbclass: whitespace and reorder
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
X-List-Received-Date: Sun, 02 Nov 2014 10:48:48 -0000

Use a multi-line value to set IMAGE_TYPES and put all the compressed
versions of a format on one line.  Other than moving ext2.lzma this is
just whitespace.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/image_types.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d298897..42d7231 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -128,7 +128,21 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 jffs2.sum cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz squashfs-lzo ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
+IMAGE_TYPES = " \
+    jffs2 jffs2.sum \
+    cramfs \
+    ext2 ext2.gz ext2.bz2 ext2.lzma \
+    ext3 ext3.gz \
+    btrfs \
+    iso \
+    hddimg \
+    squashfs squashfs-xz squashfs-lzo \
+    ubi ubifs \
+    tar tar.gz tar.bz2 tar.xz tar.lz4 \
+    cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
+    vmdk \
+    elf \
+"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-- 
1.8.5.5


