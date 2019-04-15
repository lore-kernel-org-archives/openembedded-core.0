Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 68F897D8DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:19:11 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id y204so24747383itf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5np31z5Jhi/X7WAEolVMSHA7qWiXZ/+BZwtPFlgDngE=;
	b=spIMmkMkx1dFsdMEH777Y/SewgIgK6SVMss/3fsiF6OPGakl08aeGW+U8VZPcXOYus
	hNHS4K/DdzSY2jS8HnTywiEZVqys/WIXihR9QaqIQEXUPzzGGUBEgTmV0+qNHweGEeD8
	M485Yji8vIIQVBuIyZyTwziEiGTCnFlQTWHSaC+TPCBWcznC6UKQB/Z5Lh+NtYYzQ0GS
	vNDQ+RPv7DVfgnPiNz7i5XJW2Tbixv70EFXU+Ajva/5BchpTWcua/c3z0lcC0VRpYU4S
	c5o8CsGgteBd7cI/CuMgyHS+Ygi6Pp4S5DZVftfD7D54I5vn+c9ukIN2dvtCb0qLu3KC
	j6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5np31z5Jhi/X7WAEolVMSHA7qWiXZ/+BZwtPFlgDngE=;
	b=VQniXwiEG4l4GTZXYqrRVX7khrZrBUMT/EdI5cliuSPhH2LDyzUH4Sblco3i8bpQfr
	0wSsXCzmVeU49YV0XcxG6x1Dh2GHsGxSQcUPWsXEj5j4Jicuswoc+By4fqSaSZ0E0NOZ
	5gybyvYAdsfRf2QHZLaD/gbkbZCH1aTU9NlVH7bISnZHbf20kfGsGL1AOg1Yw2I8+E7W
	6rGafMvh+thhs1FljRsLA6vAu4LZxwuvQgaFTaffLzNlF1DDpPCuLNkRjQF9sWDt/CTY
	wRtM294hWYptEK0f2JpMl1N2jcAOvj71tynzOWDJ5JyfQAubBZErFRLevL/9u7BpetXk
	BwlA==
X-Gm-Message-State: APjAAAWbKyYpEu5oM7jQsoTQINzskksHKZ1md8eLtmICeewcvuGizUL/
	83vRE0ap8blw/m8J0r4DX4h7KwAr+dk=
X-Google-Smtp-Source: APXvYqxG1ZXad4/zRVqx4AxVmjBdGMspAlbGjhyFNOCGd0wNXVlvRpRMv2fBbfOAyfEGV7AsUCYQxQ==
X-Received: by 2002:a02:c644:: with SMTP id k4mr39452379jan.0.1555298351788;
	Sun, 14 Apr 2019 20:19:11 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	w184sm7490357ita.9.2019.04.14.20.19.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Apr 2019 20:19:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 14 Apr 2019 23:19:04 -0400
