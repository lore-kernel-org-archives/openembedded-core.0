Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378EFEE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:44:57 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.293.1692632696492564243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Bn4aMbZS;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4107e6fb0e8so21966771cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632695; x=1693237495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BItY+k+qCsWinyyW33bdgVVBIlrQaovKXwND7jVSbaI=;
        b=Bn4aMbZSu9DlLzSnMt6uCYPb/sszh6D/u3p21eQGYRdbkeTmvNnjgN3ilWRWeDV6ZY
         55jBgtPB/GADonC+FPi9m8Q0DCMwhrJMJOHf/sZ1Ldw01pmJpUc3pehjA98B1epRHCUd
         PhV9ht/GeNXNXlhG+KVeMmTOGoL7tVWT5/Kx9iy7nldGEoF5MjmmecL2AHzSsxoVk6gr
         JAQh66zZr/eNtn+livd/ToQhyHZ8oc2ANHXSSv+5SPL+w6azuUjcn0xxs10jztAB4U7m
         nvI6M/d89WbyCmZRSCRaBlJ+Uckgi8GgUWKOIlpyWbZsj6QQg4Yb12j7kUwjB+O/jCoL
         kHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632695; x=1693237495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BItY+k+qCsWinyyW33bdgVVBIlrQaovKXwND7jVSbaI=;
        b=DlpGTTUxy7K44lSDmmBpX67X4bRqqzW4REGH+gWitDrrMQbjW59gj9fKt1P29Ph32V
         XQIg1CU3VTu34ZPY1OshHTq3TrDMCeJ4/BsFaaOywNI3H6bsVaiZk/mfSe3caP2GfEEw
         Mu4iMNNMD9486w2AiN+opTTXIu58LCELbdlyci1iYuJyJtodrY0T0KpXh5Ahg+9gLhAy
         lEUkQ153ilMb9GDqNT0G3FCNbP+1BY/j5khE88nOMdmHJo0spKb3Oj05BkVPK6h8KdkW
         1IxMHe0NG9JjC2Mlb5Gs96iqgf2YQ4GGa1ALczP2ly0uIdI+vmqWX2gTyjOotlAwIMq5
         9W7Q==
X-Gm-Message-State: AOJu0YySWYwXTdzlmTd4Fp+0+vvbT7whQrrkfOlj0sRd+G3tID/OIiAH
	BzUKYTJ5WM5MtEJysCBQGoqCY94bcppJ+g==
X-Google-Smtp-Source: AGHT+IECXqM5R/sgA1xUrTq3vmfSLqqCbNsBI5uDx/2ZnratlFogLDZhAfu3x8zGMQXDhdlRwUUEqQ==
X-Received: by 2002:a0c:df05:0:b0:64a:f26a:632 with SMTP id g5-20020a0cdf05000000b0064af26a0632mr8575073qvl.30.1692632695202;
        Mon, 21 Aug 2023 08:44:55 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] linux-yocto/6.4: update to v6.4.11
