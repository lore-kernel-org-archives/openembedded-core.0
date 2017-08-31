Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39C61783B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7VJVDhq032077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 31 Aug 2017 12:31:13 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:31:04 -0400
Message-ID: <551155143b5e0089e7614ee966447a6fd9acf065.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/4.4: update to v4.4.85
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:13 -0000
Content-Type: text/plain

Integrating the korg releases with the following commit summary:

   717bd21f81a3 Linux 4.4.85
   12b25d2a52f0 ACPI / APEI: Add missing synchronize_rcu() on NOTIFY_SCI removal
   b526de00a9b0 ACPI: ioapic: Clear on-stack resource before using it
   4e5f2c204150 ntb_transport: fix bug calculating num_qps_mw
   1aac8ffd619f ntb_transport: fix qp count bug
   4ec0b2c2d235 ASoC: rsnd: don't call update callback if it was NULL
   95fc5ef85428 ASoC: rsnd: ssi: 24bit data needs right-aligned settings
   fd504621fa52 ASoC: rsnd: Add missing initialization of ADG req_rate
   e974777b2ecb ASoC: rsnd: avoid pointless loop in rsnd_mod_interrupt()
   fdc568a4224a ASoC: rsnd: disable SRC.out only when stop timing
   bfba69dc30ab ASoC: simple-card: don't fail if sysclk setting is not supported
   eb2ba09b05a6 staging: rtl8188eu: add RNX-N150NUB support
   1d7e8cf01e2e iio: hid-sensor-trigger: Fix the race with user space powering up sensors
   d2c072cb638d iio: imu: adis16480: Fix acceleration scale factor for adis16480
   9dac44d5d4b0 ANDROID: binder: fix proc->tsk check.
   1792d6c17cb2 binder: Use wake up hint for synchronous transactions.
   596b97ec2e5e binder: use group leader instead of open thread
   e1c7a4478833 Bluetooth: bnep: fix possible might sleep error in bnep_session
   f9adf422b993 Bluetooth: cmtp: fix possible might sleep error in cmtp_session
   172bbb8ee44a Bluetooth: hidp: fix possible might sleep error in hidp_session_thread
   708d19eaf303 perf/core: Fix group {cpu,task} validation
   87ac57ff972a nfsd: Limit end of page list when decoding NFSv4 WRITE
   e6066962ca46 cifs: return ENAMETOOLONG for overlong names in cifs_open()/cifs_lookup()
   210b41b4971e cifs: Fix df output for users with quota limits
   9f57741b44ba tracing: Fix freeing of filter in create_filter() when set_str is false
   0d2b7767611f drm: rcar-du: Fix H/V sync signal polarity configuration
   64f3c534e7ac drm: rcar-du: Fix display timing controller parameter
   fbf583912145 drm: rcar-du: Fix crash in encoder failure error path
   766a097cbfea drm: rcar-du: lvds: Rename PLLEN bit to PLLON
   2b60c153ff3d drm: rcar-du: lvds: Fix PLL frequency-related configuration
   3416ee45a8cb drm/atomic: If the atomic check fails, return its value first
   2a9d7664ffb2 drm: Release driver tracking before making the object available again
   33e4c6378417 i2c: designware: Fix system suspend
   10814c149eeb ARCv2: PAE40: Explicitly set MSB counterpart of SLC region ops addresses
   6b1c81dd7fdb ALSA: hda - Add stereo mic quirk for Lenovo G50-70 (17aa:3978)
   099e57fcb03f ALSA: core: Fix unexpected error at replacing user TLV
   07051c175477 Input: elan_i2c - add ELAN0602 ACPI ID to support Lenovo Yoga310
   5609ae96bcd6 Input: trackpoint - add new trackpoint firmware ID
   a56800ae1c57 mei: me: add lewisburg device ids
   707352e68745 mei: me: add broxton pci device ids
   58079f56b302 net_sched: fix order of queue length updates in qdisc_replace()
   248af6aa226c net: sched: fix NULL pointer dereference when action calls some targets
   eece6c91dd33 irda: do not leak initialized list.dev to userspace
   4e39b7409f3b tcp: when rearming RTO, if RTO time is in past then fire RTO ASAP
   ece3ff173731 ipv6: repair fib6 tree in failure case
   6415a71ddf15 ipv6: reset fn->rr_ptr when replacing route
   69827c395d25 tipc: fix use-after-free
   0e8d62861552 sctp: fully initialize the IPv6 address in sctp_v6_to_addr()
   1bd54371388c ipv4: better IP_MAX_MTU enforcement
   7e1fe0062c24 net_sched/sfq: update hierarchical backlog when drop packet
   114414b85475 ipv4: fix NULL dereference in free_fib_info_rcu()
   c207ec46b301 dccp: defer ccid_hc_tx_delete() at dismantle time
   c65eca7ddd88 dccp: purge write queue in dccp_destroy_sock()
   f0cd9201c0c0 af_key: do not use GFP_KERNEL in atomic contexts
   982ce2aa79fb Linux 4.4.84
   ccf1033d9983 usb: qmi_wwan: add D-Link DWM-222 device ID
   6b4509223681 usb: optimize acpi companion search for usb port devices
   ce1b98a30571 perf/x86: Fix LBR related crashes on Intel Atom
   b4cf49024cf4 pids: make task_tgid_nr_ns() safe
   46d51a26efbc Sanitize 'move_pages()' permission checks
   b27e9ff9a5f4 irqchip/atmel-aic: Fix unbalanced refcount in aic_common_rtc_irq_fixup()
   ed281a6acaf1 irqchip/atmel-aic: Fix unbalanced of_node_put() in aic_common_irq_fixup()
   64340986295d x86/asm/64: Clear AC on NMI entries
   c0b397fd6b2b xen: fix bio vec merging
   240628085eff mm: revert x86_64 and arm64 ELF_ET_DYN_BASE base changes
   cc971fa12bd2 mm/mempolicy: fix use after free when calling get_mempolicy
   669c8ab896a2 ALSA: usb-audio: Add mute TLV for playback volumes on C-Media devices
   f600f9c43346 ALSA: usb-audio: Apply sample rate quirk to Sennheiser headset
   735aa043bf00 ALSA: seq: 2nd attempt at fixing race creating a queue
   ae4743cac8d7 Input: elan_i2c - Add antoher Lenovo ACPI ID for upcoming Lenovo NB
   0dbf7f7811df Input: elan_i2c - add ELAN0608 to the ACPI table
   4362533a0468 crypto: x86/sha1 - Fix reads beyond the number of blocks passed
   04f4f73ffe93 parisc: pci memory bar assignment fails with 64bit kernels on dino/cujo
   ea088172692c audit: Fix use after free in audit_remove_watch_rule()
   b72f1119c654 netfilter: nf_ct_ext: fix possible panic after nf_ct_extend_unregister
   425fdd287e9b Linux 4.4.83
   792f1fe5ec55 pinctrl: samsung: Remove bogus irq_[un]mask from resource management
   6f51066b3797 pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
   8bb6ef68655e pnfs/blocklayout: require 64-bit sector_t
   7b5a9de376b8 iio: adc: vf610_adc: Fix VALT selection value for REFSEL bits
   567a21de8531 usb:xhci:Add quirk for Certain failing HP keyboard on reset after resume
   dd3a2a08943f usb: quirks: Add no-lpm quirk for Moshi USB to Ethernet Adapter
   921a1ed2a11a usb: core: unlink urbs from the tail of the endpoint's urb_list
   bc2f02f74549 USB: Check for dropped connection before switching to full speed
   ed4f50eec60f uas: Add US_FL_IGNORE_RESIDUE for Initio Corporation INIC-3069
   dedeba47c51a iio: light: tsl2563: use correct event code
   dfb5cc919c61 iio: accel: bmc150: Always restore device to normal mode after suspend-resume
   c5f6f4fe1c09 staging:iio:resolver:ad2s1210 fix negative IIO_ANGL_VEL read
   dc978e9b65ab USB: hcd: Mark secondary HCD as dead if the primary one died
   8b278516e5e3 usb: musb: fix tx fifo flush handling again
   8a0c225613c2 USB: serial: pl2303: add new ATEN device id
   31c9287b9430 USB: serial: cp210x: add support for Qivicon USB ZigBee dongle
   9cb43dec24e0 USB: serial: option: add D-Link DWM-222 device ID
   a89843a80bd4 nfs/flexfiles: fix leak of nfs4_ff_ds_version arrays
   7271d130b5dc fuse: initialize the flock flag in fuse_file on allocation
   b89e781dab24 iscsi-target: Fix iscsi_np reset hung task during parallel delete
   3afc4e9273de iscsi-target: fix memory leak in iscsit_setup_text_cmd()
   9ea732ebb53f mm: ratelimit PFNs busy info message
   97e371409da7 cpuset: fix a deadlock due to incomplete patching of cpusets_enabled()
   4e2e415f4cc1 Linux 4.4.82
   fab61468402b net: account for current skb length when deciding about UFO
   96cdeaa3af8f ipv4: Should use consistent conditional judgement for ip fragment in __ip_append_data and ip_finish_output
   d45aabadbcb9 mm/mempool: avoid KASAN marking mempool poison checks as use-after-free
   7e86f2d55f66 KVM: arm/arm64: Handle hva aging while destroying the vm
   6fe71ca3cb3c sparc64: Prevent perf from running during super critical sections
   938990d2433c udp: consistently apply ufo or fragmentation
   98c1ad1edfe8 revert "ipv4: Should use consistent conditional judgement for ip fragment in __ip_append_data and ip_finish_output"
   54fc0c32307d revert "net: account for current skb length when deciding about UFO"
   63364a508d24 packet: fix tp_reserve race in packet_set_ring
   37d5c6e8d38d net: avoid skb_warn_bad_offload false positives on UFO
   8607d550847f tcp: fastopen: tcp_connect() must refresh the route
   40fc2b4451a2 net: sched: set xt_tgchk_param par.nft_compat as 0 in ipt_init_target
   d0da2877d421 bpf, s390: fix jit branch offset related to ldimm64
   4e0675f44b89 net: fix keepalive code vs TCP_FASTOPEN_CONNECT
   025bb7f7e92c tcp: avoid setting cwnd to invalid ssthresh after cwnd reduction states
   2ab639c7e2d1 Linux 4.4.81
   34a08ae493f1 workqueue: implicit ordered attribute should be overridable
   0c787041504e net: account for current skb length when deciding about UFO
   12b8f014a394 ipv4: Should use consistent conditional judgement for ip fragment in __ip_append_data and ip_finish_output
   78c04996b588 mm: don't dereference struct page fields of invalid pages
   bbe660db23e4 signal: protect SIGNAL_UNKILLABLE from unintentional clearing.
   623f4fcd947e lib/Kconfig.debug: fix frv build failure
   9c83b97bdeab mm, slab: make sure that KMALLOC_MAX_SIZE will fit into MAX_ORDER
   5205f5216c6a ARM: 8632/1: ftrace: fix syscall name matching
   874f22658c54 virtio_blk: fix panic in initialization error path
   c9e4ee445752 drm/virtio: fix framebuffer sparse warning
   1e43b2d06474 scsi: qla2xxx: Get mutex lock before checking optrom_state
   a98737110659 phy state machine: failsafe leave invalid RUNNING state
   db01878ca5dd x86/boot: Add missing declaration of string functions
   032422cca86d tg3: Fix race condition in tg3_get_stats64().
   93585e813588 net: phy: dp83867: fix irq generation
   41433e314b77 sh_eth: R8A7740 supports packet shecksumming
   50231cef2d6f wext: handle NULL extra data in iwe_stream_add_point better
   cada8caa2655 sparc64: Measure receiver forward progress to avoid send mondo timeout
   7c37101cd650 xen-netback: correctly schedule rate-limited queues
   2933fb22de6d net: phy: Fix PHY unbind crash
   a8f1b40bb2da net: phy: Correctly process PHY_HALTED in phy_stop_machine()
   dc4132791a50 net/mlx5: Fix command bad flow on command entry allocation failure
   de6669607a45 sctp: fix the check for _sctp_walk_params and _sctp_walk_errors
   2bac20a4ae9c sctp: don't dereference ptr before leaving _sctp_walk_{params, errors}()
   dd4edbcbb760 dccp: fix a memleak for dccp_feat_init err process
   adcc87858e09 dccp: fix a memleak that dccp_ipv4 doesn't put reqsk properly
   c3278ed37d3e dccp: fix a memleak that dccp_ipv6 doesn't put reqsk properly
   91c5aa7ea073 net: ethernet: nb8800: Handle all 4 RGMII modes identically
   d1ed1f8ae487 ipv6: Don't increase IPSTATS_MIB_FRAGFAILS twice in ip6_fragment()
   499338964af8 packet: fix use-after-free in prb_retire_rx_blk_timer_expired()
   23f787ceebf8 openvswitch: fix potential out of bound access in parse_ct
   6d1e34ee278f mcs7780: Fix initialization when CONFIG_VMAP_STACK is enabled
   d0594690a9ee rtnetlink: allocate more memory for dev_set_mac_address()
   31afa8b5edf9 ipv4: initialize fib_trie prior to register_netdev_notifier call.
   f09db7559c1f ipv6: avoid overflow of offset in ip6_find_1stfragopt
   e9b2f4617a4e net: Zero terminate ifr_name in dev_ifname().
   c10e874bc3a5 ipv4: ipv6: initialize treq->txhash in cookie_v[46]_check()
   deae9956cfb4 saa7164: fix double fetch PCIe access condition
   e0f39019aa3f drm: rcar-du: fix backport bug
   76517ed2a7fe f2fs: sanity check checkpoint segno and blkoff
   c7c6f63dbc67 media: lirc: LIRC_GET_REC_RESOLUTION should return microseconds
   f1181047ff29 mm, mprotect: flush TLB if potentially racing with a parallel reclaim leaving stale TLB entries
   9745cbec9c1f iser-target: Avoid isert_conn->cm_id dereference in isert_login_recv_done
   ae059833646f iscsi-target: Fix delayed logout processing greater than SECONDS_FOR_LOGOUT_COMP
   bf54cf1ede97 iscsi-target: Fix initial login PDU asynchronous socket close OOPs
   cf4ab9d57cbe iscsi-target: Fix early sk_data_ready LOGIN_FLAGS_READY race
   119903dc36d3 iscsi-target: Always wait for kthread_should_stop() before kthread exit
   2bf7791c6a5e target: Avoid mappedlun symlink creation during lun shutdown
   fa95dfc750fb media: platform: davinci: return -EINVAL for VPFE_CMD_S_CCDC_RAW_PARAMS ioctl
   3c2bf2bd8829 ARM: dts: armada-38x: Fix irq type for pca955
   31cd127ca69a ext4: fix overflow caused by missing cast in ext4_resize_fs()
   bad9f6142ce1 ext4: fix SEEK_HOLE/SEEK_DATA for blocksize < pagesize
   12f60018f63b mm/page_alloc: Remove kernel address exposure in free_reserved_area()
   bbccdb1e442b KVM: async_pf: make rcu irq exit if not triggered from idle task
   7de8d0c06e56 ASoC: do not close shared backend dailink
   458c8be4e208 ALSA: hda - Fix speaker output from VAIO VPCL14M1R
   c59eec4dad4a workqueue: restore WQ_UNBOUND/max_active==1 to be ordered
   8ecd8cff92a8 libata: array underflow in ata_find_dev()
   09e69607e47c Linux 4.4.80
   2f8e6140bb6a ASoC: dpcm: Avoid putting stream state to STOP when FE stream is paused
   32b850a626c5 scsi: snic: Return error code on memory allocation failure
   27eb77b5544e scsi: fnic: Avoid sending reset to firmware when another reset is in progress
   0866aed4fa64 HID: ignore Petzl USB headlamp
   cab7c045f5fd ALSA: usb-audio: test EP_FLAG_RUNNING at urb completion
   8ced91a2e920 sh_eth: enable RX descriptor word 0 shift on SH7734
   fe1da3b785b3 nvmem: imx-ocotp: Fix wrong register size
   e76426857b3e arm64: mm: fix show_pte KERN_CONT fallout
   dc48ebe33063 vfio-pci: Handle error from pci_iomap
   93794239c6b9 video: fbdev: cobalt_lcdfb: Handle return NULL error from devm_ioremap
   1286e959a59a perf symbols: Robustify reading of build-id from sysfs
   cc8b62fce96b perf tools: Install tools/lib/traceevent plugins with install-bin
   ce9b76665ecd xfrm: Don't use sk_family for socket policy lookups
   4b8adea2e3cd tools lib traceevent: Fix prev/next_prio for deadline tasks
   786fd31f6001 Btrfs: adjust outstanding_extents counter properly when dio write is split
   7ea3cc440ec9 usb: gadget: Fix copy/pasted error message
   f4a42f8492bd ACPI / scan: Prefer devices without _HID/_CID for _ADR matching
   8c065e76fbc5 ARM: s3c2410_defconfig: Fix invalid values for NF_CT_PROTO_*
   fcee67d7d618 ARM64: zynqmp: Fix i2c node's compatible string
   4bd1d0b1a170 ARM64: zynqmp: Fix W=1 dtc 1.4 warnings
   a07d8c131898 dmaengine: ti-dma-crossbar: Add some 'of_node_put()' in error path.
   328a9cdcbab9 dmaengine: ioatdma: workaround SKX ioatdma version
   6c0d9f0212f8 dmaengine: ioatdma: Add Skylake PCI Dev ID
   65dab1d8af6c openrisc: Add _text symbol to fix ksym build error
   4c1ea6a51acd irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
   1a734b39857e ASoC: nau8825: fix invalid configuration in Pre-Scalar of FLL
   152684089ea3 spi: dw: Make debugfs name unique between instances
   dc19e98eb86e ASoC: tlv320aic3x: Mark the RESET register as volatile
   fc6c41f0b921 irqchip/keystone: Fix "scheduling while atomic" on rt
   1704a9695062 vfio-pci: use 32-bit comparisons for register address for gcc-4.5
   7de922c14e83 drm/msm: Verify that MSM_SUBMIT_BO_FLAGS are set
   b54e58ccceb7 drm/msm: Ensure that the hardware write pointer is valid
   cbc80312fd70 net/mlx4: Remove BUG_ON from ICM allocation routine
   386504004504 ipv6: Should use consistent conditional judgement for ip6 fragment between __ip6_append_data and ip6_finish_output
   ed3e4a435339 ARM: dts: n900: Mark eMMC slot with no-sdio and no-sd flags
   7cff0699f47e r8169: add support for RTL8168 series add-on card.
   6b99f1a84d5c x86/mce/AMD: Make the init code more robust
   f7e0f7f86ce0 tpm: Replace device number bitmap with IDR
   7e7892239327 tpm: fix a kernel memory leak in tpm-sysfs.c
   366f50133bb6 xen/blkback: don't use xen_blkif_get() in xen-blkback kthread
   53f577247738 xen/blkback: don't free be structure too early
   62208707b466 sched/cputime: Fix prev steal time accouting during CPU hotplug
   fa57125e8ec4 net: skb_needs_check() accepts CHECKSUM_NONE for tx
   fa7773191046 pstore: Use dynamic spinlock initializer
   9ece74e1006e pstore: Correctly initialize spinlock and flags
   aca5b1e3c5b7 pstore: Allow prz to control need for locking
   ff013a624258 vlan: Propagate MAC address to VLANs
   e8aff6037318 /proc/iomem: only expose physical resource addresses to privileged users
   14ae9c4b5ae2 Make file credentials available to the seqfile interfaces
   b3ddb091c77f v4l: s5c73m3: fix negation operator
   407669f2c9fe dentry name snapshots
   9909e61c1006 ipmi/watchdog: fix watchdog timeout set on reboot
   81845c2f61bf libnvdimm, btt: fix btt_rw_page not returning errors
   c4af40a7218e RDMA/uverbs: Fix the check for port number
   c7ca61734ba7 PM / Domains: defer dev_pm_domain_set() until genpd->attach_dev succeeds if present
   0e0967e26241 sched/cgroup: Move sched_online_group() back into css_online() to fix crash
   9402c6266704 kaweth: fix oops upon failed memory allocation
   19ba0e65d60b kaweth: fix firmware download
   658f9c65ee8c mpt3sas: Don't overreach ioc->reply_post[] during initialization
   63c9c49c04a1 mailbox: handle empty message in tx_tick
   21ab579fbae6 mailbox: skip complete wait event if timer expired
   686494443dd3 mailbox: always wait in mbox_send_message for blocking Tx mode
   461b44fdf02f wil6210: fix deadlock when using fw_no_recovery option
   91cc72969137 ath10k: fix null deref on wmi-tlv when trying spectral scan
   d4b159f14d61 isdn/i4l: fix buffer overflow
   633763ed93c4 isdn: Fix a sleep-in-atomic bug
   71a165f6397d net: phy: Do not perform software reset for Generic PHY
   8335b312c7cc nfc: fdp: fix NULL pointer dereference
   56548b6f505a xfs: don't BUG() on mixed direct and mapped I/O
   eb0760deee89 perf intel-pt: Ensure never to set 'last_ip' when packet 'count' is zero
   0ce32f8944c6 perf intel-pt: Use FUP always when scanning for an IP
   33f3bc42fc23 perf intel-pt: Fix last_ip usage
   01ac8afc6c8f perf intel-pt: Fix ip compression
   8255d26322a3 drm: rcar-du: Simplify and fix probe error handling
   5ec9d83b2b54 drm: rcar-du: Perform initialization/cleanup at probe/remove time
   0354df9578b4 drm/rcar: Nuke preclose hook
   b5a48676e7a2 Staging: comedi: comedi_fops: Avoid orphaned proc entry
   0c335d55cee6 Revert "powerpc/numa: Fix percpu allocations to be NUMA aware"
   fcd35f5a3f85 KVM: PPC: Book3S HV: Save/restore host values of debug registers
   17d381054b1d KVM: PPC: Book3S HV: Reload HTM registers explicitly
   f5b29db247d4 KVM: PPC: Book3S HV: Restore critical SPRs to host values on guest exit
   339fa4af4133 KVM: PPC: Book3S HV: Context-switch EBB registers properly
   29da136fbbd9 drm/nouveau/bar/gf100: fix access to upper half of BAR2
   fde885f19986 drm/vmwgfx: Fix gcc-7.1.1 warning
   376830c340ec md/raid5: add thread_group worker async_tx_issue_pending_all
   2148e9ab0cac crypto: authencesn - Fix digest_null crash
   c4efb7434a2a powerpc/pseries: Fix of_node_put() underflow during reconfig remove
   fdbcb81b5a31 net: reduce skb_warn_bad_offload() noise
   08408f7ae5cd pstore: Make spinlock per zone instead of global
   b627f6001948 af_key: Add lock to key dump
   e058f634852d Linux 4.4.79
   9c839d00dc1b alarmtimer: don't rate limit one-shot timers
   bb8109a9ca87 tracing: Fix kmemleak in instance_rmdir
   6dbd8f73a28e spmi: Include OF based modalias in device uevent
   29669d8e8f4c of: device: Export of_device_{get_modalias, uvent_modalias} to modules
   4ca0f3730e27 drm/mst: Avoid processing partially received up/down message transactions
   3d26e2ed7c8b drm/mst: Avoid dereferencing a NULL mstb in drm_dp_mst_handle_up_req()
   3383334a6cf3 drm/mst: Fix error handling during MST sideband message reception
   af7b187fe52f RDMA/core: Initialize port_num in qp_attr
   ba790013b514 ceph: fix race in concurrent readdir
   5af851adbeea staging: rtl8188eu: add TL-WN722N v2 support
   45c59e792ce6 Revert "perf/core: Drop kernel samples even though :u is specified"
   569da0be824b perf annotate: Fix broken arrow at row 0 connecting jmp instruction to its target
   8d832513726d target: Fix COMPARE_AND_WRITE caw_sem leak during se_cmd quiesce
   f57b4ae0b750 udf: Fix deadlock between writeback and udf_setsize()
   d2fa4057b11e NFS: only invalidate dentrys that are clearly invalid.
   bba6b69e1177 Input: i8042 - fix crash at boot time
   775e4dba9d07 MIPS: Fix a typo: s/preset/present/ in r2-to-r6 emulation error message
   f28e32a8e379 MIPS: Send SIGILL for linked branches in `__compute_return_epc_for_insn'
   d2220e7f285b MIPS: Rename `sigill_r6' to `sigill_r2r6' in `__compute_return_epc_for_insn'
   e5bf16f02945 MIPS: Send SIGILL for BPOSGE32 in `__compute_return_epc_for_insn'
   4c7d28c1e99d MIPS: math-emu: Prevent wrong ISA mode instruction emulation
   9dbca9e8a91a MIPS: Fix unaligned PC interpretation in `compute_return_epc'
   aebb79634ff1 MIPS: Actually decode JALX in `__compute_return_epc_for_insn'
   f87aa1203910 MIPS: Save static registers before sysmips
   a0ee41298926 MIPS: Fix MIPS I ISA /proc/cpuinfo reporting
   71de40fd4f64 x86/ioapic: Pass the correct data to unmask_ioapic_irq()
   fa7ddee3485f x86/acpi: Prevent out of bound access caused by broken ACPI tables
   62d131ec60cd MIPS: Negate error syscall return in trace
   4d9f109ff9ca MIPS: Fix mips_atomic_set() with EVA
   de34c0799d25 MIPS: Fix mips_atomic_set() retry condition
   75202d3ffca4 ftrace: Fix uninitialized variable in match_records()
   3457c0459496 vfio: New external user group/file match
   db42944cc63a vfio: Fix group release deadlock
   fca8859982fb f2fs: Don't clear SGID when inheriting ACLs
   fa696eea4d8d ipmi:ssif: Add missing unlock in error branch
   8878c53244f5 ipmi: use rcu lock around call to intf->handlers->sender()
   89308cb841c6 drm/radeon: Fix eDP for single-display iMac10,1 (v2)
   0157e2a8a719 drm/radeon/ci: disable mclk switching for high refresh rates (v2)
   ad2efae4613d drm/amd/amdgpu: Return error if initiating read out of range on vram
   a89b6e355dae s390/syscalls: Fix out of bounds arguments access
   098333918b4f Raid5 should update rdev->sectors after reshape
   78de920bae8a cx88: Fix regression in initial video standard setting
   5c7c179eb9e3 x86/xen: allow userspace access during hypercalls
   78dce99f5497 md: don't use flush_signals in userspace processes
   9b989b4d325b usb: renesas_usbhs: gadget: disable all eps when the driver stops
   abe87c1c0dff usb: renesas_usbhs: fix usbhsc_resume() for !USBHSF_RUNTIME_PWCTRL
   ff651e899073 USB: cdc-acm: add device-id for quirky printer
   ab8e00991809 usb: storage: return on error to avoid a null pointer dereference
   f883b509b48b xhci: Fix NULL pointer dereference when cleaning up streams for removed host
   09364c783c84 xhci: fix 20000ms port resume timeout
   82944485937a ipvs: SNAT packet replies only for NATed connections
   48a72b55502c PCI/PM: Restore the status of PCI devices across hibernation
   7ad6d36dc907 af_key: Fix sadb_x_ipsecrequest parsing
   b8c6a93837f0 powerpc/asm: Mark cr0 as clobbered in mftb()
   79afeb379cf4 powerpc: Fix emulation of mfocrf in emulate_step()
   397722322954 powerpc: Fix emulation of mcrf in emulate_step()
   3f888d1e40ad powerpc/64: Fix atomic64_inc_not_zero() to return an int
   c50e87ecca55 iscsi-target: Add login_keys_workaround attribute for non RFC initiators
   8045fe0a208c scsi: ses: do not add a device to an enclosure if enclosure_add_links() fails.
   e114c612e225 PM / Domains: Fix unsafe iteration over modified list of domain providers
   f422cfc38ecc PM / Domains: Fix unsafe iteration over modified list of device links
   50b40109fada ASoC: compress: Derive substream from stream based on direction
   c2d4d4fa320c wlcore: fix 64K page support
   1e3b56033e82 Bluetooth: use constant time memory comparison for secret values
   3762d7ed1a43 perf intel-pt: Clear FUP flag on error
   b559fa787c62 perf intel-pt: Ensure IP is zero when state is INTEL_PT_STATE_NO_IP
   2178b4aa56b7 perf intel-pt: Fix missing stack clear
   a4ebb58fd124 perf intel-pt: Improve sample timestamp
   5523884640e9 perf intel-pt: Move decoder error setting into one condition
   ac8f07408acd NFC: Add sockaddr length checks before accessing sa_family in bind handlers
   f71ce1c865cb nfc: Fix the sockaddr length sanitization in llcp_sock_connect
   ecb7abed0be9 nfc: Ensure presence of required attributes in the activate_target handler
   b57a72d5aaf8 NFC: nfcmrvl: fix firmware-management initialisation
   5288f3f80c4c NFC: nfcmrvl: use nfc-device for firmware download
   6e2b65dc2774 NFC: nfcmrvl: do not use device-managed resources
   4798e468b37b NFC: nfcmrvl_uart: add missing tty-device sanity check
   f4d41096f49e NFC: fix broken device allocation
   5c2828839909 ath9k: fix tx99 bus error
   a86c42f760ff ath9k: fix tx99 use after free
   2c1ac3721d4a thermal: cpu_cooling: Avoid accessing potentially freed structures
   f440ec864fd8 s5p-jpeg: don't return a random width/height
   0ff1117c08c2 ir-core: fix gcc-7 warning on bool arithmetic
   83863589806d disable new gcc-7.1.1 warnings for now
   ece78cd779f4 Linux 4.4.78
   3ed43caedf69 kvm: vmx: allow host to access guest MSR_IA32_BNDCFGS
   6ffa92ffaed8 kvm: vmx: Check value written to IA32_BNDCFGS
   a40f0ccd4f1c kvm: x86: Guest BNDCFGS requires guest MPX support
   be6f33a61f33 kvm: vmx: Do not disable intercepts for BNDCFGS
   c6f3576ed0f2 KVM: x86: disable MPX if host did not enable MPX XSAVE features
   999b96b4de81 tracing: Use SOFTIRQ_OFFSET for softirq dectection for more accurate results
   c17f6512463e PM / QoS: return -EINVAL for bogus strings
   275d4be9d39f PM / wakeirq: Convert to SRCU
   988067ec9606 sched/topology: Optimize build_group_mask()
   5c34f49776b8 sched/topology: Fix overlapping sched_group_mask
   4e3c1188521a crypto: caam - fix signals handling
   f1bf5d83a9c1 crypto: sha1-ssse3 - Disable avx2
   fc43f0935035 crypto: atmel - only treat EBUSY as transient if backlog
   d05fbdbe6d1c crypto: talitos - Extend max key length for SHA384/512-HMAC and AEAD
   8f93a9aa1d65 mm: fix overflow check in expand_upwards()
   0f4fa2138e83 tpm: Issue a TPM2_Shutdown for TPM2 devices.
   5c9a2972983f Add "shutdown" to "struct class".
   5ec5771bcb2b tpm: Provide strong locking for device removal
   5e07de5b5a4e tpm: Get rid of chip->pdev
   a2e0b1c18c09 selftests/capabilities: Fix the test_execve test
   f07288cfb0f7 mnt: Make propagate_umount less slow for overlapping mount propagation trees
   fdb8f1049992 mnt: In propgate_umount handle visiting mounts in any order
   7cbc3955ef3b mnt: In umount propagation reparent in a separate pass
   050b074e2285 vt: fix unchecked __put_user() in tioclinux ioctls
   86949eb96466 exec: Limit arg stack to at most 75% of _STK_LIM
   7888c0296c87 s390: reduce ELF_ET_DYN_BASE
   72a333a0468e powerpc: move ELF_ET_DYN_BASE to 4GB / 4MB
   43cf90f788ac arm64: move ELF_ET_DYN_BASE to 4GB / 4MB
   d2471b5e84f3 arm: move ELF_ET_DYN_BASE to 4MB
   7eb968cd04d4 binfmt_elf: use ELF_ET_DYN_BASE only for PIE
   4544e9ebef4c checkpatch: silence perl 5.26.0 unescaped left brace warnings
   68b0f5d85b3a fs/dcache.c: fix spin lockup issue on nlru->lock
   2d0db02d2e8f mm/list_lru.c: fix list_lru_count_node() to be race free
   717ce69e47f0 kernel/extable.c: mark core_kernel_text notrace
   0d6ee0bea866 tools/lib/lockdep: Reduce MAX_LOCK_DEPTH to avoid overflowing lock_chain/: Depth
   b29145746576 parisc/mm: Ensure IRQs are off in switch_mm()
   635a58225c36 parisc: DMA API: return error instead of BUG_ON for dma ops on non dma devs
   f265641dc874 parisc: use compat_sys_keyctl()
   e18ca17b9040 parisc: Report SIGSEGV instead of SIGBUS when running out of stack
   970616464f43 irqchip/gic-v3: Fix out-of-bound access in gic_set_affinity
   2d3c10e21571 cfg80211: Check if PMKID attribute is of expected size
   24d0410712b0 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES
   05bf0b6ef9ce cfg80211: Define nla_policy for NL80211_ATTR_LOCAL_MESH_POWER_MODE
   4c7021c2fb74 brcmfmac: fix possible buffer overflow in brcmf_cfg80211_mgmt_tx()
   9618eb4af306 rds: tcp: use sock_create_lite() to create the accept socket
   89e7f17f8f64 vrf: fix bug_on triggered by rx when destroying a vrf
   eb7bef1db6f3 net: ipv6: Compare lwstate in detecting duplicate nexthops
   0c32b01ee49d ipv6: dad: don't remove dynamic addresses if link is down
   38ae32c9f13d net: handle NAPI_GRO_FREE_STOLEN_HEAD case also in napi_frags_finish()
   1a4f13e0a99a bpf: prevent leaking pointer via xadd on unpriviledged
   d598f7ff24db net: prevent sign extension in dev_get_stats()
   32a44f1ba7ed tcp: reset sk_rx_dst in tcp_disconnect()
   ccff2f4afbc1 net: dp83640: Avoid NULL pointer dereference.
   6a87cca39f29 ipv6: avoid unregistering inet6_dev for loopback
   f71e5140242a net/phy: micrel: configure intterupts after autoneg workaround
   c485792ed649 net: sched: Fix one possible panic when no destroy callback
   0be4c96e7c57 net_sched: fix error recovery at qdisc creation
   9e0499d7d30c Linux 4.4.77
   52b9815d37fc saa7134: fix warm Medion 7134 EEPROM read
   646b65808b0d x86/mm/pat: Don't report PAT on CPUs that don't support it
   ad5a88c54cd2 ext4: check return value of kstrtoull correctly in reserved_clusters_store
   cb2bc13d0b55 staging: comedi: fix clean-up of comedi_class in comedi_init()
   370d06c6b075 staging: vt6556: vnt_start Fix missing call to vnt_key_init_table.
   627f3abeeac1 tcp: fix tcp_mark_head_lost to check skb len before fragmenting
   ff62c63109d9 md: fix super_offset endianness in super_1_rdev_size_change
   e20894aad9e8 md: fix incorrect use of lexx_to_cpu in does_sb_need_changing
   2b4f81fb56cf perf tools: Use readdir() instead of deprecated readdir_r() again
   c04b8bbd64be perf tests: Remove wrong semicolon in while loop in CQM test
   1991cbd2c486 perf trace: Do not process PERF_RECORD_LOST twice
   5a25a08ad5e6 perf dwarf: Guard !x86_64 definitions under #ifdef else clause
   300d4fea8de0 perf pmu: Fix misleadingly indented assignment (whitespace)
   0ba2f070bf45 perf annotate browser: Fix behaviour of Shift-Tab with nothing focussed
   0717b5dfab93 perf tools: Remove duplicate const qualifier
   c7b8d98bff82 perf script: Use readdir() instead of deprecated readdir_r()
   56e75cee2af3 perf thread_map: Use readdir() instead of deprecated readdir_r()
   055ce585a864 perf tools: Use readdir() instead of deprecated readdir_r()
   144eb3e8e4d9 perf bench numa: Avoid possible truncation when using snprintf()
   fb3c230b7ec2 perf tests: Avoid possible truncation with dirent->d_name + snprintf
   071ca0bcf337 perf scripting perl: Fix compile error with some perl5 versions
   c9cf7ce0bbc4 perf thread_map: Correctly size buffer used with dirent->dt_name
   e5a9078a8e0e perf intel-pt: Use __fallthrough
   0586f5cd4195 perf top: Use __fallthrough
   1ca0a4098005 tools strfilter: Use __fallthrough
   57a4c2504b77 tools string: Use __fallthrough in perf_atoll()
   e1b7b00a1bd5 tools include: Add a __fallthrough statement
   034e10b4f834 mqueue: fix a use-after-free in sys_mq_notify()
   5fd2bba08c17 RDMA/uverbs: Check port number supplied by user verbs cmds
   92e90c20dc38 KEYS: Fix an error code in request_master_key()
   483b1c69655d ath10k: override CE5 config for QCA9377
   e47e71766640 x86/uaccess: Optimize copy_user_enhanced_fast_string() for short strings
   0214a8ca61e2 x86/tools: Fix gcc-7 warning in relocs.c
   e952c291df09 gfs2: Fix glock rhashtable rcu bug
   ac12d6abed6c USB: serial: qcserial: new Sierra Wireless EM7305 device ID
   1a04853de069 USB: serial: option: add two Longcheer device ids
   174ddbcc69e2 pinctrl: sh-pfc: Update info pointer after SoC-specific init
   45424528a184 pinctrl: mxs: atomically switch mux and drive strength config
   79565741fce0 pinctrl: sunxi: Fix SPDIF function name for A83T
   3c4720871bdd pinctrl: meson: meson8b: fix the NAND DQS pins
   5d030f597f47 pinctrl: sh-pfc: r8a7791: Fix SCIF2 pinmux data
   a2148222e375 sysctl: report EINVAL if value is larger than UINT_MAX for proc_douintvec
   e8505e6432c2 sysctl: don't print negative flag for proc_douintvec
   2e42225b85ee mac80211_hwsim: Replace bogus hrtimer clockid
   93f526ffe8ae usb: Fix typo in the definition of Endpoint[out]Request
   c6bf62a36175 usb: usbip: set buffer pointers to NULL after free
   ab96add78bfe Add USB quirk for HVR-950q to avoid intermittent device resets
   45c73d0c7a96 USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick
   c8130087ff4d usb: dwc3: replace %p with %pK
   a080ec466c34 drm/virtio: don't leak bo on drm_gem_object_init failure
   fe0bb2ac167b tracing/kprobes: Allow to create probe with a module name starting with a digit
   78f20db86418 mm: fix classzone_idx underflow in shrink_zones()
   1f97e170cfc5 bgmac: reset & enable Ethernet core before using it
   c01ace719ebe driver core: platform: fix race condition with driver_override
   4043d5bca587 fs: completely ignore unknown open flags
   ccb973e681d8 fs: add a VALID_OPEN_FLAGS

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index a8a8ef40cf99..b797dff25afd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "be70c37e4c370a8fe2ffef9e3300a266085588c4"
-SRCREV_meta ?= "10332510892eaf50de4c92e8269fff03efc69240"
+SRCREV_machine ?= "1ac44e48420edba265d0fa18e4040e6d975776e6"
+SRCREV_meta ?= "8e9afd032ff3be672506a0e5ed51cde9dc45031f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.76"
+LINUX_VERSION ?= "4.4.85"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index f80a077c6057..d10803ae91a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.76"
+LINUX_VERSION ?= "4.4.85"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
-SRCREV_meta ?= "10332510892eaf50de4c92e8269fff03efc69240"
+SRCREV_machine ?= "0327f8213797c4885f86aec26cf55aeef5834180"
+SRCREV_meta ?= "8e9afd032ff3be672506a0e5ed51cde9dc45031f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index b69225a2c891..5634928b9388 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8b42f3bbf0818181eb444af119bd295029ea2caf"
-SRCREV_machine_qemuarm64 ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
-SRCREV_machine_qemumips ?= "0afe3f8c5fb95ed9c9f87f7765be53f6e0b8fad6"
-SRCREV_machine_qemuppc ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
-SRCREV_machine_qemux86 ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
-SRCREV_machine_qemux86-64 ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
-SRCREV_machine_qemumips64 ?= "45dd25b50163846c3346b93a21e967c68ab92b26"
-SRCREV_machine ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
-SRCREV_meta ?= "10332510892eaf50de4c92e8269fff03efc69240"
+SRCREV_machine_qemuarm ?= "50253831d9b2d3dfb8e910debda66405cb11900a"
+SRCREV_machine_qemuarm64 ?= "0327f8213797c4885f86aec26cf55aeef5834180"
+SRCREV_machine_qemumips ?= "d49ac34e4781b4bcd4c1728338668bb1fd321f7c"
+SRCREV_machine_qemuppc ?= "0327f8213797c4885f86aec26cf55aeef5834180"
+SRCREV_machine_qemux86 ?= "0327f8213797c4885f86aec26cf55aeef5834180"
+SRCREV_machine_qemux86-64 ?= "0327f8213797c4885f86aec26cf55aeef5834180"
+SRCREV_machine_qemumips64 ?= "310df4a803d8938415e761668426391985193398"
+SRCREV_machine ?= "0327f8213797c4885f86aec26cf55aeef5834180"
+SRCREV_meta ?= "8e9afd032ff3be672506a0e5ed51cde9dc45031f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.76"
+LINUX_VERSION ?= "4.4.85"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


