Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 662DC6FA91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Mar 2014 04:30:07 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id rd3so4052263pab.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Mar 2014 21:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MF8B5pjS8+gX4iZAZlXwDNcQjJkIhvNeiO4GNXi+uwI=;
	b=xUgMTYv9Y9Wk3cB2tedmpd+7HkOIK1qwcNmHNdYL7v2feK/o+gbBwSnNng16L1DBvu
	19rorFbpDRqV2iTaNtLCu17jDRFZFOlwbb+w+94c7c8Nd6yj3pUJlgAh3pw6ORekogw9
	Z/QvLU9CapEplbG6zVdveU+7MgIRmvOPUpvvevqic85CK/n+1LbW3Pj0AjICzc7C1sAY
	juFuiQRtUy0RjF9WhR/mlei4wxuDtkPd+nw0UHom22e7ojOI5scDUgS7gNujKqf8gUkU
	g/oOuSim3yeQvQAr42yGbfpfZV5r/QHQAhDxJaAAdEMTnJ3Gf4vyKX7sHluKr0Rgjhd4
	l51Q==
X-Received: by 10.68.227.4 with SMTP id rw4mr64828384pbc.3.1395549007771;
	Sat, 22 Mar 2014 21:30:07 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ei4sm18623323pbb.42.2014.03.22.21.30.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Mar 2014 21:30:07 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Mar 2014 15:35:53 +1100
Message-Id: <1395549353-9920-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] busybox: disable fsck.minix and mkfs.minix
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
X-List-Received-Date: Sun, 23 Mar 2014 04:30:08 -0000

The MINIX and MINIX 2 filesystems are not really used anymore.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 20cd147..47eca21 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -556,10 +556,10 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FINDFS is not set
 CONFIG_FLOCK=y
 # CONFIG_FREERAMDISK is not set
-CONFIG_FSCK_MINIX=y
+# CONFIG_FSCK_MINIX is not set
 # CONFIG_MKFS_EXT2 is not set
-CONFIG_MKFS_MINIX=y
-CONFIG_FEATURE_MINIX2=y
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
 # CONFIG_MKFS_REISER is not set
 # CONFIG_MKFS_VFAT is not set
 # CONFIG_GETOPT is not set
-- 
1.9.0


