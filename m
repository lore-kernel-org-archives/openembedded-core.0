Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F72B785E7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:39:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4FdWXM012284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Dec 2017 07:39:32 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 07:39:31 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Dec 2017 10:39:21 -0500
Message-ID: <bfd80e5a40af8af70f9c57400e6b8fbeca4b45cf.1512401707.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1512401707.git.bruce.ashfield@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/4.9: update to v4.9.65
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
X-List-Received-Date: Mon, 04 Dec 2017 15:39:31 -0000
Content-Type: text/plain

Integrating the korg stable updates that include the following changes:

    133e6ccf46f1 Linux 4.9.65
    ceaec6e8cd98 mm/pagewalk.c: report holes in hugetlb ranges
    fae5947129eb coda: fix 'kernel memory exposure attempt' in fsync
    9980b8278338 mm/page_alloc.c: broken deferred calculation
    55b06b0fc09b ipmi: fix unsigned long underflow
    8af777385f7a ocfs2: should wait dio before inode lock in ocfs2_setattr()
    a8356445ba0f ocfs2: fix cluster hang after a node dies
    2bd38ece78a4 dmaengine: dmatest: warn user when dma test times out
    e6d4a078f0e7 serial: 8250_fintek: Fix finding base_port with activated SuperIO
    70eb4608bb0e serial: omap: Fix EFR write on RTS deassertion
    2cfbb32f6ccb ima: do not update security.ima if appraisal status is not INTEGRITY_PASS
    aa15fe4d6a7f crypto: dh - Fix double free of ctx->p
    4a7e02312420 crypto: dh - fix memleak in setkey
    67b718fcf897 net/sctp: Always set scope_id in sctp_inet6_skb_msgname
    f0ae7a1b45fa fealnx: Fix building error on MIPS
    362d2ce0f851 sctp: do not peel off an assoc from one netns to another one
    99aa74ce9c2d af_netlink: ensure that NLMSG_DONE never fails in dumps
    080ecd2bb62b vlan: fix a use-after-free in vlan_device_event()
    58baa36d3728 net: usb: asix: fill null-ptr-deref in asix_suspend
    4ad82095bfe2 qmi_wwan: Add missing skb_reset_mac_header-call
    02a0c0639ae0 net: qmi_wwan: fix divide by 0 on bad descriptors
    f376621861e3 net: cdc_ether: fix divide by 0 on bad descriptors
    6f239c0655cf bonding: discard lowest hash bit for 802.3ad layer3+4
    afd9fa661927 netfilter/ipvs: clear ipvs_property flag when SKB net namespace changed
    3920a5bdd951 tcp: do not mangle skb->cb[] in tcp_make_synack()
    58b21b028721 net: vrf: correct FRA_L3MDEV encode type
    b0e50c4e895a tcp_nv: fix division by zero in tcpnv_acked()
    563c24f65f4f Linux 4.9.64
    6fbd42df9217 staging: greybus: spilib: fix use-after-free after deregistration
    d8b5d88d2195 brcmfmac: don't preset all channels as disabled
    54a5155afa84 x86/MCE/AMD: Always give panic severity for UC errors in kernel context
    f6643fc829e0 USB: serial: garmin_gps: fix memory leak on probe errors
    579cf722f8c1 USB: serial: garmin_gps: fix I/O after failed probe and remove
    1f9688d551e3 USB: serial: qcserial: add pid/vid for Sierra Wireless EM7355 fw update
    fd6a742d8bf7 usb: gadget: f_fs: Fix use-after-free in ffs_free_inst
    599973738e28 USB: Add delay-init quirk for Corsair K70 LUX keyboards
    87ff414178cb USB: usbfs: compute urb->actual_length for isochronous
    11fdb41a1faa crypto: dh - Don't permit 'key' or 'g' size longer than 'p'
    2d3a0d950156 crypto: dh - Don't permit 'p' to be 0
    e38fe6397f73 Revert "dt-bindings: Add LEGO MINDSTORMS EV3 compatible specification"
    a9a3cb25d9c1 Revert "dt-bindings: Add vendor prefix for LEGO"
    f95d6058d5cc uapi: fix linux/rds.h userspace compilation errors
    3323d07612b2 uapi: fix linux/rds.h userspace compilation error
    3f0cc54226ca Revert "uapi: fix linux/rds.h userspace compilation errors"
    d8ce2b0874a7 Revert "crypto: xts - Add ECB dependency"
    d7df7af5b9b6 MIPS: Netlogic: Exclude netlogic,xlp-pic code from XLR builds
    ade4b22d47bb MIPS: traps: Ensure L1 & L2 ECC checking match for CM3 systems
    73b6038950cd MIPS: init: Ensure reserved memory regions are not added to bootmem
    6539d1ca4fc9 MIPS: init: Ensure bootmem does not corrupt reserved memory
    3b0f619cd4b9 MIPS: End asm function prologue macros with .insn
    b53bab72b9d8 staging: greybus: add host device function pointer checks
    1f5a7caba79e staging: wilc1000: Fix endian sparse warning
    ca24e702ccfa staging: rtl8712: fixed little endian problem
    ef417b59c222 ixgbe: do not disable FEC from the driver
    bc656fda2442 ixgbe: add mask for 64 RSS queues
    7316fb33f0a5 ixgbe: Reduce I2C retry count on X550 devices
    e15dad31b10b ixgbe: Fix reporting of 100Mb capability
    3bed7d680acf ixgbe: handle close/suspend race with netif_device_detach/present
    6a4ef8b6ceeb ixgbe: fix AER error handling
    6c7999904f32 ixgbe: Configure advertised speeds correctly for KR/KX backplane
    5d820f84e169 arm64: dts: NS2: reserve memory for Nitro firmware
    f6e94c2c16fe ALSA: hda/realtek - Add new codec ID ALC299
    0e2245ab6901 gpu: drm: mgag200: mgag200_main:- Handle error from pci_iomap
    473286bdd58d backlight: adp5520: Fix error handling in adp5520_bl_probe()
    6aaf9ba9bde7 backlight: lcd: Fix race condition during register
    acc365c02859 drm/omap: panel-sony-acx565akm.c: Add MODULE_ALIAS
    5d1d893d31ce ALSA: vx: Fix possible transfer overflow
    0f4ea85748bf ALSA: vx: Don't try to update capture stream before running
    9dc7637700e5 power: supply: axp288_fuel_gauge: Read 12 bit values 2 registers at a time
    0010542d3f79 power: supply: axp288_fuel_gauge: Read 15 bit values 2 registers at a time
    d9a5790b2145 rtc: rx8010: change lock mechanism
    cb341679a5b4 scsi: lpfc: Clear the VendorVersion in the PLOGI/PLOGI ACC payload
    235d82cb46d2 scsi: lpfc: Correct issue leading to oops during link reset
    f89885d40a5f scsi: lpfc: Correct host name in symbolic_name field
    b4e42f5d0116 scsi: lpfc: FCoE VPort enable-disable does not bring up the VPort
    01347f537f6c scsi: lpfc: Add missing memory barrier
    d9b035e70426 x86/irq, trace: Add __irq_entry annotation to x86's platform IRQ handlers
    f7d1861153d4 staging: rtl8188eu: fix incorrect ERROR tags from logs
    fe975496da30 tcp: provide timestamps for partial writes
    cfb09f0571a5 scsi: ufs: add capability to keep auto bkops always enabled
    ea56533994fe scsi: ufs-qcom: Fix module autoload
    0ef1e72e73fe igb: Fix hw_dbg logging in igb_update_flash_i210
    64da1e5ea30d igb: close/suspend race in netif_device_detach
    2aed3814969b igb: reset the PHY before reading the PHY ID
    38fa955da251 drm/sti: sti_vtg: Handle return NULL error from devm_ioremap_nocache
    02c7292bb7ee ata: SATA_MV should depend on HAS_DMA
    cece64a6107c ata: SATA_HIGHBANK should depend on HAS_DMA
    1122c15f0a96 ata: ATA_BMDMA should depend on HAS_DMA
    15a65b946c61 ARM: dts: omap5-uevm: Allow bootloader to configure USB Ethernet MAC
    c26fa1306c80 ARM: dts: Fix omap3 off mode pull defines
    e96a11f64b81 ARM: OMAP2+: Fix init for multiple quirks for the same SoC
    db458f6e6110 ARM: dts: Fix am335x and dm814x scm syscon to probe children
    f022fa1b61e5 ARM: dts: Fix compatible for ti81xx uarts for 8250
    e17a5a8fc0bd fm10k: request reset when mbx->state changes
    6202042b7428 extcon: palmas: Check the parent instance to prevent the NULL
    c4a77534ce2b extcon: Remove potential problem when calling extcon_register_notifier()
    ee61d06653fd Bluetooth: btusb: fix QCA Rome suspend/resume
    a5bd3edda619 arm: crypto: reduce priority of bit-sliced AES cipher
    49c1e5f03238 media: dib0700: fix invalid dvb_detach argument
    ca98a5c72170 media: imon: Fix null-ptr-deref in imon_probe
    ea88d5c5f411 Linux 4.9.63
    e81b96cab11f misc: panel: properly restore atomic counter on error path
    b2dbcb7c969d qla2xxx: Fix incorrect tcm_qla2xxx_free_cmd use during TMR ABORT (v2)
    ff4927181666 target/iscsi: Fix iSCSI task reassignment handling
    e7c9ca5a3f46 brcmfmac: remove setting IBSS mode when stopping AP
    31c8c4942820 security/keys: add CONFIG_KEYS_COMPAT to Kconfig
    a23349bb9f12 netfilter: nat: Revert "netfilter: nat: convert nat bysrc hash to rhashtable"
    25db12f1c584 netfilter: nat: avoid use of nf_conn_nat extension
    fd1ca9fea458 Revert "ARM: dts: imx53-qsb-common: fix FEC pinmux config"
    1862eca99e27 ALSA: seq: Cancel pending autoload work at unbinding device
    9d65d0ea55dc Input: ims-psu - check if CDC union descriptor is sane
    8cf061d919e2 usb: usbtest: fix NULL pointer dereference
    ddd95bc900ae mac80211: don't compare TKIP TX MIC key in reinstall prevention
    38762a516e0c mac80211: use constant time comparison with keys
    2586fa0007dc mac80211: accept key reinstall without changing anything
    ac4cfc730e4b ppp: fix race in ppp device destruction
    7b9870f07854 net_sched: avoid matching qdisc with zero handle
    b89fc6a5caff sctp: reset owner sk for data chunks on out queues when migrating a sock
    210a6418730b tun: allow positive return values on dev_get_valid_name() call
    d6b1aebcd7a5 ip6_gre: update dst pmtu if dev mtu has been updated by toobig in __gre6_xmit
    6d428bc40a42 ip6_gre: only increase err_count for some certain type icmpv6 in ip6gre_err
    df0eebcea8e5 ipip: only increase err_count for some certain type icmp in ipip_err
    fbf92277e6d2 tap: double-free in error path in tap_open()
    62de3fe46c6b net/unix: don't show information about sockets from other namespaces
    2af59c6557a5 tcp/dccp: fix other lockdep splats accessing ireq_opt
    3107d4dc7a80 tcp/dccp: fix lockdep splat in inet_csk_route_req()
    ec5caf542066 sctp: full support for ipv6 ip_nonlocal_bind & IP_FREEBIND
    28fa583fd8ce ipv6: flowlabel: do not leave opt->tot_len with garbage
    3b0b4d2c47ec soreuseport: fix initialization race
    57ffb0ecf367 packet: avoid panic in packet_getsockopt()
    2ffd26133724 tcp/dccp: fix ireq->opt races
    bcb9ced1833c sctp: add the missing sock_owned_by_user check in sctp_icmp_redirect
    3e2ab0ceef68 tun: call dev_get_valid_name() before register_netdevice()
    9075216b8b93 l2tp: check ps->sock before running pppol2tp_session_ioctl()
    e12c42c55287 tcp: fix tcp_mtu_probe() vs highest_sack
    cb5880e677a1 net: call cgroup_sk_alloc() earlier in sk_clone_lock()
    4cd69ad53001 netlink: do not set cb_running if dump's start() errs
    d87890d9ff15 ipv6: addrconf: increment ifp refcount before ipv6_del_addr()
    5b9d20195a25 tun/tap: sanitize TUNSETSNDBUF input
    97ba8f88b448 gso: fix payload length when gso_size is zero
    9b609ba2c2df Linux 4.9.62
    e45d93b48c93 x86/oprofile/ppro: Do not use __this_cpu*() in preemptible context
    9d5e5994c5f9 x86/smpboot: Make optimization of delay calibration work correctly
    9313d039c4d0 can: c_can: don't indicate triple sampling support for D_CAN
    5e01a9f94e59 can: ifi: Fix transmitter delay calculation
    f45c1b09261b can: sun4i: handle overrun in RX FIFO
    bad4c8f1bc25 drm/bridge: adv7511: Re-write the i2c address before EDID probing
    6731d54c7868 drm/bridge: adv7511: Reuse __adv7511_power_on/off() when probing EDID
    efc6d340e410 drm/bridge: adv7511: Rework adv7511_power_on/off() so they can be reused internally
    55e7e5213817 drm/vmwgfx: Fix Ubuntu 17.10 Wayland black screen issue
    4f027e3c7b62 rbd: use GFP_NOIO for parent stat and data requests
    9f2ac3d8cb31 Input: elan_i2c - add ELAN060C to the ACPI table
    1331af440ad2 MIPS: AR7: Ensure that serial ports are properly set up
    76aaa788e92a MIPS: AR7: Defer registration of GPIO
    b17e663e150c MIPS: BMIPS: Fix missing cbr address
    bbc62fb031a6 ASoC: sun4i-spdif: remove legacy dapm components
    fb705ebf996e tools: firmware: check for distro fallback udev cancel rule
    ebf95a6f0286 selftests: firmware: send expected errors to /dev/null
    b98220399dc4 MIPS: SMP: Fix deadlock & online race
    3b9fd3333aaf MIPS: Fix race on setting and getting cpu_online_mask
    d99db83cafbf MIPS: SMP: Use a completion event to signal CPU up
    71bcb37ff5fa MIPS: Fix CM region target definitions
    16d5634e8827 MIPS: microMIPS: Fix incorrect mask in insn_table_MM
    7de694782cbe drm/i915: Do not rely on wm preservation for ILK watermarks
    b35783871190 ALSA: seq: Avoid invalid lockdep class warning
    4b52c3170bd8 ALSA: seq: Fix OSS sysex delivery in OSS emulation
    1541afbfb4a2 ARM: 8720/1: ensure dump_instr() checks addr_limit
    8ea52a683f81 KEYS: fix NULL pointer dereference during ASN.1 parsing [ver #2]
    2822bbb53269 crypto: x86/sha256-mb - fix panic due to unaligned access
    ca6c028e2fe4 crypto: x86/sha1-mb - fix panic due to unaligned access
    58ed8a47e450 crypto: ccm - preserve the IV buffer
    46f15501c5b7 workqueue: Fix NULL pointer dereference
    2715f6841a08 x86/uaccess, sched/preempt: Verify access_ok() context
    07e415ac5ca1 platform/x86: hp-wmi: Do not shadow error values
    0a18a94af43f platform/x86: hp-wmi: Fix error value for hp_wmi_tablet_state
    419ec342d312 KEYS: trusted: fix writing past end of buffer in trusted_read()
    64a234537a88 KEYS: trusted: sanitize all key material
    bddc61e7732b cdc_ncm: Set NTB format again after altsetting switch for Huawei devices
    047b67372d7b platform/x86: hp-wmi: Fix detection for dock and tablet mode
    0e1cfde447fe net: dsa: select NET_SWITCHDEV
    fa8f3a67b9a8 clk: mvebu: adjust AP806 CPU clock frequencies to production chip
    326ef0fd4fb2 IB/rxe: Fix reference leaks in memory key invalidation code
    93e1956dddf5 wcn36xx: Don't use the destroyed hal_mutex
    72eff92d84f0 s390/qeth: issue STARTLAN as first IPA command
    c4d567ef164e s390/qeth: fix retrieval of vipa and proxy-arp addresses
    e793ad50d151 ARM: dts: STiH410-family: fix wrong parent clock frequency
    d369bba84410 IB/ipoib: Change list_del to list_del_init in the tx object
    8b93cbd12547 sched/cputime, powerpc32: Fix stale scaled stime on context switch
    a3a76ea2c072 Input: mpr121 - set missing event capability
    260e2e82c247 Input: mpr121 - handle multiple bits change of status register
    0ddb64c14856 s390/topology: make "topology=off" parameter work
    8b45f832b33b EDAC, amd64: Save and return err code from probe_one_instance()
    e41c105195ca IPsec: do not ignore crypto err in ah4 input
    ab71bee531fd apparmor: fix undefined reference to `aa_g_hash_policy'
    c944dc7aedfb rt2800usb: mark tx failure on timeout
    be5125d4fa9e brcmfmac: setup wiphy bands after registering it first
    c5493c6e4a6a netfilter: nft_meta: deal with PACKET_LOOPBACK in netdev family
    a7eba17c44f3 usb: hcd: initialize hcd->flags to 0 when rm hcd
    397b6e5d7bbe libertas: fix improper return value
    2ae9f47ce114 serial: sh-sci: Fix register offsets for the IRDA serial port
    a88a90128888 phy: increase size of MII_BUS_ID_SIZE and bus_id
    04e13a5ec96d dt-bindings: Add vendor prefix for LEGO
    852bf68b7a62 dt-bindings: Add LEGO MINDSTORMS EV3 compatible specification
    f89e669323ad iio: proximity: sx9500: claim direct mode during raw proximity reads
    6d8897645b98 iio: magnetometer: mag3110: claim direct mode during raw writes
    87e4965cec61 iio: pressure: ms5611: claim direct mode during oversampling changes
    19d0541bd2c2 iio: trigger: free trigger resource correctly
    6bcd1787b587 drm: mali-dp: fix Lx_CONTROL register fields clobber
    9c9040a85966 crypto: vmx - disable preemption to enable vsx in aes_ctr.c
    dea9c75f3f62 arm64: dma-mapping: Only swizzle DMA ops for IOMMU_DOMAIN_DMA
    d2e589f305b0 ARM: omap2plus_defconfig: Fix probe errors on UARTs 5 and 6
    870b502a0208 cxl: Force psl data-cache flush during device shutdown
    f88f299a94e0 powerpc/corenet: explicitly disable the SDHC controller on kmcoge4
    a4193ceee266 pinctrl: baytrail: Fix debugfs offset output
    3a8ab788bf01 iommu/arm-smmu-v3: Clear prior settings when updating STEs
    6f51c8a58397 KVM: PPC: Book 3S: XICS: correct the real mode ICP rejecting counter
    61fdf68034a9 drm: drm_minor_register(): Clean up debugfs on failure
    872c075b6cb2 clk: samsung: exynos5433: Add IDs for PHYCLK_MIPIDPHY0_* clocks
    a276210915d5 PM / OPP: Error out on failing to add static OPPs for v1 bindings
    7422c5813a9d EDAC, amd64: Add x86cpuid sanity check during init
    2f945e749ee2 dt-bindings: clockgen: Add compatible string for LS1012A
    62b9fa2c436f ARM: dts: imx53-qsb-common: fix FEC pinmux config
    a1644f9c78e4 xen/netback: set default upper limit of tx/rx queues to 8
    6da1c989ccce sched/core: Add missing update_rq_clock() call in sched_move_task()
    7ac8a10c8a50 PCI: mvebu: Handle changes to the bridge windows while enabled
    bf41c17c2266 video: fbdev: pmag-ba-fb: Remove bad `__init' annotation
    95e5e7ed5a8a adv7604: Initialize drive strength to default when using DT

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 8692d7256479..e1bf32fdd24c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "83c2338cc34980927eedc81cb4930524b51b717a"
-SRCREV_meta ?= "f4e37e151102d89c4d0e110c88eb3b3c36bdeaa4"
+SRCREV_machine ?= "d256d615488efc2d0b26f3eff206c6bfa765b339"
+SRCREV_meta ?= "10f8ed198a4188625c9b5ac59de4d691b56a2617"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.61"
+LINUX_VERSION ?= "4.9.65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 5a99d719c8ef..704e6758dad9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.61"
+LINUX_VERSION ?= "4.9.65"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d8520539587665c19a0afc97858069184574da66"
-SRCREV_meta ?= "f4e37e151102d89c4d0e110c88eb3b3c36bdeaa4"
+SRCREV_machine ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
+SRCREV_meta ?= "10f8ed198a4188625c9b5ac59de4d691b56a2617"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index c13dc2d71f8a..9ddaec7d3f9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a87b6d44fdde992b83a476cf9f1ad2772ebb7da0"
-SRCREV_machine_qemuarm64 ?= "d8520539587665c19a0afc97858069184574da66"
-SRCREV_machine_qemumips ?= "38ee2d051cba9ff9a045e67d9ebf2f9516fdcf47"
-SRCREV_machine_qemuppc ?= "d8520539587665c19a0afc97858069184574da66"
-SRCREV_machine_qemux86 ?= "d8520539587665c19a0afc97858069184574da66"
-SRCREV_machine_qemux86-64 ?= "d8520539587665c19a0afc97858069184574da66"
-SRCREV_machine_qemumips64 ?= "6219773456cdce10ab481da6718f715fc3e30ba7"
-SRCREV_machine ?= "d8520539587665c19a0afc97858069184574da66"
-SRCREV_meta ?= "f4e37e151102d89c4d0e110c88eb3b3c36bdeaa4"
+SRCREV_machine_qemuarm ?= "d4807f91ce5fd40b64e11c96fb83a27b99758175"
+SRCREV_machine_qemuarm64 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
+SRCREV_machine_qemumips ?= "27a5a33ab1bbb0838d2ccd446b1e29d797811d7b"
+SRCREV_machine_qemuppc ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
+SRCREV_machine_qemux86 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
+SRCREV_machine_qemux86-64 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
+SRCREV_machine_qemumips64 ?= "db1b582e665b95ddf87b75acce3a42660289d4ca"
+SRCREV_machine ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
+SRCREV_meta ?= "10f8ed198a4188625c9b5ac59de4d691b56a2617"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.61"
+LINUX_VERSION ?= "4.9.65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


