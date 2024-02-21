Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595EDC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:46:44 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4664.1708483602751217009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaL9tvON;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7874a96a01dso206486685a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483602; x=1709088402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu0v4MUTJgKEjhq9wjBXpZivWg+1PtrC6ZNr800eY08=;
        b=IaL9tvONndpA3ep4YK4r82xxYD4nPc5WkDy85h8f/LB5iX6uDqUcvbUbACeoBo1sNu
         nAMmma6ExdrzGgzz+mZE7ixQdFB3SmLY+vGuUwDHWF7YDk+99EkIpxhIB6m3ExQVopmF
         PrSKyp/8ez9OFtW6kpIo+DnQkMB6TDnaUw8X+J7pd4hFGYOOOK5DeWXJnFBCbfdiaj+y
         C2QlYE/L9yhOaMID1ZXQ/EcDXgZDgFvWvLGGvbBbyErdq6VUpE/71wwTsO2QpuyK+zdo
         i6lXxppfbZTfrhhPU9d6i1OkQnOlp1BLTcHToRsWtbYsk6gcht7Q1NhQP7Qpq71LROkR
         NdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483602; x=1709088402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mu0v4MUTJgKEjhq9wjBXpZivWg+1PtrC6ZNr800eY08=;
        b=K8ollXoGUEVQtiyEhCbep8z6VompyTzDn4j9avgDqrhTr+LxM+a6Yye7KcOpr/yyOe
         ea3xCslvdOfdHXm9tPcLJu9OTupY9O0YyN3MrY6v3oFopi4Rr4LcG7JWvhlT5OmQ6bMH
         TPfE1uEvBldf9GXexal/94NVcpEFSRJb9HHP44of2p/81HLjtTePFl6Nvjq7LsLg+XZO
         37eKdfiOIAZquPDPPGbS2GOT9nTd3zkF/qfk3k7petOT1AnXn0kkdzye1V/6EU5sPlVa
         NI0+QklXVqJizg3sPq8VhxH+YZqxXvix8s9TxfuyUietjFJvZa8AQx3rjiMn1wDzSV4s
         5M0A==
X-Gm-Message-State: AOJu0YzAZJlw4GXfohnxncB4+VyJTsNhCDtdXdrKY6ivotCP+rVf8GrE
	eKSilrwOdGKg7cEvye53Bv1oELXlz9VI2QSWLyqwuz+odRLMSI2NJCQXoMBd
X-Google-Smtp-Source: AGHT+IHoK1QPa5OWt6ezEVdywlw8Zsu6pvV0ew94wZKbflSr+gKGdcJHhPJnuwh1iymcZwMNSsbF1w==
X-Received: by 2002:a05:620a:4da:b0:787:22a5:99d3 with SMTP id 26-20020a05620a04da00b0078722a599d3mr17928032qks.78.1708483601569;
        Tue, 20 Feb 2024 18:46:41 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ow39-20020a05620a822700b007872acdc390sm3934105qkn.9.2024.02.20.18.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:46:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] linux-yocto/5.4: update to v5.4.264
