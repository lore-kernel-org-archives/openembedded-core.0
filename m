Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63526C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:24 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.22856.1704169880020355999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N048m6Uj;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-781be0ccd30so161492485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169879; x=1704774679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTCpA1nApdH57bkRNNo3xSUuy+29DeWkb5Pwph0AZZ8=;
        b=N048m6Uj/OAMJ9tDy9VlHfwbrNksa6eHssxYE455C/MQMnFYsfuEkjvspaQ/mcNoHH
         bJZ3hTVtnDugwC1MMJSjLmIXyKdTYhrqYW65A5GorjfD+Wz6ODuEsQTaGpka4stQeUuI
         FGnOphdTQz/ScCE0Tqs/tZmJcqx5kagucHVGSSLVjG1I2Q7QkxlAtAAgxgH44FsKzr17
         TaBNlMe2Lysvau4bJ09r6FKgEvoOQY7QlKITXNWB6WeB4oWgF0m9VgVZRPWtielNx4MG
         lTK6SBLWcNXqaCxH3oTe6S1LoI2DY6Vm0ZZzz11iXSw3Umd8c3eRG4GNSUPsgd0adHKe
         BJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169879; x=1704774679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTCpA1nApdH57bkRNNo3xSUuy+29DeWkb5Pwph0AZZ8=;
        b=ddZmNMOxgfsYQXoCvmN/FHCMzW1BSpyGWMp5A/DjVzwtbHlkekMawSIKs3rTLpey/L
         +UGEGpehdaD2mDktp9fYkDrq/Vd7ciXZgewgR7VvjUrJjgyXmK6cH8JmmTTSH4UGjDHV
         3cQryTrtnAFG4qgPZyfaZVCeuwEc05eyPNmvALA14Mq8kGUWphJVikQDbrpSQNs37+u8
         4Jv+lwLRtq+rUqYKENmTtTyYS01KrdxlfVYFrtd/sEzkk5FijLUQsaalz4agiWg661T4
         jly9R90+i4dHSjxA/F4V16BSeBqiwvIV42eNRiZ5/GtiAEY9/uJMKy91PqelyAEkMzDi
         LGnw==
X-Gm-Message-State: AOJu0YxEJWAgExsPuGrDhJdhoB3zx4QheZtXUArIZGcTsV2V8dLSJASs
	zwuYxqOHSRt1eK5ULeD+k0x3D2nMUPH4D1Tkl3E=
X-Google-Smtp-Source: AGHT+IEk76n+4Z+ohMY+LucG2NbYwEScB0m+NpljJBsoL7mZJd9GnLpX5IBL9bBKSQua7GMAg5OiPw==
X-Received: by 2002:a05:620a:459f:b0:781:511d:9d4 with SMTP id bp31-20020a05620a459f00b00781511d09d4mr16680502qkb.54.1704169878366;
        Mon, 01 Jan 2024 20:31:18 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/6.1: update to v6.1.69
