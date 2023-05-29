Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161A7C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:51:25 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.54073.1685379077378273147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=piVpv93h;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-626195b4909so7494926d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685379076; x=1687971076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QfLHRPerr5d67ltwqVDENph+mch9OlohaOENBtNgR4=;
        b=piVpv93hnX+YL5S55Tsm04UEhrKaNaQR2frSaDFo63RGdWGO+ceAs9KKf/sDppSdNS
         AVFDNxSI06sdt5M0nb1VQQtU0DpouJu9UaX/21ZTp4a8EYsfci6R8OcLJ6peliMNQJ5R
         WFBDxN2hmeHmhr+N1lgrtWahzplLhhy+fRpcIs34wjU3TAoMQplC0uD9oXvPgCDss7P+
         +TwFdthxm1YGf9n0IA34oUK224jaiGOkbd8T2GuczpraiCh2IyqVJSYS4BaeCB6YT7V6
         /5nnklrzxXi9cfWrMY+D8OAgUpfnO1btsWDAKE7N4dkdvcENPyZKuH3QbHOxSb/sLPmQ
         aAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685379076; x=1687971076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QfLHRPerr5d67ltwqVDENph+mch9OlohaOENBtNgR4=;
        b=Vmeq8lIZJMncXI4vaaAywu7UV/3Ish3coXCFBCyki6xWEdnZF8cugeTwnOsekvvFbq
         irQezn/5P8yQZg87N3JJs8BIeOsJUcH5dLvnV2KZr4Tdk1MrUmD3cbpgToxLJHgY9y5K
         gzs9IceSBsOPkz2qvGg5wzvPTH5ntpt0Poq3LoAHjeItrNlwj4KNrfNUWGxYBWfr2xp1
         WbdrgGLKzcJI5iF5GtiIFPUbWEIqC0/OQbXj8Uad1GWZ5x5lYMLO25dG2nlQe2xeSdug
         yzzVXBeAN/x0WI+SIVX2PPHm7yk4ZlF1Vr/I6XsI6fIgpcSmI/AXpu3hDOiqg+xYovrJ
         nwpg==
X-Gm-Message-State: AC+VfDw2Q2BBAa9Vxm9WejS2Gl+3SnFBGgDSPzGkwuP8j8WuA8yOHy0Z
	RrNnouwYRn7htnetbKe/rlJYdbZI1JKGlA==
X-Google-Smtp-Source: ACHHUZ6Cz1+arjQPtQ0OkuCUpn3vyvPGotR41mCgY7GMwsm0o28W4tAQsIhcDlsYQEKIGPRu0MmPHQ==
X-Received: by 2002:a05:6214:cae:b0:626:24aa:87ef with SMTP id s14-20020a0562140cae00b0062624aa87efmr3690373qvs.62.1685379076303;
        Mon, 29 May 2023 09:51:16 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id q20-20020ad44354000000b0062596d5b6a0sm3897474qvs.54.2023.05.29.09.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:51:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [mickledore 5/6] linux-yocto/5.15: update to v5.15.112
