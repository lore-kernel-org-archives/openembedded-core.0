Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D97C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:25 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.4160.1714705219760704241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAU9hPhw;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6a073f10e25so44943926d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705219; x=1715310019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30p8RIIM/9DA+52g37UPY99DTP1i8egsJayOnsaboSI=;
        b=IAU9hPhwzAscMAPTZI7dJM/oI7dAA8hynpu4COBlt2PjC48qsPhcqskUHf3mT8MH7j
         WF0h7pRv24JVCrMiYKQdawBbjonS1zRCz2wb4i6DvEXHeCDKuAIqJBdh/C55Z2GZJ8ht
         kzy19qEXFuErgzP4AheMdpdAGyN//hQifLVy7r21xXQnFgJ1owwV6CWC5VWZLQZGCeg9
         jzdL13EdlymO8MFIEb0+iW0rZBYRewSS45jR4YdJb0QY4Y5BWDn8Fq4gAgzCfpwSjyR/
         mL7TKK2uQTRhTK+X8drsYDg2CaC9zJ3ZaGmuqPEakID3tuulhM12r8WlfatR6v02Gpgr
         XylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705219; x=1715310019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30p8RIIM/9DA+52g37UPY99DTP1i8egsJayOnsaboSI=;
        b=THSY3TosfuviqNsHey5ypEJx9ZT5x1W9pwCu5ngYzvMjxV9Wb3IOWyfHObB06XB4gl
         8IwgVCp8Ulusn+2s1HLkXZk2kIs/mtZy5uZhhPUxT/QW78kIMualIKLp0yN7CnCrXRFe
         yf7zHT2K50ueKYqmXFK6m6piLEc0meqgbsJ5fRjhsDalOCeM/0ku5lZeV2qat7BugMIQ
         qeN5RarAk8YKinDbk4jw0FFeX5a3L3aKqWhQeFtUX+oztZJlEER5rZ/hSXvufl01N8e1
         QA/Z93ZavRMvsLZhayWAvluoYT24760UdW3sG6ObEaTcZvrdEUzF8c2aRYafixr+rx4s
         9LeQ==
X-Gm-Message-State: AOJu0YxrGb1oXg5G1wuC7qpjdWderoK4//yG6oT/gcwLcfpazkb9M0Ip
	lk++wcCzuzbtUv124WI+qKJh3Zwhu0gZAKg10gpIHFzBRtRidNsESJ4T+Q==
X-Google-Smtp-Source: AGHT+IHCkT6vrBFDDSIPYdD6zdqTUiSeOu0wFGWaGR6b121TmASzb/zxRlf0F2SEo1p8W+D+h+SGBg==
X-Received: by 2002:a05:6214:486:b0:6a0:ca8e:4fd2 with SMTP id pt6-20020a056214048600b006a0ca8e4fd2mr1440941qvb.52.1714705218245;
        Thu, 02 May 2024 20:00:18 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/10] linux-yocto/6.1: update to v6.1.80
