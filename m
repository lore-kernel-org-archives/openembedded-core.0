Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5E85E7F7E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:47 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id o9so1217383plk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=R2oLd5uW8bkEdfn/b9JMDmWZmg6V3JiLAc4l/oaBVLs=;
	b=e/7FTqJmswU52BqJ0t2xJ1S3A+HU2UPQpyo5VocSTiCa07pgV10dzncWKOWHDATChS
	G7PRJS4H7ilndPSj/iAjNUuCrjrfZmTXhQR+J/n5xlLhKNivy9/NYZv19u6TLmHgHEWL
	QjX/AcWD+ncfFslB1n2m3sl6PUIgknejyYeJ8AJQETN+pWFE4zWVCImhtDRaFpmrNXKY
	oG8T7nn22gG4SXJPKf6YrkN/wJ++Du4aHHmZtT/DBD2zCps1vo7gCAoRvI9ABSO/taEx
	QyX46yiYyrnOS/r/hNt999jiLwaxV8QHk9QCPDMr7jICeHFHv9A2rOKvrvy6FlZLDadP
	WqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=R2oLd5uW8bkEdfn/b9JMDmWZmg6V3JiLAc4l/oaBVLs=;
	b=LAbM7othpge9HtpgF4lAdw/7M2GdR1B5td5QzgKACp/PhAPg2NaR9o+tWkbRnBN7ua
	dAgmqwf3XDTLmH1jcZrdhCpfd2t6giaqeCzGf2LpaWIu7Y4Ut5MMA0xkRXccDJXSpQvz
	bd1ZrghjAKJ5GVzKbHWSGHuqOvP0FZ470qhTE/tWtHLg/P8SCrMRs6mbGOEhl7YPjBef
	E3Q6rnha7l0KcNwN6JNs5yPsYAwtjLI954iqAfSPVl0M2+nsuJKz0f4RX75dkNR8iabE
	4UN7NLl6nfq99aYk5YA3N1tvOzoYPBV1BMw36yDbvCxqJkbFtEWjobP9bqyw4tfqwE2q
	fegw==
X-Gm-Message-State: APjAAAXUa9tBLVK6n4V9EQsfxzxJrNh3uxZyd9RPjDj5Or98oakGxJOk
	IG341BhSGw8p81teo+67p8EvXpLy
X-Google-Smtp-Source: APXvYqzpUacsUpV+j9G/q4fbjCmeBcTHVDbF/XQ0APUm1Wr+PLXazx5Yfjh/kAGm7BAvsXnj+QtD1g==
X-Received: by 2002:a17:902:d693:: with SMTP id
	v19mr4499824ply.220.1573659167380; 
	Wed, 13 Nov 2019 07:32:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:04 -0800
