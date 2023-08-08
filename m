Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B4DC41513
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:36:07 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.54149.1691465763077028879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dZUE/TyM;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-63d1238c300so25829526d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691465762; x=1692070562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWxbKlQT9HNwtK7KX42dOXxvcJey8/CkHoagbun14Tk=;
        b=dZUE/TyM0g07FgKjIrLKjxs4yRUK2MTuaft1G81ovR9Hr913I6WcPtvVMTbEbbHE6j
         BewMcPhQdNVZEFLKUGCff+kmj6mrF3CoO82kOHyH7FSujXwo4WEbMTDUdQzdBkxGMmYX
         LEESSqKYyr+px49nHdxn8I5JtFNJB4Ix892O2pWtt2XY7YwHKtSnsdR5vlYUql/YP8tr
         nfqCPVwJqVOqPR4ax9Q440DAEC47HVaS5dFsKxg++nVXAuLYigbHWzAB+HrjXW+2K0Cx
         xxbRzT5aSMm5rDUVYH9smhXosOhsg+jRvvNxNLmUptBam6VgISYxYyP/I2YOd3j6wvuC
         F48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465762; x=1692070562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWxbKlQT9HNwtK7KX42dOXxvcJey8/CkHoagbun14Tk=;
        b=fa+CUs1wSZ0r0o3G5eI7/icQqIRTV9XRGYK/HWBe1Y2rjEx4t4gObW0C/K4ughDORn
         b/PET8MVw+Wjeb3aHX+/c2o6MLp0yLfqgeQ+mbhb1eSN5GUX/0if4+rkFx6JJ4PklVSB
         1joboLASXbGlXbx7N2uNI3rjnA7GS47RU+/uqH4ZaJfs4Wu4+VWz6e1V43eErS31Sxn3
         v3SAXT3JTYJd0jl7OC1WrrKCu5+sbacLIfhfz4AMG/4UofeYM8F9cAKCYigtqDWhNeUI
         T0mWtVgFnmzayuyXvfRUfy/kJBaRkl9Z0omi4Y1chmJeagZq62plZw4c1iXFpD3YUcwl
         N7KQ==
X-Gm-Message-State: AOJu0YwWVA+wlExClIP2waolk6YZlRglr7XW15MOLwKhCTMzYWr8yuch
	5ftD4S8BnJw+NQi+byYLjYFkhk+4daSI3w==
X-Google-Smtp-Source: AGHT+IE05/y/9O2db3uale04g03njT4TQUdIYFirmR+TbM3MiKXkH71r4Ll2L+M2emUyY2opUpM0pA==
X-Received: by 2002:a05:6214:5c46:b0:63d:334:259b with SMTP id lz6-20020a0562145c4600b0063d0334259bmr9994105qvb.43.1691465761897;
        Mon, 07 Aug 2023 20:36:01 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b0076cb0ed2d7asm3033840qkm.24.2023.08.07.20.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:36:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/6.4: update to v6.4.8
