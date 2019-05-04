Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 18B917D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:33 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id i21so4201545pgi.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lo/uf7KqQBMEBmbCDeKcxIOQYLMmHmDd5csGHaJ/tao=;
	b=JUDHVC4kgw7ttl6V967CdfsHblUTTp1o4Q+Le2pHWND0KPrEFOzqXgSCgWWPrWGRoA
	km44JjLQ/iu9evWu3+D12bA+SdvuyxLwvdhU+otWQTJYuf9lIq6Gsqh/vpdmfjQn1O1O
	pcB+xyn0p3eT5px1yDdDDR0S7bofs63uGdp2dvKb4Wa86Bl/tbkxF4f76K0Aw7/0a8CV
	MfaRUKg+orEobINlTVnVuV7qcgRdN6UpesMPLlGeLzxvLejGfMcXaxYKAknr4NIOriIs
	XlmwKG99f4tTDXKixWpgDX8yalPVIziM3DR3oaNDWSw4ZXIVsGMXM2s4Zfp/P/6pRB1Z
	RB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lo/uf7KqQBMEBmbCDeKcxIOQYLMmHmDd5csGHaJ/tao=;
	b=T9xWUtBM1CHOsdhFWNf0pELlavqsWfDZjX52XNu8MKM/2rwNAsRYxdKniODG9PBSqL
	NCJSfCDEGw/TBNkS8QOMqcFLFJA/egz8X91HILmnfggsBsAPAIRQ3cKsjomOTZDabycr
	CdmXd12qV5ymgSPJjJcmWg6CJHaNwspZNQ/gO6+4G5u5reckrTO/lBvbY0Et3hJCxUw3
	IOkZnOBAN1B0GyE8QVtOANKFeX5XNfvJZMRfUoItllsJP1TfzwVdAWtOnearXOnFLmla
	CNBhD0ZdYhCE6aeIyWxbGYDQT7xKazwBBXuR69sQU5i0bTCn90flG1m7MAmr9F+x8JhT
	rpAQ==
X-Gm-Message-State: APjAAAUHmSp175IptpV+2PBRMeyC8H97j/+4M12sSPHRpeNF9/BdFMsF
	TVDrH/Qz/eaBw79JI5fAWxSl7MgJ
X-Google-Smtp-Source: APXvYqylrpcdxD7dvyx7My2kb4jEyHnsVmJzOvrA791s5aQWX5Q8CKb7wLr0azAbkHaBxxsSQHGR+A==
X-Received: by 2002:a63:6116:: with SMTP id v22mr19107342pgb.272.1556983653848;
	Sat, 04 May 2019 08:27:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:44 -0700