Date: Mon, 29 May 2023 12:51:10 -0400
Message-Id: <20230529165111.3511561-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529165111.3511561-1-bruce.ashfield@gmail.com>
References: <20230529165111.3511561-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181890

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    9d6bde853685 Linux 5.15.112
    0788273bd0a6 drm/amd/display: Fix hang when skipping modeset
    de9a3ed42333 RISC-V: Fix up a cherry-pick warning in setup_vm_final()
    3c9b08a16978 drbd: correctly submit flush bio on barrier
    d0bcf6caa280 serial: 8250: Fix serial8250_tx_empty() race with DMA Tx
    0b401c2cccc5 drm/msm/adreno: adreno_gpu: Use suspend() instead of idle() on load error
    8beaa3cb293a ext4: fix invalid free tracking in ext4_xattr_move_to_block()
    978e5e9111af ext4: remove a BUG_ON in ext4_mb_release_group_pa()
    2b3b8f18c0dc ext4: bail out of ext4_xattr_ibody_get() fails for any reason
    f22b274429e8 ext4: add bounds checking in get_max_inline_xattr_value_size()
    640c8c365999 ext4: fix deadlock when converting an inline directory in nojournal mode
    b2531936118d ext4: improve error handling from ext4_dirhash()
    b2f1314e6e36 ext4: improve error recovery code paths in __ext4_remount()
    5f7d66e5e557 ext4: check iomap type only if ext4_iomap_begin() does not fail
    f5e687698c6d ext4: fix data races when using cached status extents
    6d9a705a653e ext4: avoid a potential slab-out-of-bounds in ext4_group_desc_csum
    d55e76e11592 ext4: fix WARNING in mb_find_extent
    c5c385baee9b locking/rwsem: Add __always_inline annotation to __down_read_common() and inlined callers
    ed76d3a8910b ksmbd: not allow guest user on multichannel
    4f9baa066749 ksmbd: fix deadlock in ksmbd_find_crypto_ctx()
    bc77a6e93306 ksmbd: fix racy issue while destroying session on multichannel
    a89ff57e4da1 ksmbd: fix kernel oops from idr_remove()
    876a7e3b58e3 ksmbd: add channel rwlock
    05cbc9806ae8 ksmbd: replace sessions list in connection with xarray
    f86a1a74d9a7 ksmbd: fix multi session connection failure
    bb3b772f186c ksmbd: set RSS capable in FSCTL_QUERY_NETWORK_INTERFACE_INFO
    2456e2889c77 wifi: rtw88: rtw8821c: Fix rfe_option field width
    615aff165bda drm/amd/display: Add NULL plane_state check for cursor disable logic
    c11b90aced1a drm/amd/display: Refine condition of cursor visibility for pipe-split
    bf16debcda5c drm/msm/adreno: fix runtime PM imbalance at gpu load
    bac00e57cd5e drm/msm: Remove struct_mutex usage
    17eeeac92b47 drm/i915/dg2: Add HDMI pixel clock frequencies 267.30 and 319.89 MHz
    6d5e6d5a70e2 drm/i915/dg2: Add additional HDMI pixel clock frequencies
    06af228515d1 drm/i915/dg2: Support 4k@30 on HDMI
    a63c6b1eed9a ASoC: soc-pcm.c: call __soc_pcm_close() in soc_pcm_close()
    aa803e6ecac7 ASoC: DPCM: Don't pick up BE without substream
    44b685c4bab3 ASoC: soc-pcm: Move debugfs removal out of spinlock
    0d5017dea0c6 ASoC: soc-compress: Inherit atomicity from DAI link for Compress FE
    a536c367b0d8 ASoC: soc-pcm: Fix DPCM lockdep warning due to nested stream locks
    e2e5b8c72998 fs/ntfs3: Refactoring of various minor issues
    5047a228d4c8 HID: wacom: insert timestamp to packed Bluetooth (BT) events
    db587340a004 HID: wacom: Set a default resolution for older tablets
    823787470e32 drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in suspend
    b39ba90d69ee drm/amdgpu: Fix vram recover doesn't work after whole GPU reset (v2)
    cd3c0f7013c3 drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling legacy gfx ras
    6d4b6abedd2d drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
    db307e725d5b drm/amd/display: fix flickering caused by S/G mode
    61b694b742fb drm/panel: otm8009a: Set backlight parent to panel device
    8f57f3e112cf f2fs: fix potential corruption when moving a directory
    e2d1cc82ad50 drm/msm: fix NULL-deref on irq uninstall
    8f0e1ad5327a drm/msm: fix NULL-deref on snapshot tear down
    74543041c03e drm/bridge: lt8912b: Fix DSI Video Mode
    9d79ccd97199 ARM: dts: s5pv210: correct MIPI CSIS clock name
    137259261cd0 ARM: dts: exynos: fix WM8960 clock name in Itop Elite
    eb15fb94d44a remoteproc: imx_rproc: Call of_node_put() on iteration error
    de26e064ed9e remoteproc: st: Call of_node_put() on iteration error
    8915e44eb3fb remoteproc: stm32: Call of_node_put() on iteration error
    975b80702f0e sh: nmi_debug: fix return value of __setup handler
    66dbc361214d sh: init: use OF_EARLY_FLATTREE for early init
    bb870c4b73d2 sh: mcount.S: fix build error when PRINTK is not enabled
    be95f9ebaf10 sh: math-emu: fix macro redefined warning
    9fdf3666e3f1 SMB3: force unmount was failing to close deferred close files
    c3a0ae5259ea smb3: fix problem remounting a share after shutdown
    17ad86d8c122 inotify: Avoid reporting event with invalid wd
    e51cd74e32d2 platform/x86: touchscreen_dmi: Add info for the Dexp Ursus KX210i
    21de866f75de platform/x86: touchscreen_dmi: Add upside-down quirk for GDIX1002 ts on the Juno Tablet
    5af78b437cd3 cifs: release leases for deferred close handles when freezing
    f43b5573cddc cifs: fix pcchunk length type in smb2_copychunk_range
    69dfa5a2e89d btrfs: fix space cache inconsistency after error loading it from disk
    e0710a49799f btrfs: print-tree: parent bytenr must be aligned to sector size
    bcc401bb8678 btrfs: zero the buffer before marking it dirty in btrfs_redirty_list_add
    f264be24146b btrfs: don't free qgroup space unless specified
    29478148bb3b btrfs: fix encoded write i_size corruption with no-holes
    91f585024e3e btrfs: zoned: fix wrong use of bitops API in btrfs_ensure_empty_zones
    77c6323dad14 btrfs: fix btrfs_prev_leaf() to not return the same key twice
    b13e20cc58e4 perf stat: Separate bperf from bpf_profiler
    2baa45d8f55e perf evlist: Refactor evlist__for_each_cpu()
    871149abc1b9 perf symbols: Fix return incorrect build_id size in elf_read_build_id()
    f716374c4e21 crypto: engine - fix crypto_queue backlog handling
    fa4e304bbd8a crypto: engine - Use crypto_request_complete
    e7ce4ba11635 crypto: api - Add scaffolding to change completion function signature
    a8cc4d5adfe5 crypto: engine - check if BH is disabled during completion
    7b36a06bacf7 crypto: sun8i-ss - Fix a test in sun8i_ss_setup_ivs()
    b6e2d1e253a4 perf map: Delete two variable initialisations before null pointer checks in sort__sym_from_cmp()
    4f128167e64b perf pmu: zfree() expects a pointer to a pointer to zero it after freeing its contents
    e685e2e2bd14 perf vendor events power9: Remove UTF-8 characters from JSON files
    a6ef72c38c23 perf scripts intel-pt-events.py: Fix IPC output for Python 2
    53f7b55f6b3a net: enetc: check the index of the SFI rather than the handle
    a0cb00295dbe virtio_net: suppress cpu stall when free_unused_bufs
    b4e16ea5f146 virtio_net: split free_unused_bufs()
    f495e435e588 net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
    dfad4eb4c4d8 ALSA: caiaq: input: Add error handling for unsupported input methods in `snd_usb_caiaq_input_init`
    10c5ea39573d drm/amdgpu: add a missing lock for AMDGPU_SCHED
    54c466c60e23 af_packet: Don't send zero-byte data in packet_sendmsg_spkt().
    c177dd465f5c ionic: catch failure from devlink_alloc
    da81af0ef809 ethtool: Fix uninitialized number of lanes
    27b0d1b81f82 ionic: remove noise from ethtool rxnfc error msg
    d37f6a832331 octeontx2-vf: Detach LF resources on probe cleanup
    00e985958b3e octeontx2-pf: Disable packet I/O for graceful exit
    b5ad803dec80 octeontx2-af: Skip PFs if not enabled
    e39148d3d719 octeontx2-af: Secure APR table update with the lock
    a895ab54afce rxrpc: Fix hard call timeout units
    f5b44b2a17ca sfc: Fix module EEPROM reporting for QSFP modules
    98a20dceddf6 r8152: move setting r8153b_rx_agg_chg_indicate()
    4fbf19a5bd31 r8152: fix the poor throughput for 2.5G devices
    d0ebe36065a8 r8152: fix flow control issue of RTL8156A
    55aeff5361e6 net/sched: act_mirred: Add carrier check
    59bf62f0ed7e RISC-V: mm: Enable huge page support to kernel_page_present() function
    cc4ae807dbef watchdog: dw_wdt: Fix the error handling path of dw_wdt_drv_probe()
    b36cc1c39448 writeback: fix call of incorrect macro
    f98f2ac30f75 net: dsa: mv88e6xxx: add mv88e6321 rsvd2cpu
    56444f30619b selftests: srv6: make srv6_end_dt46_l3vpn_test more robust
    c5ce7c4517d6 sit: update dev->needed_headroom in ipip6_tunnel_bind_dev()
    cb145932fcf6 net/sched: cls_api: remove block_cb from driver_list before freeing
    480577d419f9 net/ncsi: clear Tx enable mode when handling a Config required AEN
    5e756a59cee6 scsi: qedi: Fix use after free bug in qedi_remove()
    fd6204d7724a drm/hyperv: Don't overwrite dirt_needed value set by host
    f8d9e062a695 fs/ntfs3: Fix null-ptr-deref on inode->i_op in ntfs_lookup()
    ce30b2f48b65 ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE
    74201b3c3e52 ASoC: soc-pcm: test refcount before triggering
    2cf8c9f883de ASoC: soc-pcm: serialize BE triggers
    703ebcf64aac ASoC: soc-pcm: Fix and cleanup DPCM locking
    c474bb800000 ASoC: soc-pcm: align BE 'atomicity' with that of the FE
    13390bea97a4 ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure
    25361a0155a1 mailbox: zynqmp: Fix counts of child nodes
    f9dd36311bd5 mailbox: zynq: Switch to flexible array to simplify code
    2343385fe6ee bus: mhi: host: Range check CHDBOFF and ERDBOFF
    a7561c04adb1 bus: mhi: host: Use mhi_tryset_pm_state() for setting fw error state
    7517f62ea073 bus: mhi: host: Remove duplicate ee check for syserr
    9fbf10148f31 bus: mhi: Move host MHI code to "host" directory
    43b2f7d69069 ubifs: Fix memory leak in do_rename
    9933a9086cea ubifs: Fix AA deadlock when setting xattr for encrypted file
    21ad89e197dd crypto: ccp - Clear PSP interrupt status register before calling handler
    93f8b664031b ring-buffer: Ensure proper resetting of atomic variables in ring_buffer_reset_online_cpus

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a7f72e6eaf..e2915849bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b7b557241341ae3bd6dc793eac41232739778578"
-SRCREV_meta ?= "e316987285bb86fec4c567569c4977d264599c0a"
+SRCREV_machine ?= "2424be7d485ac0bbcbca912b1a6cd4a79e5bab38"
+SRCREV_meta ?= "397c9face7f492ea6c6047499afcf6ef387d0513"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.111"
+LINUX_VERSION ?= "5.15.112"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index a90c417eda..41e656293d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.111"
+LINUX_VERSION ?= "5.15.112"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a2c822d25ca2ddf1df5317a88d2319cb50330de4"
-SRCREV_meta ?= "e316987285bb86fec4c567569c4977d264599c0a"
+SRCREV_machine ?= "b521a0dd3eb1941526d1cc853a81c60182f08e10"
+SRCREV_meta ?= "397c9face7f492ea6c6047499afcf6ef387d0513"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d88759d986..7f236d3753 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6bea924ca14afde95155405061b7a38698b627bb"
-SRCREV_machine:qemuarm64 ?= "61af9ffc157af5a77c0df7f2a9c672e96d2dbbd9"
-SRCREV_machine:qemumips ?= "44a1952d813a46156aa652da567537a4c49cd257"
-SRCREV_machine:qemuppc ?= "931fcfcbb0537ff882718af07d0941ac4d571361"
-SRCREV_machine:qemuriscv64 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
-SRCREV_machine:qemuriscv32 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
-SRCREV_machine:qemux86 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
-SRCREV_machine:qemux86-64 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
-SRCREV_machine:qemumips64 ?= "081f014de8e7c8ff3627e54fdd5149f573df34e9"
-SRCREV_machine ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
-SRCREV_meta ?= "e316987285bb86fec4c567569c4977d264599c0a"
+SRCREV_machine:qemuarm ?= "9d59e27807dc264aa457efb8f808d5d246af0de2"
+SRCREV_machine:qemuarm64 ?= "795baaef531bf613f908372e46f0aa02e7f0c033"
+SRCREV_machine:qemumips ?= "240c1a6921778edceeddb57c666c1ad39eb99ab8"
+SRCREV_machine:qemuppc ?= "e62acaa3576f120915a766812d4f57e9b472d132"
+SRCREV_machine:qemuriscv64 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
+SRCREV_machine:qemuriscv32 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
+SRCREV_machine:qemux86 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
+SRCREV_machine:qemux86-64 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
+SRCREV_machine:qemumips64 ?= "943c52494237f510c59592bc3c10858b1fde736c"
+SRCREV_machine ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
+SRCREV_meta ?= "397c9face7f492ea6c6047499afcf6ef387d0513"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b0ece631f84a3e70341496b000b094b7dfdf4e5f"
+SRCREV_machine:class-devupstream ?= "9d6bde853685609a631871d7c12be94fdf8d912e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.111"
+LINUX_VERSION ?= "5.15.112"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


