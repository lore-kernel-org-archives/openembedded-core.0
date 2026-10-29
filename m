Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4415.1793244347285196558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JlrUSBjc;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53fdd2fb171so17200611cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244346; x=1793849146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iu3jXj0445Z2IQjVjx18RtNXkWNNf2fl6bFvz5wBLqI=;
        b=JlrUSBjc1xhbhhKeBUsU8GabEbPwwvaEUAAVFsGDXCDaJSfRHtweKfJrcoPkKHy8IP
         FOQZSrBbuhqDrztESmzQjlcWZlrDwDtv7IiRGDUYnI+KPXWnpGoNCQuiHJOB9JCd1s0c
         r3ncRImzTtxG3HwZjGJSxvcAaGjifH9xTyJwOpY97za1xtVvOhzUCjRQj+G27uffqFZ2
         D+YtW93Q38lzs9nraFx0jaqZ21Lh1llbqxKMbgChBBEzvNOh04GVs7LT8+vT5zLlEk9z
         q1nnsBKMRjN9uEEQiO9mFaYJXAmTUDWCJrvYSwC+9wlXrHgGsw62dGwRInkb9WqU0tNG
         vdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244346; x=1793849146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iu3jXj0445Z2IQjVjx18RtNXkWNNf2fl6bFvz5wBLqI=;
        b=gIFN+pZjLDgMgIKOMWh8RmGkvCPI+8GZ6Ddbhov1xgTnITvXVUfFgQ/Sl1OnClxxOs
         hfuVqyxKBMi0B5WIU/hxKP6kuoJDjTh5LRacFA9JPSyfDwLLL246stAP89U6ZtPUObJd
         F8PCN0iIPXNuJFGB3ZN2WmAWLZCY7mOW2Rav6F7gBW1hoJure4Jme4R7cI1W5S//3XVe
         Dg1ST0gP0BlpgtRpxupRsVDXU+XDaY4Wck9lAcAtSIS11rpULGYKTi1ujWJqB4UW7+qK
         O5uwSfALdEjnAf5NaGDJXLRb7tShCxiKY7kic1M46reXraZIYS7GveAWTbaZdFitlAPG
         cnGQ==
X-Gm-Message-State: AFq9FYLe3psBWeWiCb+5NDFbw04c3Uwv1G6Zn9rIlNWG6FLivMWCkFCh
	h/cAo4ZB45lW4IQWub4dVxnPgoro6FG31TfhvyqrhQcCs/HtOmkpqox2x0UbyWhu
X-Gm-Gg: AYBFou1Dji5UzsJE0BCZVZD/AVINt7uQbO8VdiLvZdsqyQ2/xAqT6MP8v4PUAJY1oF6
	CgxjL/wWMAgM9Hn/B6SMlcLewxWTIhFXLGGw1Ow1WmntlsvS4gCj3NAI9+D/jM/e4S0/LH47yhJ
	34EVT4yNlndxBjAxkaL34U16BhFiL0qUmouFfPaOQ0YMf+PWk72BSk2WODEs7rnt5MVXKYJ8wJO
	OWeoeD435WpbSkGhxdVcoi77qmbgrH4abvuM1pSzH3h/whChEeC8x4gqDsHRcKwaOcfwvBNzi0C
	0GVLC/3QVSA9L0rYCbKxnAsL6tPn+wxIUAw9Q+pmDkG0nG8Cf80hzKGaLs1jVAzQD8XB4tknt+9
	1Ko0pAau/OLFBzdRHzcSlAoHqUVCkbDkPKDlRGq03I/68Qm/T6gwaTmNoGhzkSeBJrvhqmzliA7
	Myi5K76K5AUNa56QgkCOHMIjMw5gzXpchjrpdxCJlTuaCKHDMY8c9AkoZeS/Sg4SfoKGCInwhvD
	NnnmTJKmBOBuV69y9Y82DzTn6NvFCLNYu7lTy8JnCQhmOhh4fJBgy8/gGp/5qsrKo8pNWl5MC+b
	nvPocudwrtLfQQ3vzN6aEuqevPt1sxvH5+ujYUWp/WZDDxeH5ztqAzAglxAQWcNr38MNk327g7R
	MJmSpWCa7Arq9dMzWJ88FuaZH1wVKHCDkZ1mGCBbnVeBJjy0KNmeKVI3EVlS+LParIgQs5a6udn
	hIy62wLJZoCHTPHJbWHv5HaxfjdZhsxQWs1KxSdEf66jncVg==
