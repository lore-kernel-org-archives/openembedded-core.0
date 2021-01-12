Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web08.17421.1610489655965797103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 14:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZjFyeD51;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id d9so7483734iob.6
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 14:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dAVVno/+CeazdBi13ouoC5MDhkdkd6vbFgfbbLjbf68=;
        b=ZjFyeD51d58bEL/N9dAV4Eo4qIJpF+djgIwbxnmea/QtEVw6+hqDZcTkwTMxlJkJLm
         znrNY3q613ZvhmFtw/gMdmoNOU6Xzgv9cQoXVMb2cx2Vp5ffKYOYdkR/14QCd4kze2rj
         xusYwB2ryOBs0sbbvfWqbbCPxIA3nmqmC67Mi9dDnFoELDo3bNE70bWSPHCR28bKIaOb
         5VN/9rCYuU9XHLQk89Bi0MQTPhpp92Gj2gMgoCkyS56oigUvVX++r7MQtUqG7iu+2/r/
         jItDIHR1ZJ/V1oP7fE7odV55kvae1BuFRcAwhz1Crtd7VV9JgbcwO/2SYWYypd+DoyL1
         QZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dAVVno/+CeazdBi13ouoC5MDhkdkd6vbFgfbbLjbf68=;
        b=q5KRk387Oq9xts+k2YJkfyFthxWcMN4zFWzvmrAfWU9oQ0OIYc3oXsoJwvsin8juCK
         VS1YAuq8ICWjKRbl2gXaWLRcswQHjscB7INU+HiGV1JhdsFHByS02EB0MvPMqp6zsaPB
         P7lru/n/U71hynWoYFHLQtzS38//L3Xxfn1kfZaDgIv2ECOd3K/AOcBuKn0sZeXGur9+
         dqitlUIgQRrixbG0+8uL5X+ztbSDlZzpyVCYKiv4LSeBhUOrnAXUVVE2BdORPapftFe1
         IWMjHNlXw0ikcIoB8E0SXPfn+yXlHff7UrK4p9qTgqrUTrm9FUivuppIV2bosfx++UWB
         mXAQ==
X-Gm-Message-State: AOAM533+KAyF4ulrZEN0EXOSRyGtps8Kq7iXLwhSvurSz+rzYmKmL9Fw
	pAhImDcT7sfSdJMr/uvUC7n6TvTdRxXj9A==
X-Google-Smtp-Source: ABdhPJyp7VdUyLWh6hk3M7sUkzmvDn3G2LfgG6D9kfcw9PDOH4wqD9XKIExUROhi0j1F9Ci7YRteyQ==
X-Received: by 2002:a92:d210:: with SMTP id y16mr1245971ily.97.1610489655381;
        Tue, 12 Jan 2021 14:14:15 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id s10sm62356iob.4.2021.01.12.14.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 14:14:14 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.10: update to v5.10.5
