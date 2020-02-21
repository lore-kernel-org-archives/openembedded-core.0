Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 878BF6161C
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:05 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id e9so88524pjr.4
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jY2diWR66muDsK00xTW/81+xsMMQtCwQgySt6kTgSYE=;
	b=pcphDKl/ldzPggk7iA+BqpsfxfFc+ibg9a0CeULagwwcO2FWVFgBnKltynIPaIqp8K
	td1cp7iiiR8SEEW0oe2/7hAL4neUGMlOTFhb5KsGLdsgIvOPdMNFlGLiIiF1pAIx+AyU
	D+FloAd5qqZbpGDMyaA9nCYGaJH3qwxWczSBAftM2opWgMnlgzGSugnUWSx8r3NcuOmk
	NazPiBr8AYxohsjm2HrFwwdQpOVGY65CCCwWecFVGPQbDOVNx//kDDUd4TPF733/z3tv
	Em3ud51790ksz2JwE66WC9CtUsBs7r8HY6G7hDYmtY38PJtYBXAN9/LX2fN1GYM2dY/I
	xjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jY2diWR66muDsK00xTW/81+xsMMQtCwQgySt6kTgSYE=;
	b=Y6pborcUtYJBbnshZCJbe2QFOaHjW1VKzY13xqnAXwQXemWBULar6jm3M4EKcwp/Rk
	BJz1mwY4qVrmzVvlZV7/2SE8uQqQpxiBAqckI4o2ACRJpFc/eYLWJ/JQaQ0iZVWoconY
	cOIOgNBm1rBaD+SmjgkFRTbp7FFGgYBVi4+C8qGmK/tionjDweVpRKz2RfmlexuoGZ61
	4N/eDmGgnTpjCt1hk8wLPSrS8K7rAMS9huvRJ87RBQOOES3GYAkFRtVmYYFwCPLDGrJI
	JfcmImE93tXWSsYhoyCFXwz1YsPz/q2Y+K3PEryykGdyZ/Y4KdPgzwxmkzrjMaFiwIjE
	gucw==
X-Gm-Message-State: APjAAAUUK447HXGpmfadj9/MowUdClnO2oNHp7TRHkpiSWePOvMC99b2
	pO+RPSK/A/4JrXtZjLA4TIug6fCM
X-Google-Smtp-Source: APXvYqwwy79xiUwjEaSYdVWx9Dqqb+F+xwlkFtdVH0k4LdBDki2oRpEsZpE7n5w9MUe8VGL4I0R/hg==
X-Received: by 2002:a17:90b:46c4:: with SMTP id
	jx4mr378693pjb.32.1582253643966; 
	Thu, 20 Feb 2020 18:54:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:26 -0800