Date: Mon,  1 Jan 2024 23:31:09 -0500
Message-Id: <af8e09f277028c8e4ae0df8f3b77b4202f64b8b3.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193203

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4aa6747d9352 Linux 6.1.69
    325556d46bfd r8152: fix the autosuspend doesn't work
    4c2ad8e39c62 r8152: remove rtl_vendor_mode function
    1d82735f4bae r8152: avoid to change cfg for all devices
    9b3d3a7f3c4d net: tls, update curr on splice as well
    869aee35cf61 ring-buffer: Have rb_time_cmpxchg() set the msb counter too
    c425a772fc58 ring-buffer: Do not try to put back write_stamp
    b15cf1486999 ring-buffer: Fix a race in rb_time_cmpxchg() for 32 bit archs
    edbc03d671f7 ring-buffer: Fix writing to the buffer with max_data_size
    6d98d594a5b6 ring-buffer: Have saved event hold the entire event
    7888b607a981 ring-buffer: Do not update before stamp when switching sub-buffers
    7043c4610ca7 tracing: Update snapshot buffer on resize if it is allocated
    31785cf8171e ring-buffer: Fix memory leak of free page
    8c3b77ad4e91 smb: client: fix OOB in smb2_query_reparse_point()
    d8541c50c671 smb: client: fix NULL deref in asn1_ber_decoder()
    9f528a8e6832 smb: client: fix OOB in receive_encrypted_standard()
    7b0faa541f15 drm/i915: Fix remapped stride with CCS on ADL+
    20907717918f drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
    a9e2de19433f drm/amdgpu: fix tear down order in amdgpu_vm_pt_free
    730b3322b8c3 btrfs: don't clear qgroup reserved bit in release_folio
    9b670e1b644c btrfs: free qgroup reserve when ORDERED_IOERR is set
    da9b7c651c65 mm/shmem: fix race in shmem_undo_range w/THP
    8ec07b0620ac mm/mglru: fix underprotected page cache
    40f3ad769ec8 dmaengine: stm32-dma: avoid bitfield overflow assertion
    78b2ba39beef drm/amdgpu/sdma5.2: add begin/end_use ring callbacks
    6a1472d9be02 team: Fix use-after-free when an option instance allocation fails
    b01af9281851 arm64: mm: Always make sw-dirty PTEs hw-dirty in pte_modify
    0b071a3266a8 ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS
    f2955dd3e933 soundwire: stream: fix NULL pointer dereference for multi_link
    56f762659a5e btrfs: do not allow non subvolume root targets for snapshot
    557f7ad06460 perf: Fix perf_event_validate_size() lockdep splat
    a684235d3035 HID: hid-asus: add const to read-only outgoing usb buffer
    2b9e16bc1ce5 arm64: add dependency between vmlinuz.efi and Image
    6cb0c71c6e7c net: usb: qmi_wwan: claim interface 4 for ZTE MF290
    f7ce765744a3 asm-generic: qspinlock: fix queued_spin_value_unlocked() implementation
    fba6e958caa1 HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
    8f0c8585856c HID: hid-asus: reset the backlight brightness level on resume
    de78e4bdcb5e nbd: pass nbd_sock to nbd_read_reply() instead of index
    d482bb566344 HID: add ALWAYS_POLL quirk for Apple kb
    541b183be92f HID: glorious: fix Glorious Model I HID report
    42b4ab97bee5 platform/x86: intel_telemetry: Fix kernel doc descriptions
    355170a7ecac LoongArch: Implement constant timer shutdown interface
    adb6a907540c LoongArch: Add dependency between vmlinuz.efi and vmlinux.efi
    943cde1f3daa selftests/bpf: fix bpf_loop_bench for new callback verification scheme
    1b40f23e702e nvme: catch errors from nvme_configure_metadata()
    6cb3741c4582 nvme-auth: set explanation code for failure2 msgs
    83bb13bf6c23 nbd: fold nbd config initialization into nbd_alloc_config()
    02a4b14d17ab bcache: avoid NULL checking to c->root in run_cache_set()
    3d3f72efc77d bcache: add code comments for bch_btree_node_get() and __bch_btree_node_alloc()
    bc17ec4215e2 bcache: remove redundant assignment to variable cur_idx
    be0e2a28e06a bcache: avoid oversize memory allocation by small stripe_size
    94070fd6689e blk-cgroup: bypass blkcg_deactivate_policy after destroying
    e52d0eb48efd blk-throttle: fix lockdep warning of "cgroup_mutex or RCU read lock required!"
    5fb6772cb573 stmmac: dwmac-loongson: Add architecture dependency
    82c386d73689 usb: aqc111: check packet for fixup for true limit
    d6c02295c824 x86/hyperv: Fix the detection of E820_TYPE_PRAM in a Gen2 VM
    ae818b2a2e78 drm/mediatek: Add spinlock for setting vblank event in atomic_begin
    73c240e1ec73 ksmbd: fix wrong name of SMB2_CREATE_ALLOCATION_SIZE
    0c196180b588 PCI: loongson: Limit MRRS to 256
    56d1891594d6 Revert "PCI: acpiphp: Reassign resources on bridge if necessary"
    1ec80b9d4310 ALSA: hda/realtek: Apply mute LED quirk for HP15-db
    eeeb91216a1b ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants
    82413e9e4255 ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
    0dc6a06c4843 fuse: dax: set fc->dax to NULL in fuse_dax_conn_free()
    36e2497ac7ad cred: switch to using atomic_long_t
    a51f71cd4f56 net: atlantic: fix double free in ring reinit logic
    1646b2929d5e appletalk: Fix Use-After-Free in atalk_ioctl
    d835299dde3e net: stmmac: Handle disabled MDIO busses from devicetree
    9aac81639e52 dpaa2-switch: do not ask for MDB, VLAN and FDB replay
    a81c7069af05 dpaa2-switch: fix size of the dma_unmap
    9a23be1e5806 vsock/virtio: Fix unsigned integer wrap around in virtio_transport_has_space()
    2027dd67c3cf sign-file: Fix incorrect return values check
    918991db7de0 stmmac: dwmac-loongson: Make sure MDIO is initialized before use
    63387fe87fc5 net: ena: Fix XDP redirection error
    2664b56420b3 net: ena: Fix xdp drops handling due to multibuf packets
    e312eed27aba net: ena: Destroy correct number of xdp queues upon failure
    55a43bae0886 net: Remove acked SYN flag from packet in the transmit queue correctly
    9bb392ee53af qed: Fix a potential use-after-free in qed_cxt_tables_alloc
    112792ad36c4 iavf: Handle ntuple on/off based on new state machines for flow director
    11c314a5a44a iavf: Introduce new state machines for flow director
    01540ee2366a net/rose: Fix Use-After-Free in rose_ioctl
    2de2a6cbe14f atm: Fix Use-After-Free in do_vcc_ioctl
    3a76dcab2e3a octeontx2-af: Update RSS algorithm index
    d0f0786f8c5a octeontx2-pf: Fix promisc mcam entry action
    34b630626a97 octeontx2-af: fix a use-after-free in rvu_nix_register_reporters
    e4ce3dc7a0ed net: fec: correct queue selection
    a00dbc6dec4b net: vlan: introduce skb_vlan_eth_hdr()
    7cfbb8bea36a atm: solos-pci: Fix potential deadlock on &tx_queue_lock
    35c63d366fff atm: solos-pci: Fix potential deadlock on &cli_queue_lock
    525904a15791 bnxt_en: Fix HWTSTAMP_FILTER_ALL packet timestamp logic
    ac6125174190 bnxt_en: Fix wrong return value check in bnxt_close_nic()
    8217f9362c79 bnxt_en: Save ring error counters across reset
    53cacb8cdc7e bnxt_en: Clear resource reservation during resume
    ab410db6e9aa qca_spi: Fix reset behavior
    7e177e5a40d0 qca_debug: Fix ethtool -G iface tx behavior
    2127142c179c qca_debug: Prevent crash on TX ring changes
    0da41ddfb291 net: ipv6: support reporting otherwise unknown prefix flags in RTM_NEWPREFIX
    514232495aa5 net/mlx5e: Fix possible deadlock on mlx5e_tx_timeout_work
    1e8396aab21d HID: lenovo: Restrict detection of patched firmware only to USB cptkbd
    e0cda159c865 afs: Fix refcount underflow from error handling race
    a7e6477cc3af ksmbd: fix memory leak in smb2_lock()
    8925ab33b391 ext4: fix warning in ext4_dio_write_end_io()
    1c077acf246c powerpc/ftrace: Fix stack teardown in ftrace_no_trace
    34ae53cccf53 r8152: add vendor/device ID pair for ASUS USB-C2500
    cac1218b32d7 r8152: add vendor/device ID pair for D-Link DUB-E250
    893597cbabfb r8152: add USB device driver for config selection
    b80d0c6e5bae perf/x86/uncore: Don't WARN_ON_ONCE() for a broken discovery table

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 5cfc5a7dd8..5a2883c87a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "739b3001f20153a66d2723de81faae18cd61892b"
-SRCREV_meta ?= "991713c8765172cb5d18703d15589f3ec6e1b772"
+SRCREV_machine ?= "98f81d89530aff38b127115065e71773e4e771ec"
+SRCREV_meta ?= "50f164ae552b44c7b4c02394a795b997a13c366b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.68"
+LINUX_VERSION ?= "6.1.69"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index e19b0ec132..8ac9259e85 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.68"
+LINUX_VERSION ?= "6.1.69"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_meta ?= "991713c8765172cb5d18703d15589f3ec6e1b772"
+SRCREV_machine ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_meta ?= "50f164ae552b44c7b4c02394a795b997a13c366b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 1329ccc958..bbc5543ede 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "85915187700314cb7ac70fd33da3e9dfd7c20063"
-SRCREV_machine:qemuarm64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemuloongarch64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemumips ?= "24b06ee00fc3b65a24d7e867148b08a85296e67c"
-SRCREV_machine:qemuppc ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemuriscv64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemuriscv32 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemux86 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemux86-64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_machine:qemumips64 ?= "d4659a339611a02e4ffc2861e697c1a278707d70"
-SRCREV_machine ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
-SRCREV_meta ?= "991713c8765172cb5d18703d15589f3ec6e1b772"
+SRCREV_machine:qemuarm ?= "0a00ee457af7e769ac4c813d5a5c2edbe227ca56"
+SRCREV_machine:qemuarm64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemuloongarch64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemumips ?= "b0c5bfb120afb832e5bd9d9df2b5a15173e4c930"
+SRCREV_machine:qemuppc ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemuriscv64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemuriscv32 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemux86 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemux86-64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_machine:qemumips64 ?= "c30b2a4361fb2c7dc3dbfebc46b9ee8a59ae7c78"
+SRCREV_machine ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
+SRCREV_meta ?= "50f164ae552b44c7b4c02394a795b997a13c366b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ba6f5fb465114fcd48ddb2c7a7740915b2289d6b"
+SRCREV_machine:class-devupstream ?= "4aa6747d935281df8a1888feeb6e22e0097d0b86"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.68"
+LINUX_VERSION ?= "6.1.69"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