Date: Thu,  2 May 2024 23:00:07 -0400
Message-Id: <20240503030015.374078-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198957

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    a3eb3a74aa8c Linux 6.1.80
    277439e7cabd fs/ntfs3: Enhance the attribute size check
    f119f2325ba7 arp: Prevent overflow in arp_req_get().
    f8fc1f1d9f65 ahci: Extend ASM1061 43-bit DMA address quirk to other ASM106x parts
    4a37c6c06834 ata: ahci: add identifiers for ASM2116 series adapters
    70a4a2657201 mptcp: add needs_id for netlink appending addr
    b03bca85617b mptcp: userspace pm send RM_ADDR for ID 0
    14f1992430ef mm: zswap: fix missing folio cleanup in writeback race path
    18f614369def fs/aio: Restrict kiocb_set_cancel_fn() to I/O submitted via libaio
    7ebeee513f8f mm/damon/reclaim: fix quota stauts loss due to online tunings
    47467e04816c erofs: fix inconsistent per-file compression format
    54407d9bc5e3 erofs: simplify compression configuration parser
    b1301f15ddc2 i2c: imx: when being a target, mark the last read as processed
    58168005337e drm/amd/display: Fix memory leak in dm_sw_fini()
    fd7b4f4fdc7c drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
    b9196289e36c net: phy: realtek: Fix rtl8211f_config_init() for RTL8211F(D)(I)-VD-CG PHY
    37919ef31d7c Fix write to cloned skb in ipv6_hop_ioam()
    9d5523e065b5 phonet/pep: fix racy skb_queue_empty() use
    f556a352fdb2 phonet: take correct lock to peek at the RX queue
    1623161f80a4 net: sparx5: Add spinlock for frame transmission from CPU
    c22ad76cfc43 net: mctp: put sock on tag allocation failure
    ea33b8166912 netfilter: nf_tables: use kzalloc for hook allocation
    f30535918672 netfilter: nf_tables: register hooks last when adding new chain/flowtable
    26994a04b0ba netfilter: nf_tables: rename function to destroy hook list
    a6cafdb49a7b netfilter: nft_flow_offload: release dst in case direct xmit path is used
    012df10717da netfilter: nft_flow_offload: reset dst in route object after setting up flow
    9c5662e95a8d netfilter: flowtable: simplify route logic
    0c9302a6da26 netfilter: nf_tables: set dormant flag on hook register failure
    bdaf6bbfc1f2 tls: don't skip over different type records from the rx_list
    6756168add1c tls: stop recv() if initial process_rx_list gave us non-DATA
    ca89b4f5034d tls: break out of main loop when PEEK gets a non-data record
    4588b13abcbd bpf, sockmap: Fix NULL pointer dereference in sk_psock_verdict_data_ready()
    11277d189267 s390: use the correct count for __iowrite64_copy()
    18580e48e624 octeontx2-af: Consider the action set by PF
    6216509a2e11 platform/x86: thinkpad_acpi: Only update profile if successfully converted
    38c83c2488dc arm64/sme: Restore SME registers on exit from suspend
    fd84a5fae03c net: dev: Convert sa_data to flexible array in struct sockaddr
    8391b9b651cf ipv6: sr: fix possible use-after-free and null-ptr-deref
    e8530b170e46 afs: Increase buffer size in afs_update_volume_status()
    addf5e297e6c bpf: Fix racing between bpf_timer_cancel_and_free and bpf_timer_cancel
    9a581b17b722 ata: ahci_ceva: fix error handling for Xilinx GT PHY support
    e5703735e57a ipv6: properly combine dev_base_seq and ipv6.dev_addr_genid
    b43a4fb42fef ipv4: properly combine dev_base_seq and ipv4.dev_addr_genid
    8e29f988ad32 net: stmmac: Fix incorrect dereference in interrupt handlers
    25bd33b87f8a x86/numa: Fix the sort compare func used in numa_fill_memblks()
    ca4a1c00beff x86/numa: Fix the address overlap check in numa_fill_memblks()
    b06a3b1cbdfb nouveau: fix function cast warnings
    729bc77af438 dccp/tcp: Unhash sk from ehash for tb2 alloc failure after check_estalblished().
    91ac2c79e896 net: bridge: switchdev: Ensure deferred event delivery on unoffload
    2d5b4b3376fa net: bridge: switchdev: Skip MDB replays of deferred events on offload
    44148c1c8245 scsi: jazz_esp: Only build if SCSI core is builtin
    3c31b18a8dd8 scsi: smartpqi: Fix disable_managed_interrupts
    758b8f5e0498 bpf, scripts: Correct GPL license name
    a9409d33af61 RDMA/srpt: fix function pointer cast warnings
    5f69c475c147 arm64: dts: rockchip: set num-cs property for spi on px30
    7f31a244c753 RDMA/qedr: Fix qedr_create_user_qp error flow
    47e93d2f286e iommufd/iova_bitmap: Consider page offset for the pages to be pinned
    c5bc02f60d27 iommufd/iova_bitmap: Switch iova_bitmap::bitmap to an u8 array
    8d3a5cbc1e92 iommufd/iova_bitmap: Bounds check mapped::pages access
    aee4dcfe1721 RDMA/srpt: Support specifying the srpt_service_guid parameter
    edc2a9afbebd RDMA/irdma: Add AE for too many RNRS
    6f4553096ece RDMA/irdma: Set the CQ read threshold for GEN 1
    429999729d4a RDMA/irdma: Validate max_send_wr and max_recv_wr
    b2e4a5266e3d RDMA/irdma: Fix KASAN issue with tasklet
    75a64c641cf2 RDMA/bnxt_re: Return error for SRQ resize
    f0d857ce31a6 IB/hfi1: Fix a memleak in init_credit_return
    a6cada89ee5a Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
    71787c665d09 mptcp: fix lockless access in subflow ULP diag
    9e8e59af3a4a mptcp: add needs_id for userspace appending addr
    42a841a84ffd mptcp: make userspace_pm_append_new_local_addr static
    2f414a56b369 usb: roles: don't get/set_role() when usb_role_switch is unregistered
    0158216805ca usb: roles: fix NULL pointer issue when put module's reference
    35b604a37ec7 usb: gadget: ncm: Avoid dropping datagrams of properly parsed NTBs
    9a52b694b066 usb: cdns3: fix memory double free when handle zero packet
    2134e9906e17 usb: cdns3: fixed memory use after free at cdns3_gadget_ep_disable()
    c66a8008489b usb: cdnsp: fixed issue with incorrect detecting CDNSP family controllers
    748cee4417f6 usb: cdnsp: blocked some cdns3 specific code
    4dc87908b183 usb: dwc3: gadget: Don't disconnect if not started
    d4c7e4b1b024 serial: amba-pl011: Fix DMA transmission in RS485 mode
    d9d242625353 erofs: fix refcount on the metabuf used for inode lookup
    943c8b1fcc86 dm-integrity, dm-verity: reduce stack usage for recheck
    545a94ffc29a x86/alternative: Make custom return thunk unconditional
    b012dcf39d9e Revert "x86/alternative: Make custom return thunk unconditional"
    1221b8ea25cc x86/returnthunk: Allow different return thunks
    786f089086b5 ARM: ep93xx: Add terminator to gpiod_lookup_table
    13cd1daeea84 l2tp: pass correct message length to ip6_append_data
    2a19e0042bf1 PCI/MSI: Prevent MSI hardware interrupt number truncation
    e90211b1f7ac irqchip/sifive-plic: Enable interrupt if needed before EOI
    75eaa3666e2c irqchip/gic-v3-its: Do not assume vPE tables are preallocated
    62f361bfea60 crypto: virtio/akcipher - Fix stack overflow on memcpy
    3963f16cc764 gtp: fix use-after-free and null-ptr-deref in gtp_genl_dump_pdp()
    3ac3624a74cf KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
    72fdbc728c33 KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
    6b2ff10390b1 md: Fix missing release of 'active_io' for flush
    8b218e2f0a27 cachefiles: fix memory leak in cachefiles_add_cache()
    9e7fc40377ec platform/x86: touchscreen_dmi: Allow partial (prefix) matches for ACPI names
    fff39f496265 platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler
    19e5dc2e6bf7 mm: memcontrol: clarify swapaccount=0 deprecation warning
    4c815c3a4834 mm/damon/lru_sort: fix quota status loss due to online tunings
    2dedda77d449 mm/swap: fix race when skipping swapcache
    e3bf0a24e050 scsi: core: Consult supported VPD page list prior to fetching page
    f49b20fd0134 scsi: target: pscsi: Fix bio_put() for error case
    031217128990 cxl/pci: Fix disabling memory if DVSEC CXL Range does not match a CFMWS window
    27c1ade6068f dm-verity: recheck the hash after a failure
    e08c2a8d27e9 dm-crypt: don't modify the data when using authenticated encryption
    906414f45964 dm-integrity: recheck the integrity tag after a failure
    6437b0b4ddcd Revert "parisc: Only list existing CPUs in cpu_possible_mask"
    5583552eec30 dm-crypt: recheck the integrity tag after a failure
    287abdcb9e2b ata: libata-core: Do not try to set sleeping devices to standby
    65c5a1ba2c32 s390/cio: fix invalid -EBUSY on ccw_device_start
    47647795a630 drm/ttm: Fix an invalid freeing on already freed page in error path
    a262b78dd085 LoongArch: Disable IRQ before init_fn() for nonboot CPUs
    52dc9a7a573d IB/hfi1: Fix sdma.h tx->num_descs off-by-one error
    4aa4ea70f37c pmdomain: renesas: r8a77980-sysc: CR7 must be always on
    339ddc983bc1 pmdomain: mediatek: fix race conditions with genpd
    4dd73641d7ac smb3: clarify mount warning
    db48acce75d7 virtio-blk: Ensure no requests in virtqueues before deleting vqs.
    0947d0d463d4 smb: client: set correct d_type for reparse points under DFS mounts
    8b661fb17bfa drm/amdgpu: reset gpu for s3 suspend abort case
    d56edd0f1b30 drm/amdgpu: skip to program GFXDEC registers for suspend abort
    6b82ffe7a265 firewire: core: send bus reset promptly on gap count error
    c0b07b4237e4 LoongArch: Select HAVE_ARCH_SECCOMP to use the common SECCOMP menu
    c920f604e0c8 LoongArch: Select ARCH_ENABLE_THP_MIGRATION instead of redefining it
    c7ac9c1f7f93 scsi: ufs: core: Remove the ufshcd_release() in ufshcd_err_handling_prepare()
    75745f2b7453 scsi: lpfc: Use unsigned type for num_sge
    76ee44af0975 hwmon: (coretemp) Enlarge per package core count limit
    48a33c312526 efi: Don't add memblocks for soft-reserved memory
    700c3f642c32 efi: runtime: Fix potential overflow of soft-reserved region size
    2bf17c3e13aa wifi: mac80211: adding missing drv_mgd_complete_tx() call
    4e5bd2287021 wifi: mac80211: set station RX-NSS on reconfig
    6ed6cdbe8833 fs/ntfs3: Fix oob in ntfs_listxattr
    5d67a4ff3dfe fs/ntfs3: Update inode->i_size after success write into compressed file
    32a3974b26df fs/ntfs3: Correct function is_rst_area_valid
    0d2f804b9f54 fs/ntfs3: Prevent generic message "attempt to access beyond end of device"
    1c005ce9934c fs/ntfs3: use non-movable memory for ntfs3 MFT buffer cache
    ee12c3102027 fs/ntfs3: Disable ATTR_LIST_ENTRY size check
    50545eb6cd5f fs/ntfs3: Add NULL ptr dereference checking at the end of attr_allocate_frame()
    95bad562e575 fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"
    a9f7d7656fbc fs/ntfs3: Print warning while fixing hard links count
    25d1694d6e34 fs/ntfs3: Correct hard links updating when dealing with DOS names
    1970b5f2048f fs/ntfs3: Improve ntfs_dir_count
    9c6684360692 fs/ntfs3: Modified fix directory element type detection
    b3a996b10694 Input: i8042 - add Fujitsu Lifebook U728 to i8042 quirk table
    200627f46e03 ext4: correct the hole length returned by ext4_map_blocks()
    be36276cb88b smb: client: increase number of PDUs allowed in a compound request
    f9eef0e49515 nvmet-fc: take ref count on tgtport before delete assoc
    9e6987f8937a nvmet-fc: avoid deadlock on delete association path
    8b9e4539493b nvmet-fc: abort command when there is no binding
    67e2ddf2324a nvmet-fc: hold reference on hostport match
    b8338116689a nvmet-fc: defer cleanup using RCU properly
    6319ab29d5e0 nvmet-fc: release reference on target port
    16b2b31ba886 nvmet-fcloop: swap the list_add_tail arguments
    085195aa90a9 nvme-fc: do not wait in vain when unloading module
    dee697ac5330 ALSA: usb-audio: Ignore clock selector errors for single connection
    5653a6d65a11 ASoC: wm_adsp: Don't overwrite fwf_name with the default
    bead6ff98689 drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz
    41b256f473ac netfilter: conntrack: check SCTP_CID_SHUTDOWN_ACK for vtag setting in sctp_new
    17fe3616d854 misc: open-dice: Fix spurious lockdep warning
    1c57e5ef85c7 Input: xpad - add Lenovo Legion Go controllers
    949296ee62db spi: sh-msiof: avoid integer overflow in constants
    4dec3068eaa5 ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
    c7bdaff0d075 ALSA: usb-audio: Check presence of valid altsetting control
    1675aae9e19e usb: ucsi_acpi: Quirk to ack a connector change ack cmd
    fbd1cb2a9b77 nvmet-tcp: fix nvme tcp ida memory leak
    13c1af5f3bc4 regulator: pwm-regulator: Add validity checks in continuous .get_voltage
    9d508c897153 dmaengine: ti: edma: Add some null pointer checks to the edma_probe
    3e746c4e4848 Input: goodix - accept ACPI resources with gpio_count == 3 && gpio_int_idx == 0
    d639102f4cbd ext4: avoid allocating blocks from corrupted group in ext4_mb_find_by_goal()
    f97e75fa4e12 ext4: avoid allocating blocks from corrupted group in ext4_mb_try_best_found()
    8b40eb2e716b ext4: avoid dividing by 0 in mb_update_avg_fragment_size() when block bitmap corrupt
    a600d7f0c1d0 platform/x86: touchscreen_dmi: Add info for the TECLAST X16 Plus tablet
    6c292c2f9027 MIPS: reserve exception vector space ONLY ONCE
    f48a6eb2e5e8 ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
    2d623c94fbba aoe: avoid potential deadlock at set_capacity
    41e137c2c75a ahci: asm1166: correct count of reported ports
    a2aa77b5d8e3 cifs: translate network errors on send to -ECONNABORTED
    bba595eb1422 smb: Work around Clang __bdos() type confusion
    8fc80874103a block: Fix WARNING in _copy_from_iter
    f19361d570c6 spi: hisi-sfc-v3xx: Return IRQ_NONE if no interrupts were detected
    f329523f6a65 fbdev: sis: Error out if pixclock equals zero
    070398d32c5f fbdev: savage: Error out if pixclock equals zero
    eb39bb548bf9 wifi: mac80211: fix race condition on enabling fast-xmit
    e540c4498387 wifi: cfg80211: fix missing interfaces when dumping
    d3dbfb9d11fc dmaengine: fsl-qdma: increase size of 'irq_name'
    8dda42b1f2e4 dmaengine: shdma: increase size of 'dev_id'
    b2cb83539cdb cifs: open_cached_dir should not rely on primary channel
    e717bd412001 scsi: target: core: Add TMF to tmr_list handling
    c9ae228cfd1a dmaengine: apple-admac: Keep upper bits of REG_BUS_WIDTH
    0d27ac177909 riscv/efistub: Ensure GP-relative addressing is not used
    6967ddd378e9 PCI: dwc: Fix a 64bit bug in dw_pcie_ep_raise_msix_irq()
    5552b7bf26d9 sched/rt: sysctl_sched_rr_timeslice show default timeslice after reset
    89bebf275311 sched/rt: Disallow writing invalid values to sched_rt_period_us
    a41f6e170b85 net/sched: Retire dsmark qdisc
    09038f47e45c net/sched: Retire ATM qdisc
    02149c7cd115 net/sched: Retire CBQ qdisc

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4731848569..69d6b4bea9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d99f54f4ced57500fd5c346afcfa79ff8bab6a61"
-SRCREV_meta ?= "1a5f3ae5c51d6698be51e36bf547433564338b18"
+SRCREV_machine ?= "6c4acb22266e16b25cc391f6c14d25358bdaeb9b"
+SRCREV_meta ?= "4b4e682a21aa2796eb9ac95363cfd3849690f550"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.79"
+LINUX_VERSION ?= "6.1.80"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 178ab5b7d3..8f75e145e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.79"
+LINUX_VERSION ?= "6.1.80"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_meta ?= "1a5f3ae5c51d6698be51e36bf547433564338b18"
+SRCREV_machine ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_meta ?= "4b4e682a21aa2796eb9ac95363cfd3849690f550"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index ec84d2614c..9e9f796980 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4c6c7312e0e95f7b076f86ef1d791c78d82ddeee"
-SRCREV_machine:qemuarm64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_machine:qemuloongarch64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_machine:qemumips ?= "b2a27a5acb88b991bc6d822f9fdc308d5a108583"
-SRCREV_machine:qemuppc ?= "ef1506156c8b381a51c4937c43bca036170df29e"
-SRCREV_machine:qemuriscv64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_machine:qemuriscv32 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_machine:qemux86 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_machine:qemux86-64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_machine:qemumips64 ?= "3a17a35babd86c4bc9121469801a04248bf7ae99"
-SRCREV_machine ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
-SRCREV_meta ?= "1a5f3ae5c51d6698be51e36bf547433564338b18"
+SRCREV_machine:qemuarm ?= "d46a9061129185398c5550d2d37ad9e628a488d3"
+SRCREV_machine:qemuarm64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_machine:qemuloongarch64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_machine:qemumips ?= "c511f69211cb6dc994a92478449aa022a0fc367a"
+SRCREV_machine:qemuppc ?= "fc16624451c0d2d7b7a34addf4c5f4f96950614e"
+SRCREV_machine:qemuriscv64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_machine:qemuriscv32 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_machine:qemux86 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_machine:qemux86-64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_machine:qemumips64 ?= "0c7a9b0639caf832c1b82edc0334880a4a093cda"
+SRCREV_machine ?= "878c7bd1da5733d94302744caeffd6952fb21946"
+SRCREV_meta ?= "4b4e682a21aa2796eb9ac95363cfd3849690f550"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "81e1dc2f70014b9523dd02ca763788e4f81e5bac"
+SRCREV_machine:class-devupstream ?= "a3eb3a74aa8c94e6c8130b55f3b031f29162868c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.79"
+LINUX_VERSION ?= "6.1.80"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


