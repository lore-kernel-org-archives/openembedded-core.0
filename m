Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.927.1619398452808593695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: EzZ/6ezYfzACiJtBRx67manF9j6QoAFNhnLg/iMhzP9PTz830ITfHEvvW8Ejt2CYSJUirPbdr1
 535PPW/C0Ubw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818054"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818054"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
IronPort-SDR: NW1bWIGcfKYS1NxQ3WsUbkRBowvBbzT7mkgN0iaCu066Sv6Kw0yo6aU5FhXB/Lh+tjEVUnU/Gz
 VrMele3uyTWQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067249"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/64] linux-yocto/5.4: update to v5.4.109
Date: Mon, 26 Apr 2021 08:52:38 +0800
Message-Id: <d40439f9de4bf0acbcc730f06395b7a75ece0415.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4e85f8a712cd Linux 5.4.109
    057dd3e6986b xen-blkback: don't leak persistent grants from xen_blkbk_map()
    ce934540ff09 can: peak_usb: Revert "can: peak_usb: add forgotten supported devices"
    2638770e793b ext4: add reclaim checks to xattr code
    92b9e3deffb6 mac80211: fix double free in ibss_leave
    ae23957bd1fb net: qrtr: fix a kernel-infoleak in qrtr_recvmsg()
    f7a962970001 net: dsa: b53: VLAN filtering is global to all users
    f866d1fa48e4 can: dev: Move device back to init netns on owning netns delete
    dfd6627c83dd x86/mem_encrypt: Correct physical address calculation in __set_clr_pte_enc()
    f989059cd22a locking/mutex: Fix non debug version of mutex_lock_io_nested()
    1260d8dc2d66 scsi: mpt3sas: Fix error return code of mpt3sas_base_attach()
    d31747705762 scsi: qedi: Fix error return code of qedi_alloc_global_queues()
    063c3cfb264b scsi: Revert "qla2xxx: Make sure that aborted commands are freed"
    fdc61af371db block: recalculate segment count for multi-segment discards correctly
    8ce9f6efa655 perf auxtrace: Fix auxtrace queue conflict
    bc0b1a2036dd ACPI: scan: Use unique number for instance_no
    b382f9d61609 ACPI: scan: Rearrange memory allocation in acpi_device_add()
    cc578c3e612b Revert "netfilter: x_tables: Update remaining dereference to RCU"
    19a5fb4ceada netfilter: x_tables: Use correct memory barriers.
    c46cd29b89da Revert "netfilter: x_tables: Switch synchronization to RCU"
    e74d46e69a45 bpf: Don't do bpf_cgroup_storage_set() for kuprobe/tp programs
    01398e024ba6 RDMA/cxgb4: Fix adapter LE hash errors while destroying ipv6 listening server
    78aafa0240bc PM: EM: postpone creating the debugfs dir till fs_initcall
    f54b10114d63 net/mlx5e: Fix error path for ethtool set-priv-flag
    fa4addf30c2c PM: runtime: Defer suspending suppliers
    c82d289fe958 arm64: kdump: update ppos when reading elfcorehdr
    8bf90e000c10 drm/msm: fix shutdown hook in case GPU components failed to bind
    4fda26d2f7e1 libbpf: Fix BTF dump of pointer-to-array-of-struct
    4f71aacd6c92 selftests: forwarding: vxlan_bridge_1d: Fix vxlan ecn decapsulate value
    4ecf6d486e45 net: stmmac: dwmac-sun8i: Provide TX and RX fifo sizes
    1f103ca31c51 r8152: limit the RX buffer size of RTL8153A for USB 2.0
    048d0bf8ad19 net: cdc-phonet: fix data-interface release on probe failure
    ecc62c3b1b57 octeontx2-af: fix infinite loop in unmapping NPC counter
    7e9a48ceccae octeontx2-af: Fix irq free in rvu teardown
    e15823801229 libbpf: Use SOCK_CLOEXEC when opening the netlink socket
    7722378c4a0a nfp: flower: fix pre_tun mask id allocation
    060deac22f87 mac80211: fix rate mask reset
    52cc7bad1275 can: m_can: m_can_rx_peripheral(): fix RX being blocked by errors
    059c1996017d can: m_can: m_can_do_rx_poll(): fix extraneous msg loss warning
    e484616a9600 can: c_can: move runtime PM enable/disable to c_can_platform
    4f71965ee897 can: c_can_pci: c_can_pci_remove(): fix use-after-free
    42e49b3aa536 can: kvaser_pciefd: Always disable bus load reporting
    e3ca9fbfcdf5 can: flexcan: flexcan_chip_freeze(): fix chip freeze for missing bitrate
    fb4a6ac4851a can: peak_usb: add forgotten supported devices
    0a8046daba17 tcp: relookup sock for RST+ACK packets handled by obsolete req sock
    67319a8df5d3 netfilter: ctnetlink: fix dump of the expect mask attribute
    c4dd0b36cce4 selftests/bpf: Set gopt opt_class to 0 if get tunnel opt failed
    9d06cabe3bf4 ftgmac100: Restart MAC HW once
    81c591299da3 net/qlcnic: Fix a use after free in qlcnic_83xx_get_minidump_template
    d00db63edd0a e1000e: Fix error handling in e1000_set_d0_lplu_state_82571
    9f02a5658413 e1000e: add rtnl_lock() to e1000_reset_task
    71fa8051f2f4 igc: Fix Supported Pause Frame Link Setting
    35d8a780fa2b igc: Fix Pause Frame Advertising
    da8af444b325 net: dsa: bcm_sf2: Qualify phydev->dev_flags based on port
    267b79a11046 net: sched: validate stab values
    76909a298ebb macvlan: macvlan_count_rx() needs to be aware of preemption
    c6b6c7a92fe5 ipv6: fix suspecious RCU usage warning
    40fa14bbe3fe net/mlx5e: Don't match on Geneve options in case option masks are all zero
    e64e327c7fab libbpf: Fix INSTALL flag order
    53f1483984bf veth: Store queue_mapping independently of XDP prog presence
    f259a7fdeb12 bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD
    e6587d142d02 dm ioctl: fix out of bounds array access when no devices
    7b6944f18cec dm verity: fix DM_VERITY_OPTS_MAX value
    752589cd4ea8 integrity: double check iint_cache was initialized
    f3404a677770 ARM: dts: at91-sama5d27_som1: fix phy address to 7
    1815a24b9483 arm64: dts: ls1043a: mark crypto engine dma coherent
    7447c05e06c4 arm64: dts: ls1012a: mark crypto engine dma coherent
    b6f866bbf7ca arm64: dts: ls1046a: mark crypto engine dma coherent
    e980bd1f7f60 ACPI: video: Add missing callback back for Sony VPCEH3U1E
    431aaecd24ac gcov: fix clang-11+ support
    4748b6d56efe kasan: fix per-page tags for non-page_alloc pages
    037ecab65eb6 squashfs: fix xattr id and id lookup sanity checks
    79b8814d6765 squashfs: fix inode lookup sanity checks
    5b1abfe7d620 platform/x86: intel-vbtn: Stop reporting SW_DOCK events
    599cbcda68ee netsec: restore phy power state after controller reset
    8aa97ae0f5d9 ia64: fix ptrace(PTRACE_SYSCALL_INFO_EXIT) sign
    cb1504b30b6f ia64: fix ia64_syscall_get_set_arguments() for break-based syscalls
    37732ea82e09 block: Suppress uevent for hidden device when removed
    a2d07d077eb3 nfs: we don't support removing system.nfs4_acl
    eed4e1abc997 nvme-pci: add the DISABLE_WRITE_ZEROES quirk for a Samsung PM1725a
    5fc284999c4a nvme-fc: return NVME_SC_HOST_ABORTED_CMD when a command has been aborted
    526abcb05c61 nvme: add NVME_REQ_CANCELLED flag in nvme_cancel_request()
    8cdbee05b83f drm/radeon: fix AGP dependency
    5a0e3fcbeb5a drm/amdgpu: fb BO should be ttm_bo_type_device
    fc8e4af4c3ef drm/amd/display: Revert dram_clock_change_latency for DCN2.1
    6292d84c8af4 regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
    c45182707277 u64_stats,lockdep: Fix u64_stats_init() vs lockdep
    f59604786a48 habanalabs: Call put_pid() when releasing control device
    694761bfdd76 sparc64: Fix opcode filtering in handling of no fault loads
    11efb0cda655 irqchip/ingenic: Add support for the JZ4760
    69423418c5eb cifs: change noisy error message to FYI
    981ba9c9a529 atm: idt77252: fix null-ptr-dereference
    6b2844ad7b17 atm: uPD98402: fix incorrect allocation
    40d0a9297f83 net: davicom: Use platform_get_irq_optional()
    b90de232a806 net: wan: fix error return code of uhdlc_init()
    0da0f199e767 net: hisilicon: hns: fix error return code of hns_nic_clear_all_rx_fetch()
    ab60e4f5eb3a NFS: Correct size calculation for create reply length
    785be28d360f nfs: fix PNFS_FLEXFILE_LAYOUT Kconfig default
    d605afb11945 gpiolib: acpi: Add missing IRQF_ONESHOT
    f6c1da94ddb3 cpufreq: blacklist Arm Vexpress platforms in cpufreq-dt-platdev
    1d2c9669135f cifs: ask for more credit on async read/write code paths
    ec7ce1e337ec gianfar: fix jumbo packets+napi+rx overrun crash
    7ef7d296b154 sun/niu: fix wrong RXMAC_BC_FRM_CNT_COUNT count
    d25f579ec557 net: intel: iavf: fix error return code of iavf_init_get_resources()
    d4dd6de6fc90 net: tehuti: fix error return code in bdx_probe()
    e224a789d4a6 ixgbe: Fix memleak in ixgbe_configure_clsu32
    537653a0698b ALSA: hda: ignore invalid NHLT table
    bd272f11a9d4 Revert "r8152: adjust the settings about MAC clock speed down for RTL8153"
    7a12167636bf atm: lanai: dont run lanai_dev_close if not open
    fb0067fcda6a atm: eni: dont release is never initialized
    614a4ba66854 powerpc/4xx: Fix build errors from mfdcr()
    45c1ca3e5784 net: fec: ptp: avoid register access when ipg clock is disabled
    d0f5726ab1df hugetlbfs: hugetlb_fault_mutex_hash() cleanup
    b90344f7d600 Linux 5.4.108
    819eb4d7a85e cifs: Fix preauth hash corruption
    cf113ffd620d x86/apic/of: Fix CPU devicetree-node lookups
    288be0ed9b36 genirq: Disable interrupts for force threaded handlers
    b8ebe853abca firmware/efi: Fix a use after bug in efi_mem_reserve_persistent
    31e17169a116 efi: use 32-bit alignment for efi_guid_t literals
    886dbe0e338b ext4: fix potential error in ext4_do_update_inode
    2f65ae3a7ee3 ext4: do not try to set xattr into ea_inode if value is empty
    474aab448436 ext4: find old entry again if failed to rename whiteout
    de2e1603c125 x86: Introduce TS_COMPAT_RESTART to fix get_nr_restart_syscall()
    076b60af926b x86: Move TS_COMPAT back to asm/thread_info.h
    27ddd2b59045 kernel, fs: Introduce and use set_restart_fn() and arch_set_restart_data()
    f546965c3aac x86/ioapic: Ignore IRQ2 again
    da326ba3b84a perf/x86/intel: Fix a crash caused by zero PEBS status
    51a2b19b554c PCI: rpadlpar: Fix potential drc_name corruption in store functions
    796fc331c3cf counter: stm32-timer-cnt: fix ceiling write max value
    850ca1c0130a iio: hid-sensor-temperature: Fix issues of timestamp channel
    31a2e804ad4a iio: hid-sensor-prox: Fix scale not correct issue
    3fa27c8749cf iio: hid-sensor-humidity: Fix alignment issue of timestamp channel
    4458ae8d4001 iio: adc: ad7949: fix wrong ADC result due to incorrect bit mask
    a605c095bb46 iio: gyro: mpu3050: Fix error handling in mpu3050_trigger_handler
    87163fbba6d2 iio: adis16400: Fix an error code in adis16400_initial_setup()
    ed0625334b94 iio:adc:qcom-spmi-vadc: add default scale to LR_MUX2_BAT_ID channel
    08414c498b4b iio:adc:stm32-adc: Add HAS_IOMEM dependency
    b0a595269e62 usb: typec: tcpm: Invoke power_supply_changed for tcpm-source-psy-
    4baade6fd6e5 usb: gadget: configfs: Fix KASAN use-after-free
    c92aebf2b0f3 USB: replace hardcode maximum usb string length by definition
    f89366164693 usbip: Fix incorrect double assignment to udc->ud.tcp_rx
    251949ec9d95 usb-storage: Add quirk to defeat Kindle's automatic unload
    81b56afc2841 nvme-rdma: fix possible hang when failing to set io queues
    b891d41d01f4 counter: stm32-timer-cnt: Report count function when SLAVE_MODE_DISABLED
    86fd6c0d22a5 scsi: myrs: Fix a double free in myrs_cleanup()
    eb46392d329a scsi: lpfc: Fix some error codes in debugfs
    1f925558e3f1 riscv: Correct SPARSEMEM configuration
    7db8f3be034d kbuild: Fix <linux/version.h> for empty SUBLEVEL or PATCHLEVEL again
    1dad483b1ebc net/qrtr: fix __netdev_alloc_skb call
    f0b09d547713 sunrpc: fix refcount leak for rpc auth modules
    3c57ea09365f vfio: IOMMU_API should be selected
    b439aac77360 svcrdma: disable timeouts on rdma backchannel
    d1ae8f16c223 NFSD: Repair misuse of sv_lock in 5.10.16-rt30.
    4c5fab560cb0 nfsd: Don't keep looking up unhashed files in the nfsd file cache
    49545a7b8b30 nvmet: don't check iosqes,iocqes for discovery controllers
    cf7d7728d8a5 nvme-tcp: fix a NULL deref when receiving a 0-length r2t PDU
    36a4f9164cf6 nvme-tcp: fix possible hang when failing to set io queues
    81c1dbe1070c nvme: fix Write Zeroes limitations
    6712b7fcef9d afs: Stop listxattr() from listing "afs.*" attributes
    c71b93323f37 ASoC: simple-card-utils: Do not handle device clock
    e029384c1835 ASoC: SOF: intel: fix wrong poll bits in dsp power down
    626a484d1ec2 ASoC: SOF: Intel: unregister DMIC device on probe error
    db3d39bcd66a ASoC: fsl_ssi: Fix TDM slot setup for I2S mode
    24c553371add btrfs: fix slab cache flags for free space tree bitmap
    5b3b99525c4f btrfs: fix race when cloning extent buffer during rewind of an old root
    a3e438db75fb ARM: 9044/1: vfp: use undef hook for VFP support detection
    a47b395d441d ARM: 9030/1: entry: omit FP emulation for UND exceptions taken in kernel mode
    34794bc0e768 s390/vtime: fix increased steal time accounting
    ba4342094d71 Revert "PM: runtime: Update device status before letting suppliers suspend"
    62cf220630a0 ALSA: hda/realtek: Apply headset-mic quirks for Xiaomi Redmibook Air
    613fd762d188 ALSA: hda: generic: Fix the micmute led init state
    5a5f85603e6e ALSA: hda/realtek: apply pin quirk for XiaomiNotebook Pro
    4d35c01a3645 ALSA: dice: fix null pointer dereference when node is disconnected
    d0fc0e7bfda2 ASoC: ak5558: Add MODULE_DEVICE_TABLE
    a592a4c2889e ASoC: ak4458: Add MODULE_DEVICE_TABLE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6aecb7e564f067b786cdec5b2eedd7fc3f2f13d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2ffc8ed542..8c4c94577b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "65bbe689d98a007848008be2c8edeb5fa8066829"
