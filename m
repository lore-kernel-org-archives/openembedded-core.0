Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29E8578650
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w17so3368638pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9utHWFgNUseXEQKQ/Z6z/APvkJZkU/hYtLoHBX43Kb4=;
	b=OPsSgtMeLYsisHAxlfxZzNLAcNJ//07odNy1PA4kyjJ+m++ZUKyKF9983g13HQYh5H
	sti18jS6yuVLHA5LmaW9nfJZwxzJxwIgh5mokD5k9va2MU7aHkBWQ7xcysI2IIzue3sq
	fD4OeiwvoTyipt7ZLOxj6fvdv1NOe4MLNxl9JEVF2Ex+OsU5JOomCF0rfQ1WA8iyKIMz
	hVXNfpKHJqvx3AuhQ/yDwHeaYRJ3sV/wuSC+AT9v1ktgm6lJxWE/bxmsW423/dJ/Pjqo
	rERPtnlp1pvCixvJM91bQwmgkjs9+s1RUwVCw2rktSw5ocRpcr0oKbUrA1QNe3dq0WR0
	Q41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9utHWFgNUseXEQKQ/Z6z/APvkJZkU/hYtLoHBX43Kb4=;
	b=JU0MRyHGf7Mt/0dYg9s1AP1x/YLDuxp/aMktCLafK5t1kTH7thGMM9iP29v5MiHxo+
	dqulYFSzhLkPYJZczBqp8oQ334yw8RNt55fST3g/A7R17DxATGNDLFuaUdoDNMQk4TG/
	Z9JJwbbrY4n2LGXknTCDsoHg7kpDZBYWuySW4wpR/SbVj4WQ5rJLyxx3VdltvnwL8Ozu
	S5hGShtBjvJ2R3LVZyOdWU85fs5txMvtLnzJ1aSjjBKhj2BrzUwXgabLWRgkzO1wndki
	amPBfwe7l/snigxbN2QhVY7eR+hgKTyTauEkWvWk2dlY7LPc1flvZ/A3F6gALbbATyyB
	jxJA==
X-Gm-Message-State: AKwxyteLbDfqBE5dR2BDwgE99SlN0IInJ2lD9ayjvoECnS+uEfT1p4xR
	efBLg4iVSXK8Jb1HdeOwW6cJWA==
X-Google-Smtp-Source: AH8x22730yRChoXaIBUSnrKMrdwPFHqNTt7sWInhZL63Am1IHS0ntS5glzYRU3HEJ/qi7P0jRgP0yA==
X-Received: by 10.99.178.85 with SMTP id t21mr19608150pgo.296.1517196451850;
	Sun, 28 Jan 2018 19:27:31 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	y5sm29184689pfd.163.2018.01.28.19.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:15 -0800
Message-Id: <87d8a8cef974e8bf73f67e51a4cc7c32f60bd86b.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517196242.git.raj.khem@gmail.com>
References: <cover.1517196242.git.raj.khem@gmail.com>
Subject: [PATCH 4/8] e2fsprogs: 1.43.7 -> 1.43.8
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:31 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade e2fsprogs from 1.43.7 to 1.43.8.
Backport patch to fix build on BE systems

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-build-failure-in-swapfs.c-on-big-endia.patch | 40 ++++++++++++++++++++++
 ...s-fix-missing-check-for-permission-denied.patch | 10 ++++--
 .../{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb}   |  5 +--
 3 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb} (96%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
new file mode 100644
index 0000000000..ff1284edc4
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
@@ -0,0 +1,40 @@
+From ae6603206176b771c9ed1f82569f68fc1257f014 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Wed, 3 Jan 2018 01:32:02 -0500
+Subject: [PATCH] libext2fs: fix build failure in swapfs.c on big-endian
+ systems
+
+Addresses-Debian-Bug: #886119
+
+Reported-by: James Clarke <jrtc27@debian.org>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+---
+Upstream-Status: Backport
+
+ lib/ext2fs/swapfs.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ext2fs/swapfs.c b/lib/ext2fs/swapfs.c
+index 6e5cff97..b13dc422 100644
+--- a/lib/ext2fs/swapfs.c
++++ b/lib/ext2fs/swapfs.c
+@@ -19,6 +19,7 @@
+ 
+ #include "ext2_fs.h"
+ #include "ext2fs.h"
++#include "ext2fsP.h"
+ #include <ext2fs/ext2_ext_attr.h>
+ 
+ #ifdef WORDS_BIGENDIAN
+@@ -358,7 +359,7 @@ void ext2fs_swap_inode_full(ext2_filsys fs, struct ext2_inode_large *t,
+ 	if (inode_includes(inode_size, i_projid))
+                 t->i_projid = ext2fs_swab16(f->i_projid);
+ 	/* catch new static fields added after i_projid */
+-	EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
++	EXT2FS_BUILD_BUG_ON(sizeof(struct ext2_inode_large) != 160);
+ 
+ 	i = sizeof(struct ext2_inode) + extra_isize + sizeof(__u32);
+ 	if (bufsize < (int) i)
+-- 
+2.16.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 33054c61fa..69c09bc1d7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,3 +1,6 @@
+From c7914309aeee6209ddb6995c084805a911d9cc82 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
 
 If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied problem,
@@ -10,15 +13,16 @@ Upstream-Status: Pending
 Written-by: Henrik Wallin <henrik.b.wallin@ericsson.com>
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  lib/support/profile.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/support/profile.c b/lib/support/profile.c
-index 51a3314..1c1039f 100644
+index 9e96673b..32d83002 100644
 --- a/lib/support/profile.c
 +++ b/lib/support/profile.c
-@@ -335,7 +335,7 @@ profile_init(const char **files, profile_t *ret_profile)
+@@ -335,7 +335,7 @@ profile_init(const char * const *files, profile_t *ret_profile)
  				*last = new_file;
  				last = &new_file->next;
  			}
@@ -28,5 +32,5 @@ index 51a3314..1c1039f 100644
  			goto errout;
  
 -- 
-2.7.4
+2.16.1
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
similarity index 96%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index 168eecfe8e..b5cfc6810b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -7,11 +7,12 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
-"
+            file://0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch \
+            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
 
-SRCREV = "4c5e6cd6defb83f1b35a5ef6fccd68c86874ee06"
+SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.16.1