Message-Id: <6017a468d61afbdc6c3e3c406adb16d49ca08fd3.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 22/31] linux-yocto/5.2: update to v5.2.20
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:47 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    56fd0c9f5473 Linux 5.2.20
    6f375cee0394 vfs: set fs_context::user_ns for reconfigure
    fbad63fcf7f8 9p/cache.c: Fix memory leak in v9fs_cache_session_get_cookie
    23721140761c KVM: hyperv: Fix Direct Synthetic timers assert an interrupt w/o lapic_in_kernel
    f6e1c74f5664 kexec: bail out upon SIGKILL when allocating memory.
    a761ba725477 NFC: fix attrs checks in netlink interface
    08519f370a57 dm raid: fix updating of max_discard_sectors limit
    069a73c93447 smack: use GFP_NOFS while holding inode_smack::smk_lock
    73cf33180fd5 Smack: Don't ignore other bprm->unsafe flags if LSM_UNSAFE_PTRACE is set
    e4875cfb207f soundwire: fix regmap dependencies and align with other serial links
    455807823191 arm: use STACK_TOP when computing mmap base address
    a7d44c89fb47 arm: properly account for stack randomization and stack guard gap
    d474fced6704 mips: properly account for stack randomization and stack guard gap
    5edc5cfcd1ce arm64: consider stack randomization for mmap base only when necessary
    0499bb1b61cd kmemleak: increase DEBUG_KMEMLEAK_EARLY_LOG_SIZE default to 16K
    b71617b36dc6 ocfs2: wait for recovering done after direct unlock request
    5f63ef732675 kbuild: clean compressed initramfs image
    26235380e633 crypto: hisilicon - Fix double free in sec_free_hw_sgl()
    ef1bb2f3c68c hypfs: Fix error number left in struct pointer member
    86fa1c1b3ab1 pktcdvd: remove warning on attempting to register non-passthrough dev
    30ef03cb2c46 fat: work around race with userspace's read via blockdev while mounting
    049e9c72a671 ARM: 8903/1: ensure that usable memory in bank 0 starts from a PMD-aligned address
    68a14319be38 ARM: 8905/1: Emit __gnu_mcount_nc when using Clang 10.0.0 or newer
    b10ee4270915 PCI: Use static const struct, not const static struct
    88b4b5b7e2a8 security: smack: Fix possible null-pointer dereferences in smack_socket_sock_rcv_skb()
    0728352751bb PCI: exynos: Propagate errors for optional PHYs
    6eb7a0a0eb86 PCI: imx6: Propagate errors for optional regulators
    130642ed27a6 PCI: histb: Propagate errors for optional regulators
    dc35055b644f PCI: rockchip: Propagate errors for optional regulators
    06f8fc7effb5 HID: apple: Fix stuck function keys when using FN
    1c8c46bdfcde PCI: Add pci_info_ratelimited() to ratelimit PCI separately
    400a250cc06f selinux: fix residual uses of current_security() for the SELinux blob
    30f8969d6265 rtc: pcf85363/pcf85263: fix regmap error in set_time
    1a5f22226ad0 rtc: snvs: fix possible race condition
    6edfcbdc24be ARM: 8875/1: Kconfig: default to AEABI w/ Clang
    5a58f0bf27ff soundwire: intel: fix channel number reported by hardware
    175f4efcb12a ARM: 8898/1: mm: Don't treat faults reported from cache maintenance as writes
    cf4e9c2472ac mips/atomic: Fix smp_mb__{before,after}_atomic()
    a7ef43bf9064 livepatch: Nullify obj->mod in klp_module_coming()'s error path
    677540cb39e0 PCI: layerscape: Add the bar_fixed_64bit property to the endpoint driver
    97c3d2a3dd8f PCI: pci-hyperv: Fix build errors on non-SYSFS config
    57e4c0e0efce mips/atomic: Fix loongson_llsc_mb() wreckage
    11daaf5c38f2 HID: wacom: Fix several minor compiler warnings
    503aae8dcc18 PCI: tegra: Fix OF node reference leak
    b0a68c638875 mfd: intel-lpss: Remove D3cold delay
    b6cb1efe18cc i2c-cht-wc: Fix lockdep warning
    d1d45f98a6e6 MIPS: tlbex: Explicitly cast _PAGE_NO_EXEC to a boolean
    7bd355196324 MIPS: Don't use bc_false uninitialized in __mm_isBranchInstr
    cac61f5b7d95 MIPS: Ingenic: Disable broken BTB lookup optimization.
    b67fd3bfeec5 ext4: fix potential use after free after remounting with noblock_validity
    ad849db7534b f2fs: fix to drop meta/node pages during umount
    ce7adbbc06e3 dma-buf/sw_sync: Synchronize signal vs syncpt free
    99a2037bec11 scsi: core: Reduce memory required for SCSI logging
    cbd9a87fbdf9 clk: sprd: add missing kfree
    4d5a7f001acc mbox: qcom: add APCS child device for QCS404
    910d8b71530c powerpc: dump kernel log before carrying out fadump or kdump
    04dddb1ca7ad clk: Make clk_bulk_get_all() return a valid "id"
    b6185efcf241 clk: imx: clk-pll14xx: unbypass PLL by default
    d54c3307cac1 clk: imx: pll14xx: avoid glitch when set rate
    9b538d38aa92 clk: at91: select parent if main oscillator or bypass is enabled
    39a3ff30b6ad arm64: fix unreachable code issue with cmpxchg
    15786d677bbc mailbox: mediatek: cmdq: clear the event in cmdq initial flow
    1496f3d15934 pinctrl: meson-gxbb: Fix wrong pinning definition for uart_c
    112f51caf1b6 powerpc/pseries: correctly track irq state in default idle
    f87906966831 clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
    e5169c0043af powerpc/eeh: Clean up EEH PEs after recovery finishes
    c25829e2e7de pstore: fs superblock limits
    b32e4cc264c8 powerpc/64s/exception: machine check use correct cfar for late handler
    f939cc03668f drm/amdgpu/si: fix ASIC tests
    bfbc57ef3481 selftests/powerpc: Retry on host facility unavailable
    73bffb99ddca drm/amd/display: support spdif
    18184bd06a69 clk: renesas: cpg-mssr: Set GENPD_FLAG_ALWAYS_ON for clock domain
    b4b220dfcd36 clk: renesas: mstp: Set GENPD_FLAG_ALWAYS_ON for clock domain
    b5c5e7dfde66 pinctrl: amd: disable spurious-firing GPIO IRQs
    b1a330db3cc3 drm/nouveau/volt: Fix for some cards having 0 maximum voltage
    ecce6020a052 drm/nouveau/kms/tu102-: disable input lut when input is already FP16
    6ad134a33083 vfio_pci: Restore original state on release
    169edc8a1b8b powerpc/eeh: Clear stale EEH_DEV_NO_HANDLER flag
    0b54040780ce pinctrl: tegra: Fix write barrier placement in pmx_writel
    a16c6638d760 powerpc/perf: fix imc allocation failure handling
    4ce5f278af62 powerpc/pseries/mobility: use cond_resched when updating device tree
    714886254f3c powerpc/64s/radix: Fix memory hotplug section page table creation
    de37ad13aca1 powerpc/futex: Fix warning: 'oldval' may be used uninitialized in this function
    f2118bfd0259 powerpc/rtas: use device model APIs and serialization during LPM
    26c32f58d8eb powerpc/xmon: Check for HV mode when dumping XIVE info from OPAL
    fa702b72cbf9 clk: zx296718: Don't reference clk_init_data after registration
    5772dedde987 clk: sprd: Don't reference clk_init_data after registration
    3c384b661818 clk: meson: axg-audio: Don't reference clk_init_data after registration
    8e9a12894cc3 clk: sirf: Don't reference clk_init_data after registration
    5a90971761cd clk: actions: Don't reference clk_init_data after registration
    672ce7241a40 powerpc/powernv/ioda2: Allocate TCE table levels on demand for default DMA window
    97641efe039e drm/amd/display: reprogram VM config when system resume
    075ad48409c1 drm/amd/display: Fix frames_to_insert math
    73de2baa5b3c drm/amd/display: fix issue where 252-255 values are clipped
    98ecf758e63f clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
    60e5b94e4fe6 clk: qoriq: Fix -Wunused-const-variable
    99340b4cad30 ipmi_si: Only schedule continuously in the thread in maintenance mode
    dc8331fb5397 pinctrl: stmfx: update pinconf settings
    49b23a7d976d PCI: rpaphp: Avoid a sometimes-uninitialized warning
    d1deded18c3e clk: imx8mq: Mark AHB clock as critical
    22acd1a64d95 gpu: drm: radeon: Fix a possible null-pointer dereference in radeon_connector_set_property()
    0cb2ddf9a3a0 drm/radeon: Fix EEH during kexec
    a86a8e6ef256 drm/amdgpu: Fix hard hang for S/G display BOs.
    d8847b4b3a24 drm/rockchip: Check for fast link training before enabling psr
    d85e0b4ef1f2 drm/panel: check failure cases in the probe func
    f85634c3ffd2 drm/stm: attach gem fence to atomic state
    0b271676816a drm/tinydrm/Kconfig: drivers: Select BACKLIGHT_CLASS_DEVICE
    21eee05ca2c8 video: ssd1307fb: Start page range at page_offset
    b51bb2f57998 drm/amd/display: add monitor patch to add T7 delay
    d7c8317943b5 drm/panel: simple: fix AUO g185han01 horizontal blanking
    bdcef6cd4c94 drm/vkms: Avoid assigning 0 for possible_crtc
    29079f2260ff drm/bridge: tc358767: Increase AUX transfer length limit
    b66b85d54494 drm/vkms: Fix crc worker races
    c036f925087e net: sched: taprio: Avoid division by zero on invalid link speed
    411184eda7d0 net: sched: cbs: Avoid division by zero when calculating the port rate
    90053e8de295 ptp_qoriq: Initialize the registers' spinlock before calling ptp_qoriq_settime
    4437b0b5d236 xen-netfront: do not use ~0U as error return value for xennet_fill_frags()
    04e6fa02cc6e net/rds: Fix error handling in rds_ib_add_one()
    d6870bbdacd6 udp: only do GSO if # of segs > 1
    da0f508134bb tcp: adjust rto_base in retransmits_timed_out()
    c5994847e736 net: dsa: rtl8366: Check VLAN ID and not ports
    11432777d98b vsock: Fix a lockdep warning in __vsock_release()
    fba0b06b5941 udp: fix gso_segs calculations
    9af774bcc460 tipc: fix unlimited bundling of small messages
    c01fc241d449 sch_dsmark: fix potential NULL deref in dsmark_init()
    392053bb2328 sch_cbq: validate TCA_CBQ_WRROPT to avoid crash
    e752bb81ed39 rxrpc: Fix rxrpc_recvmsg tracepoint
    7fc879a38f81 qmi_wwan: add support for Cinterion CLS8 devices
    600c91857832 nfc: fix memory leak in llcp_sock_bind()
    50b26ba8938f net: Unpublish sk from sk_reuseport_cb before call_rcu
    4e71bbe0fdc8 net: sched: taprio: Fix potential integer overflow in taprio_set_picos_per_byte
    a087259d42ba net: qlogic: Fix memory leak in ql_alloc_large_buffers
    ff917e2d2c8d net: ipv4: avoid mixed n_redirects and rate_tokens usage
    3e586883beb4 ipv6: Handle missing host route in __ipv6_ifa_notify
    a0efe1cbadc4 ipv6: drop incoming packets having a v4mapped source address
    93b1f9364559 hso: fix NULL-deref on tty open
    7edcdec673dc erspan: remove the incorrect mtu limit for erspan
    a203f2d6b4ea cxgb4:Fix out-of-bounds MSI-X info array access
    076d9f965e56 Linux 5.2.19
    8c4f7f403e79 platform/chrome: cros_ec_rpmsg: Fix race with host command when probe failed
    d4ecc0a011cc mt76: mt7615: fix mt7615 firmware path definitions
    7dcd2e608bd3 mt76: mt7615: always release sem in mt7615_load_patch
    c959aebdc313 md/raid0: avoid RAID0 data corruption due to layout confusion.
    cb2daf3e8cef drm/amd/display: Restore backlight brightness after system resume
    5bd1ab51d4c7 CIFS: Fix oplock handling for SMB 2.1+ protocols
    b90f653c964e CIFS: fix max ea value size
    bc3a3e7c695c i2c: riic: Clear NACK in tend isr
    ba86f3d55fc1 hwrng: core - don't wait on add_early_randomness()
    fa0c86d48184 quota: fix wrong condition in is_quota_modification()
    6c8042e92499 ext4: fix punch hole for inline_data file systems
    7c7aff67e841 ext4: fix warning inside ext4_convert_unwritten_extents_endio
    026f900e102a mtd: rawnand: stm32_fmc2: avoid warnings when building with W=1 option
    afe3a71e655d ipmi: move message error checking to avoid deadlock
    b0df636473e5 xfs: Fix stale data exposure when readahead races with hole punch
    b56335c486f7 mm: Handle MADV_WILLNEED through vfs_fadvise()
    a775ad97ce77 fs: Export generic_fadvise()
    f811fce3971f /dev/mem: Bail out upon SIGKILL.
    84a85e7ec32e cfg80211: Purge frame registrations on iftype change
    d1e007a497f6 md: only call set_in_sync() when it is expected to succeed.
    c4ab81dab3b0 md: don't report active array_state until after revalidate_disk() completes.
    801070ab8ad5 md/raid6: Set R5_ReadError when there is read failure on parity disk
    82dd0828253a ACPI / LPSS: Save/restore LPSS private registers also on Lynxpoint
    ca1a7debf461 SUNRPC: Fix buffer handling of GSS MIC without slack
    89c2c6f70602 SUNRPC: Dequeue the request from the receive queue while we're re-encoding
    e5b682d7792f Btrfs: fix race setting up and completing qgroup rescan workers
    8e2074d3c283 btrfs: qgroup: Fix reserved data space leak if we have multiple reserve calls
    f2a4259af36d btrfs: qgroup: Fix the wrong target io_tree when freeing reserved data space
    51bae3f5578c btrfs: adjust dirty_metadata_bytes after writeback failure of extent buffer
    3c6b7c79fe96 btrfs: Relinquish CPUs in btrfs_compare_trees
    620cde3fe214 Btrfs: fix use-after-free when using the tree modification log
    db66429314dd btrfs: fix allocation of free space cache v1 bitmap pages
    0a19609d9a2f ovl: filter of trusted xattr results in audit
    ee080509c14e ovl: Fix dereferencing possible ERR_PTR()
    e2a5e040a63b smb3: fix leak in "open on server" perf counter
    79aeacfeebb5 smb3: allow disabling requesting leases
    a98f553d2b78 block: fix null pointer dereference in blk_mq_rq_timed_out()
    facb691f45d6 block: mq-deadline: Fix queue restart handling
    ab3d89dbec88 i40e: check __I40E_VF_DISABLE bit in i40e_sync_filters_subtask
    00cac3533335 ath10k: fix channel info parsing for non tlv target
    7228bca11c14 rtw88: pci: Use DMA sync instead of remapping in RX ISR
    80e456c82a5c rtw88: pci: Rearrange the memory usage for skb in RX ISR
    a8e0442493bf KEYS: trusted: correctly initialize digests and fix locking issue
    e1ff89ad3dde mt76: round up length on mt76_wr_copy
    d08bb3463d8f lib/lzo/lzo1x_compress.c: fix alignment bug in lzo-rle
    482859563c02 memcg, kmem: do not fail __GFP_NOFAIL charges
    ef54420b0726 memcg, oom: don't require __GFP_FS when invoking memcg OOM killer
    1cbbcacdcdf4 mm/compaction.c: clear total_{migrate,free}_scanned before scanning a new zone
    5377b8767d64 z3fold: fix memory leak in kmem cache
    ed99d2d1af39 z3fold: fix retry mechanism in page reclaim
    9a6b2645aa75 gfs2: clear buf_in_tr when ending a transaction in sweep_bh_for_rgrps
    9b4f0cba4476 efifb: BGRT: Improve efifb_bgrt_sanity_check
    d6acb54716ff regulator: Defer init completion for a while after late_initcall
    f11e0e8942f4 iommu/vt-d: Fix wrong analysis whether devices share the same bus
    f683465f0564 alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP
    5d67ad366f2b iommu/arm-smmu-v3: Disable detection of ATS and PRI
    7fd38df794c2 arm64: dts: rockchip: limit clock rate of MMC controllers for RK3328
    ef2fa63bbe95 arm64: tlb: Ensure we execute an ISB following walk cache invalidation
    516d62914766 ARM: zynq: Use memcpy_toio instead of memcpy on smp bring-up
    b9cbc0df92c3 ARM: samsung: Fix system restart on S3C6410
    f1592b754350 ASoC: Intel: Fix use of potentially uninitialized variable
    6c03deb9baf9 ASoC: Intel: Skylake: Use correct function to access iomem space
    4ccbdceb2e2b ASoC: Intel: NHLT: Fix debug print format
    89beb34d7533 binfmt_elf: Do not move brk for INTERP-less ET_EXEC
    a24d7c499db0 spi: spi-fsl-dspi: Exit the ISR with IRQ_NONE when it's not ours
    f0724e4dc181 spi: ep93xx: Repair SPI CS lookup tables
    215019d6ef10 media: don't drop front-end reference count for ->detach
    11f20198e922 media: sn9c20x: Add MSI MS-1039 laptop to flip_dmi_table
    682dbe2cb5e7 media: videobuf-core.c: poll_wait needs a non-NULL buf pointer
    e1bbf7d2cd21 KVM: x86/mmu: Use fast invalidate mechanism to zap MMIO sptes
    32076032e7db KVM: x86: Disable posted interrupts for non-standard IRQs delivery modes
    fb817d533600 KVM: x86: Manually calculate reserved bits when loading PDPTRS
    c5c761130003 KVM: x86: set ctxt->have_exception in x86_decode_insn()
    8d1e0c157027 KVM: x86: always stop emulation on page fault
    8e422d4af87d platform/x86: intel_int0002_vgpio: Fix wakeups not working on Cherry Trail
    c1b3752b5f25 parisc: Disable HP HSC-PCI Cards to prevent kernel crash
    3a1f5551534d fuse: fix beyond-end-of-page access in fuse_parse_cache()
    99a21e616426 fuse: fix missing unlock_page in fuse_writepage()
    831bd6ec1633 fuse: fix deadlock with aio poll and fuse_iqueue::waitq.lock
    843d38c96532 tpm: Wrap the buffer from the caller to tpm_buf in tpm_send()
    d59609b135ac tpm_tis_core: Set TPM_CHIP_FLAG_IRQ before probing for interrupts
    43e8e81e357c tpm_tis_core: Turn on the TPM before probing IRQ's
    830afcbc9391 powerpc/imc: Dont create debugfs files for cpu-less nodes
    c9321577cbc9 scsi: implement .cleanup_rq callback
    2492d1d7f34a blk-mq: add callback of .cleanup_rq
    22b97cad6d67 ALSA: hda/realtek - PCI quirk for Medion E4254
    f0028c2bed93 rcu/tree: Fix SCHED_FIFO params
    d567e81a20c0 ARM: dts: am3517-evm: Fix missing video
    5f8095b682d6 randstruct: Check member structs in is_pure_ops_struct()
    03d53cb8acb8 RDMA: Fix double-free in srq creation error flow
    3d97d7d688e7 IB/hfi1: Do not update hcrc for a KDETH packet during fault injection
    040fc3258d95 IB/hfi1: Define variables as unsigned long to fix KASAN warning
    dcbb25d9400b IB/mlx5: Free mpi in mp_slave mode
    44602a8a1406 printk: Do not lose last line in kmsg buffer dump
    9dfb1ce6b615 scsi: qla2xxx: Fix Relogin to prevent modifying scan_state flag
    a16791fccaf6 scsi: scsi_dh_rdac: zero cdb in send_mode_select()
    6e8f051e504d ALSA: firewire-tascam: check intermediate state of clock status and retry
    75c1a117e1f7 ALSA: firewire-tascam: handle error code when getting current source of clock
    77567ebc4060 iwlwifi: fw: don't send GEO_TX_POWER_LIMIT command to FW version 36
    9d9c01542848 ARM: omap2plus_defconfig: Fix missing video
    3d226661238e ARM: dts: logicpd-torpedo-baseboard: Fix missing video
    2e847a842b2b PM / devfreq: passive: fix compiler warning
    8e16bddcc6bd media: omap3isp: Set device on omap3isp subdevs
    d6595ad8ca5d kvm: Nested KVM MMUs need PAE root too
    37099d7a3e66 btrfs: Detect unbalanced tree with empty leaf before crashing btree operations
    3d95c52d789c btrfs: tree-checker: Add ROOT_ITEM check
    9ae8394e41d7 btrfs: extent-tree: Make sure we only allocate extents from block groups with the same type
    7ee67b37a0bf btrfs: delayed-inode: Kill the BUG_ON() in btrfs_delete_delayed_dir_index()
    9e6431c0f2e4 zd1211rw: remove false assertion from zd_mac_clear()
    8e9a39559b73 iommu/amd: Override wrong IVRS IOAPIC on Raven Ridge systems
    d6dfca753d7a ALSA: hda/realtek - Blacklist PC beep for Lenovo ThinkCentre M73/93
    798b010be17b drm: fix module name in edid_firmware log message
    dae45bd9b873 media: ttusb-dec: Fix info-leak in ttusb_dec_send_command()
    06752109ced1 drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)
    33e91a59bf81 ALSA: hda - Drop unsol event handler for Intel HDMI codecs
    5397eb1a1fb0 ALSA: hda - Add a quirk model for fixing Huawei Matebook X right speaker
    354098b7045d e1000e: add workaround for possible stalled packet
    27a2b39359f8 libertas: Add missing sentinel at end of if_usb.c fw_table
    9eff1ebe2c90 mmc: mtk-sd: Re-store SDIO IRQs mask at system resume
    c5f89ff633d2 raid5: don't increment read_errors on EILSEQ return
    7cb4bc790e12 mmc: dw_mmc: Re-store SDIO IRQs mask at system resume
    6d9a663aca54 mmc: core: Add helper function to indicate if SDIO IRQs is enabled
    d32263d8b9b5 mmc: sdhci: Fix incorrect switch to HS mode
    de6fea9fcf1e sched/psi: Correct overly pessimistic size calculation
    106af0369442 mmc: core: Clarify sdio_irq_pending flag for MMC_CAP2_SDIO_IRQ_NOTHREAD
    f9762c19d883 raid5: don't set STRIPE_HANDLE to stripe which is in batch list
    d54de8cfa4a1 block: make rq sector size accessible for block stats
    6c7b70e220d5 io_uring: fix wrong sequence setting logic
    38b24f688d64 ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is not set
    a7963f92406d platform/x86: intel_pmc_core: Do not ioremap RAM
    c7e971d4f027 x86/cpu: Add Tiger Lake to Intel family
    6e2056c4424c irqchip/gic-v3-its: Fix LPI release for Multi-MSI devices
    74a94a7e0a01 s390/crypto: xts-aes-s390 fix extra run-time crypto self tests finding
    cf8360a5be18 irqchip/sifive-plic: set max threshold for ignored handlers
    1f57c45eaab5 x86/mm: Fix cpumask_of_node() error condition
    daecd8d05e3d kprobes: Prohibit probing on BUG() and WARN() address
    6265d3c8b96b dmaengine: ti: edma: Do not reset reserved paRAM slots
    18a00f37f418 md/raid1: fail run raid1 array when active disk less than one
    b92d8e39fa70 hwmon: (acpi_power_meter) Change log level for 'unsafe software power cap'
    d57d9213d8b8 hwmon: (k10temp) Add support for AMD family 17h, model 70h CPUs
    94a379db627a closures: fix a race on wakeup from closure_sync
    4b88669aa2f8 ACPI / PCI: fix acpi_pci_irq_enable() memory leak
    70424999fbf1 ACPI: custom_method: fix memory leaks
    997c08a49443 x86/amd_nb: Add PCI device IDs for family 17h, model 70h
    91180767bba9 ARM: dts: exynos: Mark LDO10 as always-on on Peach Pit/Pi Chromebooks
    a6ff82b2cb60 libtraceevent: Change users plugin directory
    4509537c378a iommu/iova: Avoid false sharing on fq_timer_on
    b20a5ef80779 libata/ahci: Drop PCS quirk for Denverton and beyond
    aecef5f0a4fd ASoC: Intel: Haswell: Adjust machine device private context
    a9c3dacf2939 iommu/amd: Silence warnings under memory pressure
    4d3f9cdc0f3e ALSA: firewire-motu: add support for MOTU 4pre
    311abc6a314c nvme-multipath: fix ana log nsid lookup when nsid is not found
    3c971d5dc374 nvmet: fix data units read and written counters in SMART log
    07e66eb2a8c0 x86/mm/pti: Handle unaligned address gracefully in pti_clone_pagetable()
    6198f3954f15 ASoC: fsl_ssi: Fix clock control issue in master mode
    c9e116d055f9 x86/mm/pti: Do not invoke PTI functions when PTI is disabled
    6e46d1f16473 perf evlist: Use unshare(CLONE_FS) in sb threads to let setns(CLONE_NEWNS) work
    b70a9f2ab2fa arm64: kpti: ensure patched kernel text is fetched from PoU
    9093a2e343f2 x86/apic/vector: Warn when vector space exhaustion breaks affinity
    12dae85048f1 sched/cpufreq: Align trace event behavior of fast switching
    92402bba4f32 ACPI / CPPC: do not require the _PSD method
    51f464d8bce7 ASoC: es8316: fix headphone mixer volume table
    57869649b230 leds: lm3532: Fixes for the driver for stability
    ee3251c9e71f media: ov9650: add a sanity check
    826a67380c4a media: aspeed-video: address a protential usage of an unitialized var
    c10ea8447736 perf script: Fix memory leaks in list_scripts()
    8d70572f69cc perf report: Fix --ns time sort key output
    fffe93c89d8b perf trace beauty ioctl: Fix off-by-one error in cmd->string table
    723809bb6d16 media: saa7134: fix terminology around saa7134_i2c_eeprom_md7134_gate()
    1c6a694568db media: cpia2_usb: fix memory leaks
    ecc548676360 media: saa7146: add cleanup in hexium_attach()
    730e14891202 media: cec-notifier: clear cec_adap in cec_notifier_unregister
    b74f2a4c0af2 PM / devfreq: exynos-bus: Correct clock enable sequence
    61496a6956d5 PM / devfreq: passive: Use non-devm notifiers
    6cf8764ed327 ARM: OMAP2+: move platform-specific asm-offset.h to arch/arm/mach-omap2
    7f6346e814ec PM / devfreq: Fix kernel oops on governor module load
    0ac4a7a4562b soc: renesas: Enable ARM_ERRATA_754322 for affected Cortex-A9
    841ee26cb0eb soc: renesas: rmobile-sysc: Set GENPD_FLAG_ALWAYS_ON for always-on domain
    c5a678041db9 ARM: at91: move platform-specific asm-offset.h to arch/arm/mach-at91
    45a550e54f0c EDAC/amd64: Decode syndrome before translating address
    71e85351f2d3 EDAC/amd64: Recognize DRAM device type ECC capability
    e4739ed9e9f4 libperf: Fix alignment trap with xyarray contents in 'perf stat'
    28e3cfd1c820 EDAC/amd64: Support more than two controllers for chip selects handling
    8c17f6f5d0d6 media: dvb-core: fix a memory leak bug
    de23b986dd21 posix-cpu-timers: Sanitize bogus WARNONS
    3df4944a75a3 media: dvb-frontends: use ida for pll number
    328d309f578d media: mceusb: fix (eliminate) TX IR signal length limit
    14944c1cdf66 s390/kasan: provide uninstrumented __strlen
    ad856c85132c arm64: entry: Move ct_user_exit before any other exception
    919bb091f3bb ACPI / APEI: Release resources if gen_pool_add() fails
    8e8821e51180 nbd: add missing config put
    cb00bdfdf4a1 ASoC: mchp-i2s-mcc: Fix unprepare of GCLK
    fd3a27888511 led: triggers: Fix a memory leak bug
    78a5d7570357 ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controller is running
    cf37fc6525e6 ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK
    cfc27d524fe8 tools headers: Fixup bitsperlong per arch includes
    0de9cb3ccaf4 powerpc/Makefile: Always pass --synthetic to nm if supported
    b72464b49572 ASoC: uniphier: Fix double reset assersion when transitioning to suspend state
    a6856ba2704a media: hdpvr: add terminating 0 at end of string
    ea9b3fba2de5 media: radio/si470x: kill urb on error
    abec08cc8afd x86/platform/intel/iosf_mbi Rewrite locking
    5ac00c9194ae ARM: dts: imx7-colibri: disable HS400
    d89e114b2f42 ARM: dts: imx7d: cl-som-imx7: make ethernet work again
    a510a16fee76 m68k: Prevent some compiler warnings in Coldfire builds
    751ac20a3913 net: lpc-enet: fix printk format strings
    c3e1334bc47a kasan/arm64: fix CONFIG_KASAN_SW_TAGS && KASAN_INLINE
    3c88b089e592 media: imx: mipi csi-2: Don't fail if initial state times-out
    cab41bda0849 media: omap3isp: Don't set streaming state on random subdevs
    ebe068d7bb79 media: i2c: ov5645: Fix power sequence
    3993c8429927 media: vsp1: fix memory leak of dl on error return path
    91faaa0e282f perf record: Support aarch64 random socket_id assignment
    b8179cfaf017 ARM: xscale: fix multi-cpu compilation
    cb2d2b999afe dmaengine: iop-adma: use correct printk format strings
    50ab41d72d35 media: rc: imon: Allow iMON RC protocol for ffdc 7e device
    b251e979c979 perf unwind: Fix libunwind when tid != pid
    2bc1f53cc46a arm64/efi: Move variable assignments after SECTIONS
    c0282736b94f media: em28xx: modules workqueue not inited for 2nd device
    de122406a437 media: fdp1: Reduce FCP not found message level to debug
    b18c1c75b90a media: i2c: tda1997x: prevent potential NULL pointer access
    f5d115ba1687 media: mtk-mdp: fix reference count on old device tree
    6156280768c3 perf test vfs_getname: Disable ~/.perfconfig to get default output
    a056ef7090e2 perf config: Honour $PERF_CONFIG env var to specify alternate .perfconfig
    b134b502d3b6 media: gspca: zero usb_buf on error
    5e1feedf563e blk-mq: Fix memory leak in blk_mq_init_allocated_queue error handling
    503ac6efb245 idle: Prevent late-arriving interrupts from disrupting offline
    b2ee96a78c9a sched/fair: Use rq_lock/unlock in online_fair_sched_group
    fc31f1c241b0 firmware: arm_scmi: Check if platform has released shmem before using
    a1a19299a6a5 efi: cper: print AER info of PCIe fatal error
    30ff832e9a23 EDAC, pnd2: Fix ioremap() size in dnv_rd_reg()
    cdfe5e064210 perf tools: Fix paths in include statements
    43894a0475c6 loop: Add LOOP_SET_DIRECT_IO to compat ioctl
    bb07be974180 ACPI / processor: don't print errors for processorIDs == 0xff
    fd8bd7dfb04f ASoC: hdac_hda: fix page fault issue by removing race
    338c95ab2187 RAS: Build debugfs.o only when enabled in Kconfig
    ff45dc5d103f media: media/platform: fsl-viu.c: fix build for MICROBLAZE
    c0053b3c6142 md: don't set In_sync if array is frozen
    274971880ff9 md: don't call spare_active in md_reap_sync_thread if all member devices can't work
    a1f4fcb88098 md/raid1: end bio when the device faulty
    998d765255aa arm64/prefetch: fix a -Wtype-limits warning
    912d58f959f1 ASoC: rsnd: don't call clk_get_rate() under atomic context
    5da3a9eb8159 EDAC/altera: Use the proper type for the IRQ status bits
    873aa4af4fdd ia64:unwind: fix double free for mod->arch.init_unw_table
    e89c79710aed ALSA: usb-audio: Skip bSynchAddress endpoint check if it is invalid
    42c6b180a7bf base: soc: Export soc_device_register/unregister APIs
    383466793900 soc: amlogic: meson-clk-measure: protect measure with a mutex
    55b520f85a97 arm64: mm: free the initrd reserved memblock in a aligned manner
    bfae8c471054 cpuidle: teo: Allow tick to be stopped if PM QoS is used
    c02ec6220cf3 media: iguanair: add sanity checks
    db934a6df6d9 EDAC/mc: Fix grain_bits calculation
    7b1c5aa61d98 ALSA: i2c: ak4xxx-adda: Fix a possible null pointer dereference in build_adc_controls()
    0294075e5872 ALSA: hda - Show the fatal CORB/RIRB error more clearly
    9107c9b7bcce x86/apic: Soft disable APIC before initializing it
    be86447601cb rcu/tree: Call setschedule() gp ktread to SCHED_FIFO outside of atomic region
    cc41123523d1 x86/reboot: Always use NMI fallback when shutdown via reboot vector IPI fails
    2965c2e1ec69 sched/deadline: Fix bandwidth accounting at all levels after offline migration
    6c4121115c87 x86/apic: Make apic_pending_intr_clear() more robust
    e75ff42011f1 sched/core: Fix CPU controller for !RT_GROUP_SCHED
    a02f3db8994e sched/fair: Fix imbalance due to CPU affinity
    2af6db20ceae time/tick-broadcast: Fix tick_broadcast_offline() lockdep complaint
    5db042229a8c media: i2c: ov5640: Check for devm_gpiod_get_optional() error
    7c36a65b2ea1 media: hdpvr: Add device num check and handling
    988a38ff1cf0 media: vivid: work around high stack usage with clang
    615883ae490f media: vb2: reorder checks in vb2_poll()
    4610656c129e media: vivid:add sanity check to avoid divide error and set value to 1 if 0.
    7fe87b686cb9 media: exynos4-is: fix leaked of_node references
    1a53850754a9 ASoC: SOF: pci: mark last_busy value at runtime PM init
    f76aa9d803b6 media: mtk-cir: lower de-glitch counter for rc-mm protocol
    5efaf000347a media: dib0700: fix link error for dibx000_i2c_set_speed
    8d68efb7e270 leds: leds-lp5562 allow firmware files up to the maximum length
    3dee582e6190 dmaengine: bcm2835: Print error in case setting DMA mask fails
    5d6d34ade679 firmware: qcom_scm: Use proper types for dma mappings
    8e81af05436c ASoC: sgtl5000: Fix charge pump source assignment
    57868b5cbc50 ASoC: sgtl5000: Fix of unmute outputs on probe
    27879a37f7ad ASoC: tlv320aic31xx: suppress error message for EPROBE_DEFER
    dae532b1a1cc spi: dw-mmio: Clock should be shut when error occurs
    e534295b4c17 regulator: lm363x: Fix off-by-one n_voltages for lm3632 ldo_vpos/ldo_vneg
    8c3a9421b2ef cpufreq: ap806: Add NULL check after kcalloc
    4defe8b0f2f5 ASoC: SOF: Intel: hda: Make hdac_device device-managed
    6646813ee81d ALSA: hda: Flush interrupts on disabling
    a269a7a7632b nfc: enforce CAP_NET_RAW for raw sockets
    f91ee5bc2100 ieee802154: enforce CAP_NET_RAW for raw sockets
    faf60340e231 ax25: enforce CAP_NET_RAW for raw sockets
    ef03ebc40bc8 appletalk: enforce CAP_NET_RAW for raw sockets
    1ca53dc648e8 mISDN: enforce CAP_NET_RAW for raw sockets
    df20d3ce66c5 net/mlx5: Add device ID of upcoming BlueField-2
    38be58c880d9 tcp: better handle TCP_USER_TIMEOUT in SYN_SENT state
    4378493fed94 net: sched: fix possible crash in tcf_action_destroy()
    5f39dd75e078 net/mlx5e: Fix traffic duplication in ethtool steering
    6386577b2927 vrf: Do not attempt to create IPv6 mcast rule if IPv6 is disabled
    229b983d5221 net_sched: add policy validation for action attributes
    629815b9e1eb ipv4: Revert removal of rt_uses_gateway
    d5f1d310bb2b net/sched: cbs: Fix not adding cbs instance to list
    4bbf97f6c114 net: phy: micrel: add Asym Pause workaround for KSZ9021
    3ef1d54a72ca usbnet: sanity checking of packet sizes and device mtu
    b5e57553acde usbnet: ignore endpoints with invalid wMaxPacketSize
    35ad2e82044d tcp_bbr: fix quantization code to not raise cwnd if not probing bandwidth
    afc7190e3847 skge: fix checksum byte order
    0102608d70f0 selftests: Update fib_tests to handle missing ping6
    da0d6e47c20d sch_netem: fix a divide by zero in tabledist()
    9f64c6630929 ppp: Fix memory leak in ppp_write
    bd1df844b1f9 openvswitch: change type of UPCALL_PID attribute to NLA_UNSPEC
    b86bd41b767a nfp: flower: prevent memory leak in nfp_flower_spawn_phy_reprs
    9561c1351232 nfp: flower: fix memory leak in nfp_flower_spawn_vnic_reprs
    ba5f359f2be0 net_sched: add max len check for TCA_KIND
    19bd1045958b net/sched: act_sample: don't push mac header on ip6gre ingress
    ee8c5c7a6f9a net: qrtr: Stop rx_worker before freeing node
    6ee46a2b68fc net/phy: fix DP83865 10 Mbps HDX loopback disable function
    d879091836db macsec: drop skb sk before calling gro_cells_receive
    d37c96675204 ipv6: do not free rt if FIB_LOOKUP_NOREF is set on suppress rule
    98f1a3a21500 cdc_ncm: fix divide-by-zero caused by invalid wMaxPacketSize
    890984f31888 arcnet: provide a buffer big enough to actually receive packets
    0a9d6a58b4ac Linux 5.2.18
    c704eb3aaffa f2fs: use generic EFSBADCRC/EFSCORRUPTED
    673d1167b40e net/rds: Check laddr_check before calling it
    fc5b59770306 net/rds: An rds_sock is added too early to the hash table
    719532b9b832 net_sched: check cops->tcf_block in tc_bind_tclass()
    bd740eacb1d2 Bluetooth: btrtl: Additional Realtek 8822CE Bluetooth devices
    f63432cd1bb2 netfilter: nft_socket: fix erroneous socket assignment
    a2a3638f3e6f xfrm: policy: avoid warning splat when merging nodes
    b442b6d3742b xfs: don't crash on null attr fork xfs_bmapi_read
    baa3902119f5 drm/nouveau/disp/nv50-: fix center/aspect-corrected scaling
    452b129e4876 ACPI: video: Add new hw_changes_brightness quirk, set it on PB Easynote MZ35
    62b72c1f7ba5 Bluetooth: btrtl: HCI reset on close for Realtek BT chip
    f6983a936fbf net: don't warn in inet diag when IPV6 is disabled
    955b7a09bf57 drm/dp: Add DP_DPCD_QUIRK_NO_SINK_COUNT
    a7734a035acf drm: Flush output polling on shutdown
    453bcdd2432b f2fs: fix to do sanity check on segment bitmap of LFS curseg
    d331d4b99fb6 net/ibmvnic: Fix missing { in __ibmvnic_reset
    8defaa56897e dm zoned: fix invalid memory access
    bca9bfa41e3f Revert "f2fs: avoid out-of-range memory access"
    47af17950b03 objtool: Clobber user CFLAGS variable
    0f5df0b76e4f platform/x86: i2c-multi-instantiate: Derive the device name from parent
    811fc53c37be ALSA: hda - Apply AMD controller workaround for Raven platform
    b5215e9269c7 ALSA: hda - Add laptop imic fixup for ASUS M9V laptop
    d51c3b844afb ALSA: dice: fix wrong packet parameter for Alesis iO26
    bf4d30e9950e ALSA: usb-audio: Add DSD support for EVGA NU Audio
    284a30488891 ALSA: usb-audio: Add Hiby device family to quirks for native DSD support
    d17860e1e894 Revert "mm/z3fold.c: fix race between migration and destruction"
    2de3de21bc8a Revert "HID: logitech-hidpp: add USB PID for a few more supported mice"
    807370d02413 clk: imx: imx8mm: fix audio pll setting
    bdbf837b89a9 crypto: talitos - fix missing break in switch statement
    a1e67dae1599 mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
    6c6d88dc737a HID: Add quirk for HP X500 PIXART OEM mouse
    af5676bf7d89 HID: hidraw: Fix invalid read in hidraw_ioctl
    8d88e0d1b3e6 HID: logitech-dj: Fix crash when initial logi_dj_recv_query_paired_devices fails
    55c2b2ac2706 HID: logitech: Fix general protection fault caused by Logitech driver
    a069e96b5280 HID: sony: Fix memory corruption issue on cleanup.
    5f2ba05924ca HID: prodikeys: Fix general protection fault during probe
    df3cc96b2049 Revert "net: hns: fix LED configuration for marvell phy"
    3349449ae730 drm/amd/display: readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines
    be3b5f44206e powerpc/xive: Fix bogus error code returned by OPAL
    606f7f9fc442 drm/amd/display: Don't replace the dc_state for fast updates
    0365d15f565a drm/amd/display: Skip determining update type for async updates
    891eae79f7a5 drm/amd/display: Allow cursor async updates for framebuffer swaps
    f6faeecb3659 net/ibmvnic: free reset work of removed device from queue
    cdc112b9cb64 phy: qcom-qmp: Correct ready status, again
    b08d7b36f11d phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling delay
    3da810f95b86 smb3: fix unmount hang in open_shroot
    e6d6a001ed5a Revert "Bluetooth: validate BLE connection interval updates"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb      | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index e3fe544..423331e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0a9f6ee2443b54c614107728ca76485916010023"
-SRCREV_meta ?= "b867b78b5019ae455af97dec7794cff7527d7624"
+SRCREV_machine ?= "55e3ee387b073d8d609e8899859561340d8b6911"
+SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.17"
+LINUX_VERSION ?= "5.2.20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index f3f5468..f7239d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.17"
+LINUX_VERSION ?= "5.2.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "aaa66d462ec17345dadd69b1ec0f3fcc83e82536"
-SRCREV_machine ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_meta ?= "b867b78b5019ae455af97dec7794cff7527d7624"
+SRCREV_machine_qemuarm ?= "501d680535903acc00808c36f2cc07f2dc725adc"
+SRCREV_machine ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 1a2c3ff..8f75f67 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "47b80ef7bd932830f299ed76e2302df631ae4fbe"
-SRCREV_machine_qemuarm64 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_machine_qemumips ?= "45ff64cb3f87c38db6f46353ea93005d049b0cf6"
-SRCREV_machine_qemuppc ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_machine_qemuriscv64 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_machine_qemux86 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_machine_qemux86-64 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_machine_qemumips64 ?= "ea0fd387a459803ac60e9b8a1729f2fc7d3215f1"
-SRCREV_machine ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
-SRCREV_meta ?= "b867b78b5019ae455af97dec7794cff7527d7624"
+SRCREV_machine_qemuarm ?= "fcbe51dfa0a763a07e4cd66204d6c0ba054663ce"
+SRCREV_machine_qemuarm64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_machine_qemumips ?= "9cad7bb8bcd3686f580a3363847ee9c9e86928b1"
+SRCREV_machine_qemuppc ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_machine_qemuriscv64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_machine_qemux86 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_machine_qemux86-64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_machine_qemumips64 ?= "dc2be1a546e937374590ce3858b717489ded2c21"
+SRCREV_machine ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
+SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.17"
+LINUX_VERSION ?= "5.2.20"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


