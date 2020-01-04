Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 50BA37F859
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:20 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 195so24049708pfw.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IIRvZKdtAe8gF76w1EwCYHLG2pURb4FFiMsvOzgzcz8=;
	b=fQ0zFjKYj1we9/MjgkP45ce04kEZVgNrmJ8zo4Z0/juqJqDkouMVT3Zv2ztCY3NBlb
	1WPnPMk9uqREfoOYiP1zjSI08UNMBnN+YVnkJC5/1pnMhKv0rYWfuFyDe58oWM74DLYM
	4kWwPXDgRHLeLM62ZeAqVxxe8bmmYT8D6z8+OsHs3koeSGF7nMLsVo49s1dr4fl1wDD5
	/UEN196kxTTMQ3cw1bWG5QKCurLOwEUVuH13DV0BzRw+VLrr4CZrUHvljlC03MY9PVLp
	FLTLKT7NorD/2O1qEmvP/XM5RVz/bOaf32xv5tz5Q6fE5bxeXwNlybdBjKGq34h0X9u4
	tEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IIRvZKdtAe8gF76w1EwCYHLG2pURb4FFiMsvOzgzcz8=;
	b=dwKCZUuA5rVj+w1ml1n1R5SA6FDl7mOWmPJw1JBrjsMNGuiyTHzPZr8UfMYMJqm2Fx
	5BTeXsM0owxDjgsH413/Po9XldMnCQdF1xWPTF3pe6HwPSDL04YmwLdGhocmlSEc/tJX
	72084sb0XVSuEYrAI9LBoPK7u8SA1C+oHZRdh32AucE/lpihwvg3WnQH1L1d1xBOgtog
	j3/IJt0YgWJcmcxNGI93WL9rPPHU4y8iDojfPzkw2XuaVNrdMxmdAa5XZuKzWCK0wLTs
	XmqwzooCdmJgkIpGpFfBd+DtccJisGQDEhQItswzm4fe07haT4asE4CHWNlAMSrafU8O
	ZFHw==
X-Gm-Message-State: APjAAAX5IA6co6uIXzjEhMhmJ8mizGjIf3WEX3Urepbl0KDmBO7tv7Hk
	hsvadCYmSEx0jaJAnUkcagzSVm5zGF8=
X-Google-Smtp-Source: APXvYqxLeRd8M2xjBesJnh1MNmdBYO3ofmsguyphJZfsltKGgs049MOcKB43N82cRKrptcCOP2MTiA==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr97598295pgf.2.1578155180871; 
	Sat, 04 Jan 2020 08:26:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:49 -0800
