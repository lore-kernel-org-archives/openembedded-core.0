Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D44A6021A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 04:39:18 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id cz10so10199857qvb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 21:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JMjGL/6OAJ35oany+ZLquMM3e/3x6v4k27G5R9Okz4Y=;
	b=T95W3lY0r6Ta1ilVXzfjmUPzRCjwNZ6eBWOc92bzPGWJy9xDAGiNiPJ1VFZWMedtHb
	f0l95fMGK8tJpAsQl0p6QiMnmtJwj0nR9bLgSPAS2U9D4KnKts8phdQSTSbBLfOnWoWC
	Ez3SWh1/kAozg3/wLwhxErE1jYR2FFxSJ2x8+LKRUS5Le4ek5aQRVKDKmapmRCOjJsFd
	T1rxLxtxBN094air1H07uBI9iJ2V2dy9M1QIE6TYQ8Z1gXOsfIfGEsMdB1x/tXBp0S/m
	iVBSxTZNBYLjHfOJNbzS/hPc3+cxLYn6u3oYvB/bqOhVU9bCA+GgXUiwaB0MamgBZhOb
	49Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JMjGL/6OAJ35oany+ZLquMM3e/3x6v4k27G5R9Okz4Y=;
	b=KjIBZDrlqEej42tCv0KiO1yeKNk6xIbkZM+ROpCUYAmEL7dAdTkmUBJduSj4lE2DAM
	xs61gv0NU1CmIbiR4VG684ETucTcOTB0k/rrB6m93UfrK3UqGvVxbD0pb4/Ph50VFnMI
	cObHELrNTlXDfPy/x2FEsuXwfu2CqniJe7H4mcVR0Zdw+SLLZh60IGRagEBPdhxoEjE1
	JNkBPMN/L2SBNonoWFC4xskUtVpz62Vpn0vSFhZwXHTft2VpwmXGYPIZ51FUNPBsSHfc
	tOJhLCGzSwakdffivHY62L+DFgvVR1QXIjnqrTVcFYcsrR7z837H6FCGvPE7x6dKpVaK
	K8FQ==
X-Gm-Message-State: ANhLgQ0IrIlvN8oGbDkX8UoE98OelGsimS7J9c3F0+KngCjfdSRYwVrw
	ECkWd8eWukLQmKwQm+Vrwsk=
X-Google-Smtp-Source: ADFU+vtK9gB3ljCRCBVgEXHH5KxYGYvGq18Q0T5CJyHGFhGDsml+4E0Vw43lHuEwKBgsFtm/o+TS/A==
X-Received: by 2002:a0c:fa03:: with SMTP id q3mr3061295qvn.228.1584419958824; 
	Mon, 16 Mar 2020 21:39:18 -0700 (PDT)
Received: from localhost.localdomain
	(CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.240.214])
	by smtp.gmail.com with ESMTPSA id 73sm1245498qkf.82.2020.03.16.21.39.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 21:39:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 17 Mar 2020 00:39:16 -0400
