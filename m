Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.4250.1612322656852684886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ov+QNxHs;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id x81so22139123qkb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xhXWPNaLa/D1vkTwN7mnxyLbVREQL2VYLI1aFXm+rgI=;
        b=ov+QNxHsRf41DxoJwUxjlGM8gFgYI3OltNLZ9yb8VLkXsnzJq91unhtuyvNkmWQqoN
         2nH+FTC1WFf75vo+4SXnIkBBBR+CjcvBI7eZaTc+ckQv4k2rqt1xkQ9AwCEP3ttXDZz7
         0qdSYRk99SQ+D6U7D4GlYrisoq3B+qPCrRrQkaw2OJ/dUWDdwN1d4/9RYIq3faKJJJGj
         lbDQUKVO6Hveuv/Cvpf5xLIBITEO7kVKbP0XBrVhtp2iwjl3v5yBTyAfAL4BJaV7CCni
         G/qzWtYbMOcRT8ByqYfS1pmpAfmSxAQn/6d3S6TUHBmvsR1J2K1aLEGO6P+ckwP8bMb+
         4sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xhXWPNaLa/D1vkTwN7mnxyLbVREQL2VYLI1aFXm+rgI=;
        b=b/WpZqfCALbR936A1048ys9aU5+9VJ6iA1an3eUwKRcVXvxrIRw0KNelc5K9rVFTvN
         U3E+kuua67F3i3LYozj3eIhTmsI1h1OVrp6qdM8cRFKEAIWKxP64JidT6uPveHTwx4fC
         VdD2Kka268A4E6dojVs1znu0suAUQlB60tlMnJkzeF0M58YkX9Z/oaXpQx2ll7w4lorN
         qDjJtU0FXKDeBWVQtFDvPo1GxsxlpweIhC1I3wxlBNyVU21a6qFjMjP7/YGiRdfkncjW
         qjrJO8l058LlCxV2rLWT/wxmZh9rYFbLEqgIE20t7pQZYL0r6j1MZV+GfrNkFNzHEg+z
         dfyg==
X-Gm-Message-State: AOAM5320JjrTjK21BFtv/PNk+vHR4W9p6KLyIUHlbURfgsdnD/OIpP3H
	NZOOdOSeJkrEPf1g3TJ1OyY=
X-Google-Smtp-Source: ABdhPJyP1BwLBUO3zCXXPIgaLi8YZCsvTz37h9JRVNRSm36GOvF/oG/QKX4M1r84/YFaR18MKettcw==
X-Received: by 2002:a37:64c2:: with SMTP id y185mr847599qkb.55.1612322655909;
        Tue, 02 Feb 2021 19:24:15 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:15 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/5.10: update to v5.10.10
