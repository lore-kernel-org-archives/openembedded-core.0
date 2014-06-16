Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0F46FED6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjY79013095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:30 +0800
Message-ID: <93ba2af3e4e47c86e9dfac2790f81a3718fecef6.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] busybox: enable uuid support by default
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
X-List-Received-Date: Mon, 16 Jun 2014 10:45:33 -0000
Content-Type: text/plain

This patch enables several configuration items to enable UUID support
by default. This makes busybox's `mount' able to deal with /etc/fstab
with lines such as "UUID=xxx / ext4 defaults 0 1".

The CONFIG_FEATURE_VOLUMEID_XXX configuration items need to be enabled,
otherwise, the `mount' command from busybox cannot get UUID of the
corresponding filesystems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig |   38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 47eca21..8a79fde 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -576,13 +576,13 @@ CONFIG_LOSETUP=y
 # CONFIG_LSPCI is not set
 # CONFIG_LSUSB is not set
 CONFIG_MKSWAP=y
-# CONFIG_FEATURE_MKSWAP_UUID is not set
+CONFIG_FEATURE_MKSWAP_UUID=y
 CONFIG_MORE=y
 CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
+CONFIG_FEATURE_MOUNT_LABEL=y
 CONFIG_FEATURE_MOUNT_NFS=y
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
@@ -608,23 +608,23 @@ CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
 # CONFIG_VOLUMEID is not set
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
-# CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
-# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
+CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_BTRFS=y
+CONFIG_FEATURE_VOLUMEID_REISERFS=y
+CONFIG_FEATURE_VOLUMEID_FAT=y
+CONFIG_FEATURE_VOLUMEID_HFS=y
+CONFIG_FEATURE_VOLUMEID_JFS=y
+CONFIG_FEATURE_VOLUMEID_XFS=y
+CONFIG_FEATURE_VOLUMEID_NTFS=y
+CONFIG_FEATURE_VOLUMEID_ISO9660=y
+CONFIG_FEATURE_VOLUMEID_UDF=y
+CONFIG_FEATURE_VOLUMEID_LUKS=y
+CONFIG_FEATURE_VOLUMEID_LINUXSWAP=y
+CONFIG_FEATURE_VOLUMEID_CRAMFS=y
+CONFIG_FEATURE_VOLUMEID_ROMFS=y
+CONFIG_FEATURE_VOLUMEID_SYSV=y
+CONFIG_FEATURE_VOLUMEID_OCFS2=y
+CONFIG_FEATURE_VOLUMEID_LINUXRAID=y
 
 #
 # Miscellaneous Utilities
-- 
1.7.9.5