Date: Mon, 21 Aug 2023 11:44:42 -0400
Message-Id: <9e95c9f0f805714e47e5440ade375ba21e2c13c6.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186457

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    eb3cdb587879 Linux 6.4.11
    0fc364d079fd alpha: remove __init annotation from exported page_is_ram()
    7438f63562fa ACPI: scan: Create platform device for CS35L56
    fee4731266af platform/x86: serial-multi-instantiate: Auto detect IRQ resource for CSC3551
    cada3f116e8d platform: mellanox: Fix order in exit flow
    26cca33e5d2b platform: mellanox: mlx-platform: Modify graceful shutdown callback and power down mask
    90516af4b63c platform: mellanox: mlx-platform: Fix signals polarity and latch mask
    9005ce6ecd31 platform: mellanox: Change register offset addresses
    53f2cbc03aa5 platform/x86: lenovo-ymc: Only bind on machines with a convertible DMI chassis-type
    791a666573d1 platform/x86: msi-ec: Fix the build
    52620dae7c33 scsi: qedf: Fix firmware halt over suspend and resume
    78dca9ac06fc scsi: qedi: Fix firmware halt over suspend and resume
    d4326d5256cc scsi: fnic: Replace return codes in fnic_clean_pending_aborts()
    43c0e16d0c5e scsi: core: Fix possible memory leak if device_add() fails
    ed0acb1ee2e9 scsi: snic: Fix possible memory leak if device_add() fails
    0e85ca3f9272 scsi: 53c700: Check that command slot is not NULL
    9a731466afc5 scsi: ufs: renesas: Fix private allocation
    763c06565055 scsi: storvsc: Fix handling of virtual Fibre Channel timeouts
    20831760ea77 scsi: core: Fix legacy /proc parsing buffer overflow
    e044b1b286ec btrfs: set cache_block_group_error if we find an error
    84256e00eeca btrfs: reject invalid reloc tree root keys with stack dump
    a96b6519ac71 btrfs: exit gracefully if reloc roots don't match
    663c9949ba5c btrfs: properly clear end of the unreserved range in cow_file_range
    15da6eaecc2f btrfs: don't wait for writeback on clean pages in extent_write_cache_pages
    f1f2e3a418ff btrfs: don't stop integrity writeback too early
    793525c287c9 btrfs: wait for actual caching progress during allocation
    373b7dbe1c3d gpio: sim: mark the GPIO chip as a one that can sleep
    c2e0d39e76be gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent
    753bcd16bdf4 ibmvnic: Ensure login failure recovery is safe from other resets
    7024d79d01bb ibmvnic: Do partial reset on login failure
    3e4ae6669a0a ibmvnic: Handle DMA unmapping of login buffs in release functions
    7abe2a2033af ibmvnic: Unmap DMA login rsp buffer on send login fail
    2a394e5511fb ibmvnic: Enforce stronger sanity checks on login response
    62ef77587905 net/mlx5: Reload auxiliary devices in pci error handlers
    6a604ea891ba net/mlx5: Skip clock update work when device is in error state
    498e7e243458 net/mlx5: LAG, Check correct bucket when modifying LAG
    dc91dae14f6f net/mlx5e: Unoffload post act rule when handling FIB events
    4321bbc16fee net/mlx5: Allow 0 for total host VFs
    c256f96535bd net/mlx5: DR, Fix wrong allocation of modify hdr pattern
    bc1918bac0f3 net/mlx5e: TC, Fix internal port memory leak
    16b7775ae438 net/mlx5e: Take RTNL lock when needed before calling xdp_set_features()
    8c23a2878c82 dmaengine: owl-dma: Modify mismatched function name
    0d2bbddb0578 dmaengine: idxd: Clear PRS disable flag when disabling IDXD device
    957c8fbde39a dmaengine: mcf-edma: Fix a potential un-allocated memory access
    07f970ebe6dd net: hns3: fix strscpy causing content truncation issue
    d25665f52855 nexthop: Fix infinite nexthop bucket dump when using maximum nexthop ID
    0fb288559cd0 nexthop: Make nexthop bucket dump more efficient
    b6732dd0228c nexthop: Fix infinite nexthop dump when using maximum nexthop ID
    e691f864c043 net: enetc: reimplement RFS/RSS memory clearing as PCI quirk
    ef2d6bf96956 net: hns3: fix deadlock issue when externel_lb and reset are executed together
    008b9c6167bd net: hns3: add wait until mac link down
    6a5e230a8a17 net: hns3: refactor hclge_mac_link_status_wait for interface reuse
    7ae8fa6b7097 net: dsa: ocelot: call dsa_tag_8021q_unregister() under rtnl_lock() on driver remove
    15d362ca86c7 net: phy: at803x: remove set/get wol callbacks for AR8032
    8373dca3c1f8 net: marvell: prestera: fix handling IPv4 routes with nhid
    3fde6360e63c net: tls: avoid discarding data on record close
    f5ebe0d12d59 RDMA/bnxt_re: Fix error handling in probe failure path
    c95863f6d970 RDMA/bnxt_re: Properly order ib_device_unalloc() to avoid UAF
    1035af5a3bc5 RDMA/umem: Set iova in ODP flow
    e64babe4b8e1 wifi: cfg80211: fix sband iftype data lookup for AP_VLAN
    8ae32cdfa568 wifi: brcm80211: handle params_v1 allocation failure
    f16e9bfb574b drm/rockchip: Don't spam logs in atomic check
    bd7b1430a21b drm/nouveau: remove unused tu102_gr_load() function
    7eacde7fb948 drm/bridge: it6505: Check power state with it6505->powered in IRQ handler
    059412083cf7 drm/amd/display: Don't show stack trace for missing eDP
    d32a5e9b825d IB/hfi1: Fix possible panic during hotplug remove
    1b5006a37aa8 iavf: fix potential races for FDIR filters
    1b57f1794cf2 drivers: vxlan: vnifilter: free percpu vni stats on error path
    6b730822e4f1 drivers: net: prevent tun_build_skb() to exceed the packet size limit
    d1f38d313bdf dccp: fix data-race around dp->dccps_mss_cache
    eef72d9d719c bonding: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    3e7722c31d41 xsk: fix refcount underflow in error path
    fe6a9f751673 tunnels: fix kasan splat when generating ipv4 pmtu error
    04a1dd890231 tcp: add missing family to tcp_set_ca_state() tracepoint
    3a1889c18558 PCI: move OF status = "disabled" detection to dev->match_driver
    1fa769379f16 net/smc: Use correct buffer sizes when switching between TCP and SMC
    452b2d7a4b1f net/smc: Fix setsockopt and sysctl to specify same buffer size again
    6664320bc2b0 net/packet: annotate data-races around tp->status
    813aa9981a6d ionic: Add missing err handling for queue reconfig
    d753b5f6b3f1 igc: Add lock to safeguard global Qbv variables
    c951a1eeff18 mptcp: fix the incorrect judgment for msk->cb_flags
    019928ce14fe macsec: use DEV_STATS_INC()
    ea7a38287d1f mISDN: Update parameter type of dsp_cmx_send()
    16ce06695c92 hwmon: (aquacomputer_d5next) Add selective 200ms delay after sending ctrl report
    4975d45c2631 bpf, sockmap: Fix bug that strp_done cannot be called
    1270c6299af3 bpf, sockmap: Fix map type error in sock_map_del_link
    d9252d67ed2f net: core: remove unnecessary frame_sz check in bpf_xdp_adjust_tail()
    3ee001d3aca5 selftests: forwarding: bridge_mdb: Make test more robust
    42543ba66de6 selftests: forwarding: bridge_mdb: Fix failing test with old libnet
    d847c5ee4a64 selftests: forwarding: bridge_mdb_max: Fix failing test with old libnet
    f6fcd58181f4 selftests: forwarding: tc_flower: Relax success criterion
    2d3edc009931 selftests: forwarding: tc_actions: Use ncat instead of nc
    ee5f0f837a3f selftests: forwarding: Switch off timeout
    98206738e761 selftests: forwarding: Skip test when no interfaces are specified
    16e6760d6d58 selftests: forwarding: hw_stats_l3_gre: Skip when using veth pairs
    17135cfe4752 selftests: forwarding: ethtool_extended_state: Skip when using veth pairs
    2235d0171f0e selftests: forwarding: ethtool: Skip when using veth pairs
    f00c016b0aa6 selftests: forwarding: Add a helper to skip test when using veth pairs
    0b1745accf6b selftests/rseq: Fix build with undefined __weak
    cf16eeb9816c selftests/bpf: fix a CI failure caused by vsock sockmap test
    3896d810d6fc dmaengine: xilinx: xdma: Fix Judgment of the return value
    65b884018c99 dmaengine: xilinx: xdma: Fix typo
    af406bdbf3b1 KVM: arm64: Fix hardware enable/disable flows for pKVM
    4d3fd2be849a selftests: forwarding: bridge_mdb: Check iproute2 version
    5853f362fcc6 selftests: forwarding: bridge_mdb_max: Check iproute2 version
    df96d95b7a76 selftests: forwarding: ethtool_mm: Skip when MAC Merge is not supported
    5025e4318a03 selftests: forwarding: tc_tunnel_key: Make filters more specific
    e431ff5cef6c interconnect: qcom: sm8550: add enable_mask for bcm nodes
    88131e424650 interconnect: qcom: sm8450: add enable_mask for bcm nodes
    8928567f460f interconnect: qcom: sa8775p: add enable_mask for bcm nodes
    37dcb0e7bc39 interconnect: qcom: Add support for mask-based BCMs
    8e744d466db6 iio: light: bu27034: Fix scale format
    a4b34cccff14 iio: core: Prevent invalid memory access when there is no parent
    3865436d2114 iio: imu: lsm6dsx: Fix mount matrix retrieval
    b686f6074c7b netfilter: nft_set_hash: mark set element as dead when deleting from packet path
    e4d71d6a9c7d netfilter: nf_tables: adapt set backend to use GC transaction API
    0624f190b574 netfilter: nf_tables: GC transaction API to avoid race with control plane
    bd156ce9553d netfilter: nf_tables: don't skip expired elements during walk
    e41bc6e0ec52 drm/nouveau/disp: Revert a NULL check inside nouveau_connector_get_modes
    456eac27a474 Revert "PCI: mvebu: Mark driver as BROKEN"
    c4ea4f7241dc x86: Move gds_ucode_mitigated() declaration to header
    f0d3379b4ea6 x86/speculation: Add cpu_show_gds() prototype
    c67ee610c9f9 x86/linkage: Fix typo of BUILD_VDSO in asm/linkage.h
    b85f340e5a9b x86/sev: Do not try to parse for the CC blob on non-AMD hardware
    5c0d1eda1f82 x86/mm: Fix VDSO and VVAR placement on 5-level paging machines
    0a638acf3367 x86/cpu/amd: Enable Zenbleed fix for AMD Custom APU 0405
    84bf9e4a4637 x86/vdso: Choose the right GDT_ENTRY_CPUNODE for 32-bit getcpu() on 64-bit kernel
    593d6381e646 x86/srso: Fix build breakage with the LLVM linker
    ce1ebdd6e639 usb: typec: altmodes/displayport: Signal hpd when configuring pin assignment
    aba8c65bb9e4 usb: typec: tcpm: Fix response to vsafe0V event
    7fd656100d59 usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
    8c1edc00db65 USB: Gadget: core: Help prevent panic during UVC unconfigure
    558bcb5e7288 usb: dwc3: Properly handle processing of pending events
    373e0ab8c4c5 usb-storage: alauda: Fix uninit-value in alauda_check_media()
    0752bb32aed2 thunderbolt: Fix memory leak in tb_handle_dp_bandwidth_request()
    69304c8d285b misc: rtsx: judge ASPM Mode to set PETXCFG Reg
    ee95051c0c19 binder: fix memory leak in binder_init()
    13f3ce53b65a iio: adc: ina2xx: avoid NULL pointer dereference on OF device match
    a3751305397d iio: adc: meson: fix core clock enable/disable moment
    9656c2baeb54 iio: adc: ad7192: Fix ac excitation feature
    d28e4f9b5716 iio: frequency: admv1013: propagate errors from regulator_get_voltage()
    773cf6b3b64a iio: cros_ec: Fix the allocation size for cros_ec_command
    737d519e7b38 drm/amd/pm: avoid unintentional shutdown due to temperature momentary fluctuation
    a4e94b8816b6 drm/amd/pm: expose swctf threshold setting for legacy powerplay
    3a38bc2f475b mm: memory-failure: avoid false hwpoison page mapped error info
    97d06fb1e8a4 mm: memory-failure: fix potential unexpected return value from unpoison_memory()
    b41c0999b35f selftests: mm: ksm: fix incorrect evaluation of parameter
    da7beebb49c6 mm/damon/core: initialize damo_filter->list from damos_new_filter()
    9a1a43a0e7e9 hugetlb: do not clear hugetlb dtor until allocating vmemmap
    4747cc404258 accel/ivpu: Add set_pages_array_wc/uc for internal buffers
    5828d5f5dc87 nilfs2: fix use-after-free of nilfs_root in dirtying inodes via iput
    6accf02034f2 fs/proc/kcore: reinstate bounce buffer for KCORE_TEXT regions
    ddcfc33a2038 cpufreq: amd-pstate: fix global sysfs attribute type
    965a20ed518a radix tree test suite: fix incorrect allocation size for pthreads
    651ed8d88521 hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP_STATUS_CHECK for pfe1100
    ad0bcbd2d19f zsmalloc: fix races between modifications of fullness and isolated
    f042605998da io_uring: correct check for O_TMPFILE
    6befa74c70fa cpuidle: psci: Move enabling OSI mode after power domains creation
    05dca3a190c7 cpuidle: dt_idle_genpd: Add helper function to remove genpd topology
    d78177be9b01 tpm_tis: Opt-in interrupts
    27722a5a5c30 tpm: tpm_tis: Fix UPX-i11 DMI_MATCH condition
    349a7b42bcd5 drm/amd: Disable S/G for APUs when 64GB or more host memory
    40df9ac4a936 drm/amd/display: check attr flag before set cursor degamma on DCN3+
    9206004c9540 drm/amd/display: Fix a regression on Polaris cards
    cef7a321d82f drm/amd/pm: correct the pcie width for smu 13.0.0
    e08e9dd09809 drm/amdgpu: fix possible UAF in amdgpu_cs_pass1()
    8996eeaac498 drm/shmem-helper: Reset vma->vm_ops before calling dma_buf_mmap()
    ab4ae028f973 drm/nouveau/nvkm/dp: Add workaround to fix DP 1.3+ DPCD issues
    1092c929bb78 drm/nouveau/gr: enable memory loads on helper invocation on all channels
    061fbf64825f nvme-pci: add NVME_QUIRK_BOGUS_NID for Samsung PM9B1 256G and 512G
    1e59c7194dc5 nvme-rdma: fix potential unbalanced freeze & unfreeze
    0c48e4590aa7 nvme-tcp: fix potential unbalanced freeze & unfreeze
    0712a9ef6b0b nvme: fix possible hang when removing a controller during error recovery
    b6c506a14686 riscv: mm: fix 2 instances of -Wmissing-variable-declarations
    e1bcaa14194b riscv/kexec: handle R_RISCV_CALL_PLT relocation type
    0b00f20d453e riscv,mmio: Fix readX()-to-delay() ordering
    ef6169c76999 riscv/kexec: load initrd high in available memory
    8486218eb60d riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping
    24555c3794bc parisc: Fix lightweight spinlock checks to not break futexes
    7dc5a1f27989 io_uring/parisc: Adjust pgoff in io_uring mmap() for parisc
    729881aeec33 zram: take device and not only bvec offset into account
    0f70a470e2ed ACPI: resource: Add IRQ override quirk for PCSpecialist Elimina Pro 16 M
    2756f4353d26 ACPI: resource: Honor MADT INT_SRC_OVR settings for IRQ1 on AMD Zen
    8bb595a262bc ACPI: resource: Always use MADT override IRQ settings for all legacy non i8042 IRQs
    d9dbddc66461 ACPI: resource: revert "Remove "Zen" specific match and quirks"
    13716b91514c net: mana: Fix MANA VF unload when hardware is unresponsive
    d5c2c893e2f8 dmaengine: xilinx: xdma: Fix interrupt vector setting
    16ab6a83809d dmaengine: pl330: Return DMA_PAUSED when transaction is paused
    b2b4c84eb714 mptcp: fix disconnect vs accept race
    3c78824221ba mptcp: avoid bogus reset on fallback close
    4f733a06809c selftests: mptcp: join: fix 'implicit EP' test
    a762ac80dd6d selftests: mptcp: join: fix 'delete and re-add' test
    10d0726c4680 ipv6: adjust ndisc_is_useropt() to also return true for PIO
    8235a0ecabd3 mmc: sdhci-f-sdh30: Replace with sdhci_pltfm
    d361d76fdf9e mmc: moxart: read scr register without changing byte order
    d36914ba66c4 wireguard: allowedips: expand maximum node depth
    c0e1eebfe99e selftests: forwarding: Set default IPv6 traceroute utility
    d48663156f19 wifi: rtw89: fix 8852AE disconnection caused by RX full flags
    7d09f9f255a5 wifi: nl80211: fix integer overflow in nl80211_parse_mbssid_elems()
    ab8e9a874574 KVM: SEV: only access GHCB fields once
    b85422c221d5 KVM: SEV: snapshot the GHCB before accessing it
    4bf629262f91 ksmbd: fix wrong next length validation of ea buffer in smb2_set_ea()
    ff7236b66d69 ksmbd: validate command request size
    d75c2b5e06bc tpm: Add a helper for checking hwrng enabled
    6b718101cd99 tpm/tpm_tis: Disable interrupts for Lenovo P620 devices
    872fe964648c tpm: Disable RNG for all AMD fTPMs
    bc3d1e146f83 tpm/tpm_tis: Disable interrupts for TUXEDO InfinityBook S 15/17 Gen7

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 999d54a46a..95891cdf60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a6b1e0d6cfc7843898d7624427f50e5391edac51"
-SRCREV_meta ?= "be4b1defa25b1560b7d92e1ade1b7c52a226fc38"
+SRCREV_machine ?= "efba76521c3c18fc10ab88e3b94293f19be9fdc8"
+SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.10"
+LINUX_VERSION ?= "6.4.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 063c39bb9d..5de53abcd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.10"
+LINUX_VERSION ?= "6.4.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_meta ?= "be4b1defa25b1560b7d92e1ade1b7c52a226fc38"
+SRCREV_machine ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index d255504bd2..45d19edb79 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "53136802928146b86b68bdf796f825d142e3a014"
-SRCREV_machine:qemuarm64 ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemuloongarch64 ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemumips ?= "bec202d0a29e4acf9d4e673f1c358e60879c95dc"
-SRCREV_machine:qemuppc ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemuriscv64 ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemuriscv32 ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemux86 ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemux86-64 ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_machine:qemumips64 ?= "e9dcec67cb7b9703d6eac9a705e94e5f5aab4f0c"
-SRCREV_machine ?= "a0b10018f36e04152354dc83c41134406e137571"
-SRCREV_meta ?= "be4b1defa25b1560b7d92e1ade1b7c52a226fc38"
+SRCREV_machine:qemuarm ?= "1918d171c09ab3aeedcf7c9f0a98d7c3c10a8524"
+SRCREV_machine:qemuarm64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemuloongarch64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemumips ?= "f3ec8aee3f7ce0adc65668dd18347f144c12709c"
+SRCREV_machine:qemuppc ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemuriscv64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemuriscv32 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemux86 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemux86-64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemumips64 ?= "bc7632d06c742e712514981591ce647b5d6cbd15"
+SRCREV_machine ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b269b0268d4121d033721775d6e0c1114acfe50b"
+SRCREV_machine:class-devupstream ?= "eb3cdb587879a7794c7f649011c565d7a94f3e2e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.10"
+LINUX_VERSION ?= "6.4.11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


