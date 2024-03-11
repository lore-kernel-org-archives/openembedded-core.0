Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62998C54E69
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:41:13 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.67782.1710175267921287825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mEQbZGIM;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-690b100da62so32232416d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175267; x=1710780067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78lEm8b2VlX/4CyFOavk/y02vJNsp7g9q6WWazUp6es=;
        b=mEQbZGIMKDL0h71m5obtFx1GvXMdz1FB3jnwA5dg8axhcwfuQlD9b1zmNH7+W7I1VF
         mPkBg0gaBZ/Dfyo5h8yhjOdEjiBZQ9QxzJArXSayrLEumvK8Q43FRPF+W2FBlem+ikgi
         RG5lXQ17aVsieiifIeBoAGrjoI2HcruCxOHv1S0HvST/aeuS6iFop2Z8Mkecnfy/8pps
         mVtSwm5Unm6cMtwxr30eNpzP+Vrc/tZHd7s7ad6inivdrG6E85ulAd/0B8sLodBC4+uQ
         81M/Z4c9YE1M6Nns2shlvrZG30SFGL4tzselLPeWNzZjbotn8MAKkZ1b5+VlxHEMtCOx
         kCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175267; x=1710780067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78lEm8b2VlX/4CyFOavk/y02vJNsp7g9q6WWazUp6es=;
        b=uiL9XO8VXSi2vqpgGrVI2pAsV3hy7Z0xdkfdlSYnG4Fk/bpAkZfQkDSaAFAXbWK7jG
         1dL7AAOgavUAcYkL+0JLqs2NuTxuBzBLTFCDuzuWZpSNhQnuICe3iWzL5JYH9CoCCgRG
         Ss1VHQ24DT8Rj3IH//X4txUT8ISruo/RRqGgUfLqtiiBs2FrZnxrFS8GOvtlwsuaUFAf
         fE5VY8erTdErgNUQhBr/SZM9lQVmn173Gq/BLn+0YemefFqIqtfLWeunqI3E8YG8qE6w
         WLfoAKz/1y3ZxCIcCqwVDwMy8wDWacWYmavtnann/CO90Q6SjksXPMP4aVHRstXWYwSG
         W9BA==
X-Gm-Message-State: AOJu0YxxJCYBXFtaCsYsH46H3j8roRjtK5mXi7/yguOA16dZhaT6AsiF
	VcgiuyWSwEzAMA6Un1gG9KiDHuKkg/MY6RNMlozSDtJFCev8lokr2SrDdsqg88U=
X-Google-Smtp-Source: AGHT+IEAP/TGfYAsWgay8kuZkAF27Hx/C5uhz/lxRAXoqVLdd0r3zS/vl/ZwNU1AqemnWC98KTPEWg==
X-Received: by 2002:a05:6214:5008:b0:690:aba2:d1fd with SMTP id jo8-20020a056214500800b00690aba2d1fdmr9902987qvb.15.1710175266743;
        Mon, 11 Mar 2024 09:41:06 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id y2-20020ad45302000000b00690c99e7ad5sm1793928qvr.110.2024.03.11.09.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:41:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7][kirkstone] linux-yocto/5.15: update to v5.15.150