Date: Tue,  2 Feb 2021 22:24:03 -0500
Message-Id: <e15515de01d290dd9e3ed9ab1f959b607cd6e4b3.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    8dc0fcbcfa97 Linux 5.10.10
    3fe603666360 spi: cadence: cache reference clock rate during probe
    da02e4ca8a29 spi: fsl: Fix driver breakage when SPI_CS_HIGH is not set in spi->mode
    04ed7f1da638 cxgb4/chtls: Fix tid stuck due to wrong update of qid
    d0b97c8cd63e net: dsa: unbind all switches from tree when DSA master unbinds
    6423b2193794 mac80211: check if atf has been disabled in __ieee80211_schedule_txq
    a00432fa4cb9 mac80211: do not drop tx nulldata packets on encrypted links
    a6d508c63573 drm/panel: otm8009a: allow using non-continuous dsi clock
    fd21e00c5e0b can: mcp251xfd: mcp251xfd_handle_rxif_one(): fix wrong NULL pointer check
    65accf0324bf net: stmmac: use __napi_schedule() for PREEMPT_RT
    6f3fe96a6956 rxrpc: Fix handling of an unsupported token type in rxrpc_read()
    2bfb953aeebf net: dsa: clear devlink port type before unregistering slave netdevs
    c469b23d1b54 net: phy: smsc: fix clk error handling
    ad2175c9fb27 dt-bindings: net: renesas,etheravb: RZ/G2H needs tx-internal-delay-ps
    024158d3b571 net: avoid 32 x truesize under-estimation for tiny skbs
    72cfe5b07e85 net: stmmac: fix taprio configuration when base_time is in the past
    34f782b9d0dc net: stmmac: fix taprio schedule configuration
    00442a962152 net: sit: unregister_netdevice on newlink's error path
    5ae772504325 net: stmmac: Fixed mtu channged by cache aligned
    741690db7a35 i40e: fix potential NULL pointer dereferencing
    7c85d8e7ebd2 rxrpc: Call state should be read with READ_ONCE() under some circumstances
    1e5a4c74b555 net: dcb: Accept RTM_GETDCB messages carrying set-like DCB commands
    dbdca9d9b7ca net: dcb: Validate netlink message in DCB handler
    26413630f4f6 esp: avoid unneeded kmap_atomic call
    3c64191cad98 rndis_host: set proper input size for OID_GEN_PHYSICAL_MEDIUM request
    f999ca8c5fc5 net: mvpp2: Remove Pause and Asym_Pause support
    82f72e41b797 mlxsw: core: Increase critical threshold for ASIC thermal zone
    d2bfbfcc5505 mlxsw: core: Add validation of transceiver temperature thresholds
    60b8b4e6310b tipc: fix NULL deref in tipc_link_xmit()
    bbcb4746a6a3 net: ipv6: Validate GSO SKB before finish IPv6 processing
    5a61d9f573da netxen_nic: fix MSI/MSI-x interrupts
    4b97ce051ffe udp: Prevent reuseport_select_sock from reading uninitialized socks
    24cd33174189 net: fix use-after-free when UDP GRO with shared fraglist
    7d5c38974219 net: ipa: modem: add missing SET_NETDEV_DEV() for proper sysfs links
    31ad07292553 bpf: Fix helper bpf_map_peek_elem_proto pointing to wrong callback
    de661caaee07 bpf: Support PTR_TO_MEM{,_OR_NULL} register spilling
    3ed29995c281 bpf: Don't leak memory in bpf getsockopt when optlen == 0
    fdcaa4af5e70 nfsd4: readdirplus shouldn't return parent of export
    90bd4a0cf5dd X.509: Fix crash caused by NULL pointer
    5f52a8a71b62 bpf: Fix signed_{sub,add32}_overflows type handling
    99ea120383b1 drm/amdgpu/display: drop DCN support for aarch64
    4473923b6674 x86/hyperv: Initialize clockevents after LAPIC is initialized
    1200a5bc6871 bpf: Fix selftest compilation on clang 11
    57dc19a9d60d Revert "kconfig: remove 'kvmconfig' and 'xenconfig' shorthands"
    e2d133180bbc Linux 5.10.9
    88a5c90f39b0 netfilter: nf_nat: Fix memleak in nf_nat_init
    f14e31c169dc netfilter: conntrack: fix reading nf_conntrack_buckets
    5b984e538bdf ALSA: firewire-tascam: Fix integer overflow in midi_port_work()
    c0e1ac275f1f ALSA: fireface: Fix integer overflow in transmit_midi_msg()
    0eb56457d239 dm: eliminate potential source of excessive kernel log noise
    26865769ed8f selftests: netfilter: Pass family parameter "-f" to conntrack tool
    f0cd3fba4eae net: sunrpc: interpret the return value of kstrtou32 correctly
    a9bc9c9320ac iommu/vt-d: Fix unaligned addresses for intel_flush_svm_range_dev()
    ff2ca5439c50 riscv: Trace irq on only interrupt is enabled
    c8c01da728ef mm, slub: consider rest of partial list if acquire_slab() fails
    ecca0c675bde drm/i915/gt: Restore clear-residual mitigations for Ivybridge, Baytrail
    de3f572607c2 drm/i915/icl: Fix initing the DSI DSC power refcount during HW readout
    54c9246a47fa drm/i915/dsi: Use unconditional msleep for the panel_on_delay when there is no reset-deassert MIPI-sequence
    f6de06406411 dm zoned: select CONFIG_CRC32
    c6dc4f8e617b umount(2): move the flag validity checks first
    5cd483a7e788 IB/mlx5: Fix error unwinding when set_has_smi_cap fails
    bc296e43233a RDMA/mlx5: Fix wrong free of blue flame register on error
    44693384c324 bnxt_en: Improve stats context resource accounting with RDMA driver loaded.
    3090af5d1fb2 RDMA/usnic: Fix memleak in find_free_vf_and_create_qp_grp
    35694924a60a RDMA/restrack: Don't treat as an error allocation ID wrapping
    cd223237e792 ext4: fix superblock checksum failure when setting password salt
    4351cf25cb52 scsi: ufs: Fix possible power drain during system suspend
    51121ea1d1e8 NFS: nfs_igrab_and_active must first reference the superblock
    b4689562fa95 NFS: nfs_delegation_find_inode_server must first reference the superblock
    01a12a24f923 NFS/pNFS: Fix a leak of the layout 'plh_outstanding' counter
    b666f394d6b8 NFS/pNFS: Don't leak DS commits in pnfs_generic_retry_commit()
    067aefcdfc1e NFS/pNFS: Don't call pnfs_free_bucket_lseg() before removing the request
    e6ae16467af1 NFS: Adjust fs_context error logging
    06f58dbc49a2 pNFS: Stricter ordering of layoutget and layoutreturn
    ecaaad180133 pNFS: Mark layout for return if return-on-close was not sent
    f128de17c8d4 pNFS: We want return-on-close to complete when evicting the inode
    1b42712e43e5 NFS4: Fix use-after-free in trace_event_raw_event_nfs4_set_lock
    76600f633bb9 nvme-tcp: Fix warning with CONFIG_DEBUG_PREEMPT
    b1e9f635a5e3 nvme-tcp: fix possible data corruption with bio merges
    c09af1ee7c23 nvme: don't intialize hwmon for discovery controllers
    a60c7aaaccf6 nvmet-rdma: Fix NULL deref when setting pi_enable and traddr INADDR_ANY
    a835cff329a5 ASoC: Intel: fix error code cnl_set_dsp_D0()
    95e5df536757 ASoC: meson: axg-tdmin: fix axg skew offset
    d11f18351ee6 ASoC: meson: axg-tdm-interface: fix loopback
    a3fddad7af2c dump_common_audit_data(): fix racy accesses to ->d_name
    09b3e0bc8e9a perf intel-pt: Fix 'CPU too large' error
    72c5ce89427f mm: don't put pinned pages into the swap cache
    1eea108995a2 mm: don't play games with pinned pages in clear_page_refs
    41b0b0c09e97 mm: fix clear_refs_write locking
    847c76518c41 blk-mq-debugfs: Add decode for BLK_MQ_F_TAG_HCTX_SHARED
    9812b54310ad net/mlx5: E-Switch, fix changing vf VLANID
    96d77cf22dd7 net/mlx5: Fix passing zero to 'PTR_ERR'
    452e34d6635c net/mlx5e: CT: Use per flow counter when CT flow accounting is enabled
    518606a84a0f iommu/vt-d: Update domain geometry in iommu_ops.at(de)tach_dev
    f1cd8c40936f nvme-fc: avoid calling _nvme_fc_abort_outstanding_ios from interrupt context
    4ac5d20182c7 cfg80211: select CONFIG_CRC32
    e558b38b5e11 x86/sev-es: Fix SEV-ES OUT/IN immediate opcode vc handling
    1f63b3393bac bpf: Save correct stopping point in file seq iteration
    a3a51c69c1a9 bpf: Simplify task_file_seq_get_next()
    30b491e2b6cc rcu-tasks: Move RCU-tasks initialization to before early_initcall()
    bc880f2040e0 poll: fix performance regression due to out-of-line __put_user()
    e30f6e1ac3ce ARM: picoxcell: fix missing interrupt-parent properties
    d565c626b4e1 drm/msm: Call msm_init_vram before binding the gpu
    45f7e133f9e8 ACPI: scan: add stub acpi_create_platform_device() for !CONFIG_ACPI
    a4c84cd83c15 iommu/vt-d: Fix lockdep splat in sva bind()/unbind()
    2c7b7660c611 usb: typec: Fix copy paste error for NVIDIA alt-mode description
    279af879c3df drm/amdgpu: fix potential memory leak during navi12 deinitialization
    9910f52b4cb4 drm/amd/pm: fix the failure when change power profile for renoir
    a973bc7d8ab5 drm/amdgpu: fix a GPU hang issue when remove device
    26f0adb0b4c8 drm/amd/display: fix sysfs amdgpu_current_backlight_pwm NULL pointer issue
    8e57baf3cdb3 nvmet-rdma: Fix list_del corruption on queue establishment failure
    74310d40e0a4 nvme: avoid possible double fetch in handling CQE
    afc0002f6396 nvme-pci: mark Samsung PM1725a as IGNORE_DEV_SUBNQN
    1151161dd029 selftests: fix the return value for UDP GRO test
    2e1939396c77 net: ethernet: fs_enet: Add missing MODULE_LICENSE
    8bd59057edf5 misdn: dsp: select CONFIG_BITREVERSE
    bb3700925c19 arch/arc: add copy_user_page() to <asm/page.h> to fix build error on ARC
    7fdaca86fc9b bfq: Fix computation of shallow depth
    94dbb87fc0b2 io_uring: drop file refs after task cancel
    501e1875da32 spi: fix the divide by 0 error when calculating xfer waiting time
    17a08680ab6a kconfig: remove 'kvmconfig' and 'xenconfig' shorthands
    2aa134d9abca lib/raid6: Let $(UNROLL) rules work with macOS userland
    3163d7c1fbd3 hwmon: (pwm-fan) Ensure that calculation doesn't discard big period values
    8c3520e21f6b habanalabs: Fix memleak in hl_device_reset
    78755373aa48 spi: altera: fix return value for altera_spi_txrx()
    560e9b900e12 staging: spmi: hisi-spmi-controller: Fix some error handling paths
    c78cff56baad habanalabs: register to pci shutdown callback
    68a9abf536ff habanalabs/gaudi: retry loading TPC f/w on -EINTR
    8d0522d9688c habanalabs: adjust pci controller init to new firmware
    06b0d83b33b5 ARM: dts: ux500/golden: Set display max brightness
    d5285a5eb3da ethernet: ucc_geth: fix definition and size of ucc_geth_tx_global_pram
    36afeaad7671 regulator: bd718x7: Add enable times
    29543864c8b8 btrfs: fix transaction leak and crash after RO remount caused by qgroup rescan
    f89d84b35af3 btrfs: merge critical sections of discard lock in workfn
    33061bd104cb btrfs: fix async discard stall
    d18e04ce283a ath11k: qmi: try to allocate a big block of DMA memory first
    cc77e4a020aa netfilter: ipset: fixes possible oops in mtype_resize
    c871060d3eaa ath11k: fix crash caused by NULL rx_channel
    54cfdd65070e ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent with defaults on xt875
    6169a5cfaacc ARC: build: move symlink creation to arch/arc/Makefile to avoid race
    443fb88d6dea ARC: build: add boot_targets to PHONY
    e1c4b5ff9655 ARC: build: add uImage.lzma to the top-level target
    cf4592a2d740 ARC: build: remove non-existing bootpImage from KBUILD_IMAGE
    f7f32822a44a io_uring: drop mm and files after task_work_run
    a3647cddfee6 io_uring: don't take files/mm for a dead task
    85958f60ebba ext4: don't leak old mountpoint samples
    41b5ec745ccf btrfs: tree-checker: check if chunk item end overflows
    85905240bf79 r8152: Add Lenovo Powered USB-C Travel Hub
    53e976bb0708 stmmac: intel: change all EHL/TGL to auto detect phy addr
    7c5b2049caad dm crypt: defer decryption to a tasklet if interrupts disabled
    fe40f6a6309f dm crypt: do not call bio_endio() from the dm-crypt tasklet
    8727884b7f80 dm crypt: do not wait for backlogged crypto request completion in softirq
    93edb8db94cf dm crypt: use GFP_ATOMIC when allocating crypto requests from softirq
    9bf4fbaf7dad dm integrity: fix the maximum number of arguments
    6bba7eff6b33 dm integrity: fix flush with external metadata device
    1ac4156de549 dm snapshot: flush merged data before committing metadata
    5de4f3a301f1 dm raid: fix discard limits for raid1
    ccd903e26750 mm/process_vm_access.c: include compat.h
    d3e43af7c61f mm/hugetlb: fix potential missing huge page size info
    b4ecc259657c mm/vmalloc.c: fix potential memory leak
    33dbd5422c88 compiler.h: Raise minimum version of GCC to 5.1 for arm64
    047ea5a8feff xen/privcmd: allow fetching resource sizes
    3b9f7b0a19f7 ACPI: scan: Harden acpi_device_add() against device ID overflows
    0dbfad171b9c RDMA/ocrdma: Fix use after free in ocrdma_dealloc_ucontext_pd()
    c8c2b27ab34d MIPS: relocatable: fix possible boot hangup with KASLR enabled
    652daca07f4f MIPS: Fix malformed NT_FILE and NT_SIGINFO in 32bit coredumps
    9e2413f41aa2 MIPS: boot: Fix unaligned access with CONFIG_MIPS_RAW_APPENDED_DTB
    974f19621f19 mips: lib: uncached: fix non-standard usage of variable 'sp'
    5ca873f92b4f mips: fix Section mismatch in reference
    4b0a0655da7f riscv: Fix KASAN memory mapping.
    ab7594f63926 riscv: Fixup CONFIG_GENERIC_TIME_VSYSCALL
    7c4ced368204 riscv: return -ENOSYS for syscall -1
    eae7b19b32aa riscv: Drop a duplicated PAGE_KERNEL_EXEC
    531c88c9fe56 cifs: fix interrupted close commands
    0e4c42cb4a5f cifs: check pointer before freeing
    2207c3ce7075 ext4: fix bug for rename with RENAME_WHITEOUT
    15a062c79d49 ext4: fix wrong list_splice in ext4_fc_cleanup
    6c557cb1f9d7 ext4: use IS_ERR instead of IS_ERR_OR_NULL and set inode null when IS_ERR
    fcae2beac981 tools/bootconfig: Add tracing_on support to helper scripts
    75942370699b tracing/kprobes: Do the notrace functions check without kprobes on ftrace
    47319c4b81a3 drm/bridge: sii902x: Enable I/O and core VCC supplies if present
    af402f64ca08 dt-bindings: display: sii902x: Add supply bindings
    c0c34c5ab715 drm/bridge: sii902x: Refactor init code into separate function
    0a34addcdbd9 drm/i915/backlight: fix CPU mode backlight takeover on LPT
    48b8c6689efa drm/i915/gt: Limit VFE threads based on GT
    481e27f05073 drm/i915: Allow the sysadmin to override security mitigations
    586a42de0bae drm/amdgpu: add new device id for Renior
    989a0f6791ff Revert "drm/amd/display: Fixed Intermittent blue screen on OLED panel"
    7fe745881255 drm/amdgpu: fix DRM_INFO flood if display core is not supported (bug 210921)
    9c6524bba523 drm/amdgpu: add green_sardine device id (v2)
    ad8ca24ba879 x86/hyperv: check cpu mask after interrupt has been disabled
    0351fbe00a23 ASoC: dapm: remove widget from dirty list on free
    55eb1867a5b3 ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad X395
    69b84d87fd59 ALSA: doc: Fix reference to mixart.rst
    617b1bae7ee9 ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machines
    f37fba66a437 btrfs: prevent NULL pointer dereference in extent_io_tree_panic
    e883eb5d1567 btrfs: reloc: fix wrong file extent type check to avoid false ENOENT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c855496fa2..7e186c8eae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7fa491ad298d663a0cb15570c00cfc203b041e83"
-SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
+SRCREV_machine ?= "3ad985647155ca228a430e5c0f86cababbdddf8a"
+SRCREV_meta ?= "7c4c7ee59bff544ad38f7e9ae32294e081503bed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.8"
+LINUX_VERSION ?= "5.10.10"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 31a1a99809..51975cb783 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.8"
+LINUX_VERSION ?= "5.10.10"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "84386300e289d626241b4dd253196699288db769"
-SRCREV_machine ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
+SRCREV_machine_qemuarm ?= "1e45cad5afd401eb582742812c0f0b3379f42db5"
+SRCREV_machine ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_meta ?= "7c4c7ee59bff544ad38f7e9ae32294e081503bed"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 45f45df4e8..282e86eec7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "21e6c0998375e9fed976dcdf7888960b953d7408"
-SRCREV_machine_qemuarm64 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_machine_qemumips ?= "e55d1b83ee3f796e09f1c6ad919133bc3965f753"
-SRCREV_machine_qemuppc ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_machine_qemuriscv64 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_machine_qemux86 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_machine_qemux86-64 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_machine_qemumips64 ?= "8db40baaaa30740a7e6d9bd696756daae0b29d1f"
-SRCREV_machine ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
-SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
+SRCREV_machine_qemuarm ?= "49acdea639853d967b5a0a72dd288839d45f78c5"
+SRCREV_machine_qemuarm64 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_machine_qemumips ?= "c096f7c97c84b4d96befc549af2767bc0558e388"
+SRCREV_machine_qemuppc ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_machine_qemuriscv64 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_machine_qemux86 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_machine_qemux86-64 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_machine_qemumips64 ?= "cdbb51e878dbb2b400e9ec9d9a879507abd62f91"
+SRCREV_machine ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
+SRCREV_meta ?= "7c4c7ee59bff544ad38f7e9ae32294e081503bed"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.8"
+LINUX_VERSION ?= "5.10.10"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