Message-Id: <20200317043916.47514-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus] linux-yocto/4.19: update to v4.19.107
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
X-List-Received-Date: Tue, 17 Mar 2020 04:39:18 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/4.19 to the latest korg -stable release that comprises
the following commits:

    16ae5406361a crypto: CVE-2019-18808
    a083db76118d Linux 4.19.107
    cfc30449bbc5 Revert "char/random: silence a lockdep splat with printk()"
    8541452acba5 s390/mm: Explicitly compare PAGE_DEFAULT_KEY against zero in storage_key_init_range
    fee87e931cc5 xen: Enable interrupts when calling _cond_resched()
    28a73a946a46 ata: ahci: Add shutdown to freeze hardware resources of ahci
    43cac315bec1 rxrpc: Fix call RCU cleanup using non-bh-safe locks
    acbc5071f073 netfilter: xt_hashlimit: limit the max size of hashtable
    5a2972600a2f ALSA: seq: Fix concurrent access to queue current tick/time
    b105447809b1 ALSA: seq: Avoid concurrent access to queue flags
    63495d1e1c7c ALSA: rawmidi: Avoid bit fields for state flags
    bf3043d27755 bpf, offload: Replace bitwise AND by logical AND in bpf_prog_offload_info_fill
    3132696dd748 genirq/proc: Reject invalid affinity masks (again)
    ba2c07dfa0d8 iommu/vt-d: Fix compile warning from intel-svm.h
    c0965be4b28b ecryptfs: replace BUG_ON with error handling code
    1bae8f424c84 staging: greybus: use after free in gb_audio_manager_remove_all()
    568991c91849 staging: rtl8723bs: fix copy of overlapping memory
    f8e6a3412dc6 usb: dwc2: Fix in ISOC request length checking
    de8dbb7b02fa usb: gadget: composite: Fix bMaxPower for SuperSpeedPlus
    1cad1a6497ec scsi: Revert "target: iscsi: Wait for all commands to finish before freeing a session"
    c66b2b571211 scsi: Revert "RDMA/isert: Fix a recently introduced regression related to logout"
    b046c6fec04e Revert "dmaengine: imx-sdma: Fix memory leak"
    cd26d53a27d6 Btrfs: fix btrfs_wait_ordered_range() so that it waits for all ordered extents
    4d886f91ca13 btrfs: do not check delayed items are empty for single transaction cleanup
    68b7db197bf8 btrfs: reset fs_root to NULL on error in open_ctree
    0ba8e5f347b2 btrfs: fix bytes_may_use underflow in prealloc error condtition
    e541982a6e5f KVM: apic: avoid calculating pending eoi from an uninitialized val
    267eec2d216d KVM: nVMX: handle nested posted interrupts when apicv is disabled for L1
    85dd0eb771e8 KVM: nVMX: Check IO instruction VM-exit conditions
    e5c0857bd5cc KVM: nVMX: Refactor IO bitmap checks into helper function
    8cf20fb73e73 ext4: fix race between writepages and enabling EXT4_EXTENTS_FL
    48fdbe2a818d ext4: rename s_journal_flag_rwsem to s_writepages_rwsem
    b7dc081c24db ext4: fix mount failure with quota configured as module
    50017cec3dbb ext4: fix potential race between s_flex_groups online resizing and access
    7720966a68c8 ext4: fix potential race between s_group_info online resizing and access
    cc9948abe47b ext4: fix potential race between online resizing and write operations
    38884609b8b5 ext4: add cond_resched() to __ext4_find_entry()
    9b6e90918bc0 ext4: fix a data race in EXT4_I(inode)->i_disksize
    0e3a6e86d43b drm/nouveau/kms/gv100-: Re-set LUT after clearing for modesets
    da3418ad747f lib/stackdepot.c: fix global out-of-bounds in stack_slabs
    56ad5b4b7405 tty: serial: qcom_geni_serial: Fix RX cancel command failure
    e6ebad85883d tty: serial: qcom_geni_serial: Remove xfer_mode variable
    4e438733f727 tty: serial: qcom_geni_serial: Remove set_rfr_wm() and related variables
    1cc8834773b2 tty: serial: qcom_geni_serial: Remove use of *_relaxed() and mb()
    4d1a94fa6d14 tty: serial: qcom_geni_serial: Remove interrupt storm
    0a38fd9326fd tty: serial: qcom_geni_serial: Fix UART hang
    fe1cfc645845 KVM: x86: don't notify userspace IOAPIC on edge-triggered interrupt EOI
    ed9e97c35b45 KVM: nVMX: Don't emulate instructions in guest mode
    6ca274be314b xhci: apply XHCI_PME_STUCK_QUIRK to Intel Comet Lake platforms
    8300ed5a2175 drm/amdgpu/soc15: fix xclk for raven
    837ba4829b9f mm/vmscan.c: don't round up scan size for online memory cgroup
    ea2a11561d01 genirq/irqdomain: Make sure all irq domain flags are distinct
    576c04cbbef2 nvme-multipath: Fix memory leak with ana_log_buf
    e75d2de90b86 mm/memcontrol.c: lost css_put in memcg_expand_shrinker_maps()
    cf85f00f87db Revert "ipc,sem: remove uneeded sem_undo_list lock usage in exit_sem()"
    af4693daff1b MAINTAINERS: Update drm/i915 bug filing URL
    c9ca2010202b serdev: ttyport: restore client ops on deregistration
    463a3db812d9 tty: serial: imx: setup the correct sg entry for tx dma
    6807593e8edc tty/serial: atmel: manage shutdown in case of RS485 or ISO7816 mode
    f4e6d51f3f40 serial: 8250: Check UPF_IRQ_SHARED in advance
    f28ec250579c x86/cpu/amd: Enable the fixed Instructions Retired counter IRPERF
    5e5b443ae6cc x86/mce/amd: Fix kobject lifetime
    0a3aca3a0f41 x86/mce/amd: Publish the bank pointer only after setup has succeeded
    4512119ac90a jbd2: fix ocfs2 corrupt when clearing block group bits
    72e2df70fb52 powerpc/tm: Fix clearing MSR[TS] in current when reclaiming on signal delivery
    e34182fb8a2f staging: rtl8723bs: Fix potential overuse of kernel memory
    e4770de3ae41 staging: rtl8723bs: Fix potential security hole
    b4eab56d96f1 staging: rtl8188eu: Fix potential overuse of kernel memory
    2a50bd9e2a69 staging: rtl8188eu: Fix potential security hole
    d59f6a6e35b7 usb: dwc3: gadget: Check for IOC/LST bit in TRB->ctrl fields
    c787444891a4 usb: dwc2: Fix SET/CLEAR_FEATURE and GET_STATUS flows
    8cfda0c9c966 USB: hub: Fix the broken detection of USB3 device in SMSC hub
    37d2eb43b64c USB: hub: Don't record a connect-change event during reset-resume
    babaa26b7c1c USB: Fix novation SourceControl XL after suspend
    2debc1717cf2 usb: uas: fix a plug & unplug racing
    4db4761cfe15 USB: quirks: blacklist duplicate ep on Sound Devices USBPre2
    63d176ed148a USB: core: add endpoint-blacklist quirk
    d74d5d042d42 usb: host: xhci: update event ring dequeue pointer on purpose
    2a2582dc62e9 xhci: Fix memory leak when caching protocol extended capability PSI tables - take 2
    7c8cde41a0c3 xhci: fix runtime pm enabling for quirky Intel hosts
    dce60e7efa97 xhci: Force Maximum Packet size for Full-speed bulk devices to valid range.

    <snip>

    c7f81d70d7ae ubifs: Fix default compression selection in ubifs
    3331e61b23b1 nvme: fix kernel paging oops
    2f99d478ddbd xfs: require both realtime inodes to mount
    b2d84967f076 bcache: do not mark writeback_running too early
    6f48e23888b9 bcache: do not check if debug dentry is ERR or NULL explicitly on remove
    c318f88411a8 rtl818x: fix potential use after free
    7cf86c89d7e4 brcmfmac: set SDIO F1 MesBusyCtrl for CYW4373
    38b73129c113 brcmfmac: set F2 watermark to 256 for 4373
    6138e4b132cd mwifiex: debugfs: correct histogram spacing, formatting
    1450ff720076 mwifiex: fix potential NULL dereference and use after free
    4912b454e029 arm64: dts: renesas: draak: Fix CVBS input
    48d37cc42390 crypto: user - support incremental algorithm dumps
    43cd68d7002b s390/zcrypt: make sysfs reset attribute trigger queue reset
    5ac0da68eae1 nvme: provide fallback for discard alloc failure
    d702d7bc7eb4 scsi: qla2xxx: Fix for FC-NVMe discovery for NPIV port
    78777dd6174e scsi: qla2xxx: Fix NPIV handling for FC-NVMe
    58ab95b03497 scsi: lpfc: Enable Management features for IF_TYPE=6
    e772949a3fd6 ACPI / LPSS: Ignore acpi_device_fix_up_power() return value
    d411bd858447 ARM: ks8695: fix section mismatch warning
    22227437ca68 xfs: zero length symlinks are not valid
    4d54a7969524 PM / AVS: SmartReflex: NULL check before some freeing functions is not needed
    d2e3e3c3c14b RDMA/vmw_pvrdma: Use atomic memory allocation in create AH
    64694b276d74 arm64: preempt: Fix big-endian when checking preempt count in assembly
    2ec103458855 RDMA/hns: Fix the bug while use multi-hop of pbl
    60da6da4b511 ARM: OMAP1: fix USB configuration for device-only setups
    0086d127f90d platform/x86: mlx-platform: Fix LED configuration
    08d8ab9615c5 bus: ti-sysc: Check for no-reset and no-idle flags at the child level
    4b40393b5240 arm64: smp: Handle errors reported by the firmware
    e3d27b94111b arm64: mm: Prevent mismatched 52-bit VA support
    57f3359cdabe ARM: dts: Fix hsi gdd range for omap4
    9b1f6bde17d6 parisc: Fix HP SDC hpa address output
    d18f228f504e parisc: Fix serio address output
    72a50a1e1c65 ARM: dts: imx53-voipac-dmm-668: Fix memory node duplication
    bf39f5b323eb ARM: dts: imx25: Fix memory node duplication
    d2eb50e57a5c ARM: dts: imx27: Fix memory node duplication
    54750b6f6671 ARM: dts: imx1: Fix memory node duplication
    6aeb6bd0eda6 ARM: dts: imx23: Fix memory node duplication
    1694780bd4ca ARM: dts: imx50: Fix memory node duplication
    2442b4c0f30a ARM: dts: imx6sl: Fix memory node duplication
    bae011f4c9a4 ARM: dts: imx6sx: Fix memory node duplication
    0990926c9395 ARM: dts: imx6ul: Fix memory node duplication
    e021f0ccc4fa ARM: dts: imx7: Fix memory node duplication
    a90469345b26 ARM: dts: imx35: Fix memory node duplication
    6bc1e695b4be ARM: dts: imx31: Fix memory node duplication
    ca02e14bdd7f ARM: dts: imx53: Fix memory node duplication
    5a1e6f95733c ARM: dts: imx51: Fix memory node duplication
    8c0c8c2a80b2 ARM: debug-imx: only define DEBUG_IMX_UART_PORT if needed
    dee3f7703207 tracing: Lock event_mutex before synth_event_mutex
    67547b9b4660 ARM: dts: Fix up SQ201 flash access
    ee6d2bedb400 scsi: lpfc: Fix dif and first burst use in write commands
    20feb7333049 scsi: lpfc: Fix kernel Oops due to null pring pointers
    a8c0f6334e56 scsi: target/tcmu: Fix queue_cmd_ring() declaration
    480233f89d42 pwm: bcm-iproc: Prevent unloading the driver module while in use
    27d22db4ccf1 block: drbd: remove a stray unlock in __drbd_send_protocol()
    51a564498cfb mac80211: fix station inactive_time shortly after boot
    b707e0da2791 net/fq_impl: Switch to kvmalloc() for memory allocation
    a8a61f82cc9f ceph: return -EINVAL if given fsc mount option on kernel w/o support
    0f716cda304b net: mscc: ocelot: fix __ocelot_rmw_ix prototype
    a30c6e424fdd net: bcmgenet: reapply manual settings to the PHY
    acd6a29134f0 net: bcmgenet: use RGMII loopback for MAC reset
    ff3f7465ee98 scripts/gdb: fix debugging modules compiled with hot/cold partitioning
    22f4892950b2 ASoC: stm32: sai: add restriction on mmap support
    3f034e6889e7 watchdog: meson: Fix the wrong value of left time
    7302e7b10855 can: mcp251x: mcp251x_restart_work_handler(): Fix potential force_quit race condition
    24e10fc2e0db can: flexcan: increase error counters if skb enqueueing via can_rx_offload_queue_sorted() fails
    ee7981538293 can: rx-offload: can_rx_offload_irq_offload_fifo(): continue on error
    5c8f5485614c can: rx-offload: can_rx_offload_irq_offload_timestamp(): continue on error
    eca4b786f3bb can: rx-offload: can_rx_offload_offload_one(): use ERR_PTR() to propagate error value in case of errors
    a85ce0107d6b can: rx-offload: can_rx_offload_offload_one(): increment rx_fifo_errors on queue overflow or OOM
    b83d4e4899d6 can: rx-offload: can_rx_offload_offload_one(): do not increase the skb_queue beyond skb_queue_len_max
    77f94f0d7f52 can: rx-offload: can_rx_offload_queue_tail(): fix error handling, avoid skb mem leak
    66e21b7b9251 can: c_can: D_CAN: c_can_chip_config(): perform a sofware reset on open
    7559e68ca91f can: peak_usb: report bus recovery as well
    c5b0bbef4367 bridge: ebtables: don't crash when using dnat target in output chains
    2070b33ee987 net: fec: add missed clk_disable_unprepare in remove
    28f34294442b clk: ti: clkctrl: Fix failed to enable error with double udelay timeout
    cb5a4049608c clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
    1677a0e54937 x86/resctrl: Prevent NULL pointer dereference when reading mondata
    8ef58b82d1e4 idr: Fix idr_alloc_u32 on 32-bit systems
    88358c7610cc idr: Fix integer overflow in idr_for_each_entry
    a6359d5e2d98 powerpc/bpf: Fix tail call implementation
    4665759af735 samples/bpf: fix build by setting HAVE_ATTR_TEST to zero
    40c3b8fc47b3 ARM: dts: sun8i-a83t-tbs-a711: Fix WiFi resume from suspend
    40017db20bfa clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18
    49ade064ea4b clk: sunxi: Fix operator precedence in sunxi_divs_clk_setup
    15fc2f3c64e7 clk: at91: avoid sleeping early
    8885552a061b reset: fix reset_control_ops kerneldoc comment
    a94913c0c8cf ARM: dts: imx6qdl-sabreauto: Fix storm of accelerometer interrupts
    5b15b1bf5428 pinctrl: cherryview: Allocate IRQ chip dynamic
    a0554203bc12 clk: samsung: exynos5420: Preserve PLL configuration during suspend/resume
    80e28fa256c9 ASoC: kirkwood: fix device remove ordering
    6a7472add344 ASoC: kirkwood: fix external clock probe defer
    a2c2cf16b059 clk: samsung: exynos5433: Fix error paths
    9a5933aa1242 reset: Fix memory leak in reset_control_array_put()
    e8eb6233be9a ASoC: compress: fix unsigned integer overflow check
    7971b7fd5623 ASoC: msm8916-wcd-analog: Fix RX1 selection in RDAC2 MUX
    daa2c4030510 clocksource/drivers/mediatek: Fix error handling
    9c65bb9518ea clk: meson: gxbb: let sar_adc_clk_div set the parent clock rate

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index b6e0a1e9e2..93c4472316 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2fbf678238302f33b3aec5a2cba829f260744f24"
-SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
+SRCREV_machine ?= "40e34fdcb540e35b1a97e8e52c11dfe52bd68b16"
+SRCREV_meta ?= "7cb520d405cd5ca8f21a333941fbc0861bbb36b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.87"
+LINUX_VERSION ?= "4.19.107"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index e2626ab4c9..76b2467ef5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.87"
+LINUX_VERSION ?= "4.19.107"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bd239fb802a15c2759ea456dd1f09f5e106fc88a"
-SRCREV_machine ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
+SRCREV_machine_qemuarm ?= "e2c947b59c650f2aa2f0f88d6af90f9dfb336e04"
+SRCREV_machine ?= "16ae5406361af8329b74580697cb738dadeb1ecb"
+SRCREV_meta ?= "7cb520d405cd5ca8f21a333941fbc0861bbb36b0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index c6e482a984..6e3b00e0e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "19fa1657d1d82d01647c6f73a2bbf39305505294"
-SRCREV_machine_qemuarm64 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemumips ?= "8fb7ab96b84852ee3d9e1d9d9e7bc35e1249b653"
-SRCREV_machine_qemuppc ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemux86 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemux86-64 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemumips64 ?= "c8a036abd7d469013dddab15a23e0d2dde1d0000"
-SRCREV_machine ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
+SRCREV_machine_qemuarm ?= "c8b87f4d12eb957d8a95442a928ef4820037bb55"
+SRCREV_machine_qemuarm64 ?= "16ae5406361af8329b74580697cb738dadeb1ecb"
+SRCREV_machine_qemumips ?= "94f102eaca76ffdcc3d47ea94b47486d7157c531"
+SRCREV_machine_qemuppc ?= "16ae5406361af8329b74580697cb738dadeb1ecb"
+SRCREV_machine_qemux86 ?= "16ae5406361af8329b74580697cb738dadeb1ecb"
+SRCREV_machine_qemux86-64 ?= "16ae5406361af8329b74580697cb738dadeb1ecb"
+SRCREV_machine_qemumips64 ?= "98288b7e79bc8130c2a889d763c9c1aa15ff4939"
+SRCREV_machine ?= "16ae5406361af8329b74580697cb738dadeb1ecb"
+SRCREV_meta ?= "7cb520d405cd5ca8f21a333941fbc0861bbb36b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.87"
+LINUX_VERSION ?= "4.19.107"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


