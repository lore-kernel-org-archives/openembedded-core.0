Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.4356.1612322659715298218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ekfk4gPI;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id o18so16648199qtp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QkP0mwD5c9q+40Snjq76Q5IVTdssd7i1E3BPKYQTVHc=;
        b=ekfk4gPIUQek70kyMgH+6wVYiUdV/yIH0krEvoGZD+VGAyn+NJ3P3eBk0FHlj4FATu
         QpflTJwkWLdp1MPXG5o8c/XOkPJADaxKnLdENRgVTxIwTbYaRTswUecO7p8L44QBWHYx
         O5YAAnA1APuYUmjcD5YQ8XsOAWb5p5MvzXN3cTJ7SF0JPDnxWxQ5n3y4cIIbM0twptCf
         1eIY1EWhr5w3o96xmKNEKu1Sfvu2+aKQvBXv7p4Srm5v38fedRGZy4eZgX5fyO6fOhou
         a7ysRyDlTa/vTYIdlv1Zqn56hDxFGt0Hy6cKlaLkYnchuAq2MpcAxlCvIolVY+Eea7ue
         qZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QkP0mwD5c9q+40Snjq76Q5IVTdssd7i1E3BPKYQTVHc=;
        b=GOBRB5+WzLWX3PSjdx6tV/qM8q+m8hRoLjd2UXNn2NkxTMse+svR49ASiW0yJ44g8h
         cn4hnd+eEu4iM89Ph9R3d3Myf/JeQvxZZTM1f8mlZVPIqZ5jKRyMzQ2cS+7+YWf/LNv0
         Y+GwUGCryjxemo7cYExl2FnzYnmRDC4Y7FGOcef0zpTQ3io1G0LNd+TdcWItVP5TKn12
         T1SaOyXqaCjeDd4GKR1fsiOMDjsS7WchkDk3dwtcgKhbZOneaOA1aRoVIayuth6rYZ+Z
         6Qtt7nlnnrZh3Gld2WaQT5DseVuEroy3L9Z8o3OEkxbA31wkKGCN+ZjnveUIIoS7Vqxy
         6AJQ==
X-Gm-Message-State: AOAM530XzUQO1Mt7ZWTSwA1ZftZ3BWqYCDNqdbt/WyA6Y9ocUMUw40ij
	PIskdczj2Vcc+nGY1pLXH+E=
X-Google-Smtp-Source: ABdhPJwLiE9KlVMFJlgZ1hLsd2DfdjHZEIOfxqyMcg6UBqDB0zJ/GHPplJm+WBYNGM1E9VYqaJ5ioA==
X-Received: by 2002:a05:622a:93:: with SMTP id o19mr936515qtw.336.1612322658728;
        Tue, 02 Feb 2021 19:24:18 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:17 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/5.4: update to v5.4.94
