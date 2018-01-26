Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E0678830
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0QDxSSc011516
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 26 Jan 2018 05:59:28 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:14 -0500
Message-ID: <0831d64cda15105a64d2a460c42a8d0d628aa5f0.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] linux-yocto/4.4: update to 4.4.99
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:28 -0000
Content-Type: text/plain

Integrating the korg stable updates that comprise the following
commits:

   0cbac004e673 Linux 4.4.99
   e8d650563c5f misc: panel: properly restore atomic counter on error path
   01000c56cacc target: Fix node_acl demo-mode + uncached dynamic shutdown regression
   4063c2093349 target/iscsi: Fix iSCSI task reassignment handling
   7ecc076a5d51 brcmfmac: remove setting IBSS mode when stopping AP
   d27383faf144 tipc: fix link attribute propagation bug
   c8f13916c4c9 security/keys: add CONFIG_KEYS_COMPAT to Kconfig
   11fa3353205e tcp/dccp: fix other lockdep splats accessing ireq_opt
   6f8048cd59d7 tcp/dccp: fix lockdep splat in inet_csk_route_req()
   13eddc67565a tcp/dccp: fix ireq->opt races
   b9b0c99a426a ipip: only increase err_count for some certain type icmp in ipip_err
   9bae2ffb87d6 ppp: fix race in ppp device destruction
   4b5bb7723da1 sctp: reset owner sk for data chunks on out queues when migrating a sock
   bcb3b90cf3c8 tun: allow positive return values on dev_get_valid_name() call
   5c8a0850bae2 ip6_gre: only increase err_count for some certain type icmpv6 in ip6gre_err
   93b12f202a4e net/unix: don't show information about sockets from other namespaces
   84237c54b239 ipv6: flowlabel: do not leave opt->tot_len with garbage
   d552c8c5007a packet: avoid panic in packet_getsockopt()
   ef3a12f1dc4a sctp: add the missing sock_owned_by_user check in sctp_icmp_redirect
   4b27fe34a226 tun: call dev_get_valid_name() before register_netdevice()
   196f4755cc82 l2tp: check ps->sock before running pppol2tp_session_ioctl()
   71c4a0fc3576 tcp: fix tcp_mtu_probe() vs highest_sack
   735818a8b45c tun/tap: sanitize TUNSETSNDBUF input
   1e98fd54c356 ALSA: seq: Cancel pending autoload work at unbinding device
   b7c625ce6d27 Input: ims-psu - check if CDC union descriptor is sane
   de46c1adbea6 usb: usbtest: fix NULL pointer dereference
   c93df40f3c73 mac80211: don't compare TKIP TX MIC key in reinstall prevention
   cdac2028c901 mac80211: use constant time comparison with keys
   6440f0ee8a17 mac80211: accept key reinstall without changing anything
   c4e3d53bd9e7 Linux 4.4.98
   9c405157269d PKCS#7: fix unitialized boolean 'want'
   b01f1d60dd1c x86/oprofile/ppro: Do not use __this_cpu*() in preemptible context
   4df27e649308 can: c_can: don't indicate triple sampling support for D_CAN
   cdb5a2def61c can: sun4i: handle overrun in RX FIFO
   493cb19b2522 rbd: use GFP_NOIO for parent stat and data requests
   ba4828af60e2 drm/vmwgfx: Fix Ubuntu 17.10 Wayland black screen issue
   05b690ccb077 Input: elan_i2c - add ELAN060C to the ACPI table
   4694272c470a MIPS: AR7: Ensure that serial ports are properly set up
   721d4be9e05d MIPS: AR7: Defer registration of GPIO
   d0cfebd9b1db tools: firmware: check for distro fallback udev cancel rule
   4afaa496d7f3 selftests: firmware: send expected errors to /dev/null
   ed1deec127d9 selftests: firmware: add empty string and async tests
   c08f3a82f66f test: firmware_class: report errors properly on failure
   6004eb4d1adc MIPS: SMP: Fix deadlock & online race
   857e81041f69 MIPS: Fix race on setting and getting cpu_online_mask
   175c0622ab11 MIPS: SMP: Use a completion event to signal CPU up
   207c2143322c MIPS: Fix CM region target definitions
   ff8e97326b6a MIPS: microMIPS: Fix incorrect mask in insn_table_MM
   1e54b5f72115 ALSA: seq: Avoid invalid lockdep class warning
   adc4bacd5164 ALSA: seq: Fix OSS sysex delivery in OSS emulation
   4d5b67a54e6d ARM: 8720/1: ensure dump_instr() checks addr_limit
   3fc61b8dd6bb KEYS: fix NULL pointer dereference during ASN.1 parsing [ver #2]
   48276703a037 crypto: x86/sha1-mb - fix panic due to unaligned access
   44540ead8a8a workqueue: Fix NULL pointer dereference
   ad8c619750c4 x86/uaccess, sched/preempt: Verify access_ok() context
   44e0e2b47af2 platform/x86: hp-wmi: Do not shadow error values
   ce93b664540d platform/x86: hp-wmi: Fix error value for hp_wmi_tablet_state
   df5371592aca KEYS: trusted: fix writing past end of buffer in trusted_read()
   939cafad2f51 KEYS: trusted: sanitize all key material
   75f82a703b30 cdc_ncm: Set NTB format again after altsetting switch for Huawei devices
   5ffc673161be platform/x86: hp-wmi: Fix detection for dock and tablet mode
   f38a3a1c8f1a net: dsa: select NET_SWITCHDEV
   581243dc5528 s390/qeth: issue STARTLAN as first IPA command
   3652b0b6f2c2 IB/ipoib: Change list_del to list_del_init in the tx object
   aa4af0fca101 Input: mpr121 - set missing event capability
   0a731928f264 Input: mpr121 - handle multiple bits change of status register
   ffa6332b8d80 IPsec: do not ignore crypto err in ah4 input
   9ee83b03365a netfilter: nft_meta: deal with PACKET_LOOPBACK in netdev family
   cfb2cb34d32e usb: hcd: initialize hcd->flags to 0 when rm hcd
   6450c9a96ff3 serial: sh-sci: Fix register offsets for the IRDA serial port
   ca2090aa58ba phy: increase size of MII_BUS_ID_SIZE and bus_id
   079822da0a00 iio: trigger: free trigger resource correctly
   26fa336d69a2 crypto: vmx - disable preemption to enable vsx in aes_ctr.c
   30019ca7dc09 ARM: omap2plus_defconfig: Fix probe errors on UARTs 5 and 6
   83fe38f2c4a3 powerpc/corenet: explicitly disable the SDHC controller on kmcoge4
   158bc64a4dfe iommu/arm-smmu-v3: Clear prior settings when updating STEs
   f20065b466d4 KVM: PPC: Book 3S: XICS: correct the real mode ICP rejecting counter
   2393241b7a22 drm: drm_minor_register(): Clean up debugfs on failure
   4e0d26b22e79 xen/netback: set default upper limit of tx/rx queues to 8
   f3170e6607be PCI: mvebu: Handle changes to the bridge windows while enabled
   414aa11de923 video: fbdev: pmag-ba-fb: Remove bad `__init' annotation
   8a56b1b25e3c adv7604: Initialize drive strength to default when using DT
   c54d0707aa09 Linux 4.4.97
   2ed81e62b2ab staging: r8712u: Fix Sparse warning in rtl871x_xmit.c
   883706dcda17 xen: don't print error message in case of missing Xenstore entry
   298455f466cb bt8xx: fix memory leak
   4b7a35866b0c s390/dasd: check for device error pointer within state change interrupts
   45a012ace954 mei: return error on notification request to a disconnected client
   0e97077574c6 exynos4-is: fimc-is: Unmap region obtained by of_iomap()
   2d097e5f5c03 staging: lustre: ptlrpc: skip lock if export failed
   efa8f1b7a65a staging: lustre: hsm: stack overrun in hai_dump_data_field
   2d1d45396585 staging: lustre: llite: don't invoke direct_IO for the EOF case
   28a8fc6416ab platform/x86: intel_mid_thermal: Fix module autoload
   d1f96c30ce2d scsi: aacraid: Process Error for response I/O
   fff544c8cf68 xen/manage: correct return value check on xenbus_scanf()
   762d0762b9bb cx231xx: Fix I2C on Internal Master 3 Bus
   0806eaf13850 perf tools: Only increase index if perf_evsel__new_idx() succeeds
   3b7d9a95ccd3 drm/amdgpu: when dpm disabled, also need to stop/start vce.
   dec5fcf11b45 i2c: riic: correctly finish transfers
   358008062202 ext4: do not use stripe_width if it is not set
   5624ea161040 ext4: fix stripe-unaligned allocations
   a76eb0e8655e staging: rtl8712u: Fix endian settings for structs describing network packets
   f9776d7ee5f5 mfd: axp20x: Fix axp288 PEK_DBR and PEK_DBF irqs being swapped
   8800aba50292 mfd: ab8500-sysctrl: Handle probe deferral
   ed414aeb5291 ARM: pxa: Don't rely on public mmc header to include leds.h
   a3e021504fcf mmc: s3cmci: include linux/interrupt.h for tasklet_struct
   ba28f16cfa2a PM / wakeirq: report a wakeup_event on dedicated wekup irq
   b83c2880b348 Fix tracing sample code warning.
   a48fce662380 tracing/samples: Fix creation and deletion of simple_thread_fn creation
   ded34f972348 drm/msm: fix an integer overflow test
   031b02bc16ae drm/msm: Fix potential buffer overflow issue
   6e6eba5ba145 perf tools: Fix build failure on perl script context
   fa312b481b2b ocfs2: fstrim: Fix start offset of first cluster group during fstrim
   cc7d9933400f ARM: 8715/1: add a private asm/unaligned.h
   4e351b8dd8b7 ARM: dts: mvebu: pl310-cache disable double-linefill
   581ac5f431c9 arm64: ensure __dump_instr() checks addr_limit
   97d64b7f2fdf ASoC: adau17x1: Workaround for noise bug in ADC
   618b930317fb KEYS: fix out-of-bounds read during ASN.1 parsing
   97c5668c9724 KEYS: return full count in keyring_read() if buffer is too small
   d304c9169b38 cifs: check MaxPathNameComponentLength != 0 before using it
   8142e9516d5d ALSA: seq: Fix nested rwsem annotation for lockdep splat
   70358782743f ALSA: timer: Add missing mutex lock for compat ioctls
   27e68f1bca91 Linux 4.4.96
   b3d04695be52 Revert "drm: bridge: add DT bindings for TI ths8135"
   50044e419e83 ecryptfs: fix dereference of NULL user_key_payload
   da0933ceec96 x86/microcode/intel: Disable late loading on model 79
   a272dc770f7d regulator: fan53555: fix I2C device ids
   120ef1a38f79 can: kvaser_usb: Ignore CMD_FLUSH_QUEUE_REPLY messages
   c1b092102124 can: kvaser_usb: Correct return value in printout
   0c3cdb4536d1 can: sun4i: fix loopback mode
   62b54cc63a1c scsi: sg: Re-fix off by one in sg_fill_request_table()
   6e9abbc96411 scsi: zfcp: fix erp_action use-before-initialize in REC action trace
   1cbbd99f3bfe assoc_array: Fix a buggy node-splitting case
   2c99438cf66d Input: gtco - fix potential out-of-bound access
   31d770a8b887 Input: elan_i2c - add ELAN0611 to the ACPI table
   8b396ff8eee7 xen/gntdev: avoid out of bounds access in case of partial gntdev_mmap()
   82e05e935ffd fuse: fix READDIRPLUS skipping an entry
   7d74eecca960 spi: uapi: spidev: add missing ioctl header
   3505478d6fec usb: xhci: Handle error condition in xhci_stop_device()
   da0345d723f0 ceph: unlock dangling spinlock in try_flush_caps()
   5f1d33ab4d53 ALSA: hda - fix headset mic problem for Dell machines with alc236
   8c812f0335dd ALSA: hda/realtek - Add support for ALC236/ALC3204
   fce67b31c7cd workqueue: replace pool->manager_arb mutex with a flag
   9b36699635c5 Linux 4.4.95
   aa3a0a70bdb8 FS-Cache: fix dereference of NULL user_key_payload
   1bb1d4252d1e fscrypto: require write access to mount to set encryption policy
   8a004caec12b KEYS: Fix race between updating and finding a negative key
   1dda04c761ab fscrypt: fix dereference of NULL user_key_payload
   7d9e13d953f2 f2fs crypto: add missing locking for keyring_key access
   4db9f1113196 f2fs crypto: replace some BUG_ON()'s with error checks
   0f85c0954be4 sched/autogroup: Fix autogroup_move_group() to never skip sched_move_task()
   fcc65ab173eb parisc: Fix double-word compare and exchange in LWS code on 32-bit kernels
   558ca24dc296 parisc: Avoid trashing sr2 and sr3 in LWS code
   6f0dee7d9c9b pkcs7: Prevent NULL pointer dereference, since sinfo is not always set.
   33dea302f9bc KEYS: don't let add_key() update an uninstantiated key
   503ef5c070a1 lib/digsig: fix dereference of NULL user_key_payload
   2b7e02267d3c KEYS: encrypted: fix dereference of NULL user_key_payload
   51ba40fcfd67 rtlwifi: rtl8821ae: Fix connection lost problem
   cffdaa65e72f clockevents/drivers/cs5535: Improve resilience to spurious interrupts
   b178c94efdfd bus: mbus: fix window size calculation for 4GB windows
   260b6739e8b7 brcmsmac: make some local variables 'static const' to reduce stack size
   efdcbffb2b16 i2c: ismt: Separate I2C block read from SMBus block read
   68c610776cfb ALSA: hda: Remove superfluous '-' added by printk conversion
   f9e937124ec2 ALSA: seq: Enable 'use' locking in all configurations
   4516069f1b05 drm/nouveau/mmu: flush tlbs before deleting page tables
   195674adee57 drm/nouveau/bsp/g92: disable by default
   4d56587c28d4 can: esd_usb2: Fix can_dlc value for received RTR, frames
   aa629364c0e3 usb: musb: Check for host-mode using is_host_active() on reset interrupt
   583a4219841d usb: musb: sunxi: Explicitly release USB PHY on exit
   d68b07a19a9e can: gs_usb: fix busy loop if no more TX context is available
   f7d8b2e150ee ALSA: usb-audio: Add native DSD support for Pro-Ject Pre Box S2 Digital
   67e25805e748 usb: hub: Allow reset retry for USB2 devices on connect bounce
   d012ab210f5f usb: quirks: add quirk for WORLDE MINI MIDI keyboard
   d729f29a291f usb: cdc_acm: Add quirk for Elatec TWN3
   4512d6503a4d USB: serial: metro-usb: add MS7820 device id
   9dff499d8226 USB: core: fix out-of-bounds access bug in usb_get_bos_descriptor()
   abe43c97cae2 USB: devio: Revert "USB: devio: Don't corrupt user memory"
   af9a9a7bed51 Linux 4.4.94
   401231d063c5 Revert "tty: goldfish: Fix a parameter of a call to free_irq"
   cdbbea7809ca cpufreq: CPPC: add ACPI_PROCESSOR dependency
   c2c6f43e023a nfsd/callback: Cleanup callback cred on shutdown
   429a4ac5895d target/iscsi: Fix unsolicited data seq_end_offset calculation
   823ba64c5719 uapi: fix linux/mroute6.h userspace compilation errors
   028a419869e3 uapi: fix linux/rds.h userspace compilation errors
   c7a20ed2951f ceph: clean up unsafe d_parent accesses in build_dentry_path
   c128baf6a1bc i2c: at91: ensure state is restored after suspending
   d7ecae726698 net: mvpp2: release reference to txq_cpu[] entry after unmapping
   693e6513b244 scsi: scsi_dh_emc: return success in clariion_std_inquiry()
   9ac38e30f2b0 slub: do not merge cache if slub_debug contains a never-merge flag
   315689d2e202 ocfs2/dlmglue: prepare tracking logic to avoid recursive cluster lock
   d3335f5653ec crypto: xts - Add ECB dependency
   02744a55ed38 net/mlx4_core: Fix VF overwrite of module param which disables DMFS on new probed PFs
   7bf94b9595cc sparc64: Migrate hvcons irq to panicked cpu
   d14591e83b49 md/linear: shutup lockdep warnning
   48ca88f93533 f2fs: do not wait for writeback in write_begin
   3109615b52ee Btrfs: send, fix failure to rename top level inode due to name collision
   4d134d830ea7 iio: adc: xilinx: Fix error handling
   5c65ed5c07d7 netfilter: nf_ct_expect: Change __nf_ct_expect_check() return value.
   743a3ce1e0fd net/mlx4_en: fix overflow in mlx4_en_init_timestamp()
   7ed668eeb851 mac80211: fix power saving clients handling in iwlwifi
   3e8c1a04d335 mac80211_hwsim: check HWSIM_ATTR_RADIO_NAME length
   4a464dacc23f irqchip/crossbar: Fix incorrect type of local variables
   7e53f0390dbd watchdog: kempld: fix gcc-4.3 build
   28eab3db727e locking/lockdep: Add nest_lock integrity test
   d44e463c9460 Revert "bsg-lib: don't free job in bsg_prepare_job"
   01e3e6315171 tipc: use only positive error codes in messages
   685699703a0a net: Set sk_prot_creator when cloning sockets to the right proto
   1299f7e17e9e packet: only test po->has_vnet_hdr once in packet_snd
   1b6c80e797ee packet: in packet_do_bind, test fanout with bind_lock held
   ee534927f0c0 tun: bail out from tun_get_user() if the skb is empty
   b5f689d94bc3 l2tp: fix race condition in l2tp_tunnel_delete
   110cf3dd4bcc l2tp: Avoid schedule while atomic in exit_net
   93040aa17862 vti: fix use after free in vti_tunnel_xmit/vti6_tnl_xmit
   d9cb4dc0221e isdn/i4l: fetch the ppp_write buffer in one shot
   1a4f1ecdb257 bpf: one perf event close won't free bpf program attached by another perf event
   5be6824b9704 packet: hold bind lock when rebinding to fanout hook
   aa90be3e1248 net: emac: Fix napi poll list corruption
   3483c65090dc ip6_gre: skb_push ipv6hdr before packing the header in ip6gre_header
   5356f7e40d23 udpv6: Fix the checksum computation when HW checksum does not apply
   2ec54b21dd7b bpf/verifier: reject BPF_ALU64|BPF_END
   dee4506f067a sctp: potential read out of bounds in sctp_ulpevent_type_enabled()
   9f5bbe694df1 MIPS: Fix minimum alignment requirement of IRQ stack
   c088f7bc3310 drm/dp/mst: save vcpi with payloads
   951ba9f6c8b9 percpu: make this_cpu_generic_read() atomic w.r.t. interrupts

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 949d477fd846..6c6beb62b834 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2c13d27d73b9fddd38fd407326e82240a494d803"
-SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
+SRCREV_machine ?= "eba5ff0bad4f443ffa9a4b08b882b3ffbea831c3"
+SRCREV_meta ?= "72b622cacfda96e79477909518795dbcce6b1593"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.93"
+LINUX_VERSION ?= "4.4.99"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index dd380955b588..de1dbb82ed42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.93"
+LINUX_VERSION ?= "4.4.99"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
+SRCREV_machine ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
+SRCREV_meta ?= "72b622cacfda96e79477909518795dbcce6b1593"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 4d8d3da84a8a..6fe3b395efe9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5f3e5944108bc43f8ad657be259569b15e16b0f7"
-SRCREV_machine_qemuarm64 ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_machine_qemumips ?= "5827dccb88b14a64dbe6ee78efb07735236ce8ea"
-SRCREV_machine_qemuppc ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_machine_qemux86 ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_machine_qemux86-64 ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_machine_qemumips64 ?= "b8bcb7ea6836c9373f03fec69438d0c7225125f8"
-SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
+SRCREV_machine_qemuarm ?= "d22bf871c41b0b4e2836df7acebca295e98fa0b6"
+SRCREV_machine_qemuarm64 ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
+SRCREV_machine_qemumips ?= "7c682b7ad6d0c847593c65feb1df651fa0300b1a"
+SRCREV_machine_qemuppc ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
+SRCREV_machine_qemux86 ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
+SRCREV_machine_qemux86-64 ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
+SRCREV_machine_qemumips64 ?= "3b14a56cdca5182621ec88eabe10456256a95e80"
+SRCREV_machine ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
+SRCREV_meta ?= "72b622cacfda96e79477909518795dbcce6b1593"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.93"
+LINUX_VERSION ?= "4.4.99"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


