Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDB872F16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:51:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4FCpiE0014604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 May 2017 05:51:44 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 15 May 2017 05:51:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 15 May 2017 08:51:39 -0400
Message-ID: <442c2e2eff95c688d65240c447d771bcf341d0e3.1494851172.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1494851172.git.bruce.ashfield@windriver.com>
References: <cover.1494851172.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/4.4: update to v4.4.67
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
X-List-Received-Date: Mon, 15 May 2017 12:51:44 -0000
Content-Type: text/plain

Integrating the korg v4.4.61 -> 4.4.67 releases with the following
commit summary:

   dec1dc2a0ee8 Linux 4.4.67
   3b9983bb354e dm ioctl: prevent stack leak in dm ioctl call
   da1ce38aaac7 nfsd: stricter decoding of write-like NFSv2/v3 ops
   35e13333c217 nfsd4: minor NFSv2/v3 write decoding cleanup
   16fb859f9b2b ext4/fscrypto: avoid RCU lookup in d_revalidate
   41948f88a521 ext4 crypto: use dget_parent() in ext4_d_revalidate()
   2faff9d1dfc5 ext4 crypto: revalidate dentry after adding or removing the key
   e2968fb8e798 ext4: require encryption feature for EXT4_IOC_SET_ENCRYPTION_POLICY
   fee1f42b961e IB/ehca: fix maybe-uninitialized warnings
   56cd2ed3e25a IB/qib: rename BITS_PER_PAGE to RVT_BITS_PER_PAGE
   a8d47b4b3cb6 netlink: Allow direct reclaim for fallback allocation
   35c9bfa51154 8250_pci: Fix potential use-after-free in error path
   6f81dea4037c scsi: cxlflash: Improve EEH recovery time
   24d17d7853fa scsi: cxlflash: Fix to avoid EEH and host reset collisions
   69a9e016f0cc scsi: cxlflash: Scan host only after the port is ready for I/O
   ec2170f98f9a net: tg3: avoid uninitialized variable warning
   fd79e4363258 mtd: avoid stack overflow in MTD CFI code
   ee6b88767e87 drbd: avoid redefinition of BITS_PER_PAGE
   938206b8d798 ALSA: ppc/awacs: shut up maybe-uninitialized warning
   a2b3b19acfde ASoC: intel: Fix PM and non-atomic crash in bytcr drivers
   6c106b55eb47 Handle mismatched open calls
   911bd54922cd timerfd: Protect the might cancel mechanism proper
   0c49a2c16ca9 Linux 4.4.66
   9c4a4755d9c5 ftrace/x86: Fix triple fault with graph tracing and suspend-to-ram
   1aefe328a68d ARCv2: save r30 on kernel entry as gcc uses it for code-gen
   82a0d8aabe04 nfsd: check for oversized NFSv2/v3 arguments
   2032eebe2384 Input: i8042 - add Clevo P650RS to the i8042 reset list
   91ce8d13faeb p9_client_readdir() fix
   3bf0809930b8 MIPS: Avoid BUG warning in arch_check_elf
   1c26c382c9e7 MIPS: KGDB: Use kernel context for sleeping threads
   555f77106f77 ALSA: seq: Don't break snd_use_lock_sync() loop by timeout
   8cbaf11c5026 ALSA: firewire-lib: fix inappropriate assignment between signed/unsigned type
   5e52fffbb11c ipv6: check raw payload size correctly in ioctl
   befb92542439 ipv6: check skb->protocol before lookup for nexthop
   114f0c66dab4 macvlan: Fix device ref leak when purging bc_queue
   bdeb026dfd9f ip6mr: fix notification device destruction
   25c104023372 netpoll: Check for skb->queue_mapping
   f6b94906b414 net: ipv6: RTF_PCPU should not be settable from userspace
   f6b34b1709ac dp83640: don't recieve time stamps twice
   78c4e3d4848d tcp: clear saved_syn in tcp_disconnect()
   52e33b4e505d sctp: listen on the sock only when it's state is listening or closed
   cc5a5c09d32b net: ipv4: fix multipath RTM_GETROUTE behavior when iif is given
   593e185eaade l2tp: fix PPP pseudo-wire auto-loading
   f710dbd92b27 l2tp: take reference on sessions being dumped
   25adf4e32a89 net/packet: fix overflow in check for tp_reserve
   cf71bd41f809 net/packet: fix overflow in check for tp_frame_nr
   8625dfcfd338 l2tp: purge socket queues in the .destruct() callback
   0e9eeb4676a7 net: phy: handle state correctly in phy_stop_machine
   428b3cefab22 net: neigh: guard against NULL solicit() method
   592d0e60a2b7 sparc64: Fix kernel panic due to erroneous #ifdef surrounding pmd_write()
   80ec183214e8 sparc64: kern_addr_valid regression
   c583862e95d2 xen/x86: don't lose event interrupts
   5709321fd962 usb: gadget: f_midi: Fixed a bug when buflen was smaller than wMaxPacketSize
   3e19487b9bf5 regulator: core: Clear the supply pointer if enabling fails
   804605eae410 RDS: Fix the atomicity for congestion map update
   b9baa0aa66ce net_sched: close another race condition in tcf_mirred_release()
   1d1cb762524f net: cavium: liquidio: Avoid dma_unmap_single on uninitialized ndata
   2907c91c9f9a MIPS: Fix crash registers on non-crashing CPUs
   49b2fe4b0207 md:raid1: fix a dead loop when read from a WriteMostly disk
   28320756e78b ext4: check if in-inode xattr is corrupted in ext4_expand_extra_isize_ea()
   99e96ce5e315 drm/amdgpu: fix array out of bounds
   10fc325c03d2 crypto: testmgr - fix out of bound read in __test_aead()
   40a55e4f9401 clk: sunxi: Add apb0 gates for H3
   531be60fc580 ARM: OMAP2+: timer: add probe for clocksources
   bd2d6cb00d1a xc2028: unlock on error in xc2028_set_config()
   716bcfeb12b8 f2fs: do more integrity verification for superblock
   418b99042b87 Linux 4.4.65
   416bd4a366f3 perf/core: Fix concurrent sys_perf_event_open() vs. 'move_group' race
   b7f47c794bc4 ping: implement proper locking
   a7544fdd1626 staging/android/ion : fix a race condition in the ion driver
   d23ef85b123d vfio/pci: Fix integer overflows, bitmask check
   65d30f7545ff tipc: check minimum bearer MTU
   9540baadb61b netfilter: nfnetlink: correctly validate length of batch messages
   0d9dac5d7cc3 xc2028: avoid use after free
   c50fd34e1089 mnt: Add a per mount namespace limit on the number of mounts
   59e0cd110fb9 tipc: fix socket timer deadlock
   abc025d1e88a tipc: fix random link resets while adding a second bearer
   d39cb4a59729 gfs2: avoid uninitialized variable warning
   9a35bc2ae545 hostap: avoid uninitialized variable use in hfa384x_get_rid
   58f80ccf09c4 tty: nozomi: avoid a harmless gcc warning
   2847736f563d tipc: correct error in node fsm
   76ca3053f32c tipc: re-enable compensation for socket receive buffer double counting
   3f3155904308 tipc: make dist queue pernet
   44b3b7e06887 tipc: make sure IPv6 header fits in skb headroom
   12f4e1f54a13 Linux 4.4.64
   6862fa9077de tipc: fix crash during node removal
   6ddbac9aa800 block: fix del_gendisk() vs blkdev_ioctl crash
   d1cc3cdd39e9 x86, pmem: fix broken __copy_user_nocache cache-bypass assumptions
   5693f3fb5a66 hv: don't reset hv_context.tsc_page on crash
   03e2fb9b5ce8 Drivers: hv: balloon: account for gaps in hot add regions
   8e7a6dbc3b71 Drivers: hv: balloon: keep track of where ha_region starts
   397488e09bf2 Tools: hv: kvp: ensure kvp device fd is closed on exec
   2a60bb635236 kvm: arm/arm64: Fix locking for kvm_free_stage2_pgd
   e2587fba9911 x86/mce/AMD: Give a name to MCA bank 3 when accessed with legacy MSRs
   6c107bba66dc powerpc/kprobe: Fix oops when kprobed on 'stdu' instruction
   38be91ce7ea8 ubi/upd: Always flush after prepared for an update
   b812c69019e4 mac80211: reject ToDS broadcast data frames
   b74ba9dd91e5 mmc: sdhci-esdhc-imx: increase the pad I/O drive strength for DDR50 card
   6986d0d29f3c ACPI / power: Avoid maybe-uninitialized warning
   cdede60d6a30 Input: elantech - add Fujitsu Lifebook E547 to force crc_enabled
   8d5ed79fb2d7 VSOCK: Detach QP check should filter out non matching QPs.
   f803416632b5 Drivers: hv: vmbus: Reduce the delay between retries in vmbus_post_msg()
   567dd48c4e71 Drivers: hv: get rid of timeout in vmbus_open()
   5ab982a01201 Drivers: hv: don't leak memory in vmbus_establish_gpadl()
   702db976b857 s390/mm: fix CMMA vs KSM vs others
   859d615b5be1 CIFS: remove bad_network_name flag
   f8fe51c86583 cifs: Do not send echoes before Negotiate is complete
   a2a67e53f92f ring-buffer: Have ring_buffer_iter_empty() return true when empty
   1dfb1c7bd63f tracing: Allocate the snapshot buffer before enabling probe
   c9460fbceb2f KEYS: fix keyctl_set_reqkey_keyring() to not leak thread keyrings
   eb78d9877579 KEYS: Change the name of the dead type to ".dead" to prevent user access
   b5737b92560e KEYS: Disallow keyrings beginning with '.' to be joined as session keyrings
   81af21fe95ba Linux 4.4.63
   d00557976676 MIPS: fix Select HAVE_IRQ_EXIT_ON_IRQ_STACK patch.
   e2f5fb9207a6 sctp: deny peeloff operation on asocs with threads sleeping on it
   f00f18ebb3b2 net: ipv6: check route protocol when deleting routes
   990a142ee0d3 tty/serial: atmel: RS485 half duplex w/DMA: enable RX after TX is done
   8dc821b9f67d SUNRPC: fix refcounting problems with auth_gss messages.
   403a728d1a35 ibmveth: calculate gso_segs for large packets
   65596042c3af catc: Use heap buffer for memory size test
   40531b26bade catc: Combine failure cleanup code in catc_probe()
   a90604be51de rtl8150: Use heap buffers for all register access
   be570e556dee pegasus: Use heap buffers for all register access
   eb5267657d85 virtio-console: avoid DMA from stack
   6be431f91632 dvb-usb-firmware: don't do DMA on stack
   502157457f52 dvb-usb: don't use stack for firmware load
   6739cc12f3db mm: Tighten x86 /dev/mem with zeroing reads
   ba02781392fa rtc: tegra: Implement clock handling
   ccf0904c49b1 platform/x86: acer-wmi: setup accelerometer when machine has appropriate notify event
   51f8d95c89b4 ext4: fix inode checksum calculation problem if i_extra_size is small
   0cb03b6e7086 dvb-usb-v2: avoid use-after-free
   ea6d8d67001a ath9k: fix NULL pointer dereference
   2673d1c5122e crypto: ahash - Fix EINPROGRESS notification callback
   70e55aaf9f8c powerpc: Disable HFSCR[TM] if TM is not supported
   9286385a3452 zram: do not use copy_page with non-page aligned address
   c1fc1d2f214e kvm: fix page struct leak in handle_vmon
   98c953a0a51f Revert "MIPS: Lantiq: Fix cascaded IRQ setup"
   a32c5331b462 char: lack of bool string made CONFIG_DEVPORT always on
   0a6aa0d1cf27 char: Drop bogus dependency of DEVPORT on !M68K
   7fe57118a7c0 ftrace: Fix removing of second function probe
   c51451e43bf1 irqchip/irq-imx-gpcv2: Fix spinlock initialization
   66b531d3ff11 libnvdimm: fix reconfig_mutex, mmap_sem, and jbd2_handle lockdep splat
   6058cf9929d9 xen, fbfront: fix connecting to backend
   b689dfbed8c8 scsi: sd: Fix capacity calculation with 32-bit sector_t
   448961955592 scsi: sd: Consider max_xfer_blocks if opt_xfer_blocks is unusable
   925adae6664c scsi: sr: Sanity check returned mode data
   1e1de2e841e1 iscsi-target: Drop work-around for legacy GlobalSAN initiator
   05c5dd75d77c iscsi-target: Fix TMR reference leak during session shutdown
   074bcc1302fd acpi, nfit, libnvdimm: fix interleave set cookie calculation (64-bit comparison)
   ec3978e10ecc x86/vdso: Plug race between mapping and ELF header setup
   f1c5d0163586 x86/vdso: Ensure vdso32_enabled gets set to valid values only
   f42be33fe976 perf/x86: Avoid exposing wrong/stale data in intel_pmu_lbr_read_32()
   a5e2f803b891 Input: xpad - add support for Razer Wildcat gamepad
   f0899d0e1e9e CIFS: store results of cifs_reopen_file to avoid infinite wait
   a11ab9dd4b78 drm/nouveau/mmu/nv4a: use nv04 mmu rather than the nv44 one
   a737abe4d09a drm/nouveau/mpeg: mthd returns true on success now
   ef4c962825c0 thp: fix MADV_DONTNEED vs clear soft dirty race
   3144d81a7735 cgroup, kthread: close race window where new kthreads can be migrated to non-root cgroups
   a80c068fbf43 Linux 4.4.62
   7d170f270a95 ibmveth: set correct gso_size and gso_type
   ac0cbfbb1e4b net/mlx4_core: Fix when to save some qp context flags for dynamic VST to VGT transitions
   710f793a15de net/mlx4_core: Fix racy CQ (Completion Queue) free
   f1e6b1149e49 net/mlx4_en: Fix bad WQE issue
   0a007f74b826 usb: hub: Wait for connection to be reestablished after port reset
   f4522e36edaa blk-mq: Avoid memory reclaim when remapping queues
   d35f8fa0b93e net/packet: fix overflow in check for priv area size
   fd8bae310684 crypto: caam - fix RNG deinstantiation error checking
   ba7681e4eee6 MIPS: IRQ Stack: Fix erroneous jal to plat_irq_dispatch
   f017e58da4ab MIPS: Select HAVE_IRQ_EXIT_ON_IRQ_STACK
   b39b26381668 MIPS: Switch to the irq_stack in interrupts
   93a82f8dbef8 MIPS: Only change $28 to thread_info if coming from user mode
   336365351285 MIPS: Stack unwinding while on IRQ stack
   d8b8b5528ea5 MIPS: Introduce irq_stack
   5a527d80836e mtd: bcm47xxpart: fix parsing first block after aligned TRX
   297f55bcb62a usb: dwc3: gadget: delay unmap of bounced requests
   8cfaf0ae1f56 drm/i915: Stop using RP_DOWN_EI on Baytrail
   cb0a2cba62d5 drm/i915: Avoid tweaking evaluation thresholds on Baytrail v3

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 660ad8a07efd..e92010c28c9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1af95315c6ab3672c8c7191873ef041a6c29ad70"
-SRCREV_meta ?= "d6733af2080f8c0775569adc0826eb0c8954fc5e"
+SRCREV_machine ?= "cb23b8e3ce0ad77acb717e249b4821c8350f1c83"
+SRCREV_meta ?= "db18675035528619e366d71de17bb84c2b9804c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.60"
+LINUX_VERSION ?= "4.4.67"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 04f719c5d028..dbcf6383bd19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.60"
+LINUX_VERSION ?= "4.4.67"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0298d3765a5c474ff5776284d49111276510d4b4"
-SRCREV_meta ?= "d6733af2080f8c0775569adc0826eb0c8954fc5e"
+SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
+SRCREV_meta ?= "db18675035528619e366d71de17bb84c2b9804c5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index d0eed655946c..f3f7f5e4f4c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7d2a3c70d62f1e7f4eba571c49ff299db2bb3829"
-SRCREV_machine_qemuarm64 ?= "0298d3765a5c474ff5776284d49111276510d4b4"
-SRCREV_machine_qemumips ?= "6100965a51cf6b99f57cf8234aa982beb79455c9"
-SRCREV_machine_qemuppc ?= "0298d3765a5c474ff5776284d49111276510d4b4"
-SRCREV_machine_qemux86 ?= "0298d3765a5c474ff5776284d49111276510d4b4"
-SRCREV_machine_qemux86-64 ?= "0298d3765a5c474ff5776284d49111276510d4b4"
-SRCREV_machine_qemumips64 ?= "522e709fd7088e1a55e7a4708b1a07caa2ca4336"
-SRCREV_machine ?= "0298d3765a5c474ff5776284d49111276510d4b4"
-SRCREV_meta ?= "d6733af2080f8c0775569adc0826eb0c8954fc5e"
+SRCREV_machine_qemuarm ?= "114f5a4f97fe44ac95c3e0ed370bd932b9296510"
+SRCREV_machine_qemuarm64 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
+SRCREV_machine_qemumips ?= "b0b3b8012a49293e98ba7601af03ee2e02ddbc85"
+SRCREV_machine_qemuppc ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
+SRCREV_machine_qemux86 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
+SRCREV_machine_qemux86-64 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
+SRCREV_machine_qemumips64 ?= "a9b8241a0c0e7626baba529abb4940831ff3a83e"
+SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
+SRCREV_meta ?= "db18675035528619e366d71de17bb84c2b9804c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.60"
+LINUX_VERSION ?= "4.4.67"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


