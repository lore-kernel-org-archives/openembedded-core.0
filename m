Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8C577C87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:46:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C3kZA2014324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Apr 2017 20:46:35 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 20:46:34 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Apr 2017 23:46:29 -0400
Message-ID: <954b0d2b94f50dd90e78c8a56331fe433355677d.1491968220.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1491968220.git.bruce.ashfield@windriver.com>
References: <cover.1491968220.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/4.4: update to v4.4.60
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
X-List-Received-Date: Wed, 12 Apr 2017 03:46:34 -0000
Content-Type: text/plain

Updating to the korg stable relase with the following shortlog summary:

   8f8ee9706b0a Linux 4.4.60
   84bd21a708b8 padata: avoid race in reordering
   5cca175b6cda blk: Ensure users for current->bio_list can see the full list.
   2cbd78f4239b blk: improve order of bio handling in generic_make_request()
   063d30f187f5 power: reset: at91-poweroff: timely shutdown LPDDR memories
   42462d23e60b KVM: kvm_io_bus_unregister_dev() should never fail
   3a1246b46df5 rtc: s35390a: improve irq handling
   a55ae9d1937b rtc: s35390a: implement reset routine as suggested by the reference
   fdd4bc9313e5 rtc: s35390a: make sure all members in the output are set
   b3ed3864912e rtc: s35390a: fix reading out alarm
   6280ac931a23 MIPS: Lantiq: Fix cascaded IRQ setup
   47e2fe17d14d mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd()
   ef55c3df5dbd drm/radeon: Override fpfn for all VRAM placements in radeon_evict_flags
   3eb392056aeb KVM: x86: clear bus pointer when destroyed
   eac3ab3e6915 USB: fix linked-list corruption in rh_call_control()
   0a1757cfa5ba tty/serial: atmel: fix TX path in atmel_console_write()
   74b8fc017d76 tty/serial: atmel: fix race condition (TX+DMA)
   566a8711a7dd ACPI: Do not create a platform_device for IOAPIC/IOxAPIC
   3342857ac074 ACPI: Fix incompatibility with mcount-based function graph tracing
   ab48ab614b8c ASoC: atmel-classd: fix audio clock rate
   ce3dcfdbff04 ALSA: hda - fix a problem for lineout on a Dell AIO machine
   a90d7447e4a1 ALSA: seq: Fix race during FIFO resize
   75a03869c93a scsi: libsas: fix ata xfer length
   a92f411914ca scsi: sg: check length passed to SG_NEXT_CMD_LEN
   18639c4bad72 scsi: mpt3sas: fix hang on ata passthrough commands
   1eed198ce16b xen/setup: Don't relocate p2m over existing one
   ba46d8fab00a libceph: force GFP_NOIO for socket allocations
   61a4577c9a44 Linux 4.4.59
   2bed5987692c sched/rt: Add a missing rescheduling point
   7a5202190810 fscrypt: remove broken support for detecting keyring key revocation
   573341eba9c4 metag/ptrace: Reject partial NT_METAG_RPIPE writes
   e441102d8c07 metag/ptrace: Provide default TXSTATUS for short NT_PRSTATUS
   2d9bc3695012 metag/ptrace: Preserve previous registers for short regset write
   962b95a88574 sparc/ptrace: Preserve previous registers for short regset write
   c8693666856c mips/ptrace: Preserve previous registers for short regset write
   e1dc8904b33b h8300/ptrace: Fix incorrect register transfer count
   6e174bbd0631 c6x/ptrace: Remove useless PTRACE_SETREGSET implementation
   800791e7e0fd pinctrl: qcom: Don't clear status bit on irq_unmask
   927d04793f8a virtio_balloon: init 1st buffer in stats vq
   22c9e7c092f6 xfrm_user: validate XFRM_MSG_NEWAE incoming ESN size harder
   cce7e56dd73f xfrm_user: validate XFRM_MSG_NEWAE XFRMA_REPLAY_ESN_VAL replay_window
   a9a76a3e318e xfrm: policy: init locks early
   0a5766a6a73b Linux 4.4.58
   f8a62dbc7902 crypto: algif_hash - avoid zero-sized array
   540d6d756ff8 fbcon: Fix vc attr at deinit
   ac601978a2aa serial: 8250_pci: Detach low-level driver during PCI error recovery
   b8687d83b34c ACPI / blacklist: Make Dell Latitude 3350 ethernet work
   d3607fc2976e ACPI / blacklist: add _REV quirks for Dell Precision 5520 and 3520
   4e2c66bb6658 uvcvideo: uvc_scan_fallback() for webcams with broken chain
   ce5494107946 s390/zcrypt: Introduce CEX6 toleration
   7023f502c835 block: allow WRITE_SAME commands with the SG_IO ioctl
   9fd9e1436380 vfio/spapr: Postpone allocation of userspace version of TCE table
   4110080574ac PCI: Do any VF BAR updates before enabling the BARs
   bcbdcf48469b PCI: Ignore BAR updates on virtual functions
   d4f09ea7e35c PCI: Update BARs using property bits appropriate for type
   131f7969048b PCI: Don't update VF BARs while VF memory space is enabled
   40a85d68185f PCI: Decouple IORESOURCE_ROM_ENABLE and PCI_ROM_ADDRESS_ENABLE
   1278c9f87f11 PCI: Add comments about ROM BAR updating
   cef498a2c75a PCI: Remove pci_resource_bar() and pci_iov_resource_bar()
   a87693ec42f2 PCI: Separate VF BAR updates from standard BAR updates
   e4ce31c0265d x86/hyperv: Handle unknown NMIs on one CPU when unknown_nmi_panic
   ca7e3bdc9c7e igb: add i211 to i210 PHY workaround
   4db313df4946 igb: Workaround for igb i210 firmware issue
   ec52364445a4 xen: do not re-use pirq number cached in pci device msi msg data
   6d43e485e006 xfs: clear _XBF_PAGES from buffers when readahead page
   f154de03f416 USB: usbtmc: add missing endpoint sanity check
   74c8dd066cc0 nl80211: fix dumpit error path RTNL deadlocks
   7922c1becb36 xfs: fix up xfs_swap_extent_forks inline extent handling
   c4cf86f69597 xfs: don't allow di_size with high bit set
   48da8f817b9d libceph: don't set weight to IN when OSD is destroyed
   73dd1edf50a6 raid10: increment write counter after bio is split
   175039632065 cpufreq: Restore policy min/max limits on CPU online
   e1af444e52ce ARM: dts: at91: sama5d2: add dma properties to UART nodes
   2705b183263b ARM: at91: pm: cpu_idle: switch DDR to power-down mode
   55b6c187cf9d iommu/vt-d: Fix NULL pointer dereference in device_to_iommu
   c856b66c8aac xen/acpi: upload PM state from init-domain to Xen
   52e40a2fcc39 mmc: sdhci: Do not disable interrupts while waiting for clock
   27d9bf096406 ext4: mark inode dirty after converting inline directory
   c7d1545c48ff parport: fix attempt to write duplicate procfiles
   7413d1f8991e iio: hid-sensor-trigger: Change get poll value function order to avoid sensor properties losing after resume from S3
   8f189e1d0eca iio: adc: ti_am335x_adc: fix fifo overrun recovery
   dcf879cb9ed3 mmc: ushc: fix NULL-deref at probe
   2c251e568e1a uwb: hwa-rc: fix NULL-deref at probe
   815321da2e26 uwb: i1480-dfu: fix NULL-deref at probe
   14a2032287d4 usb: hub: Fix crash after failure to read BOS descriptor
   47285be050ca usb: musb: cppi41: don't check early-TX-interrupt for Isoch transfer
   a7cb1fafe429 USB: wusbcore: fix NULL-deref at probe
   d6389d6abb8a USB: idmouse: fix NULL-deref at probe
   a7712869e2e7 USB: lvtest: fix NULL-deref at probe
   73490abe249c USB: uss720: fix NULL-deref at probe
   2c929ea720f9 usb-core: Add LINEAR_FRAME_INTR_BINTERVAL USB quirk
   8a8a8007871a usb: gadget: f_uvc: Fix SuperSpeed companion descriptor's wBytesPerInterval
   19f0fe67b9d0 ACM gadget: fix endianness in notifications
   9218793a39de USB: serial: qcserial: add Dell DW5811e
   8f0f081647cc USB: serial: option: add Quectel UC15, UC20, EC21, and EC25 modems
   1ea551eec703 ALSA: hda - Adding a group of pin definition to fix headset problem
   ed00b613bbcb ALSA: ctxfi: Fix the incorrect check of dma_set_mask() call
   b55ffcb1bc8a ALSA: seq: Fix racy cell insertions during snd_seq_pool_done()
   549993001e7d Input: sur40 - validate number of endpoints before using them
   b3c4c0c470b5 Input: kbtab - validate number of endpoints before using them
   c05490638ddf Input: cm109 - validate number of endpoints before using them
   e916f1d6188e Input: yealink - validate number of endpoints before using them
   0812c6855c89 Input: hanwang - validate number of endpoints before using them
   6bed7c1e2b78 Input: ims-pcu - validate number of endpoints before using them
   a07d3669654a Input: iforce - validate number of endpoints before using them
   5f9243e4fca6 Input: i8042 - add noloop quirk for Dell Embedded Box PC 3000
   9ac7bd114e13 Input: elan_i2c - add ASUS EeeBook X205TA special touchpad fw
   afaed241928f tcp: initialize icsk_ack.lrcvtime at session start time
   95aa915c2f04 socket, bpf: fix sk_filter use after free in sk_clone_lock
   38dece41e5be ipv4: provide stronger user input validation in nl_fib_input()
   85f00dac91a1 net: bcmgenet: remove bcmgenet_internal_phy_setup()
   fdcee7c1e2f8 net/mlx5e: Count LRO packets correctly
   9d1894cba25c net/mlx5: Increase number of max QPs in default profile
   610c6bcc5fcf net: unix: properly re-increment inflight counter of GC discarded candidates
   ae43f9360a21 amd-xgbe: Fix jumbo MTU processing on newer hardware
   f3126725228c net: properly release sk_frag.page
   12f0bffc489d net: bcmgenet: Do not suspend PHY if Wake-on-LAN is enabled
   b362d6735156 net/openvswitch: Set the ipv6 source tunnel key address attribute correctly
   a5c3f390eb77 Linux 4.4.57
   5fa513cb0721 ext4: fix fencepost in s_first_meta_bg validation
   d88b83e66bbf percpu: acquire pcpu_lock when updating pcpu_nr_empty_pop_pages
   e08f608ab428 gfs2: Avoid alignment hole in struct lm_lockname
   4f47ca488256 isdn/gigaset: fix NULL-deref at probe
   d267ecbdfdb4 target: Fix VERIFY_16 handling in sbc_parse_cdb
   246760c61d9c scsi: libiscsi: add lock around task lists to fix list corruption regression
   82bd06aba880 scsi: lpfc: Add shutdown method for kexec
   0a621633cdfa target/pscsi: Fix TYPE_TAPE + TYPE_MEDIMUM_CHANGER export
   582f548924cd md/raid1/10: fix potential deadlock
   b24473976b98 powerpc/boot: Fix zImage TOC alignment
   09875d1393d4 cpufreq: Fix and clean up show_cpuinfo_cur_freq()
   f02729f2ab87 perf/core: Fix event inheritance on fork()
   4cb0c0b73d1c give up on gcc ilog2() constant optimizations
   6052eb871217 kernek/fork.c: allocate idle task for a CPU always on its local node
   6cc5b73d7969 hv_netvsc: use skb_get_hash() instead of a homegrown implementation
   cea050150323 tpm_tis: Use devm_free_irq not free_irq
   13a26889cbc1 drm/amdgpu: add missing irq.h include
   68ea3948ed3d s390/pci: fix use after free in dma_init
   50730d7f361f KVM: PPC: Book3S PR: Fix illegal opcode emulation
   e2d9577854f5 xen/qspinlock: Don't kick CPU if IRQ is not initialized
   b1a0f744f8e6 Drivers: hv: avoid vfree() on crash
   0a2512768f16 Drivers: hv: balloon: don't crash when memory is added in non-sorted order
   3787a071d145 pinctrl: cherryview: Do not mask all interrupts in probe
   962c66c74184 ACPI / video: skip evaluating _DOD when it does not exist
   12e1a3cd11ea cxlflash: Increase cmd_per_lun for better throughput
   f8c07cbc2e72 crypto: mcryptd - Fix load failure
   10659b8f5c60 crypto: cryptd - Assign statesize properly
   c78c3376ec67 crypto: ghash-clmulni - Fix load failure
   45d9558837d4 USB: don't free bandwidth_mutex too early
   ac1a97d8a562 usb: core: hub: hub_port_init lock controller instead of bus

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 278a900c16b2..660ad8a07efd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "95f418b97f423e43d144884dc0bd6de207752ad0"
-SRCREV_meta ?= "271b0c8d5128f0cb18ed413cc59f683132ff8e3f"
+SRCREV_machine ?= "1af95315c6ab3672c8c7191873ef041a6c29ad70"
+SRCREV_meta ?= "d6733af2080f8c0775569adc0826eb0c8954fc5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.56"
+LINUX_VERSION ?= "4.4.60"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index fcc7e0438c74..04f719c5d028 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.56"
+LINUX_VERSION ?= "4.4.60"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
-SRCREV_meta ?= "271b0c8d5128f0cb18ed413cc59f683132ff8e3f"
+SRCREV_machine ?= "0298d3765a5c474ff5776284d49111276510d4b4"
+SRCREV_meta ?= "d6733af2080f8c0775569adc0826eb0c8954fc5e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index e3153a783a5e..d0eed655946c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "01aaede0a243457a3557167d40488d89335d9e73"
-SRCREV_machine_qemuarm64 ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
-SRCREV_machine_qemumips ?= "c7ac6707736e0e7b93d93428d805df356a9f3888"
-SRCREV_machine_qemuppc ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
-SRCREV_machine_qemux86 ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
-SRCREV_machine_qemux86-64 ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
-SRCREV_machine_qemumips64 ?= "6af68e1545ba85755591a1495c6d34b29ac61406"
-SRCREV_machine ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
-SRCREV_meta ?= "271b0c8d5128f0cb18ed413cc59f683132ff8e3f"
+SRCREV_machine_qemuarm ?= "7d2a3c70d62f1e7f4eba571c49ff299db2bb3829"
+SRCREV_machine_qemuarm64 ?= "0298d3765a5c474ff5776284d49111276510d4b4"
+SRCREV_machine_qemumips ?= "6100965a51cf6b99f57cf8234aa982beb79455c9"
+SRCREV_machine_qemuppc ?= "0298d3765a5c474ff5776284d49111276510d4b4"
+SRCREV_machine_qemux86 ?= "0298d3765a5c474ff5776284d49111276510d4b4"
+SRCREV_machine_qemux86-64 ?= "0298d3765a5c474ff5776284d49111276510d4b4"
+SRCREV_machine_qemumips64 ?= "522e709fd7088e1a55e7a4708b1a07caa2ca4336"
+SRCREV_machine ?= "0298d3765a5c474ff5776284d49111276510d4b4"
+SRCREV_meta ?= "d6733af2080f8c0775569adc0826eb0c8954fc5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.56"
+LINUX_VERSION ?= "4.4.60"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


