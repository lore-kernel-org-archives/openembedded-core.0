Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35A446FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1TMAeHo025672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 14:10:41 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:40 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:28 -0500
Message-ID: <95bee79789aafbcfcd51e8a8bafbe12c36fffc68.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 8/8] linux-yocto/4.4: update to 4.4.3
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:41 -0000
Content-Type: text/plain

The korg stable for 4.4.3 is out with the following changes:

   2134d97aa3a7 Linux 4.4.3
   e2f712dc927e modules: fix modparam async_probe request
   a24d9a2fee98 module: wrapper for symbol name.
   82e730baa9f7 itimers: Handle relative timers with CONFIG_TIME_LOW_RES proper
   1c94da3e7480 posix-timers: Handle relative timers with CONFIG_TIME_LOW_RES proper
   565f222968d3 timerfd: Handle relative timers with CONFIG_TIME_LOW_RES proper
   e5e99792b647 prctl: take mmap sem for writing to protect against others
   f86701c4f3cd xfs: log mount failures don't wait for buffers to be released
   16f14a28f660 Revert "xfs: clear PF_NOFREEZE for xfsaild kthread"
   7530e6fdd9f2 xfs: inode recovery readahead can race with inode buffer creation
   888959f2fd50 libxfs: pack the agfl header structure so XFS_AGFL_SIZE is correct
   8373f6590f6b ovl: setattr: check permissions before copy-up
   7193e802960f ovl: root: copy attr
   367e439dbc23 ovl: check dentry positiveness in ovl_cleanup_whiteouts()
   fa932190a5f3 ovl: use a minimal buffer in ovl_copy_xattr
   85a7ed329aca ovl: allow zero size xattr
   acaf84251f8d futex: Drop refcount if requeue_pi() acquired the rtmutex
   30066dcdf98a devm_memremap_release(): fix memremap'd addr handling
   15db15e2f10a ipc/shm: handle removed segments gracefully in shm_mmap()
   fe90acff2798 intel_scu_ipcutil: underflow in scu_reg_access()
   edfde263bd8a mm,thp: khugepaged: call pte flush at the time of collapse
   e31e46725596 dump_stack: avoid potential deadlocks
   55e0d9869f1d radix-tree: fix oops after radix_tree_iter_retry
   077b6173a8c8 drivers/hwspinlock: fix race between radix tree insertion and lookup
   f4595e008149 radix-tree: fix race in gang lookup
   262139f0244b MAINTAINERS: return arch/sh to maintained state, with new maintainers
   ececa3ebe27f memcg: only free spare array when readers are done
   4b20545910cb numa: fix /proc/<pid>/numa_maps for hugetlbfs on s390
   db33368ca32d fs/hugetlbfs/inode.c: fix bugs in hugetlb_vmtruncate_list()
   b105aa33af0d scripts/bloat-o-meter: fix python3 syntax error
   dad5038f3fe2 dma-debug: switch check from _text to _stext
   275adaf191c6 m32r: fix m32104ut_defconfig build fail
   71e5a4a747b0 xhci: Fix list corruption in urb dequeue at host removal
   d15298509b86 Revert "xhci: don't finish a TD if we get a short-transfer event mid TD"
   2231e5748746 iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts
   db3ac35cbd31 iommu/vt-d: Fix 64-bit accesses to 32-bit DMAR_GSTS_REG
   7c6471cb94ad iommu/vt-d: Fix mm refcounting to hold mm_count not mm_users
   d63a009a9bd9 iommu/amd: Correct the wrong setting of alias DTE in do_attach
   c65a7b684133 iommu/vt-d: Don't skip PCI devices when disabling IOTLB
   b864f4e50c56 Input: vmmouse - fix absolute device registration
   726ecfc32199 string_helpers: fix precision loss for some inputs
   5c73252f746d Input: i8042 - add Fujitsu Lifebook U745 to the nomux list
   1d70d30a5fa2 Input: elantech - mark protocols v2 and v3 as semi-mt
   d1f8217a9a6e mm: fix regression in remap_file_pages() emulation
   413aab16bc7b mm: replace vma_lock_anon_vma with anon_vma_lock_read/write
   918a2c388ed7 mm: fix mlock accouting
   6e8ea2f2258c libnvdimm: fix namespace object confusion in is_uuid_busy()
   bd55913cf208 mm: soft-offline: check return value in second __get_any_page() call
   a6a3f3ddf6a6 perf kvm record/report: 'unprocessable sample' error while recording/reporting guest data
   b58731d6263a KVM: PPC: Fix ONE_REG AltiVec support
   921fa9b77380 KVM: PPC: Fix emulation of H_SET_DABR/X on POWER8
   b3e336de65eb KVM: arm/arm64: Fix reference to uninitialised VGIC
   593337c55ac3 arm64: dma-mapping: fix handling of devices registered before arch_initcall
   a6e01f0c81d5 ARM: OMAP2+: Fix ppa_zero_params and ppa_por_params for rodata
   82de5956e9f4 ARM: OMAP2+: Fix save_secure_ram_context for rodata
   31a50ee1ad3e ARM: OMAP2+: Fix l2dis_3630 for rodata
   98b3f17a7235 ARM: OMAP2+: Fix l2_inv_api_params for rodata
   ec776d670e2d ARM: OMAP2+: Fix wait_dll_lock_timed for rodata
   6ec8b7c5bbdd ARM: dts: at91: sama5d4ek: add phy address and IRQ for macb0
   3b18631fbcea ARM: dts: at91: sama5d4 xplained: fix phy0 IRQ type
   080fc28fe475 ARM: dts: at91: sama5d4: fix instance id of DBGU
   5542d00c4653 ARM: dts: at91: sama5d4 xplained: properly mux phy interrupt
   a482d9448169 ARM: dts: omap5-board-common: enable rtc and charging of backup battery
   41a94b382396 ARM: dts: Fix omap5 PMIC control lines for RTC writes
   671a5bc6f54d ARM: dts: Fix wl12xx missing clocks that cause hangs
   323f7cd28b7f ARM: nomadik: fix up SD/MMC DT settings
   53d991bbbc51 ARM: 8517/1: ICST: avoid arithmetic overflow in icst_hz()
   9fe0b68c4949 ARM: 8519/1: ICST: try other dividends than 1
   a68f555363f5 arm64: mm: avoid calling apply_to_page_range on empty range
   242813b9a1b6 ARM: mvebu: remove duplicated regulator definition in Armada 388 GP
   602acfedc981 powerpc/ioda: Set "read" permission when "write" is set
   b5311270caba powerpc/powernv: Fix stale PE primary bus
   5ecdf58c1945 powerpc/eeh: Fix stale cached primary bus
   64f10cf83a6c powerpc/eeh: Fix PE location code
   782126b22522 SUNRPC: Fixup socket wait for memory
   d0452554b9a1 udf: Check output buffer length when converting name to CS0
   eec1445767cc udf: Prevent buffer overrun with multi-byte characters
   aef22a3d6945 udf: limit the maximum number of indirect extents in a row
   66b8812e87f3 pNFS/flexfiles: Fix an XDR encoding bug in layoutreturn
   d65eb5b3dfb1 nfs: Fix race in __update_open_stateid()
   c8841e15d6de pNFS/flexfiles: Fix an Oopsable typo in ff_mirror_match_fh()
   1873e6f48606 NFS: Fix attribute cache revalidation
   dadfe9220750 cifs: fix erroneous return value
   7e30995b26cc cifs_dbg() outputs an uninitialized buffer in cifs_readdir()
   5d80673404e6 cifs: fix race between call_async() and reconnect()
   88413fceab84 cifs: Ratelimit kernel log messages
   224f259d9393 iio: inkern: fix a NULL dereference on error
   e16eb4bb193c iio: pressure: mpl115: fix temperature offset sign
   909e9c55196d iio: light: acpi-als: Report data as processed
   377d1f59388f iio: dac: mcp4725: set iio name property in sysfs
   1c1d4f2d7629 iio: add IIO_TRIGGER dependency to STK8BA50
   dfa6e741d472 iio: add HAS_IOMEM dependency to VF610_ADC
   f865d8c326dd iio-light: Use a signed return type for ltr501_match_samp_freq()
   e9b0f0e411d0 iio:adc:ti_am335x_adc Fix buffered mode by identifying as software buffer.
   dc275a6eb9d0 iio: adis_buffer: Fix out-of-bounds memory access
   a258a959fcf3 scsi: fix soft lockup in scsi_remove_target() on module removal
   900ae746c1e9 SCSI: Add Marvell Console to VPD blacklist
   32c55052aa33 scsi_dh_rdac: always retry MODE SELECT on command lock violation
   4c654fc9357b drivers/scsi/sg.c: mark VMA as VM_IO to prevent migration
   d763177d00d7 SCSI: fix crashes in sd and sr runtime PM
   dcec7af70910 iscsi-target: Fix potential dead-lock during node acl delete
   954bb20f70ed scsi: add Synology to 1024 sector blacklist
   5b27adfac012 klist: fix starting point removed bug in klist iterators
   152fb02241b6 tracepoints: Do not trace when cpu is offline
   2fa82bbbc73a tracing: Fix freak link error caused by branch tracer
   6fa74f50e357 perf tools: tracepoint_error() can receive e=NULL, robustify it
   6e50ddaf0991 tools lib traceevent: Fix output of %llu for 64 bit values read on 32 bit machines
   969624b7c1c8 ptrace: use fsuid, fsgid, effective creds for fs access checks
   ba6d92801ba4 Btrfs: fix direct IO requests not reporting IO error to user space
   e8eced78e025 Btrfs: fix hang on extent buffer lock caused by the inode_paths ioctl
   be1232bcea11 Btrfs: fix page reading in extent_same ioctl leading to csum errors
   df567e6dcd22 Btrfs: fix invalid page accesses in extent_same (dedup) ioctl
   b58081d430b4 btrfs: properly set the termination value of ctx->pos in readdir
   dfd2961ab6ed Revert "btrfs: clear PF_NOFREEZE in cleaner_kthread()"
   4e6943903a8e Btrfs: fix fitrim discarding device area reserved for boot loader's use
   c57e49b50bc5 btrfs: handle invalid num_stripes in sys_array
   bbfe21c87bd0 ext4: don't read blocks from disk after extents being swapped
   600d41f4ecb5 ext4: fix potential integer overflow
   33f48f8ab0b9 ext4: fix scheduling in atomic on group checksum failure
   5859b9077763 serial: omap: Prevent DoS using unprivileged ioctl(TIOCSRS485)
   76e88140aa91 serial: 8250_pci: Add Intel Broadwell ports
   124efa9fd567 tty: Add support for PCIe WCH382 2S multi-IO card
   1bdf16025dfc pty: make sure super_block is still valid in final /dev/tty close
   3ceeb564198c pty: fix possible use after free of tty->driver_data
   a45f23edb00e staging/speakup: Use tty_ldisc_ref() for paste kworker
   3375ee8b9964 phy: twl4030-usb: Fix unbalanced pm_runtime_enable on module reload
   a90e66cb949a phy: twl4030-usb: Relase usb phy on unload
   a40efb855068 ALSA: seq: Fix double port list deletion
   6bb345ac7b30 ALSA: seq: Fix leak of pool buffer at concurrent writes
   ef0ca96169a2 ALSA: pcm: Fix rwsem deadlock for non-atomic PCM stream
   434e26d6f6a0 ALSA: hda - Cancel probe work instead of flush at remove
   6deb0ec93da6 x86/mm: Fix vmalloc_fault() to handle large pages properly
   e0c89043e71a x86/uaccess/64: Handle the caching of 4-byte nocache copies properly in __copy_user_nocache()
   1e2e0ad1cc16 x86/uaccess/64: Make the __copy_user_nocache() assembly code more readable
   4f298c10c35d x86/mm/pat: Avoid truncation when converting cpa->numpages to address
   75a101ba31fa x86/mm: Fix types used in pgprot cacheability flags translations

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 80d54f4ca0d9..7251c07fce81 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "48ef1e28a2a8904d287f9fde5f35d506ac42f4bb"
-SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
+SRCREV_machine ?= "853991833cc5140ca25450e81bf6b822d537a6ac"
+SRCREV_meta ?= "8b6a7d80344837fd64163008521a31a6f891313e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.2"
+LINUX_VERSION ?= "4.4.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index c840f771799a..0d35bc3ce8b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.2"
+LINUX_VERSION ?= "4.4.3"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
-SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
+SRCREV_machine ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_meta ?= "8b6a7d80344837fd64163008521a31a6f891313e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index dc7f75e1b98a..c5f160d78691 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "10de32377332ffc163525e850817780f5c577827"
-SRCREV_machine_qemuarm64 ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
-SRCREV_machine_qemumips ?= "6b8a34fc2d605ac87c4769670a8ea05804779ad0"
-SRCREV_machine_qemuppc ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
-SRCREV_machine_qemux86 ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
-SRCREV_machine_qemux86-64 ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
-SRCREV_machine_qemumips64 ?= "ebc3b0add55a3906616334fd4179b5dc04128276"
-SRCREV_machine ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
-SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
+SRCREV_machine_qemuarm ?= "fa6a2f888d8adfe03b24ef32654be470960aed41"
+SRCREV_machine_qemuarm64 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_machine_qemumips ?= "a23b6eb1c5bca3bde2a9f94d9059274fff7da281"
+SRCREV_machine_qemuppc ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_machine_qemux86 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_machine_qemux86-64 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_machine_qemumips64 ?= "8bbcb369cf605d1ada384f4b950da2abc5d1f4cc"
+SRCREV_machine ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_meta ?= "8b6a7d80344837fd64163008521a31a6f891313e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.2"
+LINUX_VERSION ?= "4.4.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


