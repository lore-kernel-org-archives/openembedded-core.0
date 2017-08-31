Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35DF96FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7VJVCPT022233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 12:31:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:31:03 -0400
Message-ID: <a620173eda7ed13300dca4263ae8b4812a97333c.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/4.9: update to v4.9.46
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:12 -0000
Content-Type: text/plain

Integrating the korg -stable releases with the following commit summary:

   0eed54bdbd1b Linux 4.9.46
   5aa523a994d1 powerpc/mm: Ensure cpumask update is ordered
   5906715b93da ACPI: EC: Fix regression related to wrong ECDT initialization order
   3bc8e4f96fe9 ACPI / APEI: Add missing synchronize_rcu() on NOTIFY_SCI removal
   454cac5d0891 ACPI: ioapic: Clear on-stack resource before using it
   c1628774f0c8 ntb: transport shouldn't disable link due to bogus values in SPADs
   4d4f35473d8f ntb: ntb_test: ensure the link is up before trying to configure the mws
   7592db555524 ntb: no sleep in ntb_async_tx_submit
   bff04a462da3 NTB: ntb_test: fix bug printing ntb_perf results
   471954c313c5 ntb_transport: fix bug calculating num_qps_mw
   4743d1b37a38 ntb_transport: fix qp count bug
   b8fce38266db Clarify (and fix) MAX_LFS_FILESIZE macros
   ab4be3a64d06 staging: rtl8188eu: add RNX-N150NUB support
   23caaf2f216c iio: hid-sensor-trigger: Fix the race with user space powering up sensors
   b150ee066af7 iio: imu: adis16480: Fix acceleration scale factor for adis16480
   cbd854d99354 ANDROID: binder: fix proc->tsk check.
   8fb0b0ce288d binder: Use wake up hint for synchronous transactions.
   51050750181c binder: use group leader instead of open thread
   eda70a559187 Revert "android: binder: Sanity check at binder ioctl"
   242cea2d666f Bluetooth: bnep: fix possible might sleep error in bnep_session
   ffb7640acbc3 Bluetooth: cmtp: fix possible might sleep error in cmtp_session
   1b5fcb3b25f7 Bluetooth: hidp: fix possible might sleep error in hidp_session_thread
   5f81b1f51b9c netfilter: nat: fix src map lookup
   090911a22c7b Revert "leds: handle suspend/resume in heartbeat trigger"
   d4c5c26c5f09 net: sunrpc: svcsock: fix NULL-pointer exception
   3559de45c99a x86/mm: Fix use-after-free of ldt_struct
   70b3fd5ce2ce timers: Fix excessive granularity of new timers after a nohz idle
   3df3b2efc065 perf/x86/intel/rapl: Make package handling more robust
   bac83e5ce85e perf probe: Fix --funcs to show correct symbols for offline module
   bde6608dd638 perf/core: Fix group {cpu,task} validation
   741397d16a3d ftrace: Check for null ret_stack on profile function graph entry function
   fd8235e721ef nfsd: Limit end of page list when decoding NFSv4 WRITE
   5ed70f7db9af cifs: return ENAMETOOLONG for overlong names in cifs_open()/cifs_lookup()
   8b053290ee20 cifs: Fix df output for users with quota limits
   1fdee09116db kbuild: linker script do not match C names unless LD_DEAD_CODE_DATA_ELIMINATION is configured
   8838cd5c543f tracing: Fix freeing of filter in create_filter() when set_str is false
   2818a7659f0a tracing: Fix kmemleak in tracing_map_array_free()
   3170d9abc5d0 tracing: Call clear_boot_tracer() at lateinit_sync
   46cd0a3b93a5 drm: rcar-du: Fix H/V sync signal polarity configuration
   1fb8ff8b92bd drm: rcar-du: Fix display timing controller parameter
   35fd2b840b6c drm: rcar-du: Fix crash in encoder failure error path
   eed96e759533 drm/atomic: If the atomic check fails, return its value first
   ce66f629ad82 drm: Release driver tracking before making the object available again
   9d263321d7a2 mm/memblock.c: reversed logic in memblock_discard()
   b65b6ac52e0f fork: fix incorrect fput of ->exe_file causing use-after-free
   0f49b0519f11 mm/madvise.c: fix freeing of locked page with MADV_FREE
   036c100b58f7 i2c: designware: Fix system suspend
   5d8b3cc24688 mm, shmem: fix handling /sys/kernel/mm/transparent_hugepage/shmem_enabled
   8d362cb3bfbb ARCv2: PAE40: Explicitly set MSB counterpart of SLC region ops addresses
   6cba07468521 ALSA: firewire: fix NULL pointer dereference when releasing uninitialized data of iso-resource
   b52bce93db99 ALSA: hda - Add stereo mic quirk for Lenovo G50-70 (17aa:3978)
   8989c70d30b6 ALSA: core: Fix unexpected error at replacing user TLV
   9767a4567831 ALSA: usb-audio: Add delay quirk for H650e/Jabra 550a USB headsets
   275f3033ccf6 KVM: x86: block guest protection keys unless the host has them enabled
   cfb917a17d3d KVM: s390: sthyi: fix specification exception detection
   a745333fa924 KVM: s390: sthyi: fix sthyi inline assembly
   963068b1ff1c Input: ALPS - fix two-finger scroll breakage in right side on ALPS touchpad
   9ab605d2bb6f Input: elan_i2c - add ELAN0602 ACPI ID to support Lenovo Yoga310
   a00a9cd7daf9 Input: trackpoint - add new trackpoint firmware ID
   655da3da9bb3 bpf/verifier: fix min/max handling in BPF_SUB
   bf5b91b782e8 bpf: fix mixed signed/unsigned derived min/max value bounds
   8d674bee8f66 bpf, verifier: fix alu ops against map_value{, _adj} register types
   577aa83b2896 bpf: adjust verifier heuristics
   e37bdeee95a4 bpf, verifier: add additional patterns to evaluate_reg_imm_alu
   7fa2fdf9f19e net_sched: fix order of queue length updates in qdisc_replace()
   3e00bf91fefc net: sched: fix NULL pointer dereference when action calls some targets
   f3f5bf2755c7 irda: do not leak initialized list.dev to userspace
   19f433a9ce9d net/mlx4_core: Enable 4K UAR if SRIOV module parameter is not enabled
   aadbe1fe91e7 tcp: when rearming RTO, if RTO time is in past then fire RTO ASAP
   1c18f9367520 ipv6: repair fib6 tree in failure case
   62e9a28baa28 ipv6: reset fn->rr_ptr when replacing route
   7ad5fb9594ee tipc: fix use-after-free
   0f5ecc79194d sctp: fully initialize the IPv6 address in sctp_v6_to_addr()
   57406e737322 nfp: fix infinite loop on umapping cleanup
   f29c9f46af4a ipv4: better IP_MAX_MTU enforcement
   59af5b87695d ptr_ring: use kmalloc_array()
   3c7af814def8 openvswitch: fix skb_panic due to the incorrect actions attrlen
   d6a6b6b4c3ba bpf: fix bpf_trace_printk on 32 bit archs
   792c0707bd3f net_sched: remove warning from qdisc_hash_add
   38530f6e6dae net_sched/sfq: update hierarchical backlog when drop packet
   71501d9b6190 ipv4: fix NULL dereference in free_fib_info_rcu()
   236b0d939b05 dccp: defer ccid_hc_tx_delete() at dismantle time
   b31cbe2c3916 dccp: purge write queue in dccp_destroy_sock()
   2e3f17f81029 af_key: do not use GFP_KERNEL in atomic contexts
   d0526eef0bf7 sparc64: remove unnecessary log message
   4b904b22bc90 Linux 4.9.45
   083d423b1f8a usb: qmi_wwan: add D-Link DWM-222 device ID
   edfe57b2f44a usb: optimize acpi companion search for usb port devices
   322cd3262365 pids: make task_tgid_nr_ns() safe
   61332dc598c3 Sanitize 'move_pages()' permission checks
   f9497d51259f genirq/ipi: Fixup checks against nr_cpu_ids
   762ac49ccece genirq: Restore trigger settings in irq_modify_status()
   4691f1ca6fad irqchip/atmel-aic: Fix unbalanced refcount in aic_common_rtc_irq_fixup()
   665d2009a4af irqchip/atmel-aic: Fix unbalanced of_node_put() in aic_common_irq_fixup()
   10d5bf2f6928 x86/asm/64: Clear AC on NMI entries
   1581d704e97d xen-blkfront: use a right index when checking requests
   7672f1186047 powerpc: Fix VSX enabling/flushing to also test MSR_FP and MSR_VEC
   d8c20af00858 blk-mq-pci: add a fallback when pci_irq_get_affinity returns NULL
   6c7f3756d072 xen: fix bio vec merging
   1f2347a095ce mm: revert x86_64 and arm64 ELF_ET_DYN_BASE base changes
   91105f2c621e mm/mempolicy: fix use after free when calling get_mempolicy
   59ee25d09fd5 mm: fix double mmap_sem unlock on MMF_UNSTABLE enforced SIGBUS
   87395eeb28e5 mm: discard memblock data later
   d3e6e5956687 ALSA: usb-audio: Add mute TLV for playback volumes on C-Media devices
   f39f086d541f ALSA: usb-audio: Apply sample rate quirk to Sennheiser headset
   bafb25c5050c ALSA: seq: 2nd attempt at fixing race creating a queue
   3f7292106d0b Input: elan_i2c - Add antoher Lenovo ACPI ID for upcoming Lenovo NB
   5dd141e0e985 Input: elan_i2c - add ELAN0608 to the ACPI table
   c3e8a12e701c crypto: x86/sha1 - Fix reads beyond the number of blocks passed
   24e7f540245d crypto: ixp4xx - Fix error handling path in 'aead_perform()'
   93f5a0318aae parisc: pci memory bar assignment fails with 64bit kernels on dino/cujo
   adcfbb2d9e38 audit: Fix use after free in audit_remove_watch_rule()
   5170d210efe4 netfilter: nf_ct_ext: fix possible panic after nf_ct_extend_unregister
   a97a16f18c48 Linux 4.9.44
   eea1ec08f8a5 MIPS: DEC: Fix an int-handler.S CPU_DADDI_WORKAROUNDS regression
   5e5a51045532 pinctrl: meson-gxbb: Add missing GPIODV_18 pin entry
   8cbc0b49ca8d pinctrl: samsung: Remove bogus irq_[un]mask from resource management
   8495ab6ef94a pinctrl: uniphier: fix WARN_ON() of pingroups dump on LD20
   f642d29c2388 pinctrl: uniphier: fix WARN_ON() of pingroups dump on LD11
   877fe62863d0 pinctrl: intel: merrifield: Correct UART pin lists
   7b6fff65ecf9 pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
   a68978bb949a pnfs/blocklayout: require 64-bit sector_t
   eda1b3d42fad iio: adc: vf610_adc: Fix VALT selection value for REFSEL bits
   4cae4a23d9a4 usb:xhci:Add quirk for Certain failing HP keyboard on reset after resume
   f4bbed570aef usb: quirks: Add no-lpm quirk for Moshi USB to Ethernet Adapter
   42d65cc89a23 usb: core: unlink urbs from the tail of the endpoint's urb_list
   7c2beb1c4432 USB: Check for dropped connection before switching to full speed
   7f737f10c1ee usb: renesas_usbhs: Fix UGCTRL2 value for R-Car Gen3
   2db03a7fa0dd usb: gadget: udc: renesas_usb3: Fix usb_gadget_giveback_request() calling
   a09ecc9345b6 uas: Add US_FL_IGNORE_RESIDUE for Initio Corporation INIC-3069
   b189f8eb2715 staging: comedi: comedi_fops: do not call blocking ops when !TASK_RUNNING
   bbae08213e6e iio: light: tsl2563: use correct event code
   1ca3869234d3 iio: accel: bmc150: Always restore device to normal mode after suspend-resume
   c5347390e57a staging:iio:resolver:ad2s1210 fix negative IIO_ANGL_VEL read
   199a3f26e9d8 USB: hcd: Mark secondary HCD as dead if the primary one died
   821ccbe2937e usb: musb: fix tx fifo flush handling again
   4fd8c366acac USB: serial: pl2303: add new ATEN device id
   566516401501 USB: serial: cp210x: add support for Qivicon USB ZigBee dongle
   e27f58cd130b USB: serial: option: add D-Link DWM-222 device ID
   2b3bf207b2a2 drm/i915: Fix out-of-bounds array access in bdw_load_gamma_lut
   4381e2c30008 drm/etnaviv: Fix off-by-one error in reloc checking
   00f3c2a253f7 nfs/flexfiles: fix leak of nfs4_ff_ds_version arrays
   0a205d8145c2 mmc: mmc: correct the logic for setting HS400ES signal voltage
   160c365b5879 nand: fix wrong default oob layout for small pages using soft ecc
   227559e6233c fuse: initialize the flock flag in fuse_file on allocation
   1da30c23b63b target: Fix node_acl demo-mode + uncached dynamic shutdown regression
   b51a71635576 iscsi-target: Fix iscsi_np reset hung task during parallel delete
   e6a0599b7464 iscsi-target: fix memory leak in iscsit_setup_text_cmd()
   ced271b814e4 mtd: nand: Fix timing setup for NANDs that do not support SET FEATURES
   a311810903c7 xtensa: don't limit csum_partial export by CONFIG_NET
   a3ab0f069f46 xtensa: mm/cache: add missing EXPORT_SYMBOLs
   03973c57e1a2 xtensa: fix cache aliasing handling code for WT cache
   0041042de554 futex: Remove unnecessary warning from get_futex_key
   e2286916ac07 mm: fix list corruptions on shmem shrinklist
   b56cd77c1205 mm: ratelimit PFNs busy info message
   6da35f43acde Linux 4.9.43
   1166e3e03342 Revert "ARM: dts: sun8i: Support DTB build for NanoPi M1"
   3f0075cdbdd8 KVM: arm/arm64: Handle hva aging while destroying the vm
   6309eb77d823 sparc64: Prevent perf from running during super critical sections
   33dc6a6a85f1 udp: consistently apply ufo or fragmentation
   4688f042599f revert "ipv4: Should use consistent conditional judgement for ip fragment in __ip_append_data and ip_finish_output"
   53eed8aadc58 revert "net: account for current skb length when deciding about UFO"
   e58413550613 packet: fix tp_reserve race in packet_set_ring
   f628c9df047b igmp: Fix regression caused by igmp sysctl namespace code.
   69ffc9644ffe net: avoid skb_warn_bad_offload false positives on UFO
   87fdcfe21195 tcp: fastopen: tcp_connect() must refresh the route
   e392e305af01 net: sched: set xt_tgchk_param par.nft_compat as 0 in ipt_init_target
   35d90144e2ce net/mlx4_en: don't set CHECKSUM_COMPLETE on SCTP packets
   1b582a2c366d bpf, s390: fix jit branch offset related to ldimm64
   05046af36302 net: fix keepalive code vs TCP_FASTOPEN_CONNECT
   3914a7eccbc7 tcp: avoid setting cwnd to invalid ssthresh after cwnd reduction states
   6ec6ec3bbb87 ppp: fix xmit recursion detection on ppp channels
   3b25bfc11cf9 ppp: Fix false xmit recursion detect with two ppp devices
   4c666b0d9070 Linux 4.9.42
   f9636c9bdd58 workqueue: implicit ordered attribute should be overridable
   c3c94716855a net: phy: Fix PHY unbind crash
   ef09c9ff3431 net: account for current skb length when deciding about UFO
   f102bb7164c9 ipv4: Should use consistent conditional judgement for ip fragment in __ip_append_data and ip_finish_output
   a69f0d54fdc9 net/mlx5: E-Switch, Re-enable RoCE on mode change only after FDB destroy
   22cccef1fc70 mm: don't dereference struct page fields of invalid pages
   916a05b90d83 signal: protect SIGNAL_UNKILLABLE from unintentional clearing.
   d12824c897a2 lib/Kconfig.debug: fix frv build failure
   c736011052cf mm, slab: make sure that KMALLOC_MAX_SIZE will fit into MAX_ORDER
   bebbe845cb50 ARM: 8632/1: ftrace: fix syscall name matching
   e6d53f5f8c03 virtio_blk: fix panic in initialization error path
   952d07ac1e6e nbd: blk_mq_init_queue returns an error code on failure, not NULL
   44d52834efb3 iw_cxgb4: do not send RX_DATA_ACK CPLs after close/abort
   984922f2c897 ARM: dts: sunxi: Change node name for pwrseq pin on Olinuxino-lime2-emmc
   1e9e71782f34 ARM: dts: sun8i: Support DTB build for NanoPi M1
   61cf0afe12eb drm/virtio: fix framebuffer sparse warning
   2a60965a0ef7 scsi: qla2xxx: Get mutex lock before checking optrom_state
   99eb27d6182d clk/samsung: exynos542x: mark some clocks as critical
   ee96797b78ca ipv4: make tcp_notsent_lowat sysctl knob behave as true unsigned int
   0bbbbaef6aa0 phy state machine: failsafe leave invalid RUNNING state
   9acfb313849e netfilter: use fwmark_reflect in nf_send_reset
   2e2a390b7f67 ASoC: rt5645: set sel_i2s_pre_div1 to 2
   c77512d67102 spi: spi-axi: Free resources on error path
   f897e9ae07c4 x86/boot: Add missing declaration of string functions
   1042bd47ddfb tg3: Fix race condition in tg3_get_stats64().
   5f7eeee7940e net: phy: dp83867: fix irq generation
   bfe384ed452a sh_eth: R8A7740 supports packet shecksumming
   2d4fef7f4102 sh_eth: fix EESIPR values for SH77{34|63}
   b87145215abe wext: handle NULL extra data in iwe_stream_add_point better
   b9d68cdce72d sparc64: Fix exception handling in UltraSPARC-III memcpy.
   bfafa56e6c67 sparc64: Measure receiver forward progress to avoid send mondo timeout
   816843a257c7 xen-netback: correctly schedule rate-limited queues
   38e71eabb8f7 net: phy: Correctly process PHY_HALTED in phy_stop_machine()
   33e25b2168dd net/mlx5e: Schedule overflow check work to mlx5e workqueue
   862ade9a4383 net/mlx5e: Fix wrong delay calculation for overflow check scheduling
   d7049799668a net/mlx5e: Fix outer_header_zero() check size
   d19d0ac684e5 net/mlx5: Fix command bad flow on command entry allocation failure
   fca84d617f77 net/mlx5: Consider tx_enabled in all modes on remap
   df32d08293ea sctp: fix the check for _sctp_walk_params and _sctp_walk_errors
   cc6f1486f2cb sctp: don't dereference ptr before leaving _sctp_walk_{params, errors}()
   bb21d2e75378 dccp: fix a memleak for dccp_feat_init err process
   4d938b6fcb90 dccp: fix a memleak that dccp_ipv4 doesn't put reqsk properly
   9ffa6727f571 dccp: fix a memleak that dccp_ipv6 doesn't put reqsk properly
   c0c8688f0deb net: ethernet: nb8800: Handle all 4 RGMII modes identically
   23a91c8ab682 ipv6: Don't increase IPSTATS_MIB_FRAGFAILS twice in ip6_fragment()
   47f3bf6e3116 packet: fix use-after-free in prb_retire_rx_blk_timer_expired()
   d53ff3816d94 openvswitch: fix potential out of bound access in parse_ct
   59e76ed17981 mcs7780: Fix initialization when CONFIG_VMAP_STACK is enabled
   cda2bc91baf7 rtnetlink: allocate more memory for dev_set_mac_address()
   0c47f11bc4a5 ipv4: initialize fib_trie prior to register_netdev_notifier call.
   5a2d511a95cc net: dsa: b53: Add missing ARL entries for BCM53125
   4a2ffe1707e3 ipv6: avoid overflow of offset in ip6_find_1stfragopt
   0b83249a57ad net: Zero terminate ifr_name in dev_ifname().
   a62bc8d336e3 ipv4: ipv6: initialize treq->txhash in cookie_v[46]_check()
   0cd73c42b7a2 tcp_bbr: init pacing rate on first RTT sample
   2e6b237dc03b tcp_bbr: remove sk_pacing_rate=0 transient during init
   0c0ede36b9e0 tcp_bbr: introduce bbr_init_pacing_rate_from_rtt() helper
   ec789686d79b tcp_bbr: introduce bbr_bw_to_pacing_rate() helper
   73520d3814b6 tcp_bbr: cut pacing rate only if filled pipe
   12d17d78e3f7 saa7164: fix double fetch PCIe access condition
   3a63729427ac Btrfs: fix early ENOSPC due to delalloc
   0f442c5b2e4a f2fs: sanity check checkpoint segno and blkoff
   c14e327bee70 media: lirc: LIRC_GET_REC_RESOLUTION should return microseconds
   e92add299fee mmc: core: Use device_property_read instead of of_property_read
   baf4ad0e5162 mmc: dw_mmc: Use device_property_read instead of of_property_read
   bdabf097f05b iscsi-target: Fix initial login PDU asynchronous socket close OOPs
   733d7ab6c5bc media: platform: davinci: return -EINVAL for VPFE_CMD_S_CCDC_RAW_PARAMS ioctl
   4f3544816937 ARM: dts: tango4: Request RGMII RX and TX clock delays
   ff603e017bee ARM: dts: armada-38x: Fix irq type for pca955
   12353a00df25 ext4: fix overflow caused by missing cast in ext4_resize_fs()
   0814c3a9447b ext4: fix SEEK_HOLE/SEEK_DATA for blocksize < pagesize
   b680e22fca76 gpiolib: skip unwanted events, don't convert them to opposite edge
   be5c6efc996e iommu/amd: Enable ga_log_intr when enabling guest_mode
   03ebdd1eb95a powerpc/64: Fix __check_irq_replay missing decrementer interrupt
   8164692a2f66 powerpc/tm: Fix saving of TM SPRs in core dump
   9ef8b23b94b9 timers: Fix overflow in get_next_timer_interrupt
   7b95b7456362 mm/page_alloc: Remove kernel address exposure in free_reserved_area()
   0c609d3e1fbd KVM: async_pf: make rcu irq exit if not triggered from idle task
   650c763ea5ea ASoC: do not close shared backend dailink
   69f15fff03e8 drm/amdgpu: Fix undue fallthroughs in golden registers initialization
   c531a24057ac ALSA: hda - Fix speaker output from VAIO VPCL14M1R
   45a636ec1849 cpuset: fix a deadlock due to incomplete patching of cpusets_enabled()
   5a1eef71aa2a mm, mprotect: flush TLB if potentially racing with a parallel reclaim leaving stale TLB entries
   943281eb4ecf mmc: core: Fix access to HS400-ES devices
   1f32e67adac4 device property: Make dev_fwnode() public
   347be00b56f7 mmc: sdhci-of-at91: force card detect value for non removable devices
   f7d3e54fb40c NFSv4: Fix EXCHANGE_ID corrupt verifier issue
   f5214eb4baf8 brcmfmac: fix memleak due to calling brcmf_sdiod_sgtable_alloc() twice
   de8c33290f1c iwlwifi: dvm: prevent an out of bounds access
   61a0adbfaad7 workqueue: restore WQ_UNBOUND/max_active==1 to be ordered
   804b1a9f0aea libata: array underflow in ata_find_dev()
   445ee6cdd91e cgroup: fix error return value from cgroup_subtree_control()
   4a99eac8d2b3 cgroup: create dfl_root files on subsys registration
   5d23e4f3a333 parisc: Handle vma's whose context is not current in flush_cache_range
   db397d9c6e66 Linux 4.9.41
   007dffc661cf ASoC: dpcm: Avoid putting stream state to STOP when FE stream is paused
   27ef0283b60e ASoC: Intel: Skylake: Release FW ctx in cleanup
   23ab274ddf83 scsi: bfa: Increase requested firmware version to 3.2.5.1
   5f7040719202 scsi: snic: Return error code on memory allocation failure
   2803ea76366a scsi: fnic: Avoid sending reset to firmware when another reset is in progress
   3b6f4e292cbd HID: ignore Petzl USB headlamp
   3f0dfa11cc0d ASoC: Intel: bytcr-rt5640: fix settings in internal clock mode
   b899142ce21d perf/x86: Set pmu->module in Intel PMU modules
   efa225254a4a x86/platform/intel-mid: Rename 'spidev' to 'mrfld_spidev'
   12dac5fcf5ec ALSA: usb-audio: test EP_FLAG_RUNNING at urb completion
   301681d60003 ARCv2: IRQ: Call entry/exit functions for chained handlers in MCIP
   f10e2065ce76 sh_eth: enable RX descriptor word 0 shift on SH7734
   2909c9c2d713 ASoC: fsl_ssi: set fifo watermark to more reliable value
   2548d893a542 net: usb: asix_devices: add .reset_resume for USB PM
   a7526723b7fc nvmem: imx-ocotp: Fix wrong register size
   e95ec3582a29 arm64: mm: fix show_pte KERN_CONT fallout
   812a7df6556f vfio-pci: Handle error from pci_iomap
   a417ea5b9d22 video: fbdev: cobalt_lcdfb: Handle return NULL error from devm_ioremap
   ddc0ec3be807 perf symbols: Robustify reading of build-id from sysfs
   d8086c3bd3a5 perf tools: Install tools/lib/traceevent plugins with install-bin
   0b8656414e29 xfrm: Don't use sk_family for socket policy lookups
   ab5e7df9e064 tools lib traceevent: Fix prev/next_prio for deadline tasks
   704a6d719d4c Xen: ARM: Zero reserved fields of xatp before making hypervisor call
   f76ddff6c521 Btrfs: adjust outstanding_extents counter properly when dio write is split
   49fc90b443c7 benet: stricter vxlan offloading check in be_features_check
   673121283605 Btrfs: fix lockdep warning about log_mutex
   78418b867334 Btrfs: use down_read_nested to make lockdep silent
   92d6a813b03a usb: gadget: Fix copy/pasted error message
   a15a3d92eca8 ACPI / scan: Prefer devices without _HID/_CID for _ADR matching
   ebd4642ee412 ARM: s3c2410_defconfig: Fix invalid values for NF_CT_PROTO_*
   69f3df1fd013 perf probe: Fix to get correct modname from elf header
   3209f3f69eeb ARM64: zynqmp: Fix i2c node's compatible string
   e3603533ae63 ARM64: zynqmp: Fix W=1 dtc 1.4 warnings
   8af0937aee50 usb: dwc3: omap: fix race of pm runtime with irq handler in probe
   29e0adf8bacd dmaengine: ti-dma-crossbar: Add some 'of_node_put()' in error path.
   000224c1106c l2tp: consider '::' as wildcard address in l2tp_ip6 socket lookup
   c2804b21f2e7 dmaengine: ioatdma: workaround SKX ioatdma version
   2987ce159fb9 dmaengine: ioatdma: Add Skylake PCI Dev ID
   88a86f8dfaad openrisc: Add _text symbol to fix ksym build error
   033d5ce4ad8d irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
   c612bba54b8c ASoC: nau8825: fix invalid configuration in Pre-Scalar of FLL
   14e5c8c61791 spi: dw: Make debugfs name unique between instances
   ed788dc6fa65 ASoC: tlv320aic3x: Mark the RESET register as volatile
   ca40b2d039dc irqchip/keystone: Fix "scheduling while atomic" on rt
   c7d0c0d84808 vfio-pci: use 32-bit comparisons for register address for gcc-4.5
   7d33b41d34f5 drm/msm: Verify that MSM_SUBMIT_BO_FLAGS are set
   50e3950d77ba drm/msm: Put back the vaddr in submit_reloc()
   e0d5bb92c07b drm/msm: Ensure that the hardware write pointer is valid
   237652fae500 net/mlx4_core: Fix raw qp flow steering rules under SRIOV
   7e150f79134e net/mlx4: Remove BUG_ON from ICM allocation routine
   a8820678afe1 net/mlx4_core: Use-after-free causes a resource leak in flow-steering detach
   aeb230318ddb ipv6: Should use consistent conditional judgement for ip6 fragment between __ip6_append_data and ip6_finish_output
   ea703cb0140b net/mlx5: Disable RoCE on the e-switch management port under switchdev mode
   a0a4dd446904 ARM: dts: n900: Mark eMMC slot with no-sdio and no-sd flags
   0ce84ef6a296 ARM: dts: am57xx-idk: Put USB2 port in peripheral mode
   2bc4d1c95784 dt-bindings: input: Specify the interrupt number of TPS65217 power button
   b1164693f770 dt-bindings: power/supply: Update TPS65217 properties
   0686a9bc42ad ARM: omap2+: fixing wrong strcat for Non-NULL terminated string
   82338e9ffba5 r8169: add support for RTL8168 series add-on card.
   34fae9c906ec x86/mce/AMD: Make the init code more robust
   a3ff46097a1d device-dax: fix sysfs duplicate warnings
   48a70be0de9e net: skb_needs_check() accepts CHECKSUM_NONE for tx
   e10f7bd6a6b8 pstore: Use dynamic spinlock initializer
   a0840275e3eb pstore: Correctly initialize spinlock and flags
   4693080316e6 pstore: Allow prz to control need for locking
   5463a3dccf10 v4l: s5c73m3: fix negation operator
   ad25f11ed216 dentry name snapshots
   d933777b1b1b ipmi/watchdog: fix watchdog timeout set on reboot
   196553666dce RDMA/uverbs: Fix the check for port number
   62b5776c8c86 sched/cgroup: Move sched_online_group() back into css_online() to fix crash
   016a638a518c mailbox: handle empty message in tx_tick
   abe9090ac07b mailbox: skip complete wait event if timer expired
   a23fba818203 mailbox: always wait in mbox_send_message for blocking Tx mode
   2f16bcd4dba9 wil6210: fix deadlock when using fw_no_recovery option
   59153e658936 ath10k: fix null deref on wmi-tlv when trying spectral scan
   7b3a66739ff0 isdn/i4l: fix buffer overflow
   b756862459d2 isdn: Fix a sleep-in-atomic bug
   6c78197e4a69 net: phy: Do not perform software reset for Generic PHY
   57154f0302cd nfc: fdp: fix NULL pointer dereference
   35bdf9a61dc9 nfc: Fix hangup of RC-S380* in port100_send_ack()
   6b3d13fe67da smp/hotplug: Replace BUG_ON and react useful
   7b4e4b18ea64 smp/hotplug: Move unparking of percpu threads to the control CPU
   755f65501f70 drm: rcar-du: Simplify and fix probe error handling
   9bf0d78bf640 Staging: comedi: comedi_fops: Avoid orphaned proc entry
   0f31691508c6 Revert "powerpc/numa: Fix percpu allocations to be NUMA aware"
   c39c3aeb2b41 KVM: PPC: Book3S HV: Save/restore host values of debug registers
   e5cd34d10459 KVM: PPC: Book3S HV: Restore critical SPRs to host values on guest exit
   ae8faca6e2e7 drm/nouveau/bar/gf100: fix access to upper half of BAR2
   34da5f74eb5c drm/nouveau/disp/nv50-: bump max chans to 21
   e41779886b90 drm/vmwgfx: Fix gcc-7.1.1 warning
   fabc7dffe9e1 md/raid5: add thread_group worker async_tx_issue_pending_all
   d745f0f67b70 KVM: PPC: Book3S HV: Enable TM before accessing TM registers
   9eb088e57edd crypto: authencesn - Fix digest_null crash
   7d2a354861e9 NFSv4.1: Fix a race where CB_NOTIFY_LOCK fails to wake a waiter
   b087b8b11e52 NFS: invalidate file size when taking a lock.
   6d3d93ca2ef8 powerpc/pseries: Fix of_node_put() underflow during reconfig remove
   fa2aa76efe7d parisc: Suspend lockup detectors before system halt
   f0d23fa63243 parisc: Extend disabled preemption in copy_user_page
   afe9fc012bc1 parisc: Prevent TLB speculation on flushed pages on CPUs that only support equivalent aliases
   5f8bdd5edc82 ALSA: hda - Add missing NVIDIA GPU codec IDs to patch table
   3d955095c597 ALSA: fm801: Initialize chip after IRQ handler is registered
   3a79e1c8e709 jfs: Don't clear SGID when inheriting ACLs
   26d01aa8a110 net: reduce skb_warn_bad_offload() noise
   d97aff4f9770 pstore: Make spinlock per zone instead of global
   0f94b36de37c af_key: Add lock to key dump
   efcfbfb1d8bf Linux 4.9.40
   91af5f04cd5b alarmtimer: don't rate limit one-shot timers
   919e481152ce tracing: Fix kmemleak in instance_rmdir
   7bd804a05eb0 PM / Domains: defer dev_pm_domain_set() until genpd->attach_dev succeeds if present
   69fbb442144a reiserfs: Don't clear SGID when inheriting ACLs
   1c7e5ca092c0 spmi: Include OF based modalias in device uevent
   a18935b45e97 of: device: Export of_device_{get_modalias, uvent_modalias} to modules
   6b50bca7cdb0 acpi/nfit: Fix memory corruption/Unregister mce decoder on failure
   97de6f34b42b ovl: fix random return value on mount
   5cf84432b422 hfsplus: Don't clear SGID when inheriting ACLs
   b33da556255c mlx5: Avoid that mlx5_ib_sg_to_klms() overflows the klms[] array
   a44042519469 drm/mst: Avoid processing partially received up/down message transactions
   48376e6b71a6 drm/mst: Avoid dereferencing a NULL mstb in drm_dp_mst_handle_up_req()
   bc3bd649ebb4 drm/mst: Fix error handling during MST sideband message reception
   db2975396090 RDMA/core: Initialize port_num in qp_attr
   acccf01a807a ceph: fix race in concurrent readdir
   d42f9c7435c0 staging: lustre: ko2iblnd: check copy_from_iter/copy_to_iter return code
   85643f6f5028 staging: sm750fb: avoid conflicting vesafb
   2bc52403da8a staging: comedi: ni_mio_common: fix AO timer off-by-one regression
   964a21a1300c staging: rtl8188eu: add TL-WN722N v2 support
   a76a032300e2 Revert "perf/core: Drop kernel samples even though :u is specified"
   61415418cdba perf annotate: Fix broken arrow at row 0 connecting jmp instruction to its target
   d5f9cd081c66 iser-target: Avoid isert_conn->cm_id dereference in isert_login_recv_done
   672145dfae84 target: Fix COMPARE_AND_WRITE caw_sem leak during se_cmd quiesce
   fa67ac18eff4 udf: Fix deadlock between writeback and udf_setsize()
   9ebfb4fa3ab7 NFS: only invalidate dentrys that are clearly invalid.
   4dd0aa9ae6d0 sunrpc: use constant time memory comparison for mac
   dd0d6509cbf4 IB/core: Namespace is mandatory input for address resolution
   5c2717f41545 IB/iser: Fix connection teardown race condition
   5b50e0e74e2e Input: i8042 - fix crash at boot time
   6d77ac4bc514 MIPS: Fix a typo: s/preset/present/ in r2-to-r6 emulation error message
   3330a05c5c6e MIPS: Send SIGILL for R6 branches in `__compute_return_epc_for_insn'
   d4bd6a1df2c8 MIPS: Send SIGILL for linked branches in `__compute_return_epc_for_insn'
   99ce76144dee MIPS: Rename `sigill_r6' to `sigill_r2r6' in `__compute_return_epc_for_insn'
   86dd4aa30790 MIPS: Send SIGILL for BPOSGE32 in `__compute_return_epc_for_insn'
   d79354cc1bc9 MIPS: math-emu: Prevent wrong ISA mode instruction emulation
   040078ad0fe8 MIPS: Fix unaligned PC interpretation in `compute_return_epc'
   434c9f2e3b46 MIPS: Actually decode JALX in `__compute_return_epc_for_insn'
   f8c331cbc937 MIPS: Save static registers before sysmips
   a9db2f4f887c MIPS: Fix MIPS I ISA /proc/cpuinfo reporting
   c69280e9018e x86/ioapic: Pass the correct data to unmask_ioapic_irq()
   036d59f40ac9 x86/acpi: Prevent out of bound access caused by broken ACPI tables
   456a997498cb Revert "ACPI / EC: Enable event freeze mode..." to fix a regression
   b2966b109b1a ACPI / EC: Drop EC noirq hooks to fix a regression
   ec469b5e2aaf ubifs: Don't leak kernel memory to the MTD
   02131aea6bd4 MIPS: Negate error syscall return in trace
   f39f3b5d8260 MIPS: Fix mips_atomic_set() with EVA
   dd2f83263dd8 MIPS: Fix mips_atomic_set() retry condition
   198bd494cebf ftrace: Fix uninitialized variable in match_records()
   d17cc7b7a752 nvme-rdma: remove race conditions from IB signalling
   8f9dec0c2dbb vfio: New external user group/file match
   e91a55790ddf vfio: Fix group release deadlock
   fee760fc6c79 ovl: drop CAP_SYS_RESOURCE from saved mounter's credentials
   0fb615f9cad7 drm/ttm: Fix use-after-free in ttm_bo_clean_mm
   f97f9e94f666 f2fs: Don't clear SGID when inheriting ACLs
   19e117a50135 f2fs: sanity check size of nat and sit cache
   58d2eacd3b0e xfs: Don't clear SGID when inheriting ACLs
   1b9008cdae94 ipmi:ssif: Add missing unlock in error branch
   685e124ebc7f ipmi: use rcu lock around call to intf->handlers->sender()
   6e7b1eff91aa drm/radeon: Fix eDP for single-display iMac10,1 (v2)
   a844f8d2a564 drm/radeon/ci: disable mclk switching for high refresh rates (v2)
   b85007c9114a drm/amd/amdgpu: Return error if initiating read out of range on vram
   8302e9d2f50b s390/syscalls: Fix out of bounds arguments access
   1e95148551f3 Raid5 should update rdev->sectors after reshape
   4d1f97eb59a4 ext2: Don't clear SGID when inheriting ACLs
   0fa705dc61ee libnvdimm: fix badblock range handling of ARS range
   891c31e16cb7 libnvdimm, btt: fix btt_rw_page not returning errors
   e82672f45ea3 cx88: Fix regression in initial video standard setting
   4d3d3a1690c2 x86/xen: allow userspace access during hypercalls
   03c1d9d45582 md: don't use flush_signals in userspace processes
   dbc969ca944f usb: renesas_usbhs: gadget: disable all eps when the driver stops
   5433bfcc8527 usb: renesas_usbhs: fix usbhsc_resume() for !USBHSF_RUNTIME_PWCTRL
   a74779d8e172 USB: cdc-acm: add device-id for quirky printer
   8665f40a06a0 usb: storage: return on error to avoid a null pointer dereference
   8bc51b4f2a42 mxl111sf: Fix driver to use heap allocate buffers for USB messages
   24a950e16eb5 xhci: Bad Ethernet performance plugged in ASM1042A host
   01845a8347b7 xhci: Fix NULL pointer dereference when cleaning up streams for removed host
   bf0440882ea9 xhci: fix 20000ms port resume timeout
   445ea10969aa ipvs: SNAT packet replies only for NATed connections
   33780512d9fe PCI/PM: Restore the status of PCI devices across hibernation
   f257f4bf6f07 PCI: rockchip: Use normal register bank for config accessors
   13b2f9f9b8aa PCI: Work around poweroff & suspend-to-RAM issue on Macbook Pro 11
   3c17d418afb0 af_key: Fix sadb_x_ipsecrequest parsing
   3b7babc6be0a powerpc/mm/radix: Properly clear process table entry
   88481a2c40e4 powerpc/asm: Mark cr0 as clobbered in mftb()
   5e35ee249e26 powerpc: Fix emulation of mfocrf in emulate_step()
   53a282161317 powerpc: Fix emulation of mcrf in emulate_step()
   99fc5a2254ef powerpc/64: Fix atomic64_inc_not_zero() to return an int
   d638c8584462 powerpc/pseries: Fix passing of pp0 in updatepp() and updateboltedpp()
   71b1caea95a8 xen/scsiback: Fix a TMR related use-after-free
   732e3c76cf97 iscsi-target: Add login_keys_workaround attribute for non RFC initiators
   fc866b296a46 scsi: Add STARGET_CREATED_REMOVE state to scsi_target_state
   542c097f1cb6 scsi: ses: do not add a device to an enclosure if enclosure_add_links() fails.
   d2bb0af4463d PM / Domains: Fix unsafe iteration over modified list of domains
   178aa241fc07 PM / Domains: Fix unsafe iteration over modified list of domain providers
   b87a32175a22 PM / Domains: Fix unsafe iteration over modified list of device links
   4d94276155f8 ASoC: compress: Derive substream from stream based on direction
   9a81c136f486 igb: Explicitly select page 0 at initialization
   157302f97aaa btrfs: Don't clear SGID when inheriting ACLs
   754f4e05e999 wlcore: fix 64K page support
   3da27a9d9827 Bluetooth: use constant time memory comparison for secret values
   fe5cdbcdafaa perf intel-pt: Clear FUP flag on error
   94c38cd0aff2 perf intel-pt: Use FUP always when scanning for an IP
   5a16bd39c501 perf intel-pt: Ensure never to set 'last_ip' when packet 'count' is zero
   daa637832dd2 perf intel-pt: Fix last_ip usage
   dc0401375f7a perf intel-pt: Ensure IP is zero when state is INTEL_PT_STATE_NO_IP
   b338b87f2277 perf intel-pt: Fix missing stack clear
   3e6837f1f414 perf intel-pt: Improve sample timestamp
   d3503ef1a614 perf intel-pt: Move decoder error setting into one condition
   244a7db0e9d5 NFC: Add sockaddr length checks before accessing sa_family in bind handlers
   4a142251a315 nfc: Fix the sockaddr length sanitization in llcp_sock_connect
   d1ac8a98f312 nfc: Ensure presence of required attributes in the activate_target handler
   06be8e2767da NFC: nfcmrvl: fix firmware-management initialisation
   10f03f0f7ef0 NFC: nfcmrvl: use nfc-device for firmware download
   4b4f74d6c4f8 NFC: nfcmrvl: do not use device-managed resources
   7de6ff402dd0 NFC: nfcmrvl_uart: add missing tty-device sanity check
   f73de3f9915c NFC: fix broken device allocation
   48879676a8c3 ath9k: fix an invalid pointer dereference in ath9k_rng_stop()
   99f96831083b ath9k: fix tx99 bus error
   b729a1aea14d ath9k: fix tx99 use after free
   7cd7b56037ae thermal: cpu_cooling: Avoid accessing potentially freed structures
   76572609e458 thermal: max77620: fix device-node reference imbalance
   60813b6a2ab4 s5p-jpeg: don't return a random width/height
   63d32e8af0dd dm mpath: cleanup -Wbool-operation warning in choose_pgpath()
   70ec6b3635d9 ir-core: fix gcc-7 warning on bool arithmetic
   78fbe21d83e3 disable new gcc-7.1.1 warnings for now
   c03917de04aa 4.9.39
   cce8d2ee4571 kvm: vmx: allow host to access guest MSR_IA32_BNDCFGS
   07592d622536 kvm: vmx: Check value written to IA32_BNDCFGS
   fab777e70ca4 kvm: x86: Guest BNDCFGS requires guest MPX support
   bf7c21535617 kvm: vmx: Do not disable intercepts for BNDCFGS
   04e002a5f681 tracing: Use SOFTIRQ_OFFSET for softirq dectection for more accurate results
   cc7d3b7dd1ac PM / QoS: return -EINVAL for bogus strings
   5480437f7963 PM / wakeirq: Convert to SRCU
   758dc6a8dabc sched/topology: Fix overlapping sched_group_mask
   3e165b2322c6 sched/topology: Optimize build_group_mask()
   7c3f08eadcfd sched/topology: Fix building of overlapping sched-groups
   542ebc96c200 sched/fair, cpumask: Export for_each_cpu_wrap()
   a0a93e3e6e1e Revert "sched/core: Optimize SCHED_SMT"
   80495c708490 crypto: caam - fix signals handling
   48a9dff21398 crypto: caam - properly set IV after {en,de}crypt
   db923288f37f crypto: sha1-ssse3 - Disable avx2
   81cc2ef2677b crypto: atmel - only treat EBUSY as transient if backlog
   2ff2cc768eb7 crypto: talitos - Extend max key length for SHA384/512-HMAC and AEAD
   38dfd2e3a673 mm: fix overflow check in expand_upwards()
   1e6f1af808c1 selftests/capabilities: Fix the test_execve test
   54fcb2303ef4 mnt: Make propagate_umount less slow for overlapping mount propagation trees
   bb4fbf094b44 mnt: In propgate_umount handle visiting mounts in any order
   e260db757676 mnt: In umount propagation reparent in a separate pass
   7d976da04345 nvmem: core: fix leaks on registration errors
   ac5e9e801f47 rcu: Add memory barriers for NOCB leader wakeup
   63c634cf9547 vt: fix unchecked __put_user() in tioclinux ioctls
   445a945ad67b ARM64: dts: marvell: armada37xx: Fix timer interrupt specifiers
   f31c4f65dd09 exec: Limit arg stack to at most 75% of _STK_LIM
   fbc877cd08e5 s390: reduce ELF_ET_DYN_BASE
   90fb0f7aefc9 powerpc: move ELF_ET_DYN_BASE to 4GB / 4MB
   70779e0ebb37 arm64: move ELF_ET_DYN_BASE to 4GB / 4MB
   abb79a56898e arm: move ELF_ET_DYN_BASE to 4MB
   63c2f8f8c41b binfmt_elf: use ELF_ET_DYN_BASE only for PIE
   93eae954050d checkpatch: silence perl 5.26.0 unescaped left brace warnings
   a9aa6522a1a5 fs/dcache.c: fix spin lockup issue on nlru->lock
   a48542e8b4ec mm/list_lru.c: fix list_lru_count_node() to be race free
   8c6f19c25086 kernel/extable.c: mark core_kernel_text notrace
   d2b64687b37f thp, mm: fix crash due race in MADV_FREE handling
   68ea25f00ffe tools/lib/lockdep: Reduce MAX_LOCK_DEPTH to avoid overflowing lock_chain/: Depth
   e3d2adaaf927 parisc/mm: Ensure IRQs are off in switch_mm()
   8ed89cfc8692 parisc: DMA API: return error instead of BUG_ON for dma ops on non dma devs
   bf1e4dc3b4fb parisc: use compat_sys_keyctl()
   008a1f270748 parisc: Report SIGSEGV instead of SIGBUS when running out of stack
   59613f80ec67 irqchip/gic-v3: Fix out-of-bound access in gic_set_affinity
   6a90f81ab639 cfg80211: Check if NAN service ID is of expected size
   7e9e9638afdf cfg80211: Check if PMKID attribute is of expected size
   e471290603ee cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES
   b68aa7dff96e cfg80211: Define nla_policy for NL80211_ATTR_LOCAL_MESH_POWER_MODE
   6ae9dd281965 sfc: don't read beyond unicast address list
   5f69bb1d18c5 brcmfmac: Fix glom_skb leak in brcmf_sdiod_recv_chain
   fd325ddd5884 brcmfmac: Fix a memory leak in error handling path in 'brcmf_cfg80211_attach'
   414848bba6ab brcmfmac: fix possible buffer overflow in brcmf_cfg80211_mgmt_tx()
   181dda46a314 rds: tcp: use sock_create_lite() to create the accept socket
   e6577f1ef3f8 vrf: fix bug_on triggered by rx when destroying a vrf
   0bc26d1ca38d net: ipv6: Compare lwstate in detecting duplicate nexthops
   05e165e9bc45 net: core: Fix slab-out-of-bounds in netdev_stats_to_stats64
   beabc6032772 vxlan: fix hlist corruption
   d2c951208578 ipv6: dad: don't remove dynamic addresses if link is down
   743564306ee6 net/mlx5e: Fix TX carrier errors report in get stats ndo
   a80a70a4822c liquidio: fix bug in soft reset failure detection
   e20204dc2c74 net/mlx5: Cancel delayed recovery work when unloading the driver
   067328078d14 net: handle NAPI_GRO_FREE_STOLEN_HEAD case also in napi_frags_finish()
   cd5de9cb858d bpf: prevent leaking pointer via xadd on unpriviledged
   bee807054892 rocker: move dereference before free
   e5e5c0ec39dd bridge: mdb: fix leak on complete_info ptr on fail path
   3f04c32bf47a net: prevent sign extension in dev_get_stats()
   ef13840028c8 tcp: reset sk_rx_dst in tcp_disconnect()
   cf81b4abe7ac net: dp83640: Avoid NULL pointer dereference.
   0526ff300304 ipv6: avoid unregistering inet6_dev for loopback
   3f7e07c37ade net/phy: micrel: configure intterupts after autoneg workaround
   dc491cdd2c81 net: sched: Fix one possible panic when no destroy callback
   13550ffc9515 net_sched: fix error recovery at qdisc creation
   21f79ae43fd2 xen-netfront: Rework the fix for Rx stall during OOM and network stress
   f0cd77ded512 Linux 4.9.38
   fb2dc28cf20a saa7134: fix warm Medion 7134 EEPROM read
   81ba752aa476 x86/mm/pat: Don't report PAT on CPUs that don't support it
   c0d3a7bdc7c2 ext4: check return value of kstrtoull correctly in reserved_clusters_store
   716986547f1f crypto: rsa-pkcs1pad - use constant time memory comparison for MACs
   0d6758f74a46 crypto: caam - fix gfp allocation flags (part I)
   090661e4073d staging: comedi: fix clean-up of comedi_class in comedi_init()
   80c965cbd280 staging: vt6556: vnt_start Fix missing call to vnt_key_init_table.
   5497d74e75f8 locking/rwsem-spinlock: Fix EINTR branch in __down_write_common()
   3953403ca660 md: fix super_offset endianness in super_1_rdev_size_change
   9a37d02c497c md: fix incorrect use of lexx_to_cpu in does_sb_need_changing
   ce02effed0ec perf probe: Add error checks to offline probe post-processing
   364973599e2e perf probe: Fix to probe on gcc generated symbols for offline kernel
   cd206153672a perf scripting perl: Fix compile error with some perl5 versions
   b9175b3fa90c perf header: Fix handling of PERF_EVENT_UPDATE__SCALE
   15c249c85d57 perf bench numa: Avoid possible truncation when using snprintf()
   b246fc09a223 perf tests: Avoid possible truncation with dirent->d_name + snprintf
   93a3c47d033a perf intel-pt: Use __fallthrough
   055237857974 perf thread_map: Correctly size buffer used with dirent->dt_name
   a814c7d1d8f4 perf top: Use __fallthrough
   94218786b3ba tools strfilter: Use __fallthrough
   76efd703014f tools string: Use __fallthrough in perf_atoll()
   dae518419a42 tools include: Add a __fallthrough statement
   b635182b4f41 tpm: Issue a TPM2_Shutdown for TPM2 devices.
   5a1e1c62f37e Add "shutdown" to "struct class".
   e6952841ade0 mqueue: fix a use-after-free in sys_mq_notify()
   c48f76d680ad Linux 4.9.37
   3468d4ffa8ef rt286: add Thinkpad Helix 2 to force_combo_jack_table
   84b00cd90f4d RDMA/uverbs: Check port number supplied by user verbs cmds
   1803bec709f8 crypto: drbg - Fixes panic in wait_for_completion call
   73a0a68779e4 KEYS: Fix an error code in request_master_key()
   f986d63d788c ath10k: override CE5 config for QCA9377
   afbf56592092 x86/uaccess: Optimize copy_user_enhanced_fast_string() for short strings
   e353bfb63754 x86/tools: Fix gcc-7 warning in relocs.c
   525ea5950e1c tpm: fix a kernel memory leak in tpm-sysfs.c
   25b2ee6f9d9d gfs2: Fix glock rhashtable rcu bug
   f59d04e34282 xhci: Limit USB2 port wake support for AMD Promontory hosts
   07379c41aeaf USB: serial: qcserial: new Sierra Wireless EM7305 device ID
   7b7d5a4d9f57 USB: serial: option: add two Longcheer device ids
   369bbf4b44ac pinctrl: sh-pfc: Update info pointer after SoC-specific init
   828bd8441de0 pinctrl: sh-pfc: r8a7791: Add missing HSCIF1 pinmux data
   485b0f1194ea pinctrl: mxs: atomically switch mux and drive strength config
   dee763a4d37d pinctrl: cherryview: Add terminate entry for dmi_system_id tables
   b9970dd7c155 pinctrl: sunxi: Fix SPDIF function name for A83T
   8240981690f3 pinctrl: stm32: Fix bad function call
   a3f2e309f654 pinctrl: meson: meson8b: fix the NAND DQS pins
   f24dee484be9 pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
   c5db45ef9e86 pinctrl: sh-pfc: r8a7791: Add missing DVC_MUTE signal
   37705843587b pinctrl: sh-pfc: r8a7791: Fix SCIF2 pinmux data
   275f905f1232 pinctrl: sh-pfc: r8a7794: Swap ATA signals
   2bd57fa2558c pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard work again
   aaaaa5b1881b pinctrl: qcom: ipq4019: add missing pingroups for pins > 70
   7bdacd3d9f4e sysctl: report EINVAL if value is larger than UINT_MAX for proc_douintvec
   3a20c57b4332 sysctl: don't print negative flag for proc_douintvec
   4e84b9c79003 mac80211_hwsim: Replace bogus hrtimer clockid
   d84e328c0243 USB: core: fix device node leak
   18b3abb54305 usb: Fix typo in the definition of Endpoint[out]Request
   19adf93ccd55 usb: usbip: set buffer pointers to NULL after free
   3d1056874295 Add USB quirk for HVR-950q to avoid intermittent device resets
   da8990d3c141 USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick
   3272bad0c2aa usb: dwc3: replace %p with %pK
   366d9207d9e0 drm/virtio: don't leak bo on drm_gem_object_init failure
   b96976c1a87b media: entity: Fix stream count check
   3693042f1c9f tracing/kprobes: Allow to create probe with a module name starting with a digit
   9403514ba1a2 ceph: choose readdir frag based on previous readdir reply
   c4c592b2c137 driver core: platform: fix race condition with driver_override
   26ff065b8401 fs: completely ignore unknown open flags
   6efb1b0b6c82 fs: add a VALID_OPEN_FLAGS

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index b939e6da079a..22e478e2b8fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1fb4e1d1e3f727fc20963fc631a259665bd4665b"
-SRCREV_meta ?= "0dd1939b20d55fec20e8c3d13088df3b9ca23ade"
+SRCREV_machine ?= "d3aea9ac7fa726757720afe20286c375bf7eefbc"
+SRCREV_meta ?= "f16cac53436be696fa055bc4a139f3f1dc39a9ce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.36"
+LINUX_VERSION ?= "4.9.46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 82ccb982572e..364930bac60a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.36"
+LINUX_VERSION ?= "4.9.46"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_meta ?= "0dd1939b20d55fec20e8c3d13088df3b9ca23ade"
+SRCREV_machine ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
+SRCREV_meta ?= "f16cac53436be696fa055bc4a139f3f1dc39a9ce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 6021b224d0d8..c4b601c464e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a4390ba8db101907133990f8e31ebcd56869ac3b"
-SRCREV_machine_qemuarm64 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_machine_qemumips ?= "580682c29df5023d2cecaf6c4074d401c4b57b94"
-SRCREV_machine_qemuppc ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_machine_qemux86 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_machine_qemux86-64 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_machine_qemumips64 ?= "7c9ce18e05e1d84df17e677b26133671ec0430f5"
-SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_meta ?= "0dd1939b20d55fec20e8c3d13088df3b9ca23ade"
+SRCREV_machine_qemuarm ?= "5c60622f4af68de9d6d9320f7d785156d01c305c"
+SRCREV_machine_qemuarm64 ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
+SRCREV_machine_qemumips ?= "a5673234ab47a8653b7c3629811cc9ca634fcadb"
+SRCREV_machine_qemuppc ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
+SRCREV_machine_qemux86 ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
+SRCREV_machine_qemux86-64 ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
+SRCREV_machine_qemumips64 ?= "7b4d796b512ed9bb1e13af089fc4d20a35187eeb"
+SRCREV_machine ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
+SRCREV_meta ?= "f16cac53436be696fa055bc4a139f3f1dc39a9ce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.36"
+LINUX_VERSION ?= "4.9.46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