Date: Mon,  7 Aug 2023 23:35:52 -0400
Message-Id: <e1a84bd5ad27453ea90b2322a646335ad3388064.1691465503.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691465503.git.bruce.ashfield@gmail.com>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185636

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    714a286bf9ee Linux 6.4.8
    3d308a163115 dma-buf: fix an error pointer vs NULL bug
    6bd9952eade5 dma-buf: keep the signaling time of merged fences v3
    e872d6b6ea49 mm/mempolicy: Take VMA lock before replacing policy
    da84cd9b5e03 mm/memory-failure: fix hardware poison check in unpoison_memory()
    bdb3106af2b2 mm: fix memory ordering for mm_lock_seq and vm_lock_seq
    b53745bdb03e mm: lock VMA in dup_anon_vma() before setting ->anon_vma
    58f4cbe0cc87 rbd: retrieve and check lock owner twice before blocklisting
    44f442aa19f0 rbd: harden get_lock_owner_info() a bit
    0a83f816a8f1 rbd: make get_lock_owner_info() return a single locker or NULL
    441b3dd88f78 dm cache policy smq: ensure IO doesn't prevent cleaner policy progress
    cf83bf01b528 drm/i915/dpt: Use shmem for dpt objects
    c5126152c6f6 ceph: never send metrics if disable_send_metrics is set
    adce49089412 thermal: of: fix double-free on unregistration
    5dac557301d8 PM: sleep: wakeirq: fix wake irq arming
    807ada0e4aa3 arm64/sme: Set new vector length before reallocating
    684c1a948ece ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register
    c58951ccef60 mptcp: more accurate NL event generation
    8aba7fb2544a s390/dasd: print copy pair message only for the correct error
    274b5383e999 s390/dasd: fix hanging device after quiesce/resume
    592b0c50e3fb fs/9p: remove unnecessary invalidate_inode_pages2
    cd27c7f79056 fs/9p: fix type mismatch in file cache mode helper
    f7fb8699068f fs/9p: fix typo in comparison logic for cache mode
    00c6ee38522e fs/9p: remove unnecessary and overrestrictive check
    f1e24c44ab4d 9p: fix ignored return value in v9fs_dir_release
    c9d7e61044f5 LoongArch: BPF: Enable bpf_probe_read{, str}() on LoongArch
    47f0ef81b15e LoongArch: BPF: Fix check condition to call lu32id in move_imm()
    a04cb0c40887 LoongArch: Fix return value underflow in exception path
    453af7c2cc90 Revert "um: Use swap() to make code cleaner"
    c5265691cd06 soundwire: fix enumeration completion
    c9491c0b24f8 selftests: mptcp: join: only check for ip6tables if needed
    176f36a376c4 iommufd: Set end correctly when doing batch carry
    45484d96d599 io_uring: gate iowait schedule on having pending requests
    29cf01eed50f net: dsa: qca8k: fix mdb add/del case with 0 VID
    bb7b454fff66 net: dsa: qca8k: fix broken search_and_del
    3797de3d4b0f net: dsa: qca8k: fix search_and_insert wrong handling of new rule
    d04084d09f7c net: dsa: qca8k: enable use_single_write for qca8xxx
    c00af3a818cc net: ipa: only reset hashed tables when supported
    2488a91b54b5 virtio-net: fix race between set queues and probe
    c76d96c55589 xen: speed up grant-table reclaim
    6efc575dd2a6 proc/vmcore: fix signedness bug in read_from_oldmem()
    e7b25896f447 locking/rtmutex: Fix task->pi_waiters integrity
    018be618bcdb irqchip/gic-v4.1: Properly lock VPEs when doing a directLPI invalidation
    a0c05710f0cb irq-bcm6345-l1: Do not assume a fixed block to cpu mapping
    b077d6531a67 tpm_tis: Explicitly check for error code
    40c627dd6de3 ACPI/IORT: Remove erroneous id_count check in iort_node_get_rmr_info()
    0e625d273365 ksmbd: check if a mount point is crossed during path lookup
    293f39e1d0ae nfsd: Remove incorrect check in nfsd4_validate_stateid
    ab8160583f56 file: always lock position for FMODE_ATOMIC_POS
    e96954065d7f x86/cpu: Enable STIBP on AMD if Automatic IBRS is enabled
    fdcd4b0d5197 x86/MCE/AMD: Decrement threshold_bank refcount when removing threshold blocks
    db73d812bb95 btrfs: check for commit error at btrfs_attach_transaction_barrier()
    ec0a56ae9519 btrfs: check if the transaction was aborted at btrfs_wait_for_commit()
    1e8087589b5c btrfs: account block group tree when calculating global reserve size
    2c28c5c52eaf btrfs: zoned: do not enable async discard
    843b4e161773 hwmon: (pmbus_core) Fix Deadlock in pmbus_regulator_get_status
    7444253cacd9 hwmon: (pmbus_core) Fix NULL pointer dereference
    db11ee9b500f hwmon: (pmbus_core) Fix pmbus_is_enabled()
    76f9deecf6eb hwmon: (aquacomputer_d5next) Fix incorrect PWM value readout
    7665493f77c9 hwmon: (nct7802) Fix for temp6 (PECI1) processed even if PECI1 disabled
    c6790a9b035e hwmon: (k10temp) Enable AMD3255 Proc to show negative temperature
    d205b153a417 ALSA: hda/relatek: Enable Mute LED on HP 250 G8
    a13620ff3b43 ALSA: hda/realtek: Support ASUS G713PV laptop
    6a007b162610 Revert "xhci: add quirk for host controllers that don't update endpoint DCS"
    74a8d6f50cc9 tty: n_gsm: fix UAF in gsm_cleanup_mux
    b1b04b56745b staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext()
    874555472c73 staging: r8712: Fix memory leak in _r8712_init_xmit_priv()
    5d73dfff46d6 Documentation: security-bugs.rst: clarify CVE handling
    90cd6f5e9154 Documentation: security-bugs.rst: update preferences when dealing with the linux-distros group
    14e8e4a3f3cf Revert "usb: xhci: tegra: Fix error check"
    6068d152870a usb: xhci-mtk: set the dma max_seg_size
    d88c69c9e4cc usb: cdns3: fix incorrect calculation of ep_buf_size when more than one config
    15cea3344f78 USB: quirks: add quirk for Focusrite Scarlett
    a4b763650261 usb: ohci-at91: Fix the unhandle interrupt when resume
    ef61d54319fc usb: misc: ehset: fix wrong if condition
    317d6e4c12b4 usb: dwc3: don't reset device side if dwc3 was configured as host-only
    965b1f03e1d1 usb: dwc3: pci: skip BYT GPIO lookup table for hardwired phy
    1590819eac4a Revert "usb: dwc3: core: Enable AutoRetry feature in the controller"
    816569fddc4e usb: typec: Use sysfs_emit_at when concatenating the string
    bd90eafbacf4 usb: typec: Iterate pds array when showing the pd list
    54c6d5fa59d2 usb: typec: Set port->pd before adding device for typec_port
    41c60abd3eee TIOCSTI: always enable for CAP_SYS_ADMIN
    f8416e85c8c4 can: gs_usb: gs_can_close(): add missing set of CAN state to CAN_STATE_STOPPED
    5b656220e65e USB: serial: simple: sort driver entries
    0e44d051c872 USB: serial: simple: add Kaufmann RKS+CAN VCP
    d62a293e0ad3 USB: serial: option: add Quectel EC200A module support
    56637bd2de53 USB: serial: option: support Quectel EM060K_128
    c83261b1a5c0 serial: sifive: Fix sifive_serial_console_setup() section
    12a529e625cb serial: 8250_dw: Preserve original value of DLF register
    867bf51492d6 tty: serial: sh-sci: Fix sleeping in atomic context
    7ceb28ca8a67 serial: qcom-geni: drop bogus runtime pm state update
    31d7fc013aa4 KVM: x86: Disallow KVM_SET_SREGS{2} if incoming CR0 is invalid
    00ab40209428 KVM: VMX: Don't fudge CR0 and CR4 for restricted L2 guest
    fa69c355a429 KVM: Grab a reference to KVM for VM and vCPU stats file descriptors
    7175cc32ff51 usb: gadget: core: remove unbalanced mutex_unlock in usb_gadget_activate
    9934e5d07c0d USB: gadget: Fix the memory leak in raw_gadget driver
    9820f6e036d0 usb: gadget: call usb_gadget_check_config() to verify UDC capability
    1099be4ad9d2 Revert "usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()"
    528c9d731537 tracing: Fix warning in trace_buffered_event_disable()
    54820008db2e ring-buffer: Fix wrong stat of cpu_buffer->read
    8481fc3f5352 ata: pata_ns87415: mark ns87560_tf_read static
    d232314284c7 tmpfs: fix Documentation of noswap and huge mount options
    495b327435b0 iommufd: IOMMUFD_DESTROY should not increase the refcount
    59679bd0049e ublk: return -EINTR if breaking from waiting for existed users in DEL_DEV
    b3a1e243a746 ublk: fail to recover device if queue setup is interrupted
    6ab3e7d424cd ublk: fail to start device if queue setup is interrupted
    e2e4bc585e8c drm/msm: Disallow submit with fence id 0
    15a2103d55fc RDMA/irdma: Report correct WC error
    fd38ef70f9b8 RDMA/irdma: Fix op_type reporting in CQEs
    637c2d569ca5 drm/amd/display: Unlock on error path in dm_handle_mst_sideband_msg_ready_event()
    d3e51257ec31 drm/amd: Fix an error handling mistake in psp_sw_init()
    032bfd60999f dm raid: protect md_stop() with 'reconfig_mutex'
    fa00410d2df1 dm raid: clean up four equivalent goto tags in raid_ctr()
    0dc2104c2221 dm raid: fix missing reconfig_mutex unlock in raid_ctr() error paths
    7a72e63d926b xenbus: check xen_domain in xenbus_probe_initcall
    6a2b89b6b756 drm/i915: Fix an error handling path in igt_write_huge()
    20b4735ebf34 smb3: do not set NTLMSSP_VERSION flag for negotiate not auth request
    312c9b87bf1f block: Fix a source code comment in include/uapi/linux/blkzoned.h
    e4631ad24a23 ASoC: fsl_spdif: Silence output on stop
    b576cef3758c cxl/acpi: Return 'rc' instead of '0' in cxl_parse_cfmws()
    316db489647b cxl/acpi: Fix a use-after-free in cxl_parse_cfmws()
    e2808329b69a drm/msm: Fix hw_fence error path cleanup
    8ac09b9939f1 drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
    56f76d1368f8 RDMA/bnxt_re: Fix hang during driver unload
    6de5b9944fed RDMA/bnxt_re: add helper function __poll_for_resp
    22dfc9dffb76 RDMA/bnxt_re: Simplify the function that sends the FW commands
    e0777f9c327f RDMA/bnxt_re: use shadow qd while posting non blocking rcfw command
    4e5c10167e72 RDMA/bnxt_re: Avoid the command wait if firmware is inactive
    973d3fa70af7 RDMA/bnxt_re: Enhance the existing functions that wait for FW responses
    7faa60976941 RDMA/bnxt_re: Prevent handling any completions after qp destroy
    d824dc70380c RDMA/mthca: Fix crash when polling CQ for shared QPs
    046e12b8fc66 RDMA/core: Update CMA destination address on rdma_resolve_addr
    b8b90ba636e3 RDMA/irdma: Fix data race on CQP request done
    2623ca92cd8f RDMA/irdma: Fix data race on CQP completion stats
    ee38994979df RDMA/irdma: Add missing read barriers
    0370fbed4d55 drm/msm/adreno: Fix snapshot BINDLESS_DATA size
    7ded87a612f8 drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
    c4934d3966c7 drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
    e7b18ba79cd3 drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5 planes
    cdb23d0d7d0b drm/msm/mdss: correct UBWC programming for SM8550
    acc0e7732247 RDMA/mlx4: Make check for invalid flags stricter
    8b1fc5b54048 fs/9p: Fix a datatype used with V9FS_DIRECT_IO
    fcc62b0e3424 tipc: stop tipc crypto on failure in tipc_node_create
    3a85a6487b90 tipc: check return value of pskb_trim()
    122d387677ae benet: fix return value check in be_lancer_xmit_workarounds()
    e57cfdb11295 net/sched: mqprio: Add length check for TCA_MQPRIO_{MAX/MIN}_RATE64
    ece320c78d62 net: fec: tx processing does not call XDP APIs if budget is 0
    fcbfd96a1e61 tools: ynl-gen: fix enum index in _decode_enum(..)
    33e9ae3dac12 mm: suppress mm fault logging if fatal signal already pending
    144483596810 netfilter: nf_tables: disallow rule addition to bound chain via NFTA_RULE_CHAIN_ID
    027d00132487 netfilter: nf_tables: skip immediate deactivate in _PREPARE_ERROR
    cd6673393239 netfilter: nft_set_rbtree: fix overlap expiration walk
    c12554d97fcd igc: Fix Kernel Panic during ndo_tx_timeout callback
    79f44709aa7a macvlan: add forgotten nla_policy for IFLA_MACVLAN_BC_CUTOFF
    70539e9bc0e6 x86/traps: Fix load_unaligned_zeropad() handling for shared TDX memory
    33f73e215d8f platform/x86: msi-laptop: Fix rfkill out-of-sync on MSI Wind U100
    7c83b2f01655 net: stmmac: Apply redundant write work around on 4.xx too
    f3ff2a5cca18 octeontx2-af: Fix hash extraction enable configuration
    213055a66c2c team: reset team's flags when down link is P2P device
    84d0bb176d85 bonding: reset bond's flags when down link is P2P device
    5a36ae715590 ice: Fix memory management in ice_ethtool_fdir.c
    1e50c11ed44e tcp: Reduce chance of collisions in inet6_hashfn().
    6fe0d14c7675 net: fec: avoid tx queue timeout when XDP is enabled
    e9f329d943f2 ipv6 addrconf: fix bug where deleting a mngtmpaddr can create a new temporary address
    e92b177161f1 ethernet: atheros: fix return value check in atl1e_tso_csum()
    2111337afeb7 atheros: fix return value check in atl1_tso()
    ce69eac840db phy: hisilicon: Fix an out of bounds check in hisi_inno_phy_probe()
    bc1e4f99e223 vxlan: fix GRO with VXLAN-GPE
    c3a497decbee vxlan: generalize vxlan_parse_gpe_hdr and remove unused args
    3b0f05b8218a vxlan: calculate correct header length for GPE
    4bf9ced9c06b net: hns3: fix wrong bw weight of disabled tc issue
    7a0eab957136 net: hns3: fix wrong tc bandwidth weight data issue
    f89520d2e1c2 net: hns3: fix the imp capability bit cannot exceed 32 bits issue
    076eb7bcf758 net: phy: marvell10g: fix 88x3310 power up
    e62e51ccc8cb iavf: check for removal state before IAVF_FLAG_PF_COMMS_FAILED
    f8d88654b584 iavf: fix potential deadlock on allocation failure
    0ef05b8f83ed i40e: Fix an NULL vs IS_ERR() bug for debugfs_create_dir()
    b96b9635df28 media: mtk_jpeg_core: avoid unused-variable warning
    46256d801a5e media: mtk-jpeg: move data/code inside CONFIG_OF blocks
    1c47de39107b media: amphion: Fix firmware path to match linux-firmware
    f660df7a5d62 media: staging: atomisp: select V4L2_FWNODE
    68799920f634 media: tc358746: Address compiler warnings
    73c9da33b9ec soundwire: amd: Fix a check for errors in probe()
    f716d59dcc67 soundwire: qcom: update status correctly with mask
    7b988cbc65c4 phy: qcom-snps-femto-v2: properly enable ref clock
    fdf6f1a46680 phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime suspend
    8465ebae166d phy: mediatek: hdmi: mt8195: fix prediv bad upper limit test
    e73498bbdd62 phy: phy-mtk-dp: Fix an error code in probe()
    339fee69a1da ext4: fix rbtree traversal bug in ext4_mb_use_preallocated
    a0f2ba186693 ext4: mballoc: Remove useless setting of ac_criteria
    d254d8814025 ext4: add EXT4_MB_HINT_GOAL_ONLY test in ext4_mb_use_preallocated
    a0fea63317b7 drm/amd/display: Prevent vtotal from being set to 0
    64bc8e10c87a drm/amd/display: Fix possible underflow for displays with large vblank
    8e2fd3a1588e drm/amd/display: update extended blank for dcn314 onwards
    74f46ce34747 drm/amd/display: Add FAMS validation before trying to use it
    2401285f91c0 maple_tree: fix 32 bit mas_next testing
    79bad53f7e52 maple_tree: add __init and __exit to test module
    c24d051e6b48 drm/ttm: never consider pinned BOs for eviction&swap
    adff2d7cc515 drm/amd/display: Set minimum requirement for using PSR-SU on Phoenix
    f73fac742bb1 drm/amd/display: Set minimum requirement for using PSR-SU on Rembrandt
    452bbeb39ea5 drm/amd/display: Update correct DCN314 register header
    bd0e7b7c28d3 drm/amd/display: fix dcn315 single stream crb allocation
    edac24ed87c8 drm/amd/display: add pixel rate based CRB allocation support
    45510d285246 drm/amd/display: Keep disable aux-i delay as 0
    570536791181 drm/amd/display: Convert Delaying Aux-I Disable To Monitor Patch
    776ae6b06167 PCI: rockchip: Don't advertise MSI-X in PCIe capabilities
    544c121cae02 PCI: rockchip: Fix window mapping and address translation for endpoint
    317b9617417b PCI: rockchip: Remove writes to unused registers
    b71a2852f8cf PCI/ASPM: Avoid link retraining race
    874b9d8a92d5 PCI/ASPM: Factor out pcie_wait_for_retrain()
    16caca59a23b PCI/ASPM: Return 0 or -ETIMEDOUT from pcie_retrain_link()
    fb0c501d7293 i2c: nomadik: Remove a useless call in the remove function
    fc491dad925f i2c: nomadik: Use devm_clk_get_enabled()
    b6014022b64a i2c: nomadik: Remove unnecessary goto label
    00f38672ef5a i2c: Improve size determinations
    576c5fa88dd7 i2c: Delete error messages for failed memory allocations
    50cafe0581ef btrfs: fix race between quota disable and relocation
    693a76175826 btrfs: fix fsverify read error handling in end_page_read
    c42d836e2ef5 btrfs: factor out a btrfs_verify_page helper
    96229406255f regmap: Disable locking for RBTREE and MAPLE unit tests
    d9b791d83623 gpio: mvebu: fix irq domain leak
    53638f73948d gpio: mvebu: Make use of devm_pwmchip_add
    3f8f1601128b gpio: tps68470: Make tps68470_gpio_output() always set the initial value
    384d3da61118 io_uring: don't audit the capability check in io_uring_create()
    aa52a654da5f s390/mm: fix per vma lock fault handling
    f1c7a776338f KVM: s390: pv: fix index value of replaced ASCE
    b5b88c86258a KVM: s390: pv: simplify shutdown and fix race
    959dc1b16ea3 powerpc/pseries/vas: Hold mmap_mutex after mmap lock during window close
    7bbda9677629 blk-mq: Fix stall due to recursive flush plug
    91450dec0445 KVM: arm64: Handle kvm_arm_init failure correctly in finalize_pkvm
    3e5ea6b6a571 jbd2: Fix wrongly judgement for buffer head removing while doing checkpoint
    2ecab4882ca3 r8169: revert 2ab19de62d67 ("r8169: remove ASPM restrictions now that ASPM is disabled during NAPI poll")
    979f8de763ed drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters implementation with SMU13
    3d7a757d2c15 drm/amd: Move helper for dynamic speed switch check out of smu13
    b94db3f542f9 platform/x86/amd/pmf: reduce verbosity of apmf_get_system_params
    71bcf64f9083 platform/x86/amd/pmf: Notify OS power slider update

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index c34f7aa642..53961cb9b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97762c26512762550f29ee326cc21df3e741efca"
-SRCREV_meta ?= "7a654f3f799146d1a9bfbd78ddebdc53510951e9"
+SRCREV_machine ?= "dea7f1321a72454808398aba37090cb8543d68c2"
+SRCREV_meta ?= "50e8722be4cd4fe25f03d5a26ea88fb199c8b41a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.7"
+LINUX_VERSION ?= "6.4.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index fe1cd84b66..950df14f26 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.7"
+LINUX_VERSION ?= "6.4.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_meta ?= "7a654f3f799146d1a9bfbd78ddebdc53510951e9"
+SRCREV_machine ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_meta ?= "50e8722be4cd4fe25f03d5a26ea88fb199c8b41a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 0c6ce89d3c..5badb65731 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "663ff8d31c3baf34361dbce2af2e5f551cd6958a"
-SRCREV_machine:qemuarm64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemuloongarch64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemumips ?= "86ad6578ddd4fc63ba08f7e451fc0e3282f589df"
-SRCREV_machine:qemuppc ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemuriscv64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemuriscv32 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemux86 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemux86-64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_machine:qemumips64 ?= "6467677b2a9876ba711a323a20a03c077ed34ab5"
-SRCREV_machine ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
-SRCREV_meta ?= "7a654f3f799146d1a9bfbd78ddebdc53510951e9"
+SRCREV_machine:qemuarm ?= "fed79080c4b5477e1e60c6ffb7b8d7ebf8d6b50d"
+SRCREV_machine:qemuarm64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemuloongarch64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemumips ?= "d6fcc4e1adef98ae517611e9495d8419196bf0da"
+SRCREV_machine:qemuppc ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemuriscv64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemuriscv32 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemux86 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemux86-64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_machine:qemumips64 ?= "a7dffb3088550aa11e68aecff03de6616a4acea6"
+SRCREV_machine ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
+SRCREV_meta ?= "50e8722be4cd4fe25f03d5a26ea88fb199c8b41a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4e382c2b468348d6208e5a18dbf1591a18170889"
+SRCREV_machine:class-devupstream ?= "714a286bf9ee3740260c61471ed72d10bd17336a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.7"
+LINUX_VERSION ?= "6.4.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