Message-Id: <bfb471e1557d8e3bf504668b38384388f0e8969e.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 08/43] linux-yocto/4.19: update to v4.19.34
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
X-List-Received-Date: Sat, 04 May 2019 15:27:34 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable releases that comprise the following
commits:

   4d552acf3370 Linux 4.19.34
   d5813e77363c kprobes/x86: Blacklist non-attachable interrupt functions
   e7d26616c92b bcache: fix potential div-zero error of writeback_rate_p_term_inverse
   09abe130820b ACPI / video: Extend chassis-type detection with a "Lunch Box" check
   d1d2ca98b78f net: stmmac: Avoid one more sometimes uninitialized Clang warning
   972e31ba4bc2 drm/dp/mst: Configure no_stop_bit correctly for remote i2c xfers
   986a2bb54a31 Input: soc_button_array - fix mapping of the 5th GPIO in a PNP0C40 device
   6d2817e2ab8c dmaengine: tegra: avoid overflow of byte tracking
   7386f095b709 clk: rockchip: fix frac settings of GPLL clock for rk3328
   c8e4f8406842 clk: meson: clean-up clock registration
   6251c1db04f2 drm/fb-helper: fix leaks in error path of drm_fb_helper_fbdev_setup
   648b949b7870 x86/build: Mark per-CPU symbols as absolute explicitly for LLD
   52cd9e0e43c7 wlcore: Fix memory leak in case wl12xx_fetch_firmware failure
   05b23c66bb6e brcmfmac: Use firmware_request_nowarn for the clm_blob
   e30e0b0915b6 selinux: do not override context on context mounts
   d2053718e087 x86/build: Specify elf_i386 linker emulation explicitly for i386 objects
   e0662d00c98a drm/nouveau: Stop using drm_crtc_force_disable
   1d377200482b drm: Auto-set allow_fb_modifiers when given modifiers at plane init
   27d6de370cdc pinctrl: meson: meson8b: add the eth_rxd2 and eth_rxd3 pins
   61174e34611f regulator: act8865: Fix act8600_sudcdc_voltage_ranges setting
   bcdd4a5ee1c5 media: s5p-jpeg: Check for fmt_ver_flag when doing fmt enumeration
   9bfd4ab5e8e4 media: rcar-vin: Allow independent VIN link enablement
   2e6bcc327b0b netfilter: physdev: relax br_netfilter dependency
   24296fbc5445 dmaengine: qcom_hidma: initialize tx flags in hidma_prep_dma_*
   c55f4a6e798d dmaengine: qcom_hidma: assign channel cookie correctly
   afacaf85543b dmaengine: imx-dma: fix warning comparison of distinct pointer types
   fba4c61e9888 cpu/hotplug: Mute hotplug lockdep during init
   a6c671e23168 hpet: Fix missing '=' character in the __setup() code of hpet_mmap_enable
   dbeca415575f f2fs: UBSAN: set boolean value iostat_enable correctly
   16b06b15dd53 HID: intel-ish: ipc: handle PIMR before ish_wakeup also clear PISR busy_clear bit
   67c2be160519 soc/tegra: fuse: Fix illegal free of IO base address
   a3aa9d93b9ab hwrng: virtio - Avoid repeated init of completion
   7aaa76e8a6ab media: mt9m111: set initial frame size other than 0x0
   fd400e96c599 perf script python: Add trace_context extension module to sys.modules
   d90a375b786c perf script python: Use PyBytes for attr in trace-event-python
   f94e369fe7a8 platform/x86: intel-hid: Missing power button release on some Dell models
   1e55e3f6c735 usb: dwc3: gadget: Fix OTG events when gadget driver isn't loaded
   2b20c29bcdf6 ALSA: dice: add support for Solid State Logic Duende Classic/Mini
   3abb3d0418e1 drm/amd/display: Enable vblank interrupt during CRC capture
   06af7dda05b3 powerpc/pseries: Perform full re-add of CPU for topology update post-migration
   57f03bbd4236 tty: increase the default flip buffer limit to 2*640K
   2142eba848a1 backlight: pwm_bl: Use gpiod_get_value_cansleep() to get initial state
   d0bc74c5632f cgroup/pids: turn cgroup_subsys->free() into cgroup_subsys->release() to fix the accounting
   b52681e6e623 powerpc/64s: Clear on-stack exception marker upon exception return
   118d38a3577f selftests/bpf: skip verifier tests for unsupported program types
   ae92cf4760f8 bpf: fix missing prototype warnings
   06666a19d5a5 block, bfq: fix in-service-queue check for queue merging
   30d503bae967 ARM: avoid Cortex-A9 livelock on tight dmb loops
   d8945878ded6 ARM: 8830/1: NOMMU: Toggle only bits in EXC_RETURN we are really care of
   668713493a19 mt7601u: bump supported EEPROM version
   a2479c401054 soc: qcom: gsbi: Fix error handling in gsbi_probe()
   ce80ebf7a04e efi/arm/arm64: Allow SetVirtualAddressMap() to be omitted
   240a9050a3d8 ARM: dts: lpc32xx: Remove leading 0x and 0s from bindings notation
   b5c1dc9d8fa4 drm/vkms: Bugfix extra vblank frame
   e8e0bd4915ec sched/core: Use READ_ONCE()/WRITE_ONCE() in move_queued_task()/task_rq_lock()
   b12a060a0bd2 efi/memattr: Don't bail on zero VA if it equals the region's PA
   f056c90f079a sched/debug: Initialize sd_sysctl_cpus if !CONFIG_CPUMASK_OFFSTACK
   442caac9fce9 ASoC: fsl-asoc-card: fix object reference leaks in fsl_asoc_card_probe
   b4410c7d731d iwlwifi: mvm: fix RFH config command with >=10 CPUs
   080e00c8f6f9 staging: spi: mt7621: Add return code check on device_reset()
   f0eb935c50b9 i2c: of: Try to find an I2C adapter matching the parent
   7c114e8605a9 platform/x86: intel_pmc_core: Fix PCH IP sts reading
   b9f257e27890 e1000e: Exclude device from suspend direct complete optimization
   c23242c36bdd e1000e: fix cyclic resets at link up with active tx
   efd85d83ac0f perf/aux: Make perf_event accessible to setup_aux()
   355ffe6cc2a1 drm/amd/display: Disconnect mpcc when changing tg
   6c68d1654c27 drm/amd/display: Don't re-program planes for DPMS changes
   322a55a56a2a drm: rcar-du: add missing of_node_put
   924af49998c2 cdrom: Fix race condition in cdrom_sysctl_register
   6d293647f8d9 fbdev: fbmem: fix memory access if logo is bigger than the screen
   2dd699432958 net: phy: consider latched link-down status in polling mode
   5203cf8e29e5 iw_cxgb4: fix srqidx leak during connection abort
   a78aae93ba9c net: marvell: mvpp2: fix stuck in-band SGMII negotiation
   1f3694865d56 genirq: Avoid summation loops for /proc/stat
   98eddc19f9e9 bcache: improve sysfs_strtoul_clamp()
   b468e0007435 bcache: fix potential div-zero error of writeback_rate_i_term_inverse
   c7b687ebe0fb bcache: fix input overflow to sequential_cutoff
   16975f04f2ca bcache: fix input overflow to cache set sysfs file io_error_halflife
   845d4849b60c sched/topology: Fix percpu data types in struct sd_data & struct s_data
   ad02fb6a6cc8 usb: f_fs: Avoid crash due to out-of-scope stack ptr access
   126f2f6af291 ath10k: fix shadow register implementation for WCN3990
   ccce764322d8 ALSA: PCM: check if ops are defined before suspending PCM
   d21a63fc1e53 ARM: dts: meson8b: fix the Ethernet data line signals in eth_rgmii_pins
   d93fe5e6c9d9 ARM: 8833/1: Ensure that NEON code always compiles with Clang
   3a1ce9793855 netfilter: conntrack: fix cloned unconfirmed skb->_nfct race in __nf_conntrack_confirm
   d53b295f7805 kprobes: Prohibit probing on RCU debug routine
   bc9d714395e2 kprobes: Prohibit probing on bsearch()
   c63cc8d1487c selftests: skip seccomp get_metadata test if not real root
   2df541d0a665 ACPI / video: Refactor and fix dmi_is_desktop()
   d63105845ac5 iwlwifi: pcie: fix emergency path
   5cdd025907b8 perf report: Add s390 diagnosic sampling descriptor size
   5658279f50ea leds: lp55xx: fix null deref on firmware load failure
   9154420173d5 jbd2: fix race when writing superblock
   a74ebf047e4f cgroup, rstat: Don't flush subtree root unless necessary
   b13eb5245f9f HID: intel-ish-hid: avoid binding wrong ishtp_cl_device
   c26d61ea90db vfs: fix preadv64v2 and pwritev64v2 compat syscalls with offset == -1
   7273c2b1e79c xen/gntdev: Do not destroy context while dma-bufs are in use
   e9cd7f543764 mt76: usb: do not run mt76u_queues_deinit twice
   5cde7721dd05 media: mtk-jpeg: Correct return type for mem2mem buffer helpers
   745cdc344f97 media: mx2_emmaprp: Correct return type for mem2mem buffer helpers
   73a4cc59054e media: s5p-g2d: Correct return type for mem2mem buffer helpers
   3c6cd079058e media: rockchip/rga: Correct return type for mem2mem buffer helpers
   55919fc28419 media: s5p-jpeg: Correct return type for mem2mem buffer helpers
   a23fd268fdbb media: sh_veu: Correct return type for mem2mem buffer helpers
   635fabdd8202 media: ov7740: fix runtime pm initialization
   1d836ce73a10 SoC: imx-sgtl5000: add missing put_device()
   d41687c82a70 perf report: Don't shadow inlined symbol with different addr range
   801b8d8c7729 mwifiex: don't advertise IBSS features without FW support
   d323e59f58bb perf test: Fix failure of 'evsel-tp-sched' test on s390
   345c7757fd54 drm/amd/display: Clear stream->mode_changed after commit
   1ef1b20f8711 scsi: fcoe: make use of fip_mode enum complete
   8032fc9120c2 scsi: megaraid_sas: return error when create DMA pool failed
   2c6e3ec8a906 s390/ism: ignore some errors during deregistration
   d60f458e4c4d efi: cper: Fix possible out-of-bounds access
   e57f4676b92f cpufreq: acpi-cpufreq: Report if CPU doesn't support boost technologies
   eb70531a95c8 ASoC: qcom: Fix of-node refcount unbalance in qcom_snd_parse_of()
   e6786f8686ef perf annotate: Fix getting source line failure
   763a895aa49c clk: fractional-divider: check parent rate only if flag is set
   d3ec442d609b IB/mlx4: Increase the timeout for CM cache
   61584032c4d6 loop: set GENHD_FL_NO_PART_SCAN after blkdev_reread_part()
   07a31820b241 platform/mellanox: mlxreg-hotplug: Fix KASAN warning
   0bacfb4adc1b platform/x86: ideapad-laptop: Fix no_hw_rfkill_list for Lenovo RESCUER R720-15IKBN
   a64ffbaf7056 mlxsw: spectrum: Avoid -Wformat-truncation warnings
   49dd86f0f5ec e1000e: Fix -Wformat-truncation warnings
   c6fb45d895e0 net: dsa: mv88e6xxx: Add lockdep classes to fix false positive splat
   194b888af85e mmc: omap: fix the maximum timeout setting
   dcedd37957de btrfs: qgroup: Make qgroup async transaction commit more aggressive
   6cf5f631bad0 powerpc/hugetlb: Handle mmap_min_addr correctly in get_unmapped_area callback
   fc96b44c05c2 iommu/io-pgtable-arm-v7s: Only kmemleak_ignore L2 tables
   d81bdb3c17f1 ARM: 8840/1: use a raw_spinlock_t in unwind
   951307172652 serial: 8250_pxa: honor the port number from devicetree
   2636ccec991e coresight: etm4x: Add support to enable ETMv4.2
   c70214d519ed powerpc/xmon: Fix opcode being uninitialized in print_insn_powerpc
   638ecaf58369 kbuild: invoke syncconfig if include/config/auto.conf.cmd is missing
   5db107484403 scsi: core: replace GFP_ATOMIC with GFP_KERNEL in scsi_scan.c
   4acf797458ce powerpc/powernv/ioda: Fix locked_vm counting for memory used by IOMMU tables
   6030bcc04735 usb: chipidea: Grab the (legacy) USB PHY by phandle first
   b142c7973338 crypto: cavium/zip - fix collision with generic cra_driver_name
   d401d121113e crypto: crypto4xx - add missing of_node_put after of_device_is_available
   241ebd2ea44b mt76: fix a leaked reference by adding a missing of_node_put
   6115055b4efe wil6210: check null pointer in _wil_cfg80211_merge_extra_ies
   9546c3662dc5 PCI/PME: Fix hotplug/sysfs remove deadlock in pcie_pme_remove()
   224c996e48be tools lib traceevent: Fix buffer overflow in arg_eval
   83c395332fdf fs: fix guard_bio_eod to check for real EOD errors
   6a817a7aed1c jbd2: fix invalid descriptor block checksum
   ca66f667189c netfilter: conntrack: tcp: only close if RST matches exact sequence
   709aaa09b200 netfilter: nf_tables: check the result of dereferencing base_chain->stats
   36a3219e617a cifs: Fix NULL pointer dereference of devname
   d579b4eae836 cifs: Accept validate negotiate if server return NT_STATUS_NOT_SUPPORTED
   4ab78f4d75c6 f2fs: fix to check inline_xattr_size boundary correctly
   8c81fcd3d5c1 dm thin: add sanity checks to thin-pool and external snapshot creation
   626d98bbdb30 cifs: use correct format characters
   a6c56bf63e87 page_poison: play nicely with KASAN
   d609ecd887f8 fs/file.c: initialize init_files.resize_wait
   9b4f27667402 f2fs: do not use mutex lock in atomic context
   20141feb9bde ocfs2: fix a panic problem caused by o2cb_ctl
   f09c424cea9f mm/slab.c: kmemleak no scan alien caches
   8a0fc62e331e mm/vmalloc.c: fix kernel BUG at mm/vmalloc.c:512!
   67abbb9c5422 mm, mempolicy: fix uninit memory access
   9d785b92cf0d memcg: killed threads should not invoke memcg OOM killer
   eed3ca0a66cf mm,oom: don't kill global init via memory.oom.group
   ed3345a6607b mm, swap: bounds check swap_info array accesses to avoid NULL derefs
   4c6d7dc741cb mm/page_ext.c: fix an imbalance with kmemleak
   f555b008c576 mm/cma.c: cma_declare_contiguous: correct err handling
   7b287c47e452 mm/sparse: fix a bad comparison
   aea8c971b9c5 perf c2c: Fix c2c report for empty numa node
   c3f28d59c1a5 x86/hyperv: Fix kernel panic when kexec on HyperV
   3e8d62218aa4 iio: adc: fix warning in Qualcomm PM8xxx HK/XOADC driver
   e27cced35a4b scsi: hisi_sas: Fix a timeout race of driver internal and SMP IO
   fce6aeaf913e scsi: hisi_sas: Set PHY linkrate when disconnected
   e21f655c60fa libbpf: force fixdep compilation at the start of the build
   6048330675cc enic: fix build warning without CONFIG_CPUMASK_OFFSTACK
   9ec4860de95a net: stmmac: Avoid sometimes uninitialized Clang warnings
   b227f1571269 sysctl: handle overflow for file-max
   d6ad08aa3467 include/linux/relay.h: fix percpu annotation in struct rchan
   4c96500e3658 gpio: gpio-omap: fix level interrupt idling
   8c50ab86e288 net/mlx5: Avoid panic when setting vport mac, getting vport config
   3bddc6149f02 net/mlx5: Avoid panic when setting vport rate
   b73c7d020452 tracing: kdb: Fix ftdump to not sleep
   d7391962d723 f2fs: fix to avoid deadlock in f2fs_read_inline_dir()
   198c99857b30 f2fs: fix to adapt small inline xattr space in __find_inline_xattr()
   56bb66c50296 h8300: use cc-cross-prefix instead of hardcoding h8300-unknown-linux-
   2938651d36ca CIFS: fix POSIX lock leak and invalid ptr deref
   442d5d171cd8 tty/serial: atmel: RS485 HD w/DMA: enable RX after TX is stopped
   b6b4bcb40be0 tty/serial: atmel: Add is_half_duplex helper
   2dbc7c66d6da ext4: cleanup bh release code in ext4_ind_remove_space()
   bd62f1fe736e arm64: debug: Don't propagate UNKNOWN FAR into si_code for debug signals
   4b3a3ab00fa7 Linux 4.19.33
   11008a9b0fc7 platform: x86: intel_cht_int33fe: Remove the old connections for the muxes
   056cda45cfed usb: typec: class: Don't use port parent for getting mux handles
   6875404a12f8 platform: x86: intel_cht_int33fe: Add connections for the USB Type-C port
   681a9fc184b3 platform: x86: intel_cht_int33fe: Add connection for the DP alt mode
   3bb446a3fe87 platform: x86: intel_cht_int33fe: Register all connections at once
   e99d90ce7750 drivers: base: Helpers for adding device connection descriptions
   f5959dec081a bpf: do not restore dst_reg when cur_state is freed
   738dda85d181 staging: erofs: keep corrupted fs from crashing kernel in erofs_readdir()
   83bbd66b3753 staging: erofs: fix error handling when failed to read compresssed data
   3a18eabaa712 KVM: x86: Emulate MSR_IA32_ARCH_CAPABILITIES on AMD hosts
   b9733a74350d KVM: x86: update %rip after emulating IO
   7ceedcefc2d2 KVM: Reject device ioctls from processes other than the VM's creator
   a0713e8103d1 x86/smp: Enforce CONFIG_HOTPLUG_CPU when SMP=y
   a56aa02e6f15 cpu/hotplug: Prevent crash when CPU bringup fails on CONFIG_HOTPLUG_CPU=n
   336f6b23b5b8 watchdog: Respect watchdog cpumask on CPU hotplug
   c91d07ad34d7 powerpc/64: Fix memcmp reading past the end of src/dest
   d7c00bbbfac4 powerpc/pseries/energy: Use OF accessor functions to read ibm,drc-indexes
   0603e3a9281d objtool: Query pkg-config for libelf location
   a436cf6479c0 perf intel-pt: Fix TSC slip
   5f9366330950 perf pmu: Fix parser error for uncore event alias
   f70ddae24bdf mm/migrate.c: add missing flush_dcache_page for non-mapped page migrate
   5966777dd807 mm: mempolicy: make mbind() return -EIO when MPOL_MF_STRICT is specified
   c9874d397807 iommu/io-pgtable-arm-v7s: request DMA32 memory, and improve debugging
   62d342d67060 mm: add support for kmem caches in DMA32 zone
   2392ffab085a usb: cdc-acm: fix race during wakeup blocking TX traffic
   82a5090aad84 xhci: Don't let USB3 ports stuck in polling state prevent suspend
   20a09a2e8703 usb: xhci: dbc: Don't free all memory with spinlock held
   c81b872281a1 xhci: Fix port resume done detection for SS ports with LPM enabled
   093ccda1a041 usb: host: xhci-rcar: Add XHCI_TRUST_TX_LENGTH quirk
   015e5c17617a usb: common: Consider only available nodes for dr_mode
   ef4df134e77e USB: gadget: f_hid: fix deadlock in f_hidg_write()
   614ac345bfec usb: mtu3: fix EXTCON dependency
   66e44981de0e phy: sun4i-usb: Support set_mode to USB_HOST for non-OTG PHYs
   6ebe03734361 gpio: adnp: Fix testing wrong value in adnp_gpio_direction_input
   b26f7e86d3cc gpio: exar: add a check for the return value of ida_simple_get fails
   df74e70ffec6 drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index check
   75f9e994b9fd drm/vkms: fix use-after-free when drm_gem_handle_create() fails
   eb1e552524b4 drm/vgem: fix use-after-free when drm_gem_handle_create() fails
   07d0d2bd957a fs/proc/proc_sysctl.c: fix NULL pointer dereference in put_links
   c956914f1efa Disable kgdboc failed by echo space to /sys/module/kgdboc/parameters/kgdboc
   1c992ea006ce USB: serial: option: add Olicard 600
   19151c645d0c USB: serial: option: add support for Quectel EM12
   002795b0d9b3 USB: serial: option: set driver_info for SIM5218 and compatibles
   d7dfccfd3c4b USB: serial: mos7720: fix mos_parport refcount imbalance on error path
   1f46db3cc133 USB: serial: ftdi_sio: add additional NovaTech products
   2a63003545d0 USB: serial: cp210x: add new device id
   59203f078cc6 serial: sh-sci: Fix setting SCSCR_TIE while transferring data
   b1e660c6f802 serial: mvebu-uart: Fix to avoid a potential NULL pointer dereference
   f34ec64b3f6c serial: max310x: Fix to avoid potential NULL pointer dereference
   a090ed15420a staging: erofs: fix to handle error path of erofs_vmap()
   3b6b76644ba5 staging: vt6655: Fix interrupt race condition on device start up.
   b9ddff2a41cd staging: vt6655: Remove vif check from vnt_interrupt
   86092f2d5ccb staging: speakup_soft: Fix alternate speech with other synths
   d0360bf48143 staging: comedi: ni_mio_common: Fix divide-by-zero for DIO cmdtest
   668ba38d8950 tty: serial: qcom_geni_serial: Initialize baud in qcom_geni_console_setup
   b9bbd1edddf7 tty: atmel_serial: fix a potential NULL pointer dereference
   124e42064c0d tty: mxs-auart: fix a potential NULL pointer dereference
   7fb7414da97e drm/rockchip: vop: reset scale mode when win is disabled
   a93cd9137fea scsi: zfcp: fix scsi_eh host reset with port_forced ERP for non-NPIV FCP devices
   983a543de13a scsi: zfcp: fix rport unblock if deleted SCSI devices on Scsi_Host
   a52eb223a6ee scsi: sd: Quiesce warning if device does not report optimal I/O size
   d72658775c4b scsi: sd: Fix a race between closing an sd device and sd I/O
   3b3fcc3d4ffd ocfs2: fix inode bh swapping mixup in ocfs2_reflink_inodes_lock
   72b790c417b9 fs/open.c: allow opening only regular files during execve()
   aa7f29f87027 kbuild: modversions: Fix relative CRC byte order interpretation
   4dfae837ceaf ALSA: hda/realtek - Fix speakers on Acer Predator Helios 500 Ryzen laptops
   6f3dbb71085c ALSA: hda/realtek: Enable headset MIC of ASUS X430UN and X512DK with ALC256
   633d5db40280 ALSA: hda/realtek: Enable headset mic of ASUS P5440FF with ALC256
   fd4000c77a5a ALSA: hda/realtek: Enable ASUS X441MB and X705FD headset MIC with ALC256
   48e8e6a736b6 ALSA: hda/realtek - Add support for Acer Aspire E5-523G/ES1-432 headset mic
   5fa5a8679b92 ALSA: hda/realtek: Enable headset MIC of Acer Aspire Z24-890 with ALC286
   5ec67684be9e ALSA: hda/realtek: Enable headset MIC of Acer AIO with ALC286
   89ec6d400b5d ALSA: hda/realtek - Add support headset mode for New DELL WYSE NB
   522f06c9c00d ALSA: hda/realtek - Add support headset mode for DELL WYSE AIO
   5b93302bbc4e ALSA: pcm: Don't suspend stream in unrecoverable PCM state
   7fc6064dc3b2 ALSA: pcm: Fix possible OOB access in PCM oss plugins
   b425f45295dd ALSA: seq: oss: Fix Spectre v1 vulnerability
   bd55e6727a33 ALSA: rawmidi: Fix potential Spectre v1 vulnerability
   a485919fe4cc net: dsa: qca8k: remove leftover phy accessors
   64751542d3f3 NFSv4.1 don't free interrupted slot on open
   da57cba4f3f1 NFS: fix mount/umount race in nlmclnt.
   0f273f0c3064 vfio: ccw: only free cp on final interrupt
   92d4ee2e8276 powerpc: bpf: Fix generation of load/store DW instructions
   9397f0d9948c ARM: imx6q: cpuidle: fix bug that CPU might not wake up at expected time
   fd1b25364fef Btrfs: fix assertion failure on fsync with NO_HOLES enabled
   0ae3b84b3fa6 btrfs: Avoid possible qgroup_rsv_size overflow in btrfs_calculate_inode_block_rsv_size
   1cf4ab01eb5a btrfs: raid56: properly unmap parity page in finish_parity_scrub()
   d952c337b25d btrfs: don't report readahead errors and don't update statistics
   b57220cc9820 btrfs: remove WARN_ON in log_dir_items
   22dcb30fb9d8 Btrfs: fix incorrect file size after shrinking truncate and fsync
   a1df5db3a9f1 powerpc/security: Fix spectre_v2 reporting
   986f0c656749 powerpc/fsl: Fix the flush of branch predictor.
   b848d19c483a powerpc/fsl: Fixed warning: orphan section `__btb_flush_fixup'
   632d839296bd powerpc/fsl: Update Spectre v2 reporting
   43f40620d7a5 powerpc/fsl: Enable runtime patching if nospectre_v2 boot arg is used
   a46a50382639 powerpc/fsl: Flush branch predictor when entering KVM
   3cb931c709d0 powerpc/fsl: Flush the branch predictor at each kernel entry (32 bit)
   cf72dad924cb powerpc/fsl: Flush the branch predictor at each kernel entry (64bit)
   020e5f13805b powerpc/fsl: Add nospectre_v2 command line argument
   4a6a2287e0e6 powerpc/fsl: Emulate SPRN_BUCSR register
   4944f1d48d71 powerpc/fsl: Add macro to flush the branch predictor
   d67ab3d9a1b7 powerpc/fsl: Add infrastructure to fixup branch predictor flush
   e044d21c2999 tun: add a missing rcu_read_unlock() in error path
   6bdb5fdc4787 thunderx: eliminate extra calls to put_page() for pages held for recycling
   ac8411d75962 thunderx: enable page recycling for non-XDP case
   a491de9041b4 net: sched: fix cleanup NULL pointer exception in act_mirr
   7254ad094f4a ila: Fix rhashtable walker list corruption
   979f8a675d3b vxlan: Don't call gro_cells_destroy() before device is unregistered
   3b1386beeef4 vrf: prevent adding upper devices
   8ea78da1aa3e tun: properly test for IFF_UP
   52a7505c91a1 tipc: fix cancellation of topology subscriptions
   1be6c0c737e4 tipc: change to check tipc_own_id to return in tipc_net_stop
   24d1a6259706 tipc: allow service ranges to be connect()'ed on RDM/DGRAM
   7115df614b09 tcp: do not use ipv6 header for ipv4 flow
   cab576f1b00f sctp: use memdup_user instead of vmemdup_user
   97265479d7ca sctp: get sctphdr by offset in sctp_compute_cksum
   cf86f7a97561 rhashtable: Still do rehash when we get EEXIST
   69cea7cf3170 packets: Always register packet sk in the same order
   d9d215be3a3a net-sysfs: call dev_hold if kobject_init_and_add success
   8dcf078d92ae net: stmmac: fix memory corruption with large MTUs
   7eeb12edf637 net: rose: fix a possible stack overflow
   a6f0168e6681 net: phy: meson-gxl: fix interrupt support
   85ef72d829eb net/packet: Set __GFP_NOWARN upon allocation in alloc_pg_vec
   88c64f9c7d3f net: datagram: fix unbounded loop in __skb_try_recv_datagram()
   e4ff39e1ba80 net: aquantia: fix rx checksum offload for UDP/TCP over IPv6
   c408426292ee mISDN: hfcpci: Test both vendor & device ID for Digium HFC4S
   e0f8c06f45c3 mac8390: Fix mmio access size probe
   be09211384c2 ipv6: make ip6_create_rt_rcu return ip6_null_entry instead of NULL
   53adaacbbadb gtp: change NET_UDP_TUNNEL dependency to select
   9b8ef421b481 genetlink: Fix a memory leak on error path
   321461f2497f dccp: do not use ipv6 header for ipv4 flow
   6bba17f6bce3 ipmi_si: Fix crash when using hard-coded device
   15d6538a0d6e Bluetooth: Verify that l2cap_get_conf_opt provides large enough buffer
   2318c0e4b87e Bluetooth: Check L2CAP option sizes returned from l2cap_get_conf_opt
   3a2156c839c7 Linux 4.19.32
   33bd347fee01 power: supply: charger-manager: Fix incorrect return value
   19184190b029 ALSA: hda - Enforces runtime_resume after S3 and S4 for each codec
   156ba57f4ba6 ALSA: hda - Record the current power state before suspend/resume calls
   0e0f7b307212 locking/lockdep: Add debug_locks check in __lock_downgrade()
   206a76a684a7 x86/unwind: Add hardcoded ORC entry for NULL
   367ccafbcbfe x86/unwind: Handle NULL pointer calls better in frame unwinder
   3254dd301f80 loop: access lo_backing_file only when the loop device is Lo_bound
   35cdcdc5c49d netfilter: ebtables: remove BUGPRINT messages
   1fd916e879a9 f2fs: fix to avoid deadlock of atomic file operations
   9dd5053c8cd5 RDMA/cma: Rollback source IP address if failing to acquire device
   015b828bd66d drm: Reorder set_property_atomic to avoid returning with an active ww_ctx
   e365b94086f9 Bluetooth: hci_ldisc: Postpone HCI_UART_PROTO_READY bit set in hci_uart_set_proto()
   f67202f78fe3 Bluetooth: hci_ldisc: Initialize hci_dev before open()
   4b39051363a0 Bluetooth: Fix decrementing reference count twice in releasing socket
   4e0ca4bfa2bc Bluetooth: hci_uart: Check if socket buffer is ERR_PTR in h4_recv_buf()
   6bef442eea18 media: v4l2-ctrls.c/uvc: zero v4l2_event
   d12d86411c03 ext4: brelse all indirect buffer in ext4_ind_remove_space()
   76c9ee6bd5d2 ext4: fix data corruption caused by unaligned direct AIO
   558331d0205b ext4: fix NULL pointer dereference while journal is aborted
   ff7a1f81c20e ALSA: ac97: Fix of-node refcount unbalance
   c8e91d756703 ALSA: hda/ca0132 - make pci_iounmap() call conditional
   4a767459389a ALSA: x86: Fix runtime PM for hdmi-lpe-audio
   38bd575b9aef SMB3: Fix SMB3.1.1 guest mounts to Samba
   aacf2cc814c2 irqchip/gic-v3-its: Fix comparison logic in lpi_range_cmp
   daaeeca918e7 objtool: Move objtool_file struct off the stack
   37c6f8089806 perf probe: Fix getting the kernel map
   14c52acaac86 cifs: allow guest mounts to work for smb3.11
   36d52f5bcd57 futex: Ensure that futex address is aligned in handle_futex_death()
   837becb30c3b scsi: ibmvscsi: Fix empty event pool access during host removal
   04809b226e79 scsi: ibmvscsi: Protect ibmvscsi_head from concurrent modificaiton
   b8ea151a7ab5 powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038
   9d91069f48cc MIPS: Fix kernel crash for R6 in jump label branch function
   6e74961bd67d MIPS: Ensure ELF appended dtb is relocated
   56bcf3df2552 mips: loongson64: lemote-2f: Add IRQF_NO_SUSPEND to "cascade" irqaction.
   c72e90d94a14 udf: Fix crash on IO error during truncate
   9cae232a8706 libceph: wait for latest osdmap in ceph_monc_blacklist_add()
   869157135003 iommu/amd: fix sg->dma_address for sg->offset bigger than PAGE_SIZE
   69e26237ed1e drm/vmwgfx: Return 0 when gmrid::get_node runs out of ID's
   ab483d1ca7ae drm/vmwgfx: Don't double-free the mode stored in par->set_mode
   42f358b2d48c mmc: renesas_sdhi: limit block count to 16 bit for old revisions
   65a5c93687b7 mmc: mxcmmc: "Revert mmc: mxcmmc: handle highmem pages"
   3b6870159e2e mmc: pxamci: fix enum type confusion
   6339cc5181c0 ALSA: firewire-motu: use 'version' field of unit directory to identify model
   023a1b28cf72 ALSA: hda - add Lenovo IdeaCentre B550 to the power_save_blacklist
   a2cddfe2ce6e Linux 4.19.31
   3053cb9701cd s390/setup: fix boot crash for machine without EDAT-1
   e578f90d8a9c bcache: use (REQ_META|REQ_PRIO) to indicate bio for metadata
   5ffb710b03d5 KVM: nVMX: Ignore limit checks on VMX instructions using flat segments
   29b515c27c0a KVM: nVMX: Apply addr size mask to effective address for VMX instructions
   9ce0ffeb68b6 KVM: nVMX: Sign extend displacements of VMX instr's mem operands
   c235af5a10f2 KVM: x86/mmu: Do not cache MMIO accesses while memslots are in flux
   656e9e5d5529 KVM: x86/mmu: Detect MMIO generation wrap in any address space
   23ad135ae66f KVM: Call kvm_arch_memslots_updated() before updating memslots
   585715ef18bf drm/amd/display: don't call dm_pp_ function from an fpu block
   17982c6a649b drm/amd/powerplay: correct power reading on fiji
   808b1c1e28e8 drm/radeon/evergreen_cs: fix missing break in switch statement
   9bc6e5673949 drm/fb-helper: generic: Fix drm_fbdev_client_restore()
   87bfc7b695bd media: imx: csi: Stop upstream before disabling IDMA channel
   54b941202391 media: imx: csi: Disable CSI immediately after last EOF
   73236bf581e9 media: vimc: Add vimc-streamer for stream control
   29e8c9ae99c7 media: uvcvideo: Avoid NULL pointer dereference at the end of streaming
   77b4e7454bbd media: lgdt330x: fix lock status reporting
   6039128dc6bf media: imx: prpencvf: Stop upstream before disabling IDMA channel
   e97a32a5a3bc rcu: Do RCU GP kthread self-wakeup from softirq and interrupt
   bce45a547546 tpm: Unify the send callback behaviour
   af0c1bd0c5e9 tpm/tpm_crb: Avoid unaligned reads in crb_recv()
   cc3b79d487e8 md: Fix failed allocation of md_register_thread
   01088750f25e perf intel-pt: Fix divide by zero when TSC is not available
   30cedf18d1e2 perf/x86/intel/uncore: Fix client IMC events return huge result
   a46a8cdfea3c perf intel-pt: Fix overlap calculation for padding
   fa592fc0bde5 perf auxtrace: Define auxtrace record alignment
   d8f691f29d91 perf tools: Fix split_kallsyms_for_kcore() for trampoline symbols
   e25353a0ac44 perf intel-pt: Fix CYC timestamp calculation after OVF
   3e5a054b0f70 x86/unwind/orc: Fix ORC unwind table alignment
   b05581b8ba9c vt: perform safe console erase in the right order
   2ca85aac1213 stable-kernel-rules.rst: add link to networking patch queue
   622afe5c7449 bcache: never writeback a discard operation
   cd73824636cb PM / wakeup: Rework wakeup source timer cancellation
   43bceddcd7e2 svcrpc: fix UDP on servers with lots of threads
   4af185feb9df NFSv4.1: Reinitialise sequence results before retransmitting a request
   ecab6ab1c227 nfsd: fix wrong check in write_v4_end_grace()
   8056912c1c75 nfsd: fix memory corruption caused by readdir
   10a68cdf1035 nfsd: fix performance-limiting session calculation
   2c648caf630d NFS: Don't recoalesce on error in nfs_pageio_complete_mirror()
   63b0ee126f7e NFS: Fix an I/O request leakage in nfs_do_recoalesce
   be74fddc976e NFS: Fix I/O request leakages
   4ea4f347662c cpcap-charger: generate events for userspace
   ce02d82c4e1a mfd: sm501: Fix potential NULL pointer dereference
   5579d97e92f7 dm integrity: limit the rate of error messages
   7668d6e45f3a dm: fix to_sector() for 32bit
   a441fdaf8c30 ipmi_si: fix use-after-free of resource->name
   3cbae9fa85ce arm64: KVM: Fix architecturally invalid reset value for FPEXC32_EL2
   c113a7fb017b arm64: debug: Ensure debug handlers check triggering exception level
   85c8ea220f89 arm64: Fix HCR.TGE status for NMI contexts
   58691e6a93d8 ARM: s3c24xx: Fix boolean expressions in osiris_dvs_notify
   d6d004b3dd70 powerpc/traps: Fix the message printed when stack overflows
   461a52a44893 powerpc/traps: fix recoverability of machine check handling on book3s/32
   baed68a953ac powerpc/hugetlb: Don't do runtime allocation of 16G pages in LPAR configuration
   9d2e929c3bae powerpc/ptrace: Simplify vr_get/set() to avoid GCC warning
   344996a835d4 powerpc: Fix 32-bit KVM-PR lockup and host crash with MacOS guest
   3bf8ff7bc667 powerpc/powernv: Don't reprogram SLW image on every KVM guest entry/exit
   f6f03d6078b1 powerpc/83xx: Also save/restore SPRG4-7 during suspend
   b0934990125a powerpc/powernv: Make opal log only readable by root
   9b5305504709 powerpc/wii: properly disable use of BATs when requested.
   40b97853c200 powerpc/32: Clear on-stack exception marker upon exception return
   c7dad095f35a security/selinux: fix SECURITY_LSM_NATIVE_LABELS on reused superblock
   e4f6f82c9edc selinux: add the missing walk_size + len check in selinux_sctp_bind_connect
   584f390d1039 jbd2: fix compile warning when using JBUFFER_TRACE
   dbe4bc993836 jbd2: clear dirty flag when revoking a buffer from an older transaction
   3545324fba52 serial: 8250_pci: Have ACCES cards that use the four port Pericom PI7C9X7954 chip use the pci_pericom_setup()
   8225bb965f29 serial: 8250_pci: Fix number of ports for ACCES serial cards
   9d0b55bb2aec serial: 8250_of: assume reg-shift of 2 for mrvl,mmp-uart
   a4b021ec4b5a serial: uartps: Fix stuck ISR if RX disabled with non-empty FIFO
   9920eb4003c5 bpf: only test gso type on gso packets
   206fa92c9d52 drm/i915: Relax mmap VMA check
   116a9e31237c can: flexcan: FLEXCAN_IFLAG_MB: add () around macro argument
   6f29e4c2dbb1 gpio: pca953x: Fix dereference of irq data in shutdown
   e86a57ecdfac media: i2c: ov5640: Fix post-reset delay
   5f9614d0540b i2c: tegra: fix maximum transfer size
   25970b517db1 parport_pc: fix find_superio io compare code, should use equal test.
   57c29a08c4cf intel_th: Don't reference unassigned outputs
   c835b4417c18 device property: Fix the length used in PROPERTY_ENTRY_STRING()
   93c8a44a8297 kernel/sysctl.c: add missing range check in do_proc_dointvec_minmax_conv
   09417dd35e37 mm/memory.c: do_fault: avoid usage of stale vm_area_struct
   c1ddc7b785b4 mm/vmalloc: fix size check for remap_vmalloc_range_partial()
   234c0cc98221 mm: hwpoison: fix thp split handing in soft_offline_in_use_page()
   c7fd1a968c5d dmaengine: usb-dmac: Make DMAC system sleep callbacks explicit
   822e21853439 usb: typec: tps6598x: handle block writes separately with plain-I2C adapters
   8415e718a06b usb: chipidea: tegra: Fix missed ci_hdrc_remove_device()
   b1c1ef7b4d63 clk: ingenic: Fix doc of ingenic_cgu_div_info
   4a04611fc266 clk: ingenic: Fix round_rate misbehaving with non-integer dividers
   33e7604ac8fd clk: samsung: exynos5: Fix kfree() of const memory on setting driver_override
   4d1de1e6d266 clk: samsung: exynos5: Fix possible NULL pointer exception on platform_device_alloc() failure
   9aba7a8fd163 clk: clk-twl6040: Fix imprecise external abort for pdmclk
   6e02a5f5aba3 clk: uniphier: Fix update register for CPU-gear
   62600af3a7cb ext2: Fix underflow in ext2_max_size()
   c335b49379b5 cxl: Wrap iterations over afu slices inside 'afu_list_lock'
   54674984d478 IB/hfi1: Close race condition on user context disable and close
   09bc2f5a16a9 PCI: dwc: skip MSI init if MSIs have been explicitly disabled
   13a9d14fbf1b PCI/DPC: Fix print AER status in DPC event handling
   c733cf4abfba PCI/ASPM: Use LTR if already enabled by platform
   8a4fdc649ca9 ext4: fix crash during online resizing
   a0d876c77705 ext4: add mask of ext4 flags to swap
   048bfb5bc05f ext4: update quota information while swapping boot loader inode
   071f68163cc0 ext4: cleanup pagecache before swap i_data
   cdf9941b7707 ext4: fix check of inode in swap_inode_boot_loader
   ae228aca576d cpufreq: pxa2xx: remove incorrect __init annotation
   f65b34d0f979 cpufreq: tegra124: add missing of_node_put()
   33565a76a7b2 cpufreq: kryo: Release OPP tables on module removal
   ee7d297fba24 x86/kprobes: Prohibit probing on optprobe template code
   a477075ebab3 irqchip/brcmstb-l2: Use _irqsave locking variants in non-interrupt code
   c8666ede18ec irqchip/gic-v3-its: Avoid parsing _indirect_ twice for Device table
   b92fad6995c3 libertas_tf: don't set URB_ZERO_PACKET on IN USB transfer
   02c55be588b1 soc: qcom: rpmh: Avoid accessing freed memory from batch API
   898488e2988c Btrfs: fix corruption reading shared and compressed extents after hole punching
   1a00f7fd0fbf btrfs: ensure that a DUP or RAID1 block group has exactly two stripes
   6e24f5a1ebb1 Btrfs: setup a nofs context for memory allocation at __btrfs_set_acl
   61f9209676e8 Btrfs: setup a nofs context for memory allocation at btrfs_create_tree()
   fcbf12e23d99 m68k: Add -ffreestanding to CFLAGS
   205f149f1a35 ovl: Do not lose security.capability xattr over metadata file copy-up
   6f048ae2d25f ovl: During copy up, first copy up data and then xattrs
   2af926fd52fc splice: don't merge into linked buffers
   1c2123ff4312 fs/devpts: always delete dcache dentry-s in dput()
   d8ae662b400f scsi: qla2xxx: Fix LUN discovery if loop id is not assigned yet by firmware
   f4a9fd5652d5 scsi: target/iscsi: Avoid iscsit_release_commands_from_conn() deadlock
   852a4ab292bb scsi: sd: Optimal I/O size should be a multiple of physical block size
   e6e738e2b5ff scsi: aacraid: Fix performance issue on logical drives
   bd8a0e656935 scsi: virtio_scsi: don't send sc payload with tmfs
   1653307cf0e7 s390/virtio: handle find on invalid queue gracefully
   b52bdf53130a s390/setup: fix early warning messages
   e19ca3fe6cf2 clocksource/drivers/arch_timer: Workaround for Allwinner A64 timer instability
   ef8062e20614 clocksource/drivers/exynos_mct: Clear timer interrupt when shutdown
   c1f45c10df2e clocksource/drivers/exynos_mct: Move one-shot check from tick clear to ISR
   06607b1b6cc9 regulator: s2mpa01: Fix step values for some LDOs
   c288e34df128 regulator: max77620: Initialize values for DT properties
   462aee48a8a2 regulator: s2mps11: Fix steps for buck7, buck8 and LDO35
   15ead7e2a11e spi: pxa2xx: Setup maximum supported DMA transfer length
   e51c5ec99597 spi: ti-qspi: Fix mmap read when more than one CS in use
   0d98ecb141a6 netfilter: ipt_CLUSTERIP: fix warning unused variable cn
   6bd9959aa110 mmc:fix a bug when max_discard is 0
   2946910ed837 mmc: sdhci-esdhc-imx: fix HS400 timing issue
   c19b9673487e ACPI / device_sysfs: Avoid OF modalias creation for removed device
   468ff43f6274 xen: fix dom0 boot on huge systems
   24d5097655eb tracing/perf: Use strndup_user() instead of buggy open-coded version
   f27077e5f5c5 tracing: Do not free iter->trace in fail path of tracing_open_pipe()
   ebca08d7e862 tracing: Use strncpy instead of memcpy for string keys in hist triggers
   43eaa6cc1775 CIFS: Fix read after write for files with read caching
   dc8e8ad962a8 CIFS: Do not skip SMB2 message IDs on send failures
   3ed9f22e28dd CIFS: Do not reset lease state to NONE on lease break
   41e2d1c43c87 crypto: arm64/aes-ccm - fix bugs in non-NEON fallback routine
   d5a5bded80a6 crypto: arm64/aes-ccm - fix logical bug in AAD MAC handling
   66700c89f0ab crypto: x86/morus - fix handling chunked inputs and MAY_SLEEP
   8a9fcf4a9f1f crypto: x86/aesni-gcm - fix crash on empty plaintext
   5d2a5172caa4 crypto: x86/aegis - fix handling chunked inputs and MAY_SLEEP
   574c19d97e6b crypto: testmgr - skip crc32c context test for ahash algorithms
   e6c703f15872 crypto: skcipher - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   bb1ae0aadbf1 crypto: pcbc - remove bogus memcpy()s with src == dest
   c0bfdac6a471 crypto: morus - fix handling chunked inputs
   dc410d2d8405 crypto: hash - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   76f21678d64f crypto: arm64/crct10dif - revert to C code for short inputs
   4bca5a9a5dcd crypto: arm64/aes-neonbs - fix returning final keystream block
   0beb34b865e3 crypto: arm/crct10dif - revert to C code for short inputs
   4c152af938ce crypto: aegis - fix handling chunked inputs
   736807d69157 crypto: aead - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   7a8b048430c1 fix cgroup_do_mount() handling of failure exits
   3b8da135a4cc libnvdimm: Fix altmap reservation size calculation
   696c37524beb libnvdimm/pmem: Honor force_raw for legacy pmem regions
   6a89ed7aa140 libnvdimm, pfn: Fix over-trim in trim_pfn_device()
   2b88d92ea9d2 libnvdimm/label: Clear 'updating' flag after label-set update
   f4dfb94a0754 nfit/ars: Attempt short-ARS even in the no_init_ars case
   e6defe76600b nfit/ars: Attempt a short-ARS whenever the ARS state is idle at boot
   f5878c4f084d acpi/nfit: Fix bus command validation
   8df25eb903c5 nfit: acpi_nfit_ctl(): Check out_obj->type in the right place
   eabd7d248e21 stm class: Prevent division by zero
   b3139fbb3b00 tmpfs: fix uninitialized return value in shmem_link
   d3f62d3eab0b selftests: fib_tests: sleep after changing carrier. again.
   8cd89bf632b2 net: set static variable an initial value in atl2_probe()
   29e4bfbc79b4 bnxt_en: Wait longer for the firmware message response to complete.
   b4baeab7e084 bnxt_en: Fix typo in firmware message timeout logic.
   a40fa9498707 nfp: bpf: fix ALU32 high bits clearance bug
   7ca1faa52be7 nfp: bpf: fix code-gen bug on BPF_ALU | BPF_XOR | BPF_K
   4523507c52b8 net: thunderx: add nicvf_send_msg_to_pf result check for set_rx_mode_task
   17bc53e73d0c net: thunderx: make CFG_DONE message to run through generic send-ack sequence
   02f8211b75c9 bpf, lpm: fix lookup bug in map_delete_elem
   c5f37906ecb7 mac80211_hwsim: propagate genlmsg_reply return code
   ee01ac61d1d4 phonet: fix building with clang
   8b9187e7df64 ARCv2: don't assume core 0x54 has dual issue
   3220aa9b0065 ARCv2: support manual regfile save on interrupts
   74b4dcea6756 ARC: uacces: remove lp_start, lp_end from clobber list
   2fc69e55f370 ARCv2: lib: memcpy: fix doing prefetchw outside of buffer
   2c049f195787 ixgbe: fix older devices that do not support IXGBE_MRQC_L3L4TXSWEN
   064a61d3e7b5 tmpfs: fix link accounting when a tmpfile is linked in
   e6e9d6e29002 mm: handle lru_add_drain_all for UP properly
   f3a9c9be0eb4 net: marvell: mvneta: fix DMA debug warning
   e52578889c8e ARM: tegra: Restore DT ABI on Tegra124 Chromebooks
   f715466a3f23 arm64: Relax GIC version check during early boot
   2f97f7125237 ARM: dts: armada-xp: fix Armada XP boards NAND description
   e4d14f616050 qed: Fix iWARP syn packet mac address validation.
   821c67748623 qed: Fix iWARP buffer size provided for syn packet processing.
   90fc2f95c418 ASoC: topology: free created components in tplg load error
   edd7b6b9be97 mailbox: bcm-flexrm-mailbox: Fix FlexRM ring flush timeout issue
   6ac400b7c5e8 xfrm: Fix inbound traffic via XFRM interfaces across network namespaces
   3a5321342361 net: mv643xx_eth: disable clk on error path in mv643xx_eth_shared_probe()
   a139d6a318de qmi_wwan: apply SET_DTR quirk to Sierra WP7607
   13cb60c3c915 pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins
   90a86d00af1a net: dsa: bcm_sf2: Do not assume DSA master supports WoL
   d33f5a0febfa net: systemport: Fix reception of BPDUs
   3491857f4292 scsi: libiscsi: Fix race between iscsi_xmit_task and iscsi_complete_task
   726832821903 keys: Fix dependency loop between construction record and auth key
   fac71ac37634 assoc_array: Fix shortcut creation
   84657a1ba9bd ARM: 8835/1: dma-mapping: Clear DMA ops on teardown
   978e0388c22b af_key: unconditionally clone on broadcast
   c7c68a1b9a16 bpf: fix lockdep false positive in stackmap
   413e39852082 bpf: only adjust gso_size on bytestream protocols
   da3495301cda ARM: 8824/1: fix a migrating irq bug when hotplug cpu
   b92eaed36c4b esp: Skip TX bytes accounting when sending from a request socket
   2f3b4f968619 clk: sunxi: A31: Fix wrong AHB gate number
   cacf3c0d8288 kallsyms: Handle too long symbols in kallsyms.c
   980f44f8dd8a clk: sunxi-ng: v3s: Fix TCON reset de-assert bit
   5050f03ff0b1 Input: st-keyscan - fix potential zalloc NULL dereference
   bf26feccf99c auxdisplay: ht16k33: fix potential user-after-free on module unload
   8e770d996ea4 i2c: bcm2835: Clear current buffer pointers and counts after a transfer
   d9ce9aea3f63 i2c: cadence: Fix the hold bit setting
   8f622a7d512c net: hns: Fix object reference leaks in hns_dsaf_roce_reset()
   33e83ea302c0 mm: page_alloc: fix ref bias in page_frag_alloc() for 1-byte allocs
   a9503ade1bf7 x86/CPU: Add Icelake model number
   388f3adb2729 net: dsa: bcm_sf2: potential array overflow in bcm_sf2_sw_suspend()
   8ab49fd5b072 scsi: qla2xxx: Fix panic from use after free in qla2x00_async_tm_cmd
   53dcaeeff145 Revert "mm: use early_pfn_to_nid in page_ext_init"
   8b1a7762e0da mm/gup: fix gup_pmd_range() for dax
   6c023d86b364 NFS: Don't use page_file_mapping after removing the page
   d84bc704b91e xprtrdma: Make sure Send CQ is allocated on an existing compvec
   e01f2b0821ea floppy: check_events callback should not return a negative number
   5ca2ef674d74 ipvs: fix dependency on nf_defrag_ipv6
   29452f665c2f blk-mq: insert rq with DONTPREP to hctx dispatch list when requeue
   e0e6b0d7e09c netfilter: compat: initialize all fields in xt_init
   a5a244451145 mac80211: Fix Tx aggregation session tear down with ITXQs
   bff33ba4f9ca mac80211: call drv_ibss_join() on restart
   134891e124da Input: matrix_keypad - use flush_delayed_work()
   e91dc2092f7f Input: ps2-gpio - flush TX work when closing port
   4fe714b750cb Input: cap11xx - switch to using set_brightness_blocking()
   f49f7007de59 ARM: OMAP2+: fix lack of timer interrupts on CPU1 after hotplug
   8f07d76481d5 ASoC: samsung: Prevent clk_get_rate() calls in atomic context
   459058f0e329 KVM: arm64: Forbid kprobing of the VHE world-switch code
   04131dfcb910 KVM: arm/arm64: vgic: Always initialize the group of private IRQs
   c831293622b2 arm/arm64: KVM: Don't panic on failure to properly reset system registers
   b78379c33723 arm/arm64: KVM: Allow a VCPU to fully reset itself
   dfe9b4d992ca KVM: arm/arm64: Reset the VCPU without preemption and vcpu state loaded
   20604435e2f4 ASoC: rsnd: fixup rsnd_ssi_master_clk_start() user count check
   e07aaaa7013e ASoC: dapm: fix out-of-bounds accesses to DAPM lookup tables
   f3f7a8b6faf8 ARM: OMAP2+: Variable "reg" in function omap4_dsi_mux_pads() could be uninitialized
   ad4507bd2bf1 ARM: dts: Configure clock parent for pwm vibra
   bac70a89419a Input: pwm-vibra - stop regulator after disabling pwm, not before
   0ed72d3f6f1d Input: pwm-vibra - prevent unbalanced regulator
   98a137cd0484 s390/dasd: fix using offset into zero size array error
   cdaf89ab8f77 arm64: dts: rockchip: fix graph_port warning on rk3399 bob kevin and excavator
   5f4a64b040c9 KVM: arm/arm64: vgic: Make vgic_dist->lpi_list_lock a raw_spinlock
   ac696b0176b4 clocksource: timer-ti-dm: Fix pwm dmtimer usage of fck reparenting
   b2c642a1a618 ASoC: rt5682: Correct the setting while select ASRC clk for AD/DA filter
   35ad2e6d7e46 gpu: ipu-v3: Fix CSI offsets for imx53
   04c5c4c47c31 drm/imx: imx-ldb: add missing of_node_puts
   1640b5288615 gpu: ipu-v3: Fix i.MX51 CSI control registers offset
   a308622febe1 drm/imx: ignore plane updates on disabled crtcs
   2e0e1f9a1e41 crypto: rockchip - update new iv to device in multiple operations
   5aabf06712c2 crypto: rockchip - fix scatterlist nents error
   3c5d7703bbd0 crypto: ahash - fix another early termination in hash walk
   1a10e6b5bb34 crypto: cfb - remove bogus memcpy() with src == dest
   0b1871d041d3 crypto: cfb - add missing 'chunksize' property
   6ed42ccca59d crypto: ccree - don't copy zero size ciphertext
   0bdd345a3848 crypto: ccree - unmap buffer before copying IV
   009eeb9878b4 crypto: ccree - fix free of unallocated mlli buffer
   6f4c11b09770 crypto: caam - fix DMA mapping of stack memory
   74fd74e1fc8d crypto: caam - fixed handling of sg list
   ce36d9fafb43 crypto: ccree - fix missing break in switch statement
   32eeecf7ac87 crypto: caam - fix hash context DMA unmap size
   dd6ce0316e70 stm class: Fix an endless loop in channel allocation
   a253d1f3e490 mei: bus: move hw module get/put to probe/release
   02c0c70fb36e mei: hbm: clean the feature flags on link reset
   dbcb0a590ecb iio: adc: exynos-adc: Fix NULL pointer exception on unbind
   3f44122e065c ASoC: codecs: pcm186x: Fix energysense SLEEP bit
   7d9e07582a7f ASoC: codecs: pcm186x: fix wrong usage of DECLARE_TLV_DB_SCALE()
   098e0f89a341 ASoC: fsl_esai: fix register setting issue in RIGHT_J mode
   85bdc9daff40 9p/net: fix memory leak in p9_client_create
   e08ba890dc29 9p: use inode->i_lock to protect i_size_write() under 32-bit
   573d423a9bd7 media: videobuf2-v4l2: drop WARN_ON in vb2_warn_zero_bytesused()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 7a0b723..cdba9d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eac4b8fe170fc8745377cb37c5433db69356d6d8"
-SRCREV_meta ?= "55b740965496961a660674aa4e5b8568b1b9fb7e"
+SRCREV_machine ?= "b0ea9ef736c8ab8695bdfba61cd121ce5aa47e49"
+SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.30"
+LINUX_VERSION ?= "4.19.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 84a02af..dea7f2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.30"
+LINUX_VERSION ?= "4.19.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "03eb6106990498e86298646c682fce9fc61f2131"
-SRCREV_machine ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_meta ?= "55b740965496961a660674aa4e5b8568b1b9fb7e"
+SRCREV_machine_qemuarm ?= "6fbb768bd43d85b2cfd905e431101e214c580634"
+SRCREV_machine ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
+SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index f83a6d6..de4ae92 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3df49db2ea9b8e800cb30d5d695d4d2a2f8c1bed"
-SRCREV_machine_qemuarm64 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_machine_qemumips ?= "5dc975d0e586edd5d33bce62560f998f9a246be6"
-SRCREV_machine_qemuppc ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_machine_qemux86 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_machine_qemux86-64 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_machine_qemumips64 ?= "bb7ae8a8cbe76c9ce2804f651936f059f9f621a2"
-SRCREV_machine ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_meta ?= "55b740965496961a660674aa4e5b8568b1b9fb7e"
+SRCREV_machine_qemuarm ?= "b266576aa10e76afeded8e13ffce93c4638b8ddb"
+SRCREV_machine_qemuarm64 ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
+SRCREV_machine_qemumips ?= "f6ef1a5233db0a1f569d7d6638fa803ebe5c867b"
+SRCREV_machine_qemuppc ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
+SRCREV_machine_qemux86 ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
+SRCREV_machine_qemux86-64 ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
+SRCREV_machine_qemumips64 ?= "f5b26e4d7a0eee36298d970590c50c26a800b84d"
+SRCREV_machine ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
+SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.30"
+LINUX_VERSION ?= "4.19.34"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