Date: Tue, 20 Feb 2024 21:46:36 -0500
Message-Id: <20240221024640.3239284-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195951

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    16e6e107a688 Linux 5.4.264
    06bcac5c5151 devcoredump: Send uevent once devcd is ready
    c6a1282e530d devcoredump : Serialize devcd_del work
    d99376b70247 smb: client: fix potential NULL deref in parse_dfs_referrals()
    ab5813bb2071 cifs: Fix non-availability of dedup breaking generic/304
    bdee8b2805b8 Revert "btrfs: add dmesg output for first mount and last unmount of a filesystem"
    dd9e851944aa tools headers UAPI: Sync linux/perf_event.h with the kernel sources
    4a341627a109 drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group
    fe8402511ed8 psample: Require 'CAP_NET_ADMIN' when joining "packets" group
    263bffd2b6aa genetlink: add CAP_NET_ADMIN test for multicast bind
    a149fbadb9be netlink: don't call ->netlink_bind with table lock held
    18824f592aad io_uring/af_unix: disable sending io_uring over sockets
    32f4536c108f nilfs2: fix missing error check for sb_set_blocksize call
    77a353924d8f KVM: s390/mm: Properly reset no-dat
    1aee33d43d6c x86/CPU/AMD: Check vendor in the AMD microcode callback
    3371eac21119 serial: 8250_omap: Add earlycon support for the AM654 UART controller
    ce79cf407c64 serial: sc16is7xx: address RX timeout interrupt errata
    d896c47f8cfc ARM: PL011: Fix DMA support
    880b035bc64e usb: typec: class: fix typec_altmode_put_partner to put plugs
    a9022cbdd0ae parport: Add support for Brainboxes IX/UC/PX parallel cards
    fefc0559c58e usb: gadget: f_hid: fix report descriptor allocation
    1796ae6a7a8c mmc: sdhci-sprd: Fix vqmmc not shutting down after the card was pulled
    a1f29e995fd7 mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
    05918dec9a1e gpiolib: sysfs: Fix error handling on failed export
    152f51d159f3 perf: Fix perf_event_validate_size()
    84ca356ec859 perf/core: Add a new read format to get a number of lost samples
    07bdb1bd2476 arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
    6109859f6982 arm64: dts: mediatek: mt7622: fix memory node warning check
    148d8f0707fa packet: Move reference count in packet_sock to atomic_long_t
    965cbc6b623a tracing: Fix a possible race when disabling buffered events
    6f2e50961fe3 tracing: Fix incomplete locking when disabling buffered events
    84302391d130 tracing: Always update snapshot buffer size
    cb74e8fd6b2d nilfs2: prevent WARNING in nilfs_sufile_set_segment_usage()
    610ebc289582 ALSA: pcm: fix out-of-bounds in snd_pcm_state_names
    439166b1b2ee ARM: dts: imx7: Declare timers compatible with fsl,imx6dl-gpt
    4fe36f83f8d8 ARM: dts: imx: make gpt node name generic
    69b669cc6389 ARM: imx: Check return value of devm_kasprintf in imx_mmdc_perf_init
    59348f148235 scsi: be2iscsi: Fix a memleak in beiscsi_init_wrb_handle()
    8244ea916bfe tracing: Fix a warning when allocating buffered events fails
    4713be844546 ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
    febb7bbe290d hwmon: (acpi_power_meter) Fix 4.29 MW bug
    ad4cf776678b RDMA/bnxt_re: Correct module description string
    b4b89b7b2d4b bpf: sockmap, updating the sg structure should also update curr
    7ffff0cc929f tcp: do not accept ACK of bytes we never sent
    69431f609bf3 netfilter: xt_owner: Fix for unsafe access of sk->sk_socket
    c61c61d7e7de net: hns: fix fake link up on xge port
    1ec21fde58da ipv4: ip_gre: Avoid skb_pull() failure in ipgre_xmit()
    e38cd53421ed arcnet: restoring support for multiple Sohard Arcnet cards
    f26546731933 net: arcnet: com20020 fix error handling
    d124c18267b1 net: arcnet: Fix RESET flag handling
    9f5a25aa1bcc hv_netvsc: rndis_filter needs to select NLS
    be1ab8bf0510 ipv6: fix potential NULL deref in fib6_add()
    5cd05bbaaef4 of: dynamic: Fix of_reconfig_get_state_change() return value documentation
    5cadae629e44 of: Add missing 'Return' section in kerneldoc comments
    b31cb14cac85 of: Fix kerneldoc output formatting
    36ce931a803b of: base: Fix some formatting issues and provide missing descriptions
    8c4fcbe27a7a of/irq: Make of_msi_map_rid() PCI bus agnostic
    ae374c57afeb of/irq: make of_msi_map_get_device_domain() bus agnostic
    e5cfaab66295 of/iommu: Make of_map_rid() PCI agnostic
    f7a85520087a ACPI/IORT: Make iort_msi_map_rid() PCI agnostic
    da36a3ef32b4 ACPI/IORT: Make iort_get_device_domain IRQ domain agnostic
    d786067be2eb of: base: Add of_get_cpu_state_node() to get idle states for a CPU node
    13f27a05377d drm/amdgpu: correct chunk_ptr to a pointer to chunk.
    d162a5e6a51d kconfig: fix memory leak from range properties
    d34644153050 tg3: Increment tx_dropped in tg3_tso_bug()
    cd49b8e07d01 tg3: Move the [rt]x_dropped counters to tg3_napi
    427deb5ba566 netfilter: ipset: fix race condition between swap/destroy and kernel side add/del/test
    54d0d83a5350 hrtimers: Push pending hrtimers away from outgoing CPU earlier
    34244ed6219a Linux 5.4.263
    afa7b11ea8aa mmc: block: Retry commands in CQE error recovery
    c8008304db1f mmc: core: convert comma to semicolon
    33cc97d2493f mmc: cqhci: Fix task clearing in CQE error recovery
    3e78540d98ce mmc: cqhci: Warn of halt or task clear failure
    5b87f355462a mmc: cqhci: Increase recovery halt timeout
    1a051c6d15aa cpufreq: imx6q: Don't disable 792 Mhz OPP unnecessarily
    d497e1b2f5e5 cpufreq: imx6q: don't warn for disabling a non-existing frequency
    b1a66a050f96 scsi: qla2xxx: Fix system crash due to bad pointer access
    c1f97cc21eac scsi: qla2xxx: Use scsi_cmd_to_rq() instead of scsi_cmnd.request
    df0110425f42 scsi: core: Introduce the scsi_cmd_to_rq() function
    66cd60553045 scsi: qla2xxx: Simplify the code for aborting SCSI commands
    30511f37c997 ima: detect changes to the backing overlay file
    8c85e455f7c9 ovl: skip overlayfs superblocks at global sync
    157c8056abb5 ima: annotate iint mutex to avoid lockdep false positive warnings
    a8038ae58145 fbdev: stifb: Make the STI next font pointer a 32-bit signed offset
    939012ee31d8 mtd: cfi_cmdset_0001: Byte swap OTP info
    416dad018edd mtd: cfi_cmdset_0001: Support the absence of protection registers
    21ad8c1c4fca s390/cmma: fix detection of DAT pages
    c11027d333fd s390/mm: fix phys vs virt confusion in mark_kernel_pXd() functions family
    f1db39b1541f smb3: fix touch -h of symlink
    97d54b8005c0 net: ravb: Start TX queues after HW initialization succeeded
    7023a293e981 net: ravb: Use pm_runtime_resume_and_get()
    05aa8f3e3b77 ravb: Fix races between ravb_tx_timeout_work() and net related ops
    d37609b52977 net: stmmac: xgmac: Disable FPE MMC interrupts
    7ccf772a8bad ipv4: igmp: fix refcnt uaf issue when receiving igmp query packet
    f8b5b5d23605 Input: xpad - add HyperX Clutch Gladiate Support
    6536698eea91 btrfs: make error messages more clear when getting a chunk map
    4c6274cfd603 btrfs: send: ensure send_fd is writable
    79ffc04aba7a btrfs: fix off-by-one when checking chunk map includes logical address
    dd94ffab1b6d btrfs: add dmesg output for first mount and last unmount of a filesystem
    30b807d73654 powerpc: Don't clobber f0/vs0 during fp|altivec register save
    bb55decee202 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR
    729da56e01c9 dm verity: don't perform FEC for failed readahead IO
    b515ed628447 dm-verity: align struct dm_verity_fec_io properly
    d377e593d11e ALSA: hda/realtek: Add supported ALC257 for ChromeOS
    47dd3917c48a ALSA: hda/realtek: Headset Mic VREF to 100%
    88ce27f0a3f0 ALSA: hda: Disable power-save on KONTRON SinglePC
    4a2d1399f848 mmc: block: Do not lose cache flush during CQE error recovery
    4d7d14c69667 firewire: core: fix possible memory leak in create_units()
    1eaa188f7fec pinctrl: avoid reload of p state in list iteration
    40532b29138e io_uring: fix off-by one bvec index
    9e7f410f6a43 USB: dwc3: qcom: fix wakeup after probe deferral
    db62d193e69b USB: dwc3: qcom: fix resource leaks on probe deferral
    ca44455362e3 usb: dwc3: set the dma max_seg_size
    7a0b6fc6c3c2 USB: dwc2: write HCINT with INTMASK applied
    d1c866356ddb USB: serial: option: don't claim interface 4 for ZTE MF290
    38233a62d360 USB: serial: option: fix FM101R-GL defines
    83be9405b33e USB: serial: option: add Fibocom L7xx modules
    406fae6c799b bcache: prevent potential division by zero error
    c00163256ac4 bcache: check return value from btree_node_alloc_replacement()
    a658ee793011 dm-delay: fix a race between delay_presuspend and delay_bio
    ef918a1ba40c hv_netvsc: Mark VF as slave before exposing it to user-mode
    997d895fa495 hv_netvsc: Fix race of register_netdevice_notifier and VF register
    f2a0c988d724 USB: serial: option: add Luat Air72*U series products
    f1ac7789406e s390/dasd: protect device queue against concurrent access
    300e96e171a9 bcache: replace a mistaken IS_ERR() by IS_ERR_OR_NULL() in btree_gc_coalesce()
    76f791b78da2 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CVA
    78c1e3aa693b KVM: arm64: limit PMU version to PMUv3 for ARMv8.1
    5d4f6d809efa arm64: cpufeature: Extract capped perfmon fields
    32cfd5c3b843 ext4: make sure allocate pending entry not fail
    70edeedd795a ext4: fix slab-use-after-free in ext4_es_insert_extent()
    15a84cf4c785 ext4: using nofail preallocation in ext4_es_insert_extent()
    80c8dcb09feb ext4: using nofail preallocation in ext4_es_insert_delayed_block()
    be4684ee83f3 ext4: using nofail preallocation in ext4_es_remove_extent()
    d809d1d2edc3 ext4: use pre-allocated es in __es_remove_extent()
    059722ec6464 ext4: use pre-allocated es in __es_insert_extent()
    53df96011a2f ext4: factor out __es_alloc_extent() and __es_free_extent()
    c48b5fdd465e ext4: add a new helper to check if es must be kept
    b9cd5c3afc37 MIPS: KVM: Fix a build warning about variable set but not used
    afbedd6136cb nvmet: nul-terminate the NQNs passed in the connect command
    84ac94bed02a nvmet: remove unnecessary ctrl parameter
    07009245d3ba afs: Fix file locking on R/O volumes to operate in local mode
    54ffe881d716 afs: Return ENOENT if no cell DNS record can be found
    3680d10b4181 net: axienet: Fix check for partial TX checksum
    a7e7b928049f amd-xgbe: propagate the correct speed and duplex status
    c3a77c754e7f amd-xgbe: handle the corner-case during tx completion
    895f1903ea09 amd-xgbe: handle corner-case during sfp hotplug
    7fabd97a05fc arm/xen: fix xen_vcpu_info allocation alignment
    9beba93f8ca7 net: usb: ax88179_178a: fix failed operations during ax88179_reset
    fc23517c8797 ipv4: Correct/silence an endian warning in __ip_do_redirect
    6fd145351d48 HID: fix HID device resource race between HID core and debugging support
    2c8f79610431 HID: core: store the unique system identifier in hid_device
    90b3df8b5b7d drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full
    bfdda8c9c58d ata: pata_isapnp: Add missing error check for devm_ioport_map()
    9d980808f967 drm/panel: simple: Fix Innolux G101ICE-L01 timings
    cc543bad78d5 drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
    c2eadc1586e7 afs: Make error on cell lookup failure consistent with OpenAFS
    7369371bb875 PCI: keystone: Drop __init from ks_pcie_add_pcie_{ep,port}()
    518b7f7d87aa RDMA/irdma: Prevent zero-length STAG registration
    d359886a7a80 driver core: Release all resources during unbind before updating device links

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 58e10be524a..e61e97c0928 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "43d5f7eb85acc21ec87ec45b2cae127dad8bf7a4"
-SRCREV_meta ?= "34f54c16ac6ef29441f95dd3b932729f01008999"
+SRCREV_machine ?= "1193259d93adb90be2688677c70daeffd38b401e"
+SRCREV_meta ?= "60242d5fa3322b8c8d1629d7865d0be6133444dd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.262"
+LINUX_VERSION ?= "5.4.264"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 01894be10cf..b034e5ad845 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.262"
+LINUX_VERSION ?= "5.4.264"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "7c33fa232f43e9059395bd30e23ef3c16359ba11"
-SRCREV_machine ?= "42abef1facd8bc8d1f51470493f08d87d0862f8e"
-SRCREV_meta ?= "34f54c16ac6ef29441f95dd3b932729f01008999"
+SRCREV_machine_qemuarm ?= "e3057fe26e087921a4133a885f2bebcb7b4392f3"
+SRCREV_machine ?= "611daf1778b317c4429d0c9e5654219871998ebf"
+SRCREV_meta ?= "60242d5fa3322b8c8d1629d7865d0be6133444dd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e8d935edea8..989b675fe36 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "76b8ef2c7ecb7cf484e0eff4d509ec57c310d06e"
-SRCREV_machine_qemuarm64 ?= "23b9912a979d98708f3adc8312af42eb9049c1d6"
-SRCREV_machine_qemumips ?= "2e266704c46066c80821a491ad6f42c930e00d5d"
-SRCREV_machine_qemuppc ?= "2343a888a77678d4440032d22327f753d1a90cdb"
-SRCREV_machine_qemuriscv64 ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
-SRCREV_machine_qemux86 ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
-SRCREV_machine_qemux86-64 ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
-SRCREV_machine_qemumips64 ?= "73d9e7eaf1161e5deb6d3fbfdefb07fc5fd87d3f"
-SRCREV_machine ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
-SRCREV_meta ?= "34f54c16ac6ef29441f95dd3b932729f01008999"
+SRCREV_machine_qemuarm ?= "48487580c951040acb41aef37ee2705f2b31bb64"
+SRCREV_machine_qemuarm64 ?= "106b94311371c0abe70c4ef34fd6bc68eedf1925"
+SRCREV_machine_qemumips ?= "d3ef8b4c2a4569b8c2275a7c28ee1e1736bfb311"
+SRCREV_machine_qemuppc ?= "ef180bf93e83eaeb8844e9968b13390a5dbfb215"
+SRCREV_machine_qemuriscv64 ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
+SRCREV_machine_qemux86 ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
+SRCREV_machine_qemux86-64 ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
+SRCREV_machine_qemumips64 ?= "a311dd01367cfcb11b7e2273b6841201850ccd7d"
+SRCREV_machine ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
+SRCREV_meta ?= "60242d5fa3322b8c8d1629d7865d0be6133444dd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.262"
+LINUX_VERSION ?= "5.4.264"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