X-Received: by 2002:a05:622a:489:b0:537:83e9:b0e6 with SMTP id d75a77b69052e-53fcb509fe2mr73901551cf.26.1793244346005;
        Wed, 28 Oct 2026 20:25:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 07/11] linux-yocto/7.2: yaffs2: backport upstream fixes and restore remount handling
Date: Wed, 28 Oct 2026 23:25:22 -0400
Message-ID: <20261029032527.3150782-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
References: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248864
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/7 [
    Author: george pee
    Email: georgepee@gmail.com
    Subject: fs/yaffs2: hold gross lock across rename link-count update
    Date: Tue, 27 Oct 2026 12:08:20 -0400

    yaffs_rename() dropped the yaffs gross lock before calling
    inode_dec_link_count() on the replaced target. Another thread can delete
    that inode in the window and NULL new_dentry->d_inode, giving:

      Unable to handle kernel NULL pointer dereference at virtual address 0000002c
      drop_nlink+0x4/0x3c
      yaffs_rename+0xd9/0x144
      vfs_rename2+0x2d9/0x63c

    Keep the gross lock held until after the link count is updated, and drop
    it on both the success and -ENOTEMPTY paths.

    Backport of yaffs2 upstream commit 5b23c73940bab871c0b4c9d89be349a4e325ec92
    ("Increase scope of yaffs gross lock to avoid race and kernel panic"),
    adapted to the single fs/yaffs2/yaffs_vfs.c in linux-yocto.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/7 [
    Author: Charles Manning
    Email: cdhmanning@gmail.com
    Subject: fs/yaffs2: fix size of unmanaged temp buffer allocation
    Date: Tue, 27 Oct 2026 12:08:41 -0400

    When all managed temp buffers are in use, yaffs_get_temp_buffer() falls
    back to kmalloc()ing an unmanaged one sized data_bytes_per_chunk. Callers
    such as yaffs_tags_marshall_read() read total_bytes_per_chunk into a temp
    buffer, which is larger when inband tags are in use, so the fallback
    buffer could be overrun. Allocate total_bytes_per_chunk to match the
    managed buffers.

    Backport of yaffs2 upstream commit c5d2e7ac441855236e39fff1f0de899e20676dc9
    ("yaffs_guts.c Fix size of allocated buffer for unmanaged buffers").

    Signed-off-by: Charles Manning <cdhmanning@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/7 [
    Author: Charles Manning
    Email: cdhmanning@gmail.com
    Subject: fs/yaffs2: release temp buffers on read failure paths
    Date: Tue, 27 Oct 2026 12:08:42 -0400

    yaffs_check_obj_details_loaded() and yaffs_tags_marshall_read() take a
    temp buffer but return early on a failed chunk read without releasing it,
    leaking a managed buffer slot (or an unmanaged allocation) on every I/O
    error. Release the buffer before returning.

    Backport of yaffs2 upstream commit 42909262aa6077a60cf18dac024fd21df3b4b18a
    ("Fix unmatched temporary buffer allocations").

    Signed-off-by: Charles Manning <cdhmanning@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

4/7 [
    Author: Charles Manning
    Email: cdhmanning@gmail.com
    Subject: fs/yaffs2: clear ll_init on deinitialise
    Date: Tue, 27 Oct 2026 12:08:55 -0400

    yaffs_deinitialise() tears the device down and clears is_mounted, but
    leaves ll_init set, so a subsequent initialise can believe the low-level
    layer is still set up. Clear it alongside is_mounted.

    Backport of yaffs2 upstream commit 89c47bd92c6accf5955184ba65742b20523b05a9
    ("Clear ll_init flag during de-initialisation").

    Signed-off-by: Charles Manning <cdhmanning@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

5/7 [
    Author: Charles Manning
    Email: cdhmanning@gmail.com
    Subject: fs/yaffs2: fix inverted tags_marshall_query_block return value
    Date: Tue, 27 Oct 2026 12:08:56 -0400

    drv_check_bad_fn() returns YAFFS_OK for a good block, but
    yaffs_tags_marshall_query_block() treated 0 (YAFFS_FAIL) as success, so
    it reported YAFFS_FAIL for good blocks and YAFFS_OK for bad ones. No
    caller currently uses the return value (block state is passed back via
    *state), so this is benign, but return the check result directly.

    Backport of yaffs2 upstream commit b19d3c9f0ada46534e44308f72d7e70ab1e301ee
    ("Begign bug: Fix incorrect return value").

    Signed-off-by: Charles Manning <cdhmanning@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

6/7 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: fs/yaffs2: restore remount handling via fs_context reconfigure
    Date: Tue, 27 Oct 2026 12:09:34 -0400

    The v7.0 conversion to the init_fs_context mount API removed
    .remount_fs from yaffs_super_ops but did not add a .reconfigure
    fs_context operation. As a result a remount (e.g. "mount -o remount,rw")
    never reached yaffs: dev->read_only kept its mount-time value, and
    yaffs_remount_fs() was left as an unused static function.

    Add yaffs_reconfigure() to yaffs_context_ops so a remount updates
    dev->read_only from fc->sb_flags, forcing SB_RDONLY when the MTD is not
    writeable (as the old remount_fs did), and drop the dead
    yaffs_remount_fs(). Use the already-attached MTD via yaffs_dev_to_mtd()
    instead of re-looking it up with get_mtd_device(), which leaked a
    reference on every remount.

    Fixes: 3fa3b91cc457 ("fs/yaffs2: convert to init_fs_context mount API for v7.0")
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

7/7 [
    Author: Charles Manning
    Email: cdhmanning@gmail.com
    Subject: fs/yaffs2: run deferred cleanup when remounting read-write
    Date: Tue, 27 Oct 2026 12:10:08 -0400

    When yaffs is mounted read-only, the post-scan cleanup in
    yaffs_guts_initialise() (strip deleted objects, fix hanging objects,
    empty lost+found) is skipped because those helpers bail on read_only.
    Nothing ran it later on a remount to read-write, so the deferred cleanup
    never happened, and the background GC thread was not started (or stopped
    on a rw->ro remount).

    Factor the cleanup into yaffs_guts_cleanup() and, in the remount path,
    run it under the gross lock and start the background thread on a ro->rw
    transition; stop the background thread on rw->ro.

    Backport of yaffs2 upstream commit 334eb5fc4472c791e4c4ce6d50e650d2b2732f02
    ("Handle cleanup when remounting rw after mounting read-only"), adapted
    from the old super_operations.remount_fs hook to the fs_context
    .reconfigure operation used since v7.0.

    Signed-off-by: Charles Manning <cdhmanning@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 47485ec357..57c0c0bed0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b2410aefa90e15be14e40b6bccefe2ce851a4ab8"
-SRCREV_meta ?= "51d958a0fd6defff09334b8f0b8153f08dd6d011"
+SRCREV_machine ?= "ac271024979d3c7473f3222e7cf094c34a693865"
+SRCREV_meta ?= "b4b30a9da6e99401a3e93f63887030b4bcd6e8c0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index ea8a041a78..3764ed259b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_meta ?= "51d958a0fd6defff09334b8f0b8153f08dd6d011"
+SRCREV_machine ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_meta ?= "b4b30a9da6e99401a3e93f63887030b4bcd6e8c0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index a3722fae67..770d748a7e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "dfbf2e8d1519edb0313dcc58694958e4f5cf7547"
-SRCREV_machine:qemuarm64 ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_machine:qemuloongarch64 ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
+SRCREV_machine:qemuarm ?= "8fd75fc8ff0e240e41bcd79b6562a456af29eb58"
+SRCREV_machine:qemuarm64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemuloongarch64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_machine:qemuriscv64 ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_machine:qemuriscv32 ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_machine:qemux86 ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_machine:qemux86-64 ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
+SRCREV_machine:qemuppc ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemuriscv64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemuriscv32 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemux86 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemux86-64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "d8a1dcb03afa51d75734c4a4646ba853bf3151b9"
-SRCREV_meta ?= "51d958a0fd6defff09334b8f0b8153f08dd6d011"
+SRCREV_machine ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_meta ?= "b4b30a9da6e99401a3e93f63887030b4bcd6e8c0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0

