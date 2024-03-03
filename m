Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B126FC54E4A
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 16:34:23 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.76567.1709483661487801136
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 08:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ef4gFvzs;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78825d29476so17631285a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709483660; x=1710088460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuDoPguPYEhKokrnA6p/sNsyrStLgnEPvrH/3xfVMeA=;
        b=ef4gFvzs2Q5Ua4yEM4TLgEoBtGbEgQccdzXzPeuPIz+Ujjqj+9xEV2ZCKSwgzp8AdG
         +e2asPx6aTZ/b3I7M03uE04g2nWhMCgHVKetZFzY27OBiTI1jpcpyKWL3GDVqumcMiDi
         VDcs5Lm+mFfmU2MaeLVBgW22tYyZKajY3/IUk+jBpCo0pX5fdQ5c02OidfM3CnzzjXfu
         wgy9JO6GwiU3cncvbm07nu8ulxxXOzszs/WlJhPlpIeG/i2CdO2lDIPdUUQz4Zvfrl0S
         nn8Y3MI0UcBHs7BEz0tZohLybqh+4Bq3awZL7B6UFDdxGccYwwpUDJRvA30hbtOfFM9R
         mjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709483660; x=1710088460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuDoPguPYEhKokrnA6p/sNsyrStLgnEPvrH/3xfVMeA=;
        b=IQuFVGl+DKLouMoswYpOubnifaPdYen8zYhoNbF6xI8fF8EyGeCvzT3DF4NFul2IN3
         5zVTT7e1P5Bt1hL+R3lDNSj6lDi8yII2PSWTrzoRKoaX5q804j3U9ndy+obm8WqkVZxt
         ROB5IGmWwFNZldLzRvwYX3/p7oG8hsxpgpJdMhQjjua1f8zkp67GaOdZEp7LQqGZDfIY
         Teey402uK4318e/EGhv+XQkaIrjSkTfGikB2pC6rLVgSH1nONITJmta3zpwpTSUAQN0y
         XcPHWVszUSZTQ9sEf5ZjCfRhQp1x/YwYpDvRv5+2qXjg/uQWmdBPNYAokRo0lhQCdx57
         RssQ==
X-Gm-Message-State: AOJu0YzxZbVAnUNuckeELgArmwmIZV/L+/DHWjjmGNH8VTIPU/ttZps7
	eZi6El/CQibJ+JP3YqJIvzYj4MAtRz4ZbE2e3u7uN/+c5p+CmK/I7AU1Tk+NQws=
X-Google-Smtp-Source: AGHT+IEMB3W2CGcCUwxJ95vocKUY5gI4kHmmID+Dg/yyJz2+jIq4jnxnyGl/5gpkiV1RLl7YpZ5yxw==
X-Received: by 2002:a05:620a:4708:b0:788:19b5:fa29 with SMTP id bs8-20020a05620a470800b0078819b5fa29mr6466073qkb.17.1709483659968;
        Sun, 03 Mar 2024 08:34:19 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id t20-20020a05620a0b1400b007881ed0f87dsm1146313qkg.65.2024.03.03.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 08:34:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/6.6: update to v6.6.20