Message-Id: <fca2e866289cec99eaf65db4038d5473a34b7b57.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 07/14] linux-yocto/4.19: update to v4.19.87
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
X-List-Received-Date: Fri, 21 Feb 2020 02:54:05 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/4.19 to the latest korg -stable release that comprises
the following commits:

    174651bdf802 Linux 4.19.87
    6938a9da7ff8 PM / devfreq: Fix kernel oops on governor module load
    345712c95eec KVM: PPC: Book3S HV: Flush link stack on guest exit to host kernel
    0a60d4bddc0b powerpc/book3s64: Fix link stack flush on context switch
    19d98b4d55b0 powerpc/64s: support nospectre_v2 cmdline option
    b7e2a040d9fc staging: comedi: usbduxfast: usbduxfast_ai_cmdtest rounding error
    4101916e9f08 USB: serial: option: add support for Foxconn T77W968 LTE modules
    62aca6645c08 USB: serial: option: add support for DW5821e with eSIM support
    3349ed266ae2 USB: serial: mos7840: fix remote wakeup
    abbda35d6a6e USB: serial: mos7720: fix remote wakeup
    84743898d60b USB: serial: mos7840: add USB ID to support Moxa UPort 2210
    356440a79b6b appledisplay: fix error handling in the scheduled work
    0439d6b90187 USB: chaoskey: fix error case of a timeout
    a18675e5d5f7 usb-serial: cp201x: support Mark-10 digital force gauge
    61f6a3fac394 usbip: Fix uninitialized symbol 'nents' in stub_recv_cmd_submit()
    375b26a86481 usbip: tools: fix fd leakage in the function of read_attr_usbip_status
    e70448b92253 USBIP: add config dependency for SGL_ALLOC
    5d0b56f6725d virtio_ring: fix return code on DMA mapping fails
    78260a294c04 media: imon: invalid dereference in imon_touch_event
    94a94b605916 media: cxusb: detect cxusb_ctrl_msg error in query
    8b42c263ec1a media: b2c2-flexcop-usb: add sanity checking
    56be9f1b8733 media: uvcvideo: Fix error path in control parsing failure
    61e73cf57ed8 cpufreq: Add NULL checks to show() and store() methods of cpufreq
    f217cef919da media: usbvision: Fix races among open, close, and disconnect
    467052f6ea5a media: vivid: Fix wrong locking that causes race conditions on streaming stop
    b73b28b1b2cb media: vivid: Set vid_cap_streaming and vid_out_streaming to true
    af8071f50f46 nfc: port100: handle command failure cleanly
    3510fb7947d5 ALSA: usb-audio: Fix NULL dereference at parsing BADD
    2819f4030f43 futex: Prevent robust futex exit race
    d3f8c58d701c y2038: futex: Move compat implementation into futex.c
    344966da99c9 nbd: prevent memory leak
    ed7a3dde0aa2 x86/speculation: Fix redundant MDS mitigation message
    0af5ae268e24 x86/speculation: Fix incorrect MDS/TAA mitigation status
    ed7312096a1f x86/insn: Fix awk regexp warnings
    99b933bbc7b0 ARC: perf: Accommodate big-endian CPU
    e02f1448282b ARM: 8904/1: skip nomap memblocks while finding the lowmem/highmem boundary
    046f0fcf7397 ocfs2: remove ocfs2_is_o2cb_active()
    36bef080b55f net: phy: dp83867: increase SGMII autoneg timer duration
    87997a7800a1 net: phy: dp83867: fix speed 10 in sgmii mode
    5779cbc98369 mm/memory_hotplug: don't access uninitialized memmaps in shrink_zone_span()
    a268d985f089 md/raid10: prevent access of uninitialized resync_pages offset
    f8dc0350d32b ath9k_hw: fix uninitialized variable data
    f0cfe98332d6 ath10k: Fix a NULL-ptr-deref bug in ath10k_usb_alloc_urb_from_pipe
    4ae7392ab6f4 KVM: MMU: Do not treat ZONE_DEVICE pages as being reserved
    03bf4876a593 Bluetooth: Fix invalid-free in bcsp_close()
    006360ec33d9 mm/page_io.c: do not free shared swap slots
    16a300fb1dbb cfg80211: call disconnect_wk when AP stops
    2b3541ffdd05 ipv6: Fix handling of LLA with VRF and sockets bound to VRF
    091ed093c9c8 mm/memory_hotplug: Do not unlock when fails to take the device_hotplug_lock
    896f7398152b i2c: uniphier-f: fix timeout error after reading 8 bytes
    1efa17ab9cb8 spi: omap2-mcspi: Fix DMA and FIFO event trigger size mismatch
    1b0f1b2dde06 nvme-pci: fix surprise removal
    597a37d01b69 PCI: keystone: Use quirk to limit MRRS for K2G
    c0418c4a61aa pinctrl: zynq: Use define directive for PIN_CONFIG_IO_STANDARD
    0858006cda38 pinctrl: lpc18xx: Use define directive for PIN_CONFIG_GPIO_PIN_INT
    5efa36e7f04a pinctrl: bcm2835: Use define directive for BCM2835_PINCONF_PARAM_PULL
    bad4da12b797 pinctrl: qcom: spmi-gpio: fix gpio-hog related boot issues
    c24fe7807320 cfg80211: Prevent regulatory restore during STA disconnect in concurrent interfaces
    ee7d2473812b tools: bpftool: pass an argument to silence open_obj_pinned()
    367e64ce11fc of: unittest: initialize args before calling of_*parse_*()
    e4547e028547 of: unittest: allow base devicetree to have symbol metadata
    1303c938c953 net: bcmgenet: return correct value 'ret' from bcmgenet_power_down
    1d6a0dd6aa53 ACPICA: Use %d for signed int print formatting instead of %u
    d15b8b691725 clk: tegra20: Turn EMC clock gate into divider
    91c5f99d131e vrf: mark skb for multicast or link-local as enslaved to VRF
    5c2a3997ae5b dlm: don't leak kernel pointer to userspace
    afb4717ab81b dlm: fix invalid free
    30fc13ae88b2 usb: typec: tcpm: charge current handling for sink during hard reset
    5e989b6cad68 scsi: lpfc: Correct loss of fc4 type on remote port address change
    a391709b636e scsi: lpfc: Fix odd recovery in duplicate FLOGIs in point-to-point
    05678af01a33 scsi: lpfc: fcoe: Fix link down issue after 1000+ link bounces
    e6d0262e1628 scsi: megaraid_sas: Fix goto labels in error handling
    83e679606e78 scsi: megaraid_sas: Fix msleep granularity
    ff997bf13c1e scsi: mpt3sas: Fix driver modifying persistent data in Manufacturing page11
    80224e3b08ff scsi: mpt3sas: Don't modify EEDPTagMode field setting on SAS3.5 HBA devices
    5553e2bdcb02 scsi: mpt3sas: Fix Sync cache command failure during driver unload
    5f2dc610eb28 net: dsa: bcm_sf2: Turn on PHY to allow successful registration
    2ac94b9e902f rtlwifi: rtl8192de: Fix misleading REG_MCUFWDL information
    13d434fed1a2 wireless: airo: potential buffer overflow in sprintf()
    fad934bb2e47 brcmsmac: never log "tid x is not agg'able" by default
    bdb61fa50b70 rtl8xxxu: Fix missing break in switch
    06ed77066838 wlcore: Fix the return value in case of error in 'wlcore_vendor_cmd_smart_config_start()'
    c68a499448e1 ath10k: snoc: fix unbalanced clock error handling
    c262dc0655df wil6210: fix locking in wmi_call
    ccb2390e8933 wil6210: fix RGF_CAF_ICR address for Talyn-MB
    0e1304ae42c2 wil6210: fix L2 RX status handling
    aa2112d57152 wil6210: fix debugfs memory access alignment
    ea136e61e4df btrfs: avoid link error with CONFIG_NO_AUTO_INLINE
    4a035f2643c6 media: ov13858: Check for possible null pointer
    3ee72f30c163 nds32: Fix bug in bitfield.h
    e6c6c0439a93 net: bpfilter: fix iptables failure if bpfilter_umh is disabled
    811c8141d663 sock_diag: fix autoloading of the raw_diag module
    3c69a033b416 audit: print empty EXECVE args
    5dc441fbef91 soc: bcm: brcmstb: Fix re-entry point with a THUMB2_KERNEL
    9cdfff0a5e61 clk: sunxi-ng: enable so-said LDOs for A64 SoC's pll-mipi clock
    a2e6fe1f647f ARM: dts: imx6sx-sdb: Fix enet phy regulator
    465073e44fda openvswitch: fix linking without CONFIG_NF_CONNTRACK_LABELS
    31bced01fe77 sched/fair: Don't increase sd->balance_interval on newidle balance
    ed023646c2cf sched/topology: Fix off by one bug
    f9fca78e6cf2 net: do not abort bulk send on BQL status
    0d3b9ac2844f ocfs2: fix clusters leak in ocfs2_defrag_extent()
    6c150df9c2e8 ocfs2: don't put and assigning null to bh allocated outside
    6fd469d06eb8 ocfs2: don't use iocb when EIOCBQUEUED returns
    abc7968b86b1 ocfs2: without quota support, avoid calling quota recovery
    6a2245d828e4 mm: handle no memcg case in memcg_kmem_charge() properly
    08f07d9f5b17 tools/power turbosat: fix AMD APIC-id output
    b167fee4e45d arm64: makefile fix build of .i file in external module case
    fa7f1bce27c0 nvme-pci: fix conflicting p2p resource adds
    0bbb8382db4c irq/matrix: Fix memory overallocation
    ad8298fccd70 ntb: intel: fix return value for ndev_vec_mask()
    3bd4422af874 ntb_netdev: fix sleep time mismatch
    8dbecf6c2f17 net: hns3: bugfix for hclge_mdio_write and hclge_mdio_read
    12eeb72afac2 net: hns3: bugfix for is_valid_csq_clean_head()
    e3345108409c net: hns3: bugfix for reporting unknown vector0 interrupt repeatly problem
    b0465d06d4c6 net: hns3: bugfix for buffer not free problem during resetting
    3d9bc014c519 fm10k: ensure completer aborts are marked as non-fatal after a resume
    2fed73906e97 igb: shorten maximum PHC timecounter update interval
    3081ae5e378f powerpc/powernv: hold device_hotplug_lock when calling device_online()
    17523d7a1cc8 mm/memory_hotplug: fix online/offline_pages called w.o. mem_hotplug_lock
    02735d5987b9 mm/memory_hotplug: make add_memory() take the device_hotplug_lock
    023c071f101c kernel/panic.c: do not append newline to the stack protector panic string
    1914e5edd811 fs/hfs/extent.c: fix array out of bounds read of array extent
    a9f38975eb98 hfs: update timestamp on truncate()
    0013adceb521 hfsplus: update timestamps on truncate()
    38e7b916daa2 hfs: fix return value of hfs_get_block()
    550da9ee35fd hfsplus: fix return value of hfsplus_get_block()
    8687d57d247a hfs: prevent btree data loss on ENOSPC
    0b54b59d8541 hfsplus: prevent btree data loss on ENOSPC
    7beaf6105e2e hfs: fix BUG on bnode parent update
    1df96949ebfb hfsplus: fix BUG on bnode parent update
    08751e477f0e lib/bitmap.c: fix remaining space computation in bitmap_print_to_pagebuf
    1d5834945945 linux/bitmap.h: fix type of nbits in bitmap_shift_right()
    8deaaf77ce2e linux/bitmap.h: handle constant zero-size bitmaps correctly
    30598425aecc mm/gup_benchmark.c: prevent integer overflow in ioctl
    9663d294ae28 block: call rq_qos_exit() after queue is frozen
    a125df22d134 selftests/powerpc/cache_shape: Fix out-of-tree build
    024cd793bbe1 selftests/powerpc/switch_endian: Fix out-of-tree build
    a4a660f7abd9 selftests/powerpc/signal: Fix out-of-tree build
    f74f406bbd0b selftests/powerpc/ptrace: Fix out-of-tree build
    57aab8f0a33d powerpc/xmon: Relax frame size for clang
    32d7474b7a08 ipv4/igmp: fix v1/v2 switchback timeout based on rfc3376, 8.12
    691bd94c15b1 vfs: avoid problematic remapping requests into partial EOF block
    cdc45f204775 um: Make line/tty semantics use true write IRQ
    a17e3bbfb97c i2c: uniphier-f: fix race condition when IRQ is cleared
    a118403a5ecc i2c: uniphier-f: fix occasional timeout error
    1466eae37a9f i2c: uniphier-f: make driver robust against concurrency
    10807b374663 block: fix the DISCARD request merge
    b948d56951be macsec: let the administrator set UP state even if lowerdev is down
    f5bdad7106fc macsec: update operstate when lower device changes
    4291e97c69f6 mm: thp: fix MADV_DONTNEED vs migrate_misplaced_transhuge_page race condition
    ac1cad79bcad tools/testing/selftests/vm/gup_benchmark.c: fix 'write' flag usage
    2d9d6c099eaf mm/page-writeback.c: fix range_cyclic writeback vs writepages deadlock
    bcba80f38a00 fs/ocfs2/dlm/dlmdebug.c: fix a sleep-in-atomic-context bug in dlm_print_one_mle()
    99b3146b799a arm64: lib: use C string functions with KASAN enabled
    b84e965c7edb sparc64: Rework xchg() definition to avoid warnings.
    4e4cad4365e0 powerpc/process: Fix flush_all_to_thread for SPE
    54299e1cf379 bpf, btf: fix a missing check bug in btf_parse
    8044e741eee4 bpf: devmap: fix wrong interface selection in notifier_call
    7b557dbdc519 net: ethernet: cadence: fix socket buffer corruption problem
    3681b901e94a thermal: rcar_thermal: Prevent hardware access during system suspend
    436e610bf195 thermal: rcar_thermal: fix duplicate IRQ request
    51aa1a10fbac selftests: fix warning: "_GNU_SOURCE" redefined
    c62be4108883 selftests: kvm: Fix -Wformat warnings
    5802cb25de86 selftests: watchdog: Fix error message.
    74685702363c selftests: watchdog: fix message when /dev/watchdog open fails
    58ceffabad41 selftests/ftrace: Fix to test kprobe $comm arg only if available
    adcb6d9ff121 spi: uniphier: fix incorrect property items
    6c2075f792c6 fs/cifs: fix uninitialised variable warnings
    c5621fbd6560 net: socionext: Stop PHY before resetting netsec
    0a6fa6119ab1 mfd: max8997: Enale irq-wakeup unconditionally
    5a04242e8c23 mfd: intel_soc_pmic_bxtwc: Chain power button IRQs as well
    dd72391c9a53 mfd: mc13xxx-core: Fix PMIC shutdown when reading ADC values
    02c9ec11860f mfd: arizona: Correct calling of runtime_put_sync
    e79d230832d0 net: ethernet: ti: cpsw: unsync mcast entries while switch promisc mode
    7c011435110f qlcnic: fix a return in qlcnic_dcb_get_capability()
    321c40dce581 mISDN: Fix type of switch control variable in ctrl_teimanager
    074af1668038 f2fs: spread f2fs_set_inode_flags()
    e7f81efae3b5 f2fs: fix to spread clear_cold_data()
    733fddc34651 thermal: armada: fix a test in probe()
    bb925b9bece2 RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap
    829aa617bf6e rtc: s35390a: Change buf's type to u8 in s35390a_init
    8112f3d4ed03 ceph: only allow punch hole mode in fallocate
    146fb4b0d4fe ceph: fix dentry leak in ceph_readdir_prepopulate
    083757d84859 tools: bpftool: fix completion for "bpftool map update"
    570c05378d97 selftests/bpf: fix return value comparison for tests in test_libbpf.sh
    3173e226ca41 powerpc/64s/radix: Fix radix__flush_tlb_collapsed_pmd double flushing pmd
    b43c5287f6bc powerpc/mm/radix: Fix small page at boundary when splitting
    b499fa070ee4 powerpc/mm/radix: Fix overuse of small pages in splitting logic
    434551e9fd44 powerpc/mm/radix: Fix off-by-one in split mapping logic
    ee35e01b0f08 powerpc/pseries: Export raw per-CPU VPA data via debugfs
    9ed143cf730d scsi: hisi_sas: Fix NULL pointer dereference
    ff6618e06cb4 sparc: Fix parport build warnings.
    3d02e3bb3cfe x86/intel_rdt: Prevent pseudo-locking from using stale pointers
    b6e44f743951 spi: omap2-mcspi: Set FIFO DMA trigger level to word length
    ad9a4e963c92 swiotlb: do not panic on mapping failures
    9b572e8bc038 s390/perf: Return error when debug_register fails
    641f1f798c80 atm: zatm: Fix empty body Clang warnings
    f9304c6277ed sunrpc: safely reallow resvport min/max inversion
    7983dea8c368 SUNRPC: Fix a compile warning for cmpxchg64()
    a0ec7f6eabe8 selftests/bpf: fix file resource leak in load_kallsyms
    56b8b1832122 dm raid: avoid bitmap with raid4/5/6 journal device
    4de506d51177 sctp: use sk_wmem_queued to check for writable space
    1f7f2a0666a3 usbip: tools: fix atoi() on non-null terminated string
    283d9618e22b USB: misc: appledisplay: fix backlight update_status return code
    80a23f70d546 PCI: vmd: Detach resources after stopping root bus
    b0f69ccfff3a macintosh/windfarm_smu_sat: Fix debug output
    86f63146f886 ALSA: i2c/cs8427: Fix int to char conversion
    46729b27706a PM / Domains: Deal with multiple states but no governor in genpd
    cf800f2b630b ACPI / scan: Create platform device for INT33FE ACPI nodes
    cb6a3096ec2f kprobes, x86/ptrace.h: Make regs_get_kernel_stack_nth() not fault on bad stack
    f0f842a1a9f9 xfs: clear ail delwri queued bufs on unmount of shutdown fs
    bb64349b6f56 xfs: fix use-after-free race in xfs_buf_rele
    e0e8d83e4878 net: ena: Fix Kconfig dependency on X86
    7ac437558e4a net: fix warning in af_unix
    5e110ec2d924 net: dsa: mv88e6xxx: Fix 88E6141/6341 2500mbps SERDES speed
    274726bcf5ba scsi: zorro_esp: Limit DMA transfers to 65535 bytes
    1f13afca914f scsi: dc395x: fix DMA API usage in sg_update_list
    e95ec662b126 scsi: dc395x: fix dma API usage in srb_done
    95655b10529d ASoC: tegra_sgtl5000: fix device_node refcounting
    f1f1002a9987 clk: at91: audio-pll: fix audio pmc type
    f15b802890bb clk: mmp2: fix the clock id for sdh2_clk and sdh3_clk
    6391dd5eb0ef PCI: mediatek: Fixup MSI enablement logic by enabling MSI before clocks
    305c262fb8ee nvme-pci: fix hot removal during error handling
    4e4b97f59050 nvmet-fcloop: suppress a compiler warning
    2f1e4e65ba41 nvmet: avoid integer overflow in the discard code
    30ca1af49481 crypto: ccree - avoid implicit enum conversion
    5bbeb4fcf39a scsi: iscsi_tcp: Explicitly cast param in iscsi_sw_tcp_host_get_param
    06815ae5e27f scsi: bfa: Avoid implicit enum conversion in bfad_im_post_vendor_event
    f4bf2dc77826 scsi: isci: Change sci_controller_start_task's return type to sci_status
    3a40068dc831 scsi: isci: Use proper enumerated type in atapi_d2h_reg_frame_handler
    6288f52ed258 clk: tegra: Fixes for MBIST work around
    5a487f40e717 KVM/x86: Fix invvpid and invept register operand size in 64-bit mode
    7392aa08f8a4 KVM: nVMX: move check_vmentry_postreqs() call to nested_vmx_enter_non_root_mode()
    9fe573d539a8 KVM: nVMX: reset cache/shadows when switching loaded VMCS
    cec14148c1a9 nfp: bpf: protect against mis-initializing atomic counters
    bfe01cddb81a scsi: ips: fix missing break in switch
    073f454cc28c qed: Align local and global PTT to propagate through the APIs.
    45f89cf0f329 amiflop: clean up on errors during setup
    4043bc0f634b pwm: lpss: Only set update bit if we are actually changing the settings
    ad78a958663a pinctrl: sunxi: Fix a memory leak in 'sunxi_pinctrl_build_state()'
    fae3cf8874c3 RDMA/bnxt_re: Avoid resource leak in case the NQ registration fails
    b1bf1e424dcb RDMA/bnxt_re: Fix qp async event reporting
    2f241e333f7b RDMA/bnxt_re: Avoid NULL check after accessing the pointer
    bbeeadb7bab4 scsi: hisi_sas: Free slot later in slot_complete_vx_hw()
    628cae51693a scsi: hisi_sas: Fix the race between IO completion and timeout for SMP/internal IO
    d10b7dd14a37 scsi: hisi_sas: Feed back linkrate(max/min) when re-attached
    92ac0e324974 m68k: fix command-line parsing when passed from u-boot
    4ab1594e699e w1: IAD Register is yet readable trough iad sys file. Fix snprintf (%u for unsigned, count for max size).
    d11d985d0a82 misc: mic: fix a DMA pool free failure
    a2204a295554 gsmi: Fix bug in append_to_eventlog sysfs handler
    cc08097f2619 btrfs: handle error of get_old_root
    1b49c453a564 btrfs: defrag: use btrfs_mod_outstanding_extents in cluster_pages_for_defrag
    9325e8f4688c PCI: mediatek: Fix class type for MT7622 to PCI_CLASS_BRIDGE_PCI
    dfffae314a02 mmc: mediatek: fix cannot receive new request when msdc_cmd_is_ready fail
    e2c158f58522 mmc: mediatek: fill the actual clock for mmc debugfs
    e3fa491211c4 spi: sh-msiof: fix deferred probing
    2cd0b70c55b0 cdrom: don't attempt to fiddle with cdo->capability
    0c5c34c1aaf3 skd: fixup usage of legacy IO API
    196b007ac0a6 ath10k: allocate small size dma memory in ath10k_pci_diag_write_mem
    17fbe3c91ad4 ath10k: set probe request oui during driver start
    8111f99f7c44 brcmsmac: AP mode: update beacon when TIM changes
    20e42ddf6c1d mt76x0: phy: fix restore phase in mt76x0_phy_recalibrate_after_assoc
    8cb568162524 mt76: do not store aggregation sequence number for null-data frames
    b95998fb6c50 EDAC, thunderx: Fix memory leak in thunderx_l2c_threaded_isr()
    97aab1a43a2f powerpc/eeh: Fix use of EEH_PE_KEEP on wrong field
    bd2a7e53cd6e powerpc/eeh: Fix null deref for devices removed during EEH
    16e4657a1d25 powerpc/boot: Disable vector instructions
    5346c8403733 powerpc/boot: Fix opal console in boot wrapper
    4505cff2ef4a powerpc: Fix signedness bug in update_flash_db()
    93b943c0602f synclink_gt(): fix compat_ioctl()
    8d67a4ecb473 pty: fix compat ioctls
    fa3fe5f442ab gfs2: Fix marking bitmaps non-full
    26a4c6a562ce PCI: cadence: Write MSI data with 32bits
    ca71f9c8adc2 pinctrl: madera: Fix uninitialized variable bug in madera_mux_set_mux
    4465a916eaa7 printk: fix integer overflow in setup_log_buf()
    90d73768ddb6 printk: lock/unlock console only for new logbuf entries
    8888689bd433 crypto: testmgr - fix sizeof() on COMP_BUF_SIZE
    3757657af27e ALSA: isight: fix leak of reference to firewire unit in error path of .probe callback
    49a9643b5e8d mwifiex: Fix NL80211_TX_POWER_LIMITED
    e80e88ef6057 drm/i915/userptr: Try to acquire the page lock around set_page_dirty()
    a0ee03bb5269 drm/i915/pmu: "Frequency" is reported as accumulated cycles
    8a67fbf65971 drm/amd/powerplay: issue no PPSMC_MSG_GetCurrPkgPwr on unsupported ASICs
    e8d355befc42 mm/ksm.c: don't WARN if page is still mapped in remove_stable_node()
    b28da9da6e51 Revert "fs: ocfs2: fix possible null-pointer dereferences in ocfs2_xa_prepare_entry()"
    67380639dfdb virtio_console: allocate inbufs in add_port() only if it is needed
    65d153c8ed65 nbd:fix memory leak in nbd_get_socket()
    036588ec6888 tools: gpio: Correctly add make dependencies for gpio_utils
    7cb8ee734c18 gpio: max77620: Fixup debounce delays
    70d594d17ebb vhost/vsock: split packets to send using multiple buffers
    48bc34efbc65 net/mlx5: Fix auto group size calculation
    28a4cc2b5d6f net/mlxfw: Verify FSM error code translation doesn't exceed array size
    7c1a53817782 net/mlx5e: Fix set vf link state error flow
    1ff2a0f8692f sfc: Only cancel the PPS workqueue if it exists
    13512a5eb818 net: sched: ensure opts_len <= IP_TUNNEL_OPTS_MAX in act_tunnel_key
    2ba6a4f5402e net/sched: act_pedit: fix WARN() in the traffic path
    9f6de5cf5390 net: rtnetlink: prevent underflows in do_setvfinfo()
    ebcb0840a76b net/mlx4_en: Fix wrong limitation for number of TX rings
    5408138df1db net/mlx4_en: fix mlx4 ethtool -N insertion
    baa888ca02db mlxsw: spectrum_router: Fix determining underlay for a GRE tunnel
    14260788bbb9 Linux 4.19.86
    2e1f151cd2d9 x86/resctrl: Fix rdt_find_domain() return value and checks
    d64b58520670 mmc: tmio: fix SCC error handling to avoid false positive CRC error
    e2a37708cfca powerpc/time: Fix clockevent_decrementer initalisation for PR KVM
    ff36ace6c107 tools: PCI: Fix broken pcitest compilation
    4039b5dd0f67 PM / devfreq: Fix static checker warning in try_then_request_governor
    903cfafe0874 ACPI / LPSS: Use acpi_lpss_* instead of acpi_subsys_* functions for hibernate
    6491a2d26c08 tcp: start receiver buffer autotuning sooner
    ef0811ef95ea ARM: dts: omap5: Fix dual-role mode on Super-Speed port
    183f9ae8c4d2 mlxsw: spectrum_switchdev: Check notification relevance based on upper device
    16ad1c43196a spi: rockchip: initialize dma_slave_config properly
    f28abe5a3695 mac80211: minstrel: fix sampling/reporting of CCK rates in HT mode
    83ea4ccdb9eb mac80211: minstrel: fix CCK rate group streams value
    8bbedf4dffe9 mac80211: minstrel: fix using short preamble CCK rates on HT clients
    5d017065cec9 misc: cxl: Fix possible null pointer dereference
    9089b2f0049e netfilter: nft_compat: do not dump private area
    e6c540bf9786 net: sched: avoid writing on noop_qdisc
    b80939a47413 selftests: forwarding: Have lldpad_app_wait_set() wait for unknown, too
    a119952d4be6 hwmon: (npcm-750-pwm-fan) Change initial pwm target to 255
    4bbc8deedd89 hwmon: (ina3221) Fix INA3221_CONFIG_MODE macros
    5bdad12ab211 hwmon: (pwm-fan) Silence error on probe deferral
    0cb6525b75e1 hwmon: (nct6775) Fix names of DIMM temperature sources
    a58d5770493c hwmon: (k10temp) Support all Family 15h Model 6xh and Model 7xh processors
    1301b861cf50 scsi: arcmsr: clean up clang warning on extraneous parentheses
    b0c75ea8d372 pinctrl: gemini: Fix up TVC clock group
    2a6c8fc0af64 orangefs: rate limit the client not running info message
    336793832f26 x86/mm: Do not warn about PCI BIOS W+X mappings
    1eeb7407d233 ARM: 8802/1: Call syscall_trace_exit even when system call skipped
    e616dd603c29 spi: spidev: Fix OF tree warning logic
    4fabd2e530ab pinctrl: gemini: Mask and set properly
    8aa36b8a7684 spi: fsl-lpspi: Prevent FIFO under/overrun by default
    07ed61a0a711 gpio: syscon: Fix possible NULL ptr usage
    312de5a09d10 net: fix generic XDP to handle if eth header was mangled
    014045888a74 bpf: btf: Fix a missing check bug
    85f996c36e15 x86/kexec: Correct KEXEC_BACKUP_SRC_END off-by-one error
    3f4f4c639f29 lightnvm: pblk: consider max hw sectors supported for max_write_pgs
    d4ab0df8d5dd lightnvm: pblk: fix error handling of pblk_lines_init()
    cdf73455471a lightnvm: do no update csecs and sos on 1.2
    1fb60da4d736 lightnvm: pblk: guarantee mw_cunits on read buffer
    1e9796622bc7 lightnvm: pblk: fix write amplificiation calculation
    d56fe8f59a23 lightnvm: pblk: guarantee emeta on line close
    c7e49f73152f lightnvm: pblk: fix incorrect min_write_pgs
    ced6b5dae1dc lightnvm: pblk: fix rqd.error return value in pblk_blk_erase_sync
    e99956093f70 ALSA: hda/ca0132 - Fix input effect controls for desktop cards
    9c30ea2dda5d media: venus: vdec: fix decoded data size
    5b388c45c3e5 media: cx231xx: fix potential sign-extension overflow on large shift
    4d7cf69b77ce GFS2: Flush the GFS2 delete workqueue before stopping the kernel threads
    1adde6589b4a media: isif: fix a NULL pointer dereference bug
    3404019d6d0f printk: Give error on attempt to set log buffer length to over 2G
    b2d6db3e572a mfd: ti_am335x_tscadc: Keep ADC interface on if child is wakeup capable
    b0c6a78a8a5a backlight: lm3639: Unconditionally call led_classdev_unregister
    94764e3ae569 proc/vmcore: Fix i386 build error of missing copy_oldmem_page_encrypted()
    e78c55ad6657 s390/kasan: avoid user access code instrumentation
    ef5ad4f11e74 s390/kasan: avoid instrumentation of early C code
    5228d07c4f92 s390/kasan: avoid vdso instrumentation
    0046af383099 mmc: mmci: expand startbiterr to irqmask and error check
    322f530fd959 x86/intel_rdt: CBM overlap should also check for overlap with CDP peer
    36cf91317ca9 x86/intel_rdt: Introduce utility to obtain CDP peer
    f9a2a8b8a5d4 mtd: devices: m25p80: Make sure WRITE_EN is issued before each write
    6664533b4fc1 mtd: spi-nor: cadence-quadspi: Use proper enum for dma_[un]map_single
    370dbbc7b5cb media: cx18: Don't check for address of video_dev
    76765353043b media: dw9807-vcm: Fix probe error handling
    96134bbea649 media: dw9714: Fix error handling in probe function
    2103ebde9ac0 platform/x86: mlx-platform: Properly use mlxplat_mlxcpld_msn201x_items
    04d38fa8436b bcache: recal cached_dev_sectors on detach
    65910055b560 bcache: account size of buckets used in uuid write to ca->meta_sectors_written
    16c2d36b1123 reset: Fix potential use-after-free in __of_reset_control_get()
    84b787e35482 fbdev: fix broken menu dependencies
    21bb43c0dd86 fbdev: sbuslib: integer overflow in sbusfb_ioctl_helper()
    e57ba9db8c5f fbdev: sbuslib: use checked version of put_user()
    964cd867ef63 atmel_lcdfb: support native-mode display-timings
    a3a76b5d22f0 mmc: renesas_sdhi_internal_dmac: set scatter/gather max segment size
    e8853ef02e2d mmc: tmio: Fix SCC error detection
    01395b5f089b mmc: renesas_sdhi_internal_dmac: Whitelist r8a774a1
    500c933055e7 x86/fsgsbase/64: Fix ptrace() to read the FS/GS base accurately
    b17ddbdc6035 xsk: proper AF_XDP socket teardown ordering
    29fda86178fe iwlwifi: mvm: don't send keys when entering D3
    d43b7b99fe77 ACPI / SBS: Fix rare oops when removing modules
    7f02606367b3 xfrm: use correct size to initialise sp->ovec
    6b9c4eddb3be crypto: mxs-dcp - Fix AES issues
    70ecd0459d03 crypto: mxs-dcp - Fix SHA null hashes and output length
    fef30612e23c dmaengine: rcar-dmac: set scatter/gather max segment size
    af23231acaf6 x86/olpc: Fix build error with CONFIG_MFD_CS5535=m
    624cd074631a kexec: Allocate decrypted control pages for kdump if SME is enabled
    59e5269c692e remoteproc: qcom: q6v5: Fix a race condition on fatal crash
    4b8c7bce49ca remoteproc: Check for NULL firmwares in sysfs interface
    e4aecc15d7c4 tc-testing: fix build of eBPF programs
    d653bd939cb1 net: hns3: Fix for rx vlan id handle to support Rev 0x21 hardware
    3bef7420e129 soc: fsl: bman_portals: defer probe after bman's probe
    090122baa262 Input: silead - try firmware reload after unsuccessful resume
    c13b00c39464 Input: st1232 - set INPUT_PROP_DIRECT property
    205ae6b06288 i2c: zx2967: use core to detect 'no zero length' quirk
    1698ed9f0e2f i2c: tegra: use core to detect 'no zero length' quirk
    d511166558a4 i2c: qup: use core to detect 'no zero length' quirk
    e0d9c58c49e6 i2c: omap: use core to detect 'no zero length' quirk
    f3afad5d1eff gfs2: slow the deluge of io error messages
    35c8125cbea4 media: cec-gpio: select correct Signal Free Time
    58d0a3dbad2b media: ov5640: fix framerate update
    47dd538e9c44 dmaengine: ioat: fix prototype of ioat_enumerate_channels
    90d73c1cadb8 NFSv4.x: fix lock recovery during delegation recall
    799c98cba071 printk: Correct wrong casting
    e7ff1141b60c i2c: brcmstb: Allow enabling the driver on DSL SoCs
    8b3e444fe8d0 clk: samsung: Use clk_hw API for calling clk framework from clk notifiers
    599d5350f123 clk: samsung: exynos5420: Define CLK_SECKEY gate clock only or Exynos5420
    06da39429640 clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
    fe46630cd2a1 qtnfmac: drop error reports for out-of-bounds key indexes
    4ecc631d975c qtnfmac: inform wireless core about supported extended capabilities
    28d5342b2ae4 qtnfmac: pass sgi rate info flag to wireless core
    5554e47a2946 qtnfmac: request userspace to do OBSS scanning if FW can not
    75a1e8dec421 brcmfmac: fix full timeout waiting for action frame on-channel tx
    c01258a2ad7d brcmfmac: reduce timeout for action frame scan
    89cf2472a295 cpu/SMT: State SMT is disabled even with nosmt and without "=force"
    8fce141f4805 mtd: physmap_of: Release resources on error
    d46cd42b4ffa usb: dwc2: disable power_down on rockchip devices
    3ad0531dbe0c USB: serial: cypress_m8: fix interrupt-out transfer length
    24ce099a5388 KVM: PPC: Book3S PR: Exiting split hack mode needs to fixup both PC and LR
    8b6021ca47a3 bnxt_en: return proper error when FW returns HWRM_ERR_CODE_RESOURCE_ACCESS_DENIED
    6e454b0ad02d ALSA: hda/sigmatel - Disable automute for Elo VuPoint
    6925a5afc148 media: i2c: adv748x: Support probing a single output
    a02bad04d110 media: rcar-vin: fix redeclaration of symbol
    14dc7aeef3f4 media: pxa_camera: Fix check for pdev->dev.of_node
    7672ca60a14a media: rc: ir-rc6-decoder: enable toggle bit for Kathrein RCU-676 remote
    01e9e39f4f61 qed: Avoid implicit enum conversion in qed_ooo_submit_tx_buffers
    d1dff747758f ata: ep93xx: Use proper enums for directions
    6a70c66a84e0 powerpc/64s/radix: Explicitly flush ERAT with local LPID invalidation
    9e4649e443e2 powerpc/time: Use clockevents_register_device(), fixing an issue with large decrementer
    d7e546d06182 ASoC: qdsp6: q6asm-dai: checking NULL vs IS_ERR()
    27ab8f1648ac cpuidle: menu: Fix wakeup statistics updates for polling state
    38ad2aa9331b ACPICA: Never run _REG on system_memory and system_IO
    216929d15b2c OPP: Return error on error from dev_pm_opp_get_opp_count()
    3d0c72f99efc msm/gpu/a6xx: Force of_dma_configure to setup DMA for GMU
    674b223d7a48 rpmsg: glink: smem: Support rx peak for size less than 4 bytes
    ec9fc981de57 IB/mlx4: Avoid implicit enumerated type conversion
    d5d78049b7a4 RDMA/hns: Limit the size of extend sge of sq
    010af7a8d0ae RDMA/hns: Bugfix for CM test
    5b7064adfb4b RDMA/hns: Submit bad wr when post send wr exception
    af76265532a8 RDMA/hns: Bugfix for reserved qp number
    350703fae672 IB/rxe: avoid srq memory leak
    e3db306d1fda IB/mthca: Fix error return code in __mthca_init_one()
    1b86b8ad6e47 ixgbe: Fix crash with VFs and flow director on interface flap
    0e1fd69cff75 i40e: Use proper enum in i40e_ndo_set_vf_link_state
    22b8d7e3bcb5 ixgbe: Fix ixgbe TX hangs with XDP_TX beyond queue limit
    b69cfc4f2665 md: allow metadata updates while suspending an array - fix
    4aa110048087 ice: Fix forward to queue group logic
    d97a02b84879 clocksource/drivers/sh_cmt: Fix clocksource width for 32-bit machines
    31fb5ea6ed1b clocksource/drivers/sh_cmt: Fixup for 64-bit machines
    0e8855ba9f9a tools: PCI: Fix compilation warnings
    9372023e10ee PM / hibernate: Check the success of generating md5 digest before hibernation
    ed896ddfae94 mtd: rawnand: sh_flctl: Use proper enum for flctl_dma_fifo0_transfer
    83cda9ea1876 ARM: dts: at91: sama5d2_ptc_ek: fix bootloader env offsets
    10551e574d79 ARM: dts: at91: at91sam9x5cm: fix addressable nand flash size
    825d176a1049 ARM: dts: at91: sama5d4_xplained: fix addressable nand flash size
    ab9928588283 powerpc/xive: Move a dereference below a NULL test
    38d7fa28157e powerpc/pseries: Fix how we iterate over the DTL entries
    a3576a228404 powerpc/pseries: Fix DTL buffer registration
    b28aa87d081c cxgb4: Use proper enum in IEEE_FAUX_SYNC
    efdacf2b7aa7 cxgb4: Use proper enum in cxgb4_dcb_handle_fw_update
    743ccf759e8e mei: samples: fix a signedness bug in amt_host_if_call()
    cc7d996a4428 x86/PCI: Apply VMD's AERSID fixup generically
    6cedfaffb4ac sunrpc: Fix connect metrics
    7e4602eac666 clk: keystone: Enable TISCI clocks if K3_ARCH
    6c487c0e877a ext4: fix build error when DX_DEBUG is defined
    f2877a3c332d ALSA: hda: Fix mismatch for register mask and value in ext controller.
    ae3765a0a33d dmaengine: timb_dma: Use proper enum in td_prep_slave_sg
    0c21aa9b5651 dmaengine: ep93xx: Return proper enum in ep93xx_dma_chan_direction
    671ce9f892b9 printk: CON_PRINTBUFFER console registration is a bit racy
    cd120df118d7 printk: Do not miss new messages when replaying the log
    5a6f7274e67b KVM: PPC: Inform the userspace about TCE update failures
    38374aa3c916 watchdog: w83627hf_wdt: Support NCT6796D, NCT6797D, NCT6798D
    96505abd2435 watchdog: sama5d4: fix timeout-sec usage
    26d6e542dc47 watchdog: renesas_wdt: stop when unregistering
    f4cfb7eeae62 watchdog: core: fix null pointer dereference when releasing cdev
    a9f36455edc1 irqchip/irq-mvebu-icu: Fix wrong private data retrieval
    be4f5457a5fd nl80211: Fix a GET_KEY reply attribute
    21ba66937e0d usb: dwc3: gadget: Check ENBLSLPM before sending ep command
    639fce0bc8b5 usb: gadget: udc: fotg210-udc: Fix a sleep-in-atomic-context bug in fotg210_get_status()
    f22a4d8cf049 selftests/tls: Fix recv(MSG_PEEK) & splice() test cases
    475398b72984 ath9k: fix reporting calculated new FFT upper max
    f6ec4fccbf9a PM / devfreq: stopping the governor before device_unregister()
    fc491a1e77be PM / devfreq: Fix handling of min/max_freq == 0
    b5add975c871 PM / devfreq: Fix devfreq_add_device() when drivers are built as modules.
    5f5a8d36749f ata: ahci_brcm: Allow using driver or DSL SoCs
    4cfcb5379a9c rtlwifi: btcoex: Use proper enumerated types for Wi-Fi only interface
    e5895e41aeb3 ath10k: fix vdev-start timeout on error
    06cb99e6399d arm64/numa: Report correct memblock range for the dummy node
    256a29480733 kvm: arm/arm64: Fix stage2_flush_memslot for 4 level page table
    bae080e72e92 iommu/arm-smmu-v3: Fix unexpected CMD_SYNC timeout
    2bab3df8f506 iommu/io-pgtable-arm: Fix race handling in split_blk_unmap()
    741a445a88e4 mt76: fix handling ps-poll frames
    ddb4299f1d78 mt76x2: disable WLAN core before probe
    b14825a5c652 mt76x2: fix tx power configuration for VHT mcs 9
    449b9ae3504c IB/hfi1: Ensure ucast_dlid access doesnt exceed bounds
    e0dee1c839e3 IB/hfi1: Error path MAD response size is incorrect
    8d93707e7195 f2fs: keep lazytime on remount
    a5f7bf0379d3 ACPI / LPSS: Resume BYT/CHT I2C controllers from resume_noirq
    aa39d53f2b89 ACPI / LPSS: Make acpi_lpss_find_device() also find PCI devices
    9372a40b54d0 SUNRPC: Fix priority queue fairness
    43876b1ce42b tcp: up initial rmem to 128KB and SYN rwin to around 64KB
    d2cacb6ac4ff ARM: dts: sun8i: h3: bpi-m2-plus: Fix address for external RGMII Ethernet PHY
    ed220d3dcc79 ARM: dts: sun8i: h3-h5: ir register size should be the whole memory block
    ac02379889e2 f2fs: return correct errno in f2fs_gc
    7cbac9d598a7 net: hns3: Fix loss of coal configuration while doing reset
    af98283da9e9 net: hns3: Fix for netdev not up problem when setting mtu
    7a1f314e3c80 ARM: dts: omap5: enable OTG role for DWC3 controller
    789d29044793 ARM: dts: dra7: Enable workaround for errata i870 in PCIe host mode
    6d286faeee74 net: xen-netback: fix return type of ndo_start_xmit function
    c234566f1ea0 net: ovs: fix return type of ndo_start_xmit function
    d51d9605888d bpf, x32: Fix bug for BPF_JMP | {BPF_JSGT, BPF_JSLE, BPF_JSLT, BPF_JSGE}
    f3c40792cf4b bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_K shift by 0
    a085f797449e bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_X shift by 0
    860a7d18b9e6 bpf, x32: Fix bug for BPF_ALU64 | BPF_NEG
    03543b9c5573 fbdev: Ditch fb_edid_add_monspecs
    703662598b9c arm64: uaccess: Ensure PAN is re-enabled after unhandled uaccess fault
    f8b09a043685 mm/memory_hotplug: fix updating the node span
    6631def3ee38 mm/memory_hotplug: don't access uninitialized memmaps in shrink_pgdat_span()
    a16a3669273b idr: Fix idr_get_next race with idr_remove
    4c62337d8f17 net: cdc_ncm: Signedness bug in cdc_ncm_set_dgram_size()
    17a82bc67728 Revert "OPP: Protect dev_list with opp_table lock"
    4f4ab0b49cf2 tee: optee: add missing of_node_put after of_device_is_available
    2008d0e3d364 i2c: mediatek: modify threshold passed to i2c_get_dma_safe_msg_buf()
    976e944e005f spi: mediatek: use correct mata->xfer_len when in fifo transfer
    c63ee2939dc1 Linux 4.19.85
    e99d64837815 slcan: Fix memory leak in error path
    e4cc9c81e230 memfd: Use radix_tree_deref_slot_protected to avoid the warning.
    914834a73b16 net: phy: mdio-bcm-unimac: mark PM functions as __maybe_unused
    2ed924f2782f s390/vdso: correct vdso mapping for compat tasks
    1b904b2eb9c1 media: ov2680: fix null dereference at power on
    0c3e32230bcc IB/iser: Fix possible NULL deref at iser_inv_desc()
    d7b412e1448e fuse: use READ_ONCE on congestion_threshold and max_background
    2e72489c822e usb: usbtmc: uninitialized symbol 'actual' in usbtmc_ioctl_clear
    eb9b6c203870 usb: xhci-mtk: fix ISOC error when interval is zero
    8ddec6aaad86 netfilter: masquerade: don't flush all conntracks if only one address deleted on device
    ba8c4cc746a5 rtc: armada38x: fix possible race condition
    44bb1b1256b5 rtc: tx4939: fixup nvmem name and register size
    e7ab2bab7e60 rtc: isl1208: avoid possible sysfs race
    70f0ead5c6af ARM: dts: lpc32xx: Fix SPI controller node names
    8e359bce724c arm64: dts: lg: Fix SPI controller node names
    f52a34b5b111 arm64: dts: amd: Fix SPI bus warnings
    b26edaa53496 scsi: NCR5380: Check for bus reset
    080b37aacd2b scsi: NCR5380: Handle BUS FREE during reselection
    aa45f4ab86a2 scsi: NCR5380: Don't call dsprintk() following reselection interrupt
    23635cf271a3 scsi: NCR5380: Don't clear busy flag when abort fails
    aeb0ed2e5bb9 scsi: NCR5380: Check for invalid reselection target
    98c6d8f8a401 scsi: NCR5380: Use DRIVER_SENSE to indicate valid sense data
    1a46e4d3da31 scsi: NCR5380: Withhold disconnect privilege for REQUEST SENSE
    624f60251f1a scsi: NCR5380: Have NCR5380_select() return a bool
    873506e566ef scsi: NCR5380: Clear all unissued commands on host reset
    fe5ef5fe3e19 iwlwifi: mvm: Allow TKIP for AP mode
    c4a3dcb0a273 iwlwifi: mvm: use correct FIFO length
    d395b6f51cf7 iwlwifi: pcie: fit reclaim msg to MAX_MSG_LEN
    08d2000d2162 iwlwifi: pcie: gen2: build A-MSDU only for GSO
    f4f0909f3d3f iwlwifi: api: annotate compressed BA notif array sizes
    e455ecaf52da iwlwifi: pcie: read correct prph address for newer devices
    c5eafde04ad3 iwlwifi: fix non_shared_ant for 22000 devices
    f73c75560ffd iwlwifi: dbg: don't crash if the firmware crashes in the middle of a debug dump
    98ca4f397feb crypto: fix a memory leak in rsa-kcs1pad's encryption mode
    975b3c8dd182 crypto: s5p-sss: Fix Fix argument list alignment
    ef089d9b58a7 crypto: s5p-sss: Fix race in error handling
    d34465e722e7 x86/hyperv: Suppress "PCI: Fatal: No config space access function found"
    23a4059cd6b8 Bluetooth: btrsi: fix bt tx timeout issue
    245b2765e87c Bluetooth: L2CAP: Detect if remote is not able to use the whole MPS
    2c8946462f07 Bluetooth: hci_serdev: clear HCI_UART_PROTO_READY to avoid closing proto races
    f416fe070ec1 firmware: dell_rbu: Make payload memory uncachable
    5d3675e3e6d1 ARM: dts: realview: Fix SPI controller node names
    57b78e41a397 EDAC: Raise the maximum number of memory controllers
    352668d32cd5 RDMA: Fix dependencies for rdma_user_mmap_io
    36ffc9a76df9 f2fs: mark inode dirty explicitly in recover_inode()
    a4bd303d6774 f2fs: fix to recover inode's project id during POR
    7bae8b6b73e4 f2fs: update i_size after DIO completion
    9de276a804c7 PCI/ERR: Run error recovery callbacks for all affected devices
    8738fd312e63 net: faraday: fix return type of ndo_start_xmit function
    8ff333f3f819 net: smsc: fix return type of ndo_start_xmit function
    4481669a3a95 ARM: dts: paz00: fix wakeup gpio keycode
    4e9cf62e8ffb ARM: tegra: colibri_t30: fix mcp2515 can controller interrupt polarity
    63c28c08e485 ARM: tegra: apalis_t30: fix mcp2515 can controller interrupt polarity
    2241b82d7b3f ARM: tegra: apalis_t30: fix mmc1 cmd pull-up
    1717eca134f2 ARM: dts: tegra20: restore address order
    619f46726e66 ARM: dts: tegra30: fix xcvr-setup-use-fuses
    70c4b0fb4fd5 arm64: tegra: I2C on Tegra194 is not compatible with Tegra114
    e821b710b58d ARM: dts: imx51-zii-rdu1: Fix the rtc compatible string
    a09b6731c4dd arm64: dts: fsl: Fix I2C and SPI bus warnings
    2d6b885ba741 phy: lantiq: Fix compile warning
    6fce50c100c8 f2fs: fix remount problem of option io_bits
    c4a33c4ecc1f scsi: libsas: always unregister the old device if going to discover new
    2f9d0f703b9c iw_cxgb4: Use proper enumerated type in c4iw_bar2_addrs
    1ae5bfee6cff vfio/pci: Mask buggy SR-IOV VF INTx support
    dde3433de9a0 vfio/pci: Fix potential memory leak in vfio_msi_cap_len
    86f886e91dcf vmbus: keep pointer to ring buffer page
    728a7552dc49 misc: genwqe: should return proper error value.
    6707b1ba53be misc: kgdbts: Fix restrict error
    890bee675729 silmbus: ngd: register controller after power up.
    932980ed5b77 slimbus: ngd: return proper error code instead of zero
    9874abd5c878 slimbus: ngd: register ngd driver only once.
    614744f4e80e coresight: dynamic-replicator: Handle multiple connections
    36aa9cd28c59 coresight: tmc: Fix byte-address alignment for RRP
    0bb87d413aef coresight: etm4x: Configure EL2 exception level when kernel is running in HYP
    a0e0ec0a5544 coresight: tmc-etr: Handle driver mode specific ETR buffers
    1099665125ed coresight: perf: Disable trace path upon source error
    87e382c3f706 coresight: perf: Fix per cpu path management
    25deeb3c1b9f coresight: Fix handling of sinks
    59a488998caf coresight: Use ERR_CAST instead of ERR_PTR
    240293e02123 usb: gadget: uvc: Only halt video streaming endpoint in bulk mode
    bb7c36e91d45 usb: gadget: uvc: Factor out video USB request queueing
    c4635c27d3ac ARM: dts: imx6ull: update vdd_soc voltage for 900MHz operating point
    a9c11660389c phy: phy-twl4030-usb: fix denied runtime access
    6e176dd0e4c2 phy: renesas: rcar-gen3-usb2: fix vbus_ctrl for role sysfs
    f0525581df5f phy: brcm-sata: allow PHY_BRCM_SATA driver to be built for DSL SoCs
    ff0eabfaf4a4 ARM: at91: pm: call put_device instead of of_node_put in at91_pm_config_ws
    1b23c28d87e7 gpiolib: Fix gpio_direction_* for single direction GPIOs
    ec0b30347e4a i2c: aspeed: fix invalid clock parameters for very large divisors
    de2875336ee8 ARM: dts: exynos: Correct audio subsystem parent clock on Peach Chromebooks
    4e6c65624090 usb: gadget: uvc: configfs: Sort frame intervals upon writing
    d036103870c6 usb: gadget: uvc: configfs: Prevent format changes after linking header
    e6e1ad1e2537 usb: gadget: uvc: configfs: Drop leaked references to config items
    b7ffda42d720 ARM: dts: rockchip: explicitly set vcc_sd0 pin to gpio on rk3188-radxarock
    0b08daf034cc media: davinci: Fix implicit enum conversion warning
    0994d0cb86ec media: au0828: Fix incorrect error messages
    0e63f5db54d8 media: pci: ivtv: Fix a sleep-in-atomic-context bug in ivtv_yuv_init()
    2dacea472335 media: imx: work around false-positive warning, again
    1b73ea8377da mlxsw: Make MLXSW_SP1_FWREV_MINOR a hard requirement
    9d2ce0611ad5 arm64: dts: rockchip: Fix microSD in rk3399 sapphire board
    46a9bbe9d579 MIPS: kexec: Relax memory restriction
    3b9528b302a6 EDAC: Correct DIMM capacity unit symbol
    e897dd4cfdde x86/CPU: Change query logic so CPUID is enabled before testing
    d26ad73be70f x86/CPU: Use correct macros for Cyrix calls
    fd3f592b2af6 net: freescale: fix return type of ndo_start_xmit function
    cab175f881c5 net: micrel: fix return type of ndo_start_xmit function
    590ee2e0aec7 net: phy: mdio-bcm-unimac: Allow configuring MDIO clock divider
    73cb54858021 samples/bpf: fix compilation failure
    3536c05af6f4 PCI/ERR: Use slot reset if available
    0729c5944eee PCI/AER: Don't read upstream ports below fatal errors
    f3f55d83ea0d PCI/AER: Take reference on error devices
    40ebd8b31fea bnx2x: Ignore bandwidth attention in single function mode
    0769f445afa4 ARM: dts: stm32: Fix SPI controller node names
    c6305dfb214b ARM: dts: clearfog: fix sdhci supply property name
    b939d8b914d8 ARM: dts: stm32: enable display on stm32mp157c-ev1 board
    098e12f385f9 x86/mce-inject: Reset injection struct after injection
    aa190837bec5 ARM: dts: marvell: Fix SPI and I2C bus warnings
    ccc8bf41dac8 crypto: arm/crc32 - avoid warning when compiling with Clang
    9e70da12d01f cpufeature: avoid warning when compiling with clang
    ad28c2ba4318 crypto: chacha20 - Fix chacha20_block() keystream alignment (again)
    af4749d23d46 spi: pic32: Use proper enum in dmaengine_prep_slave_rg
    c2f76a19fbc8 ARM: dts: ste: Fix SPI controller node names
    4d22878d5894 ARM: dts: ux500: Fix LCDA clock line muxing
    8be4d596d3f2 ARM: dts: ux500: Correct SCU unit address
    dfc81686a642 f2fs: fix to recover inode's uid/gid during POR
    c783946ea9b1 f2fs: avoid infinite loop in f2fs_alloc_nid
    caab324d1b01 ARM: dts: ti: Fix SPI and I2C bus warnings
    2cf6352a6d4c ARM: dts: am335x-evm: fix number of cpsw
    1eeee2fd2e0c PCI: portdrv: Initialize service drivers directly
    38bee3f3f280 mlxsw: spectrum: Init shaper for TCs 8..15
    636cbdec5cf4 brcmsmac: Use kvmalloc() for ucode allocations
    2980b6a81378 brcmfmac: increase buffer for obtaining firmware capabilities
    59d6e59f32cc s390/vdso: correct CFI annotations of vDSO functions
    84bfa03445bc s390/vdso: avoid 64-bit vdso mapping for compat tasks
    3d510bdf35c2 s390/zcrypt: enable AP bus scan without a valid default domain
    5e9923e85e1c usb: usbtmc: Fix ioctl USBTMC_IOCTL_ABORT_BULK_OUT
    92aeb3756c43 usb: chipidea: Fix otg event handler
    979f541851d9 usb: chipidea: imx: enable OTG overcurrent in case USB subsystem is already started
    b39e733da3f8 nfp: provide a better warning when ring allocation fails
    883843b5a912 net: hns3: Fix parameter type for q_id in hclge_tm_q_to_qs_map_cfg()
    a1b2c39f3ec7 net: hns3: Fix client initialize state issue when roce client initialize failed
    20f2b72faff0 net: hns3: Clear client pointer when initialize client failed or unintialize finished
    ae95237256de net: hns3: Fix cmdq registers initialization issue for vf
    110de23fc502 net: hns3: Fix for setting speed for phy failed problem
    bd23121daecf net: sun: fix return type of ndo_start_xmit function
    5d52c10c345d net: amd: fix return type of ndo_start_xmit function
    0cd3edaf82e6 net: broadcom: fix return type of ndo_start_xmit function
    63a0e0512dba net: xilinx: fix return type of ndo_start_xmit function
    df9f5c799d85 net: toshiba: fix return type of ndo_start_xmit function
    e50d7274104c net: marvell: fix return type of ndo_start_xmit function
    28fae2d588be net: mvpp2: fix the number of queues per cpu for PPv2.2
    0ede78b3576c power: supply: twl4030_charger: disable eoc interrupt on linear charge
    773fb69e4307 power: supply: twl4030_charger: fix charging current out-of-bounds
    0729f87b840a libfdt: Ensure INT_MAX is defined in libfdt_env.h
    e000de3f01c5 of/unittest: Fix I2C bus unit-address error
    4c64ce947cfa OPP: Protect dev_list with opp_table lock
    51e509caf5fa ARM: dts: atmel: Fix I2C and SPI bus warnings
    7cfb3b04d096 RDMA/i40iw: Fix incorrect iterator type
    eb355ccfdf1d powerpc: Fix duplicate const clang warning in user access code
    e7b37640916f powerpc/pseries: Disable CPU hotplug across migrations
    9271304c26fc powerpc/pseries/memory-hotplug: Only update DT once per memory DLPAR request
    0ab2545aa404 powerpc/64s/hash: Fix stab_rr off by one initialization
    a3581509e890 selftests/powerpc: Do not fail with reschedule
    089b169ceb80 powerpc/iommu: Avoid derefence before pointer check
    13d5bc50f405 net: ibm: fix return type of ndo_start_xmit function
    efe22c12087d net: cavium: fix return type of ndo_start_xmit function
    279a4f77546a net: hns3: fix return type of ndo_start_xmit function
    dd4b87a945c1 ipmi: fix return value of ipmi_set_my_LUN
    ea944c71360f ipmi:dmi: Ignore IPMI SMBIOS entries with a zero base address
    438bf726def0 ipmi_si: fix potential integer overflow on large shift
    78538bae1dab ipmi_si_pci: fix NULL device in ipmi_si error message
    5ab64c1633f6 ASoC: rt5682: Fix the boost volume at the begining of playback
    6237e9d0715a spi: mediatek: Don't modify spi_transfer when transfer.
    779c96ef3fac spi/bcm63xx-hsspi: keep pll clk enabled
    eaa4d5ac4403 samples/bpf: fix a compilation failure
    feb52253d738 arm64: dts: ti: k3-am65: Change #address-cells and #size-cells of interconnect to 2
    1ea4603cc812 tty: serial: qcom_geni_serial: Fix serial when not used as console
    87153f7a04c9 serial: mxs-auart: Fix potential infinite loop
    400caa3d02ea serial: samsung: Enable baud clock for UART reset procedure in resume
    30cfa3ebc0ed serial: uartps: Fix suspend functionality
    bad4e6d3d40d ARM: dts: xilinx: Fix I2C and SPI bus warnings
    d15e5038213e PCI: mediatek: Fix unchecked return value
    80ec7fcb04a0 net: socionext: Fix two sleep-in-atomic-context bugs in ave_rxfifo_reset()
    176f6203a4f4 PCI/ACPI: Correct error message for ASPM disabling
    525552a0e849 media: ov2680: don't register the v4l2 subdevice before checking chip ID
    f4683c89808f media: vsp1: Fix YCbCr planar formats pitch calculation
    ee5a1460f271 media: vsp1: Fix vsp1_regs.h license header
    2d7578285958 s390/qeth: invoke softirqs after napi_schedule()
    66fb291b264d s390/qeth: uninstall IRQ handler on device removal
    ccc1e600844d ath9k: Fix a locking bug in ath9k_add_interface()
    e97d09277b77 netfilter: nf_tables: avoid BUG_ON usage
    d1440f1a38eb ACPI / LPSS: Exclude I2C busses shared with PUNIT from pmc_atom_d3_mask
    75fd1aec33c6 arm64: dts: rockchip: Fix I2C bus unit-address error on rk3399-puma-haikou
    5fc9af407fc5 ARM: dts: rockchip: Fix erroneous SPI bus dtc warnings on rk3036
    0592c2178e3c scsi: ufshcd: Fix NULL pointer dereference for in ufshcd_init
    6745591c8da9 ip_gre: fix parsing gre header in ipgre_err
    ada2a0f1ac54 kernfs: Fix range checks in kernfs_get_target_path
    5fba81510697 component: fix loop condition to call unbind() if bind() fails
    925c19a8c6bb power: supply: max8998-charger: Fix platform data retrieval
    82d8a34470e9 power: reset: at91-poweroff: do not procede if at91_shdwc is allocated
    1fb3d279a384 power: supply: ab8500_fg: silence uninitialized variable warnings
    c9398259cf85 arm64: dts: meson: Fix erroneous SPI bus warnings
    89f4d27c1bcd blok, bfq: do not plug I/O if all queues are weight-raised
    6c9a79651bff block, bfq: inject other-queue I/O into seeky idle queues on NCQ flash
    6d7757f04866 arm64: fix for bad_mode() handler to always result in panic
    7f49a2210e85 cxgb4: Fix endianness issue in t4_fwcache()
    b0cb2d8164d0 android: binder: no outgoing transaction when thread todo has transaction
    31e470f92d9e ARM: dts: sun9i: Fix I2C bus warnings
    0989aa65bc37 pinctrl: at91: don't use the same irqchip with multiple gpiochips
    d1b9d321df35 ARM: dts: sunxi: Fix I2C bus warnings
    8ac08053744c ARM: dts: socfpga: Fix I2C bus unit-address error
    e70ccd8a13a9 powerpc/vdso: Correct call frame information
    11d7842812f8 ARM: dts: aspeed: Fix I2C bus warnings
    5a8130ed237f ARM: dts: bcm: Fix SPI bus warnings
    08ffefc8e7ed arm64: dts: broadcom: Fix I2C and SPI bus warnings
    174e8262f08a drivers: qcom: rpmh-rsc: clear wait_for_compl after use
    09c8a33ed766 soc: qcom: apr: Avoid string overflow
    6651ecf92f3c soc: qcom: wcnss_ctrl: Avoid string overflow
    4a2c4d1a0b6b soc: qcom: geni: geni_se_clk_freq_match() should always accept multiples
    331ed266987e soc: qcom: geni: Don't ignore clk_round_rate() errors in geni_se_clk_tbl_get()
    b0826d4774c2 ARM: dts: qcom: ipq4019: fix cpu0's qcom,saw2 reg value
    9a484516a410 llc: avoid blocking in llc_sap_close()
    50e40ebcaa32 pinctrl: at91-pio4: fix has_config check in atmel_pctl_dt_subnode_to_map()
    3f57f7387db2 arm64: dts: renesas: r8a77965: Fix clock/reset for usb2_phy1
    7ed1974d2b03 arm64: dts: renesas: r8a77965: Fix HS-USB compatible
    dc521bf8ffda arm64: dts: renesas: r8a77965: Attach the SYS-DMAC to the IPMMU
    1badf45f08b3 arm64: dts: renesas: salvator-common: adv748x: Override secondary addresses
    20f93eb9194c ALSA: intel8x0m: Register irq handler after register initializations
    e80e83fb0106 arm64: dts: meson-axg: use the proper compatible for ethmac
    2694107888a5 arm64: dts: meson: libretech: update board model
    3804f9dd8f76 net: bcmgenet: Fix speed selection for reverse MII
    914282c62ab2 media: dvb: fix compat ioctl translation
    03056f8c725a media: fix: media: pci: meye: validate offset to avoid arbitrary access
    fe384ab1496c ALSA: hda: Fix implicit definition of pci_iomap() on SH
    6281d021bbb3 media: dt-bindings: adv748x: Fix decimal unit addresses
    88e9f8198dd5 nvmem: core: return error code instead of NULL from nvmem_device_get
    b0d54e40f3c4 Drivers: hv: vmbus: Fix synic per-cpu context initialization
    a1d374ea1e95 net: aquantia: fix hw_atl_utils_fw_upload_dwords
    a9cab0fe6e26 kprobes: Don't call BUG_ON() if there is a kprobe in use on free list
    7aea0bd886ae scsi: pm80xx: Fixed system hang issue during kexec boot
    a66a544dca32 scsi: pm80xx: Corrected dma_unmap_sg() parameter
    ac892349e21b ARM: imx6: register pm_power_off handler if "fsl,pmic-stby-poweroff" is set
    86d5ceaea04c scsi: sym53c8xx: fix NULL pointer dereference panic in sym_int_sir()
    66b2e4c7afd0 scsi: lpfc: Fix errors in log messages.
    87c32dbd7eff scsi: lpfc: Correct invalid EQ doorbell write on if_type=6
    8caed6a5d385 scsi: lpfc: Fix GFT_ID and PRLI logic for RSCN
    050e019c2d69 scsi: qla2xxx: Fix duplicate switch's Nport ID entries
    c7ddd7ba1d05 scsi: qla2xxx: Fix dropped srb resource.
    8c32664a6a0d scsi: qla2xxx: Fix port speed display on chip reset
    3e3a2c5c4569 scsi: qla2xxx: Check for Register disconnect
    3a7ec92a5b2a scsi: qla2xxx: Increase abort timeout value
    5320b946687a scsi: qla2xxx: Fix deadlock between ATIO and HW lock
    6f6e01ff7413 scsi: qla2xxx: Terminate Plogi/PRLI if WWN is 0
    f91811dd9501 scsi: qla2xxx: Defer chip reset until target mode is enabled
    667bdc46aa4e scsi: qla2xxx: Fix iIDMA error
    ca35c5a1cb21 scsi: qla2xxx: Use correct qpair for ABTS/CMD
    a1f14df33c05 f2fs: fix setattr project check upon fssetxattr ioctl
    7b55102cdc61 f2fs: fix memory leak of percpu counter in fill_super()
    883037308018 f2fs: fix memory leak of write_io in fill_super()
    e5b515f56626 signal: Properly deliver SIGSEGV from x86 uprobes
    91c3a88054c1 signal: Properly deliver SIGILL from uprobes
    3b5681d39fa4 signal: Always ignore SIGKILL and SIGSTOP sent to the global init
    93ae4ded2abe IB/hfi1: Missing return value in error path for user sdma
    45d0ddf97448 RDMA/hns: Fix an error code in hns_roce_v2_init_eq_table()
    8edddc2cf3c1 dmaengine: at_xdmac: remove a stray bottom half unlock
    9234fbbd7782 ath9k: add back support for using active monitor interfaces for tx99
    82663f99cbdf rtc: pl030: fix possible race condition
    5a869e9828e8 rtc: mt6397: fix possible race condition
    0773f03aebdd EDAC, sb_edac: Return early on ADDRV bit and address type test
    fc7be6308364 dmaengine: dma-jz4780: Further residue status fix
    f6d4561cae3a dmaengine: dma-jz4780: Don't depend on MACH_JZ4780
    a34ea3ddc763 usb: mtu3: disable vbus rise/fall interrupts of ltssm
    a5d1ffee2f2f ARM: dts: exynos: Disable pull control for PMIC IRQ line on Artik5 board
    67e477d8eaa0 arm64: dts: rockchip: Fix VCC5V0_HOST_EN on rk3399-sapphire
    4c884128b414 firmware: arm_scmi: use strlcpy to ensure NULL-terminated strings
    d786bf93f0c5 sched/debug: Use symbolic names for task state constants
    e4e522609854 sched/debug: Explicitly cast sched_feat() to bool
    0ddcbbf4cd47 failover: Fix error return code in net_failover_create
    eca5b74e0080 f2fs: submit bio after shutdown
    0f9c9a216288 ARM: dts: omap3-gta04: keep vpll2 always on
    d59817b0ca62 ARM: dts: omap3-gta04: make NAND partitions compatible with recent U-Boot
    6b268c233df7 ARM: dts: omap3-gta04: fix touchscreen tsc2007
    96907aa1ab3c ARM: dts: omap3-gta04: tvout: enable as display1 alias
    8f03a5116e9d ARM: dts: omap3-gta04: fixes for tvout / venc
    5cacb026fe26 ARM: dts: omap3-gta04: give spi_lcd node a label so that we can overwrite in other DTS files
    69116e3bae2b of: make PowerMac cache node search conditional on CONFIG_PPC_PMAC
    cc5f462c1b08 ata: Disable AHCI ALPM feature for Ampere Computing eMAG SATA
    3d5d2f7806a9 ASoC: Intel: hdac_hdmi: Limit sampling rates at dai creation
    0376916b7b2c ASoC: dapm: Avoid uninitialised variable warning
    0204720dde67 udf: Fix crash during mount
    52cda4c1d9cd mips: txx9: fix iounmap related issue
    f63587cbb091 RDMA/core: Follow correct unregister order between sysfs and cgroup
    6b827d38cead RDMA/core: Rate limit MAD error messages
    a618cca0438b IB/ipoib: Ensure that MTU isn't less than minimum permitted
    2543eeba256a IB/mlx5: Don't hold spin lock while checking device state
    4d8d651e1c5f i2c: mediatek: Use DMA safe buffers for i2c transactions
    d0d8f0efb6bd ath10k: wmi: disable softirq's while calling ieee80211_rx
    14c9bc4be084 ARM: dts: exynos: Disable pull control for S5M8767 PMIC
    588822fcb313 ath10k: avoid possible memory access violation
    34293775f117 ASoC: sgtl5000: avoid division by zero if lo_vag is zero
    6cbd0932ab9a rtnetlink: move type calculation out of loop
    4b702fdd6e7e net: lan78xx: Bail out if lan78xx_get_endpoints fails
    23ad83c399b0 f2fs: avoid wrong decrypted data from disk
    b6410b95c224 cfg80211: validate wmm rule when setting
    8d705195a9a3 mac80211: fix saving a few HE values
    4d146d72687e qxl: fix null-pointer crash during suspend
    f5ee703ff92c IB/mlx5: Change TX affinity assignment in RoCE LAG mode
    5128ea974c22 mtd: rawnand: qcom: don't include dma-direct.h
    d6ebf70120c6 mtd: rawnand: fsl_ifc: fixup SRAM init for newer ctrl versions
    29535bafb64b mtd: rawnand: fsl_ifc: check result of SRAM initialization
    6ae8c86ee458 mtd: rawnand: marvell: use regmap_update_bits() for syscon access
    6c7644ad22ae ARM: dts: meson8b: fix the clock controller register size
    e39779f6ea67 ARM: dts: meson8: fix the clock controller register size
    6da9a4a98215 net: phy: mscc: read 'vsc8531, edge-slowdown' as an u32
    77f9e263e296 net: phy: mscc: read 'vsc8531,vddmac' as an u32
    5dc1cbcff700 net/mlx5: Fix atomic_mode enum values
    b5f6d6de5b12 net: hns3: Change the dst mac addr of loopback packet
    f995b2efa439 net: hns3: Fix for loopback selftest failed problem
    d01caf35564c net: hns3: Fix error of checking used vlan id
    4aea8f76727e net: hns3: Fix for multicast failure
    e5f48f8eff66 ASoC: rsnd: ssi: Fix issue in dma data address assignment
    0b8e8bddc5c0 soc: imx: gpc: fix PDN delay
    7f88d806443f mt76: Fix comparisons with invalid hardware key index
    1f54ec5b3047 brcmfmac: fix wrong strnchr usage
    f05f8607622c mwifex: free rx_cmd skb in suspended state
    6c27b9267a84 mwifiex: do no submit URB in suspended state
    cd554b025c09 rtl8187: Fix warning generated when strncpy() destination length matches the sixe argument
    c495a8c78b50 ARM: dts: pxa: fix power i2c base address
    72e13203c56d ARM: dts: pxa: fix the rtc controller
    fe9048c7bb38 media: ov772x: Disable clk on error path
    b489c1e010e4 media: i2c: Fix pm_runtime_get_if_in_use() usage in sensor drivers
    5a21c7a0b592 media: vicodec: fix out-of-range values when decoding
    17743861edc7 iwlwifi: mvm: avoid sending too many BARs
    75de80e11e6b iwlwifi: don't WARN on trying to dump dead firmware
    ecedae02e89d iwlwifi: drop packets with bad status in CD
    02adbecf542e IB/rxe: fixes for rdma read retry
    cad889676bdb IB/rxe: avoid back-to-back retries
    ac0ab821c4d5 i40e: Prevent deleting MAC address from VF when set by PF
    712d35e0d2c1 i40evf: cancel workqueue sync for adminq when a VF is removed
    e5d3afbe3a5c i40e: hold the rtnl lock on clearing interrupt scheme
    f9a84bbd3ca6 i40evf: Don't enable vlan stripping when rx offload is turned on
    fe301cf64f7e i40e: Check and correct speed values for link on open
    8d7e6ab3b5d2 i40evf: set IFF_UNICAST_FLT flag for the VF
    015fc5251996 i40e: use correct length for strncpy
    a90fcbdb9b22 i40evf: Validate the number of queues a PF sends
    2da61f212f4d ARM: dts: exynos: Fix regulators configuration on Peach Pi/Pit Chromebooks
    d4e5c8aeb198 arm64: dts: stratix10: i2c clock running out of spec
    b0bac46b52a9 liquidio: fix race condition in instruction completion processing
    b2e427c268f3 ARM: dts: exynos: Fix sound in Snow-rev5 Chromebook
    0b53b56287ab ARM: dts: exynos: Fix HDMI-HPD line handling on Arndale
    0baa3fe5805e ARM: dts: exynos: Use i2c-gpio for HDMI-DDC on Arndale
    8e6acc5ee14d MIPS: BCM47XX: Enable USB power on Netgear WNDR3400v3
    7c68184fced7 pinctrl: ingenic: Probe driver at subsys_initcall
    8ddea21d4c0b ASoC: AMD: Change MCLK to 48Mhz
    bdb7368ac333 ASoC: meson: axg-fifo: report interrupt request failure
    aac9381b2ca8 ASoC: dpcm: Properly initialise hw->rate_max
    ac66c0c470a3 ASoC: dapm: Don't fail creating new DAPM control on NULL pinctrl
    d3a45d4d6f2d ice: Fix and update driver version string
    48b128cddb91 gfs2: Don't set GFS2_RDF_UPTODATE when the lvb is updated
    9ca72984d7c0 ice: Prevent control queue operations during reset
    a881088f512e ice: Update request resource command to latest specification
    f71230e6898e ath10k: limit available channels via DT ieee80211-freq-limit
    8cad5d80f8d0 wil6210: fix invalid memory access for rx_buff_mgmt debugfs
    bcaabaa75eeb wil6210: prevent usage of tx ring 0 for eDMA
    acf041edec0a wil6210: set edma variables only for Talyn-MB devices
    be039c973093 wil6210: drop Rx multicast packets that are looped-back to STA
    1b0581bf379f ath9k: fix tx99 with monitor mode interface
    a618e2069783 ath10k: skip resetting rx filter for WCN3990
    f7b2312c68a8 ALSA: seq: Do error checks at creating system ports
    c2f459d3340f cfg80211: Avoid regulatory restore when COUNTRY_IE_IGNORE is set
    d377d63a9228 extcon: cht-wc: Return from default case to avoid warnings
    7575a34ed101 remoteproc/davinci: Use %zx for formating size_t
    c2dca83e9e83 rtc: rv8803: fix the rv8803 id in the OF table
    5a408693b414 rtc: sysfs: fix NULL check in rtc_add_groups()
    a01d6a320440 ARM: dts: at91/trivial: Fix USART1 definition for at91sam9g45
    ea6a25cd2d41 ARM: dts: rcar: Correct SATA device sizes to 2 MiB
    32d3fe68d20e y2038: make do_gettimeofday() and get_seconds() inline
    5a830803b593 arm64: dts: tegra210-p2180: Correct sdmmc4 vqmmc-supply
    a124e7f2fecf soc/tegra: pmc: Fix pad voltage configuration for Tegra186
    90cfef191a30 ALSA: pcm: signedness bug in snd_pcm_plug_alloc()
    e84cb5882da6 arm64: dts: allwinner: a64: NanoPi-A64: Fix DCDC1 voltage
    3bbce894d52d arm64: dts: allwinner: a64: Olinuxino: fix DRAM voltage
    d304218f959e arm64: dts: allwinner: a64: Orange Pi Win: Fix SD card node
    030f6397eb89 soundwire: intel: Fix uninitialized adev deref
    4b4153b7d6af soundwire: Initialize completion for defer messages
    38d1ecc23e3e clk: sunxi-ng: h6: fix PWM gate/reset offset
    6c0fcc727ff0 iio: dac: mcp4922: fix error handling in mcp4922_write_raw
    f125d1831402 ath10k: fix kernel panic by moving pci flush after napi_disable
    75a600d7f062 tee: optee: take DT status property into account
    cd3de5870c80 iio: adc: max9611: explicitly cast gain_selectors
    a6bb63183de2 mmc: sdhci-of-at91: fix quirk2 overwrite
    b4bc6498c39b mm: hugetlb: switch to css_tryget() in hugetlb_cgroup_charge_cgroup()
    bb1bc2d8231c mm: memcg: switch to css_tryget() in get_mem_cgroup_from_mm()
    653d9e0c55bf mm: mempolicy: fix the wrong return value and potential pages leak of mbind
    5b1c342fc3e0 iommu/vt-d: Fix QI_DEV_IOTLB_PFSID and QI_DEV_EIOTLB_PFSID macros
    29dcbbb5ab0a net: ethernet: dwmac-sun8i: Use the correct function in exit path
    bdae2f7b2031 ecryptfs_lookup_interpose(): lower_dentry->d_parent is not stable either
    beb3860c2e0e ecryptfs_lookup_interpose(): lower_dentry->d_inode is not stable
    1a48aaabf1cd i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is present
    9ace24bba657 IB/hfi1: Use a common pad buffer for 9B and 16B packets
    6ec4a5498ee5 IB/hfi1: Ensure full Gen3 speed in a Gen4 system
    1f3bbf9f0adc Input: synaptics-rmi4 - destroy F54 poller workqueue when removing
    5c9fd709c5f5 Input: synaptics-rmi4 - clear IRQ enables for F54
    fbe9849f79aa Input: synaptics-rmi4 - do not consume more data than we have (F11, F12)
    924a8f2c745a Input: synaptics-rmi4 - disable the relative position IRQ in the F12 driver
    8e347aa4e04b Input: synaptics-rmi4 - fix video buffer size
    c02230815282 Input: ff-memless - kill timer in destroy()
    47d06a15f25a Btrfs: fix log context list corruption after rename exchange operation
    f2465526866a ALSA: usb-audio: Fix incorrect size check for processing/extension units
    420433f6cf5c ALSA: usb-audio: Fix incorrect NULL check in create_yamaha_midi_quirk()
    ab2ee4299b7e ALSA: usb-audio: not submit urb for stopped endpoint
    a2c763cd9609 ALSA: usb-audio: Fix missing error check at mixer resolution test
    edc471038b48 slip: Fix memory leak in slip_open error path
    4cd50a31ac9e net: usb: qmi_wwan: add support for Foxconn T77W968 LTE modules
    0a772b2ac696 net: gemini: add missed free_netdev
    66daa05750a9 ipmr: Fix skb headroom in ipmr_get_route().
    20beeb30083e ax88172a: fix information leak on short answers
    c4a0f567e652 scsi: core: Handle drivers which set sg_tablesize to zero
    81adf034d5d6 MIPS: BCM63XX: fix switch core reset on BCM6368
    dbf1ef2dc0d5 KVM: x86: introduce is_pae_paging

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 064811c18fe26c7d9bc84f86047325e25e2a1001)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 7e944cca62851689f9ddf8a5308ee3331f763957)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index f588d7f522..7b89a24223 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f272b39688fbec016d91b5c0c9d1bb7b5bc3b2ca"
-SRCREV_meta ?= "e3efe5a5f9ded629a0df5e6b42eaddfab0ec2891"
+SRCREV_machine ?= "d3fb163023de0a5a57a021e58b55976f68142fc0"
+SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.84"
+LINUX_VERSION ?= "4.19.87"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 0f3b0d569b..9cde2c2342 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.84"
+LINUX_VERSION ?= "4.19.87"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d971adf5221e18df3ba46bddee4719c85f98977a"
-SRCREV_machine ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
-SRCREV_meta ?= "e3efe5a5f9ded629a0df5e6b42eaddfab0ec2891"
+SRCREV_machine_qemuarm ?= "6e7574e9a9b41143e0c42fcb31b13802529602f0"
+SRCREV_machine ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 17620c74b5..aab30a981e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "425023bd5cfe4f4f7b950c84f62861de600d4f6c"
-SRCREV_machine_qemuarm64 ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
-SRCREV_machine_qemumips ?= "6273d88ca69ada3ae4684fc6301e39381f4cd3e4"
-SRCREV_machine_qemuppc ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
-SRCREV_machine_qemux86 ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
-SRCREV_machine_qemux86-64 ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
-SRCREV_machine_qemumips64 ?= "f9368853646be5ce9f122adb733cbf8225641e8c"
-SRCREV_machine ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
-SRCREV_meta ?= "e3efe5a5f9ded629a0df5e6b42eaddfab0ec2891"
+SRCREV_machine_qemuarm ?= "4d9d89763cde098e4a8b879e8c831e35a5f39ae6"
+SRCREV_machine_qemuarm64 ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_machine_qemumips ?= "1f0855745653c8cb7d72ea2d03197889cc82a410"
+SRCREV_machine_qemuppc ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_machine_qemux86 ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_machine_qemux86-64 ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_machine_qemumips64 ?= "5ed73d6e6dc7d4ad8184de8eb6641bdb265ae2ea"
+SRCREV_machine ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.84"
+LINUX_VERSION ?= "4.19.87"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