Message-Id: <61c8072c3216739d5267496a67b2b6269b847c35.1555298211.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1555298211.git.bruce.ashfield@gmail.com>
References: <cover.1555298211.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.0: update to v5.0.7
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
X-List-Received-Date: Mon, 15 Apr 2019 03:19:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable releases which comprise the following
commits:

   8b298d3a0bd5 Linux 5.0.7
   e73f145543fa kbuild: skip sub-make for in-tree build with GNU Make 4.x
   d972d1c0d76d kbuild: add workaround for Debian make-kpkg
   38d2286e52ea bcache: fix potential div-zero error of writeback_rate_p_term_inverse
   ae050638bc97 ACPI / video: Extend chassis-type detection with a "Lunch Box" check
   3e033b1b435a gpio: of: Restrict enable-gpio quirk to regulator-gpio
   ae42fc868cd5 appletalk: Fix compile regression
   a84b7c68966a net: stmmac: Avoid one more sometimes uninitialized Clang warning
   36b39631cc85 drm/dp/mst: Configure no_stop_bit correctly for remote i2c xfers
   8826838f43fe drm: Reorder set_property_atomic to avoid returning with an active ww_ctx
   0a2e1a5b583b ASoC: simple-card-utils: check "reg" property on asoc_simple_card_get_dai_id()
   45040e92500c Input: soc_button_array - fix mapping of the 5th GPIO in a PNP0C40 device
   1ad62489b25a staging: iio: adt7316: fix dac_bits assignment
   2bece1d313aa dmaengine: tegra: avoid overflow of byte tracking
   e84e0a8c3f22 clk: rockchip: fix frac settings of GPLL clock for rk3328
   25fb6c323b55 ARM: shmobile: Fix R-Car Gen2 regulator quirk
   9b0f430450cf clk: meson: clean-up clock registration
   a644d2d28baf drm/fb-helper: fix leaks in error path of drm_fb_helper_fbdev_setup
   c8a8dd1d85ca x86/build: Mark per-CPU symbols as absolute explicitly for LLD
   38af5462fa51 wlcore: Fix memory leak in case wl12xx_fetch_firmware failure
   ab79dc3ef024 brcmfmac: Use firmware_request_nowarn for the clm_blob
   f836093a2eeb selinux: do not override context on context mounts
   993f96415a72 x86/build: Specify elf_i386 linker emulation explicitly for i386 objects
   16d4d75d8b6e drm/nouveau: Stop using drm_crtc_force_disable
   bfb59eabe2c9 drm: Auto-set allow_fb_modifiers when given modifiers at plane init
   778c82db727a pinctrl: meson: meson8b: add the eth_rxd2 and eth_rxd3 pins
   1048bfd8bf67 regulator: act8865: Fix act8600_sudcdc_voltage_ranges setting
   e78d5e16f1d6 audit: hand taken context to audit_kill_trees for syscall logging
   a43ea8ca1865 PCI: pciehp: Assign ctrl->slot_ctrl before writing it to hardware
   e5d1f1c0148d media: s5p-jpeg: Check for fmt_ver_flag when doing fmt enumeration
   68ec6a13ef0d media: rcar-vin: Allow independent VIN link enablement
   ebd0f3066c35 netfilter: physdev: relax br_netfilter dependency
   d7e6e93b95f2 dmaengine: qcom_hidma: initialize tx flags in hidma_prep_dma_*
   1bac8b82d95c dmaengine: qcom_hidma: assign channel cookie correctly
   56d276b53614 dmaengine: imx-dma: fix warning comparison of distinct pointer types
   964065d234c7 cpu/hotplug: Mute hotplug lockdep during init
   8376acca6f18 pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
   e848354f28b7 pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
   9d7ff2ae8fd6 pinctrl: meson: fix G12A ao pull registers base address
   e17a340f9598 hpet: Fix missing '=' character in the __setup() code of hpet_mmap_enable
   283a29de66c3 f2fs: fix to initialize variable to avoid UBSAN/smatch warning
   3d1a731bcec7 f2fs: UBSAN: set boolean value iostat_enable correctly
   d9f59ff251b4 HID: intel-ish: ipc: handle PIMR before ish_wakeup also clear PISR busy_clear bit
   931480457bb3 selftests/bpf: suppress readelf stderr when probing for BTF support
   e01bc8baa867 soc/tegra: fuse: Fix illegal free of IO base address
   bf381e06af42 hwrng: virtio - Avoid repeated init of completion
   64ef5941a6f8 media: mt9m111: set initial frame size other than 0x0
   9acd16abab23 perf script python: Add trace_context extension module to sys.modules
   8febc5d31032 perf script python: Use PyBytes for attr in trace-event-python
   8f4264f58eb8 perf trace: Fixup etcsnoop example
   631e6859c9ac platform/x86: intel-hid: Missing power button release on some Dell models
   3ea0a48aa080 usb: dwc3: gadget: Fix OTG events when gadget driver isn't loaded
   bce56838a25d regulator: mcp16502: Include linux/gpio/consumer.h to fix build error
   f8d78138dd55 ALSA: dice: add support for Solid State Logic Duende Classic/Mini
   504dfdea9c39 drm/amd/display: Enable vblank interrupt during CRC capture
   b32cff3dd086 powerpc/pseries: Perform full re-add of CPU for topology update post-migration
   9ee0088f920b tty: increase the default flip buffer limit to 2*640K
   d9c61474aa77 backlight: pwm_bl: Use gpiod_get_value_cansleep() to get initial state
   b8498a26ffdb cgroup/pids: turn cgroup_subsys->free() into cgroup_subsys->release() to fix the accounting
   07232db69580 powerpc/64s: Clear on-stack exception marker upon exception return
   cf651d7007c1 selftests/bpf: skip verifier tests for unsupported program types
   08619450dbfe bpf: fix missing prototype warnings
   8b3b22aa7c55 block, bfq: fix queue removal from weights tree
   c581587af717 block, bfq: fix in-service-queue check for queue merging
   721360c972a3 ARM: avoid Cortex-A9 livelock on tight dmb loops
   34164dfc56a4 ARM: 8830/1: NOMMU: Toggle only bits in EXC_RETURN we are really care of
   f7a2659378e7 mt7601u: bump supported EEPROM version
   a1fc32156354 drm/msm/dpu: Convert to a chained irq chip
   e0442dc492e5 soc: qcom: gsbi: Fix error handling in gsbi_probe()
   65ae5c0808c7 efi/arm/arm64: Allow SetVirtualAddressMap() to be omitted
   6416e05b8190 ARM: dts: lpc32xx: Remove leading 0x and 0s from bindings notation
   897a3b9ef31d drm/vkms: Bugfix extra vblank frame
   1c76c3cf3060 drm/vkms: Bugfix racing hrtimer vblank handle
   5ca05ecd2954 sched/core: Use READ_ONCE()/WRITE_ONCE() in move_queued_task()/task_rq_lock()
   4e634952fe74 efi/memattr: Don't bail on zero VA if it equals the region's PA
   dd288d329d17 sched/debug: Initialize sd_sysctl_cpus if !CONFIG_CPUMASK_OFFSTACK
   0da521452109 ASoC: fsl-asoc-card: fix object reference leaks in fsl_asoc_card_probe
   8a838b44f70f iwlwifi: mvm: fix RFH config command with >=10 CPUs
   9bd4debdd544 staging: spi: mt7621: Add return code check on device_reset()
   3aa0518aacaa i2c: of: Try to find an I2C adapter matching the parent
   c1ac30ee10cf platform/x86: intel_pmc_core: Fix PCH IP sts reading
   b503ea08fe0d e1000e: Exclude device from suspend direct complete optimization
   7f0a3a436e88 e1000e: fix cyclic resets at link up with active tx
   4e4fba6d30f8 perf/aux: Make perf_event accessible to setup_aux()
   81ee4eab3117 drm/amd/display: Disconnect mpcc when changing tg
   c730d6c156c6 powerpc/ptrace: Mitigate potential Spectre v1
   8e74000fd656 x86/kexec: Fill in acpi_rsdp_addr from the first kernel
   90c93fbede11 bpf: test_maps: fix possible out of bound access warning
   c60bf6e7594c drm/amd/display: Don't re-program planes for DPMS changes
   ada81ebc5f35 drm: rcar-du: add missing of_node_put
   7208136a41f9 cdrom: Fix race condition in cdrom_sysctl_register
   e00ff3abfaaf fbdev: fbmem: fix memory access if logo is bigger than the screen
   8e48664da19f net: phy: consider latched link-down status in polling mode
   c230484a3767 iw_cxgb4: fix srqidx leak during connection abort
   3e45ebf5a16c net: marvell: mvpp2: fix stuck in-band SGMII negotiation
   c0ed04868506 genirq: Avoid summation loops for /proc/stat
   c984b1e68b0c bcache: improve sysfs_strtoul_clamp()
   5db086d7c05f bcache: fix potential div-zero error of writeback_rate_i_term_inverse
   d4db0c5ee0b4 bcache: fix input overflow to sequential_cutoff
   f48bb10d7615 bcache: fix input overflow to cache set sysfs file io_error_halflife
   83a6f919bbb7 sched/topology: Fix percpu data types in struct sd_data & struct s_data
   9738742e4e38 usb: f_fs: Avoid crash due to out-of-scope stack ptr access
   db5177729062 ath10k: fix shadow register implementation for WCN3990
   31f3d84c6d9f ALSA: PCM: check if ops are defined before suspending PCM
   6c896df369d1 ARM: dts: meson8b: fix the Ethernet data line signals in eth_rgmii_pins
   c716b08e06ca ARM: 8833/1: Ensure that NEON code always compiles with Clang
   f74b0a4bf14c netfilter: conntrack: fix cloned unconfirmed skb->_nfct race in __nf_conntrack_confirm
   c4ea4a79f8b2 kprobes: Prohibit probing on RCU debug routine
   170d42947604 kprobes: Prohibit probing on bsearch()
   34968a446c4e selftests: skip seccomp get_metadata test if not real root
   7981a5b4df77 selftests: ir: fix warning: "%s" directive output may be truncated ’ directive output may be truncated
   7b27cb19942e ACPI / video: Refactor and fix dmi_is_desktop()
   4f9f04ca4f83 iwlwifi: pcie: fix emergency path
   2392dcb54ad2 perf coresight: Do not test for libopencsd by default
   528033f554c8 perf report: Add s390 diagnosic sampling descriptor size
   59c09689808e perf trace: Check if the 'fd' is negative when mapping it to pathname
   8b4fdbce8ca4 perf beauty waitid options: Fix up prefix showing logic
   336eb093ba16 tools build: Add test-reallocarray.c to test-all.c to fix the build
   17e987679232 tools build: Add -lrt to FEATURE_CHECK_LDFLAGS-libaio
   1cbdd2401798 leds: lp55xx: fix null deref on firmware load failure
   34cbc429c56d jbd2: fix race when writing superblock
   9489ac42680c regulator: core: Take lock before applying system load
   7440c206c38f drm/sched: Fix entities with 0 rqs.
   aa6c9fcac011 efi: Fix build error due to enum collision between efi.h and ima.h
   55d7152d37dc cgroup, rstat: Don't flush subtree root unless necessary
   2fe8be270932 HID: intel-ish-hid: avoid binding wrong ishtp_cl_device
   e6eef5240054 vfs: fix preadv64v2 and pwritev64v2 compat syscalls with offset == -1
   a8254b01ca21 xen/gntdev: Do not destroy context while dma-bufs are in use
   d6318df6b0cc gpio: of: Apply regulator-gpio quirk only to enable-gpios
   7d361b8dbafe mt76: usb: do not run mt76u_queues_deinit twice
   af1ef012b95f media: rockchip/vpu: Correct return type for mem2mem buffer helpers
   d544b0856f3f media: mtk-jpeg: Correct return type for mem2mem buffer helpers
   569ce17b4cd9 media: mx2_emmaprp: Correct return type for mem2mem buffer helpers
   76499752191f media: s5p-g2d: Correct return type for mem2mem buffer helpers
   8852dab94f04 media: rockchip/rga: Correct return type for mem2mem buffer helpers
   9f31e32fd5a5 media: s5p-jpeg: Correct return type for mem2mem buffer helpers
   21ad47c39835 media: sh_veu: Correct return type for mem2mem buffer helpers
   a6d9661c5d16 media: ov7740: fix runtime pm initialization
   ed83655ce8c2 SoC: imx-sgtl5000: add missing put_device()
   a75ad663203b perf report: Don't shadow inlined symbol with different addr range
   c3a8705881cc mwifiex: don't advertise IBSS features without FW support
   aa8c73c8682f perf test: Fix failure of 'evsel-tp-sched' test on s390
   16a94480fb03 drm/amd/display: Clear stream->mode_changed after commit
   456736ab1b78 scsi: fcoe: make use of fip_mode enum complete
   952613125def scsi: megaraid_sas: return error when create DMA pool failed
   a3c1a668a014 s390/ism: ignore some errors during deregistration
   5d1db4825e3c efi: cper: Fix possible out-of-bounds access
   99bb2d19853a cpufreq: acpi-cpufreq: Report if CPU doesn't support boost technologies
   4e7b5f9dc7a7 ASoC: qcom: Fix of-node refcount unbalance in qcom_snd_parse_of()
   a332ad5f006f powerpc/44x: Force PCI on for CURRITUCK
   4974ca47f15c perf annotate: Fix getting source line failure
   1a4faefc4680 clk: fractional-divider: check parent rate only if flag is set
   869a72e08b86 IB/mlx4: Increase the timeout for CM cache
   55bbe8fa7bfd i2c: designware: Do not allow i2c_dw_xfer() calls while suspended
   600c30ca6124 loop: set GENHD_FL_NO_PART_SCAN after blkdev_reread_part()
   540f120998df platform/mellanox: mlxreg-hotplug: Fix KASAN warning
   a21f5c44cb8e platform/x86: ideapad-laptop: Fix no_hw_rfkill_list for Lenovo RESCUER R720-15IKBN
   e2427570b374 i2c: Allow recovery of the initial IRQ by an I2C client device.
   6f93033d93d1 mlxsw: spectrum: Avoid -Wformat-truncation warnings
   a782956c2a30 e1000e: Fix -Wformat-truncation warnings
   cae3c93ad96b veth: Fix -Wformat-truncation
   dd8ab7cdbcda net: hns3: fix setting of the hns reset_type for rdma hw errors
   660b8b783aed net: dsa: mv88e6xxx: Add lockdep classes to fix false positive splat
   f9cf94eca1be mmc: omap: fix the maximum timeout setting
   895927dc1c6a btrfs: don't enospc all tickets on flush failure
   8f6019b404c8 btrfs: qgroup: Make qgroup async transaction commit more aggressive
   9a27e9ef2338 perf script: Handle missing fields with -F +..
   565e4ecefeae ice: fix ice_remove_rule_internal vsi_list handling
   b3425e19f614 net: dsa: mv88e6xxx: Default CMODE to 1000BaseX only on 6390X
   13fe58e28c21 powerpc/hugetlb: Handle mmap_min_addr correctly in get_unmapped_area callback
   957b2d2317e9 iommu/io-pgtable-arm-v7s: Only kmemleak_ignore L2 tables
   af6366bb82e6 ARM: 8845/1: use unified assembler in c files
   dbda5b6625bd ARM: 8840/1: use a raw_spinlock_t in unwind
   8cada074059f serial: 8250_pxa: honor the port number from devicetree
   1e084b9e2037 coresight: etm4x: Add support to enable ETMv4.2
   8e28ed0b7b8d powerpc/xmon: Fix opcode being uninitialized in print_insn_powerpc
   5e91baea2c1f ath10k: don't report unset rssi values to mac80211
   33cb50fa0930 drm/amd/display: Fix reference counting for struct dc_sink.
   29b55af8a429 btrfs: save drop_progress if we drop refs at all
   e3e9d97396cd kbuild: make -r/-R effective in top Makefile for old Make versions
   366a5ee958d0 kbuild: invoke syncconfig if include/config/auto.conf.cmd is missing
   22efb9f2aeff scsi: core: replace GFP_ATOMIC with GFP_KERNEL in scsi_scan.c
   b17b4bd79afc powerpc/powernv/ioda: Fix locked_vm counting for memory used by IOMMU tables
   7fe45a018fb3 usb: chipidea: Grab the (legacy) USB PHY by phandle first
   a133f9f7f96a tools/bpf: selftests: add map lookup to test_map_in_map bpf prog
   547272b44afa crypto: cavium/zip - fix collision with generic cra_driver_name
   1ee9d34d6861 crypto: crypto4xx - add missing of_node_put after of_device_is_available
   2b52034346cd lockdep/lib/tests: Fix run_tests.sh
   a73713e53323 ath10k: Fix the wrong updation of BW in tx_stats debugfs entry
   e486c95f5d50 mt76: fix a leaked reference by adding a missing of_node_put
   96e2fec0fd8c wil6210: check null pointer in _wil_cfg80211_merge_extra_ies
   d8f775092499 PCI/PME: Fix hotplug/sysfs remove deadlock in pcie_pme_remove()
   88f0ced0d75f mm/resource: Return real error codes from walk failures
   6e33632946e4 tools lib traceevent: Fix buffer overflow in arg_eval
   a1d9d2145c50 fs: fix guard_bio_eod to check for real EOD errors
   dee200aba7dc ext4: fix bigalloc cluster freeing when hole punching under load
   1d62e75a00bb jbd2: fix invalid descriptor block checksum
   87f8ad583c79 iommu/vt-d: Disable ATS support on untrusted devices
   b39898beee9d netfilter: conntrack: tcp: only close if RST matches exact sequence
   8a0f1351bac1 PCI: mediatek: Fix memory mapped IO range size computation
   fdb08cf7dbee netfilter: nf_tables: check the result of dereferencing base_chain->stats
   dc8d8f83ea52 perf beauty msg_flags: Add missing %s lost when adding prefix suppression logic
   d6dd80425f5d cifs: Fix NULL pointer dereference of devname
   bcb99efab248 cifs: Accept validate negotiate if server return NT_STATUS_NOT_SUPPORTED
   88596e78dae4 f2fs: fix to check inline_xattr_size boundary correctly
   e3eea74f61a8 dm thin: add sanity checks to thin-pool and external snapshot creation
   f2e34b4ff47e cifs: use correct format characters
   64f336255228 kasan: fix kasan_check_read/write definitions
   326ce03840eb page_poison: play nicely with KASAN
   0326696a6769 fs/file.c: initialize init_files.resize_wait
   902507dada43 f2fs: fix to data block override node segment by mistake
   3667215198eb f2fs: do not use mutex lock in atomic context
   e92a6db09700 ocfs2: fix a panic problem caused by o2cb_ctl
   8783c35917b6 mm/slab.c: kmemleak no scan alien caches
   f67cd526ce1d mm/vmalloc.c: fix kernel BUG at mm/vmalloc.c:512!
   03bccbc025ed mm, mempolicy: fix uninit memory access
   c59c60824a9a memcg: killed threads should not invoke memcg OOM killer
   db5d8675b14a mm,oom: don't kill global init via memory.oom.group
   66a4d4d03b7e docs/core-api/mm: fix user memory accessors formatting
   34fa723765cf mm, swap: bounds check swap_info array accesses to avoid NULL derefs
   57f5b77e9f46 mm/page_ext.c: fix an imbalance with kmemleak
   93b7ebef7ee3 mm/cma.c: cma_declare_contiguous: correct err handling
   90a70109697c mm/sparse: fix a bad comparison
   60c86431ca4c perf c2c: Fix c2c report for empty numa node
   11304c4b4ee4 x86/hyperv: Fix kernel panic when kexec on HyperV
   34555ccacf94 iio: adc: fix warning in Qualcomm PM8xxx HK/XOADC driver
   86aad65625cf scsi: hisi_sas: Fix a timeout race of driver internal and SMP IO
   776de12b9f8f scsi: hisi_sas: Set PHY linkrate when disconnected
   c5021aa17b05 libbpf: force fixdep compilation at the start of the build
   267f65c94fb7 enic: fix build warning without CONFIG_CPUMASK_OFFSTACK
   aaad69802e17 net: stmmac: Avoid sometimes uninitialized Clang warnings
   4e4d49798d86 sysctl: handle overflow for file-max
   fd9317a3e2a0 include/linux/relay.h: fix percpu annotation in struct rchan
   c7c82cea6985 gpio: gpio-omap: fix level interrupt idling
   90833d08ffa5 clk: ti: clkctrl: Fix clkdm_name regression for TI_CLK_CLKCTRL_COMPAT
   b48475a66ef5 xsk: fix to reject invalid flags in xsk_bind
   3cac5ce088c2 net/mlx5: Avoid panic when setting vport mac, getting vport config
   a1126c2008a3 net/mlx5: Avoid panic when setting vport rate
   d1e83bda0c30 net/mlx5e: Fix access to non-existing receive queue
   043a440018e3 tracing: kdb: Fix ftdump to not sleep
   4c6df358aa87 apparmor: fix double free when unpack of secmark rules fails
   a98984da006b f2fs: fix to avoid deadlock in f2fs_read_inline_dir()
   8d661a663048 f2fs: fix to adapt small inline xattr space in __find_inline_xattr()
   e56d6fa7acf3 h8300: use cc-cross-prefix instead of hardcoding h8300-unknown-linux-
   1eaf6713c5b3 nvme-loop: init nvmet_ctrl fatal_err_work when allocate
   32b73dc525a1 nvme-fc: fix numa_node when dev is null
   fae38f280334 CIFS: fix POSIX lock leak and invalid ptr deref
   dc2b4d4ab0ae ext4: cleanup bh release code in ext4_ind_remove_space()
   820c1fa51501 Linux 5.0.6
   debaa517c16c mt76x02u: use usb_bulk_msg to upload firmware
   046098f056e2 bpf: do not restore dst_reg when cur_state is freed
   b54f0c4976e7 KVM: x86: update %rip after emulating IO
   cc3f680dd076 KVM: x86: Emulate MSR_IA32_ARCH_CAPABILITIES on AMD hosts
   d50d46e303d4 KVM: Reject device ioctls from processes other than the VM's creator
   8c0823aa123b x86/smp: Enforce CONFIG_HOTPLUG_CPU when SMP=y
   c3bcf0314665 cpu/hotplug: Prevent crash when CPU bringup fails on CONFIG_HOTPLUG_CPU=n
   53464ca9130b watchdog: Respect watchdog cpumask on CPU hotplug
   1a0ecfd4e633 powerpc/pseries/mce: Fix misleading print for TLB mutlihit
   4a2b2d5dc8fa powerpc/64: Fix memcmp reading past the end of src/dest
   e92932ef2862 powerpc/pseries/energy: Use OF accessor functions to read ibm,drc-indexes
   8f84f7daabb2 objtool: Query pkg-config for libelf location
   a0de19f1c307 perf intel-pt: Fix TSC slip
   c9418d0addb0 perf pmu: Fix parser error for uncore event alias
   8ad454a831e0 mm/migrate.c: add missing flush_dcache_page for non-mapped page migrate
   8a86a416c948 mm/page_isolation.c: fix a wrong flag in set_migratetype_isolate()
   77a5258a57e7 mm/memory_hotplug.c: fix notification in offline error path
   2b57282beb60 mm/debug.c: fix __dump_page when mapping->host is not set
   8b2f31de5d15 mm: mempolicy: make mbind() return -EIO when MPOL_MF_STRICT is specified
   467c01f2deea iommu/io-pgtable-arm-v7s: request DMA32 memory, and improve debugging
   ed3886c7d9f2 mm: add support for kmem caches in DMA32 zone
   eef9dbbad03f mm/hotplug: fix offline undo_isolate_page_range()
   d26254c4e7ca usb: typec: Fix unchecked return value
   a3bed8b549ec usb: typec: tcpm: Try PD-2.0 if sink does not respond to 3.0 source-caps
   402f57808b9a usb: cdc-acm: fix race during wakeup blocking TX traffic
   c7a5ef0d64f4 xhci: Don't let USB3 ports stuck in polling state prevent suspend
   448c39c360ef usb: xhci: dbc: Don't free all memory with spinlock held
   c08a998dec55 xhci: Fix port resume done detection for SS ports with LPM enabled
   8e70eae1816b usb: host: xhci-rcar: Add XHCI_TRUST_TX_LENGTH quirk
   40b8282f9009 mm/memory.c: fix modifying of page protection by insert_pfn()
   08213ad7465f usb: common: Consider only available nodes for dr_mode
   80ff12631ba5 USB: gadget: f_hid: fix deadlock in f_hidg_write()
   8f00b32d3991 usb: mtu3: fix EXTCON dependency
   dbc206874d67 phy: sun4i-usb: Support set_mode to USB_HOST for non-OTG PHYs
   494d26aa3915 gpio: adnp: Fix testing wrong value in adnp_gpio_direction_input
   aa2250dec6ee gpio: exar: add a check for the return value of ida_simple_get fails
   673bc99a6708 drm/i915/icl: Fix the TRANS_DDI_FUNC_CTL2 bitfield macro
   25c939a9a594 drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index check
   9241bd9b6401 drm/i915: Mark AML 0x87CA as ULX
   0baddc2099dd drm/vkms: fix use-after-free when drm_gem_handle_create() fails
   18e8f0f379a5 drm/vgem: fix use-after-free when drm_gem_handle_create() fails
   5f0bf5cd357d cpufreq: scpi: Fix use after free
   7466a2abe757 cpufreq: intel_pstate: Also use CPPC nominal_perf for base_frequency
   0dcb45879a5f blk-mq: fix sbitmap ws_active for shared tags
   50076360f4a0 drivers/block/zram/zram_drv.c: fix idle/writeback string compare
   79d8bdf334d6 fs/proc/proc_sysctl.c: fix NULL pointer dereference in put_links
   e44461a50380 Disable kgdboc failed by echo space to /sys/module/kgdboc/parameters/kgdboc
   c6ed8bf0ad03 ACPI / CPPC: Fix guaranteed performance handling
   72c1487ea0a4 USB: serial: option: add Olicard 600
   623533deabb1 USB: serial: option: add support for Quectel EM12
   b7a0e2163e0d USB: serial: option: set driver_info for SIM5218 and compatibles
   4503b17ed496 USB: serial: mos7720: fix mos_parport refcount imbalance on error path
   639f52d29012 USB: serial: ftdi_sio: add additional NovaTech products
   7790bb1039fb USB: serial: cp210x: add new device id
   4fc867dd92cb serial: sh-sci: Fix setting SCSCR_TIE while transferring data
   e39ecf48678e serial: mvebu-uart: Fix to avoid a potential NULL pointer dereference
   763eafe0dbf5 serial: max310x: Fix to avoid potential NULL pointer dereference
   198b7b7fb6b6 staging: erofs: keep corrupted fs from crashing kernel in erofs_readdir()
   22a76cf6a5eb staging: erofs: fix error handling when failed to read compresssed data
   a0fdd9036176 staging: erofs: fix to handle error path of erofs_vmap()
   be3d49395af0 staging: vt6655: Fix interrupt race condition on device start up.
   37fc532d4d58 staging: vt6655: Remove vif check from vnt_interrupt
   7d9cd1961a50 staging: speakup_soft: Fix alternate speech with other synths
   de6283bc5caf staging: olpc_dcon_xo_1: add missing 'const' qualifier
   da418a0b0963 staging: comedi: ni_mio_common: Fix divide-by-zero for DIO cmdtest
   5bff7cb2bc89 tty: serial: qcom_geni_serial: Initialize baud in qcom_geni_console_setup
   36e47853d0e9 tty: atmel_serial: fix a potential NULL pointer dereference
   ade797815046 tty: mxs-auart: fix a potential NULL pointer dereference
   35070431105f tty/serial: atmel: RS485 HD w/DMA: enable RX after TX is stopped
   70691073d296 tty/serial: atmel: Add is_half_duplex helper
   d5845d77e9e1 drm/rockchip: vop: reset scale mode when win is disabled
   631d09fd0856 scsi: zfcp: fix scsi_eh host reset with port_forced ERP for non-NPIV FCP devices
   e188df764406 scsi: zfcp: fix rport unblock if deleted SCSI devices on Scsi_Host
   143982417ad3 scsi: sd: Quiesce warning if device does not report optimal I/O size
   98163d192bc5 scsi: sd: Fix a race between closing an sd device and sd I/O
   310891a84396 ocfs2: fix inode bh swapping mixup in ocfs2_reflink_inodes_lock
   f2391e6767a6 fs/open.c: allow opening only regular files during execve()
   95d78fc93943 kbuild: modversions: Fix relative CRC byte order interpretation
   a6c74dcb5909 ALSA: hda/realtek - Fix speakers on Acer Predator Helios 500 Ryzen laptops
   f2b1bfbc173a ALSA: hda/realtek: Enable headset MIC of ASUS X430UN and X512DK with ALC256
   c03c547b07d9 ALSA: hda/realtek: Enable headset mic of ASUS P5440FF with ALC256
   dd1774f3d0cd ALSA: hda/realtek: Enable ASUS X441MB and X705FD headset MIC with ALC256
   c672af11fbb0 ALSA: hda/realtek - Add support for Acer Aspire E5-523G/ES1-432 headset mic
   12af8b3d94eb ALSA: hda/realtek: Enable headset MIC of Acer Aspire Z24-890 with ALC286
   9635b3bf1a5f ALSA: hda/realtek: Enable headset MIC of Acer AIO with ALC286
   b6de98dcc02e ALSA: hda/realtek - Add support headset mode for New DELL WYSE NB
   8da540f343aa ALSA: hda/realtek - Add support headset mode for DELL WYSE AIO
   545d1fe70648 ALSA: hda/realtek: merge alc_fixup_headset_jack to alc295_fixup_chromebook
   c87a0bb99b83 ALSA: hda/realtek - Fixed Headset Mic JD not stable
   56e3785b579b ALSA: pcm: Don't suspend stream in unrecoverable PCM state
   94176d2a1d2b ALSA: pcm: Fix possible OOB access in PCM oss plugins
   a30c0ff829c6 ALSA: seq: oss: Fix Spectre v1 vulnerability
   abe5b0a76de9 ALSA: rawmidi: Fix potential Spectre v1 vulnerability
   ce1ae80cacf7 net: dsa: qca8k: remove leftover phy accessors
   0110524398bb NFSv4.1 don't free interrupted slot on open
   e37c15d77d68 NFS: fix mount/umount race in nlmclnt.
   7a4cdaf977c2 NFS: Fix nfs4_lock_state refcounting in nfs4_alloc_{lock,unlock}data()
   bd01ab90e8a5 vfio: ccw: only free cp on final interrupt
   73d6cb884532 powerpc: bpf: Fix generation of load/store DW instructions
   a2216e2d0751 ARM: imx6q: cpuidle: fix bug that CPU might not wake up at expected time
   8bf47766a9f9 tracing: initialize variable in create_dyn_event()
   7bcb002431ba locks: wake any locks blocked on request before deadlock check
   3ba84d2d7581 Btrfs: fix assertion failure on fsync with NO_HOLES enabled
   84104398e6f3 btrfs: Avoid possible qgroup_rsv_size overflow in btrfs_calculate_inode_block_rsv_size
   e3a605636a80 btrfs: Fix bound checking in qgroup_trace_new_subtree_blocks
   4a0584a21542 btrfs: raid56: properly unmap parity page in finish_parity_scrub()
   da2dea634c22 btrfs: don't report readahead errors and don't update statistics
   70c88bf99441 btrfs: remove WARN_ON in log_dir_items
   ab0600d45dd9 Btrfs: fix incorrect file size after shrinking truncate and fsync
   0253563b8be5 powerpc/fsl: Fix the flush of branch predictor.
   bb06073a9cad tun: add a missing rcu_read_unlock() in error path
   d01bf3762e29 ila: Fix rhashtable walker list corruption
   4951fc65d915 r8169: fix cable re-plugging issue
   fc8f36de7711 net: phy: don't clear BMCR in genphy_soft_reset
   aa3f1b029e4b net: mii: Fix PAUSE cap advertisement from linkmode_adv_to_lcl_adv_t() helper
   d9c13ecbf7c5 net: dsa: mv88e6xxx: fix few issues in mv88e6390x_port_set_cmode
   98bfc778c5d9 thunderx: eliminate extra calls to put_page() for pages held for recycling
   10792c33d060 thunderx: enable page recycling for non-XDP case
   0c421524c1f1 vxlan: Don't call gro_cells_destroy() before device is unregistered
   1a44391e1d03 vrf: prevent adding upper devices
   e269f5f55c06 tun: properly test for IFF_UP
   9868ffd44b25 tipc: fix cancellation of topology subscriptions
   e13fbdf6e872 tipc: change to check tipc_own_id to return in tipc_net_stop
   30e2a9a38d0c tipc: allow service ranges to be connect()'ed on RDM/DGRAM
   632f3ed848bc tcp: do not use ipv6 header for ipv4 flow
   118ad2c7de1d sctp: use memdup_user instead of vmemdup_user
   d2af0ce54b1c sctp: get sctphdr by offset in sctp_compute_cksum
   5a336f69cfa0 rhashtable: Still do rehash when we get EEXIST
   278c7d7e4ecb packets: Always register packet sk in the same order
   970d4fb2a231 net: usb: aqc111: Extend HWID table by QNAP device
   566e793d051f net-sysfs: call dev_hold if kobject_init_and_add success
   1b925f484028 net: stmmac: fix memory corruption with large MTUs
   8cf288b55da9 net: rose: fix a possible stack overflow
   baa14468e57d net: phy: meson-gxl: fix interrupt support
   3ca86ad4e57a net/packet: Set __GFP_NOWARN upon allocation in alloc_pg_vec
   475af63497f8 net: datagram: fix unbounded loop in __skb_try_recv_datagram()
   017c90da5d8f net: aquantia: fix rx checksum offload for UDP/TCP over IPv6
   3e5c1acf0637 mISDN: hfcpci: Test both vendor & device ID for Digium HFC4S
   780e62a6a021 mac8390: Fix mmio access size probe
   282c70c23454 ipv6: make ip6_create_rt_rcu return ip6_null_entry instead of NULL
   8122233e877a gtp: change NET_UDP_TUNNEL dependency to select
   bd60a788b10b genetlink: Fix a memory leak on error path
   3b58f24bdfec dccp: do not use ipv6 header for ipv4 flow
   400dded59397 netfilter: nf_tables: fix set double-free in abort path
   a556547bae00 Bluetooth: Verify that l2cap_get_conf_opt provides large enough buffer
   8dac9b8d27b5 Bluetooth: Check L2CAP option sizes returned from l2cap_get_conf_opt

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.0.bb               |  6 +++---
 .../linux/linux-yocto-tiny_5.0.bb             |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 24c481681c..842aa5b93f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4767ff117d75b2cd54d2c0f77dc1c3e6fdd6c520"
-SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
+SRCREV_machine ?= "04585fb29f99725a27acb96fc25efa0a55a62a8a"
+SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.0.5"
+LINUX_VERSION ?= "5.0.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 6b07401eef..eba6cc6f47 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.0.5"
+LINUX_VERSION ?= "5.0.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "42d601740a3ab5d777a1709bf39500a8a4af4afe"
-SRCREV_machine ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
-SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
+SRCREV_machine_qemuarm ?= "e265300362d7004e3b57bb5cbcfc65fb469b9ce9"
+SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
+SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index f53089aa31..fe773bed98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a27450baa8f52faaf82535411bb4e32b0c16199d"
-SRCREV_machine_qemuarm64 ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
-SRCREV_machine_qemumips ?= "ea747ff485eca3175472c474184fe49a9200e36f"
-SRCREV_machine_qemuppc ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
-SRCREV_machine_qemux86 ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
-SRCREV_machine_qemux86-64 ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
-SRCREV_machine_qemumips64 ?= "e1112ce34e86354c4d9ac713ebdfbfc4b950a547"
-SRCREV_machine ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
-SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
+SRCREV_machine_qemuarm ?= "ed9d11e2c8ebbfe056420cb89c2e5d02836496ce"
+SRCREV_machine_qemuarm64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
+SRCREV_machine_qemumips ?= "40a729c3b0683d0875f8d6ad7353e6e429c7afc2"
+SRCREV_machine_qemuppc ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
+SRCREV_machine_qemux86 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
+SRCREV_machine_qemux86-64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
+SRCREV_machine_qemumips64 ?= "437d99225c689f3f192bb834e4d649ea0467ac87"
+SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
+SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.0.5"
+LINUX_VERSION ?= "5.0.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


