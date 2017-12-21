Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11D5078854
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBLFnSZf012714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 07:49:29 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:17 -0500
Message-ID: <9996074849914931d09df5eafc0fcfdd36e6256e.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/4.12: update to v.4.12.18
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:28 -0000
Content-Type: text/plain

Integrating the -stable backports from Paul Gortmaker, which comprise the
following commits:

   33070a47be56 Linux 4.12.18
   7441b94462dd sctp: use right member as the param of list_for_each_entry
   393004dcde90 packet: fix crash in fanout_demux_rollover()
   0a9012474dc5 coda: fix 'kernel memory exposure attempt' in fsync
   b5cc211a6240 x86/cpu/amd: Derive L3 shared_cpu_map from cpu_llc_shared_mask
   2567785ab75b mm/page_ext.c: check if page_ext is not prepared
   40991abd5541 mm/page_alloc.c: broken deferred calculation
   7fd5cc66154b ipmi: fix unsigned long underflow
   fa5ba256bc53 ocfs2: should wait dio before inode lock in ocfs2_setattr()
   97181d7d56ab ocfs2: fix cluster hang after a node dies
   3e60437f8fac mm/pagewalk.c: report holes in hugetlb ranges
   2974b65a0852 rcu: Fix up pending cbs check in rcu_prepare_for_idle
   3048be8b900f tpm-dev-common: Reject too short writes
   60bf233eeed8 serial: 8250_fintek: Fix finding base_port with activated SuperIO
   1539a3ace4ee serial: omap: Fix EFR write on RTS deassertion
   7c601c15e06d ima: do not update security.ima if appraisal status is not INTEGRITY_PASS
   42e3beae3ace net/sctp: Always set scope_id in sctp_inet6_skb_msgname
   09fc4fe93e10 fealnx: Fix building error on MIPS
   01c2c1581c94 sctp: do not peel off an assoc from one netns to another one
   0a2e9fbdc391 vxlan: fix the issue that neigh proxy blocks all icmpv6 packets
   1063c860aecd af_netlink: ensure that NLMSG_DONE never fails in dumps
   045a67694539 vlan: fix a use-after-free in vlan_device_event()
   eb1321c9ad5e tcp: fix tcp_fastretrans_alert warning
   55bfb1ef83e0 qmi_wwan: Add missing skb_reset_mac_header-call
   315ea5f8348b net: qmi_wwan: fix divide by 0 on bad descriptors
   554d1d375f1c bonding: discard lowest hash bit for 802.3ad layer3+4
   6b6b2c804d4e l2tp: don't use l2tp_tunnel_find() in l2tp_ip and l2tp_ip6
   30ec586cda8a netfilter/ipvs: clear ipvs_property flag when SKB net namespace changed
   62bd603f2677 net: systemport: Correct IPG length settings
   70cd6d6bea88 tcp: do not mangle skb->cb[] in tcp_make_synack()
   26ab537f2e5f net: vrf: correct FRA_L3MDEV encode type
   f2561863b0d6 tcp_nv: fix division by zero in tcpnv_acked()
   5dfe41dc67fc staging: greybus: spilib: fix use-after-free after deregistration
   2c7eb0674a3d staging: sm750fb: Fix parameter mistake in poke32
   008bfaf7b155 HID: wacom: generic: Recognize WACOM_HID_WD_PEN as a type of pen collection
   695db9d1697c HID: cp2112: add HIDRAW dependency
   b9edc34d9c29 x86/MCE/AMD: Always give panic severity for UC errors in kernel context
   90e3029e582c selftests/x86/protection_keys: Fix syscall NR redefinition warnings
   4ef762021938 USB: serial: garmin_gps: fix memory leak on probe errors
   f1423a77b98b USB: serial: garmin_gps: fix I/O after failed probe and remove
   68a94c90dfc3 USB: serial: qcserial: add pid/vid for Sierra Wireless EM7355 fw update
   885e857a7c26 USB: serial: Change DbC debug device binding ID
   3e7a792beda2 USB: serial: metro-usb: stop I/O after failed open
   da73445f1b69 usb: gadget: f_fs: Fix use-after-free in ffs_free_inst
   d3cc53bd3a61 USB: Add delay-init quirk for Corsair K70 LUX keyboards
   402588b38460 USB: usbfs: compute urb->actual_length for isochronous
   5a8714de40ac USB: early: Use new USB product ID and strings for DbC device
   83f0fdf7ccc6 crypto: dh - Don't permit 'key' or 'g' size longer than 'p'
   b494fa860365 crypto: dh - Don't permit 'p' to be 0
   4ffcf85d08b7 crypto: dh - Fix double free of ctx->p
   d20a9c0d1233 crypto: dh - fix memleak in setkey
   ad8b281c05c5 Bluetooth: btusb: fix QCA Rome suspend/resume
   21fc98337c60 dmaengine: dmatest: warn user when dma test times out
   72a0fc7e4f7d tcp: fix tcp_mtu_probe() vs highest_sack
   ca42624b53de ipv6: addrconf: increment ifp refcount before ipv6_del_addr()
   751e5b20c03f tun/tap: sanitize TUNSETSNDBUF input
   eea9efba6bdc net_sched: avoid matching qdisc with zero handle
   e76cd730f32e sctp: reset owner sk for data chunks on out queues when migrating a sock
   6027b882617c tun: allow positive return values on dev_get_valid_name() call
   984a8b424c58 tap: reference to KVA of an unloaded module causes kernel panic
   92adaa4247c1 tcp: refresh tcp_mstamp from timers callbacks
   026ff0f99bbf tcp: refresh tp timestamp before tcp_mtu_probe()
   aa3fb0cbb88d ip6_gre: update dst pmtu if dev mtu has been updated by toobig in __gre6_xmit
   88f0bf544d46 ip6_gre: only increase err_count for some certain type icmpv6 in ip6gre_err
   7256c950ca70 ipip: only increase err_count for some certain type icmp in ipip_err
   62e3502c1991 net/mlx5e: Properly deal with encap flows add/del under neigh update
   84d26c8a74fc tap: double-free in error path in tap_open()
   94946f4812fa net/unix: don't show information about sockets from other namespaces
   43997314bb13 net: dsa: check master device before put
   d5c769c98986 tcp/dccp: fix other lockdep splats accessing ireq_opt
   1d4c7c3266a4 tcp/dccp: fix lockdep splat in inet_csk_route_req()
   462504bc99ac sctp: full support for ipv6 ip_nonlocal_bind & IP_FREEBIND
   fe91475c8310 ipv6: flowlabel: do not leave opt->tot_len with garbage
   009a3e7461cd soreuseport: fix initialization race
   16e36e55f822 net: bridge: fix returning of vlan range op errors
   3d32d75474d1 geneve: Fix function matching VNI and tunnel ID on big-endian
   04e37f3a5c02 packet: avoid panic in packet_getsockopt()
   3895ca099a69 tcp/dccp: fix ireq->opt races
   eda355607691 sctp: add the missing sock_owned_by_user check in sctp_icmp_redirect
   785b144296af netlink: fix netlink_ack() extack race
   01af773e7a6b tun: call dev_get_valid_name() before register_netdevice()
   1b522844eabe l2tp: check ps->sock before running pppol2tp_session_ioctl()
   ae90bb6362cd net: call cgroup_sk_alloc() earlier in sk_clone_lock()
   1ec7babcf934 netlink: do not set cb_running if dump's start() errs
   7fa820a09305 gso: fix payload length when gso_size is zero
   463a7737df22 ppp: fix race in ppp device destruction
   57b61ea36589 xfs: move two more RT specific functions into CONFIG_XFS_RT
   b5bea8ab390b tty: fix __tty_insert_flip_char regression
   1d4d3f8e98b3 KVM: add X86_LOCAL_APIC dependency
   737d1a26d83a pinctrl/amd: Fix build dependency on pinmux code
   5f9a4e690c9f seccomp: make function __get_seccomp_filter static
   407108cebb23 Fix tracing sample code warning.
   e53f80ca68ae security/keys: BIG_KEY requires CONFIG_CRYPTO
   b177131cdd05 udp: fix bcast packet reception
   51165c2e0923 Linux 4.12.17
   e37973f85463 media: dib0700: fix invalid dvb_detach argument
   2be5d96a5441 media: imon: Fix null-ptr-deref in imon_probe
   6cc6ecdb2ad9 Input: ims-psu - check if CDC union descriptor is sane
   dcc13ac27971 net: cdc_ether: fix divide by 0 on bad descriptors
   6a98f24f0530 net: usb: asix: fill null-ptr-deref in asix_suspend
   1da204e5439f usb: usbtest: fix NULL pointer dereference
   39795ceb702b x86/oprofile/ppro: Do not use __this_cpu*() in preemptible context
   cf6308a136f2 x86/smpboot: Make optimization of delay calibration work correctly
   5cee51d999ed x86/debug: Handle warnings before the notifier chain, to fix KGDB crash
   7faef4f041ed can: c_can: don't indicate triple sampling support for D_CAN
   2efab93ab541 can: ifi: Fix transmitter delay calculation
   9a9a3a778c22 can: peak: Add support for new PCIe/M2 CAN FD interfaces
   befd4aa29428 can: sun4i: handle overrun in RX FIFO
   ce274815fdac drm/vmwgfx: Fix Ubuntu 17.10 Wayland black screen issue
   327b1f353263 rbd: use GFP_NOIO for parent stat and data requests
   81a57d23e6f9 Input: elan_i2c - add ELAN060C to the ACPI table
   8b43ca400436 MIPS: AR7: Ensure that serial ports are properly set up
   fd11bdb71a3a MIPS: AR7: Defer registration of GPIO
   361b86eaf6ec MIPS: BMIPS: Fix missing cbr address
   1f5ee962f2cd MIPS: Fix CM region target definitions
   95eca04aa013 ALSA: seq: Fix OSS sysex delivery in OSS emulation
   a77a957d8dd4 ALSA: hda - fix headset mic problem for Dell machines with alc274
   5e838d3a8e07 ALSA: usb-audio: support new Amanero Combo384 firmware version
   af199c8af86e ALSA: timer: Limit max instances per timer
   7f740a514450 ARM: 8720/1: ensure dump_instr() checks addr_limit
   378309492920 ACPI / scan: Enable GPEs before scanning the namespace
   3d41affb49ba ACPICA: Make it possible to enable runtime GPEs earlier
   73b2b51c57bc ACPICA: Dispatch active GPEs at init time
   b8a8b7486b60 KEYS: fix NULL pointer dereference during ASN.1 parsing [ver #2]
   1dd87968f2e3 crypto: x86/sha256-mb - fix panic due to unaligned access
   ad3194d5cdd7 crypto: x86/sha1-mb - fix panic due to unaligned access
   176121ac7fe1 crypto: ccm - preserve the IV buffer
   565a57ec4f8d workqueue: Fix NULL pointer dereference
   86d04817638d x86/mcelog: Get rid of RCU remnants
   61f8603bcb05 perf/cgroup: Fix perf cgroup hierarchy support
   c39d83f28cf5 MIPS: microMIPS: Fix incorrect mask in insn_table_MM
   ff06d106db71 MIPS: smp-cmp: Use right include for task_struct
   6da5b0e13e3e drm/i915/edp: read edp display control registers unconditionally
   89e68088def8 drm/i915: Do not rely on wm preservation for ILK watermarks
   052130e6dd1c mm, swap: fix race between swap count continuation operations
   92ede622224e ocfs2: fstrim: Fix start offset of first cluster group during fstrim
   d4e8f4c82ec4 userfaultfd: hugetlbfs: prevent UFFDIO_COPY to fill beyond the end of i_size
   bf69e4b41953 drm/amdgpu: allow harvesting check for Polaris VCE
   aa09acb11a5b drm/amdgpu: return -ENOENT from uvd 6.0 early init for harvesting
   707ba2820623 ARM: 8715/1: add a private asm/unaligned.h
   4fa5fe6ea340 ARM: dts: mvebu: pl310-cache disable double-linefill
   a01a5c2e6e9e arm/arm64: kvm: Disable branch profiling in HYP code
   3441fa885cf3 arm/arm64: KVM: set right LR register value for 32 bit guest when inject abort
   a650f10a6423 KVM: arm64: its: Fix missing dynamic allocation check in scan_its_table
   24d22fb868e3 arm64: ensure __dump_instr() checks addr_limit
   cac0dcc9179e ASoC: adau17x1: Workaround for noise bug in ADC
   7e34e27aaf91 KEYS: fix out-of-bounds read during ASN.1 parsing
   53ec125b27a1 KEYS: trusted: fix writing past end of buffer in trusted_read()
   9b453e30fc82 cifs: check MaxPathNameComponentLength != 0 before using it
   69828d917713 ALSA: seq: Fix nested rwsem annotation for lockdep splat
   11f1d2059857 ALSA: timer: Add missing mutex lock for compat ioctls
   86306c8bf739 powerpc/xive: Fix the size of the cpumask used in xive_find_target_in_mask()
   7d5b350c311e regulator: fan53555: fix I2C device ids
   bba7a802ffa0 ipsec: Fix aborted xfrm policy dump crash
   3f17c12b2ef6 cfg80211: fix connect/disconnect edge cases
   036cb11e2b93 can: kvaser_usb: Ignore CMD_FLUSH_QUEUE_REPLY messages
   25a5d333b556 can: kvaser_usb: Correct return value in printout
   0dea0f030394 can: sun4i: fix loopback mode
   b26722135e12 drm/i915/perf: fix perf enable/disable ioctls with 32bits userspace
   748e46331dc7 drm/amd/powerplay: fix uninitialized variable
   859bc7ad2aa9 x86/cpu/AMD: Apply the Erratum 688 fix when the BIOS doesn't
   1370811ed5b7 scsi: aacraid: Fix controller initialization failure
   626a5aae973e scsi: zfcp: fix erp_action use-before-initialize in REC action trace
   250835c62a90 assoc_array: Fix a buggy node-splitting case
   fea99b11049a SMB3: Validate negotiate request must always be signed
   d030ae8043b8 Fix encryption labels and lengths for SMB3.1.1
   158c28974465 Input: gtco - fix potential out-of-bound access
   a603b795cb7e Input: elan_i2c - add ELAN0611 to the ACPI table
   9bb1ce736e36 CIFS: Fix NULL pointer deref on SMB2_tcon() failure
   fbe5c09ee805 xen/gntdev: avoid out of bounds access in case of partial gntdev_mmap()
   950c2786017a fuse: fix READDIRPLUS skipping an entry
   1be2e5e41f0e spi: armada-3700: Fix failing commands with quad-SPI
   733d72531cc5 spi: bcm-qspi: Fix use after free in bcm_qspi_probe() in error path
   cffec62ffee5 spi: a3700: Return correct value on timeout detection
   be9198ea33e1 spi: uapi: spidev: add missing ioctl header
   9b5c3ee4ed3f KVM: PPC: Book3S: Protect kvmppc_gpa_to_ua() with SRCU
   9574b6e81e45 KVM: PPC: Book3S HV: POWER9 more doorbell fixes
   bceb8e9d95be KVM: PPC: Book3S HV: Use msgsync with hypervisor doorbells on POWER9
   229642d22e3a KVM: PPC: Fix oops when checking KVM_CAP_PPC_HTM
   32e77b72733b ceph: unlock dangling spinlock in try_flush_caps()
   f4180593b1e9 ALSA: hda - fix headset mic problem for Dell machines with alc236
   33477d1e5e6b ALSA: hda/realtek - Add support for ALC236/ALC3204
   0230f9ed329f workqueue: replace pool->manager_arb mutex with a flag
   5ec0d1c9d5a9 xfs: trim writepage mapping to within eof
   fcc029896ba9 xfs: cancel dirty pages on invalidation
   da45acc2e9cd xfs: handle error if xfs_btree_get_bufs fails
   7d57f66d6f17 xfs: reinit btree pointer on attr tree inactivation walk
   731ead3be639 xfs: don't change inode mode if ACL update fails
   173d49a9a531 xfs: move more RT specific code under CONFIG_XFS_RT
   ba899492a1d5 xfs: handle racy AIO in xfs_reflink_end_cow
   72ac4f1186a6 xfs: always swap the cow forks when swapping extents
   204bdfa1f67c xfs: perag initialization should only touch m_ag_max_usable for AG 0
   7b74f08372bd xfs: update i_size after unwritten conversion in dio completion
   a387eb05ff73 xfs: report zeroed or not correctly in xfs_zero_range()
   7df2a96d20a4 fs/xfs: Use %pS printk format for direct addresses
   4c71c06ac80f xfs: evict CoW fork extents when performing finsert/fcollapse
   f0f53f176d94 xfs: don't unconditionally clear the reflink flag on zero-block files
   032e53c378a8 iomap_dio_rw: Allocate AIO completion queue before submitting dio
   bd603f7110b9 pkcs7: Prevent NULL pointer dereference, since sinfo is not always set.
   362a37a0cf59 KEYS: don't let add_key() update an uninstantiated key
   e4968379c1b6 FS-Cache: fix dereference of NULL user_key_payload
   047fe074b659 KEYS: Fix race between updating and finding a negative key
   8ea691e39413 ecryptfs: fix dereference of NULL user_key_payload
   bfd7bc34be16 fscrypt: fix dereference of NULL user_key_payload
   83f4c52d9fd7 lib/digsig: fix dereference of NULL user_key_payload
   e966d2d4f6a1 x86/microcode/intel: Disable late loading on model 79
   d647900b826d rtlwifi: rtl8821ae: Fix connection lost problem
   3f4f2f812312 clockevents/drivers/cs5535: Improve resilience to spurious interrupts
   6bd3022f41a1 bus: mbus: fix window size calculation for 4GB windows
   c7a86caa19f2 brcmsmac: make some local variables 'static const' to reduce stack size
   4df70a6e8969 brcmfmac: Add check for short event packets
   f6f7db182f44 i2c: piix4: Fix SMBus port selection for AMD Family 17h chips
   dfc7eebd0b5d ALSA: hda: Abort capability probe at invalid register read
   a7252ee01e59 ALSA: hda: Remove superfluous '-' added by printk conversion
   514d11ccc861 ALSA: seq: Enable 'use' locking in all configurations
   a4476518e1e7 tracing/samples: Fix creation and deletion of simple_thread_fn creation
   ad84c20a9f47 media: dvb: i2c transfers over usb cannot be done from stack
   11fbb0237319 media: cec: Respond to unregistered initiators, when applicable
   43ac45e69b11 media: s5p-cec: add NACK detection support
   686020330a68 drm/nouveau/mmu: flush tlbs before deleting page tables
   90905608e49e drm/nouveau/bsp/g92: disable by default
   a276b1329f6e drm/nouveau/kms/nv50: fix oops during DP IRQ handling on non-MST boards
   75c7d377d125 drm/i915: Use bdw_ddi_translations_fdi for Broadwell
   a4e778fda246 mmc: sdhci-pci: Fix default d3_retune for Intel host controllers
   c51c64badbdf KEYS: encrypted: fix dereference of NULL user_key_payload
   8d5f0ae655f9 can: flexcan: fix p1010 state transition issue
   32a5167fcdae can: flexcan: fix i.MX28 state transition issue
   5babb6c595a6 can: flexcan: fix i.MX6 state transition issue
   9319913df979 can: flexcan: implement error passive state quirk
   1c93f600ac19 can: flexcan: rename legacy error state quirk
   25cb31c3f806 can: flexcan: fix state transition regression
   f433519c4cba can: af_can: can_pernet_init(): add missing error handling for kzalloc returning NULL
   947a57f938f3 can: esd_usb2: Fix can_dlc value for received RTR, frames
   792c8810f196 usb: xhci: Handle error condition in xhci_stop_device()
   c83a48144395 xhci: Cleanup current_cmd in xhci_cleanup_command_queue()
   666fd52c080b xhci: Identify USB 3.1 capable hosts by their port protocol capability
   523dad046e0f usb: musb: Check for host-mode using is_host_active() on reset interrupt
   5e277dcadf45 usb: musb: musb_cppi41: Configure the number of channels for DA8xx
   1ddbc42b569c usb: musb: musb_cppi41: Fix cppi41_set_dma_mode() for DA8xx
   b4ae14cc4f93 usb: musb: musb_cppi41: Fix the address of teardown and autoreq registers
   dbb13f2fcbc9 USB: musb: fix late external abort on suspend
   cff06a4ae7d5 USB: musb: fix session-bit runtime-PM quirk
   7545aa66403b usb: musb: sunxi: Explicitly release USB PHY on exit
   8447db4b2e33 iio: dummy: events: Add missing break
   9d8a108edff7 parisc: Fix double-word compare and exchange in LWS code on 32-bit kernels
   58bacefc0b50 s390/cputime: fix guest/irq/softirq times after CPU hotplug
   7543b1a05d0c nbd: don't set the device size until we're connected
   b7e699fcefbe can: gs_usb: fix busy loop if no more TX context is available
   2053fee203fb ALSA: usb-audio: Add native DSD support for Pro-Ject Pre Box S2 Digital
   a069429516bc usb: hub: Allow reset retry for USB2 devices on connect bounce
   79d5e5d8d2fe usb: quirks: add quirk for WORLDE MINI MIDI keyboard
   4d493d5a62ea usb: cdc_acm: Add quirk for Elatec TWN3
   d553fc8e775f USB: serial: metro-usb: add MS7820 device id
   9872dc2ad066 USB: core: fix out-of-bounds access bug in usb_get_bos_descriptor()
   4d75d952a2ac USB: devio: Revert "USB: devio: Don't corrupt user memory"
   b5264fc112b2 staging: bcm2835-audio: Fix memory corruption

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 27675903bc59..267f730c60e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5683569846208da7b42c8c89e93f3259530ce92d"
-SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
+SRCREV_machine ?= "8f6a2f93758166ef40e56f907a067801fee88d75"
+SRCREV_meta ?= "0eb9d6eb80a2bc3c42a351b747c319ef40df08db"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.16"
+LINUX_VERSION ?= "4.12.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index e0c43b5cc420..79fa38ba49a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.16"
+LINUX_VERSION ?= "4.12.18"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
-SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
+SRCREV_machine ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_meta ?= "0eb9d6eb80a2bc3c42a351b747c319ef40df08db"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index aec38ecc35d7..42672b78d3af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "355d43fde266ab8062616a8226f63f0fe9ba8693"
-SRCREV_machine_qemuarm64 ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
-SRCREV_machine_qemumips ?= "db46814f088b53d656be50c1ff8a6ac0e120a312"
-SRCREV_machine_qemuppc ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
-SRCREV_machine_qemux86 ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
-SRCREV_machine_qemux86-64 ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
-SRCREV_machine_qemumips64 ?= "74b3f662fcc5672389b05ae572858e34a123e570"
-SRCREV_machine ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
-SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
+SRCREV_machine_qemuarm ?= "d293ce5ce9097c2a269cabed7ae6fcc66f92af09"
+SRCREV_machine_qemuarm64 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_machine_qemumips ?= "3bac03d93aa8eda49cae6563ba13996460dffd4f"
+SRCREV_machine_qemuppc ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_machine_qemux86 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_machine_qemux86-64 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_machine_qemumips64 ?= "8c0a56e5a553ac3a985949ae8d0fc35d54779756"
+SRCREV_machine ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_meta ?= "0eb9d6eb80a2bc3c42a351b747c319ef40df08db"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.16"
+LINUX_VERSION ?= "4.12.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


