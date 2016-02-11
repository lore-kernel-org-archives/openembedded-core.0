Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51613731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:08:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1BF8J4F015514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Feb 2016 07:08:19 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 11 Feb 2016 07:08:19 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Feb 2016 10:08:15 -0500
Message-ID: <6a61ed543c514d72044dbd6cbd04e68e9b394625.1455203165.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1455203165.git.bruce.ashfield@windriver.com>
References: <cover.1455203165.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto/4.1: update to v4.1.17
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
X-List-Received-Date: Thu, 11 Feb 2016 15:08:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Updating to the -stable korg release with the following changes:

   2d5f6b041335 Linux 4.1.17
   d17367a77457 recordmcount: Fix endianness handling bug for nop_mcount
   1f6d936d33f4 arm64: restore bogomips information in /proc/cpuinfo
   705164dbe08f mn10300: Select CONFIG_HAVE_UID16 to fix build failure
   57b7d61c2d89 fix the regression from "direct-io: Fix negative return from dio read beyond eof"
   8885e7f3d76a direct-io: Fix negative return from dio read beyond eof
   b824d64b153a media/vivid-osd: fix info leak in ioctl
   3f0cf7dcf712 staging: lustre: echo_copy.._lsm() dereferences userland pointers directly
   b50a2b556d1e HID: core: Avoid uninitialized buffer access
   c777e9ab2a44 parisc iommu: fix panic due to trying to allocate too large region
   e479822e1e3a iommu/vt-d: Fix ATSR handling for Root-Complex integrated endpoints
   f21731a54a66 arm64: mm: ensure that the zero page is visible to the page table walker
   3e804c36399e arm64: Clear out any singlestep state on a ptrace detach operation
   426bfb6a7784 ARM/arm64: KVM: correct PTE uncachedness check
   3f0b20e1a2d8 arm64: fix building without CONFIG_UID16
   f94cf332a806 arm64: KVM: Fix AArch32 to AArch64 register mapping
   959cad3a68a7 ARM/arm64: KVM: test properly for a PTE's uncachedness
   75f1fde24b56 arm64: kernel: pause/unpause function graph tracer in cpu_suspend()
   f22c64cd0745 arm64: bpf: fix mod-by-zero case
   40c5dde6eb7e arm64: bpf: fix div-by-zero case
   8831ded35abd recordmcount: arm64: Replace the ignored mcount call into nop
   a33b8ff3d6cb powerpc/module: Handle R_PPC64_ENTRY relocations
   1e2c53f19cef scripts/recordmcount.pl: support data in text section on powerpc
   4126ac7cdcef powerpc: Make {cmp}xchg* and their atomic_ versions fully ordered
   af69fe1f70af powerpc: Make value-returning atomics fully ordered
   1e14dd5a3864 powerpc/powernv: pr_warn_once on unsupported OPAL_MSG type
   a54d3a423412 powerpc/tm: Check for already reclaimed tasks
   567a215dd158 powerpc/tm: Block signal return setting invalid MSR state
   eeca98948d8c xfrm: dst_entries_init() per-net dst_ops
   139bd872dc68 xen-netfront: update num_queues to real created
   a1edfa789d1a xen-netfront: respect user provided max_queues
   21edf40b5ccb xen-netback: respect user provided max_queues
   534e9016cd88 sctp: Prevent soft lockup when sctp_accept() is called during a timeout event
   490c963c1eb9 team: Replace rcu_read_lock with a mutex in team_vlan_rx_kill_vid
   95785b105fa2 batman-adv: Drop immediate orig_node free function
   ae3eb44e0e8b batman-adv: Drop immediate batadv_hard_iface free function
   924224c6e44a batman-adv: Drop immediate neigh_ifinfo free function
   620493a90c78 batman-adv: Drop immediate batadv_neigh_node free function
   9d188c6b672c batman-adv: Drop immediate batadv_orig_ifinfo free function
   34c5bf7c7bf4 batman-adv: Avoid recursive call_rcu for batadv_nc_node
   016cb1d02db9 batman-adv: Avoid recursive call_rcu for batadv_bla_claim
   a50a93cc9928 ppp, slip: Validate VJ compression slot parameters completely
   5984398539a2 isdn_ppp: Add checks for allocation failure in isdn_ppp_open()
   9ba3d77689a5 tcp/dccp: fix old style declarations
   479b539a3101 tcp/dccp: fix timewait races in timer handling
   332fb8799ed1 bridge: fix lockdep addr_list_lock false positive splat
   2980502b9f6d ipv6: update skb->csum when CE mark is propagated
   dc1cfcc26697 net: bpf: reject invalid shifts
   2a1e5e4ab662 phonet: properly unshare skbs in phonet_rcv()
   7d9fb947be67 bonding: Prevent IPv6 link local address on enslaved devices
   abefd1b4087b net: preserve IP control block during GSO segmentation
   4bb526bce19d udp: disallow UFO for sockets with SO_NO_CHECK option
   e7bbeacbafc1 tcp_yeah: don't set ssthresh below 2
   add92082e2d1 ipv6: tcp: add rcu locking in tcp_v6_send_synack()
   bcea43fb3164 net: sctp: prevent writes to cookie_hmac_alg from accessing invalid memory
   a33704eb6085 vxlan: fix test which detect duplicate vxlan iface
   8f5cd6eea811 net: possible use after free in dst_release
   02a1fef61d06 net: sched: fix missing free per cpu on qstats
   5596242a6263 net: filter: make JITs zero A for SKF_AD_ALU_XOR_X
   a6b1d2489380 bridge: Only call /sbin/bridge-stp for the initial network namespace
   dc6b0ec667f6 unix: properly account for FDs passed over unix sockets
   f45f0213b831 connector: bump skb->users before callback invocation
   c000d76ec0d8 sctp: sctp should release assoc when sctp_make_abort_user return NULL in sctp_close
   45d52b0b1f9f net: cdc_ncm: avoid changing RX/TX buffers on MTU changes
   6866b52c56db addrconf: always initialize sysctl table data
   8a39e24931d1 ipv6/addrlabel: fix ip6addrlbl_get()
   57d0c018b46e veth: don’t modify ip_summed; doing so treats packets with bad checksums as good.
   3fabd53542c8 xhci: refuse loading if nousb is used
   3f5e25aa380d USB: cp210x: add ID for ELV Marble Sound Board 1
   887c3cc2557b USB: ipaq.c: fix a timeout loop
   a7e83b16c8d8 USB: fix invalid memory access in hub_activate()
   5241134a79fa airspy: increase USB control message buffer size
   abcbfda367d4 usb: xhci: fix config fail of FS hub behind a HS hub with MTT
   1f6a2cc39913 ASoC: compress: Fix compress device direction check
   20091f9139bc ASoC: arizona: Fix bclk for sample rates that are multiple of 4kHz
   6ac84206a212 ASoC: davinci-mcasp: Fix XDATA check in mcasp_start_tx
   1fce19176555 ASoC: wm8974: set cache type for regmap
   5a1109e05e09 ASoC: es8328: Fix deemphasis values
   64fa05313b0a ASoC: wm8962: correct addresses for HPF_C_0/1
   1c98861e6467 ASoC: rsnd: fixup SCU_SYS_INT_EN1 address
   b309c8bf5a4a ALSA: timer: Handle disconnection more safely
   2b332719b8f0 ALSA: hda - Flush the pending probe work at remove
   a63fabd4ac6c ALSA: hda - Fix bass pin fixup for ASUS N550JX
   efcf073d7fa1 ALSA: control: Avoid kernel warnings from tlv ioctl with numid 0
   965b1203f399 ALSA: hrtimer: Fix stall by hrtimer_cancel()
   281bedb8728f ALSA: pcm: Fix snd_pcm_hw_params struct copy in compat mode
   d1a55757feff ALSA: seq: Fix snd_seq_call_port_info_ioctl in compat mode
   dc5697eb3297 ALSA: timer: Fix double unlink of active_list
   ac905ca58370 ALSA: timer: Fix race among timer ioctls
   042b42c579b9 ALSA: hda - fix the headset mic detection problem for a Dell laptop
   466c99bd815a ALSA: timer: Harden slave timer list handling
   27b496cc9e8c ALSA: usb-audio: Fix mixer ctl regression of Native Instrument devices
   6aee1f8440bf ALSA: hda - Fix white noise on Dell Latitude E5550
   49c9eb3db864 ALSA: seq: Fix race at timer setup and close
   9a6003a362ac ALSA: seq: Fix missing NULL check at remove_events ioctl
   aa13585b6672 ALSA: usb: Add native DSD support for Oppo HA-1
   37191bd8b4dd ALSA: hda/realtek - Fix silent headphone output on MacPro 4,1 (v2)
   b40f630cfe4d ALSA: hda - Set SKL+ hda controller power at freeze() and thaw()
   73a5fdacba1f ALSA: usb-audio: Add sample rate inquiry quirk for AudioQuest DragonFly
   271126c7cbb6 ALSA: usb-audio: Add a more accurate volume quirk for AudioQuest DragonFly
   228a0e09d53a ALSA: hda - Set codec to D3 at reboot/shutdown on Thinkpads
   be7c9844eea1 ALSA: hda - Apply click noise workaround for Thinkpads generically
   dff55bf1b247 ALSA: hda - Add a fixup for Thinkpad X1 Carbon 2nd
   bc4d35b2c8c7 ALSA: hda - Fix noise problems on Thinkpad T440s
   c5e609dc5cab ALSA: hda - Add inverted dmic for Packard Bell DOTS
   af95ff49d83b ALSA: rme96: Fix unexpected volume reset after rate changes
   9bc3da2497b3 ALSA: hda - Fix noise on Gigabyte Z170X mobo
   842dd2467a24 ALSA: hda - Add fixup for Acer Aspire One Cloudbook 14
   5c7e814c1b3a ALSA: hda - Apply HP headphone fixups more generically
   c397bc975aa4 ALSA: fireworks/bebob/oxfw/dice: enable to make as built-in
   055fb07950be ALSA: hda - Apply pin fixup for HP ProBook 6550b
   29923678a8ef ALSA: hda - Add Intel Lewisburg device IDs Audio
   e702f5856baa ALSA: hda - Disable 64bit address for Creative HDA controllers
   69bed67bc32f ipmi: move timer init to before irq is setup
   8dfca273353b ipmi: Start the timer and thread on internal msgs
   c1a631b482a7 x86/mm: Improve switch_mm() barrier comments
   ae535caf02c7 x86/mm: Add barriers and document switch_mm()-vs-flush synchronization
   4b6c3a55305d x86/boot: Double BOOT_HEAP_SIZE to 64KB
   eec2baa86479 x86/reboot/quirks: Add iMac10,1 to pci_reboot_dmi_table[]
   17f33d468f4d KVM: x86: correctly print #AC in traces
   8a3185c54d65 KVM: x86: expose MSR_TSC_AUX to userspace
   e052d6eeedf1 KVM: PPC: Book3S HV: Prohibit setting illegal transaction state in MSR
   19eaffefc4b0 KVM: svm: unconditionally intercept #DB
   03e572f3dda7 KVM: VMX: fix SMEP and SMAP without EPT
   c12a3752a390 x86/xen: don't reset vcpu_info on a cancelled suspend
   702d87e2ff77 xen/gntdev: Grant maps should not be subject to NUMA balancing
   3ab6a090acfb x86/signal: Fix restart_syscall number for x32 tasks
   c24eedeca7b8 x86/mpx: Fix instruction decoder condition

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 2bc891c7c9fe..dd932684182d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "368da9a4a63880c315aabff5834c8d3a807bbbbb"
-SRCREV_meta ?= "fde1381efc83859fcd873521bd1243646b22ef46"
+SRCREV_machine ?= "42d44733dd06c224dd3e0b25579541b318007e6e"
+SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.16"
+LINUX_VERSION ?= "4.1.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 81f339d2b2d3..49b85ec1a5d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.16"
+LINUX_VERSION ?= "4.1.17"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9acf3d237d07758701d56c75cc2058f05a974899"
-SRCREV_meta ?= "fde1381efc83859fcd873521bd1243646b22ef46"
+SRCREV_machine ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index cbc5f1a745d8..033fcd730654 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b635f136b1c5ffd0f570b1799c9265ba832efc3a"
-SRCREV_machine_qemuarm64 ?= "9acf3d237d07758701d56c75cc2058f05a974899"
-SRCREV_machine_qemumips ?= "fd7be86f6cafbf3947fdffdee23b0e9ca9e4abb0"
-SRCREV_machine_qemuppc ?= "9acf3d237d07758701d56c75cc2058f05a974899"
-SRCREV_machine_qemux86 ?= "9acf3d237d07758701d56c75cc2058f05a974899"
-SRCREV_machine_qemux86-64 ?= "9acf3d237d07758701d56c75cc2058f05a974899"
-SRCREV_machine_qemumips64 ?= "45cc8f9f06eb83d7804d03690e7fa0d76b060e16"
-SRCREV_machine ?= "9acf3d237d07758701d56c75cc2058f05a974899"
-SRCREV_meta ?= "fde1381efc83859fcd873521bd1243646b22ef46"
+SRCREV_machine_qemuarm ?= "2e57b0b4eba5545f8dcd6d204930acc9b16668cc"
+SRCREV_machine_qemuarm64 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_qemumips ?= "1da18606598d131831b2cb5db377c2379c26cab2"
+SRCREV_machine_qemuppc ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_qemux86 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_qemux86-64 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_qemumips64 ?= "a73051ce903a0a646e1c198b71b2ec8eb1091ed0"
+SRCREV_machine ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.16"
+LINUX_VERSION ?= "4.1.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


