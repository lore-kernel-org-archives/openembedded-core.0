Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mivnqrhqZ1YNV2UA9lAiKVUR5VvDJtMo79Gl677sNUdyhQwYYgIxqfw4Zw67hvbgIVNBZAlBOd
 HGdC+VzjJkIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211695"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211695"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:07 -0700
IronPort-SDR: ueSYzG2zc+84qVCd8CKwTY3ykEjFBLRXBdkEqXghrf7tbdf/D1u2GySUK3kEFI3/uFlrQjPop9
 vAVExij7816Q==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295285"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 23/25] linux-yocto/5.4: update to v5.4.103
Date: Mon, 22 Mar 2021 09:41:25 +0800
Message-Id: <50b7bd03fad8564205dd870c4dd120a62541767a.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    c4ca4659678e Linux 5.4.103
    47478db9ad21 ALSA: hda/realtek: Apply dual codec quirks for MSI Godlike X570 board
    4cf243476463 ALSA: hda/realtek: Add quirk for Intel NUC 10
    2254dfa68428 ALSA: hda/realtek: Add quirk for Clevo NH55RZQ
    027ddd67f685 media: v4l: ioctl: Fix memory leak in video_usercopy
    60fdceaa91ad swap: fix swapfile read/write offset
    bebf5e832779 zsmalloc: account the number of compacted pages correctly
    f038a22632a4 xen-netback: respect gnttab_map_refs()'s return value
    474773c42ffd Xen/gnttab: handle p2m update errors on a per-slot basis
    def70c33c478 scsi: iscsi: Verify lengths on passthrough PDUs
    567a234a231d scsi: iscsi: Ensure sysfs attributes are limited to PAGE_SIZE
    5f4243642873 sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output
    ca3afdd03773 scsi: iscsi: Restrict sessions and handles to admin capabilities
    fdaec40526b4 ASoC: Intel: bytcr_rt5640: Add quirk for the Acer One S1002 tablet
    68b15ca91add ASoC: Intel: bytcr_rt5651: Add quirk for the Jumper EZpad 7 tablet
    db0e94615263 ASoC: Intel: bytcr_rt5640: Add quirk for the Voyo Winpad A15 tablet
    925ae8148535 ASoC: Intel: bytcr_rt5640: Add quirk for the Estar Beauty HD MID 7316R tablet
    99d2926531ac sched/features: Fix hrtick reprogramming
    4a3f4feeb622 parisc: Bump 64-bit IRQ stack size to 64 KB
    f41ed2164364 perf/x86/kvm: Add Cascade Lake Xeon steppings to isolation_ucodes[]
    2b130871e20a btrfs: fix error handling in commit_fs_roots
    9bf519ca55c4 ASoC: Intel: Add DMI quirk table to soc_intel_is_byt_cr()
    7702b331861b nvme-tcp: add clean action for failed reconnection
    a9ea34d2717a nvme-rdma: add clean action for failed reconnection
    4bf6c84c9ad3 nvme-core: add cancel tagset helpers
    8253cc11abb2 f2fs: fix to set/clear I_LINKABLE under i_lock
    77dc257b4feb f2fs: handle unallocated section and zone on pinned/atgc
    aa1362606059 media: uvcvideo: Allow entities with no pads
    0e9d7902764a drm/amd/display: Guard against NULL pointer deref when get_i2c_info fails
    f1fef55a3f1a PCI: Add a REBAR size quirk for Sapphire RX 5600 XT Pulse
    b252cdd9c650 drm/amdgpu: Add check to prevent IH overflow
    a8d46a3feb02 crypto: tcrypt - avoid signed overflow in byte count
    9f8d3e4b8ad8 drm/hisilicon: Fix use-after-free
    e1b9c1c9dbb0 brcmfmac: Add DMI nvram filename quirk for Voyo winpad A15 tablet
    3c099c272eb5 brcmfmac: Add DMI nvram filename quirk for Predia Basic tablet
    d1f262561993 staging: bcm2835-audio: Replace unsafe strcpy() with strscpy()
    e3ec4af50642 staging: most: sound: add sanity check for function argument
    7d16e7c1615d Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data
    bba1995325b5 x86/build: Treat R_386_PLT32 relocation as R_386_PC32
    e37674e1a48d ath10k: fix wmi mgmt tx queue full due to race condition
    46813e4a7caa pktgen: fix misuse of BUG_ON() in pktgen_thread_worker()
    b074e7e20cc9 Bluetooth: hci_h5: Set HCI_QUIRK_SIMULTANEOUS_DISCOVERY for btrtl
    5a8bbefd0074 wlcore: Fix command execute failure 19 for wl12xx
    48549db10dbe vt/consolemap: do font sum unsigned
    de00b8f037ca x86/reboot: Add Zotac ZBOX CI327 nano PCI reboot quirk
    48f6c1a89487 staging: fwserial: Fix error handling in fwserial_create
    ce2b4b9c86b7 rsi: Move card interrupt handling to RX thread
    133b0b1aa5c4 rsi: Fix TX EAPOL packet handling against iwlwifi AP
    c8c3088a90c3 drm/virtio: use kvmalloc for large allocations
    584149c771ec MIPS: Drop 32-bit asm string functions
    648c5b1b24d0 dt-bindings: net: btusb: DT fix s/interrupt-name/interrupt-names/
    823e6524e1f3 dt-bindings: ethernet-controller: fix fixed-link specification
    176188cff67e net: fix dev_ifsioc_locked() race condition
    e4fc812e3577 net: ag71xx: remove unnecessary MTU reservation
    ad112654e21d net: bridge: use switchdev for port flags set through sysfs too
    2e235c3a9518 mm/hugetlb.c: fix unnecessary address expansion of pmd sharing
    4ed3162e92bf nbd: handle device refs for DESTROY_ON_DISCONNECT properly
    e6af7cb64b7b net: fix up truesize of cloned skb in skb_prepare_for_shift()
    4ceb5ca9e626 smackfs: restrict bytes count in smackfs write functions
    5fe244620e74 net/af_iucv: remove WARN_ONCE on malformed RX packets
    09e47dc27ed5 xfs: Fix assert failure in xfs_setattr_size()
    a72c45f4ee33 media: v4l2-ctrls.c: fix shift-out-of-bounds in std_validate
    edaa0a0aab6e erofs: fix shift-out-of-bounds of blkszbits
    706068d0811a media: mceusb: sanity check for prescaler value
    64677f10e560 udlfb: Fix memory leak in dlfb_usb_probe
    4e3b08cfe619 JFS: more checks for invalid superblock
    86d7c693670e MIPS: VDSO: Use CLANG_FLAGS instead of filtering out '--target='
    9757d5c4fc3f arm64 module: set plt* section addresses to 0x0
    69861dcc78c2 nvme-pci: fix error unwind in nvme_map_data
    744073c5c79c nvme-pci: refactor nvme_unmap_data
    9e4815cf1785 Input: elantech - fix protocol errors for some trackpoints in SMBus mode
    a1d010346e48 net: usb: qmi_wwan: support ZTE P685M modem
    7f324ea75baa Linux 5.4.102
    07c4c2e2bcd3 ARM: dts: aspeed: Add LCLK to lpc-snoop
    39be7b978fde net: qrtr: Fix memory leak in qrtr_tun_open
    7b518508c685 dm era: Update in-core bitset after committing the metadata
    976ee31ea300 net: sched: fix police ext initialization
    9875cb3c0968 net: icmp: pass zeroed opts from icmp{,v6}_ndo_send before sending
    354fb7244fd0 ipv6: silence compilation warning for non-IPV6 builds
    e528edf1e579 ipv6: icmp6: avoid indirect call for icmpv6_send()
    c30e93eee3bf xfrm: interface: use icmp_ndo_send helper
    e1ec06b833aa sunvnet: use icmp_ndo_send helper
    d8d268ce1a5e gtp: use icmp_ndo_send helper
    dd28e735df5c icmp: allow icmpv6_ndo_send to work with CONFIG_IPV6=n
    2019554f9656 icmp: introduce helper for nat'd source address in network device context
    0a35ff986617 drm/i915: Reject 446-480MHz HDMI clock on GLK
    467214ddfa7e dm era: only resize metadata in preresume
    fb8986363019 dm era: Reinitialize bitset cache before digesting a new writeset
    e59b9a8464be dm era: Use correct value size in equality function of writeset tree
    fead0c8e5c56 dm era: Fix bitset memory leaks
    8ca89085fe72 dm era: Verify the data block size hasn't changed
    e8a146ef82a4 dm era: Recover committed writeset after crash
    d873884783ed dm writecache: fix writing beyond end of underlying device when shrinking
    5233c47c8d46 dm: fix deadlock when swapping to encrypted device
    fd3b7e07d3c1 gfs2: Recursive gfs2_quota_hold in gfs2_iomap_end
    fa0201d3902e gfs2: Don't skip dlm unlock if glock has an lvb
    c5abc17d2740 spi: spi-synquacer: fix set_cs handling
    3dbe8f1d24de sparc32: fix a user-triggerable oops in clear_user()
    7e17044631aa f2fs: fix out-of-repair __setattr_copy()
    5b5d76028056 um: mm: check more comprehensively for stub changes
    b95baf4efb68 virtio/s390: implement virtio-ccw revision 2 correctly
    8e6c8cfa9aee s390/vtime: fix inline assembly clobber list
    07332771663b cpufreq: intel_pstate: Get per-CPU max freq via MSR_HWP_CAPABILITIES if available
    dfbbed769f1b printk: fix deadlock when kernel panic
    81c2472bcf33 gpio: pcf857x: Fix missing first interrupt
    70dcfb66ef68 spmi: spmi-pmic-arb: Fix hw_irq overflow
    d5194f7264e2 powerpc/32s: Add missing call to kuep_lock on syscall entry
    6b22c402dff9 mmc: sdhci-esdhc-imx: fix kernel panic when remove module
    b6bc5417385d module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for undefined symbols
    8a3e6c6fe9c6 media: smipcie: fix interrupt handling and IR timeout
    2e1df9bfe6fa arm64: Extend workaround for erratum 1024718 to all versions of Cortex-A55
    566209806176 hugetlb: fix copy_huge_page_from_user contig page struct assumption
    5dd34ee9abdc hugetlb: fix update_and_free_page contig page struct assumption
    b74e3493264f x86: fix seq_file iteration for pat/memtype.c
    ebd5a480db0e seq_file: document how per-entry resources are managed.
    3e9b85cabea0 fs/affs: release old buffer head on error path
    b2b5c3aec866 mtd: spi-nor: hisi-sfc: Put child node np on error path
    61dfd4fbbd1e mtd: spi-nor: core: Add erase size check for erase command initialization
    3ab134965691 mtd: spi-nor: core: Fix erase type discovery for overlaid region
    cc27d5f40680 mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
    7852feb3accb mtd: spi-nor: sfdp: Fix last erase region marking
    97d079fd2ac1 watchdog: mei_wdt: request stop on unregister
    4262c46bfbcf watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ
    a82ebd5dde7d arm64: uprobe: Return EOPNOTSUPP for AARCH32 instruction probing
    efca4c991ecf arm64: kexec_file: fix memory leakage in create_dtb() when fdt_open_into() fails
    d4a7d6c02261 floppy: reintroduce O_NDELAY fix
    337bba09d850 rcu/nocb: Perform deferred wake up before last idle's need_resched() check
    3cd9a74bead1 rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers
    14122331b1c3 powerpc/prom: Fix "ibm,arch-vec-5-platform-support" scan
    84ec5883b4f9 x86/reboot: Force all cpus to exit VMX root if VMX is supported
    4fa154124164 x86/virt: Eat faults on VMXOFF in reboot flows
    3f5dc4a102a9 media: ipu3-cio2: Fix mbus_code processing in cio2_subdev_set_fmt()
    de9b5d51b627 staging: rtl8188eu: Add Edimax EW-7811UN V2 to device table
    bb5bfd51f603 staging: gdm724x: Fix DMA from stack
    d69583a2c1b3 staging/mt7621-dma: mtk-hsdma.c->hsdma-mt7621.c
    eb6f42b101ec dts64: mt7622: fix slow sd card access
    f73e98efaa10 pstore: Fix typo in compression option name
    c9e529e635b9 drivers/misc/vmw_vmci: restrict too big queue size in qp_host_alloc_queue
    d82d5a77f0a0 misc: rtsx: init of rts522a add OCP power off when no card is present
    aa00c2d60ae1 seccomp: Add missing return in non-void function
    0d95bdee02ad crypto: sun4i-ss - initialize need_fallback
    903f576f4e66 crypto: sun4i-ss - handle BigEndian for cipher
    4fc52e091a2c crypto: sun4i-ss - checking sg length is not sufficient
    3b40af844c26 crypto: aesni - prevent misaligned buffers on the stack
    46e6d781f87e crypto: arm64/sha - add missing module aliases
    dca4f29507e4 btrfs: fix extent buffer leak on failure to copy root
    df369c3afb0d btrfs: splice remaining dirty_bg's onto the transaction dirty bg list
    dc0780e456ac btrfs: fix reloc root leak with 0 ref reloc roots on recovery
    c0baf3aaf4b9 btrfs: abort the transaction if we fail to inc ref in btrfs_copy_root
    2910038c09f4 KEYS: trusted: Fix migratable=1 failing
    2c21eac499f8 tpm_tis: Clean up locality release
    f19b98394c0a tpm_tis: Fix check_locality for correct locality acquisition
    52f3bdb1078a erofs: initialized fields can only be observed after bit is set
    4d09487509ad drm/sched: Cancel and flush all outstanding jobs before finish.
    c38fd6afe146 drm/nouveau/kms: handle mDP connectors
    7c1a2f91908f drm/amdgpu: Set reference clock to 100Mhz on Renoir (v2)
    ca5a8ad84ba0 drm/amd/display: Add vupdate_no_lock interrupts for DCN2.1
    5431cb67306d bcache: Move journal work to new flush wq
    a339f0998eb1 bcache: Give btree_io_wq correct semantics again
    de5510b9825c Revert "bcache: Kill btree_io_wq"
    f6992915031e ALSA: hda/realtek: modify EAPD in the ALC886
    48d1950dafe9 ALSA: hda: Add another CometLake-H PCI ID
    3ed9bd25fd88 USB: serial: mos7720: fix error code in mos7720_write()
    e73874b41286 USB: serial: mos7840: fix error code in mos7840_write()
    a678d130424a USB: serial: ftdi_sio: fix FTX sub-integer prescaler
    d1f773b70ae6 usb: dwc3: gadget: Fix dep->interval for fullspeed interrupt
    1c073b56e765 usb: dwc3: gadget: Fix setting of DEPCFG.bInterval_m1
    a5ae281779a5 usb: musb: Fix runtime PM race in musb_queue_resume_work
    e3ddfaf3e617 USB: serial: option: update interface mapping for ZTE P685M
    32a82e001ead media: mceusb: Fix potential out-of-bounds shift
    8812bed7ec74 Input: i8042 - add ASUS Zenbook Flip to noselftest list
    80168ba86034 Input: joydev - prevent potential read overflow in ioctl
    9fe66416b02e Input: xpad - add support for PowerA Enhanced Wired Controller for Xbox Series X|S
    d84f9c28abbe Input: raydium_ts_i2c - do not send zero length
    2d954832ba48 HID: wacom: Ignore attempts to overwrite the touch_max value from HID
    394f2b794310 HID: logitech-dj: add support for keyboard events in eQUAD step 4 Gaming
    e690b3f48635 ACPI: configfs: add missing check after configfs_register_default_group()
    40b70c98be98 ACPI: property: Fix fwnode string properties matching
    371a2218ed33 blk-settings: align max_sectors on "logical_block_size" boundary
    4ad2a372e1cd scsi: bnx2fc: Fix Kconfig warning & CNIC build errors
    d2aa80c36727 mm/rmap: fix potential pte_unmap on an not mapped pte
    8450b1cd7cb3 i2c: brcmstb: Fix brcmstd_send_i2c_cmd condition
    1a47856548fb arm64: Add missing ISB after invalidating TLB in __primary_switch
    94a432151c35 r8169: fix jumbo packet handling on RTL8168e
    c70c3b6e62e4 mm/compaction: fix misbehaviors of fast_find_migrateblock()
    c200f4959586 mm/hugetlb: fix potential double free in hugetlb_register_node() error path
    67a982ee20d2 mm/memory.c: fix potential pte_unmap_unlock pte error
    5bf318965485 ocfs2: fix a use after free on error
    55b6be947efa vxlan: move debug check after netdev unregister
    e9ae8928ddd6 net/mlx4_core: Add missed mlx4_free_cmd_mailbox()
    e41bb745fd0f vfio/type1: Use follow_pte()
    005ed88685aa i40e: Fix add TC filter for IPv6
    1b66e64ce349 i40e: Fix VFs not created
    a60ef5efff55 i40e: Fix addition of RX filters after enabling FW LLDP agent
    57a7b145d8a1 i40e: Fix overwriting flow control settings during driver loading
    55af95c8ce4d i40e: Add zero-initialization of AQ command structures
    d7c25783b8c8 i40e: Fix flow for IPv6 next header (extension header)
    2efbd63b6e74 regmap: sdw: use _no_pm functions in regmap_read/write
    62c4532ebb1d nvmem: core: skip child nodes not matching binding
    e40a8924eb3b nvmem: core: Fix a resource leak on error in nvmem_add_cells_from_of()
    d8b7689a6240 ext4: fix potential htree index checksum corruption
    2df4434766aa vfio/iommu_type1: Fix some sanity checks in detach group
    179b83e72c89 drm/msm/mdp5: Fix wait-for-commit for cmd panels
    32cf1b5c153d drm/msm/dsi: Correct io_start for MSM8994 (20nm PHY)
    e2d44809c4f4 mei: hbm: call mei_set_devstate() on hbm stop response
    c7cac840c2b3 PCI: Align checking of syscall user config accessors
    8c23e9f4c7b0 VMCI: Use set_page_dirty_lock() when unregistering guest memory
    e8ba75011695 pwm: rockchip: rockchip_pwm_probe(): Remove superfluous clk_unprepare()
    3a9044ea78ea soundwire: cadence: fix ACK/NAK handling
    fcfec32c9a01 misc: eeprom_93xx46: Add module alias to avoid breaking support for non device tree users
    52fe389c0a99 phy: rockchip-emmc: emmc_phy_init() always return 0
    047e029392a5 misc: eeprom_93xx46: Fix module alias to enable module autoprobe
    f7fb313affee sparc64: only select COMPAT_BINFMT_ELF if BINFMT_ELF is set
    0a072f01e585 Input: elo - fix an error code in elo_connect()
    2062856c441c perf test: Fix unaligned access in sample parsing test
    eb191a88be52 perf intel-pt: Fix premature IPC
    119f96bb14bc perf intel-pt: Fix missing CYC processing in PSB
    ce40b82cfa09 Input: sur40 - fix an error code in sur40_probe()
    d5ca5d1190a4 RDMA/hns: Fixes missing error code of CMDQ
    8677e99150b0 nfsd: register pernet ops last, unregister first
    046615ffd431 clk: aspeed: Fix APLL calculate formula from ast2600-A2
    923027302666 regulator: qcom-rpmh: fix pm8009 ldo7
    2ebadcea0ef3 spi: pxa2xx: Fix the controller numbering for Wildcat Point
    e0c516e72fd5 RDMA/hns: Fix type of sq_signal_bits
    d21f6d9a3e49 RDMA/siw: Fix calculation of tx_valid_cpus size
    d0005c4ab5e1 RDMA/hns: Fixed wrong judgments in the goto branch
    c42d1e8caad5 clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
    ecfae933df3a powerpc/8xx: Fix software emulation interrupt
    ba5c8a0ee624 powerpc/pseries/dlpar: handle ibm, configure-connector delay status
    0c79abee609d mfd: wm831x-auxadc: Prevent use after free in wm831x_auxadc_read_irq()
    046a8158982b spi: stm32: properly handle 0 byte transfer
    3cb8510625d5 RDMA/rxe: Correct skb on loopback path
    c88fc726d9c0 RDMA/rxe: Fix coding error in rxe_rcv_mcast_pkt
    2e556ba37f13 RDMA/rxe: Fix coding error in rxe_recv.c
    d2ee0b2070cd perf vendor events arm64: Fix Ampere eMag event typo
    a0ea1f58aeea perf tools: Fix DSO filtering when not finding a map for a sampled address
    e59e0ced0763 tracepoint: Do not fail unregistering a probe due to memory failure
    4cb8bdaebbd8 IB/cm: Avoid a loop when device has 255 ports
    180cd50dd9a8 IB/mlx5: Return appropriate error code instead of ENOMEM
    379b5ee283dd amba: Fix resource leak for drivers without .remove
    65159b4401fd i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct
    870ab7ef9799 ARM: 9046/1: decompressor: Do not clear SCTLR.nTLSMD for ARMv7+ cores
    f201f050a52a mmc: renesas_sdhi_internal_dmac: Fix DMA buffer alignment from 8 to 128-bytes
    2096ca11967c mmc: usdhi6rol0: Fix a resource leak in the error handling path of the probe
    de1e8961db05 mmc: sdhci-sprd: Fix some resource leaks in the remove function
    c4c70ac4659e powerpc/47x: Disable 256k page size
    8121f35cc657 KVM: PPC: Make the VMX instruction emulation routines static
    144422afaa10 IB/umad: Return EPOLLERR in case of when device disassociated
    40d9bcab50d0 IB/umad: Return EIO in case of when device disassociated
    f337e5947a19 objtool: Fix ".cold" section suffix check for newer versions of GCC
    9d20f53167e6 objtool: Fix error handling for STD/CLD warnings
    68b6d02b3774 auxdisplay: ht16k33: Fix refresh rate handling
    88b6e7267f9e isofs: release buffer head before return
    8eaf7e3480ec regulator: core: Avoid debugfs: Directory ... already present! error
    486a018932fe regulator: s5m8767: Drop regulators OF node reference
    ab669048f97d spi: atmel: Put allocated master before return
    bdad2e9c992e regulator: s5m8767: Fix reference count leak
    0fec3272abf1 certs: Fix blacklist flag type confusion
    8d0c3acd0370 regulator: axp20x: Fix reference cout leak
    edf1d9025195 clk: sunxi-ng: h6: Fix clock divider range on some clocks
    e68366695807 RDMA/mlx5: Use the correct obj_id upon DEVX TIR creation
    6a52a17fd0a3 clocksource/drivers/mxs_timer: Add missing semicolon when DEBUG is defined
    898c96f75616 clocksource/drivers/ixp4xx: Select TIMER_OF when needed
    d8a9db6dfa23 rtc: s5m: select REGMAP_I2C
    239670e85cbb power: reset: at91-sama5d2_shdwc: fix wkupdbc mask
    3cbd3038c915 of/fdt: Make sure no-map does not remove already reserved regions
    fb326c6ce0dc fdt: Properly handle "no-map" field in the memory region
    5fba43deff93 mfd: bd9571mwv: Use devm_mfd_add_devices()
    3b0053360e84 dmaengine: hsu: disable spurious interrupt
    fe0a870739ba dmaengine: owl-dma: Fix a resource leak in the remove function
    6f4fdb448b4c dmaengine: fsldma: Fix a resource leak in an error handling path of the probe function
    67be754e0771 dmaengine: fsldma: Fix a resource leak in the remove function
    da0f70eadabf RDMA/siw: Fix handling of zero-sized Read and Receive Queues.
    1f5fea7616e8 HID: core: detect and skip invalid inputs to snto32()
    34d0d61a864d clk: sunxi-ng: h6: Fix CEC clock
    2dd73db1b508 spi: cadence-quadspi: Abort read if dummy cycles required are too many
    0473358e075c i2c: iproc: handle master read request
    128c8431e8b9 i2c: iproc: update slave isr mask (ISR_MASK_SLAVE)
    d8a5e1780a2b i2c: iproc: handle only slave interrupts which are enabled
    8b63c0cbc724 quota: Fix memory leak when handling corrupted quota file
    623c86840e8a selftests/powerpc: Make the test check in eeh-basic.sh posix compliant
    b070f3b6ee5a clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()
    f8c601cb3ab4 clk: meson: clk-pll: make "ret" a signed integer
    fcba0f6ab1e2 clk: meson: clk-pll: fix initializing the old rate (fallback) for a PLL
    6413d0318ca4 HSI: Fix PM usage counter unbalance in ssi_hw_init
    33a2e62473e8 capabilities: Don't allow writing ambiguous v3 file capabilities
    b42b04e517cb ubifs: Fix error return code in alloc_wbufs()
    5501892826bb ubifs: Fix memleak in ubifs_init_authentication
    c4ede7571b4f jffs2: fix use after free in jffs2_sum_write_data()
    746ef39b0bd6 fs/jfs: fix potential integer overflow on shift of a int
    ff138fd20f17 ASoC: simple-card-utils: Fix device module clock
    091b409383ad ima: Free IMA measurement buffer after kexec syscall
    e436d3f7bdac ima: Free IMA measurement buffer on error
    f04787555f4c crypto: ecdh_helper - Ensure 'len >= secret.len' in decode_key()
    cba03a29611c hwrng: timeriomem - Fix cooldown period calculation
    6f651ec266ba btrfs: clarify error returns values in __load_free_space_cache
    790c0dcbb519 ASoC: SOF: debug: Fix a potential issue on string buffer termination
    624d18332e13 Drivers: hv: vmbus: Avoid use-after-free in vmbus_onoffer_rescind()
    76faeef2f45e f2fs: fix a wrong condition in __submit_bio
    721c986986d2 drm/amdgpu: Prevent shift wrapping in amdgpu_read_mask()
    c1a421b198bc f2fs: fix to avoid inconsistent quota data
    7cb52169ada4 mtd: parsers: afs: Fix freeing the part name memory in failure
    35a5d96a4c22 ASoC: cpcap: fix microphone timeslot mask
    4168bf93ccc4 ata: ahci_brcm: Add back regulators management
    0faef25462f8 drm/nouveau: bail out of nouveau_channel_new if channel init fails
    adc2e1dba977 crypto: talitos - Work around SEC6 ERRATA (AES-CTR mode data size error)
    7284c2692aff mtd: parser: imagetag: fix error codes in bcm963xx_parse_imagetag_partitions()
    aae14aed37d5 sched/eas: Don't update misfit status if the task is pinned
    ba95955ee1e2 media: uvcvideo: Accept invalid bFormatIndex and bFrameIndex values
    27019b873863 media: pxa_camera: declare variable when DEBUG is defined
    0f16925a9e70 media: cx25821: Fix a bug when reallocating some dma memory
    c3a2f73a7925 media: qm1d1c0042: fix error return code in qm1d1c0042_init()
    96a3bc313aa3 media: lmedm04: Fix misuse of comma
    69e859a9d0a4 media: software_node: Fix refcounts in software_node_get_next_child()
    1e0f565138db drm/amd/display: Fix HDMI deep color output for DCE 6-11.
    7d1fc1e88b36 drm/amd/display: Fix 10/12 bpc setup in DCE output bit depth reduction.
    ed0b50cd4407 bsg: free the request before return error code
    de9b26b5133f MIPS: properly stop .eh_frame generation
    1169602150d5 drm/sun4i: tcon: fix inverted DCLK polarity
    48f2fcd7b928 crypto: bcm - Rename struct device_private to bcm_device_private
    3d5afcae9af2 evm: Fix memleak in init_desc
    76b7e3a636b4 ASoC: cs42l56: fix up error handling in probe
    c7ebd8b358b0 media: aspeed: fix error return code in aspeed_video_setup_video()
    438d2cc7b8cc media: tm6000: Fix memleak in tm6000_start_stream
    31730cb2461b media: media/pci: Fix memleak in empress_init
    57cc424326df media: em28xx: Fix use-after-free in em28xx_alloc_urbs
    3e0c29a407da media: vsp1: Fix an error handling path in the probe function
    e01fcc71a994 media: camss: missing error code in msm_video_register()
    1b26ba73b18f media: imx: Fix csc/scaler unregister
    0634c66e6660 media: imx: Unregister csc/scaler only if registered
    61f638b3afe9 media: i2c: ov5670: Fix PIXEL_RATE minimum value
    7dfe4fed118d MIPS: lantiq: Explicitly compare LTQ_EBU_PCC_ISTAT against 0
    ea27c3f0bc1a MIPS: c-r4k: Fix section mismatch for loongson2_sc_init
    d9f6d2a54487 drm/amdgpu: Fix macro name _AMDGPU_TRACE_H_ in preprocessor if condition
    0d528f6151c7 crypto: arm64/aes-ce - really hide slower algos when faster ones are enabled
    e056f69dea5a crypto: sun4i-ss - fix kmap usage
    a3eeb7fd063f crypto: sun4i-ss - linearize buffers content must be kept
    914d61930b89 drm/fb-helper: Add missed unlocks in setcmap_legacy()
    200e603d5517 gma500: clean up error handling in init
    2e5c94708d3e drm/gma500: Fix error return code in psb_driver_load()
    0da21f552344 fbdev: aty: SPARC64 requires FB_ATY_CT
    e7b6ac5c46fe net: mvneta: Remove per-cpu queue mapping for Armada 3700
    825c82d55197 net: amd-xgbe: Fix network fluctuations when using 1G BELFUSE SFP
    46121a6f3be5 net: amd-xgbe: Reset link when the link never comes back
    70bf58171f19 net: amd-xgbe: Fix NETDEV WATCHDOG transmit queue timeout warning
    0496eb6f48cc net: amd-xgbe: Reset the PHY rx data path when mailbox command timeout
    95672dd57547 ibmvnic: skip send_request_unmap for timeout reset
    64a87b0b650c ibmvnic: add memory barrier to protect long term buffer
    8022d52a102b b43: N-PHY: Fix the update of coef for the PHY revision >= 3case
    9db1f14e7043 cxgb4/chtls/cxgbit: Keeping the max ofld immediate data size same in cxgb4 and ulds
    399fb9d51ba9 net: axienet: Handle deferred probe on clock properly
    774bacf121c3 tcp: fix SO_RCVLOWAT related hangs under mem pressure
    88f8f40c901c bpf: Fix bpf_fib_lookup helper MTU check for SKB ctx
    5af224ab9486 mac80211: fix potential overflow when multiplying to u32 integers
    fef6f594ea43 xen/netback: fix spurious event detection for common event case
    5c54aaed078d bnxt_en: reverse order of TX disable and carrier off
    a1b692506569 ibmvnic: Set to CLOSED state even on error
    9de820ae6cc1 ath9k: fix data bus crash when setting nf_override via debugfs
    4dcfd936030b bpf_lru_list: Read double-checked variable once without lock
    bcda70ed686f soc: aspeed: snoop: Add clock control logic
    5350b91a73d7 ARM: s3c: fix fiq for clang IAS
    b9634e38ac61 arm64: dts: msm8916: Fix reserved and rfsa nodes unit address
    65f9fdb425bc Bluetooth: btusb: Fix memory leak in btusb_mtk_wmt_recv
    80ace3402885 arm64: dts: armada-3720-turris-mox: rename u-boot mtd partition to a53-firmware
    18ab54cfda05 ARM: dts: armada388-helios4: assign pinctrl to each fan
    3d3098c2ddad ARM: dts: armada388-helios4: assign pinctrl to LEDs
    6b86cbc97589 staging: rtl8723bs: wifi_regd.c: Fix incorrect number of regulatory rules
    c75f541e12f8 usb: dwc2: Make "trimming xfer length" a debug message
    6e89da2174f7 usb: dwc2: Abort transaction after errors with unknown reason
    c192b2cc4d39 usb: dwc2: Do not update data length if it is 0 on inbound transfers
    c7722f664788 ARM: dts: Configure missing thermal interrupt for 4430
    75921ff8bdc4 memory: ti-aemif: Drop child node when jumping out loop
    725cb22009f7 Bluetooth: Put HCI device if inquiry procedure interrupts
    9f2816a99ace Bluetooth: drop HCI device reference before return
    a5542b45c729 usb: gadget: u_audio: Free requests only after callback
    a17fa9039218 ACPICA: Fix exception code class checks
    fb6aa67ab1da cpufreq: brcmstb-avs-cpufreq: Fix resource leaks in ->remove()
    279bc604e2e9 cpufreq: brcmstb-avs-cpufreq: Free resources in error path
    24932862d9ee arm64: dts: allwinner: A64: Limit MMC2 bus frequency to 150 MHz
    f85f6c5572ff arm64: dts: allwinner: H6: Allow up to 150 MHz MMC bus frequency
    06010cf028ce arm64: dts: allwinner: Drop non-removable from SoPine/LTS SD card
    288764e9ac2f arm64: dts: allwinner: H6: properly connect USB PHY to port 0
    c4be5762aab9 arm64: dts: allwinner: A64: properly connect USB PHY to port 0
    c616257c9db4 bpf: Avoid warning when re-casting __bpf_call_base into __bpf_call_base_args
    fa3fc79c7834 bpf: Add bpf_patch_call_args prototype to include/linux/bpf.h
    ab9de93d12c9 memory: mtk-smi: Fix PM usage counter unbalance in mtk_smi ops
    9ab4364ecd99 arm64: dts: exynos: correct PMIC interrupt trigger level on Espresso
    0fb966b5d10b arm64: dts: exynos: correct PMIC interrupt trigger level on TM2
    f0f9e9152375 ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family
    d32a94371fc1 ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
    da40c06e41b5 ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
    e23124590415 ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
    4a0e0208bbb5 ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
    6d4c9e525833 ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
    36c39c445265 Bluetooth: Fix initializing response id after clearing struct
    04792d477215 Bluetooth: hci_uart: Fix a race for write_work scheduling
    b624bc27cf82 Bluetooth: btqcomsmd: Fix a resource leak in error handling paths in the probe function
    a48bb93f6fbe ath10k: Fix error handling in case of CE pipe init failure
    3a954b0d909c random: fix the RNDRESEEDCRNG ioctl
    1be2b1d23529 MIPS: vmlinux.lds.S: add missing PAGE_ALIGNED_DATA() section
    d3b8fa2e1d03 ALSA: usb-audio: Fix PCM buffer allocation in non-vmalloc mode
    166f9bc8ca0d bfq: Avoid false bfq queue merging
    608ba1f447bc virt: vbox: Do not use wait_event_interruptible when called from kernel context
    468bf1861a9c PCI: Decline to resize resources if boot config must be preserved
    213c6f635bab PCI: qcom: Use PHY_REFCLK_USE_PAD only for ipq8064
    c37821e061f0 kdb: Make memory allocations more robust
    6f15d498bfe8 debugfs: do not attempt to create a new file before the filesystem is initalized
    de5ae4087035 debugfs: be more robust at handling improper input in debugfs_lookup()
    d239c08f091a kvm: x86: replace kvm_spec_ctrl_test_value with runtime test on the host
    0a6565762f27 vmlinux.lds.h: add DWARF v5 sections

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 820b55234191890ece87e858a98089326985e868)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 73e3fd9a04..638f3df2fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "207cc4c23780d4dd0b40960b1364c75a54437102"
-SRCREV_meta ?= "b11f59557b924d5d1db8c088848d40ef1a0b7da6"
+SRCREV_machine ?= "34ae8b39b6414e1f05fed93966c5ab1db20b6963"
+SRCREV_meta ?= "feeb59687bc0f054af837a5061f8d413ec7c93e9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.101"
+LINUX_VERSION ?= "5.4.103"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index ac9517b894..9dcea7b0ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.101"
+LINUX_VERSION ?= "5.4.103"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca4fa7f9d562a9be1ca7d9d47fa7c2b70d9bb249"
-SRCREV_machine ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_meta ?= "b11f59557b924d5d1db8c088848d40ef1a0b7da6"
+SRCREV_machine_qemuarm ?= "ffe71606242ccf95707aae7599805419f14277ff"
+SRCREV_machine ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_meta ?= "feeb59687bc0f054af837a5061f8d413ec7c93e9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 73ffda9048..64f9789c6c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fe56acd0cb4769b18e8dd778f74f8c64c8622f0c"
-SRCREV_machine_qemuarm64 ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_machine_qemumips ?= "4ddbef4e60bc7e13f2a33f57c3c6dc6ca71e0d81"
-SRCREV_machine_qemuppc ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_machine_qemuriscv64 ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_machine_qemux86 ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_machine_qemux86-64 ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_machine_qemumips64 ?= "44f1e579ba921196f7c3b36e47473b907e09870e"
-SRCREV_machine ?= "3a8744ea60ad663c53c582d519a636658e405994"
-SRCREV_meta ?= "b11f59557b924d5d1db8c088848d40ef1a0b7da6"
+SRCREV_machine_qemuarm ?= "31486fc68d8688908700a68b6655fd50c733d882"
+SRCREV_machine_qemuarm64 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_machine_qemumips ?= "aec63899e25194c00dbc5f25db8fe6c4461eef21"
+SRCREV_machine_qemuppc ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_machine_qemuriscv64 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_machine_qemux86 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_machine_qemux86-64 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_machine_qemumips64 ?= "c155e91597bd1a1aae557405b5061bb8c2695e5d"
+SRCREV_machine ?= "80ade4d43bbcb497d363d44508af69af74a84092"
+SRCREV_meta ?= "feeb59687bc0f054af837a5061f8d413ec7c93e9"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.101"
+LINUX_VERSION ?= "5.4.103"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