Date: Tue,  2 Feb 2021 22:24:05 -0500
Message-Id: <94271b855d86e9eb6f40d78b808559a0255aab0e.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    0fbca6ce4174 Linux 5.4.94
    315cd8fc2ad2 fs: fix lazytime expiration handling in __writeback_single_inode()
    5f8b8fccdfbc writeback: Drop I_DIRTY_TIME_EXPIRE
    2d8848edc96b dm integrity: conditionally disable "recalculate" feature
    43546b74ce6c tools: Factor HOSTCC, HOSTLD, HOSTAR definitions
    ab85b382dcf7 SMB3.1.1: do not log warning message if server doesn't populate salt
    0edc78af73d0 arm64: mm: use single quantity to represent the PA to VA translation
    b899d5b2a42a tracing: Fix race in trace_open and buffer resize call
    c4a23c852e80 io_uring: Fix current->fs handling in io_sq_wq_submit_work()
    336bb7dc5a1c HID: wacom: Correct NULL dereference on AES pen proximity
    ecd62d2e9ab4 futex: Handle faults correctly for PI futexes
    55ea172ce3eb futex: Simplify fixup_pi_state_owner()
    a3155c362ca0 futex: Use pi_state_update_owner() in put_pi_state()
    ceb83cf9ed67 rtmutex: Remove unused argument from rt_mutex_proxy_unlock()
    015b6a4c2564 futex: Provide and use pi_state_update_owner()
    65aad57cac8d futex: Replace pointless printk in fixup_owner()
    0dae88a92596 futex: Ensure the correct return value from futex_lock_pi()
    c27a2a1ecf69 Revert "mm/slub: fix a memory leak in sysfs_slab_add()"
    4afd772371d9 gpio: mvebu: fix pwm .get_state period calculation
    131f8d8a889a Linux 5.4.93
    f7020c437e13 tcp: fix TCP_USER_TIMEOUT with zero window
    945d182a046f tcp: do not mess with cloned skbs in tcp_add_backlog()
    ccc248b6444a net: dsa: b53: fix an off by one in checking "vlan->vid"
    ff64094dc718 net: Disable NETIF_F_HW_TLS_RX when RXCSUM is disabled
    3e5b335a55e9 net: mscc: ocelot: allow offloading of bridge on top of LAG
    b47a3c32c4c2 ipv6: set multicast flag on the multicast route
    b778940f2ab9 net_sched: reject silly cell_log in qdisc_get_rtab()
    4ed347901f08 net_sched: avoid shift-out-of-bounds in tcindex_set_parms()
    bc757ba6dc75 ipv6: create multicast route with RTPROT_KERNEL
    60fb547a3d5d udp: mask TOS bits in udp_v4_early_demux()
    da3711f42c68 kasan: fix incorrect arguments passing in kasan_add_zero_shadow
    0d190f53fa2f kasan: fix unaligned address is unhandled in kasan_remove_zero_shadow
    5a3890bad3a4 skbuff: back tiny skbs with kmalloc() in __netdev_alloc_skb() too
    49aaf012c478 lightnvm: fix memory leak when submit fails
    0ff55fc4d6a1 sh_eth: Fix power down vs. is_opened flag ordering
    fd2f5130ae98 net: dsa: mv88e6xxx: also read STU state in mv88e6250_g1_vtu_getnext
    4e1d17a1f73b sh: dma: fix kconfig dependency for G2_DMA
    8a0b8e26f79f netfilter: rpfilter: mask ecn bits before fib lookup
    99328b4b4408 x86/cpu/amd: Set __max_die_per_package on AMD
    6f8ba0ada139 pinctrl: ingenic: Fix JZ4760 support
    382ffe786647 driver core: Extend device_is_dependent()
    4e749a28c909 xhci: tegra: Delay for disabling LFPS detector
    a6a5d08170c2 xhci: make sure TRB is fully written before giving it to the controller
    7f3cfc7e378d usb: bdc: Make bdc pci driver depend on BROKEN
    f764f90b0c77 usb: udc: core: Use lock when write to soft_connect
    564f3c532642 usb: gadget: aspeed: fix stop dma register setting.
    f89a193fd9d3 USB: ehci: fix an interrupt calltrace error
    9a660760299b ehci: fix EHCI host controller initialization sequence
    5eda5db39e28 serial: mvebu-uart: fix tx lost characters at power off
    a8fade59466c stm class: Fix module init return on allocation failure
    5e4bacea58ca intel_th: pci: Add Alder Lake-P support
    c5885886c72c x86/mmx: Use KFPU_387 for MMX string operations
    d1a9cd1dc53c x86/topology: Make __max_die_per_package available unconditionally
    cdb4ce96fdd2 x86/fpu: Add kernel_fpu_begin_mask() to selectively initialize state
    cd1c4882ab43 irqchip/mips-cpu: Set IPI domain parent chip
    9a2f6007a228 cifs: do not fail __smb_send_rqst if non-fatal signals are pending
    745229c90301 iio: ad5504: Fix setting power-down state
    ddd1416f4413 can: peak_usb: fix use after free bugs
    a24476b37167 can: vxcan: vxcan_xmit: fix use after free bug
    ac48ef15826e can: dev: can_restart: fix use after free bug
    391187744436 selftests: net: fib_tests: remove duplicate log test
    237375005739 platform/x86: intel-vbtn: Drop HP Stream x360 Convertible PC 11 from allow-list
    57f0f0ddf9e4 i2c: octeon: check correct size of maximum RECV_LEN packet
    485e0255c19e powerpc: Fix alignment bug within the init sections
    cfea5cddeb71 scsi: megaraid_sas: Fix MEGASAS_IOC_FIRMWARE regression
    da3324ec5497 pinctrl: aspeed: g6: Fix PWMG0 pinctrl setting
    5625c3da7167 powerpc: Use the common INIT_DATA_SECTION macro in vmlinux.lds.S
    73a229119983 drm/nouveau/kms/nv50-: fix case where notifier buffer is at offset 0
    af91a2e7fb5e drm/nouveau/mmu: fix vram heap sizing
    ee2c9e58f430 drm/nouveau/i2c/gm200: increase width of aux semaphore owner fields
    38f35023fd30 drm/nouveau/privring: ack interrupts the same way as RM
    8c3d3b385ed8 drm/nouveau/bios: fix issue shadowing expansion ROMs
    f5dc9627ac04 drm/amd/display: Fix to be able to stop crc calculation
    9f6d85e20125 drm/amdgpu/psp: fix psp gfx ctrl cmds
    5b2266d62b54 riscv: defconfig: enable gpio support for HiFive Unleashed
    7eef73685871 dts: phy: fix missing mdio device and probe failure of vsc8541-01 device
    5fa6987258a7 x86/xen: Add xen_no_vector_callback option to test PCI INTX delivery
    a09d4e7acdbf xen: Fix event channel callback via INTX/GSI
    acc402fa5bf5 arm64: make atomic helpers __always_inline
    8ab3478335ad clk: tegra30: Add hda clock default rates to clock driver
    c074680653e2 HID: Ignore battery for Elan touchscreen on ASUS UX550
    9cec63a3aacb HID: logitech-dj: add the G602 receiver
    b1b943f5b65e riscv: Fix sifive serial driver
    cd0c46821aa5 riscv: Fix kernel time_init()
    5a1d7bb7d333 scsi: sd: Suppress spurious errors when WRITE SAME is being disabled
    68f99105752d scsi: qedi: Correct max length of CHAP secret
    97853a7eae80 scsi: ufs: Correct the LUN used in eh_device_reset_handler() callback
    b477f4371045 dm integrity: select CRYPTO_SKCIPHER
    8ebe26a1e236 HID: multitouch: Enable multi-input for Synaptics pointstick/touchpad device
    6af49167440a ASoC: Intel: haswell: Add missing pm_ops
    ad1df24b37d9 drm/i915/gt: Prevent use of engine->wa_ctx after error
    6b59bd9eea08 drm/syncobj: Fix use-after-free
    559c0ffedbe0 drm/atomic: put state on error path
    42d855f06d12 dm integrity: fix a crash if "recalculate" used without "internal_hash"
    a03ce9cc4bb8 dm: avoid filesystem lookup in dm_get_dev_t()
    cd3aa1495d8a mmc: sdhci-xenon: fix 1.8v regulator stabilization
    6acdefd0bd34 mmc: core: don't initialize block size from ext_csd if not present
    d8a487e673ab btrfs: send: fix invalid clone operations when cloning from the same file and root
    4d1cf8eeda5b btrfs: don't clear ret in btrfs_start_dirty_block_groups
    e1065331b730 btrfs: fix lockdep splat in btrfs_recover_relocation
    68718453159e btrfs: don't get an EINTR during drop_snapshot for reloc
    a826af1dea4a ACPI: scan: Make acpi_bus_get_device() clear return pointer on error
    08fa4ae93e95 ALSA: hda/via: Add minimum mute flag
    1607adf1ac41 ALSA: seq: oss: Fix missing error check in snd_seq_oss_synth_make_info()
    9c301133beda platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634
    ea8d3c71313f platform/x86: i2c-multi-instantiate: Don't create platform device for INT3515 ACPI nodes
    60066d5181be i2c: bpmp-tegra: Ignore unknown I2C_M flags
    09f983f0c7fc Linux 5.4.92
    e2d69319b713 spi: cadence: cache reference clock rate during probe
    d04c7938d0f8 mac80211: check if atf has been disabled in __ieee80211_schedule_txq
    d46996cb4b16 mac80211: do not drop tx nulldata packets on encrypted links
    56e8947bcf81 tipc: fix NULL deref in tipc_link_xmit()
    55bac51762c3 net, sctp, filter: remap copy_from_user failure error
    52e0b20c8c57 rxrpc: Fix handling of an unsupported token type in rxrpc_read()
    5c466480d7d4 net: avoid 32 x truesize under-estimation for tiny skbs
    f6499a78e581 net: sit: unregister_netdevice on newlink's error path
    a3870cf8a7a2 net: stmmac: Fixed mtu channged by cache aligned
    c213d85cae39 rxrpc: Call state should be read with READ_ONCE() under some circumstances
    6d57b582fb35 net: dcb: Accept RTM_GETDCB messages carrying set-like DCB commands
    d52f5929d997 net: dcb: Validate netlink message in DCB handler
    814e04776211 esp: avoid unneeded kmap_atomic call
    0ff06dd1b949 rndis_host: set proper input size for OID_GEN_PHYSICAL_MEDIUM request
    c897c10e4334 net: mvpp2: Remove Pause and Asym_Pause support
    18c29e175e30 mlxsw: core: Increase critical threshold for ASIC thermal zone
    7680783452ce mlxsw: core: Add validation of transceiver temperature thresholds
    ff6d4e8da7c6 net: ipv6: Validate GSO SKB before finish IPv6 processing
    b41352a93c16 net: skbuff: disambiguate argument and member for skb_list_walk_safe helper
    aa350dbe3a1e net: introduce skb_list_walk_safe for skb segment walking
    760e9fd4f7ab netxen_nic: fix MSI/MSI-x interrupts
    982e763ea3c3 udp: Prevent reuseport_select_sock from reading uninitialized socks
    bd4793843c85 bpf: Fix helper bpf_map_peek_elem_proto pointing to wrong callback
    79ce12cfa56a bpf: Don't leak memory in bpf getsockopt when optlen == 0
    4aef760c28e8 nfsd4: readdirplus shouldn't return parent of export
    9b72d5ba50f1 spi: npcm-fiu: Disable clock in probe error path
    6ef67f59263e spi: npcm-fiu: simplify the return expression of npcm_fiu_probe()
    fa6de8d82d9c scsi: lpfc: Make lpfc_defer_acc_rsp static
    e82b58aa6471 scsi: lpfc: Make function lpfc_defer_pt2pt_acc static
    5e6b88828526 elfcore: fix building with clang
    ac29c052654f xen/privcmd: allow fetching resource sizes
    dd113b79ee7e compiler.h: Raise minimum version of GCC to 5.1 for arm64
    24cea7d70516 usb: ohci: Make distrust_firmware param default to false
    d26b3110041a Linux 5.4.91
    516bd00e5ac1 netfilter: nft_compat: remove flush counter optimization
    935114863364 netfilter: nf_nat: Fix memleak in nf_nat_init
    49fc6d92b484 netfilter: conntrack: fix reading nf_conntrack_buckets
    548e4168e68d ALSA: firewire-tascam: Fix integer overflow in midi_port_work()
    68e67535e26b ALSA: fireface: Fix integer overflow in transmit_midi_msg()
    2c3d03cdbd39 dm: eliminate potential source of excessive kernel log noise
    a34294774a32 net: sunrpc: interpret the return value of kstrtou32 correctly
    8b5107a74db3 iommu/vt-d: Fix unaligned addresses for intel_flush_svm_range_dev()
    c2226680343d mm, slub: consider rest of partial list if acquire_slab() fails
    cd9e901fe2fc drm/i915/dsi: Use unconditional msleep for the panel_on_delay when there is no reset-deassert MIPI-sequence
    9269296721b5 IB/mlx5: Fix error unwinding when set_has_smi_cap fails
    40a782293545 RDMA/mlx5: Fix wrong free of blue flame register on error
    e8c8d2319bd7 bnxt_en: Improve stats context resource accounting with RDMA driver loaded.
    3bcf35a7c05f RDMA/usnic: Fix memleak in find_free_vf_and_create_qp_grp
    da834a9bdc23 RDMA/restrack: Don't treat as an error allocation ID wrapping
    986fdc7685fa ext4: fix superblock checksum failure when setting password salt
    38992092b54e NFS: nfs_igrab_and_active must first reference the superblock
    6b3ae2030db9 NFS/pNFS: Fix a leak of the layout 'plh_outstanding' counter
    aa2399f55eff pNFS: Stricter ordering of layoutget and layoutreturn
    78c2ab7f5265 pNFS: Mark layout for return if return-on-close was not sent
    7d1241ae1dce pNFS: We want return-on-close to complete when evicting the inode
    69d121ca892c NFS4: Fix use-after-free in trace_event_raw_event_nfs4_set_lock
    c70f6e0ac9f9 nvme-tcp: fix possible data corruption with bio merges
    55a102004376 ASoC: Intel: fix error code cnl_set_dsp_D0()
    2392a54de8ba ASoC: meson: axg-tdmin: fix axg skew offset
    973900cd4614 ASoC: meson: axg-tdm-interface: fix loopback
    08eb8a735c11 dump_common_audit_data(): fix racy accesses to ->d_name
    d443cefd9f73 perf intel-pt: Fix 'CPU too large' error
    221dee1d0d4e ARM: picoxcell: fix missing interrupt-parent properties
    ba74e0f222c7 drm/msm: Call msm_init_vram before binding the gpu
    0251d3eb4480 ACPI: scan: add stub acpi_create_platform_device() for !CONFIG_ACPI
    bfdd0a3b86c3 usb: typec: Fix copy paste error for NVIDIA alt-mode description
    644baa95db2b drm/amdgpu: fix a GPU hang issue when remove device
    596b3423fddc nvmet-rdma: Fix list_del corruption on queue establishment failure
    4cb77b877fcc nvme-pci: mark Samsung PM1725a as IGNORE_DEV_SUBNQN
    242793c7ef2f selftests: fix the return value for UDP GRO test
    5fc06b706432 net: ethernet: fs_enet: Add missing MODULE_LICENSE
    15a8491cdcd4 misdn: dsp: select CONFIG_BITREVERSE
    635a658de303 arch/arc: add copy_user_page() to <asm/page.h> to fix build error on ARC
    bc68af1fdcac bfq: Fix computation of shallow depth
    2abc54579d1b lib/raid6: Let $(UNROLL) rules work with macOS userland
    1d05b91ab72e hwmon: (pwm-fan) Ensure that calculation doesn't discard big period values
    1229d433960c habanalabs: Fix memleak in hl_device_reset
    93aef8e6cc08 habanalabs: register to pci shutdown callback
    79df21218d63 ethernet: ucc_geth: fix definition and size of ucc_geth_tx_global_pram
    331a6438ebfd regulator: bd718x7: Add enable times
    d5f996bea464 btrfs: fix transaction leak and crash after RO remount caused by qgroup rescan
    c8dd8af4b35f netfilter: ipset: fixes possible oops in mtype_resize
    ca2fc0dc1cec ARC: build: move symlink creation to arch/arc/Makefile to avoid race
    6265a0f2410f ARC: build: add boot_targets to PHONY
    217d8ba22bce ARC: build: add uImage.lzma to the top-level target
    b9128252b9ee ARC: build: remove non-existing bootpImage from KBUILD_IMAGE
    5349b17c3df5 dm integrity: fix flush with external metadata device
    c553300f1453 cifs: fix interrupted close commands
    d17a9571e392 smb3: remove unused flag passed into close functions
    55a4dff288af ext4: don't leak old mountpoint samples
    2003c669df4c ext4: fix bug for rename with RENAME_WHITEOUT
    425faacff213 drm/i915/backlight: fix CPU mode backlight takeover on LPT
    72eb9fc82aea btrfs: tree-checker: check if chunk item end overflows
    82a948fc67ea r8152: Add Lenovo Powered USB-C Travel Hub
    ad5f19c7e9ce dm integrity: fix the maximum number of arguments
    5caac6317daf dm snapshot: flush merged data before committing metadata
    2017b99ec205 dm raid: fix discard limits for raid1
    4335af6c62fc mm/hugetlb: fix potential missing huge page size info
    c64366620d91 ACPI: scan: Harden acpi_device_add() against device ID overflows
    bc0b70f1d28c RDMA/ocrdma: Fix use after free in ocrdma_dealloc_ucontext_pd()
    f7a97dc302be MIPS: relocatable: fix possible boot hangup with KASLR enabled
    f5c2f7970683 MIPS: boot: Fix unaligned access with CONFIG_MIPS_RAW_APPENDED_DTB
    a650107de374 mips: lib: uncached: fix non-standard usage of variable 'sp'
    bda45bbc8e03 mips: fix Section mismatch in reference
    aeb64ef1f429 tracing/kprobes: Do the notrace functions check without kprobes on ftrace
    984f57e4258c x86/hyperv: check cpu mask after interrupt has been disabled
    1a202b9b9d23 ASoC: dapm: remove widget from dirty list on free
    82d1a5f6f2e5 btrfs: prevent NULL pointer dereference in extent_io_tree_panic
    bb562e6e0358 kbuild: enforce -Werror=return-type

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index c23fb328d4..b7b986acdb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6b0893e9fddb5473b181b29059fe64980f353c83"
-SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
+SRCREV_machine ?= "84a6ec1f97d6b6afebe3514e772536342a4189fc"
+SRCREV_meta ?= "e120076c07e69166ebeac0eee011c085bbde2139"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.90"
+LINUX_VERSION ?= "5.4.94"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 32fbf9dc55..bd21c619c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.90"
+LINUX_VERSION ?= "5.4.94"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c65142e64f3d705d0b978b44394d274165d872b2"
-SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
+SRCREV_machine_qemuarm ?= "768311f24c5d817e7cb9ee0803790ee284e9ff30"
+SRCREV_machine ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_meta ?= "e120076c07e69166ebeac0eee011c085bbde2139"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3a36694f9c..656f97c035 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "17c98abae21d7d1bf43b58edc3d4aa2992436385"
-SRCREV_machine_qemuarm64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_machine_qemumips ?= "47a679ac3ca38116beaeb071888c01ef050f1424"
-SRCREV_machine_qemuppc ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_machine_qemuriscv64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_machine_qemux86 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_machine_qemux86-64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_machine_qemumips64 ?= "e4714b9bb683cf08909e6dc2e91fd508e56bfbc2"
-SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
+SRCREV_machine_qemuarm ?= "17b04c3b496d6a89d5de8ef97ce8c2675ac19814"
+SRCREV_machine_qemuarm64 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_machine_qemumips ?= "4b4534a5bb1e765574349baf31dddceb521e6bec"
+SRCREV_machine_qemuppc ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_machine_qemuriscv64 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_machine_qemux86 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_machine_qemux86-64 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_machine_qemumips64 ?= "a3b16f0dc7b90e68e5a7d38e0ab70cbe290ec9a6"
+SRCREV_machine ?= "31db2b47ac7d8508080fbb7344399b501216de66"
+SRCREV_meta ?= "e120076c07e69166ebeac0eee011c085bbde2139"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.90"
+LINUX_VERSION ?= "5.4.94"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