Message-Id: <d37245781ffd21cd6985eecdc95b28bfdea4ebaa.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 08/29] linux-yocto/5.2: update to v5.2.22
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    0bea818b6e18 Linux 5.2.22
    5f1126e23315 nbd: verify socket is supported during setup
    4888496abcfe USB: usblp: fix use-after-free on disconnect
    0ba545e8fda8 USB: legousbtower: fix a signedness bug in tower_probe()
    4c6f2341bb9f CIFS: Fix use after free of file info structures
    f9c400068647 scsi: mpt3sas_ctl: fix double-fetch bug in _ctl_ioctl_main()
    14c5cace4634 wcd9335: fix a incorrect use of kstrndup()
    da7b0f2312c9 clk-sunxi: fix a missing-check bug in sunxi_divs_clk_setup()
    ee72fe755500 cfg80211: wext: avoid copying malformed SSIDs
    fc86526a556d rtlwifi: Fix potential overflow on P2P code
    0ebeef211891 io_uring: only flush workqueues on fileset removal
    e6a26dac8182 x86/asm: Fix MWAITX C-state hint value
    65113f3d3937 mtd: rawnand: au1550nd: Fix au_read_buf16() prototype
    31012d874e0c hwmon: Fix HWMON_P_MIN_ALARM mask
    3abf2667e95a tracing: Get trace_array reference for available_tracers files
    be0e6c911005 ftrace: Get a reference counter for the trace_array on filter files
    a2a980deef30 tracing/hwlat: Don't ignore outer-loop duration when calculating max_latency
    225fca30418d tracing/hwlat: Report total time spent in all NMIs during the sample
    19b6d82baabe arm64/sve: Fix wrong free for task->thread.sve_state
    2473b968eecb media: stkwebcam: fix runtime PM after driver unbind
    eecc5223277d drm/i915: Mark contents as dirty on a write fault
    04887f273e41 drm/i915: Whitelist COMMON_SLICE_CHICKEN2
    60624198d203 Fix the locking in dcache_readdir() and friends
    c5325876ceb9 arm64: topology: Use PPTT to determine if PE is a thread
    393cf2726151 ACPI/PPTT: Add support for ACPI 6.3 thread flag
    daa13a4b0635 RDMA/vmw_pvrdma: Free SRQ only once
    6243ecc8cab6 MIPS: elf_hwcap: Export userspace ASEs
    ae0799a4da1b MIPS: Disable Loongson MMI instructions for kernel build
    f0f81c9999ab NFS: Fix O_DIRECT accounting of number of bytes read/written
    7a80e6581ea9 btrfs: fix uninitialized ret in ref-verify
    ddf6cef435f0 btrfs: fix incorrect updating of log root tree
    1296b41cc1d3 Btrfs: fix memory leak due to concurrent append writes with fiemap
    810f5770978a btrfs: fix balance convert to single on 32-bit host CPUs
    7816678e3934 btrfs: allocate new inode in NOFS context
    74ec5aa2c30a btrfs: relocation: fix use-after-free on dead relocation roots
    bc1f6ac176a6 firmware: google: increment VPD key_len properly
    9fc11ae5dee9 IB/core: Fix wrong iterating on ports
    fee3c62537ff mm/vmpressure.c: fix a signedness bug in vmpressure_register_event()
    e3a378783419 mm/page_alloc.c: fix a crash in free_pages_prepare()
    e4891ccaef9e mm/z3fold.c: claim page in the beginning of free
    7831f5a6c097 kernel/sysctl.c: do not override max_threads provided by userspace
    44481a12c9bf cifs: use cifsInodeInfo->open_file_lock while iterating to avoid a panic
    16ae17c41281 CIFS: Force reval dentry if LOOKUP_REVAL flag is set
    2c272ff0cbd5 CIFS: Force revalidate inode when dentry is stale
    43273ccd3283 CIFS: Gracefully handle QueryInfo errors during open
    ca814325c659 selinux: fix context string corruption in convert_context()
    ad8d7e2a7a26 blk-wbt: fix performance regression in wbt scale_up/scale_down
    1b64f52e03de perf inject jit: Fix JIT_CODE_MOVE filename
    5cc59bf53d49 perf llvm: Don't access out-of-scope array
    7f9ed4c203f0 efivar/ssdt: Don't iterate over EFI vars if no SSDT override was specified
    5ef016833bac iio: accel: adxl372: Perform a reset at start up
    9f77cc5a7309 iio: accel: adxl372: Fix push to buffers lost samples
    d3db274a52ef iio: accel: adxl372: Fix/remove limitation for FIFO samples
    a9ab504bfa61 iio: adc: stm32-adc: fix a race when using several adcs with dma and irq
    29166478ab00 iio: adc: stm32-adc: move registers definitions
    05505674fad5 iio: adc: axp288: Override TS pin bias current for some models
    f418fb5e545d iio: adc: ad799x: fix probe error handling
    dc9b7ddfd0e5 iio: adc: hx711: fix bug in sampling of data
    5f711a67527d staging: vt6655: Fix memory leak in vt6655_probe
    e72f973d2600 staging: rtl8188eu: fix HighestRate check in odm_ARFBRefresh_8188E()
    34a95338fd57 Staging: fbtft: fix memory leak in fbtft_framebuffer_alloc
    b83f3fd3dc3c staging: bcm2835-audio: Fix draining behavior regression
    fe77671d3437 staging/fbtft: Depend on OF
    597abe928ec2 gpio: eic: sprd: Fix the incorrect EIC offset when toggling
    5e7c238cfafe mei: avoid FW version request on Ibex Peak and earlier
    4e68c8ad0d11 mei: me: add comet point (lake) LP device ids
    74a2ab15fa03 USB: legousbtower: fix use-after-free on release
    d5a37b79b977 USB: legousbtower: fix open after failed reset request
    470d1d920d61 USB: legousbtower: fix potential NULL-deref on disconnect
    b1c95308efbb USB: legousbtower: fix deadlock on disconnect
    0d7afcc3e67d USB: legousbtower: fix slab info leak at probe
    2164d586fe13 usb: typec: ucsi: displayport: Fix for the mode entering routine
    ed9dc2e12645 usb: typec: tcpm: usb: typec: tcpm: Fix a signedness bug in tcpm_fw_get_caps()
    ae07c4d583f0 usb: renesas_usbhs: gadget: Fix usb_ep_set_{halt,wedge}() behavior
    59f9a556d12c usb: renesas_usbhs: gadget: Do not discard queues in usb_ep_set_{halt,wedge}()
    c73e4656e029 USB: dummy-hcd: fix power budget for SuperSpeed mode
    8604ad319705 USB: microtek: fix info-leak at probe
    942d159f33d5 USB: usblcd: fix I/O after disconnect
    45e6742b3543 USB: serial: fix runtime PM after driver unbind
    f07e614a1eae USB: serial: option: add support for Cinterion CLS8 devices
    60efccd42001 USB: serial: option: add Telit FN980 compositions
    96464fe403ed USB: serial: ftdi_sio: add device IDs for Sienna and Echelon PL-20
    e05502d06a6e USB: serial: keyspan: fix NULL-derefs on open() and write()
    eb98769b935a serial: uartps: Fix uartps_major handling
    7dba6bf5f7d8 serial: uartlite: fix exit path null pointer
    46f1bfcd1c4e USB: ldusb: fix NULL-derefs on driver unbind
    536e1ab01853 USB: chaoskey: fix use-after-free on release
    2443d5a06e95 USB: usblp: fix runtime PM after driver unbind
    78941115be20 USB: iowarrior: fix use-after-free after driver unbind
    52f1bf2513ae USB: iowarrior: fix use-after-free on release
    259a1454a1c4 USB: iowarrior: fix use-after-free on disconnect
    63ee1fedd6de USB: adutux: fix use-after-free on release
    b6c09eee2d43 USB: adutux: fix NULL-derefs on disconnect
    0c72bbbe474a USB: adutux: fix use-after-free on disconnect
    a12a9cd6c351 xhci: Increase STS_SAVE timeout in xhci_suspend()
    a260279b7617 xhci: Prevent deadlock when xhci adapter breaks during init
    c8d9f36aa6b1 usb: xhci: wait for CNR controller not ready bit in xhci resume
    6885498721be xhci: Fix USB 3.1 capability detection on early xHCI 1.1 spec based hosts
    137c690e919a xhci: Check all endpoints for LPM timeout
    2cef9b4aef68 xhci: Prevent device initiated U1/U2 link pm if exit latency is too long
    fc87747823b9 xhci: Fix false warning message about wrong bounce buffer write length
    861e3b12fed9 USB: usb-skeleton: fix NULL-deref on disconnect
    9f4070d847cf USB: usb-skeleton: fix runtime PM after driver unbind
    968a3ec8e2de USB: yurex: fix NULL-derefs on disconnect
    f2f71a47512c USB: yurex: Don't retry on unexpected errors
    f12a275ccbf6 panic: ensure preemption is disabled during panic()
    f80586c5fc9e coresight: etm4x: Use explicit barriers on enable/disable
    f38e48b51908 vfs: Fix EOVERFLOW testing in put_compat_statfs64
    a74f766b8f43 riscv: Avoid interrupts being erroneously enabled in handle_exception()
    185f61b3655a perf stat: Reset previous counts on repeat with interval
    1479778a1947 tick: broadcast-hrtimer: Fix a race in bc_set_next
    a41c9cac2d45 KVM: nVMX: Fix consistency check on injected exception error code
    b52c034939de Btrfs: fix selftests failure due to uninitialized i_mode in test inodes
    a125322d48ac drm/radeon: Bail earlier when radeon.cik_/si_support=0 is passed
    ea9d6a619d30 nfp: abm: fix memory leak in nfp_abm_u32_knode_replace
    1f9e6c30c7ef mlxsw: spectrum_flower: Fail in case user specifies multiple mirror actions
    cd2fdf60a063 perf unwind: Fix libunwind build failure on i386 systems
    161dda893af0 i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C630
    86b33efd649a bpf: Fix bpf_event_output re-entry issue
    aaa8c1b8daa9 blk-mq: move lockdep_assert_held() into elevator_exit
    fc1b4d3e8239 kernel/elfcore.c: include proper prototypes
    6b2721b403ee include/trace/events/writeback.h: fix -Wstringop-truncation warnings
    cee4aad767a2 perf build: Add detection of java-11-openjdk-devel package
    043372e0afa3 sched/core: Fix migration to invalid CPU in __set_cpus_allowed_ptr()
    adf80f2feec5 sched/membarrier: Fix private expedited registration check
    61fa5ee7216c sched/membarrier: Call sync_core only before usermode for same mm
    096f6c8487c3 libnvdimm/nfit_test: Fix acpi_handle redefinition
    12a9a49442b2 fuse: fix memleak in cuse_channel_open
    7912cdc163b2 libnvdimm: Fix endian conversion issues 
    4db2cd0d1ce5 libnvdimm/region: Initialize bad block for volatile namespaces
    6fda5a687329 iommu/amd: Fix downgrading default page-sizes in alloc_pte()
    3a019ac29c6b thermal_hwmon: Sanitize thermal_zone type
    5d08f30e96d8 thermal: Fix use-after-free when unregistering thermal zone device
    a429d11015c3 ntb: point to right memory window index
    5aec3da44913 x86/purgatory: Disable the stackleak GCC plugin for the purgatory
    833db2db7272 selftests/seccomp: fix build on older kernels
    407e0ee74d22 pwm: stm32-lp: Add check in case requested period cannot be achieved
    52e5ea59746f SUNRPC: Don't try to parse incomplete RPC messages
    c0636eed33f0 pNFS: Ensure we do clear the return-on-close layout stateid on fatal errors
    18fce724c0ea drm/amdgpu: Check for valid number of registers to read
    aecbaa9bc7af drm/amdgpu: Fix KFD-related kernel oops on Hawaii
    342e564c9b0f netfilter: nf_tables: allow lookups in dynamic sets
    4c53aef11956 watchdog: aspeed: Add support for AST2600
    fa83953efe4b SUNRPC: RPC level errors should always set task->tk_rpc_status
    f835934a6275 ceph: reconnect connection if session hang in opening state
    7403dda16eb9 ceph: fetch cap_gen under spinlock in ceph_add_cap
    5c3e30081baa ceph: fix directories inode i_blkbits initialization
    e821008425d5 fuse: fix request limit
    92549d8ceef5 xen/pci: reserve MCFG areas earlier
    e99fd0070701 9p: avoid attaching writeback_fid on mmap with type PRIVATE
    5f374721b520 9p: Transport error uninitialized
    d9b57935af8d xprtrdma: Send Queue size grows after a reconnect
    d478e5024a78 xprtrdma: Toggle XPRT_CONGESTED in xprtrdma's slot methods
    111e51fcf8b3 fs: nfs: Fix possible null-pointer dereferences in encode_attrs()
    b3703c37a780 ima: fix freeing ongoing ahash_request
    4752354b2b94 ima: always return negative code for error
    9370b48fcb79 drivers: thermal: qcom: tsens: Fix memory leak from qfprom read
    38ab9316e558 cfg80211: initialize on-stack chandefs
    bc518ad5972a cfg80211: validate SSID/MBSSID element ordering assumption
    b1515120bb24 nl80211: validate beacon head
    dc1118edbc7c ieee802154: atusb: fix use-after-free at disconnect
    dd72ec13bbe3 xen/xenbus: fix self-deadlock after killing user process
    ffbd4ae78614 xen/balloon: Set pages PageOffline() in balloon_add_region()
    fb019e226331 DTS: ARM: gta04: introduce legacy spi-cs-high to make display work again
    fd5a2a47f144 libnvdimm/altmap: Track namespace boundaries in altmap
    f6e67e8fdfac Revert "locking/pvqspinlock: Don't wait if vCPU is preempted"
    9898906f5274 mmc: sdhci: Let drivers define their DMA mask
    8968e606a47f mmc: sdhci-of-esdhc: set DMA snooping based on DMA coherence
    56ced5e6024c mmc: sdhci: improve ADMA error reporting
    ba5d052c4e62 mmc: tegra: Implement ->set_dma_mask()
    31565ffd9d5d mac80211: keep BHs disabled while calling drv_tx_wake_queue()
    c5fcd037a2b2 drm/i915/gvt: update vgpu workload head pointer correctly
    359d2cb5c30a drm/nouveau/kms/nv50-: Don't create MSTMs for eDP connectors
    0b1757e6f255 drm/msm/dsi: Fix return value check for clk_get_parent
    00eccaeb55aa drm/omap: fix max fclk divider for omap36xx
    88f34afe2774 drm: mali-dp: Mark expected switch fall-through
    ccc3bc0df68d drm/atomic: Take the atomic toys away from X
    d88c0c23427b drm/atomic: Reject FLIP_ASYNC unconditionally
    6aecce20a2cd perf stat: Fix a segmentation fault when using repeat forever
    1b4371e819e8 perf tools: Fix segfault in cpu_cache_level__read()
    7311201faf48 watchdog: imx2_wdt: fix min() calculation in imx2_wdt_set_timeout
    79f5df7f2f92 selftests/tpm2: Add the missing TEST_FILES assignment
    a895c40ca633 PCI: Restore Resizable BAR size bits correctly for 1MB BARs
    0ea26a3c4336 PCI: vmd: Fix shadow offsets to reflect spec changes
    7dfe1d4b949d PCI: hv: Avoid use of hv_pci_dev->pci_slot after freeing it
    2bd27a041f5b PCI: vmd: Fix config addressing when using bus offsets
    04576078716b timer: Read jiffies once when forwarding base clk
    d964d65c20ae usercopy: Avoid HIGHMEM pfn warning
    37fdb252a315 tracing: Make sure variable reference alias has correct var_ref_idx
    212d21abd0f9 power: supply: sbs-battery: only return health when battery present
    1cee0eb9f606 power: supply: sbs-battery: use correct flags field
    51b90fe021de MIPS: Treat Loongson Extensions as ASEs
    b127de42d3ea crypto: ccree - use the full crypt length value
    f244496b19f2 crypto: ccree - account for TEE not ready to report
    de6922d9ab63 crypto: caam - fix concurrency issue in givencrypt descriptor
    4fd6651142be crypto: caam/qi - fix error handling in ERN handler
    c4b56f7746ff crypto: cavium/zip - Add missing single_release()
    a2edd8487639 crypto: skcipher - Unmap pages after an external error
    85a3e980d873 crypto: qat - Silence smp_processor_id() warning
    f00ae50250a7 tools lib traceevent: Do not free tep->cmdlines in add_new_comm() on failure
    623451aba2cf tools lib traceevent: Fix "robust" test of do_generate_dynamic_list_file
    3dcc2fed6e40 can: mcp251x: mcp251x_hw_reset(): allow more time after a reset
    82262ec35ddb powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on POWER9
    ff2880ac0da2 powerpc/mm: Fix an Oops in kasan_mmu_init()
    5a2987852f46 powerpc/mm: Add a helper to select PAGE_KERNEL_RO or PAGE_READONLY
    45a769de36eb powerpc/book3s64/radix: Rename CPU_FTR_P9_TLBIE_BUG feature flag
    cf2b70b6b656 powerpc/book3s64/mm: Don't do tlbie fixup for some hardware revisions
    2685e06f19a6 powerpc/kasan: Fix shadow area set up for modules.
    5e7044ab7567 powerpc/kasan: Fix parallel loading of modules.
    5e56a0800d67 powerpc/powernv/ioda: Fix race in TCE level allocation
    e0f04cdca674 powerpc/pseries: Fix cpu_hotplug_lock acquisition in resize_hpt()
    e76223f82362 powerpc/powernv: Restrict OPAL symbol map to only be readable by root
    dae12b5175c7 powerpc/ptdump: Fix addresses display on PPC32
    1552ecc37cf8 powerpc/32s: Fix boot failure with DEBUG_PAGEALLOC without KASAN.
    aeea368a2c97 powerpc/603: Fix handling of the DIRTY flag
    838485d94fac powerpc/mce: Schedule work from irq_work
    5a707634e866 powerpc/mce: Fix MCE handling for huge pages
    789e9c0c699d powerpc/xive: Implement get_irqchip_state method for XIVE to fix shutdown race
    f7f281ee8c8d ASoC: sgtl5000: Improve VAG power and mute control
    917b868fc1db ASoC: Define a set of DAPM pre/post-up events
    f153e91caf36 PM / devfreq: tegra: Fix kHz to Hz conversion
    883dbbc1e7ca nbd: fix max number of supported devs
    f3a500b77c59 KVM: X86: Fix userspace set invalid CR4
    15153db63642 KVM: PPC: Book3S HV: Don't lose pending doorbell request on migration on P9
    a0bc470fc62e KVM: PPC: Book3S HV: Check for MMU ready on piggybacked virtual cores
    9772769d3990 KVM: PPC: Book3S HV: Fix race in re-enabling XIVE escalation interrupts
    93fd3eab6a8a KVM: PPC: Book3S HV: Don't push XIVE context when not using XIVE device
    2d09838ea088 KVM: PPC: Book3S HV: XIVE: Free escalation interrupts before disabling the VP
    1da0d7bce2bc KVM: PPC: Book3S: Enable XIVE native capability only if OPAL has required functions
    ed90a05c0b1b KVM: s390: fix __insn32_query() inline assembly
    87a6398ef7b8 s390/cio: exclude subchannels with no parent from pseudo check
    bd54ca01c976 s390/cio: avoid calling strlen on null pointer
    fbba7e0326fe s390/topology: avoid firing events before kobjs are created
    8892a0c67e9a KVM: s390: Test for bad access register and size at the start of S390_MEM_OP
    dac32cc04e95 s390/sclp: Fix bit checked for has_sipl
    d08741d62973 s390/process: avoid potential reading of freed stack

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 73c8fc8c9bf4b0fe0e485c12bee9922a64aa1cdd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 83b44a8c4d..b2214241dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ab16819b1520191e73213bc0cd7a7433349efcca"
-SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
+SRCREV_machine ?= "64ea323b90275e7f14d89377c792bbfbb18c44a8"
+SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.21"
+LINUX_VERSION ?= "5.2.22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 7ece6e0dce..35c7b0dec7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.21"
+LINUX_VERSION ?= "5.2.22"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "1c68baaea976d9e28b5f2b445a90afb4865994c8"
-SRCREV_machine ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
+SRCREV_machine_qemuarm ?= "8e35cd4c39258d1164e06351da55a21913664cae"
+SRCREV_machine ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index c7f601769f..f2c56c904f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fcd7089abefcf3025b6a49baa0604fb7215886ce"
-SRCREV_machine_qemuarm64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_machine_qemumips ?= "30bbc3b38f5caa851d01b37ab1cdd2dae75e9592"
-SRCREV_machine_qemuppc ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_machine_qemuriscv64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_machine_qemux86 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_machine_qemux86-64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_machine_qemumips64 ?= "4dab38a25c5b32491b23cd95eca75a68f02b3339"
-SRCREV_machine ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
-SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
+SRCREV_machine_qemuarm ?= "93335e3d0acb7454c83bce7953ee9d03a35efc9a"
+SRCREV_machine_qemuarm64 ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemumips ?= "e232ed9ae26f63b388ae0f3fb9d543a4d369db35"
+SRCREV_machine_qemuppc ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemuriscv64 ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemux86 ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemux86-64 ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemumips64 ?= "5bc76928dd614b75cfa6c1606362c03f69293f7e"
+SRCREV_machine ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.21"
+LINUX_VERSION ?= "5.2.22"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