Date: Sun,  3 Mar 2024 11:34:15 -0500
Message-Id: <20240303163416.11875-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240303163416.11875-1-bruce.ashfield@gmail.com>
References: <20240303163416.11875-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 16:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196570

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    9b4a8eac17f0 Linux 6.6.20
    af0d04f02145 fs/ntfs3: fix build without CONFIG_NTFS3_LZX_XPRESS
    0700f4e154f8 Linux 6.6.19
    f6e4aca0dd8c ahci: Extend ASM1061 43-bit DMA address quirk to other ASM106x parts
    1f9b7a5d023a ata: ahci: add identifiers for ASM2116 series adapters
    7e7a81f9f2da mptcp: add needs_id for netlink appending addr
    6931f9029aa6 mptcp: userspace pm send RM_ADDR for ID 0
    697128a3e2e6 selftests: mptcp: add mptcp_lib_get_counter
    358f02b84fbb selftests: mptcp: join: stop transfer when check is done (part 2)
    6156277d1b26 mm: zswap: fix missing folio cleanup in writeback race path
    7a3610956d3b mm/zswap: invalidate duplicate entry when !zswap_enabled
    a259173bf265 selftests: mptcp: join: stop transfer when check is done (part 1)
    b81fc6c229ec i2c: imx: when being a target, mark the last read as processed
    10c6b90e9753 drm/amd/display: Fix memory leak in dm_sw_fini()
    7a8a8a6a4f1e selftests/iommu: fix the config fragment
    20e1e1a2b8a4 drm/syncobj: handle NULL fence in syncobj_eventfd_entry_func
    716cfee8053e drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
    c7818378953d net: phy: realtek: Fix rtl8211f_config_init() for RTL8211F(D)(I)-VD-CG PHY
    8fbc19196dbe Fix write to cloned skb in ipv6_hop_ioam()
    0a9f558c72c4 phonet/pep: fix racy skb_queue_empty() use
    3ebd19073efd phonet: take correct lock to peek at the RX queue
    9adfd66b42d2 net: sparx5: Add spinlock for frame transmission from CPU
    88895d424720 net/sched: flower: Add lock protection when remove filter handle
    30d8d56aee70 devlink: fix port dump cmd type
    a702e9883342 tools: ynl: don't leak mcast_groups on init error
    91addaf5f02b tools: ynl: make sure we always pass yarg to mnl_cb_run
    18a3d49aee31 net: mctp: put sock on tag allocation failure
    73a7cdb48779 netfilter: nf_tables: use kzalloc for hook allocation
    fe9f4d1c531a netfilter: nf_tables: register hooks last when adding new chain/flowtable
    9256ab9232e3 netfilter: nft_flow_offload: release dst in case direct xmit path is used
    558b00a30e05 netfilter: nft_flow_offload: reset dst in route object after setting up flow
    f2135bbf1494 netfilter: nf_tables: set dormant flag on hook register failure
    4f13a79ea3cf tls: don't skip over different type records from the rx_list
    3b952d8fdfcf tls: stop recv() if initial process_rx_list gave us non-DATA
    80b1d6a0c0c0 tls: break out of main loop when PEEK gets a non-data record
    f006c45a3ea4 hwmon: (nct6775) Fix access to temperature configuration registers
    50b30655b224 cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback()
    9b099ed46dca bpf, sockmap: Fix NULL pointer dereference in sk_psock_verdict_data_ready()
    ef6566d10cf7 s390: use the correct count for __iowrite64_copy()
    0a32395fd1e3 net: ipa: don't overrun IPA suspend interrupt registers
    734b494eac2f octeontx2-af: Consider the action set by PF
    16bc939f224d drm/i915/tv: Fix TV mode
    f9f8f23c5851 platform/x86: thinkpad_acpi: Only update profile if successfully converted
    79491ddfb429 arm64/sme: Restore SMCR_EL1.EZT0 on exit from suspend
    7c892383227f arm64/sme: Restore SME registers on exit from suspend
    a3f2c083cb57 arp: Prevent overflow in arp_req_get().
    919092bd5482 devlink: fix possible use-after-free and memory leaks in devlink_init()
    9e02973dbc6a ipv6: sr: fix possible use-after-free and null-ptr-deref
    6e6065dd25b6 afs: Increase buffer size in afs_update_volume_status()
    287a0e6d3a62 parisc: Fix stack unwinder
    8327ed12e8eb bpf: Fix racing between bpf_timer_cancel_and_free and bpf_timer_cancel
    d4c58764dab8 ata: ahci_ceva: fix error handling for Xilinx GT PHY support
    3e831970cf7f selftests: bonding: set active slave to primary eth1 specifically
    b8315b2e25b4 powerpc/pseries/iommu: DLPAR add doesn't completely initialize pci_controller
    7bcb0a2510ce net: bcmasp: Sanity check is off by one
    ae24a16a8343 net: bcmasp: Indicate MAC is in charge of PHY PM
    cf761c81e413 ipv6: properly combine dev_base_seq and ipv6.dev_addr_genid
    6634a8ecacc6 ipv4: properly combine dev_base_seq and ipv4.dev_addr_genid
    37067e6bc241 net: stmmac: Fix incorrect dereference in interrupt handlers
    3a0060d2ba7c x86/numa: Fix the sort compare func used in numa_fill_memblks()
    b5bf39cd0878 x86/numa: Fix the address overlap check in numa_fill_memblks()
    b6979032552b nouveau: fix function cast warnings
    28cdbbd38a44 net/sched: act_mirred: don't override retval if we already lost the skb
    7c787888d164 net/sched: act_mirred: use the backlog for mirred ingress
    73db191dc30d net/sched: act_mirred: Create function tcf_mirred_to_dev and improve readability
    334a8348b2df dccp/tcp: Unhash sk from ehash for tb2 alloc failure after check_estalblished().
    a83856bd0c24 net: bridge: switchdev: Ensure deferred event delivery on unoffload
    603be95437e7 net: bridge: switchdev: Skip MDB replays of deferred events on offload
    0706faf631d7 scsi: jazz_esp: Only build if SCSI core is builtin
    4f5b15c15e60 scsi: smartpqi: Fix disable_managed_interrupts
    239b85a9a977 bpf, scripts: Correct GPL license name
    320767103644 RDMA/srpt: fix function pointer cast warnings
    f05332254350 xsk: Add truesize to skb_add_rx_frag().
    0f7798768f21 arm64: dts: rockchip: Correct Indiedroid Nova GPIO Names
    9ff254f14b19 arm64: dts: rockchip: set num-cs property for spi on px30
    95175dda017c RDMA/qedr: Fix qedr_create_user_qp error flow
    c99e6b267d76 iommufd/iova_bitmap: Consider page offset for the pages to be pinned
    929766dadbd2 iommufd/iova_bitmap: Switch iova_bitmap::bitmap to an u8 array
    634745054a52 iommufd/iova_bitmap: Bounds check mapped::pages access
    bc569f86f978 bus: imx-weim: fix valid range check
    9c29933eae40 arm64: dts: tqma8mpql: fix audio codec iov-supply
    fe2a73d57319 RDMA/srpt: Support specifying the srpt_service_guid parameter
    f562dbfd89dc RDMA/irdma: Add AE for too many RNRS
    3907d842f291 RDMA/irdma: Set the CQ read threshold for GEN 1
    9afa1e4354a1 RDMA/irdma: Validate max_send_wr and max_recv_wr
    c6f1ca235f68 RDMA/irdma: Fix KASAN issue with tasklet
    a8ef9c7f4cfd arm64: dts: imx8mp: Disable UART4 by default on Data Modul i.MX8M Plus eDM SBC
    25f7f28142a2 IB/mlx5: Don't expose debugfs entries for RRoCE general parameters if not supported
    43a6b52b7cf1 RDMA/bnxt_re: Add a missing check in bnxt_qplib_query_srq
    9abe69327407 RDMA/bnxt_re: Return error for SRQ resize
    b41d0ade0398 IB/hfi1: Fix a memleak in init_credit_return
    b96f500dbbc3 bpf: Derive source IP addr via bpf_*_fib_lookup()
    980278aca1f8 xen/events: fix error code in xen_bind_pirq_msi_to_irq()
    658750e3d8ed Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
    7211800091a9 drm/amd/display: Fix buffer overflow in 'get_host_router_total_dp_tunnel_bw()'
    a1baf5734231 drm/amd/display: Avoid enum conversion warning
    824c15ad0910 smb3: add missing null server pointer check
    a7f34a068467 selftests: mptcp: diag: unique 'cestab' subtest names
    6b51994e1994 selftests: mptcp: diag: unique 'in use' subtest names
    509bf4e553eb selftests: mptcp: diag: fix bash warnings on older kernels
    1f24ba67ba49 selftests: mptcp: diag: check CURRESTAB counters
    1b1ce669a1f0 selftests: mptcp: pm nl: avoid error msg on older kernels
    4f1aa3853b95 selftests: mptcp: pm nl: also list skipped tests
    db887e24f95f selftests: mptcp: simult flows: fix some subtest names
    5b9bc8e6275a selftests: mptcp: userspace_pm: unique subtest names
    1ea7b252b47f mptcp: fix duplicate subflow creation
    2dba5774e8ed mptcp: fix data races on remote_id
    ba2cf922502c mptcp: fix data races on local_id
    e074c8297ee4 mptcp: fix lockless access in subflow ULP diag
    176421d7afba mptcp: add needs_id for userspace appending addr
    6aba8cf676c0 usb: roles: don't get/set_role() when usb_role_switch is unregistered
    4b45829440b1 usb: roles: fix NULL pointer issue when put module's reference
    da7fc10bc471 usb: gadget: omap_udc: fix USB gadget regression on Palm TE
    2b7ec68869d5 usb: gadget: ncm: Avoid dropping datagrams of properly parsed NTBs
    70e8038813f9 usb: cdns3: fix memory double free when handle zero packet
    29e42e1578a1 usb: cdns3: fixed memory use after free at cdns3_gadget_ep_disable()
    11f656fc0a56 usb: cdnsp: fixed issue with incorrect detecting CDNSP family controllers
    a92de02692b4 usb: cdnsp: blocked some cdns3 specific code
    d3999e342099 usb: dwc3: gadget: Don't disconnect if not started
    9319ecb8380f serial: amba-pl011: Fix DMA transmission in RS485 mode
    3e3578ca1b87 serial: stm32: do not always set SER_RS485_RX_DURING_TX if RS485 is enabled
    6cf046b3acea Revert "usb: typec: tcpm: reset counter when enter into unattached state after try role"
    ba84bbbcd5b8 erofs: fix refcount on the metabuf used for inode lookup
    763f1f13d856 dm-integrity, dm-verity: reduce stack usage for recheck
    97ba7c1f9c0a ARM: ep93xx: Add terminator to gpiod_lookup_table
    804bd8650a3a l2tp: pass correct message length to ip6_append_data
    5ef293c3e0b2 PCI/MSI: Prevent MSI hardware interrupt number truncation
    fbe1049a4d48 irqchip/sifive-plic: Enable interrupt if needed before EOI
    4332f54153de irqchip/gic-v3-its: Do not assume vPE tables are preallocated
    a9ab338683a2 irqchip/mbigen: Don't use bus_get_dev_root() to find the parent
    b0365460e945 crypto: virtio/akcipher - Fix stack overflow on memcpy
    ba6b8b02a331 gtp: fix use-after-free and null-ptr-deref in gtp_genl_dump_pdp()
    cca20208515e accel/ivpu: Don't enable any tiles by default on VPU40xx
    3f70ed98f776 KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
    fcf90b4703bd KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
    02dad157ba11 md: Fix missing release of 'active_io' for flush
    8b004583dbc9 sparc: Fix undefined reference to fb_is_primary_device
    38e921616320 cachefiles: fix memory leak in cachefiles_add_cache()
    557cac23bee3 platform/x86: touchscreen_dmi: Allow partial (prefix) matches for ACPI names
    e78a4e221ebf platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler
    9cad9a2e896c mm/damon/reclaim: fix quota stauts loss due to online tunings
    8350888b0226 mm: memcontrol: clarify swapaccount=0 deprecation warning
    3c4441b23bf7 mm/damon/lru_sort: fix quota status loss due to online tunings
    305152314df8 mm/swap: fix race when skipping swapcache
    0b34dca1bfd5 selftests/mm: uffd-unit-test check if huge page size is 0
    3c884ee7c5d4 scsi: core: Consult supported VPD page list prior to fetching page
    4ebc079f0c7d scsi: target: pscsi: Fix bio_put() for error case
    9eb04add2a26 scsi: sd: usb_storage: uas: Access media prior to querying device properties
    2cc1a530ab31 cxl/pci: Fix disabling memory if DVSEC CXL Range does not match a CFMWS window
    8d584cc8e71e cxl/acpi: Fix load failures due to single window creation failure
    e5cc2309f6b3 dm-verity: recheck the hash after a failure
    64ba01a36598 dm-crypt: don't modify the data when using authenticated encryption
    d6824a28b244 dm-integrity: recheck the integrity tag after a failure
    78d41d9ba0b1 Revert "parisc: Only list existing CPUs in cpu_possible_mask"
    0f6cf136974a dm-crypt: recheck the integrity tag after a failure
    e6316749d603 lib/Kconfig.debug: TEST_IOV_ITER depends on MMU
    e7e23fc5d5fe fs/aio: Restrict kiocb_set_cancel_fn() to I/O submitted via libaio
    699e2648e195 ata: libata-core: Do not try to set sleeping devices to standby
    cf245e831afc s390/cio: fix invalid -EBUSY on ccw_device_start
    fec5aea66916 drm/amd/display: adjust few initialization order in dm
    d715ee6cbe7c drm/meson: Don't remove bridges which are created by other drivers
    47bacc3c7fbb drm/ttm: Fix an invalid freeing on already freed page in error path
    0bb020dca6d8 btrfs: defrag: avoid unnecessary defrag caused by incorrect extent size
    b1ec3d6b86fd LoongArch: Update cpu_sibling_map when disabling nonboot CPUs
    dffdf7c783ef LoongArch: Disable IRQ before init_fn() for nonboot CPUs
    ea459e6926f0 LoongArch: Call early_init_fdt_scan_reserved_mem() earlier
    50297906f81c docs: Instruct LaTeX to cope with deeper nesting
    48985d64c4c8 x86/bugs: Add asm helpers for executing VERW
    a2fef1d81bec IB/hfi1: Fix sdma.h tx->num_descs off-by-one error
    20980195ec8d xen/events: close evtchn after mapping cleanup
    636ac94cee72 xen/events: modify internal [un]bind interfaces
    40f14760da83 xen/events: drop xen_allocate_irqs_dynamic()
    666860d56d83 xen/events: remove some simple helpers from events_base.c
    b79345efd038 xen/events: reduce externally visible helper functions
    3c8f5965a993 xen: evtchn: Allow shared registration of IRQ handers
    71783d1ff652 drm/amd/display: fixed integer types and null check locations
    622c827544ef drm/amd/display: Request usb4 bw for mst streams
    c3682b63c60f drm/amd/display: Add dpia display mode validation logic
    b45df837fe87 mptcp: corner case locking for rx path fields initialization
    9326d0357ab0 mptcp: fix more tx path fields initialization
    d52b3c2b2951 mptcp: use mptcp_set_state
    565575473139 mptcp: add CurrEstab MIB counter support
    c5e3ec783484 smb3: clarify mount warning
    dd40cbafb1d2 cifs: handle cases where multiple sessions share connection
    cd743cfead99 cifs: change tcon status when need_reconnect is set on it
    8946924ff324 virtio-blk: Ensure no requests in virtqueues before deleting vqs.
    cacc0a9c34a8 smb: client: set correct d_type for reparse points under DFS mounts
    c19453cc16ad drm/amdgpu: Fix HDP flush for VFs on nbio v7.9
    cb4541cabb53 drm/amdgpu: Fix shared buff copy to user
    61c0a633bdc6 drm/amdgpu: reset gpu for s3 suspend abort case
    7a3a0b0c7f47 drm/amdgpu: skip to program GFXDEC registers for suspend abort
    7d7046a6caf2 libceph: fail sparse-read if the data length doesn't match
    9fe6ad655fe0 firewire: core: send bus reset promptly on gap count error
    5175a72c8e99 accel/ivpu/40xx: Stop passing SKU boot parameters to FW
    9895188644ee accel/ivpu: Disable d3hot_delay on all NPU generations
    e11aa132160c accel/ivpu: Force snooping for MMU writes
    d382f733c8ba LoongArch: vDSO: Disable UBSAN instrumentation
    88e189bd16e5 LoongArch: Change acpi_core_pic[NR_CPUS] to acpi_core_pic[MAX_CORE_PIC]
    3ed93e781a48 LoongArch: Select HAVE_ARCH_SECCOMP to use the common SECCOMP menu
    a0a48dd597f5 LoongArch: Select ARCH_ENABLE_THP_MIGRATION instead of redefining it
    4dbbd8195a68 scsi: ufs: core: Remove the ufshcd_release() in ufshcd_err_handling_prepare()
    7ac9e18f5d66 scsi: ufs: core: Fix shift issue in ufshcd_clear_cmd()
    51a5ca984866 scsi: lpfc: Use unsigned type for num_sge
    b9c3a26bf95c hwmon: (coretemp) Enlarge per package core count limit
    5c7ed4d957a8 efi: Don't add memblocks for soft-reserved memory
    cf3d6813601f efi: runtime: Fix potential overflow of soft-reserved region size
    3dce50ca9939 wifi: iwlwifi: do not announce EPCS support
    c9da889a37fc wifi: mac80211: accept broadcast probe responses on 6 GHz
    415f8e9854bb wifi: mac80211: adding missing drv_mgd_complete_tx() call
    c7a4f932b3a6 wifi: mac80211: set station RX-NSS on reconfig
    52fff5799e3d fs/ntfs3: Fix oob in ntfs_listxattr
    ded8bf5b3687 fs/ntfs3: Update inode->i_size after success write into compressed file
    8c77398c7261 fs/ntfs3: Fixed overflow check in mi_enum_attr()
    eac2e00f3c31 fs/ntfs3: Correct function is_rst_area_valid
    f4cf29c6772e fs/ntfs3: Use i_size_read and i_size_write
    c55deec3ffdd fs/ntfs3: Prevent generic message "attempt to access beyond end of device"
    8525c77e2f7f fs/ntfs3: use non-movable memory for ntfs3 MFT buffer cache
    86cd46312a30 fs/ntfs3: Use kvfree to free memory allocated by kvmalloc
    adcc0ab3e79f fs/ntfs3: Disable ATTR_LIST_ENTRY size check
    947c3f3d31ea fs/ntfs3: Add NULL ptr dereference checking at the end of attr_allocate_frame()
    323b0ab3f235 fs/ntfs3: ntfs3_forced_shutdown use int instead of bool
    f73f939792fc fs/ntfs3: Implement super_operations::shutdown
    7e0aff0aab65 fs/ntfs3: Drop suid and sgid bits as a part of fpunch
    c28efa873a2a fs/ntfs3: Add file_modified
    07b918639367 fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"
    289257127a18 fs/ntfs3: Fix multithreaded stress test
    e0b64e4ad2eb fs/ntfs3: Reduce stack usage
    fa2a041a490d fs/ntfs3: Print warning while fixing hard links count
    d46c2ef09180 fs/ntfs3: Correct hard links updating when dealing with DOS names
    d316783dfdc1 fs/ntfs3: Improve ntfs_dir_count
    06144cdddad6 fs/ntfs3: Modified fix directory element type detection
    15735a62add3 fs/ntfs3: Improve alternative boot processing
    4390f74d09a0 Input: i8042 - add Fujitsu Lifebook U728 to i8042 quirk table
    f5411b766627 ext4: correct the hole length returned by ext4_map_blocks()
    2fdb5551e35b smb: client: increase number of PDUs allowed in a compound request
    2b1f28ee49da cifs: do not search for channel if server is terminating
    fad689fce093 nvmet-fc: take ref count on tgtport before delete assoc
    eaf0971fdabf nvmet-fc: avoid deadlock on delete association path
    399b70e8eadc nvmet-fc: abort command when there is no binding
    f2879398c295 nvmet-fc: hold reference on hostport match
    ccd49adde054 nvmet-fc: defer cleanup using RCU properly
    2baa7272f2d9 nvmet-fc: release reference on target port
    95a9ff330734 nvmet-fcloop: swap the list_add_tail arguments
    baa6b7eb8c66 nvme-fc: do not wait in vain when unloading module
    ffd63f243735 ALSA: usb-audio: Ignore clock selector errors for single connection
    fabab199b197 ASoC: wm_adsp: Don't overwrite fwf_name with the default
    567f1b1da5da cifs: make sure that channel scaling is done only once
    e34e4e6d8c69 drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz
    5a1bd2143fd7 drm/amdkfd: Use correct drm device for cgroup permission check
    4c09593b31a5 netfilter: conntrack: check SCTP_CID_SHUTDOWN_ACK for vtag setting in sctp_new
    9e8e25f20191 misc: open-dice: Fix spurious lockdep warning
    17a6d7a0a7a9 Input: xpad - add Lenovo Legion Go controllers
    2c889761d472 spi: sh-msiof: avoid integer overflow in constants
    f7d799076a55 regulator (max5970): Fix IRQ handler
    04d46a95642e ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
    ee277704a44e ALSA: usb-audio: Check presence of valid altsetting control
    21857eed5066 usb: ucsi_acpi: Quirk to ack a connector change ack cmd
    307fc03dc433 nvmet-tcp: fix nvme tcp ida memory leak
    83527a13740f HID: nvidia-shield: Add missing null pointer checks to LED initialization
    034a0061b2dc ALSA: hda: Increase default bdl_pos_adj for Apollo Lake
    580118d5c6e5 ALSA: hda: Replace numeric device IDs with constant values
    a905b2eccfd2 HID: logitech-hidpp: add support for Logitech G Pro X Superlight 2
    e1b38b919d3d regulator: pwm-regulator: Add validity checks in continuous .get_voltage
    68da1d65b2e3 ASoC: amd: acp: Add check for cpu dai link initialization
    7b24760f3a3c dmaengine: ti: edma: Add some null pointer checks to the edma_probe
    2ccbf84ed3fe Input: goodix - accept ACPI resources with gpio_count == 3 && gpio_int_idx == 0
    d3bbe77a76bc ext4: avoid allocating blocks from corrupted group in ext4_mb_find_by_goal()
    0184747b552d ext4: avoid allocating blocks from corrupted group in ext4_mb_try_best_found()
    f32d2a745b02 ext4: avoid dividing by 0 in mb_update_avg_fragment_size() when block bitmap corrupt
    720751b57f0a platform/x86: touchscreen_dmi: Add info for the TECLAST X16 Plus tablet
    f778a45784d3 MIPS: reserve exception vector space ONLY ONCE
    64783eaa37b7 ARM: dts: Fix TPM schema violations
    b0dd4d7ada6f ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
    ab7318c79570 spi: cs42l43: Handle error from devm_pm_runtime_enable
    673629018ba0 aoe: avoid potential deadlock at set_capacity
    89f67051613c ahci: asm1166: correct count of reported ports
    f642fcf3f7e6 cifs: helper function to check replayable error codes
    c09de6bb3ada cifs: translate network errors on send to -ECONNABORTED
    59e04d39fc29 cifs: cifs_pick_channel should try selecting active channels
    8fbefa7a755d smb: Work around Clang __bdos() type confusion
    0f1bae071de9 block: Fix WARNING in _copy_from_iter
    d637b5118274 spi: hisi-sfc-v3xx: Return IRQ_NONE if no interrupts were detected
    8298ea0f51a9 spi: intel-pci: Add support for Arrow Lake SPI serial flash
    763c59714cf4 platform/mellanox: mlxbf-tmfifo: Drop Tx network packet when Tx TmFIFO is full
    99f1abc34a6d fbdev: sis: Error out if pixclock equals zero
    bc3c2e58d73b fbdev: savage: Error out if pixclock equals zero
    54b79d878696 wifi: mac80211: fix race condition on enabling fast-xmit
    29df20cae2ce wifi: cfg80211: fix missing interfaces when dumping
    22dced37d9c7 dmaengine: dw-edma: increase size of 'name' in debugfs code
    9f11992462ad dmaengine: fsl-qdma: increase size of 'irq_name'
    6e400d6b960a dmaengine: shdma: increase size of 'dev_id'
    8d76726eeb11 cifs: open_cached_dir should not rely on primary channel
    36bc5040c863 scsi: target: core: Add TMF to tmr_list handling
    12d43aec0e75 tools: selftests: riscv: Fix compile warnings in mm tests
    a613c646660a tools: selftests: riscv: Fix compile warnings in vector tests
    df75b8ef7122 scsi: smartpqi: Fix logical volume rescan race condition
    ce10905116e6 scsi: smartpqi: Add new controller PCI IDs
    43ee59fa01c8 dmaengine: apple-admac: Keep upper bits of REG_BUS_WIDTH
    5babeec518c2 riscv/efistub: Ensure GP-relative addressing is not used
    6ea2f3b9b9f6 PCI: dwc: Fix a 64bit bug in dw_pcie_ep_raise_msix_irq()
    74fd1b8c4419 sched/rt: Disallow writing invalid values to sched_rt_period_us

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index cde9c48a84..46c322ed36 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3c1e1f6195b25babe903679416ed839a53c8b3e8"
-SRCREV_meta ?= "229dc6171461800d7b4ab16f9c8b35a47a48897f"
+SRCREV_machine ?= "7c5911ab2e70bf84bb38a598b2a7e094618a9620"
+SRCREV_meta ?= "8cd63077f67a0f7ff639a2ff24c82b09d71048a4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.18"
+LINUX_VERSION ?= "6.6.20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 9d206430c3..c2a0387d55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.18"
+LINUX_VERSION ?= "6.6.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_meta ?= "229dc6171461800d7b4ab16f9c8b35a47a48897f"
+SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_meta ?= "8cd63077f67a0f7ff639a2ff24c82b09d71048a4"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index beb2628121..098b0b3324 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ea82a603d36f829f4267018d4c425f5f921074ea"
-SRCREV_machine:qemuarm64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemuloongarch64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemumips ?= "cf67a27829c10d065e0447af29ee330e385bcafb"
-SRCREV_machine:qemuppc ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemuriscv64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemuriscv32 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemux86 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemux86-64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:qemumips64 ?= "52456b6cb3393c1848da3ccdae37727c31896f1c"
-SRCREV_machine ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_meta ?= "229dc6171461800d7b4ab16f9c8b35a47a48897f"
+SRCREV_machine:qemuarm ?= "9d30fb4668cd7087e81b40f223cdd0090863602b"
+SRCREV_machine:qemuarm64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemuloongarch64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemumips ?= "4b49da8bb522bdaf928855c2c102fa839625c6c1"
+SRCREV_machine:qemuppc ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemuriscv64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemuriscv32 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemux86 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemux86-64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_machine:qemumips64 ?= "8e7605bafdfeb842396292181d524b183a1e13d6"
+SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
+SRCREV_meta ?= "8cd63077f67a0f7ff639a2ff24c82b09d71048a4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d8a27ea2c98685cdaa5fa66c809c7069a4ff394b"
+SRCREV_machine:class-devupstream ?= "9b4a8eac17f0d840729384618b4b1e876233026c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.18"
+LINUX_VERSION ?= "6.6.20"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