-SRCREV_meta ?= "19738ca97b999a3b150e2d34232bb44b6537348f"
+SRCREV_machine ?= "918e7836663cbad861b254f181d3545977d4492f"
+SRCREV_meta ?= "0fdc53770a263755ea5e995d5b74dd9a8cd06d8b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.107"
+LINUX_VERSION ?= "5.4.109"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2b6e35a69c..5a392742ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.107"
+LINUX_VERSION ?= "5.4.109"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ac3cbab1d6692d4a032dfffe0a604f39a634d18a"
-SRCREV_machine ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_meta ?= "19738ca97b999a3b150e2d34232bb44b6537348f"
+SRCREV_machine_qemuarm ?= "1dd2723e9895767d459c7c60c0074b3bce5c0d52"
+SRCREV_machine ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_meta ?= "0fdc53770a263755ea5e995d5b74dd9a8cd06d8b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 245c3d574b..d925fe7a72 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ea4097dbff5a148265018e1a998e02b5a05e3d27"
-SRCREV_machine_qemuarm64 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_machine_qemumips ?= "230ca33504faef6f40c5d3b24901aaacb901c9a6"
-SRCREV_machine_qemuppc ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_machine_qemuriscv64 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_machine_qemux86 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_machine_qemux86-64 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_machine_qemumips64 ?= "84e071a893ef9cea8a8ffbcd233b47a2bc9056b5"
-SRCREV_machine ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
-SRCREV_meta ?= "19738ca97b999a3b150e2d34232bb44b6537348f"
+SRCREV_machine_qemuarm ?= "f4d1abedbb7a850f9ccb058c2c63f1dffc46e485"
+SRCREV_machine_qemuarm64 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_machine_qemumips ?= "7f54002c5db332f2a8a9c842f1d6aa56e3946cb8"
+SRCREV_machine_qemuppc ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_machine_qemuriscv64 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_machine_qemux86 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_machine_qemux86-64 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_machine_qemumips64 ?= "0addc7475d8fc1e8ca6f33ec90bf4b78085c0975"
+SRCREV_machine ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
+SRCREV_meta ?= "0fdc53770a263755ea5e995d5b74dd9a8cd06d8b"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.107"
+LINUX_VERSION ?= "5.4.109"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

