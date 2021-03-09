Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.14618.1615317828213850858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=emSTbyrR;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id t4so14310385qkp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bNS+b/duhDEF1rYGq8znktipW/JrWYtfuJ3YnCWS/T8=;
        b=emSTbyrR/0/ahL9mbCQjqF/AvO6ZAeU8MBhdllzBIXAzyvZBhTjcMych97hSYBj9vM
         Or4H7uv/B+UH9w6/0dt8+xeI0ovudw6B3v5En2rKPP7Xd4FCz0SbecI9ZCvGl5ctZD6p
         01OxIDMCPJXy9pzNLw6hxUfTzQB93UhkqA3Q4Ej7E/LBBOsiYdvegQfrctApBw9UkRcD
         8WxFzz+PW5su0gdLSGH9CNviMTtFVbmacpOgp8YFsR/KU4q0A48n6BEaEjxfKIm+0/R0
         2hPQWae1mrnl8UZMIvP1ChMMXGc9WB6NUCm/ucxROmGcDTnigvmpLmtc85WP1rPpNH4s
         4u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bNS+b/duhDEF1rYGq8znktipW/JrWYtfuJ3YnCWS/T8=;
        b=tDGMSzxpjTqzdGYrA9ntuk1mEnkN1ROYn78fMNQsJ+dEWA8EfXIBOLEP2WXaA6aqb+
         /RRbEqvKiFELK+wCGr9KPepT0k/bdPm72Icc7twIUjpbXErF/9i3n4c/QslJ+3c7dLbz
         v/fYWHl3jHbqfmp3+PmzLZphvMcHlASKdGFHWLDbvuDzR+DjbvHeWzboiXp8ckugNu/A
         mI3JAuPzTj7RTvmPILeJ2+4ewJfddOgxrR8XLfD2jDqZAsbVPDqIo+LHV6HqPYowC3xw
         25ItxFfLQgtSdrJAtD9u3TCleHWeZ39s3vD2UAKEzlAvOGOWOvhzyVxCIg1kjES+7Zy2
         76LQ==
X-Gm-Message-State: AOAM532YdesmeT1r5qXaLyft79bxYk2UJoXieKVUwt2jKFWJNHGGTZAz
	Pzekyo/wugRxlfWjsVSFYL0zhQzpUfB9zXvf
X-Google-Smtp-Source: ABdhPJxkt9NnljnBpx/k/Fmmg3HaOhJAbS1Pc90tJFE2fOsOVHqc9PI/qQo/WbO+OOS+8VgzkoMgyw==
X-Received: by 2002:a37:a085:: with SMTP id j127mr25932636qke.206.1615317826708;
        Tue, 09 Mar 2021 11:23:46 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f13sm5713377qtf.57.2021.03.09.11.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:23:46 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/5.10: update to v5.10.21
