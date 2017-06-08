Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0CC57823D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v58JM1NC010290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Jun 2017 12:22:02 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 12:22:00 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Jun 2017 15:21:54 -0400
Message-ID: <32388591349e4f1a957a91d9c7984db5721cb33c.1496949552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1496949552.git.bruce.ashfield@windriver.com>
References: <cover.1496949552.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/4.10: update to v4.10.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 19:22:02 -0000
Content-Type: text/plain

Updating to the latest 4.10 -stable releases, which comprise the
following changes:

   17a4d4803381 Linux 4.10.17
   291e716bb382 pstore: Shut down worker when unregistering
   e5590e3d9275 pstore: Fix flags to enable dumps on powerpc
   e3d4daa7f6d4 libnvdimm, pfn: fix 'npfns' vs section alignment
   116ada1a98ab libnvdimm: fix nvdimm_bus_lock() vs device_lock() ordering
   f92a2fe7cdb1 libnvdimm, pmem: fix a NULL pointer BUG in nd_pmem_notify
   72393c00f00a libnvdimm, region: fix flush hint detection crash
   b821a605977e ipmi: Fix kernel panic at ipmi_ssif_thread()
   c8e4805dd634 Bluetooth: hci_intel: add missing tty-device sanity check
   a8620f066675 Bluetooth: hci_bcm: add missing tty-device sanity check
   9a3054df3cf6 Bluetooth: Fix user channel for 32bit userspace on 64bit kernel
   58d479441029 tty: pty: Fix ldisc flush after userspace become aware of the data already
   9e3b9909bce3 serial: omap: suspend device on probe errors
   c1ce1f427e0a serial: omap: fix runtime-pm handling on unbind
   2578dd75ad12 serial: samsung: Use right device for DMA-mapping calls
   a78ddcd2a858 fscrypt: fix context consistency check when key(s) unavailable
   659ccd97668a f2fs: fix fs corruption due to zero inode page
   717946b469cf mm: fix data corruption due to stale mmap reads
   35223d76e2cf dax: prevent invalidation of mapped DAX entries
   fa7043b3a2e0 device-dax: fix sysfs attribute deadlock
   e1a19ef52919 device-dax: fix cdev leak
   81845f520179 md/raid1: avoid reusing a resync bio after error handling.
   23ebf6aa650d padata: free correct variable
   586aa5a6537f ovl: do not set overlay.opaque on non-dir create
   cf95696518f5 CIFS: add misssing SFM mapping for doublequote
   582fb96084c3 cifs: fix CIFS_IOC_GET_MNT_INFO oops
   4452b80eaef8 CIFS: fix oplock break deadlocks
   cd01b999953b cifs: fix CIFS_ENUMERATE_SNAPSHOTS oops
   6ec05086dca9 cifs: fix leak in FSCTL_ENUM_SNAPS response handling
   b1b295efad9f CIFS: fix mapping of SFM_SPACE and SFM_PERIOD
   ae6c2182b853 SMB3: Work around mount failure when using SMB3 dialect to Macs
   6716949b0029 Set unicode flag on cifs echo request to avoid Mac error
   b7174f403828 Fix match_prepath()
   93697e1e5099 mm: prevent potential recursive reclaim due to clearing PF_MEMALLOC
   3302d94ab6f9 fs/block_dev: always invalidate cleancache in invalidate_bdev()
   f174092ec373 ceph: fix memory leak in __ceph_setxattr()
   594d4eca1c49 fs/xattr.c: zero out memory copied to userspace in getxattr
   49302d531325 orangefs: do not check possibly stale size on truncate
   42d86d92af64 orangefs: do not set getattr_time on orangefs_lookup
   d2c326c7ff6d orangefs: clean up oversize xattr validation
   4af222e1d681 orangefs: fix bounds check for listxattr
   e3e77f8ba5f6 ext4: evict inline data when writing to memory map
   fd469456ad6d jbd2: fix dbench4 performance regression for 'nobarrier' mounts
   e2e596f2888c perf annotate s390: Implement jump types for perf annotate
   d122da54d33e perf annotate s390: Fix perf annotate error -95 (4.10 regression)
   ba6006004353 perf auxtrace: Fix no_size logic in addr_filter__resolve_kernel_syms()
   d187c9e135d3 IB/hfi1: Prevent kernel QP post send hard lockups
   04692adb3aac IB/mlx4: Reduce SRIOV multicast cleanup warning message to debug level
   e4e17bce1672 IB/mlx4: Fix ib device initialization error flow
   5d691b80ca4d IB/IPoIB: ibX: failed to create mcg debug file
   53bd2ccebd51 IB/core: For multicast functions, verify that LIDs are multicast LIDs
   b40c7a502b1e IB/core: Fix sysfs registration error flow
   f269df7bad86 iov_iter: don't revert iov buffer if csum error
   fc483680829a vfio/type1: Remove locked page accounting workqueue
   c85990cf511d dm thin: fix a memory leak when passing discard bio down
   bd0db3b70b59 dm rq: check blk_mq_register_dev() return value in dm_mq_init_request_queue()
   5d953aa1cd2e dm era: save spacemap metadata root after the pre-commit
   4c1dad842bfc dm crypt: rewrite (wipe) key in crypto layer using random data
   bce0767157c3 crypto: ccp - Change ISR handler method for a v5 CCP
   f106cd8575c4 crypto: ccp - Change ISR handler method for a v3 CCP
   595c7ad3c64b crypto: ccp - Disable interrupts early on unload
   e1adc5e04af5 crypto: ccp - Use only the relevant interrupt bits
   7ae1df9048db crypto: algif_aead - Require setkey before accept(2)
   fe51605c9512 crypto: s5p-sss - Close possible race for completed requests
   635aff41e59a block: fix blk_integrity_register to use template's interval_exp if not 0
   5c5d86be4f3f arm64: KVM: Fix decoding of Rt/Rt2 when trapping AArch32 CP accesses
   8348ffba88e5 KVM: arm/arm64: fix races in kvm_psci_vcpu_on
   74cbcb5afa75 KVM: x86: fix user triggerable warning in kvm_apic_accept_events()
   f22d13c45f2d perf/x86: Fix Broadwell-EP DRAM RAPL events
   29d07bb20ee5 um: Fix PTRACE_POKEUSER on x86_64
   efbd8cc8f6f8 x86, pmem: Fix cache flushing for iovec write < 8 bytes
   f0896a0d1e6d selftests/x86/ldt_gdt_32: Work around a glibc sigaction() bug
   c4b0426385ea x86/boot: Fix BSS corruption/overwrite bug in early x86 kernel startup
   b1a8c141c88c usb: hub: Do not attempt to autosuspend disconnected devices
   5830c376e3af usb: hub: Fix error loop seen after hub communication errors
   19c9dacddf7d usb: Make sure usb/phy/of gets built-in
   934c4e338e7e usb: gadget: legacy gadgets are optional
   7f7a4b58e257 usb: misc: add missing continue in switch
   34006e9621c7 staging: comedi: jr3_pci: cope with jiffies wraparound
   acb79180c55e staging: comedi: jr3_pci: fix possible null pointer dereference
   7a6b4c372118 staging: wilc1000: Fix problem with wrong vif index
   4097eda73b4c staging: gdm724x: gdm_mux: fix use-after-free on module unload
   808dc8810896 staging: vt6656: use off stack for out buffer USB transfers.
   4f19197ce58d staging: vt6656: use off stack for in buffer USB transfers.
   5b92090a53eb USB: Revert "cdc-wdm: fix "out-of-sync" due to missing notifications"
   32dd9987fbd9 USB: Proper handling of Race Condition when two USB class drivers try to call init_usb_class simultaneously
   e349a5723322 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit
   dffe5d4b0511 usb: host: xhci: print correct command ring address
   a561f35aeaa9 usb: xhci: bInterval quirk for TI TUSB73x0
   b3e01cd15d17 iscsi-target: Set session_fall_back_to_erl0 when forcing reinstatement
   d39ebfe9a1b7 target/fileio: Fix zero-length READ and WRITE handling
   f78392c0160c target: Fix compare_and_write_callback handling for non GOOD status
   8fe6ee0b6e69 xen: adjust early dom0 p2m handling to xen hypervisor behavior
   6e8e99586919 Linux 4.10.16
   2262a51b515a block: get rid of blk_integrity_revalidate()
   f89d35abea21 drm/ttm: fix use-after-free races in vm fault handling
   2f6aeeae43bb drm: mxsfb: drm_dev_alloc() returns error pointers
   9302f2b14af1 drm/hisilicon/hibmc: Fix wrong pointer passed to PTR_ERR()
   4a66b610a821 xen: Revert commits da72ff5bfcb0 and 72a9b186292d
   6442a7f5d793 f2fs: sanity check segment count
   853151191ef2 openvswitch: Set internal device max mtu to ETH_MAX_MTU.
   8656ebcc28bc net: mdio-mux: bcm-iproc: call mdiobus_free() in error path
   c35107a3bec2 bpf: don't let ldimm64 leak map addresses on unprivileged
   ddbb020a01ec bnxt_en: allocate enough space for ->ntp_fltr_bmap
   912bec79fb2a ipv6: reorder ip6_route_dev_notifier after ipv6_dev_notf
   062e49d89f68 ipv6: initialize route null entry in addrconf_init()
   d3081680506f rtnetlink: NUL-terminate IFLA_PHYS_PORT_NAME string
   df6f3bcd6667 ipv4, ipv6: ensure raw socket message is big enough to hold an IP header
   929575fd0dfd tcp: do not inherit fastopen_req from parent
   3006794169a1 net: usb: qmi_wwan: add Telit ME910 support
   0735252265e5 net: ipv6: Do not duplicate DAD on link up
   ae2f8e28b40e tcp: fix wraparound issue in tcp_lp
   38904075d9bc bpf, arm64: fix jit branch offset related to ldimm64
   b3468d7ea8c9 bpf: enhance verifier to understand stack pointer arithmetic
   ec2f9263d6a5 geneve: fix incorrect setting of UDP checksum flag
   9cd3670409a9 net: macb: fix phy interrupt parsing
   99975dd43461 net: adjust skb->truesize in ___pskb_trim()
   748838198f1e tcp: do not underestimate skb->truesize in tcp_trim_head()
   8743096ed3f0 macsec: dynamically allocate space for sglist
   e288821b3842 sparc64: fix fault handling in NGbzero.S and GENbzero.S
   01995a54c747 ALSA: hda - Fix deadlock of controller device lock at unbinding
   9576fcd1d931 staging: lustre: ptlrpc: avoid warning on missing return
   e7d743d68744 staging: emxx_udc: remove incorrect __init annotations
   e368150f2942 staging: wlan-ng: add missing byte order conversion
   debb50cbeda5 staging/lustre/llite: move root_squash from sysfs to debugfs
   9663ece4a734 brcmfmac: Make skb header writable before use
   d67be3c4b852 brcmfmac: Ensure pointer correctly set if skb data location changes
   cbd7c3465eec MIPS: R2-on-R6 MULTU/MADDU/MSUBU emulation bugfix
   2523b0855c42 scsi: smartpqi: fix time handling
   a538d5f72454 scsi: mac_scsi: Fix MAC_SCSI=m option when SCSI=m
   7f3f10d2150f scsi: qla2xxx: Fix crash in qla2xxx_eh_abort on bad ptr
   463232f51f91 scsi: qedi: fix build error without DEBUG_FS
   5102b4022080 scsi: qedi: Fix possible memory leak in qedi_iscsi_update_conn()
   eb1ef03d9033 serial: 8250_omap: Fix probe and remove for PM runtime
   8b62d12c1a53 phy: qcom-usb-hs: Add depends on EXTCON
   c6a6118496c8 clk: rockchip: add "," to mux_pll_src_apll_dpll_gpll_usb480m_p on rk3036
   bc6e823fdcf2 USB: serial: io_edgeport: fix descriptor error handling
   1077176a2456 USB: serial: ch341: fix modem-status handling
   e40bbb397074 USB: serial: mct_u232: fix modem-status error handling
   f665109e63c1 USB: serial: quatech2: fix control-message error handling
   aa0b4b2ff04e USB: serial: ftdi_sio: fix latency-timer error handling
   44d7d23192fe USB: serial: ark3116: fix open error handling
   39581ca08fb9 USB: serial: ti_usb_3410_5052: fix control-message error handling
   c5cd729ca100 USB: serial: io_edgeport: fix epic-descriptor handling
   d75ac2f21f53 USB: serial: ssu100: fix control-message error handling
   7db2c56df28a USB: serial: digi_acceleport: fix incomplete rx sanity check
   cfbe048303d2 USB: serial: keyspan_pda: fix receive sanity checks
   7916a663940b usb: chipidea: Handle extcon events properly
   7a93680fe259 usb: chipidea: Only read/write OTGSC from one place
   cc771fa1d711 usb: host: ohci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   d286acdd40ed usb: host: ehci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   5605e5c50f34 usb: dwc2: host: use msleep() for long delay
   69a09d73e8bd KVM: nVMX: do not leak PML full vmexit to L1
   22e025bc1af9 KVM: nVMX: initialize PML fields in vmcs02
   4897ec5ece6c Revert "KVM: nested VMX: disable perf cpuid reporting"
   78a43e2c2c98 KVM: PPC: Book3S HV: Don't try to signal cpu -1
   f82a54b53ca2 x86/platform/intel-mid: Correct MSI IRQ line for watchdog device
   743cfeb7bcdd kprobes/x86: Fix kernel panic when certain exception-handling addresses are probed
   d696d9cfea73 platform/x86: intel_pmc_core: fix out-of-bounds accesses on stack
   5e10d8dc0003 clk: Make x86/ conditional on CONFIG_COMMON_CLK
   4a8fa15cec03 x86/mpx: Re-add MPX to selftests Makefile
   d4462702edd1 x86/pci-calgary: Fix iommu_free() comparison of unsigned expression >= 0
   679dd20cc34e x86/ioapic: Restore IO-APIC irq_chip retrigger callback
   6e4623e517db iwlwifi: mvm: fix accessing fw_id_to_mac_id
   bcb28cb39930 iwlwifi: mvm: writing zero bytes to debugfs causes a crash
   bd78746f3225 iwlwifi: mvm: synchronize firmware DMA paging memory
   39e4ab1d46fa iwlwifi: mvm: fix references to first_agg_queue in DQA mode
   82e158e12443 iwlwifi: mvm: fix pending frame counter calculation
   fa251bac1869 iwlwifi: mvm/pcie: adjust A-MSDU tx_cmd length in PCIe
   441f52f19435 iwlwifi: mvm: Use aux queue for offchannel frames in dqa
   ab735bec18d4 iwlwifi: mvm: fix reorder timer re-arming
   7478a09f262c iwlwifi: pcie: fix the set of DMA memory mask
   0633d3269a69 iwlwifi: pcie: trans: Remove unused 'shift_param'
   e864e9686442 iwlwifi: pcie: don't increment / decrement a bool
   7e375d6d6056 iwlwifi: mvm: overwrite skb info later
   827181091199 iwlwifi: mvm: don't restart HW if suspend fails with unified image
   3aff5ebef0b4 iwlwifi: fix MODULE_FIRMWARE for 6030
   e9a20a152598 iwlwifi: mvm: properly check for transport data in dump
   47b8d37b4c62 mwifiex: set adapter->dev before starting to use mwifiex_dbg()
   219083c89725 mwifiex: don't enable/disable IRQ 0 during suspend/resume
   33d8a1d4086e mwifiex: Avoid skipping WEP key deletion for AP
   6a9d22e988c3 mwifiex: remove redundant dma padding in AMSDU
   4b8badac6525 mwifiex: debugfs: Fix (sometimes) off-by-1 SSID print
   ed65aff890b9 ARM: dts: sun7i: lamobo-r1: Fix CPU port RGMII settings
   c78c87249cd6 ARM: dts: am57xx-idk: tpic2810 is on I2C bus, not SPI
   8848163aa114 ARM: OMAP3: Fix smartreflex platform data regression
   097336fc693d ARM: OMAP5 / DRA7: Fix HYP mode boot for thumb2 build
   98fa203aa7cd ARM: dts: imx6sx-udoo-neo: Fix reboot hang
   32b0a3d44419 ARM: dts: NSP: GPIO reboot open-source
   96b61a1bad47 ARM: pxa: ezx: fix a910 camera data
   baebaada5f01 leds: ktd2692: avoid harmless maybe-uninitialized warning
   359ccd6e3667 spi: armada-3700: Remove spi_master_put in a3700_spi_remove()
   0136fa36c8af arm64: Improve detection of user/non-user mappings in set_pte(_at)
   a0435d6cdccc arm64: remove wrong CONFIG_PROC_SYSCTL ifdef
   e60a59f80b96 arm: dts: qcom: Fix ipq board clock rates
   3e1418c687ac arm64: dts: r8a7795: Mark EthernetAVB device node disabled
   12f072e19606 power: supply: bq24190_charger: Handle fault before status on interrupt
   c963edc736f7 power: supply: bq24190_charger: Don't read fault register outside irq_handle_thread()
   9e9cd6500d2c power: supply: bq24190_charger: Call power_supply_changed() for relevant component
   34ba5925c01e power: supply: bq24190_charger: Install irq_handler_thread() at end of probe()
   8c94da036756 power: supply: bq24190_charger: Call set_mode_host() on pm_resume()
   d6ea2f1dd259 power: supply: bq24190_charger: Fix irq trigger to IRQF_TRIGGER_FALLING
   b7634bdbb695 perf/x86/intel/pt: Add format strings for PTWRITE and power event tracing
   ce6f9a237a6c powerpc: Correctly disable latent entropy GCC plugin on prom_init.o
   803969dd92f1 powerpc/ftrace: Fix confusing help text for DISABLE_MPROFILE_KERNEL
   d0addb34980a powerpc/mm: Fix build break when CMA=n && SPAPR_TCE_IOMMU=y
   690bba9d641a powerpc/powernv: Fix opal_exit tracepoint opcode
   3ead745aef02 powerpc/mm: Fixup wrong LPCR_VRMASD value
   72cd64df59f3 powerpc/perf: Avoid FAB_*_MATCH checks for power9
   8c34e65205b7 powerpc/perf: Handle sdar_mode for marked event in power9
   d2264474c9c2 powerpc/perf: Fix perf_get_data_addr() for power9 DD1
   0587b73378b2 cpupower: Fix turbo frequency reporting for pre-Sandy Bridge cores
   bfa87eca09ce power: supply: lp8788: prevent out of bounds array access
   8a4963a05118 crypto: caam - don't dma_map key for hash algorithms
   3e871381811a crypto: caam - fix error path for ctx_dma mapping failure
   93bb6661baf0 tmp: use pdev for parent device in tpm_chip_alloc
   c61315284309 tpm: fix RC value check in tpm2_seal_trusted
   c5f7ba5f5911 mtd: nand: Add OX820 NAND hardware dependency
   2586f8f02455 hwmon: (it87) Fix pwm4 detection for IT8620 and IT8628
   5e7b84228b51 drm/sti: fix GDP size to support up to UHD resolution
   206472df12f1 9p: fix a potential acl leak

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 46b84c99304e..f25974cb6895 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "fdfa9de38ddb3362f9d9ff6b35e14dcb93da43b1"
+SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_meta ?= "4b89f331d4220f6f62d20ef60aa59edcd9b44106"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.15"
+LINUX_VERSION ?= "4.10.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index ee42155bac31..2e98914abb7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.10.15"
+LINUX_VERSION ?= "4.10.17"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "fdfa9de38ddb3362f9d9ff6b35e14dcb93da43b1"
+SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_meta ?= "4b89f331d4220f6f62d20ef60aa59edcd9b44106"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 07454cf01fe1..fa85b21d4bd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ebb58e37143db15fe1b6712487f66b0d2ccb54e1"
-SRCREV_machine_qemuarm64 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_machine_qemumips ?= "c79214a4c66138478d88f9955fae35a56390f8c9"
-SRCREV_machine_qemuppc ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_machine_qemux86 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_machine_qemux86-64 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_machine_qemumips64 ?= "229abf6f63652058db1308a0c07e59652d3e6a23"
-SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "fdfa9de38ddb3362f9d9ff6b35e14dcb93da43b1"
+SRCREV_machine_qemuarm ?= "3926e386306fe0ae92feae45bc47e4c013daa1fc"
+SRCREV_machine_qemuarm64 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_machine_qemumips ?= "a038a5932f3be820f42d78f4e47850987ad72ce3"
+SRCREV_machine_qemuppc ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_machine_qemux86 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_machine_qemux86-64 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_machine_qemumips64 ?= "b442c964432938cbe10c4cc578260353045af980"
+SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
+SRCREV_meta ?= "4b89f331d4220f6f62d20ef60aa59edcd9b44106"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.15"
+LINUX_VERSION ?= "4.10.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


