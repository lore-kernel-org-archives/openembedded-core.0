Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29816.1793868235963211203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=e/cgn3oX;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1406955f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868234; x=1794473034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yn4Dx7Q73l21bwOFjFt2QgchlfF4hwoQm7rtt5agSjY=;
        b=e/cgn3oX6N3+mJTPCS+lcBdIH70Ldn7T/vEQf173xXojWP4fFSTVLQF6hacf/saKJi
         7PhQ4/8HliutNes125XszirDe0qHcKZVYnPWq339eY3/u1p/FSSY7SQQsLqbSadQ3WtR
         xaLdgI+8WIzPfex8ZX14pVBg2uPMHOGyCchfSlVwUSgxBoJ0gnTzp1isG14GRzYmBHG6
         9RLff9F5n2mBU+PNoX3iFhsKE5l0zoCUV5RCDTJcfXKuxA8UwQRH/VoEwd6VTwBHFR/n
         3crMOtPYXhYHALGuHYNPLaerUI6m/yi0gzQAFOIMmMZtDcKyAqfxnaW0fx41fJfsXffm
         3+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868234; x=1794473034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yn4Dx7Q73l21bwOFjFt2QgchlfF4hwoQm7rtt5agSjY=;
        b=XBRogxLdT7CMV5v6p8AWQB/X1/3fwFH0GONkX45TvC+6F7S7y27pHz95a+nfzYpypP
         06gEHAfpDzTie4aVsl7CssuB2qe/CebPZdGSqvJL3Kitgzze2MblbSyHFW2hfsDtSakO
         /NMCzIvEy8JyGN7v2tGoYf6m/Thl0piDarBYgsWGSc3D2BAu6yT8sWAHRlOVN5A0ptry
         rPT7UDinxKaOs+jLLY3AQcZ9vU6aK46sR8EE93QYPNN8xVFKYLhKNP3mtm29PVcG4RP2
         zZ/5uxItUI7JAO/TwBbWVCFZnxat/ZNOU/1LEp4DyxuMYhI1AJigoeu1tJQv67DvAlKc
         zdEg==
X-Gm-Message-State: APuU4Z/5KlXIdDpflsujD/8ykPSreJ+mzKUfef8kl2iod5Fp/GxOGiGQ
	arUsrnL0ylko1BpoCVOkbLfYttyTJ3JXmdJmSor9O6Zh60LUxg9rSBu4Ed7TYX8ulmmIz9PbbKx
	Y+YEiJPQ=
X-Gm-Gg: AYBFou2SCVYPlSp5leCzGeyv74NoAkyZVBUBVesu+4QBWE8UBhwUKvzP/7dFie1zX1e
	Dbr3bMl33jiZdgsQiK4XgCFs4u5l/sfHPqzzyZWljDPTgn1QrWJgC/PTBEI6VFepw4bbgSnrWsw
	25vwBcLiGzybdR6t/qRbUfCoSIDwDIIKTFvFPzF6xbEmnnge7M2E9eety0t4fCveue/NEKKBXYv
	O1fTiBs7Bam5dcejeorbBkX7PWttHe3x1mBHfEUA7MBhIJx2Sc0PtML3JpFHED4+8TQyraPCBXb
	3j7iSnXZPRSrBl1rHkQEDQOWcYL1KL5EwuxApHREXis7q+he0u6Ub9d0XAOMZtftS6tjN79z6P+
	o+vn5pIekNvS8qSBifilI02hTZrpHhK781xaY8AvA99wJSCaWfxPbZh+6CLf44qjWptosrRAhXk
	uOc0Y+SSwgRUMaCA29poIE9Snn4p2vSD4FzpU2/it+89Ecj1uZsy/6Vn5u7JRsfuT/R9N1wOU3Q
	ovjuoRUH0D0o3NzJL0GBRcZwAgcZbDPL0ljHJvgSVFeU8u73eg/lRm38jX4g5l6NIw0O50Mkuv6
	/bHQWWmVwbH3HeWUp3eHZD8KEZ30h44A4TUrEMGxNLEOy/cEi45Ax1XVZ8ol1p8Na4LfaxdaubP
	YzbJP9dOVlFGNbjgq5pIvf3DNF4hwDjbIvqOZ9ozU2MME7aT0ob8=
X-Received: by 2002:a05:6000:2893:b0:48e:5d33:da5c with SMTP id ffacd0b85a97d-48e6e2db4cdmr40744913f8f.1.1793868234009;
        Thu, 05 Nov 2026 00:43:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 29/60] linux-yocto/7.2: yaffs2: backport upstream fixes and restore remount handling
Date: Thu,  5 Nov 2026 09:42:48 +0100
Message-ID: <9e249dd5d49657f908aeee240005d99d0122357e.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249488
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ffd9e055469165d486048cd1f505058dbc35b63)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 47485ec357d..57c0c0bed09 100644
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
index ea8a041a78b..3764ed259b4 100644
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
index a3722fae678..770d748a7ec 100644
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