Date: Tue, 12 Jan 2021 17:14:08 -0500
Message-Id: <242020c083b3719cad83eaca9e7d3a5e319289c8.1610489445.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1610489445.git.bruce.ashfield@gmail.com>
References: <cover.1610489445.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    f5247949c0a9 Linux 5.10.5
    12d377b93eef device-dax: Fix range release
    aceb8ae8e3b1 ext4: avoid s_mb_prefetch to be zero in individual scenarios
    aff18aa806fd dm verity: skip verity work if I/O error when system is shutting down
    610d2fa0ec76 ALSA: pcm: Clear the full allocated memory at hw_params
    c7b04d27c910 io_uring: remove racy overflow list fast checks
    13f9eec22973 s390: always clear kernel stack backchain before calling functions
    330c1ee7d593 tick/sched: Remove bogus boot "safety" check
    9b22bc0f1663 drm/amd/display: updated wm table for Renoir
    86be0f2a0ef9 ceph: fix inode refcount leak when ceph_fill_inode on non-I_NEW inode fails
    8bcfa178f92a NFSv4.2: Don't error when exiting early on a READ_PLUS buffer overflow
    ef3b9ad967d0 um: ubd: Submit all data segments atomically
    a8b49c4bdf87 um: random: Register random as hwrng-core device
    0aa2eecf8534 watchdog: rti-wdt: fix reference leak in rti_wdt_probe
    eae1fb3bc565 fs/namespace.c: WARN if mnt_count has become negative
    b1e155ccc882 powerpc/64: irq replay remove decrementer overflow check
    8b5b2b768344 module: delay kobject uevent until after module init call
    db6129f6ad88 f2fs: fix race of pending_pages in decompression
    ee3f8aefd037 f2fs: avoid race condition for shrinker count
    3c0f0f5f58a7 NFSv4: Fix a pNFS layout related use-after-free race when freeing the inode
    06ac2ca0989d i3c master: fix missing destroy_workqueue() on error in i3c_master_register
    498d90690f24 powerpc: sysdev: add missing iounmap() on error in mpic_msgr_probe()
    acc3c8cc27a8 rtc: pl031: fix resource leak in pl031_probe
    26058c397b9f quota: Don't overflow quota file offsets
    bb2ab902f6f0 module: set MODULE_STATE_GOING state when a module fails to load
    0ad9a6e6139d rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
    b5a2f093b6b1 io_uring: check kthread stopped flag when sq thread is unparked
    908030501772 fcntl: Fix potential deadlock in send_sig{io, urg}()
    721972b8665f ext4: check for invalid block size early when mounting a file system
    8ed894f1117e bfs: don't use WARNING: string when it's just info.
    fb05e983eaf7 ALSA: rawmidi: Access runtime->avail always in spinlock
    cf7fe671cd7e ALSA: seq: Use bool for snd_seq_queue internal flags
    1c5a034710da f2fs: fix shift-out-of-bounds in sanity_check_raw_super()
    2b56f16e3487 media: gp8psk: initialize stats at power control logic
    f290cffdf761 misc: vmw_vmci: fix kernel info-leak by initializing dbells in vmci_ctx_get_chkpt_doorbells()
    a021b6696132 reiserfs: add check for an invalid ih_entry_count
    397971e1d891 fbcon: Disable accelerated scrolling
    df83b9b67449 Bluetooth: hci_h5: close serdev device and free hu in h5_close
    9d4053cfb3f3 scsi: cxgb4i: Fix TLS dependency
    fdac87be009f zlib: move EXPORT_SYMBOL() and MODULE_LICENSE() out of dfltcc_syms.c
    bf81221a40fa cgroup: Fix memory leak when parsing multiple source parameters
    9154d2eeb4f5 tools headers UAPI: Sync linux/const.h with the kernel headers
    e8afbbac2f68 uapi: move constants from <linux/kernel.h> to <linux/const.h>
    ce00a7d0d952 io_uring: fix io_sqe_files_unregister() hangs
    b25b86936a8d io_uring: add a helper for setting a ref node
    25a2de679b5d io_uring: use bottom half safe lock for fixed file data
    7247bc60e8e1 io_uring: don't assume mm is constant across submits
    a5184f3cc284 lib/zlib: fix inflating zlib streams on s390
    98b57685c26d mm: memmap defer init doesn't work as expected
    df73c80338ef mm/hugetlb: fix deadlock in hugetlb_cow error path
    092898b070e0 scsi: block: Fix a race in the runtime power management code
    1a58c171a523 opp: Call the missing clk_put() on error
    e8322837a2e5 opp: fix memory leak in _allocate_opp_table
    c6dd62c14b32 spi: dw-bt1: Fix undefined devm_mux_control_get symbol
    6d63cc42bb8f jffs2: Fix NULL pointer dereference in rp_size fs option parsing
    58dc34446c52 jffs2: Allow setting rp_size to zero during remounting
    52504a61ab99 io_uring: close a small race gap for files cancel
    8b8a688260b4 drm/amd/display: Add get_dig_frontend implementation for DCEx
    5ef98378eff8 md/raid10: initialize r10_bio->read_slot before use.
    62162b322364 ethtool: fix string set id check
    95fcb69c491e ethtool: fix error paths in ethnl_set_channels()
    aeab3d7a04f8 mptcp: fix security context on server socket
    a969a632cbe7 net/sched: sch_taprio: reset child qdiscs before freeing them

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index dccebbf6e7..4d315941fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1dcdbc5795a354afb36900b5b3708068d61524b5"
-SRCREV_meta ?= "28606a1711047b0d6e0fb6deb5bf185492081fe2"
+SRCREV_machine ?= "82503751a7af71b460e6a605641cff377332c058"
+SRCREV_meta ?= "78dd53c2257380d5b8ef13e4ddae25c585154dac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.4"
+LINUX_VERSION ?= "5.10.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index cefabfbff4..107d7f1364 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.4"
+LINUX_VERSION ?= "5.10.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e6e2b3380857eddf0f15546273733dfe2628bfdb"
-SRCREV_machine ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_meta ?= "28606a1711047b0d6e0fb6deb5bf185492081fe2"
+SRCREV_machine_qemuarm ?= "e3cf3a0ff5a5e85395d8cf2aeab350ac518679c6"
+SRCREV_machine ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_meta ?= "78dd53c2257380d5b8ef13e4ddae25c585154dac"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e4ebcca125..7ac84d1b1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "57796ff5e0c7fca8fb83590131281555ed9f9a8b"
-SRCREV_machine_qemuarm64 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_machine_qemumips ?= "bc1695e59cf55c6484d48cf4c71a3c183ab1073f"
-SRCREV_machine_qemuppc ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_machine_qemuriscv64 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_machine_qemux86 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_machine_qemux86-64 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_machine_qemumips64 ?= "0a302891f926c1b0d7be0c67c66d6780499d83ee"
-SRCREV_machine ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
-SRCREV_meta ?= "28606a1711047b0d6e0fb6deb5bf185492081fe2"
+SRCREV_machine_qemuarm ?= "f31d1514bbe9d450b69e3101e260524b82e8626d"
+SRCREV_machine_qemuarm64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_machine_qemumips ?= "1e1e4a362640c2f385c2b093c5971ec7d9a0b238"
+SRCREV_machine_qemuppc ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_machine_qemuriscv64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_machine_qemux86 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_machine_qemux86-64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_machine_qemumips64 ?= "a019b338648b95aa4d679ffdc01878dc660bcbac"
+SRCREV_machine ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
+SRCREV_meta ?= "78dd53c2257380d5b8ef13e4ddae25c585154dac"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.4"
+LINUX_VERSION ?= "5.10.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

