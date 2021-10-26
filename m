Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0484C4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:25:30 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.554.1635272729271629781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQVaq/iV;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id t1so84933qvb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhqJuDNi70CuqKsQZLg4NbkrDvclc7a0EQM2lzBnFZI=;
        b=VQVaq/iVgeqglZoMBoUEflkDxhaoQubpV3Sx4ouH76UHdjWODsqj6jsHoK0RjxqVUY
         zm/eNzpPRMN4u5cvNebqrgvczFLx7IPGdQJsWtABpGNHSc2LPFkvVhbHJHweWE6fvN/f
         TIV66VjxVSpjNkREwFTd0jlhZxmtHAd/5vZGi1Dd1Zu/YtkXnIK6og30GZXIbngqoFjx
         yZ0bkxmPXiXfsYGxi3xfUiO9eHJz/ldpSqvQfW/yJtA7VntrIx8fvvBYpbxVZd2I6bo1
         14gXMfEXE47Un6coaeSQAup8q0U/n3BerFrvZAyuIhGXd9KbGGnp3Ee1+vNGT+D8k/bm
         Jraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhqJuDNi70CuqKsQZLg4NbkrDvclc7a0EQM2lzBnFZI=;
        b=mza9VFPKpOqfQ9SRO/icbEGeoXNk9iz/UgrCC9Sms5kyXH1TxwMRxmrk0L0D2hGG/Y
         afD0t2uUb1y8qljNry3ztfQMDuQbFke7VVr6sXqwyib605/8ianxJmnU7bJ68OIGH7g5
         L7dC3KZ6Dk5ERMx0Epdxm3iTagFfsLiYDsBn+azTSyKMOdyfxZNiIuNvDl81UeuQ993U
         lGt+/lovQzm0LWudi4aVPaL7FueZZWcqzn+LXdrztWIHZySppowLkq1DPTw0WEam5di/
         9Coix7SwK/0LmGJy7mPZ9TdCFLNNfIImfMtItcPWbcb9sDi9iUcSk7JucSE6lIIfy1tW
         UwXw==
X-Gm-Message-State: AOAM530Ygjq+xyvf7sanvHwhLAzYPGRczZFTs/qN3z8KMnpdYI8WIvz1
	RRFP0kfTmRSUOu51+Eat+UHP0rmdpn2J8A==
X-Google-Smtp-Source: 
 ABdhPJxamAdDSCAUZnyazntR9xJyXX+DavWbZNqz3qPhyBcCdpFovWeFtwa85sjqHrfszj3PgbmqpA==
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr6300038qvc.61.1635272728039;
        Tue, 26 Oct 2021 11:25:28 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x16sm10608460qtp.56.2021.10.26.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:25:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/5.14: update to v5.14.12
Date: Tue, 26 Oct 2021 14:25:19 -0400
Message-Id: 
 <9763966d31b22c46cbdc3cea673ae0a9d69a585f.1635272591.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1635272591.git.bruce.ashfield@gmail.com>