Date: Tue,  9 Mar 2021 14:23:38 -0500
Message-Id: <c15444b65a82b76332dc30a1120888e5828b91a8.1615317549.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    012f78dadb71 Linux 5.10.21
    2064bba25ac5 net: sfp: add workaround for Realtek RTL8672 and RTL9601C chips
    113bcb8f65d4 net: sfp: VSOL V2801F / CarlitoxxPro CPGOS03-0490 v2.0 workaround
    d0fcadd6b9a3 ALSA: hda/realtek: Apply dual codec quirks for MSI Godlike X570 board
    6bba54d9baca ALSA: hda/realtek: Add quirk for Intel NUC 10
    cfb468241658 ALSA: hda/realtek: Add quirk for Clevo NH55RZQ
    5400770e31e8 media: v4l: ioctl: Fix memory leak in video_usercopy
    c7ff2d25bce3 tty: teach the n_tty ICANON case about the new "cookie continuations" too
    0c78bf9c55f1 tty: teach n_tty line discipline about the new "cookie continuations"
    e761cd8a7853 tty: clean up legacy leftovers from n_tty line discipline
    98480f5c7981 tty: fix up hung_up_tty_read() conversion
    ef67e445e962 tty: fix up iterate_tty_read() EOVERFLOW handling
    686fa5a0c647 powerpc/sstep: Fix incorrect return from analyze_instr()
    20d323c8cf57 powerpc/sstep: Check instruction validity against ISA version before emulation
    04b049ac9cb4 swap: fix swapfile read/write offset
    ba1230b49acb remoteproc/mediatek: Fix kernel test robot warning
    02f768edb9d3 zsmalloc: account the number of compacted pages correctly
    9c62adb6e2fd xen: fix p2m size in dom0 for disabled memory hotplug case
    fa00c0c826dd xen-netback: respect gnttab_map_refs()'s return value
    545c837d6789 Xen/gnttab: handle p2m update errors on a per-slot basis
    f40bbcb68131 scsi: iscsi: Verify lengths on passthrough PDUs
    76d92bf293c3 scsi: iscsi: Ensure sysfs attributes are limited to PAGE_SIZE
    c71edc5d2480 scsi: iscsi: Restrict sessions and handles to admin capabilities
    d8a380105699 ASoC: Intel: bytcr_rt5640: Add quirk for the Acer One S1002 tablet
    15c84277be64 ASoC: Intel: bytcr_rt5651: Add quirk for the Jumper EZpad 7 tablet
    078526cbf027 ASoC: Intel: bytcr_rt5640: Add quirk for the Voyo Winpad A15 tablet
    530d0426a9bc ASoC: Intel: bytcr_rt5640: Add quirk for the Estar Beauty HD MID 7316R tablet
    9a68fa0ebb28 sched/features: Fix hrtick reprogramming
    25ceaadccbce parisc: Bump 64-bit IRQ stack size to 64 KB
    5883a3bb309c ASoC: Intel: sof_sdw: detect DMIC number based on mach params
    18de10ef4805 ASoC: Intel: sof-sdw: indent and add quirks consistently
    7e7596ea1a46 perf/x86/kvm: Add Cascade Lake Xeon steppings to isolation_ucodes[]
    5aa2717b6b8d btrfs: fix error handling in commit_fs_roots
    e8ad7fac6938 ASoC: Intel: Add DMI quirk table to soc_intel_is_byt_cr()
    1fdde02e5f34 nvme-tcp: add clean action for failed reconnection
    7da81eaf8710 nvme-rdma: add clean action for failed reconnection
    74c4f7aed603 nvme-core: add cancel tagset helpers
    0d2d6857dbb9 f2fs: fix to set/clear I_LINKABLE under i_lock
    c86df2b84bea f2fs: handle unallocated section and zone on pinned/atgc
    cc52ed14f5ca media: uvcvideo: Allow entities with no pads
    4b73f01d5ebd drm/amd/amdgpu: add error handling to amdgpu_virt_read_pf2vf_data
    a986f9345467 drm/amd/display: Guard against NULL pointer deref when get_i2c_info fails
    3418abd7c66f ASoC: Intel: bytcr_rt5640: Add new BYT_RT5640_NO_SPEAKERS quirk-flag
    0b6383a9a80a PCI: Add a REBAR size quirk for Sapphire RX 5600 XT Pulse
    b9b1648ac947 drm/amdgpu: Add check to prevent IH overflow
    01fd84a436b5 fs: make unlazy_walk() error handling consistent
    ed51ffe96abc crypto: tcrypt - avoid signed overflow in byte count
    bb5e204b6b98 drm/hisilicon: Fix use-after-free
    2eb7eacf4e00 brcmfmac: Add DMI nvram filename quirk for Voyo winpad A15 tablet
    4649950f32e8 brcmfmac: Add DMI nvram filename quirk for Predia Basic tablet
    a1eda21a2cb1 staging: bcm2835-audio: Replace unsafe strcpy() with strscpy()
    0cac694c2c05 staging: most: sound: add sanity check for function argument
    15c56b8f2ce1 Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data
    05a524b97dd1 Bluetooth: Add new HCI_QUIRK_NO_SUSPEND_NOTIFIER quirk
    6c15e41dc4ac net: sfp: add mode quirk for GPON module Ubiquiti U-Fiber Instant
    0b5d22c770bf ath10k: fix wmi mgmt tx queue full due to race condition
    aee0cc0d7a34 pktgen: fix misuse of BUG_ON() in pktgen_thread_worker()
    aec571968140 mt76: mt7615: reset token when mac_reset happens
    b9afcdcddff6 Bluetooth: btusb: fix memory leak on suspend and resume
    baae70ce0bb7 Bluetooth: hci_h5: Set HCI_QUIRK_SIMULTANEOUS_DISCOVERY for btrtl
    2ce5e0a5480c wlcore: Fix command execute failure 19 for wl12xx
    136f009b2a1b vt/consolemap: do font sum unsigned
    e0c29b368ded x86/reboot: Add Zotac ZBOX CI327 nano PCI reboot quirk
    b3854d1550f0 staging: fwserial: Fix error handling in fwserial_create
    a03583775a5f EDAC/amd64: Do not load on family 0x15, model 0x13
    ef690e3f622b rsi: Move card interrupt handling to RX thread
    ec52458902b8 rsi: Fix TX EAPOL packet handling against iwlwifi AP
    b3186a3a0d89 ASoC: qcom: Remove useless debug print
    5c671e4a4c39 dt-bindings: net: btusb: DT fix s/interrupt-name/interrupt-names/
    33dbc6759de3 dt-bindings: ethernet-controller: fix fixed-link specification
    1fc205d9e400 net: fix dev_ifsioc_locked() race condition
    57b8c5bf2dd0 net: psample: Fix netlink skb length with tunnel info
    daea77234623 net: hsr: add support for EntryForgetTime
    a31cb3072d11 net: ag71xx: remove unnecessary MTU reservation
    10b55a0a7f4b net: dsa: tag_rtl4_a: Support also egress tags
    7b23cad0308a net/sched: cls_flower: Reject invalid ct_state flags rules
    b74206091e29 net: bridge: use switchdev for port flags set through sysfs too
    5ab779a68e37 mptcp: do not wakeup listener for MPJ subflows
    9adbc25b0e30 tcp: fix tcp_rmem documentation
    73a4bde5e580 RDMA/rtrs-srv: Do not signal REG_MR
    70123d9989df RDMA/rtrs-clt: Use bitmask to check sess->flags
    482157ed2060 RDMA/rtrs: Do not signal for heatbeat
    e335952d8645 mm/hugetlb.c: fix unnecessary address expansion of pmd sharing
    dc2b77642e5d nbd: handle device refs for DESTROY_ON_DISCONNECT properly
    bd9f7dc079f1 riscv: Get rid of MAX_EARLY_MAPPING_SIZE
    97ff09a7ed48 net: fix up truesize of cloned skb in skb_prepare_for_shift()
    e00420943aef tomoyo: ignore data race while checking quota
    fa5b65609256 smackfs: restrict bytes count in smackfs write functions
    23a523ef400d net/af_iucv: remove WARN_ONCE on malformed RX packets
    c57ba68e730c xfs: Fix assert failure in xfs_setattr_size()
    c55db99fd8c0 media: v4l2-ctrls.c: fix shift-out-of-bounds in std_validate
    5e0068a4fb10 erofs: fix shift-out-of-bounds of blkszbits
    1aeaa0ea7df5 media: mceusb: sanity check for prescaler value
    17a6e850e5fa udlfb: Fix memory leak in dlfb_usb_probe
    6816509065b9 sched/core: Allow try_invoke_on_locked_down_task() with irqs disabled
    40f6090d6ea0 JFS: more checks for invalid superblock
    b3d0f1c3a671 x86/build: Treat R_386_PLT32 relocation as R_386_PC32
    63d0afae74c4 drm/virtio: use kvmalloc for large allocations
    a4b0bfbe4b99 Input: elan_i2c - add new trackpoint report type 0x5F
    dde807b4a442 Input: elantech - fix protocol errors for some trackpoints in SMBus mode
    d00a97dddce6 net: usb: qmi_wwan: support ZTE P685M modem
    83be32b6c9e5 Linux 5.10.20
    b4f255432d0d ARM: dts: aspeed: Add LCLK to lpc-snoop
    a3b6f3a3758e net_sched: fix RTNL deadlock again caused by request_module()
    ea625e3415af net: qrtr: Fix memory leak in qrtr_tun_open
    bba8ef2e97b7 net: sched: fix police ext initialization
    2a3b38992f40 wireguard: queueing: get rid of per-peer ring buffers
    c7b1307fee19 wireguard: selftests: test multiple parallel streams
    ce4feb0111ac net: icmp: pass zeroed opts from icmp{,v6}_ndo_send before sending
    b60108e72f00 ipv6: silence compilation warning for non-IPV6 builds
    13e83186c91a kgdb: fix to kill breakpoints on initmem after boot
    c51f98210ac6 drm/i915: Reject 446-480MHz HDMI clock on GLK
    9bfb6d528467 dm era: only resize metadata in preresume
    a46ab7c3a411 dm era: Reinitialize bitset cache before digesting a new writeset
    f6dbf022f4fc dm era: Use correct value size in equality function of writeset tree
    fbb85ef8cd0c dm era: Fix bitset memory leaks
    ede89488369d dm era: Verify the data block size hasn't changed
    e6039db4f1f1 dm era: Update in-core bitset after committing the metadata
    d7131cc3f800 dm era: Recover committed writeset after crash
    0b2dbaa5db0a dm writecache: fix writing beyond end of underlying device when shrinking
    f88a70bfd5d0 dm writecache: return the exact table values that were set
    70faef983ab2 dm writecache: fix performance degradation in ssd mode
    72d17fa4ed11 dm table: fix zoned iterate_devices based device capability checks
    bc3f609db369 dm table: fix DAX iterate_devices based device capability checks
    bf95976f66db dm table: fix iterate_devices based device capability checks
    1f145073b196 dm: fix deadlock when swapping to encrypted device
    eb8128c5bb7f gfs2: Recursive gfs2_quota_hold in gfs2_iomap_end
    a646a3164b42 gfs2: Lock imbalance on error path in gfs2_recover_one
    42fd50035351 gfs2: Don't skip dlm unlock if glock has an lvb
    fc82ab4bb5d7 gfs2: fix glock confusion in function signal_our_withdraw
    2e3fb5234230 spi: spi-synquacer: fix set_cs handling
    1f8a8875936c spi: fsl: invert spisel_boot signal on MPC8309
    fdd97c456873 sparc32: fix a user-triggerable oops in clear_user()
    f98be1689889 f2fs: flush data when enabling checkpoint back
    04a495780f85 f2fs: enforce the immutable flag on open files
    e391239dcd17 f2fs: fix out-of-repair __setattr_copy()
    c41de6eae248 irqchip/loongson-pch-msi: Use bitmap_zalloc() to allocate bitmap
    833f5208b142 um: defer killing userspace on page table update failures
    63a069b81d40 um: mm: check more comprehensively for stub changes
    68a6199cf334 virtio/s390: implement virtio-ccw revision 2 correctly
    93c5029fb87b s390/vtime: fix inline assembly clobber list
    13fb0e1ecf7b proc: don't allow async path resolution of /proc/thread-self components
    b7cd9711a1e8 cpufreq: intel_pstate: Get per-CPU max freq via MSR_HWP_CAPABILITIES if available
    ace950888233 cpufreq: intel_pstate: Change intel_pstate_get_hwp_max() argument
    b49bee3fb5dc cpufreq: qcom-hw: drop devm_xxx() calls from init/exit hooks
    b3df1eac5a7a thermal: cpufreq_cooling: freq_qos_update_request() returns < 0 on error
    1ea36020950d kcmp: Support selection of SYS_kcmp without CHECKPOINT_RESTORE
    834c7ec6af44 zonefs: Fix file size of zones in full condition
    4e6e00704f9d exfat: fix shift-out-of-bounds in exfat_fill_super()
    eb9036b4cf4c printk: fix deadlock when kernel panic
    09cf8b46b58d mfd: gateworks-gsc: Fix interrupt type
    67e7c64b47c0 gpio: pcf857x: Fix missing first interrupt
    548d83e8b6dd mei: me: add adler lake point LP DID
    fd7fafa048a7 mei: me: add adler lake point S DID
    df000e9dc62a mei: me: emmitsburg workstation DID
    30e24dcab1a7 mei: fix transfer over dma with extended header
    4fb3523ba3e4 spmi: spmi-pmic-arb: Fix hw_irq overflow
    01b487b67c1c powerpc/32s: Add missing call to kuep_lock on syscall entry
    402d31bdcd56 powerpc/kexec_file: fix FDT size estimation for kdump kernel
    c0ec2029518d powerpc/32: Preserve cr1 in exception prolog stack check to fix build error
    e793c06f0c0d mmc: sdhci-pci-o2micro: Bug fix for SDR104 HW tuning failure
    a8997b99e8bc mmc: sdhci-esdhc-imx: fix kernel panic when remove module
    a51c34f2a5d8 module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for undefined symbols
    11d14267de25 nvmem: qcom-spmi-sdam: Fix uninitialized pdev pointer
    da5b48ac720d KVM: nSVM: fix running nested guests when npt=0
    25b0eb2e33c9 mm, compaction: make fast_isolate_freepages() stay within zone
    54683f81c8b3 mm/vmscan: restore zone_reclaim_mode ABI
    32e970488f49 hugetlb: fix copy_huge_page_from_user contig page struct assumption
    65f6dc3616d6 hugetlb: fix update_and_free_page contig page struct assumption
    1b1a949b40dd mm: memcontrol: fix get_active_memcg return value
    90de36e7b109 mm: memcontrol: fix swap undercounting in cgroup2
    d2ac7ec47ffd x86: fix seq_file iteration for pat/memtype.c
    cf20d349ae8d seq_file: document how per-entry resources are managed.
    885a2d24c219 fs/affs: release old buffer head on error path
    df2d431a1ef3 mtd: spi-nor: hisi-sfc: Put child node np on error path
    68ef24e86cf7 mtd: spi-nor: core: Add erase size check for erase command initialization
    6d6c7e7e9258 mtd: spi-nor: core: Fix erase type discovery for overlaid region
    c27cf85cd931 mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
    c123b069bbb2 mtd: spi-nor: sfdp: Fix last erase region marking
    19009472156e coresight: etm4x: Handle accesses to TRCSTALLCTLR
    306b9513d3fd watchdog: mei_wdt: request stop on unregister
    053c4f838757 watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ
    b74bf690dcf4 riscv: Disable KSAN_SANITIZE for vDSO
    0ead6914dce2 arm64: spectre: Prevent lockdep splat on v4 mitigation enable path
    18b9041e434f arm64 module: set plt* section addresses to 0x0
    d623d5cb3831 arm64: uprobe: Return EOPNOTSUPP for AARCH32 instruction probing
    fa1fbfb64458 arm64: kexec_file: fix memory leakage in create_dtb() when fdt_open_into() fails
    e9e98723c5e3 iommu/arm-smmu-qcom: Fix mask extraction for bootloader programmed SMRs
    32009c5d178e arm64: Extend workaround for erratum 1024718 to all versions of Cortex-A55
    c9b33f7cbe45 kprobes: Fix to delay the kprobes jump optimization
    e713bdd791ba rcu/nocb: Perform deferred wake up before last idle's need_resched() check
    20b7669fa3f0 rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers
    6f7e5b49f6c9 powerpc/prom: Fix "ibm,arch-vec-5-platform-support" scan
    be896eef0e32 x86/entry: Fix instrumentation annotation
    9488984c7d13 x86/fault: Fix AMD erratum #91 errata fixup for user code
    db44025963d9 x86/reboot: Force all cpus to exit VMX root if VMX is supported
    df52c4f4b40a x86/virt: Eat faults on VMXOFF in reboot flows
    2184f87e4944 media: smipcie: fix interrupt handling and IR timeout
    d5b1a7ef9c6e media: marvell-ccic: power up the device on mclk enable
    d0f6efac3c82 media: ipu3-cio2: Fix mbus_code processing in cio2_subdev_set_fmt()
    3a4c5d7261e1 media: ir_toy: add another IR Droid device
    0ba52e99d5ee media: i2c: max9286: fix access to unallocated memory
    ce5697ef57da floppy: reintroduce O_NDELAY fix
    9c9f49c06ea1 staging: rtl8188eu: Add Edimax EW-7811UN V2 to device table
    4934db348d5a staging: gdm724x: Fix DMA from stack
    848c87e8d826 staging/mt7621-dma: mtk-hsdma.c->hsdma-mt7621.c
    7e00b4c86a84 arm64: dts: agilex: fix phy interface bit shift for gmac1 and gmac2
    bcec1eea4121 dts64: mt7622: fix slow sd card access
    edadcf211ac0 pstore: Fix typo in compression option name
    53f6c858c496 drivers/misc/vmw_vmci: restrict too big queue size in qp_host_alloc_queue
    449488765c17 misc: rtsx: init of rts522a add OCP power off when no card is present
    428c4a4d0dc7 arm64: ptrace: Fix seccomp of traced syscall -1 (NO_SYSCALL)
    b506450ce3d9 seccomp: Add missing return in non-void function
    56a7c53c494c soc: samsung: exynos-asv: handle reading revision register error
    3a5daa8a5e9c soc: samsung: exynos-asv: don't defer early on not-supported SoCs
    70c4b76be44b crypto: sun4i-ss - initialize need_fallback
    985b609668d8 crypto: sun4i-ss - handle BigEndian for cipher
    19be286216dc crypto: sun4i-ss - IV register does not work on A10 and A13
    ca4460daf0c5 crypto: sun4i-ss - checking sg length is not sufficient
    84c93e8897bb crypto: michael_mic - fix broken misalignment handling
    6e3b6710ea2e crypto: aesni - prevent misaligned buffers on the stack
    e2c540e18140 crypto: arm64/sha - add missing module aliases
    1f8586fb4ef1 drm/i915/gt: Correct surface base address for renderclear
    6bb73b704de4 drm/i915/gt: Flush before changing register state
    de3ea5be511a btrfs: fix extent buffer leak on failure to copy root
    9a739917ef2d btrfs: account for new extents being deleted in total_bytes_pinned
    7ec1536e800b btrfs: handle space_info::total_bytes_pinned inside the delayed ref itself
    acaeedb193a5 btrfs: splice remaining dirty_bg's onto the transaction dirty bg list
    c717ca57a405 btrfs: fix reloc root leak with 0 ref reloc roots on recovery
    4d3edf72d6b5 btrfs: abort the transaction if we fail to inc ref in btrfs_copy_root
    a1a5cc25489a btrfs: add asserts for deleting backref cache nodes
    52f93e5ee700 btrfs: do not warn if we can't find the reloc root when looking up backref
    02785bae77ca btrfs: do not cleanup upper nodes in btrfs_backref_cleanup_node
    67118bb78d72 KEYS: trusted: Reserve TPM for seal and unseal operations
    54c527c18e7f KEYS: trusted: Fix migratable=1 failing
    9d83cc1a1e7f KEYS: trusted: Fix incorrect handling of tpm_get_random()
    d65aef25464f tpm_tis: Clean up locality release
    a1710b067ec9 tpm_tis: Fix check_locality for correct locality acquisition
    03c9bf033c7b erofs: initialized fields can only be observed after bit is set
    2fe92153013c selinux: fix inconsistency between inode_getxattr and inode_listsecurity
    cae75116662f ASoC: siu: Fix build error by a wrong const prefix
    dab6fbf2b30b drm/rockchip: Require the YTR modifier for AFBC
    7397365737fd drm/panel: kd35t133: allow using non-continuous dsi clock
    a7cf5e49229b drm/sched: Cancel and flush all outstanding jobs before finish.
    bdbee7d7fd95 drm/modes: Switch to 64bit maths to avoid integer overflow
    565eca5a9aa9 drm/nouveau/kms: handle mDP connectors
    926532686863 drm/amdgpu: Set reference clock to 100Mhz on Renoir (v2)
    a81bb9031a75 drm/amdkfd: Fix recursive lock warnings
    c4fe9c525ec5 drm/amd/display: Add vupdate_no_lock interrupts for DCN2.1
    22f2bf0892f7 drm/amd/display: Remove Assert from dcn10_get_dig_frontend
    9d0da9afeb28 drm/amd/display: Add FPU wrappers to dcn21_validate_bandwidth()
    49b1b5b10009 Revert "drm/amd/display: Update NV1x SR latency values"
    695185fce229 bcache: Move journal work to new flush wq
    f5ee9638a6db bcache: Give btree_io_wq correct semantics again
    25ca325743a5 Revert "bcache: Kill btree_io_wq"
    50af0b3848b7 Revert "MIPS: Octeon: Remove special handling of CONFIG_MIPS_ELF_APPENDED_DTB=y"
    3f3614b4dd27 MIPS: VDSO: Use CLANG_FLAGS instead of filtering out '--target='
    3896c324bb25 MIPS: Support binutils configured with --enable-mips-fix-loongson3-llsc=yes
    a799741acdb6 MIPS: Ingenic: Disable HPTLB for D0 XBurst CPUs too
    1365914e020f ALSA: hda/realtek: Quirk for HP Spectre x360 14 amp setup
    5c8561ae3ef3 ALSA: hda/realtek: modify EAPD in the ALC886
    0a7efa3fd7a1 ALSA: hda/hdmi: Drop bogus check at closing a stream
    a9fe4ab42cbd ALSA: hda: Add another CometLake-H PCI ID
    1312a7b68689 ALSA: fireface: fix to parse sync status register of latter protocol
    caefa1473847 phy: lantiq: rcu-usb2: wait after clock enable
    b927c4f2a1b3 USB: serial: mos7720: fix error code in mos7720_write()
    bcac85cabaf7 USB: serial: mos7840: fix error code in mos7840_write()
    11fd58946e03 USB: serial: pl2303: fix line-speed handling on newer chips
    b006da9e3efd USB: serial: ftdi_sio: fix FTX sub-integer prescaler
    5b4cd9678762 usb: dwc3: gadget: Fix dep->interval for fullspeed interrupt
    6b78b380db60 usb: dwc3: gadget: Fix setting of DEPCFG.bInterval_m1
    1cf76e4ca610 usb: musb: Fix runtime PM race in musb_queue_resume_work
    a82ba907a83d USB: serial: option: update interface mapping for ZTE P685M
    0fe6ea18f2bb media: mceusb: Fix potential out-of-bounds shift
    960652adc54a Input: i8042 - add ASUS Zenbook Flip to noselftest list
    deced3e2aea9 Input: joydev - prevent potential read overflow in ioctl
    18fca2909171 Input: xpad - add support for PowerA Enhanced Wired Controller for Xbox Series X|S
    0af89539c9e5 Input: raydium_ts_i2c - do not send zero length
    923a82a6bc93 HID: wacom: Ignore attempts to overwrite the touch_max value from HID
    eb6a537479b4 HID: logitech-dj: add support for keyboard events in eQUAD step 4 Gaming
    0a5fcc0a21fb cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known
    ff9dd5223b62 ACPI: configfs: add missing check after configfs_register_default_group()
    6470cc6519ff ACPI: property: Fix fwnode string properties matching
    d7b804b9404e soundwire: intel: fix possible crash when no device is detected
    556c513e6bac blk-settings: align max_sectors on "logical_block_size" boundary
    3c88c1b76280 scsi: sd: Fix Opal support
    a4907c75b568 ide/falconide: Fix module unload
    cc88a819a14c block: reopen the device in blkdev_reread_part
    f1cf46115afa scsi: sd: sd_zbc: Don't pass GFP_NOIO to kvcalloc
    5fa5d9e34b7f scsi: bnx2fc: Fix Kconfig warning & CNIC build errors
    02309dd33737 csky: Fix a size determination in gpr_get()
    b7925acd8292 proc: use kvzalloc for our kernel buffer
    d45f943ef84b mm/rmap: fix potential pte_unmap on an not mapped pte
    dc495b59ff4c mm: fix memory_failure() handling of dax-namespace metadata
    a7fbcb3b560a mm,thp,shmem: make khugepaged obey tmpfs mount flags
    b0501bee4b65 i2c: exynos5: Preserve high speed master code
    d49d76395903 i2c: brcmstb: Fix brcmstd_send_i2c_cmd condition
    b138d65ccec4 arm64: Add missing ISB after invalidating TLB in __primary_switch
    db08c3636d91 KVM: x86/mmu: Expand collapsible SPTE zap for TDP MMU to ZONE_DEVICE and HugeTLB pages
    f1ea1bee3573 KVM: SVM: Intercept INVPCID when it's disabled to inject #UD
    9468ab8a2718 NFSv4: Fixes for nfs4_bitmask_adjust()
    8d1d23a84726 r8169: fix jumbo packet handling on RTL8168e
    2d95ad18df6f mm/compaction: fix misbehaviors of fast_find_migrateblock()
    c9ea7719a4af mm/hugetlb: suppress wrong warning info when alloc gigantic page
    89b2dbd807b1 mm/hugetlb: fix potential double free in hugetlb_register_node() error path
    6c074ae0a482 mm/memory.c: fix potential pte_unmap_unlock pte error
    cbb86d6a5db9 mm: memcontrol: fix slub memory accounting
    026e07bc0abc mm: memcontrol: fix NR_ANON_THPS accounting in charge moving
    b761fd28218e ocfs2: fix a use after free on error
    d0b3159fca6e wireguard: kconfig: use arm chacha even with no neon
    2a33f6fb9206 wireguard: device: do not generate ICMP for non-IP packets
    3bbb8573ceb1 vxlan: move debug check after netdev unregister
    9cf2b21aa937 PCI: rockchip: Make 'ep-gpios' DT property optional
    1c0058472166 net/mlx4_core: Add missed mlx4_free_cmd_mailbox()
    ba817c176608 net: stmmac: fix CBS idleslope and sendslope calculation
    dd2d203f02ff ice: update the number of available RSS queues
    70bcfea70f12 ice: Fix state bits on LLDP mode switch
    09a2fee49546 ice: Account for port VLAN in VF max packet size calculation
    4bee367264f1 ice: report correct max number of TCs
    c2ff99488390 vfio/type1: Use follow_pte()
    e47685ec4cb8 pwm: iqs620a: Fix overflow and optimize calculations
    dae49384d0d7 octeontx2-af: Fix an off by one in rvu_dbg_qsize_write()
    a8afe8bce434 i40e: Fix add TC filter for IPv6
    1fe02a86fa92 nios2: fixed broken sys_clone syscall
    9dfb367a2382 Take mmap lock in cacheflush syscall
    5917fdcc554d i40e: Fix VFs not created
    0497d52bbfc3 i40e: Fix addition of RX filters after enabling FW LLDP agent
    0c6a8e35f47d i40e: Fix overwriting flow control settings during driver loading
    b57d0f5489f8 i40e: Add zero-initialization of AQ command structures
    42dc67dee995 i40e: Fix flow for IPv6 next header (extension header)
    1ecbf4f3e993 PCI: cadence: Fix DMA range mapping early return error
    c2f17201d0e2 PCI: pci-bridge-emul: Fix array overruns, improve safety
    fc22917f48ee device-dax: Fix default return code of range_parse()
    37aba9cfece7 mailbox: sprd: correct definition of SPRD_OUTBOX_FIFO_FULL
    d167a7367d4a ext: EXT4_KUNIT_TESTS should depend on EXT4_FS instead of selecting it
    bf672140d60b regmap: sdw: use _no_pm functions in regmap_read/write
    291803ee7319 remoteproc/mediatek: acknowledge watchdog IRQ after handled
    dc798d57ca78 misc: fastrpc: fix incorrect usage of dma_map_sgtable
    787d7067c36b soundwire: bus: fix confusion on device used by pm_runtime
    336657c98112 soundwire: export sdw_write/read_no_pm functions
    dfdec5eda330 soundwire: bus: use sdw_write_no_pm when setting the bus scale registers
    519a514807c7 soundwire: bus: use sdw_update_no_pm when initializing a device
    663a18271e53 nvmem: core: skip child nodes not matching binding
    0422b93c4bfb nvmem: core: Fix a resource leak on error in nvmem_add_cells_from_of()
    5678109857cd coresight: etm4x: Skip accessing TRCPDCR in save/restore
    3e40d7bd87c9 phy: USB_LGM_PHY should depend on X86
    858d343c7873 ext4: fix potential htree index checksum corruption
    9eb145398e6f vfio-pci/zdev: fix possible segmentation fault issue
    c0e73c1d6d91 vfio/iommu_type1: Fix some sanity checks in detach group
    a8fe0b750a94 vfio/iommu_type1: Populate full dirty when detach non-pinned group
    c1fe9383139a drm/msm/dp: trigger unplug event in msm_dp_display_disable
    2d130a893ef3 drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
    b605b8d568db drm/msm: Fix race of GPU init vs timestamp power management.
    5c49fc7b5d9b drm/msm/mdp5: Fix wait-for-commit for cmd panels
    92a1514e0a5d drm/msm/dsi: Correct io_start for MSM8994 (20nm PHY)
    b016a9f0c546 drm/msm: Fix MSM_INFO_GET_IOVA with carveout
    bede9ad9196c mei: hbm: call mei_set_devstate() on hbm stop response
    4ce87382d87c PCI: Align checking of syscall user config accessors
    6b34aa520429 VMCI: Use set_page_dirty_lock() when unregistering guest memory
    6a96a4413dcc PCI: xilinx-cpm: Fix reference count leak on error path
    58516ac4aac8 pwm: rockchip: Eliminate potential race condition when probing
    6f503e4e3752 pwm: rockchip: rockchip_pwm_probe(): Remove superfluous clk_unprepare()
    39ab0927e7b2 pwm: rockchip: Enable APB clock during register access while probing
    7c0c9081f816 soundwire: cadence: fix ACK/NAK handling
    9944f02f2e15 PCI: rcar: Always allocate MSI addresses in 32bit space
    d2742ed447bc misc: eeprom_93xx46: Add module alias to avoid breaking support for non device tree users
    5a602158b885 phy: cadence-torrent: Fix error code in cdns_torrent_phy_probe()
    95fdc1ea3bfc phy: rockchip-emmc: emmc_phy_init() always return 0
    03112ff9eabf misc: eeprom_93xx46: Fix module alias to enable module autoprobe
    6ac46ecd98c9 ARM: 9065/1: OABI compat: fix build when EPOLL is not enabled
    6fb1564f74fb Input: zinitix - fix return type of zinitix_init_touch()
    0fda33ea8947 sparc: fix led.c driver when PROC_FS is not enabled
    103ca2da81c2 sparc64: only select COMPAT_BINFMT_ELF if BINFMT_ELF is set
    79796706ac4a Input: elo - fix an error code in elo_connect()
    538b990451fe perf test: Fix unaligned access in sample parsing test
    2f7d4603a00c perf intel-pt: Fix IPC with CYC threshold
    4616d95a25b5 perf intel-pt: Fix premature IPC
    9702d580daa3 perf intel-pt: Fix missing CYC processing in PSB
    47d32f8becec perf record: Fix continue profiling after draining the buffer
    47c9d32e7170 Input: sur40 - fix an error code in sur40_probe()
    248014ab2ea9 RDMA/rtrs-srv: Do not pass a valid pointer to PTR_ERR()
    d94d6498ba2d RDMA/rtrs-srv-sysfs: fix missing put_device
    fad3372fdfba RDMA/rtrs-srv: fix memory leak by missing kobject free
    c6f81f3a9c40 RDMA/rtrs: Only allow addition of path to an already established session
    51ea7da47b7c RDMA/rtrs-srv: Fix stack-out-of-bounds
    60d613b39e8d RDMA/ucma: Fix use-after-free bug in ucma_create_uevent
    55bfe125b44a RDMA/hns: Fixes missing error code of CMDQ
    95f432c0a396 ceph: fix flush_snap logic after putting caps
    426b8fb3d672 svcrdma: Hold private mutex while invoking rdma_accept()
    7c7cb07d4aff nfsd: register pernet ops last, unregister first
    b0363faf9886 perf symbols: Fix return value when loading PE DSO
    2de70d744e09 printk: avoid prb_first_valid_seq() where possible
    86f5b0936975 spi: Skip zero-length transfers in spi_transfer_one_message()
    231d8c46b16d spi: dw: Avoid stack content exposure
    3604dfd1c60a regulator: bd718x7, bd71828, Fix dvs voltage levels
    c7a1a092d364 perf symbols: Use (long) for iterator for bfd symbols
    31c2e369b533 selftests/ftrace: Update synthetic event syntax errors
    e5d5829c7ac9 clk: aspeed: Fix APLL calculate formula from ast2600-A2
    e8d491783554 regulator: qcom-rpmh: fix pm8009 ldo7
    f5f08edae12a powerpc/kuap: Restore AMR after replaying soft interrupts
    97ab82462a3a powerpc/uaccess: Avoid might_fault() when user access is enabled
    3aa4af48f4f1 spi: pxa2xx: Fix the controller numbering for Wildcat Point
    5273b9ba3e99 clk: divider: fix initialization with parent_hw
    c10782b20829 RDMA/hns: Disable RQ inline by default
    7e2cf295cee2 RDMA/hns: Fix type of sq_signal_bits
    4b31e9ffc4cd RDMA/siw: Fix calculation of tx_valid_cpus size
    f2ab2ac9c550 RDMA/hns: Fixed wrong judgments in the goto branch
    b11abc70b2d2 kselftests: dmabuf-heaps: Fix Makefile's inclusion of the kernel's usr/include dir
    ecb23b97a70b kunit: tool: fix unit test cleanup handling
    1989b09d7645 clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
    e87684f92706 powerpc/8xx: Fix software emulation interrupt
    c035dcae0bcc powerpc/pseries/dlpar: handle ibm, configure-connector delay status
    b1b904813755 mfd: wm831x-auxadc: Prevent use after free in wm831x_auxadc_read_irq()
    5d82c92db904 mfd: altera-sysmgr: Fix physical address storing more
    03a422ecf30d spi: stm32: properly handle 0 byte transfer
    a46f34ba2563 RDMA/rxe: Correct skb on loopback path
    54bdcd7b8f0a RDMA/rxe: Fix coding error in rxe_rcv_mcast_pkt
    d464194f6e47 RDMA/rxe: Fix coding error in rxe_recv.c
    5132b4f24874 perf vendor events arm64: Fix Ampere eMag event typo
    100ba402178c perf tools: Fix DSO filtering when not finding a map for a sampled address
    378f670e08fc rtc: zynqmp: depend on HAS_IOMEM
    8a40ca0c8b9f tracepoint: Do not fail unregistering a probe due to memory failure
    edcaf7a3b8bc IB/cm: Avoid a loop when device has 255 ports
    0d19c3e61668 IB/mlx5: Return appropriate error code instead of ENOMEM
    377a9c919163 iommu: Properly pass gfp_t in _iommu_map() to avoid atomic sleeping
    452fc2c9bbf2 iommu: Move iotlb_sync_map out from __iommu_map
    910990a6075a amba: Fix resource leak for drivers without .remove
    426c56022623 i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct
    e699cd138063 ARM: 9046/1: decompressor: Do not clear SCTLR.nTLSMD for ARMv7+ cores
    252425cb8755 mmc: renesas_sdhi_internal_dmac: Fix DMA buffer alignment from 8 to 128-bytes
    d892fe653ee4 mmc: usdhi6rol0: Fix a resource leak in the error handling path of the probe
    25975632869b mmc: sdhci-sprd: Fix some resource leaks in the remove function
    34251b827471 mmc: owl-mmc: Fix a resource leak in an error handling path and in the remove function
    99e7c8d15770 powerpc/time: Enable sched clock for irqtime
    f6ba4a84b9e0 powerpc/47x: Disable 256k page size
    6b83da9b1e58 KVM: PPC: Make the VMX instruction emulation routines static
    69ca7a12b77d IB/umad: Return EPOLLERR in case of when device disassociated
    1598e9e00a99 IB/umad: Return EIO in case of when device disassociated
    48e671371357 iommu: Switch gather->end to the inclusive end
    2dbc0ea1d141 scsi: lpfc: Fix ancient double free
    c41fc75addf1 objtool: Fix ".cold" section suffix check for newer versions of GCC
    7631376b2d8e objtool: Fix retpoline detection in asm code
    9e06f36658df objtool: Fix error handling for STD/CLD warnings
    994334fa2a13 auxdisplay: ht16k33: Fix refresh rate handling
    56cc83dfd35f watchdog: intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
    ffc6e686f43d isofs: release buffer head before return
    aa69ea2595ff regulator: core: Avoid debugfs: Directory ... already present! error
    87f6600119a1 power: supply: smb347-charger: Fix interrupt usage if interrupt is unavailable
    564c05da080f power: supply: axp20x_usb_power: Init work before enabling IRQs
    b1ff96e9191d regulator: s5m8767: Drop regulators OF node reference
    ac5ab9c02951 spi: atmel: Put allocated master before return
    1303992207e8 regulator: s5m8767: Fix reference count leak
    d7b0efadc3eb certs: Fix blacklist flag type confusion
    6e223a3d906a watch_queue: Drop references to /dev/watch_queue
    a6b732fb6a83 regulator: axp20x: Fix reference cout leak
    863691f865b7 platform/chrome: cros_ec_proto: Add LID and BATTERY to default mask
    65e880808202 platform/chrome: cros_ec_proto: Use EC_HOST_EVENT_MASK not BIT
    d99d58b8df08 clk: sunxi-ng: h6: Fix clock divider range on some clocks
    57ae53cc5a79 IB/mlx5: Add mutex destroy call to cap_mask_mutex mutex
    a62529e888fa RDMA/mlx5: Use the correct obj_id upon DEVX TIR creation
    3577f6920179 spi: imx: Don't print error on -EPROBEDEFER
    f8b64afe9166 clocksource/drivers/mxs_timer: Add missing semicolon when DEBUG is defined
    9f5c5595cf13 clocksource/drivers/ixp4xx: Select TIMER_OF when needed
    884d1b0d51e0 power: supply: fix sbs-charger build, needs REGMAP_I2C
    4f24543828fa dmaengine: idxd: set DMA channel to be private
    31c9ba0c38bc rtc: s5m: select REGMAP_I2C
    28c05164b72f power: reset: at91-sama5d2_shdwc: fix wkupdbc mask
    e724c819ed9f RDMA/rtrs-srv: Init wr_cnt as 1
    cb6d98b30655 RDMA/rtrs-clt: Refactor the failure cases in alloc_clt
    30b7b6b8dac0 RDMA/rtrs-srv: Fix missing wr_cqe
    e393184841ba RDMA/rtrs: Call kobject_put in the failure path
    1a8e1385b22b RDMA/rtrs-clt: Set mininum limit when create QP
    f8f1833d2a10 RDMA/rtrs-srv: Use sysfs_remove_file_self for disconnect
    e3d74840c73e RDMA/rtrs-srv: Release lock before call into close_sess
    0a131e09e4e2 RDMA/rtrs: Extend ibtrs_cq_qp_create
    54d3a5761951 of/fdt: Make sure no-map does not remove already reserved regions
    0674fa99a7d8 fdt: Properly handle "no-map" field in the memory region
    3f93f17ae946 power: supply: cpcap-charger: Fix power_supply_put on null battery pointer
    1f6133749213 power: supply: cpcap-battery: Fix missing power_supply_put()
    748f7b65d2e0 power: supply: cpcap-charger: Fix missing power_supply_put()
    57e43b696dee mfd: bd9571mwv: Use devm_mfd_add_devices()
    4ddac9d8acba dmaengine: hsu: disable spurious interrupt
    d8c7170c2097 dmaengine: owl-dma: Fix a resource leak in the remove function
    ecf1d532a055 dmaengine: fsldma: Fix a resource leak in an error handling path of the probe function
    1cc37e5a0555 dmaengine: fsldma: Fix a resource leak in the remove function
    9703b65b2dab RDMA/siw: Fix handling of zero-sized Read and Receive Queues.
    95d5e8fbc2ff HID: core: detect and skip invalid inputs to snto32()
    35c739b4d4fa clk: renesas: r8a779a0: Fix parent of CBFUSA clock
    91210528b38c clk: renesas: r8a779a0: Remove non-existent S2 clock
    6d3fca943eec clk: sunxi-ng: h6: Fix CEC clock
    d8d37cdde2a5 spi: cadence-quadspi: Abort read if dummy cycles required are too many
    a8594ec0bb37 i2c: iproc: handle master read request
    77f44e82e898 i2c: iproc: update slave isr mask (ISR_MASK_SLAVE)
    686ed8d7bf90 i2c: iproc: handle only slave interrupts which are enabled
    8584d4f31a3a quota: Fix memory leak when handling corrupted quota file
    3c5304eb1805 arm64: dts: qcom: qrb5165-rb5: fix pm8009 regulators
    b7c77df94684 regulator: qcom-rpmh-regulator: add pm8009-1 chip revision
    e00a29e24575 selftests/powerpc: Make the test check in eeh-basic.sh posix compliant
    460538d02a18 clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()
    02df54191f7f clk: meson: clk-pll: make "ret" a signed integer
    55e47652d625 clk: meson: clk-pll: fix initializing the old rate (fallback) for a PLL
    49d8c198fab5 power: supply: cpcap: Add missing IRQF_ONESHOT to fix regression
    7c650a997df3 HSI: Fix PM usage counter unbalance in ssi_hw_init
    54b4e5df958c capabilities: Don't allow writing ambiguous v3 file capabilities
    bf24c51d62d1 drm/amdgpu/display: remove hdcp_srm sysfs on device removal
    7a9b76bb9bf3 smp: Process pending softirqs in flush_smp_call_function_from_idle()
    3e7387af5a50 irqchip/imx: IMX_INTMUX should not default to y, unconditionally
    24386143cb94 ubifs: Fix error return code in alloc_wbufs()
    3818158df15e ubifs: replay: Fix high stack usage, again
    bdb176a0c876 ubifs: Fix memleak in ubifs_init_authentication
    bdf943745924 jffs2: fix use after free in jffs2_sum_write_data()
    a6b56338a910 fs/jfs: fix potential integer overflow on shift of a int
    d5f8088cfc98 ASoC: simple-card-utils: Fix device module clock
    c365d333e97a ima: Free IMA measurement buffer after kexec syscall
    1facf2415b98 ima: Free IMA measurement buffer on error
    f40d1ec3a3db ASoC: SOF: sof-pci-dev: add missing Up-Extreme quirk
    0bbbd44ba122 nvmet: set status to 0 in case for invalid nsid
    6c32db01dd41 nvmet: remove extra variable in identify ns
    48629fed4fc4 nvme-multipath: set nr_zones for zoned namespaces
    5f8ab7f8fedd nvmet-tcp: fix potential race of tcp socket closing accept_work
    91edfca6f8b3 nvmet-tcp: fix receive data digest calculation for multiple h2cdata PDUs
    81dfee4731c0 io_uring: fix possible deadlock in io_uring_poll
    ea914be6de9d crypto: ecdh_helper - Ensure 'len >= secret.len' in decode_key()
    bebfe70c4df8 hwrng: timeriomem - Fix cooldown period calculation
    ca0d82585d07 drm/dp_mst: Don't cache EDIDs for physical ports
    141c9392246c drm/lima: fix reference leak in lima_pm_busy
    c37792594393 drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
    ecd8c7420ee2 drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
    b2c22c74462e drm/vc4: hdmi: Restore cec physical address on reconnect
    5ef6d3b78abc drm/vc4: hdmi: Fix up CEC registers
    22a555e031aa drm/vc4: hdmi: Fix register offset with longer CEC messages
    e7506205db3a drm/vc4: hdmi: Move hdmi reset to bind
    f06ce8ddbdfc s390/zcrypt: return EIO when msg retry limit reached
    689ceaad9423 KVM: x86: Restore all 64 bits of DR6 and DR7 during RSM on x86-64
    6a402b937eb1 btrfs: fix double accounting of ordered extent for subpage case in btrfs_invalidapge
    006ef266c275 btrfs: clarify error returns values in __load_free_space_cache
    79717a3381dd ASoC: SOF: debug: Fix a potential issue on string buffer termination
    47d35964886f ASoC: rt5682: Fix panic in rt5682_jack_detect_handler happening during system shutdown
    67353635006a ASoC: qcom: lpass: Fix i2s ctl register bit map
    d48f03f6b25c locking/lockdep: Avoid unmatched unlock
    2e0e7c91ddb3 ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A3E
    6bbbb1dea7e8 ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A5E
    71a6979d540d Drivers: hv: vmbus: Avoid use-after-free in vmbus_onoffer_rescind()
    bed8bed04179 drm/mediatek: Check if fb is null
    d87df78aabf2 KVM: nSVM: Don't strip host's C-bit from guest's CR3 when reading PDPTRs
    9ac313799515 ASoC: qcom: Fix typo error in HDMI regmap config callbacks
    5dc2ee02fdd9 f2fs: fix a wrong condition in __submit_bio
    c1b18119d82b drm/amdgpu: Prevent shift wrapping in amdgpu_read_mask()
    a9553ae64da0 f2fs: fix to avoid inconsistent quota data
    0edd035143dd mtd: parsers: afs: Fix freeing the part name memory in failure
    e350b5bea8e8 ASoC: codecs: add missing max_register in regmap config
    79f85d7b5ce0 ASoC: cpcap: fix microphone timeslot mask
    9e61730083eb ata: ahci_brcm: Add back regulators management
    61a1f0ad45de mm: proc: Invalidate TLB after clearing soft-dirty page state
    e3fcff9f45aa drm/nouveau: bail out of nouveau_channel_new if channel init fails
    c64eb55b4ec2 crypto: talitos - Fix ctr(aes) on SEC1
    62aa24d2b7be crypto: talitos - Work around SEC6 ERRATA (AES-CTR mode data size error)
    da7a5e73cdd1 mtd: parser: imagetag: fix error codes in bcm963xx_parse_imagetag_partitions()
    86399c1911eb perf/arm-cmn: Move IRQs when migrating context
    1ea83d489102 perf/arm-cmn: Fix PMU instance naming
    cb8e225c16c8 ASoC: SOF: Intel: hda: cancel D0i3 work during runtime suspend
    2a387bbeada0 ASoC: qcom: lpass-cpu: Remove bit clock state check
    2bebc6dcd345 f2fs: compress: fix potential deadlock
    91e10f2ad150 sched/eas: Don't update misfit status if the task is pinned
    8b1c386d9266 media: uvcvideo: Accept invalid bFormatIndex and bFrameIndex values
    130722b55dde media: pxa_camera: declare variable when DEBUG is defined
    2c0a480ac595 media: mtk-vcodec: fix argument used when DEBUG is defined
    f1e2ca0c11e4 media: cx25821: Fix a bug when reallocating some dma memory
    d196f0682366 media: qm1d1c0042: fix error return code in qm1d1c0042_init()
    28fa29bd59f2 media: atomisp: Fix a buffer overflow in debug code
    abfdb63b6e5f media: vidtv: psi: fix missing crc for PMT
    32f864a4432d media: lmedm04: Fix misuse of comma
    f7765a1143c3 media: software_node: Fix refcounts in software_node_get_next_child()
    e3d5fe8fb6f3 drm/amd/display: Fix HDMI deep color output for DCE 6-11.
    3592f930f742 drm/amd/display: Fix 10/12 bpc setup in DCE output bit depth reduction.
    18f10ae0d477 macintosh/adb-iop: Use big-endian autopoll mask
    1c7b7d476e6a bsg: free the request before return error code
    a9d9fd5bd24b drm/amdgpu: toggle on DF Cstate after finishing xgmi injection
    0cdfdd1f03c2 drm/tegra: Fix reference leak when pm_runtime_get_sync() fails
    cc1c1fe79551 MIPS: Compare __SYNC_loongson3_war against 0
    f89de444df59 MIPS: properly stop .eh_frame generation
    b1f4731f33ba media: ti-vpe: cal: fix write to unallocated memory
    640da89f3eee media: imx7: csi: Fix pad link validation
    a274661d5842 media: imx7: csi: Fix regression for parallel cameras on i.MX6UL
    1c95f266a692 drm/sun4i: tcon: fix inverted DCLK polarity
    e830af503cae sched/fair: Avoid stale CPU util_est value for schedutil in task dequeue
    3b22a67c7f6b crypto: bcm - Rename struct device_private to bcm_device_private
    494e9ec12c1b evm: Fix memleak in init_desc
    f465abaef3d1 ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai
    43deab1aff79 ASoC: cs42l56: fix up error handling in probe
    967ddb4ac910 media: aspeed: fix error return code in aspeed_video_setup_video()
    9883df7c0195 media: tm6000: Fix memleak in tm6000_start_stream
    172e30ea3861 media: media/pci: Fix memleak in empress_init
    451c7cb236ef media: em28xx: Fix use-after-free in em28xx_alloc_urbs
    27dfb2c856f5 media: vsp1: Fix an error handling path in the probe function
    df6f92f1bde1 media: camss: missing error code in msm_video_register()
    27a82f52a55d media: mtk-vcodec: fix error return code in vdec_vp9_decode()
    40d53d436a59 media: imx: Fix csc/scaler unregister
    fe2e6f9342e8 media: imx: Unregister csc/scaler only if registered
    9056dd5417b1 media: i2c: ov5670: Fix PIXEL_RATE minimum value
    c271cb89897c media: ipu3-cio2: Build only for x86
    26297e1710d2 drm/fourcc: fix Amlogic format modifier masks
    dfc846691a66 drm/virtio: make sure context is created in gem open
    74cfb7883a04 MIPS: lantiq: Explicitly compare LTQ_EBU_PCC_ISTAT against 0
    8dbfa4e99c5f MIPS: c-r4k: Fix section mismatch for loongson2_sc_init
    a0e0d3d8245e drm/amdgpu: Fix macro name _AMDGPU_TRACE_H_ in preprocessor if condition
    61de9181c86c drm: rcar-du: Fix the return check of of_parse_phandle and of_find_device_by_node
    4f6cd7e77b07 drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
    cfed53d82219 drm: rcar-du: Fix PM reference leak in rcar_cmm_enable()
    7e8cad8788a9 kcsan: Rewrite kcsan_prandom_u32_max() without prandom_u32_state()
    e559765186ac media: allegro: Fix use after free on error
    5ea0601513a7 hwrng: ingenic - Fix a resource leak in an error handling path
    39e0bddeff36 crypto: arm64/aes-ce - really hide slower algos when faster ones are enabled
    2f7287fbcb9f crypto: sun4i-ss - fix kmap usage
    99e9cb7bc13b crypto: sun4i-ss - linearize buffers content must be kept
    5d93dad67df8 drm/vc4: hdmi: Take into account the clock doubling flag in atomic_check
    5eb0784f4dd0 drm/panel: mantix: Tweak init sequence
    35bf6702052c drm/fb-helper: Add missed unlocks in setcmap_legacy()
    c4c8db5eb19f gma500: clean up error handling in init
    9a83b8b33128 drm/gma500: Fix error return code in psb_driver_load()
    e9c01c8fd64a fbdev: aty: SPARC64 requires FB_ATY_CT
    41c6f6b926d0 tty: implement read_iter
    279e54536ddb tty: convert tty_ldisc_ops 'read()' function to take a kernel pointer
    65a10cb163cd net: enetc: fix destroyed phylink dereference during unbind
    79234cb9aab9 net: mvneta: Remove per-cpu queue mapping for Armada 3700
    8845446496a7 net: amd-xgbe: Fix network fluctuations when using 1G BELFUSE SFP
    286fca3f30b9 net: amd-xgbe: Reset link when the link never comes back
    a961fcfb2465 net: amd-xgbe: Fix NETDEV WATCHDOG transmit queue timeout warning
    87f1df93d49f net: amd-xgbe: Reset the PHY rx data path when mailbox command timeout
    7592f07e6d2c net: phy: mscc: adding LCPLL reset to VSC8514
    100676d5c4d5 net: dsa: felix: don't deinitialize unused ports
    51b1868b715a net: dsa: felix: perform teardown in reverse order of setup
    ad843121588f ibmvnic: skip send_request_unmap for timeout reset
    be613736fddd ibmvnic: add memory barrier to protect long term buffer
    f4a5c7ff2ab6 bpf: Clear subreg_def for global function return values
    14a296eab662 b43: N-PHY: Fix the update of coef for the PHY revision >= 3case
    e6d02456012a cxgb4/chtls/cxgbit: Keeping the max ofld immediate data size same in cxgb4 and ulds
    21248186f953 net: axienet: Handle deferred probe on clock properly
    8e81baeb83a3 tcp: fix SO_RCVLOWAT related hangs under mem pressure
    c805f99ffe27 selftests: mptcp: fix ACKRX debug message
    1d6e51e231c4 bpf: Fix bpf_fib_lookup helper MTU check for SKB ctx
    e3c29af06581 bpf, devmap: Use GFP_KERNEL for xdp bulk queue allocation
    94c0e3551594 bpf: Fix an unitialized value in bpf_iter
    c8de71a7ae39 libbpf: Ignore non function pointer member in struct_ops
    b5f71c9ff128 mac80211: fix potential overflow when multiplying to u32 integers
    5ccc0ecda9e8 net/mlx5e: Check tunnel offload is required before setting SWP
    c80b5da86011 net/mlx5e: CT: manage the lifetime of the ct entry object
    046e29284b07 net/mlx5: Disable devlink reload for lag devices
    5decdc86ca9d net/mlx5: Disallow RoCE on lag device
    8dafb484fe3f net/mlx5: Disallow RoCE on multi port slave device
    efb1aa6f1175 net/mlx5: Disable devlink reload for multi port slave device
    64ea9e958fba net/mlx5e: kTLS, Use refcounts to free kTLS RX priv context
    08b42b6f891c net/mlx5e: Replace synchronize_rcu with synchronize_net
    27c79b3a9212 net/mlx5: Fix health error state handling
    ae624d4bd9b6 net/mlx5e: Change interrupt moderation channel params also when channels are closed
    34394a179ed2 net/mlx5e: Don't change interrupt moderation params when DIM is enabled
    96fb2077a517 net: phy: consider that suspend2ram may cut off PHY power
    a5ff8b798a36 dpaa2-eth: fix memory leak in XDP_REDIRECT
    3cf0490625c8 xen/netback: fix spurious event detection for common event case
    fc94be935868 bnxt_en: Fix devlink info's stored fw.psid version format.
    f22cdfcc9df1 bnxt_en: reverse order of TX disable and carrier off
    991d286e194f ibmvnic: Set to CLOSED state even on error
    c318d4198149 selftests/bpf: Convert test_xdp_redirect.sh to bash
    61f0bbac1f0d ath9k: fix data bus crash when setting nf_override via debugfs
    45c720ca5d8e iwlwifi: pnvm: increment the pointer before checking the TLV
    47708895c917 iwlwifi: pnvm: set the PNVM again if it was already loaded
    c8b23e12a74e bpf_lru_list: Read double-checked variable once without lock
    6f304a8d61fb iwlwifi: mvm: don't check if CSA event is running before removing
    caa32dc6ab77 iwlwifi: mvm: assign SAR table revision to the command later
    207bb27562b4 iwlwifi: mvm: send stored PPAG command instead of local
    600c03b4e99d iwlwifi: mvm: store PPAG enabled/disabled flag properly
    39d8f5db9c88 iwlwifi: mvm: fix the type we use in the PPAG table validity checks
    d195e314e849 soc: aspeed: snoop: Add clock control logic
    1a6c71880fad ath11k: fix a locking bug in ath11k_mac_op_start()
    c2fd1a9715a1 ath10k: Fix lockdep assertion warning in ath10k_sta_statistics
    fc0024dfd921 ath10k: Fix suspicious RCU usage warning in ath10k_wmi_tlv_parse_peer_stats_info()
    4641cecc3dbf ARM: at91: use proper asm syntax in pm_suspend
    6709f280e75d staging: wfx: fix possible panic with re-queued frames
    702143d1de99 optee: simplify i2c access
    d25640c5e61d ARM: s3c: fix fiq for clang IAS
    480f1e5d5ca8 iwlwifi: mvm: set enabled in the PPAG command properly
    90aadc8ce0fd arm64: dts: meson: fix broken wifi node for Khadas VIM3L
    0aa65ba9352d arm64: dts: msm8916: Fix reserved and rfsa nodes unit address
    84f9aaa7312b soc: qcom: ocmem: don't return NULL in of_get_ocmem
    9bb8acd6aa96 Bluetooth: btusb: Fix memory leak in btusb_mtk_wmt_recv
    276d6b35f3bc opp: Correct debug message in _opp_add_static_v2()
    bf7d341506d6 arm64: dts: armada-3720-turris-mox: rename u-boot mtd partition to a53-firmware
    1a210339f056 ARM: dts: armada388-helios4: assign pinctrl to each fan
    0d6d8024c1f7 ARM: dts: armada388-helios4: assign pinctrl to LEDs
    b9aa9108b63a can: mcp251xfd: mcp251xfd_probe(): fix errata reference
    104463e0faae arm64: dts: renesas: beacon: Fix EEPROM compatible value
    ad71e4decf49 x86/MSR: Filter MSR writes through X86_IOC_WRMSR_REGS ioctl too
    56ef08902f0d staging: rtl8723bs: wifi_regd.c: Fix incorrect number of regulatory rules
    e5d153b3da39 usb: dwc2: Make "trimming xfer length" a debug message
    fdc77e02db8c usb: dwc2: Abort transaction after errors with unknown reason
    8eb3e6899a27 usb: dwc2: Do not update data length if it is 0 on inbound transfers
    cdbe8c0c5274 ARM: dts: Configure missing thermal interrupt for 4430
    509fe94c196f memory: ti-aemif: Drop child node when jumping out loop
    63cb4aa9e4ee Bluetooth: Put HCI device if inquiry procedure interrupts
    78bbee8f2542 Bluetooth: drop HCI device reference before return
    ba8832d23c97 staging: media: atomisp: Fix size_t format specifier in hmm_alloc() debug statemenet
    3681476ad60e soc: ti: pm33xx: Fix some resource leak in the error handling paths of the probe function
    6e46b23a9f4c soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
    4cbd11f9c37e arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856 node
    c9ccb0efaab2 usb: gadget: u_audio: Free requests only after callback
    66a55fafe3d8 ACPICA: Fix exception code class checks
    3a3f15b4d2f3 arm64: dts: rockchip: rk3328: Add clock_in_out property to gmac2phy node
    88cd0e882f1e cpufreq: brcmstb-avs-cpufreq: Fix resource leaks in ->remove()
    de17aa73c9d9 cpufreq: brcmstb-avs-cpufreq: Free resources in error path
    b87a4fcf4536 arm64: dts: qcom: msm8916-samsung-a2015: Fix sensors
    7ae2c607e8e8 arm64: dts: allwinner: A64: Limit MMC2 bus frequency to 150 MHz
    b20768733427 arm64: dts: allwinner: H6: Allow up to 150 MHz MMC bus frequency
    aa60fe811181 arm64: dts: allwinner: Drop non-removable from SoPine/LTS SD card
    299dfaed458f arm64: dts: allwinner: H6: properly connect USB PHY to port 0
    da0131818f90 arm64: dts: allwinner: A64: properly connect USB PHY to port 0
    1173e48b162a firmware: arm_scmi: Fix call site of scmi_notification_exit
    0e290a7b4ac4 bpf: Avoid warning when re-casting __bpf_call_base into __bpf_call_base_args
    faf4b1fba2dd bpf: Add bpf_patch_call_args prototype to include/linux/bpf.h
    ef1efead3f2a net: stmmac: dwmac-meson8b: fix enabling the timing-adjustment clock
    106c902da8a6 arm64: dts: qcom: msm8916-samsung-a5u: Fix iris compatible
    9b6d62eea4c5 staging: vchiq: Fix bulk transfers on 64-bit builds
    6929e3b01179 staging: vchiq: Fix bulk userdata handling
    601899cec0a3 Bluetooth: hci_qca: Fix memleak in qca_controller_memdump
    ec621e844289 memory: mtk-smi: Fix PM usage counter unbalance in mtk_smi ops
    587b9cc3c02d arm64: dts: exynos: correct PMIC interrupt trigger level on Espresso
    347b3e5557da arm64: dts: exynos: correct PMIC interrupt trigger level on TM2
    ff11ece44c2d ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family
    42596469a889 ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
    41461029703e ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
    9f87ff784143 ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
    f716c60cb017 ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
    83830e692f28 ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
    fcb451381725 arm64: dts: renesas: beacon: Fix audio-1.8V pin enable
    072552f973ad arm64: dts: renesas: beacon kit: Fix choppy Bluetooth Audio
    65933b074ae0 Bluetooth: Fix initializing response id after clearing struct
    bbe6d14a98b0 Bluetooth: hci_uart: Fix a race for write_work scheduling
    fdbed2d74011 Bluetooth: btqcomsmd: Fix a resource leak in error handling paths in the probe function
    fa336bddbe83 ath10k: Fix error handling in case of CE pipe init failure
    b4139fd0ab00 drm/i915/gt: One more flush for Baytrail clear residuals
    de7e30da243f ALSA: pcm: Don't call sync_stop if it hasn't been stopped
    7011cd4599ef ALSA: pcm: Assure sync with the pending stop operation at suspend
    6bcf443bce96 ALSA: pcm: Call sync_stop at disconnection
    85c1062920d1 random: fix the RNDRESEEDCRNG ioctl
    f24e9121eace vmlinux.lds.h: Define SANTIZER_DISCARDS with CONFIG_GCOV_KERNEL=y
    b57d559a92e8 MIPS: vmlinux.lds.S: add missing PAGE_ALIGNED_DATA() section
    e18368d0515d ALSA: usb-audio: Fix PCM buffer allocation in non-vmalloc mode
    89e3d1a85df8 bfq: Avoid false bfq queue merging
    a9f834514580 virt: vbox: Do not use wait_event_interruptible when called from kernel context
    9ecedb5793a6 PCI: Decline to resize resources if boot config must be preserved
    9101e328625f PCI: qcom: Use PHY_REFCLK_USE_PAD only for ipq8064
    1ad8f7fc4aa7 w1: w1_therm: Fix conversion result for negative temperatures
    ed5d02f0a778 kdb: Make memory allocations more robust
    77c711013ddc scsi: qla2xxx: Fix mailbox Ch erroneous error
    a24bb59cabab scsi: libsas: docs: Remove notify_ha_event()
    7bc68c67d21e debugfs: do not attempt to create a new file before the filesystem is initalized
    0bd665240a56 debugfs: be more robust at handling improper input in debugfs_lookup()
    2a7e48dc3834 vdpa/mlx5: fix param validation in mlx5_vdpa_get_config()
    070d0094b3f4 vmlinux.lds.h: add DWARF v5 sections

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index fdd2b75e37..10414a3ea3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a5f867f5e3eb84a66082b5b1bf1f4a2bb10d035e"
-SRCREV_meta ?= "67e74d52f2aaa17ca7041032714368ea81bc8823"
+SRCREV_machine ?= "36889a571fe57fe3561cc23f842b92e4ea9ca264"
+SRCREV_meta ?= "544eb6300c29e7f35551927d63b557f3532f46bf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.19"
+LINUX_VERSION ?= "5.10.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 482326968a..6f98e3b546 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.19"
+LINUX_VERSION ?= "5.10.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "7e9d9495ff1531e9ffa8fc6161a1aa03a2b04966"
-SRCREV_machine ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_meta ?= "67e74d52f2aaa17ca7041032714368ea81bc8823"
+SRCREV_machine_qemuarm ?= "9d6d37cfe365ebd5b530f9c43c1ace924343bb15"
+SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_meta ?= "544eb6300c29e7f35551927d63b557f3532f46bf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6c0bec76d7..c86abb3878 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "56020f462aa0d5373f3f0b683c6647f9dc8ffdc9"
-SRCREV_machine_qemuarm64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_machine_qemumips ?= "d6e16284f4bd6e627ef6dc2f6aea7116ae871d3e"
-SRCREV_machine_qemuppc ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_machine_qemuriscv64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_machine_qemux86 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_machine_qemux86-64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_machine_qemumips64 ?= "40975f4cdd7da46177e9b7817740a0aa22313897"
-SRCREV_machine ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
-SRCREV_meta ?= "67e74d52f2aaa17ca7041032714368ea81bc8823"
+SRCREV_machine_qemuarm ?= "b633861686a11bf7ff02b3d40cd71a0113b4739c"
+SRCREV_machine_qemuarm64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemumips ?= "d36658c0f303a89dff5ed7f3bb9923c525dfd95c"
+SRCREV_machine_qemuppc ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemuriscv64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemux86 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemux86-64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemumips64 ?= "f1c01716513524065f0f231c6e6502cd9a3ecb53"
+SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_meta ?= "544eb6300c29e7f35551927d63b557f3532f46bf"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.19"
+LINUX_VERSION ?= "5.10.21"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

