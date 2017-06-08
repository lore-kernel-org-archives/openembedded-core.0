Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 341F47823D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v58JM32l026402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Jun 2017 12:22:03 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 12:22:03 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Jun 2017 15:21:56 -0400
Message-ID: <fb2b5422c45a4707945b50421dbdaa21a3bc5bda.1496949552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1496949552.git.bruce.ashfield@windriver.com>
References: <cover.1496949552.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/4.4: update to v4.4.71
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
X-List-Received-Date: Thu, 08 Jun 2017 19:22:03 -0000
Content-Type: text/plain

Updating the the latest 4.4 -stable release which comprises the
following commits:

4bbbc7696405 Linux 4.4.71
9d65be36a7cc xfs: only return -errno or success from attr ->put_listent
1b03d85a4f37 xfs: in _attrlist_by_handle, copy the cursor back to userspace
c56605c69ba6 xfs: fix unaligned access in xfs_btree_visit_blocks
9f7b5da0570f xfs: bad assertion for delalloc an extent that start at i_size
3ba13d7f5b2b xfs: fix indlen accounting error on partial delalloc conversion
1d41dd5c1fd6 xfs: wait on new inodes during quotaoff dquot release
9d97d6a15265 xfs: update ag iterator to support wait on new inodes
8e25af0dc5ad xfs: support ability to wait on new inodes
cf55c35974e1 xfs: fix up quotacheck buffer list error handling
a76647a71c8e xfs: prevent multi-fsb dir readahead from reading random blocks
8caa9a54b32b xfs: handle array index overrun in xfs_dir2_leaf_readbuf()
0ace12c11401 xfs: fix over-copying of getbmap parameters from userspace
fe705621b9b4 xfs: fix off-by-one on max nr_pages in xfs_find_get_desired_pgoff()
b9a7816997a3 xfs: Fix missed holes in SEEK_HOLE implementation
03489bfc7830 mlock: fix mlock count can not decrease in race condition
7e13bab109ea mm/migrate: fix refcount handling when !hugepage_migration_supported()
4e4b72c0ee3d drm/gma500/psb: Actually use VBT mode when it is found
14bfe118dd7d slub/memcg: cure the brainless abuse of sysfs attributes
023a8b0925be ALSA: hda - apply STAC_9200_DELL_M22 quirk for Dell Latitude D430
85ddc41a6c4a pcmcia: remove left-over %Z format
69877793e23d drm/radeon: Unbreak HPD handling for r600+
15de2e4c90b7 drm/radeon/ci: disable mclk switching for high refresh rates (v2)
3529600b1601 scsi: mpt3sas: Force request partial completion alignment
58b7cb10f6e2 HID: wacom: Have wacom_tpc_irq guard against possible NULL dereference
c0fd730b678d mmc: sdhci-iproc: suppress spurious interrupt with Multiblock read
2ca57fc82436 i2c: i2c-tiny-usb: fix buffer not being DMA capable
1b5286ba9f13 vlan: Fix tcp checksum offloads in Q-in-Q vlans
e989f9bf2a9d net: phy: marvell: Limit errata to 88m1101
605b6b2b4d8a netem: fix skb_orphan_partial()
338f665acb4b ipv4: add reference counting to metrics
97f54575ff57 sctp: fix ICMP processing if skb is non-linear
fe22b6005538 tcp: avoid fastopen API to be used on AF_UNSPEC
d7ed7fcecf20 virtio-net: enable TSO/checksum offloads for Q-in-Q vlans
8380f16d0702 be2net: Fix offload features for Q-in-Q packets
38f02f2ce0ca ipv6: fix out of bound writes in __ip6_append_data()
3a854210f9a5 bridge: start hello_timer when enabling KERNEL_STP in br_stp_start
b543ccc4f627 qmi_wwan: add another Lenovo EM74xx device ID
94c0bf3cbb99 bridge: netlink: check vlan_default_pvid range
f76d54a8882e ipv6: Check ip6_find_1stfragopt() return value properly.
017fabead5c2 ipv6: Prevent overrun when parsing v6 header options
640bfcf232a9 net: Improve handling of failures on link and route dumps
7ede5c90fcdd tcp: eliminate negative reordering in tcp_clean_rtx_queue
ffa551def59c sctp: do not inherit ipv6_{mc|ac|fl}_list from parent
704e6c6b8651 sctp: fix src address selection if using secondary addresses for ipv6
90e3f8a55871 tcp: avoid fragmenting peculiar skbs in SACK
182abc4e74a1 s390/qeth: avoid null pointer dereference on OSN
21b871582375 s390/qeth: unbreak OSM and OSN support
2ac37098ee3d s390/qeth: handle sysfs error during initialization
d1428ee54073 ipv6/dccp: do not inherit ipv6_mc_list from parent
5f67a1663c03 dccp/tcp: do not inherit mc_list from parent
b9978c27454c sparc: Fix -Wstringop-overflow warning
b409ba3b0535 Linux 4.4.70
837bfdb41337 drivers: char: mem: Check for address space wraparound with mmap()
52cf24769487 nfsd: encoders mustn't use unitialized values in error cases
da922dc48dcf drm/edid: Add 10 bpc quirk for LGD 764 panel in HP zBook 17 G2
bc428e94070e PCI: Freeze PME scan before suspending devices
5f36c8b4e4a3 PCI: Fix pci_mmap_fits() for HAVE_PCI_RESOURCE_TO_USER platforms
6384f782a69c tracing/kprobes: Enforce kprobes teardown after testing
d5fb96b955ff osf_wait4(): fix infoleak
e07db0d720d3 genirq: Fix chained interrupt data ordering
1736f2b3de62 uwb: fix device quirk on big-endian hosts
ca19dd15e7bb metag/uaccess: Check access_ok in strncpy_from_user
2d9b2e780832 metag/uaccess: Fix access_ok()
98d5e84363ea iommu/vt-d: Flush the IOTLB to get rid of the initial kdump mappings
cb89b1f9dff9 staging: rtl8192e: rtl92e_get_eeprom_size Fix read size of EPROM_CMD.
427907e599fa staging: rtl8192e: fix 2 byte alignment of register BSSIDR.
8b26f53bf026 mm/huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp
f03484fd5a3a xc2028: Fix use-after-free bug properly
e0188a556da6 arm64: documentation: document tagged pointer stack constraints
06dd8281a7d3 arm64: uaccess: ensure extension of access_ok() addr
c23fee69f5b5 arm64: xchg: hazard against entire exchange variable
acbab784a9b6 ARM: dts: at91: sama5d3_xplained: not all ADC channels are available
6ae3be7167b7 ARM: dts: at91: sama5d3_xplained: fix ADC vref
1ab43a598996 powerpc/64e: Fix hang when debugging programs with relocated kernel
33c0c0f8edb9 powerpc/pseries: Fix of_node_put() underflow during DLPAR remove
a86b9ecf1158 powerpc/book3s/mce: Move add_taint() later in virtual mode
f3ffc64bf3dd cx231xx-cards: fix NULL-deref at probe
3208e455284b cx231xx-audio: fix NULL-deref at probe
bd14c18861c7 cx231xx-audio: fix init error path
f7c778fa707d dvb-frontends/cxd2841er: define symbol_rate_min/max in T/C fe-ops
e5a9ebb4387a zr364xx: enforce minimum size when reading header
a6e0caa34715 dib0700: fix NULL-deref at probe
a896652f6ad3 s5p-mfc: Fix unbalanced call to clock management
fc9753aa6ce9 gspca: konica: add missing endpoint sanity check
04f522476a26 ceph: fix recursion between ceph_set_acl() and __ceph_setattr()
0e9e19a66530 iio: proximity: as3935: fix as3935_write
8a5b15e198f1 ipx: call ipxitf_put() in ioctl error path
4ae1efc7cc98 USB: hub: fix non-SS hub-descriptor handling
af4e23402409 USB: hub: fix SS hub-descriptor handling
1e6e9c4c36f9 USB: serial: io_ti: fix div-by-zero in set_termios
4be0ae3d314c USB: serial: mct_u232: fix big-endian baud-rate handling
704f23f20c5e USB: serial: qcserial: add more Lenovo EM74xx device IDs
1c7f99aa2979 usb: serial: option: add Telit ME910 support
319be2ab4731 USB: iowarrior: fix info ioctl on big-endian hosts
1beae7405705 usb: musb: tusb6010_omap: Do not reset the other direction's packet size
5cbfae4ad360 ttusb2: limit messages to buffer size
9737909ff9d4 mceusb: fix NULL-deref at probe
f05c0dfd394f usbvision: fix NULL-deref at probe
14d0cafd3f95 net: irda: irda-usb: fix firmware name on big-endian hosts
ec0b553bd8df usb: host: xhci-mem: allocate zeroed Scratchpad Buffer
c0791b605fac xhci: apply PME_STUCK_QUIRK and MISSING_CAS quirk for Denverton
65ba07489dcd usb: host: xhci-plat: propagate return value of platform_get_irq()
ada79b5ecda7 sched/fair: Initialize throttle_count for new task-groups lazily
f01ae9cb0de2 sched/fair: Do not announce throttled next buddy in dequeue_task_fair()
ae3d7b8931eb fscrypt: avoid collisions when presenting long encrypted filenames
129a883b0191 f2fs: check entire encrypted bigname when finding a dentry
269d8211c400 fscrypt: fix context consistency check when key(s) unavailable
0aa3b8ef6975 net: qmi_wwan: Add SIMCom 7230E
22823e95193a ext4 crypto: fix some error handling
0a76f023e6f2 ext4 crypto: don't let data integrity writebacks fail with ENOMEM
f0486aa7bc80 USB: serial: ftdi_sio: add Olimex ARM-USB-TINY(H) PIDs
16ac61cf707c USB: serial: ftdi_sio: fix setting latency for unprivileged users
6a70a5833ecc pid_ns: Fix race between setns'ed fork() and zap_pid_ns_processes()
ddf9b92f12dd pid_ns: Sleep in TASK_INTERRUPTIBLE in zap_pid_ns_processes
060d2642682e iio: dac: ad7303: fix channel description
14323b731072 of: fix sparse warning in of_pci_range_parser_one
000959316365 proc: Fix unbalanced hard link numbers
d22b933fb8eb cdc-acm: fix possible invalid access when processing notification
e4add1cf6b41 drm/nouveau/tmr: handle races with hw when updating the next alarm time
9d78e40f5f41 drm/nouveau/tmr: avoid processing completed alarms when adding a new one
5e07724c28f4 drm/nouveau/tmr: fix corruption of the pending list when rescheduling an alarm
27f82df2f026 drm/nouveau/tmr: ack interrupt before processing alarms
3819271d8a5f drm/nouveau/therm: remove ineffective workarounds for alarm bugs
7d2d6022807a drm/amdgpu: Make display watermark calculations more accurate
349666cfbe76 drm/amdgpu: Avoid overflows/divide-by-zero in latency_watermark calculations.
670a7c5db22e ath9k_htc: fix NULL-deref at probe
8431037ba10b ath9k_htc: Add support of AirTies 1eda:2315 AR9271 device
c26190b5378d s390/cputime: fix incorrect system time
d1f8ea3bd095 s390/kdump: Add final note
de74aedd71c0 regulator: tps65023: Fix inverted core enable logic.
6d380f50113c KVM: X86: Fix read out-of-bounds vulnerability in kvm pio emulation
e9c9e7588ef5 KVM: x86: Fix load damaged SSEx MXCSR register
08e589a97d38 ima: accept previously set IMA_NEW_FILE
0c99c8a22cc4 mwifiex: pcie: fix cmd_buf use-after-free in remove/reset
e367d1b00f81 rtlwifi: rtl8821ae: setup 8812ae RFE according to device type
c5ff397f075e md: update slab_cache before releasing new stripes when stripes resizing
d3df9403c075 dm space map disk: fix some book keeping in the disk space map
1dc9fb3cc12e dm thin metadata: call precommit before saving the roots
ea4889d6f39d dm bufio: make the parameter "retain_bytes" unsigned long
4a9631ffe520 dm cache metadata: fail operations if fail_io mode has been established
8d8fb01a62f2 dm bufio: check new buffer allocation watermark every 30 seconds
5d1df36c9d2c dm bufio: avoid a possible ABBA deadlock
4df4bf1df916 dm raid: select the Kconfig option CONFIG_MD_RAID0
fa499b361bd4 dm btree: fix for dm_btree_find_lowest_key()
c04397351fe5 infiniband: call ipv6 route lookup via the stub interface
63450e38efe3 tpm_crb: check for bad response size
025e33ee387a ARM: tegra: paz00: Mark panel regulator as enabled on boot
b171ce6c5e41 USB: core: replace %p with %pK
cda5c7e625ce char: lp: fix possible integer overflow in lp_setup()
ea99c2248495 watchdog: pcwd_usb: fix NULL-deref at probe
ca157f64dc9c USB: ene_usb6250: fix DMA to the stack
b572de59915e usb: misc: legousbtower: Fix memory leak
8a7f9dfbd4ae usb: misc: legousbtower: Fix buffers on stack
bb56ca291305 Linux 4.4.69
35df2085ec02 ipmi: Fix kernel panic at ipmi_ssif_thread()
d4392269f7ce wlcore: Add RX_BA_WIN_SIZE_CHANGE_EVENT event
4b86b46ef410 wlcore: Pass win_size taken from ieee80211_sta to FW
8ef67e0078b3 mac80211: RX BA support for sta max_rx_aggregation_subframes
d13333edbcc7 mac80211: pass block ack session timeout to to driver
0fe94dd915fd mac80211: pass RX aggregation window size to driver
f85e0c5f592c Bluetooth: hci_intel: add missing tty-device sanity check
bf3feec82ce3 Bluetooth: hci_bcm: add missing tty-device sanity check
ff1c4cf24642 Bluetooth: Fix user channel for 32bit userspace on 64bit kernel
9bd2cc56a089 tty: pty: Fix ldisc flush after userspace become aware of the data already
814c2bac9032 serial: omap: suspend device on probe errors
a52e1012585f serial: omap: fix runtime-pm handling on unbind
605fa1a2aa03 serial: samsung: Use right device for DMA-mapping calls
db467fee7ffb arm64: KVM: Fix decoding of Rt/Rt2 when trapping AArch32 CP accesses
f08bc4d63377 padata: free correct variable
9f4ba9062c2c CIFS: add misssing SFM mapping for doublequote
9a4050669919 cifs: fix CIFS_IOC_GET_MNT_INFO oops
a8900a64eabf CIFS: fix mapping of SFM_SPACE and SFM_PERIOD
b85fa4129e7a SMB3: Work around mount failure when using SMB3 dialect to Macs
89d23005fd63 Set unicode flag on cifs echo request to avoid Mac error
7aad381af8c3 fs/block_dev: always invalidate cleancache in invalidate_bdev()
bb7031c7e50f ceph: fix memory leak in __ceph_setxattr()
eb04a7344c83 fs/xattr.c: zero out memory copied to userspace in getxattr
a3e6be0e9447 ext4: evict inline data when writing to memory map
ab7ebca418bb IB/mlx4: Reduce SRIOV multicast cleanup warning message to debug level
1ad689bdc12d IB/mlx4: Fix ib device initialization error flow
1360f4301c78 IB/IPoIB: ibX: failed to create mcg debug file
1549c883d39b IB/core: Fix sysfs registration error flow
d96bb545d6ff vfio/type1: Remove locked page accounting workqueue
341adf516842 dm era: save spacemap metadata root after the pre-commit
dcd4004ae521 crypto: algif_aead - Require setkey before accept(2)
21cb4dc57b3c block: fix blk_integrity_register to use template's interval_exp if not 0
cbaeca8251bb KVM: arm/arm64: fix races in kvm_psci_vcpu_on
7b268351860c KVM: x86: fix user triggerable warning in kvm_apic_accept_events()
a2d5dcf338ea um: Fix PTRACE_POKEUSER on x86_64
b8cd9dd513bf x86, pmem: Fix cache flushing for iovec write < 8 bytes
d34ecdc9712c selftests/x86/ldt_gdt_32: Work around a glibc sigaction() bug
e89233f53e3d x86/boot: Fix BSS corruption/overwrite bug in early x86 kernel startup
3d3ca81d5e35 usb: hub: Do not attempt to autosuspend disconnected devices
0b4dad7c2cf4 usb: hub: Fix error loop seen after hub communication errors
7cad8a47ca94 usb: Make sure usb/phy/of gets built-in
6c3785cca656 usb: misc: add missing continue in switch
d3c04901f750 staging: comedi: jr3_pci: cope with jiffies wraparound
7fc6659b19a2 staging: comedi: jr3_pci: fix possible null pointer dereference
5ac489a80ffb staging: gdm724x: gdm_mux: fix use-after-free on module unload
265500bf9802 staging: vt6656: use off stack for out buffer USB transfers.
9d3c45786f27 staging: vt6656: use off stack for in buffer USB transfers.
de9d2d297ebe USB: Proper handling of Race Condition when two USB class drivers try to call init_usb_class simultaneously
fcd9a083cd22 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit
af3c8bf0e06b usb: host: xhci: print correct command ring address
8e1a740a5d66 iscsi-target: Set session_fall_back_to_erl0 when forcing reinstatement
6cd0200a9554 target: Convert ACL change queue_depth se_session reference usage
de41b0e12d6e target/fileio: Fix zero-length READ and WRITE handling
a1c2b01c310a target: Fix compare_and_write_callback handling for non GOOD status
8e209a07b106 xen: adjust early dom0 p2m handling to xen hypervisor behavior

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 3946e1d89b8d..4ad799058b9a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cb23b8e3ce0ad77acb717e249b4821c8350f1c83"
-SRCREV_meta ?= "877a7cd7da402200aab62dcc8583134d0947fa30"
+SRCREV_machine ?= "b0b44854bfb7f7ea10890ab8d8fff936be7e37da"
+SRCREV_meta ?= "c3f8900923a7b56ea6231d31a1a4e81306156dc5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.67"
+LINUX_VERSION ?= "4.4.71"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 0bc9205c2441..3f987a905173 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.67"
+LINUX_VERSION ?= "4.4.71"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_meta ?= "877a7cd7da402200aab62dcc8583134d0947fa30"
+SRCREV_machine ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
+SRCREV_meta ?= "c3f8900923a7b56ea6231d31a1a4e81306156dc5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 589531866749..2643415429d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "114f5a4f97fe44ac95c3e0ed370bd932b9296510"
-SRCREV_machine_qemuarm64 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_machine_qemumips ?= "b0b3b8012a49293e98ba7601af03ee2e02ddbc85"
-SRCREV_machine_qemuppc ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_machine_qemux86 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_machine_qemux86-64 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_machine_qemumips64 ?= "a9b8241a0c0e7626baba529abb4940831ff3a83e"
-SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_meta ?= "877a7cd7da402200aab62dcc8583134d0947fa30"
+SRCREV_machine_qemuarm ?= "dbf351c65cf492518339ac1ee0ecb02de4beb313"
+SRCREV_machine_qemuarm64 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
+SRCREV_machine_qemumips ?= "80509fd80a3457f74c716e5018378efb75a35934"
+SRCREV_machine_qemuppc ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
+SRCREV_machine_qemux86 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
+SRCREV_machine_qemux86-64 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
+SRCREV_machine_qemumips64 ?= "dfd0bad7365562bf39b16630c59dcb4b18a09396"
+SRCREV_machine ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
+SRCREV_meta ?= "c3f8900923a7b56ea6231d31a1a4e81306156dc5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.67"
+LINUX_VERSION ?= "4.4.71"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