References: <cover.1635272591.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:25:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157443

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    325225e2f9fa Linux 5.14.12
    58f0e59efa34 dsa: tag_dsa: Fix mask for trunked packets
    5dc24f3e0841 x86/hpet: Use another crystalball to evaluate HPET usability
    4e9ec1c65da9 x86/entry: Clear X86_FEATURE_SMAP when CONFIG_X86_SMAP=n
    2ba3e3026f4f x86/entry: Correct reference to intended CONFIG_64_BIT
    0723d4f8b179 x86/fpu: Restore the masking out of reserved MXCSR bits
    44976b5cb6af x86/sev: Return an error on a returned non-zero SW_EXITINFO1[31:0]
    6665c1c5770f x86/Kconfig: Correct reference to MWINCHIP3D
    1d4092c10125 x86/platform/olpc: Correct ifdef symbol to intended CONFIG_OLPC_XO15_SCI
    8ba6e4551011 pseries/eeh: Fix the kdump kernel crash during eeh_pseries_init
    da0cb12f1983 powerpc/32s: Fix kuap_kernel_restore()
    d7a8e38999fb powerpc/64s: Fix unrecoverable MCE calling async handler from NMI
    22ee1f15a72e powerpc/traps: do not enable irqs in _exception
    c835b3d1d636 powerpc/64s: fix program check interrupt emergency stack path
    6b77166ffee7 powerpc/bpf ppc32: Fix BPF_SUB when imm == 0x80000000
    b8601d47e87a powerpc/bpf ppc32: Do not emit zero extend instruction for 64-bit BPF_END
    491976e521c1 powerpc/bpf ppc32: Fix JMP32_JSET_K
    9a3e91f94473 powerpc/bpf ppc32: Fix ALU32 BPF_ARSH operation
    096d4c941f0e powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
    2d7781883b3e powerpc/bpf: Fix BPF_MOD when imm == 1
    a7ce57ca9407 objtool: Make .altinstructions section entry size consistent
    039a68957f81 objtool: Remove reloc symbol type checks in get_alt_entry()
    1642f51ac0d4 scsi: iscsi: Fix iscsi_task use after free
    412754da783d RISC-V: Include clone3() on rv32
    cf63b49349cc i2c: mlxcpld: Modify register setting for 400KHz frequency
    3655a1934519 i2c: mlxcpld: Fix criteria for frequency setting
    d590a410e472 bpf, s390: Fix potential memory leak about jit_data
    f344ad3060c4 riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for write killable
    b8b60c1139c7 riscv/vdso: Move vdso data page up front
    309fd6f1e7cf riscv/vdso: Refactor asm/vdso.h
    ff26f96fe0a2 RISC-V: Fix VDSO build for !MMU
    363128071346 riscv: explicitly use symbol offsets for VDSO
    26e7025ef25a i2c: mediatek: Add OFFSET_EXT_CONF setting back
    90f1077c9184 i2c: acpi: fix resource leak in reconfiguration device addition
    d40c4da7318f powerpc/iommu: Report the correct most efficient DMA mask for PCI devices
    272b85c2fdb2 net: prefer socket bound to interface when not in VRF
    8d2a1e7fb90c iavf: fix double unlock of crit_lock
    75099439209d i40e: Fix freeing of uninitialized misc IRQ vector
    d6db5bcd1817 i40e: fix endless loop under rtnl
    1fad5d7f75f7 gve: report 64bit tx_bytes counter from gve_handle_report_stats()
    bcf4f5e4d33d gve: fix gve_get_stats()
    f4479f3bc861 rtnetlink: fix if_nlmsg_stats_size() under estimation
    f5cfed82e0f3 gve: Properly handle errors in gve_assign_qpl
    2044137a268a gve: Avoid freeing NULL pointer
    3e8df2cada21 gve: Correct available tx qpl check
    bb23ade18ad7 net: stmmac: trigger PCS EEE to turn off on link down
    940ee87907f0 net: pcs: xpcs: fix incorrect steps on disable EEE
    88c3610045ca drm/nouveau/debugfs: fix file release memory leak
    0b4e9fc14973 drm/nouveau/kms/nv50-: fix file release memory leak
    548f2ff8ea5e drm/nouveau: avoid a use-after-free when BO init fails
    23514c752f9b video: fbdev: gbefb: Only instantiate device when built for IP32
    ae7a72cd325c drm/panel: abt-y030xx067a: yellow tint fix
    e6b90dcda29b drm/nouveau/fifo/ga102: initialise chid on return from channel creation
    8228b3b3b5a2 drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup
    ad0fca5a28b3 bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893
    37e2d7fe11ae perf jevents: Free the sys_event_tables list after processing entries
    72e9a1bf9b72 drm/amdgpu: handle the case of pci_channel_io_frozen only in amdgpu_pci_resume
    7e5ce6029b62 drm/amdkfd: fix a potential ttm->sg memory leak
    50002489a20c ARM: defconfig: gemini: Restore framebuffer
    942bde2caec2 netlink: annotate data races around nlk->bound
    464be37f127b net: pcs: xpcs: fix incorrect CL37 AN sequence
    6594158f24e1 net: sfp: Fix typo in state machine debug string
    7a1c1af34104 net/sched: sch_taprio: properly cancel timer from taprio_destroy()
    ba07883c780f net: bridge: fix under estimation in br_get_linkxstats_size()
    df7983fdbc83 net: bridge: use nla_total_size_64bit() in br_get_linkxstats_size()
    47afb35c4f87 afs: Fix afs_launder_page() to set correct start file position
    2eb0a5440068 netfs: Fix READ/WRITE confusion when calling iov_iter_xarray()
    cd4dcab5d20c drm/i915/bdb: Fix version check
    4e7c20e5166e drm/i915/tc: Fix TypeC port init/resume time sanitization
    185e4eeac58e drm/i915/jsl: Add W/A 1409054076 for JSL
    8eb67e815d5e drm/i915/audio: Use BIOS provided value for RKL HDA link
    a23d12eeb1ad ARM: imx6: disable the GIC CPU interface before calling stby-poweroff sequence
    94d64d44e41a dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
    b07494f81da2 arm64: dts: ls1028a: fix eSDHC2 node
    26a949f2335b arm64: dts: imx8mm-kontron-n801x-som: do not allow to switch off buck2
    4350e1f61930 arm64: dts: imx8: change the spi-nor tx
    672285df5e0a ARM: dts: imx: change the spi-nor tx
    baa59a36ff1b ptp_pch: Load module automatically if ID matches
    9b5198c1e041 powerpc/fsl/dts: Fix phy-connection-type for fm1mac3
    6d1e04d8f044 netfilter: nf_tables: honor NLM_F_CREATE and NLM_F_EXCL in event notification
    96117e85b83b MIPS: Revert "add support for buggy MT7621S core detection"
    8efe947ea1ea net: stmmac: dwmac-rk: Fix ethernet on rk3399 based devices
    f1325381177c net: mscc: ocelot: fix VCAP filters remaining active after being deleted
    fb58cd799174 net_sched: fix NULL deref in fifo_set_limit()
    9e8e7504e098 libbpf: Fix memory leak in strset
    064c2616234a phy: mdio: fix memory leak
    8b6cd17219c3 libbpf: Fix segfault in light skeleton for objects without BTF
    2ca78aa65bc1 net/mlx5e: Fix the presented RQ index in PTP stats
    c0b1de56a40e net/mlx5: Fix setting number of EQs of SFs
    5ef55400217f net/mlx5: Fix length of irq_index in chars
    f1c4eaf49d5d net/mlx5: Avoid generating event after PPS out in Real time mode
    4f3369d3e5e8 net/mlx5: Force round second at 1PPS out start time
    ea0b8ffff565 net/mlx5: E-Switch, Fix double allocation of acl flow counter
    d7954cedb9e6 net/mlx5e: Keep the value for maximum number of channels in-sync
    35460565138f net/mlx5e: IPSEC RX, enable checksum complete
    3a1ac1e368be bpf: Fix integer overflow in prealloc_elems_and_freelist()
    0385744b240a soc: ti: omap-prm: Fix external abort for am335x pruss
    f419febd396e bpf, arm: Fix register clobbering in div/mod implementation
    34362a65c248 netfilter: nf_tables: reverse order in rule replacement expansion
    0b1891aa588a netfilter: nf_tables: add position handle in event notification
    3ece5c4bf601 netfilter: conntrack: fix boot failure with nf_conntrack.enable_hooks=1
    9039a8596370 iwlwifi: pcie: add configuration of a Wi-Fi adapter on Dell XPS 15
    8979fa2c43b0 xtensa: call irqchip_init only when CONFIG_USE_OF is selected
    c4a9836c9dd6 xtensa: use CONFIG_USE_OF instead of CONFIG_OF
    5be9d1335749 arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
    1c186680c89f ath5k: fix building with LEDS=m
    436f61a89655 PCI: hv: Fix sleep while in non-sleep context when removing child devices from the bus
    11fc74ddd63a ARM: dts: imx6qdl-pico: Fix Ethernet support
    871b9129ca6d ARM: dts: imx: Fix USB host power regulator polarity on M53Menlo
    d5cbf524d90c ARM: dts: imx: Add missing pinctrl-names for panel on M53Menlo
    64a64a031fc1 soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
    432d8185e9ff iwlwifi: mvm: Fix possible NULL dereference
    306b7fe278ac ARM: at91: pm: do not panic if ram controllers are not enabled
    55f37cc6ee05 Revert "arm64: dts: qcom: sc7280: Fixup the cpufreq node"
    5ceb465692d6 ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference
    457673bfee0b soc: qcom: socinfo: Fixed argument passed to platform_set_data()
    54607728e944 bus: ti-sysc: Add break in switch statement in sysc_init_soc()
    f1c7aa87c423 riscv: Flush current cpu icache before other cpus
    b514b752b626 scsi: ufs: core: Fix task management completion
    4a0775d0c030 ARM: dts: qcom: apq8064: use compatible which contains chipid
    d62956ddb915 ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe
    05d9d419220b ARM: dts: omap3430-sdp: Fix NAND device node
    35c6691812b7 xen/balloon: fix cancelled balloon action
    f574ab3192eb SUNRPC: fix sign error causing rpcsec_gss drops
    ace054d4e523 nfsd4: Handle the NFSv4 READDIR 'dircount' hint being zero
    9228f2a0d1bc nfsd: fix error handling of register_pernet_subsys() in init_nfsd()
    d9f9dfb9040c ovl: fix IOCB_DIRECT if underlying fs doesn't support direct IO
    71b8b36187af ovl: fix missing negative dentry check in ovl_rename()
    b0ee6190e856 fbdev: simplefb: fix Kconfig dependencies
    897e427ef37c mmc: sdhci-of-at91: replace while loop with read_poll_timeout
    aa7c4ce94835 mmc: sdhci-of-at91: wait for calibration done before proceed
    266fd4b85ce3 mmc: meson-gx: do not use memcpy_to/fromio for dram-access-quirk
    527d377da38f xen/privcmd: fix error handling in mmap-resource processing
    c2a35a408070 drm/i915: Extend the async flip VT-d w/a to skl/bxt
    6dafefe60cb2 drm/i915: Fix runtime pm handling in i915_gem_shrink
    92c92e554553 drm/amd/display: Fix DCN3 B0 DP Alt Mapping
    1a9c5c132686 drm/amd/display: Fix detection of 4 lane for DPALT
    4fd24bff9fac drm/amd/display: Limit display scaling to up to 4k for DCN 3.1
    c43e26907d91 drm/nouveau/ga102-: support ttm buffer moves via copy engine
    e4c1d18cb951 drm/nouveau/kms/tu102-: delay enabling cursor until after assign_windows
    4df3adab896f drm/amdgpu: During s0ix don't wait to signal GFXOFF
    ec36503dffdd drm/amd/display: USB4 bring up set correct address
    4b55ade094de drm/amd/display: Fix B0 USB-C DP Alt mode
    3048656f5abf usb: typec: tipd: Remove dependency on "connector" child fwnode
    f5155225108f usb: typec: tcpm: handle SRC_STARTUP state if cc changes
    108d39a6b5a7 usb: typec: tcpci: don't handle vSafe0V event if it's not enabled
    267d19e300c1 USB: cdc-acm: fix break reporting
    aff426d4b887 USB: cdc-acm: fix racy tty buffer accesses
    09c4c413bc56 usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
    66dd03b10e1c usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle
    9b70e9acfceb usb: cdc-wdm: Fix check for WWAN
    d92e0c42cfee Partially revert "usb: Kconfig: using select for USB_COMMON dependency"
    924356b31dcb Linux 5.14.11
    add46a06b8d3 Revert "ARM: imx6q: drop of_platform_default_populate() from init_machine"
    cfd436c4b683 Revert "brcmfmac: use ISO3166 country code and 0 rev as fallback"
    86524ac0ddac libata: Add ATA_HORKAGE_NO_NCQ_ON_ATI for Samsung 860 and 870 SSD.
    2cef02f53d59 perf/x86: Reset destroy callback on event init failure
    12058756a220 KVM: x86: nSVM: restore int_vector in svm_clear_vintr
    b232ba59feb9 kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
    9c827ab0cb09 KVM: x86: reset pdptrs_from_userspace when exiting smm
    ce64d61801d9 KVM: do not shrink halt_poll_ns below grow_start
    11e4acd09e3f selftests: KVM: Align SMCCC call with the spec in steal_time
    96320e3316f8 kasan: always respect CONFIG_KASAN_STACK
    7d434c5f4687 tools/vm/page-types: remove dependency on opt_file for idle page tracking
    004b8f8a6912 block: don't call rq_qos_ops->done_bio if the bio isn't tracked
    648f59a06b0e io_uring: allow conditional reschedule for intensive iterators
    1b5b6666e235 x86/insn, tools/x86: Fix undefined behavior due to potential unaligned accesses
    d022e4c48e16 smb3: correct smb3 ACL security descriptor
    629c6e725d10 irqchip/gic: Work around broken Renesas integration
    ab0a257d1591 scsi: ses: Retry failed Send/Receive Diagnostic commands
    cd402c666fe7 thermal/drivers/tsens: Fix wrong check for tzd in irq handlers
    7efa50dd020c nvme-fc: avoid race between time out and tear down
    70f57c93f10b nvme-fc: update hardware queues before using them
    2e4a7695c8df swiotlb-xen: ensure to issue well-formed XENMEM_exchange requests
    3ad674aa1742 Xen/gntdev: don't ignore kernel unmapping error
    95342046ba4e selftests: kvm: fix get_run_delay() ignoring fscanf() return warn
    80b7cc21401b selftests: kvm: move get_run_delay() into lib/test_util
    b6d7e8c09c40 selftests:kvm: fix get_trans_hugepagesz() ignoring fscanf() return warn
    b664df7bb40a selftests:kvm: fix get_warnings_count() ignoring fscanf() return warn
    2085e5ad67f4 selftests: be sure to make khdr before other targets
    656998200410 habanalabs/gaudi: fix LBW RR configuration
    6874cdba4daa habanalabs: fail collective wait when not supported
    1c806d5a425b habanalabs/gaudi: use direct MSI in single mode
    337f00a0bc62 usb: dwc2: check return value after calling platform_get_resource()
    6b5af31c50ac usb: testusb: Fix for showing the connection speed
    6a48e3f46ef4 scsi: elx: efct: Do not hold lock while calling fc_vport_terminate()
    e95f62013a11 scsi: sd: Free scsi_disk device via put_device()
    ac7d732b24f4 drm/amdkfd: fix svm_migrate_fini warning
    4c5a564bf968 drm/amdkfd: handle svm migrate init error
    3c2830d0cb6f ext2: fix sleeping in atomic bugs on error
    a3b450333d64 platform/x86: gigabyte-wmi: add support for B550I Aorus Pro AX
    3702afcf0aac sparc64: fix pci_iounmap() when CONFIG_PCI is not set
    e4cff35be8ff xen-netback: correct success/error reporting for the SKB-with-fraglist case
    0cfda0cc59d4 net: mdio: introduce a shutdown method to mdio device drivers
    7a08b2e1e477 btrfs: fix mount failure due to past and transient device flush error
    31e401cb05ac btrfs: replace BUG_ON() in btrfs_csum_one_bio() with proper error handling
    20282e53d6bd nfsd: back channel stuck in SEQ4_STATUS_CB_PATH_DOWN
    5c1e84b7ae04 platform/x86: touchscreen_dmi: Update info for the Chuwi Hi10 Plus (CWI527) tablet
    77e6b00985f6 platform/x86: touchscreen_dmi: Add info for the Chuwi HiBook (CWI514) tablet
    bf4597f45f31 afs: Add missing vnode validation checks
    20137432e181 spi: rockchip: handle zero length transfers without timing out
    b133f076639b Linux 5.14.10
    81971ea5ec5c HID: amd_sfh: Fix potential NULL pointer dereference - take 2
    fe6f7b77796e objtool: print out the symbol type when complaining about it
    a7d4cb29f556 drivers: net: mhi: fix error path in mhi_net_newlink
    14492ff96387 netfilter: nf_tables: Fix oversized kvmalloc() calls
    7ea6f5848281 netfilter: conntrack: serialize hash resizes and cleanups
    4664318f73e4 KVM: x86: Handle SRCU initialization failure during page track init
    38c84dfafed5 crypto: aesni - xts_crypt() return if walk.nbytes is 0
    2b704864c92d HID: usbhid: free raw_report buffers in usbhid_stop
    24f3fc95b56b mm: don't allow oversized kvmalloc() calls
    3213f5f8d4ad netfilter: ipset: Fix oversized kvmalloc() calls
    708107b80aa6 HID: betop: fix slab-out-of-bounds Write in betop_probe
    eae2fce438f1 usb: hso: remove the bailout parameter
    47d791dbe1ba NIOS2: setup.c: drop unused variable 'dram_start'
    a7931aa81760 net: udp: annotate data race around udp_sk(sk)->corkflag
    aa3a4f5913a9 HID: u2fzero: ignore incomplete packets without data
    a4f316af25ba ext4: flush s_error_work before journal destroy in ext4_fill_super
    2021f187321c ext4: fix potential infinite loop in ext4_dx_readdir()
    27e10c5d31ff ext4: add error checking to ext4_ext_replay_set_iblocks()
    9bef6f6e2172 ext4: fix reserved space counter leakage
    a5a403aed8a0 ext4: limit the number of blocks in one ADD_RANGE TLV
    68a5ca234225 ext4: fix loff_t overflow in ext4_max_bitmap_size()
    811178f296b1 ipack: ipoctal: fix module reference leak
    382ef7ff1854 ipack: ipoctal: fix missing allocation-failure check
    fcd28f229175 ipack: ipoctal: fix tty-registration error handling
    4953ef80af5f ipack: ipoctal: fix tty registration race
    0a9c36a2e06a ipack: ipoctal: fix stack information leak
    ec889a8be77b debugfs: debugfs_create_file_size(): use IS_ERR to check for error
    e554f26ea453 driver core: fw_devlink: Improve handling of cyclic dependencies
    133578ac70a2 elf: don't use MAP_FIXED_NOREPLACE for elf interpreter mappings
    617f0ea5dfc4 nvme: add command id quirk for apple controllers
    bad1cb95af71 kvm: fix objtool relocation warning
    77744fa757b1 hwmon: (pmbus/mp2975) Add missed POUT attribute for page 1 mp2975 controller
    ec9331ef103f hwmon: (occ) Fix P10 VRM temp sensors
    9ea06d55278e sched/fair: Null terminate buffer when updating tunable_scaling
    fce08b03923e sched/fair: Add ancestors of unthrottled undecayed cfs_rq
    d42683c2b196 perf/x86/intel: Update event constraints for ICX
    3aa381480fbe objtool: Teach get_alt_entry() about more relocation types
    ec716aac7fe4 af_unix: fix races in sk_peer_pid and sk_peer_cred accesses
    97f1c1783c1b net: stmmac: fix EEE init issue when paired with EEE capable PHYs
    dab4677bdbff net: sched: flower: protect fl_walk() with rcu
    e88c502ef7be net: phy: bcm7xxx: Fixed indirect MMD operations
    4cdec1041cd3 net: hns3: disable firmware compatible features when uninstall PF
    3937b9c2961e net: hns3: fix always enable rx vlan filter problem after selftest
    fd519ae5a816 net: hns3: reconstruct function hns3_self_test
    851c0b9913b8 net: hns3: fix show wrong state when add existing uc mac address
    18e609791fa6 net: hns3: fix mixed flag HCLGE_FLAG_MQPRIO_ENABLE and HCLGE_FLAG_DCB_ENABLE
    8bcaeeefccfb net: hns3: don't rollback when destroy mqprio fail
    8d4ad0ab2874 net: hns3: remove tc enable checking
    3dac38bdce79 net: hns3: do not allow call hns3_nic_net_open repeatedly
    2744341dd52e ixgbe: Fix NULL pointer dereference in ixgbe_xdp_setup
    81369dce6d85 scsi: csiostor: Add module softdep on cxgb4
    7a73120f8eaf Revert "block, bfq: honor already-setup queue merges"
    27b9ff88f1f6 ionic: fix gathering of debug stats
    477e7f62b358 net: ks8851: fix link error
    9d561381e48c bpf, x86: Fix bpf mapping of atomic fetch implementation
    0157eb81e339 selftests, bpf: test_lwt_ip_encap: Really disable rp_filter
    54d54d2e02c7 selftests, bpf: Fix makefile dependencies on libbpf
    173dbe4fdb22 libbpf: Fix segfault in static linker for objects without BTF
    b822ce7334d5 bpf: Exempt CAP_BPF from checks against bpf_jit_limit
    b96fc31338ca RDMA/hns: Add the check of the CQE size of the user space
    8ba300a48a3b RDMA/hns: Fix the size setting error when copying CQE in clean_cq()
    714bfabe5f29 RDMA/hfi1: Fix kernel pointer leak
    d1db35d832a8 e100: fix buffer overrun in e100_get_regs
    474443c9982b e100: fix length calculation in e100_get_regs_len
    ed3617b8aeb4 dsa: mv88e6xxx: Include tagger overhead when setting MTU for DSA and CPU ports
    2c3c98b40e1f dsa: mv88e6xxx: Fix MTU definition
    eabd1e182225 dsa: mv88e6xxx: 6161: Use chip wide MAX MTU
    3027d7ba264f drm/i915: Remove warning from the rps worker
    406b3c0f64ab drm/i915/request: fix early tracepoints
    60edf381ca21 smsc95xx: fix stalled rx after link change
    bac85b1d0745 net: ipv4: Fix rtnexthop len when RTA_FLOW is present
    3636e045de1f net: enetc: fix the incorrect clearing of IF_MODE bits
    d4a6139e651f hwmon: (tmp421) fix rounding for negative values
    8776ad745092 hwmon: (tmp421) report /PVLD condition as fault
    0fe76b4171e4 RDMA/hns: Work around broken constant propagation in gcc 8
    62adc41df3b5 mptcp: allow changing the 'backup' bit when no sockets are open
    385cf9ac00c2 mptcp: don't return sockets in foreign netns
    8180611c238e sctp: break out if skb_header_pointer returns NULL in sctp_rcv_ootb
    734652b0a231 net: mdiobus: Set FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD for mdiobus parents
    7f9cb654462d driver core: fw_devlink: Add support for FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD
    ed2adf69e298 mac80211-hwsim: fix late beacon hrtimer handling
    35367a5b63d9 mac80211: mesh: fix potentially unaligned access
    997ee230e4f5 mac80211: limit injected vht mcs/nss in ieee80211_parse_tx_radiotap
    764a80c53dee mac80211: Fix ieee80211_amsdu_aggregate frag_tail bug
    2e46f261b28c Revert "mac80211: do not use low data rates for data frames with no ack flag"
    5f66dd17451d netfilter: log: work around missing softdep backend module
    f65c73d3aabb netfilter: nf_tables: unlink table before deleting it
    ec0eb6794804 RDMA/irdma: Report correct WC error when there are MW bind errors
    c3044d872d6d RDMA/irdma: Report correct WC error when transport retry counter is exceeded
    63a5c2119924 RDMA/irdma: Validate number of CQ entries on create CQ
    7dce0dc364c4 RDMA/irdma: Skip CQP ring during a reset
    aa85fb7bde55 hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs
    dbe853968d4d bpf, mips: Validate conditional branch offsets
    e56a5146ef8c RDMA/cma: Fix listener leak in rdma_cma_listen_on_all() failure
    2288eafe2c4a IB/cma: Do not send IGMP leaves for sendonly Multicast groups
    67b07e7b490f bpf: Handle return value of BPF_PROG_TYPE_STRUCT_OPS prog
    473c59ab5de5 ipvs: check that ip_vs_conn_tab_bits is between 8 and 20
    ce1cccb000bd drm/i915/gvt: fix the usage of ww lock in gvt scheduler.
    8bb4ef3807d5 interconnect: qcom: sdm660: Correct NOC_QOS_PRIORITY shift and mask
    f3856fe1a057 interconnect: qcom: sdm660: Fix id of slv_cnoc_mnoc_cfg
    5c488a28b436 drm/amdgpu: correct initial cp_hqd_quantum for gfx9
    73bb3f4e877c drm/amdgpu: check tiling flags when creating FB on GFX8-
    0d77b5d94301 drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix
    be6f8fb11a24 drm/amd/display: Fix Display Flicker on embedded panels
    f43a2abf5dd7 drm/amd/display: Pass PCI deviceid into DC
    81a22172ba35 drm/amd/display: initialize backlight_ramping_override to false
    25011c9ec8e7 nbd: use shifts rather than multiplies
    03d884671572 RDMA/cma: Ensure rdma_addr_cancel() happens before issuing more requests
    d9ba5565c7f8 RDMA/cma: Do not change route.addr.src_addr.ss_family
    698c8a0a029b media: ir_toy: prevent device from hanging during transmit
    4ed5f2656691 mmc: renesas_sdhi: fix regression with hard reset on old SDHIs
    dd2ee266dd58 KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR field mask issue
    2cebb9aed993 KVM: nVMX: Fix nested bus lock VM exit
    efd7866e114d KVM: SVM: fix missing sev_decommission in sev_receive_start
    540dd9506ae0 KVM: SEV: Allow some commands for mirror VM
    d6e7fd7ece71 KVM: SEV: Acquire vcpu mutex when updating VMSA
    c9343f03e522 KVM: SEV: Pin guest memory for write for RECEIVE_UPDATE_DATA
    0c1a1c505432 KVM: SEV: Update svm_vm_copy_asid_from for SEV-ES
    5d522f759211 KVM: nVMX: Filter out all unsupported controls when eVMCS was activated
    17e96fe4a8ec KVM: x86: Swap order of CPUID entry "index" vs. "significant flag" checks
    3e7144429936 KVM: x86: Clear KVM's cached guest CR3 at RESET/INIT
    4639ee36e064 KVM: x86: nSVM: don't copy virt_ext from vmcb12
    99a9e9b80f19 KVM: x86: Fix stack-out-of-bounds memory access from ioapic_write_indirect()
    99a016076ed5 ptp: Fix ptp_kvm_getcrosststamp issue for x86 ptp_kvm
    81bfd6268fd3 x86/kvmclock: Move this_cpu_pvti into kvmclock.h
    9a75f445a4a1 platform/x86/intel: hid: Add DMI switches allow list
    27d3eb5616ee mac80211: fix use-after-free in CCMP/GCMP RX
    38b789c914b1 scsi: ufs: Fix illegal offset in UPIU event trace
    de6c8af17f53 gpio: pca953x: do not ignore i2c errors
    16887ae4e3de hwmon: (w83791d) Fix NULL pointer dereference by removing unnecessary structure field
    24af1fe376e2 hwmon: (w83792d) Fix NULL pointer dereference by removing unnecessary structure field
    746011193f44 hwmon: (w83793) Fix NULL pointer dereference by removing unnecessary structure field
    7635f8a7fc8a hwmon: (tmp421) handle I2C errors
    343307d050c1 fs-verity: fix signed integer overflow with i_size near S64_MAX
    2a0d1a8ff21c ACPI: NFIT: Use fallback node id when numa info in NFIT table is incorrect
    062055d4f23e ALSA: hda/realtek: Quirks to enable speaker output for Lenovo Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.
    c949aaec0208 ALSA: firewire-motu: fix truncated bytes in message tracepoints
    12d508014972 ALSA: rawmidi: introduce SNDRV_RAWMIDI_IOCTL_USER_PVERSION
    3327293839d0 scsi: ufs: ufs-pci: Fix Intel LKF link stability
    e130f2ed1da9 cpufreq: schedutil: Destroy mutex before kobject_put() frees the memory
    920e3c77f130 drm/amdgpu: stop scheduler when calling hw_fini (v2)
    8ba968ae672b drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)
    05c8a9dca354 drm/amdgpu: adjust fence driver enable sequence
    8a88b1529a39 scsi: qla2xxx: Changes to support kdump kernel for NVMe BFS
    8d62aec52a8c cpufreq: schedutil: Use kobject release() method to free sugov_tunables
    699d926585da tty: Fix out-of-bound vmalloc access in imageblit
    7be199764d46 watchdog/sb_watchdog: fix compilation problem due to COMPILE_TEST
    a55e7c3f7e4d perf iostat: Fix Segmentation fault from NULL 'struct perf_counts_values *'
    af0bbcbba0d5 perf iostat: Use system-wide mode if the target cpu_list is unspecified
    018e7ce13f2d perf test: Fix DWARF unwind for optimized builds.
    283e4bee701d HID: amd_sfh: Fix potential NULL pointer dereference
    a3d0bfc22a99 kasan: fix Kconfig check of CC_HAS_WORKING_NOSANITIZE_ADDRESS
    5a309b91dd57 NIOS2: fix kconfig unmet dependency warning for SERIAL_CORE_CONSOLE
    a688abc484b5 m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
    e450c422aa23 crypto: ccp - fix resource leaks in ccp_run_aes_gcm_cmd()
    0bfe74174132 s390/qeth: fix deadlock during failing recovery
    0184084365c4 s390/qeth: Fix deadlock in remove_discipline
    946aa1b742df net/mlx4_en: Resolve bad operstate value
    262468353f59 pinctrl: qcom: spmi-gpio: correct parent irqspec translation
    b1ca0c6353d4 ASoC: SOF: imx: imx8m: Bar index is only valid for IRAM and SRAM types
    5f589b073843 ASoC: SOF: imx: imx8: Bar index is only valid for IRAM and SRAM types
    a6bb576ead07 ASoC: SOF: Fix DSP oops stack dump output contents
    69c9494d1450 scsi: elx: efct: Fix void-pointer-to-enum-cast warning for efc_nport_topology
    0a0d0ce37578 ASoC: mediatek: common: handle NULL case in suspend/resume function
    9b5de0165d67 ASoC: fsl_xcvr: register platform component before registering cpu dai
    4916efd4385c ASoC: fsl_spdif: register platform component before registering cpu dai
    63ff9da3572a ASoC: fsl_micfil: register platform component before registering cpu dai
    b04db30f71bb ASoC: fsl_esai: register platform component before registering cpu dai
    799b9ffd7f5a ASoC: fsl_sai: register platform component before registering cpu dai
    ef074ff5a776 media: s5p-jpeg: rename JPEG marker constants to prevent build warnings
    add13fd5e07e media: cedrus: Fix SUNXI tile size calculation
    00426cf7effb media: hantro: Fix check for single irq

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 0baffe6f2f..aa101955d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ca5b19aa3996eb1907f546fce7a7fa55053fbead"
-SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
+SRCREV_machine ?= "a0dca0e4b8b5b7238f27dbbb5cec14750ce29a5c"
+SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.9"
+LINUX_VERSION ?= "5.14.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 5ca45ad894..1a3594e727 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.9"
+LINUX_VERSION ?= "5.14.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "66b3eb63900447948655628e141b54ce0dc3a009"
-SRCREV_machine ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
+SRCREV_machine:qemuarm ?= "0eeb536a4a61174cfec3b95aec7e27740dc0662a"
+SRCREV_machine ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 6a032a1f77..96444fce6c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c3a887f62f231d6b31f0209712014f9cbc7fd77e"
-SRCREV_machine:qemuarm64 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_machine:qemumips ?= "77174bdf6581bdb93f0f458601364800670f8531"
-SRCREV_machine:qemuppc ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_machine:qemuriscv64 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_machine:qemuriscv32 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_machine:qemux86 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_machine:qemux86-64 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_machine:qemumips64 ?= "e86c3a6ad2fde78ad03e0b899286bf603756207d"
-SRCREV_machine ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
-SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
+SRCREV_machine:qemuarm ?= "f70b10ff20aba38b88b584e2afe1b770f7ff9a4f"
+SRCREV_machine:qemuarm64 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_machine:qemumips ?= "08267813b07acec518ec4e08b6cee2faa181f165"
+SRCREV_machine:qemuppc ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_machine:qemuriscv64 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_machine:qemuriscv32 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_machine:qemux86 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_machine:qemux86-64 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_machine:qemumips64 ?= "525aeb16741a2f076c476edc054edcb115ad20ca"
+SRCREV_machine ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
+SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "70248e7b378b96f208d5544ee25b808a8ef2ddc2"
+SRCREV_machine:class-devupstream ?= "325225e2f9fa0a4edf0b7da30c256df2433db6bb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.9"
+LINUX_VERSION ?= "5.14.12"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