Date: Mon, 11 Mar 2024 12:40:55 -0400
Message-Id: <f4294ebbcb6bdc8029ed63c8d90083b9ecc6c0dc.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710175022.git.bruce.ashfield@gmail.com>
References: <cover.1710175022.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196949

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    80efc6265290 Linux 5.15.150
    da6cabc1981e r8169: use new PM macros
    b7f3fac6d301 netfilter: nf_tables: can't schedule in nft_chain_validate
    a4efc62cd1ed ext4: avoid bb_free and bb_fragments inconsistency in mb_free_blocks()
    c1317822e2de ext4: regenerate buddy after block freeing failed if under fc replay
    d82ec7529c5f netfilter: nf_tables: fix scheduling-while-atomic splat
    97eaa2955db4 arp: Prevent overflow in arp_req_get().
    d7b6fa97ec89 fs/aio: Restrict kiocb_set_cancel_fn() to I/O submitted via libaio
    df31d05f0678 cifs: fix mid leak during reconnection after timeout threshold
    aade859419ce i2c: imx: when being a target, mark the last read as processed
    cb21407f0b39 i2c: imx: Add timer for handling the stop condition
    33f649f1b1ce drm/amd/display: Fix memory leak in dm_sw_fini()
    9a03126588e5 drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
    13b57b5cd591 netfilter: nft_flow_offload: release dst in case direct xmit path is used
    4c167af9f6b5 netfilter: nft_flow_offload: reset dst in route object after setting up flow
    7c71b831220e netfilter: flowtable: simplify route logic
    664264a5c55b netfilter: nf_tables: set dormant flag on hook register failure
    4338032aa90b tls: stop recv() if initial process_rx_list gave us non-DATA
    ea845237a39d tls: rx: drop pointless else after goto
    8b32e43a80a1 tls: rx: jump to a more appropriate label
    39603a6d4e71 s390: use the correct count for __iowrite64_copy()
    8cae520f21ad octeontx2-af: Consider the action set by PF
    6dae096960bc drm/nouveau/instmem: fix uninitialized_var.cocci warning
    4d3b2bd995ed net: dev: Convert sa_data to flexible array in struct sockaddr
    d65ec3e48f70 packet: move from strlcpy with unused retval to strscpy
    91b020aaa1e5 ipv6: sr: fix possible use-after-free and null-ptr-deref
    e56662160fc2 afs: Increase buffer size in afs_update_volume_status()
    5268bb02107b bpf: Fix racing between bpf_timer_cancel_and_free and bpf_timer_cancel
    6800ad7417f3 ata: ahci_ceva: fix error handling for Xilinx GT PHY support
    7fcc31a3a705 ata: libahci_platform: Introduce reset assertion/deassertion methods
    ddac2e0e656e ata: libahci_platform: Convert to using devm bulk clocks API
    302b92b37304 ipv6: properly combine dev_base_seq and ipv6.dev_addr_genid
    a75b49547831 ipv4: properly combine dev_base_seq and ipv4.dev_addr_genid
    2a7b878a7dad net: stmmac: Fix incorrect dereference in interrupt handlers
    a41d9142d2dd nouveau: fix function cast warnings
    1087c284fd11 scsi: jazz_esp: Only build if SCSI core is builtin
    4e395fb89e7e bpf, scripts: Correct GPL license name
    cd6070d9f5e7 RDMA/srpt: fix function pointer cast warnings
    656bd1702fea arm64: dts: rockchip: set num-cs property for spi on px30
    135e5465fefa RDMA/qedr: Fix qedr_create_user_qp error flow
    989af2f29342 RDMA/srpt: Support specifying the srpt_service_guid parameter
    b6e660e07622 RDMA/irdma: Add AE for too many RNRS
    056ed95befd1 RDMA/irdma: Set the CQ read threshold for GEN 1
    a95d4cf82775 RDMA/irdma: Validate max_send_wr and max_recv_wr
    635d79aa477f RDMA/irdma: Fix KASAN issue with tasklet
    aeb5ac1c9d10 RDMA/bnxt_re: Return error for SRQ resize
    52de5805c147 IB/hfi1: Fix a memleak in init_credit_return
    48c63a174489 cifs: add a warning when the in-flight count goes negative
    6538b6d13ce3 xhci: track port suspend state correctly in unsuccessful resume cases
    8839d5728baa xhci: decouple usb2 port resume and get_port_status request handling
    8af9de2a5ba1 xhci: clear usb2 resume related variables in one place.
    a99c8f1abef9 xhci: rename resume_done to resume_timestamp
    63f0e79cf382 xhci: move port specific items such as state completions to port structure
    ea6c19c7365d xhci: cleanup xhci_hub_control port references
    95973afc870c ACPI: resource: Skip IRQ override on ASUS ExpertBook B1502CBA
    4f080b6487bd ACPI: resource: Skip IRQ override on Asus Expertbook B2402CBA
    c2a9376d507e ACPI: resource: Add Asus ExpertBook B2502 to Asus quirks
    1b64ff947a5a ACPI: resource: Skip IRQ override on Asus Vivobook S5602ZA
    f3607954f2e6 ACPI: resource: Add ASUS model S5402ZA to quirks
    27e99d785721 ACPI: video: Add backlight=native DMI quirk for Apple iMac12,1 and iMac12,2
    cb1003c07e74 ARM: dts: BCM53573: Describe on-SoC BCM53125 rev 4 switch
    28e5e3e59b3b arm64: dts: rockchip: add SPDIF node for ROCK Pi 4
    99c8b2e99783 arm64: dts: rockchip: add ES8316 codec for ROCK Pi 4
    371036bf7666 arm64: dts: rockchip: fix regulator name on rk3399-rock-4
    92dcd7d6c606 exfat: support dynamic allocate bh for exfat_entry_set_cache
    b4dc693b29ef wifi: iwlwifi: mvm: avoid baid size integer overflow
    fa92c463eba7 igb: Fix igb_down hung on surprise removal
    16f653776caf wifi: wext-core: Fix -Wstringop-overflow warning in ioctl_standard_iw_point()
    7552020e3aa8 devlink: report devlink_port_type_warn source device
    819ca25444b3 bpf: Address KCSAN report on bpf_lru_list
    f97832620d7f wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range
    3cb43222bab8 sched/fair: Don't balance task to its current running CPU
    621619f626cb arm64: mm: fix VA-range sanity check
    0bd309f22663 arm64: set __exception_irq_entry with __irq_entry as a default
    dd0802f0a9d6 ACPI: video: Add backlight=native DMI quirk for Lenovo ThinkPad X131e (3371 AMD version)
    3cc2d66b12e0 ACPI: video: Add backlight=native DMI quirk for Apple iMac11,3
    54da51be3b7e ACPI: button: Add lid disable DMI quirk for Nextbook Ares 8A
    fa33b70513a0 btrfs: add xxhash to fast checksum implementations
    ef535e0315af posix-timers: Ensure timer ID search-loop limit is valid
    84a578961b25 md/raid10: prevent soft lockup while flush writes
    6b03364b29bd md: fix data corruption for raid456 when reshape restart while grow up
    638eaac37464 nbd: Add the maximum limit of allocated index in nbd_dev_add
    173e191012aa debugobjects: Recheck debug_objects_enabled before reporting
    de2efb42d693 netfilter: nf_tables: add rescheduling points during loop detection walks
    a022c339afca net/sched: Refactor qdisc_graft() for ingress and clsact Qdiscs
    65acad6791bf Input: iqs269a - do not poll during ATI
    13b1dee7e110 Input: iqs269a - do not poll during suspend or resume
    f33ba1ec4ad9 Input: iqs269a - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
    dba06912727b PM: core: Remove static qualifier in DEFINE_SIMPLE_DEV_PM_OPS macro
    995e77b87389 mmc: mxc: Use the new PM macros
    8bc597732c85 mmc: jz4740: Use the new PM macros
    75d4f92d8788 PM: core: Add new *_PM_OPS macros, deprecate old ones
    53f7337519a1 PM: core: Redefine pm_ptr() macro
    a51c253d8321 powerpc/eeh: Set channel state after notifying the drivers
    4570db06b724 powerpc/eeh: Small refactor of eeh_handle_normal_event()
    12dd4a0848c4 powerpc/rtas: ensure 4KB alignment for rtas_data_buf
    8afaf74307f8 powerpc/rtas: make all exports GPL
    2240f4c5f5d5 net: ethernet: ti: add missing of_node_put before return
    18721a837387 dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
    fb100de77846 clk: imx8mp: add clkout1/2 support
    3c8a513f0f6b clk: imx8mp: Add DISP2 pixel clock
    3517b6d6146c serial: 8250: Remove serial_rs485 sanitization from em485
    54974aad4a76 cifs: remove useless parameter 'is_fsctl' from SMB2_ioctl()
    15c3ddd11803 kernel/sched: Remove dl_boosted flag comment
    a1733ffd88d9 drm/i915/dg1: Update DMC_DEBUG3 register
    8102416c05bb f2fs: write checkpoint during FG_GC
    cfd5d011d6f6 f2fs: don't set GC_FAILURE_PIN for background GC
    56b522f46681 drm/amdgpu: init iommu after amdkfd device init
    572ee5086e47 tools/virtio: fix build
    80f2a246225c perf beauty: Update copy of linux/socket.h with the kernel sources
    47b6345ddb6c tools headers UAPI: Sync linux/fscrypt.h with the kernel sources
    c65a23e98e38 ARM: dts: BCM53573: Drop nonexistent "default-off" LED trigger
    2eb3d2a54ad7 acpi: property: Let args be NULL in __acpi_node_get_property_reference
    7abdd666a06f platform/x86: asus-wmi: Document the dgpu_disable sysfs attribute
    7de3c1535bdf clk: linux/clk-provider.h: fix kernel-doc warnings and typos
    b184742d2788 RDMA/siw: Correct wrong debug message
    6f6ec8aff219 RDMA/siw: Balance the reference of cep->kref in the error path
    71475bcee001 ARM: dts: BCM53573: Drop nonexistent #usb-cells
    832cf206dfe2 selftests: net: vrf-xfrm-tests: change authentication and encryption algos
    14e1f63b3918 vdpa/mlx5: Don't clear mr struct on destroy MR
    5b4f6c5ff65c MIPS: vpe-mt: drop physical_memsize
    1be5de5b642a MIPS: SMP-CPS: fix build error when HOTPLUG_CPU not set
    cc24b32d7d62 powerpc/pseries/lpar: add missing RTAS retry status handling
    3212606148b8 powerpc/perf/hv-24x7: add missing RTAS retry status handling
    e3835122ea28 powerpc/pseries/lparcfg: add missing RTAS retry status handling
    228d3c49194b clk: Honor CLK_OPS_PARENT_ENABLE in clk_core_is_enabled()
    d0e4a444557a clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
    e7076cfb72d5 clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
    83c043b92b0f powerpc/powernv/ioda: Skip unallocated resources when mapping to PE
    8c373aa1f784 Input: ads7846 - don't check penirq immediately for 7845
    6a37a429b3ee Input: ads7846 - always set last command to PWRDOWN
    199e666477d5 clk: imx: avoid memory leak
    94957e54dc70 clk: renesas: cpg-mssr: Remove superfluous check in resume code
    2d89ed2e0629 Input: ads7846 - don't report pressure for ads7845
    f992d1afd17f clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed
    d73cf59d2446 Input: iqs269a - increase interrupt handler return delay
    db06a2ae0707 Input: iqs269a - configure device with a single block write
    fdbceead4ac1 Input: iqs269a - drop unused device node references
    d93c68661ad8 RISC-V: fix funct4 definition for c.jalr in parse_asm.h
    5c5c02b069cc mtd: rawnand: sunxi: Fix the size of the last OOB region
    11fcd28df8d3 clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
    9fcba5e7bb5c clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
    7602e5e1bd04 clk: imx: imx8mp: add shared clk gate for usb suspend clk
    7d6e8d7ee13b mptcp: fix lockless access in subflow ULP diag
    256c3e6192ed usb: roles: don't get/set_role() when usb_role_switch is unregistered
    ef982fc41055 usb: roles: fix NULL pointer issue when put module's reference
    2cb66b62a5d6 usb: gadget: ncm: Avoid dropping datagrams of properly parsed NTBs
    3a2a909942b5 usb: cdns3: fix memory double free when handle zero packet
    4e5c73b15d95 usb: cdns3: fixed memory use after free at cdns3_gadget_ep_disable()
    f4928121f707 usb: cdnsp: fixed issue with incorrect detecting CDNSP family controllers
    7c532fb96ac1 usb: cdnsp: blocked some cdns3 specific code
    c98f2d25f8f6 usb: dwc3: gadget: Don't disconnect if not started
    f4fab74cb83c serial: amba-pl011: Fix DMA transmission in RS485 mode
    2c62c8984b96 x86/alternative: Make custom return thunk unconditional
    b0c9fcacf218 Revert "x86/alternative: Make custom return thunk unconditional"
    ae815291f0da x86/returnthunk: Allow different return thunks
    5ca1f6adac69 x86/ftrace: Use alternative RET encoding
    b9d69bfff6fd x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
    b810c58d8b01 x86/text-patching: Make text_gen_insn() play nice with ANNOTATE_NOENDBR
    8943e3c9446d Revert "x86/ftrace: Use alternative RET encoding"
    eec6cbbfa1e8 ARM: ep93xx: Add terminator to gpiod_lookup_table
    0da15a703951 l2tp: pass correct message length to ip6_append_data
    9d71d7a9f2a6 PCI/MSI: Prevent MSI hardware interrupt number truncation
    a576308800be gtp: fix use-after-free and null-ptr-deref in gtp_genl_dump_pdp()
    d81e2dc20395 KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
    4deb8413eccb KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
    e20b24b175c9 platform/x86: touchscreen_dmi: Allow partial (prefix) matches for ACPI names
    79d7504a24a3 platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler
    1a4371db68a3 dm-crypt: don't modify the data when using authenticated encryption
    d580f0dcb5e3 drm/ttm: Fix an invalid freeing on already freed page in error path
    47ae64df23ed IB/hfi1: Fix sdma.h tx->num_descs off-by-one error
    77cbc04a1a86 erofs: fix lz4 inplace decompression
    fbb662ffa005 pmdomain: renesas: r8a77980-sysc: CR7 must be always on
    43ea43b6fa17 ksmbd: free aux buffer if ksmbd_iov_pin_rsp_read fails
    475426ad1ae0 pmdomain: mediatek: fix race conditions with genpd
    2a52590ac523 virtio-blk: Ensure no requests in virtqueues before deleting vqs.
    b9a61ee2bb27 drm/amdgpu: reset gpu for s3 suspend abort case
    afc74fda2b5d drm/amdgpu: skip to program GFXDEC registers for suspend abort
    dcd33edd854a firewire: core: send bus reset promptly on gap count error
    a74270a1b784 scsi: lpfc: Use unsigned type for num_sge
    26b8bdb5561a hwmon: (coretemp) Enlarge per package core count limit
    a2f99731ab31 efi: Don't add memblocks for soft-reserved memory
    4aa36b62c3ea efi: runtime: Fix potential overflow of soft-reserved region size
    262dc4fb1517 wifi: mac80211: adding missing drv_mgd_complete_tx() call
    a585faf05915 fs/ntfs3: Fix oob in ntfs_listxattr
    0a3548e82424 fs/ntfs3: Update inode->i_size after success write into compressed file
    c39c689a82b3 fs/ntfs3: Correct function is_rst_area_valid
    54142e95dfc8 fs/ntfs3: Prevent generic message "attempt to access beyond end of device"
    095d6a66bc69 fs/ntfs3: use non-movable memory for ntfs3 MFT buffer cache
    3f3a6ebf6a32 fs/ntfs3: Disable ATTR_LIST_ENTRY size check
    ee8db6475cb1 fs/ntfs3: Add NULL ptr dereference checking at the end of attr_allocate_frame()
    56dacb722b76 fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"
    3532bceaed11 fs/ntfs3: Print warning while fixing hard links count
    f14132b88315 fs/ntfs3: Correct hard links updating when dealing with DOS names
    cd465584d501 fs/ntfs3: Improve ntfs_dir_count
    3f7920b36da0 fs/ntfs3: Modified fix directory element type detection
    b4663b406aee Input: i8042 - add Fujitsu Lifebook U728 to i8042 quirk table
    9b1e3cf9ed29 ext4: correct the hole length returned by ext4_map_blocks()
    46e64b9a4b6f nvmet-fc: take ref count on tgtport before delete assoc
    5e0bc09a52b6 nvmet-fc: avoid deadlock on delete association path
    f323185c7923 nvmet-fc: abort command when there is no binding
    59b4ca71ab70 nvmet-fc: hold reference on hostport match
    8fd604d4b0d7 nvmet-fc: defer cleanup using RCU properly
    8f7104e18ffd nvmet-fc: release reference on target port
    071f116416a1 nvmet-fcloop: swap the list_add_tail arguments
    0bf567d6d9ff nvme-fc: do not wait in vain when unloading module
    75e34de642a3 ALSA: usb-audio: Ignore clock selector errors for single connection
    a75d89666c57 netfilter: conntrack: check SCTP_CID_SHUTDOWN_ACK for vtag setting in sctp_new
    4a5ed4697232 Input: xpad - add Lenovo Legion Go controllers
    1e9af43d5d02 spi: sh-msiof: avoid integer overflow in constants
    ef1e3f277a7f ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
    e59905cfb195 ALSA: usb-audio: Check presence of valid altsetting control
    065da538e6a6 nvmet-tcp: fix nvme tcp ida memory leak
    f8dee8e4893c regulator: pwm-regulator: Add validity checks in continuous .get_voltage
    4fe4e5adc7d2 dmaengine: ti: edma: Add some null pointer checks to the edma_probe
    8de8305a25bf ext4: avoid allocating blocks from corrupted group in ext4_mb_find_by_goal()
    4c21fa60a6f4 ext4: avoid allocating blocks from corrupted group in ext4_mb_try_best_found()
    687061cfaa2a ext4: avoid dividing by 0 in mb_update_avg_fragment_size() when block bitmap corrupt
    3700475e0961 platform/x86: touchscreen_dmi: Add info for the TECLAST X16 Plus tablet
    343c19816883 MIPS: reserve exception vector space ONLY ONCE
    b4c13deff359 ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
    1a8bd6244963 ahci: asm1166: correct count of reported ports
    0399d7eba41d spi: hisi-sfc-v3xx: Return IRQ_NONE if no interrupts were detected
    df6e2088c6f4 fbdev: sis: Error out if pixclock equals zero
    8c54acf33e5a fbdev: savage: Error out if pixclock equals zero
    88c18fd06608 wifi: mac80211: fix race condition on enabling fast-xmit
    212f20d5b16e wifi: cfg80211: fix missing interfaces when dumping
    37d82e6ac9b2 dmaengine: fsl-qdma: increase size of 'irq_name'
    3692c6f2b564 dmaengine: shdma: increase size of 'dev_id'
    a9849b67b440 scsi: target: core: Add TMF to tmr_list handling
    0766e7317aab sched/rt: Disallow writing invalid values to sched_rt_period_us
    5295b5f2e561 sched/rt: Fix sysctl_sched_rr_timeslice intial value
    8bd3eee7720c x86/fpu: Stop relying on userspace for info to fault in xsave buffer
    c017fbf10596 zonefs: Improve error handling
    bbc432e632d4 userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
    4bbb93ad84b3 bpf: Remove trace_printk_lock
    4b349c55bbd3 bpf: Do cleanup in bpf_bprintf_cleanup only when needed
    bcbaeb081ad8 bpf: Add struct for bin_args arg in bpf_bprintf_prepare
    8495c34dff0d bpf: Merge printk and seq_printf VARARG max macros
    ab2e127896a2 PCI: dwc: Fix a 64bit bug in dw_pcie_ep_raise_msix_irq()
    50349893930a sched/rt: sysctl_sched_rr_timeslice show default timeslice after reset
    ee0fb9baa7a4 smb: client: fix parsing of SMB3.1.1 POSIX create context
    890bc4fac3c0 smb: client: fix potential OOBs in smb2_parse_contexts()
    858e73ff2563 smb: client: fix OOB in receive_encrypted_standard()
    6e5e93fd51fe net/sched: Retire dsmark qdisc
    c3fdf76849c6 net/sched: Retire ATM qdisc
    78bac52c290a net/sched: Retire CBQ qdisc

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 39a0647c63..7e80b6a3b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8d1e346a6d3dc165a31d91b3553490eaeec7100f"
-SRCREV_meta ?= "5411949c94717c9a1b7108df7fb0ed12af43f708"
+SRCREV_machine ?= "e856ac0473964a3f7b3b5544814decb8ae514c9a"
+SRCREV_meta ?= "7057b38eb882224cc002d13b7303e1a1767fa629"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.149"
+LINUX_VERSION ?= "5.15.150"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 93b947f75a..7253ab15f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.149"
+LINUX_VERSION ?= "5.15.150"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dbe71b3b8d620bc5d1d083fd0a86a806b4d94472"
-SRCREV_meta ?= "5411949c94717c9a1b7108df7fb0ed12af43f708"
+SRCREV_machine ?= "9dc9a9a07dba418b65e884e42e230c6c6e1a7f44"
+SRCREV_meta ?= "7057b38eb882224cc002d13b7303e1a1767fa629"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1c6b3d1112..065091f25a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8792e65a06ea69eb8ff127c2a8eb90a9567be18a"
-SRCREV_machine:qemuarm64 ?= "79d37a48e7d9d41c547d36a405b6d9b9bbf81dae"
-SRCREV_machine:qemumips ?= "57aa05a2dbb323d83f8c76855705b24f6d6ed8d4"
-SRCREV_machine:qemuppc ?= "74e68b09de66b30e1d47088474d649d22329425d"
-SRCREV_machine:qemuriscv64 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
-SRCREV_machine:qemuriscv32 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
-SRCREV_machine:qemux86 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
-SRCREV_machine:qemux86-64 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
-SRCREV_machine:qemumips64 ?= "b2d4206f5c808efbb98671d9a66a97e161713341"
-SRCREV_machine ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
-SRCREV_meta ?= "5411949c94717c9a1b7108df7fb0ed12af43f708"
+SRCREV_machine:qemuarm ?= "f99523c4bf2f8e48e9b2d2cd3cffee6c494b124e"
+SRCREV_machine:qemuarm64 ?= "8ee4ded018a7d795de4df15931c4a0a3a1b1d54d"
+SRCREV_machine:qemumips ?= "b8fbb69a10c4eea7ae580e8249a46056d1db24d1"
+SRCREV_machine:qemuppc ?= "533c5a1f7605c4f94161378a24a5d938b4b8c269"
+SRCREV_machine:qemuriscv64 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
+SRCREV_machine:qemuriscv32 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
+SRCREV_machine:qemux86 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
+SRCREV_machine:qemux86-64 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
+SRCREV_machine:qemumips64 ?= "a74663ee8ab0d74555ea13a4f7490bde20c4fce2"
+SRCREV_machine ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
+SRCREV_meta ?= "7057b38eb882224cc002d13b7303e1a1767fa629"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "458ce51d0356ee60c93f9f807d9827cf2a41643d"
+SRCREV_machine:class-devupstream ?= "80efc6265290d34b75921bf7294e0d9c5a8749dc"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.149"
+LINUX_VERSION ?= "5.15.150"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


