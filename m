Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C21079AF4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:40:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9HDe5X0007400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Oct 2018 06:40:05 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 17 Oct 2018 06:40:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 17 Oct 2018 09:38:57 -0400
Message-ID: <0905a366c274b88965b24c7d5c65bc3c82fb49f4.1539783452.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1539783452.git.bruce.ashfield@windriver.com>
References: <cover.1539783452.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/4.18: update to v4.18.14
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
X-List-Received-Date: Wed, 17 Oct 2018 13:40:05 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following commits:

   e7d199e92956 Linux 4.18.14
   91da9ba7bbbd ath10k: fix scan crash due to incorrect length calculation
   7903dacfc64e rds: rds_ib_recv_alloc_cache() should call alloc_percpu_gfp() instead
   ef37df3b8284 ubifs: Check for name being NULL while mounting
   09fbdca26741 ucma: fix a use-after-free in ucma_resolve_ip()
   9753a6f7497d tipc: call start and done ops directly in __tipc_nl_compat_dumpit()
   4a04224bbd1a f2fs: fix invalid memory access
   50231468deda ARC: clone syscall to setp r25 as thread pointer
   f4a856d4ca30 powerpc/lib: fix book3s/32 boot failure due to code patching
   2025ef74e8c4 powerpc: Avoid code patching freed init sections
   e4f71e6ae0cb of: unittest: Disable interrupt node tests for old world MAC systems
   a09a553b1693 tty: Drop tty->count on tty_reopen() failure
   274a367121ae usb: cdc_acm: Do not leak URB buffers
   6f0a2f6649b7 USB: serial: option: add two-endpoints device-id flag
   0fcb2fb9731a USB: serial: option: improve Quectel EP06 detection
   883f14f7302a USB: serial: simple: add Motorola Tetra MTP6550 id
   7cea0a2e8c59 usb: xhci-mtk: resume USB3 roothub first
   67c8b9c6c59c xhci: Add missing CAS workaround for Intel Sunrise Point xHCI
   226c5c8a540a dm cache: fix resize crash if user doesn't reload cache table
   f10b1cdb6190 dm cache metadata: ignore hints array being too small during resize
   75e4e2fae0fe dm mpath: fix attached_handler_name leak and dangling hw_handler_name pointer
   a92f4488357e PM / core: Clear the direct_complete flag on errors
   3561037582ae mac80211: fix setting IEEE80211_KEY_FLAG_RX_MGMT for AP mode keys
   e9d0ba506ea8 PCI: Reprogram bridge prefetch registers on resume
   db68b064bb73 x86/vdso: Fix vDSO syscall fallback asm constraint regression
   54f54a2b7fb3 x86/vdso: Only enable vDSO retpolines when enabled and supported
   1af2998c34e1 selftests/x86: Add clock_gettime() tests to test_vdso
   e7e1889390a4 x86/vdso: Fix asm constraints on vDSO syscall fallbacks
   7ac2c7dcc1a0 drm: fix use-after-free read in drm_mode_create_lease_ioctl()
   a2cef7d049f0 drm/syncobj: Don't leak fences when WAIT_FOR_SUBMIT is set
   3361789e57ec drm/amdgpu: Fix vce work queue was not cancelled when suspend
   b67f9b6ab232 mac80211: allocate TXQs for active monitor interfaces
   6b1adad3348a mmc: slot-gpio: Fix debounce time to use miliseconds again
   7cf3272144b9 mmc: core: Fix debounce time to use microseconds
   7e62c2fbc1fe xen-netback: fix input validation in xenvif_set_hash_mapping()
   9b01f16ed9b9 fbdev/omapfb: fix omapfb_memory_read infoleak
   771df4eea402 clocksource/drivers/timer-atmel-pit: Properly handle error cases
   45a156123ce4 pstore/ram: Fix failure-path memory leak in ramoops_init
   b82610b5bad9 blk-mq: I/O and timer unplugs are inverted in blktrace
   fe65bf7b541f KVM: VMX: check for existence of secondary exec controls before accessing
   fe7790c37cf1 KVM: x86: fix L1TF's MMIO GFN calculation
   7d7e3202b7ef mm/vmstat.c: skip NR_TLB_REMOTE_FLUSH* properly
   6b9c2cc710f5 mm, thp: fix mlocking THP page with migration enabled
   0af5b07d2e62 mm: migration: fix migration of huge PMD shared pages
   f5a6974616b4 perf/core: Add sanity check to deal with pinned event failure
   04a3fbba60ae Linux 4.18.13
   d9ef158adf04 Revert "drm/amd/pp: Send khz clock values to DC for smu7/8"
   aad46f77ece0 dm thin metadata: fix __udivdi3 undefined on 32-bit
   5319425024ab ixgbe: check return value of napi_complete_done()
   2083ef10dedd HID: i2c-hid: disable runtime PM operations on hantick touchpad
   f52ab5277368 ocfs2: fix locking for res->tracking and dlm->tracking_list
   2b89f7ad519d proc: restrict kernel stack dumps to root
   6a2cfcdd7b6e tools: hv: fcopy: set 'error' in case an unknown operation was requested
   549498802024 Drivers: hv: vmbus: Use get/put_cpu() in vmbus_connect()
   116337deb270 gpiolib: Free the last requested descriptor
   277f800a2186 crypto: caam/jr - fix ablkcipher_edesc pointer arithmetic
   b6479a45bd29 crypto: mxs-dcp - Fix wait logic on chan threads
   27dff727876e crypto: chelsio - Fix memory corruption in DMA Mapped buffers.
   18b4a538497d crypto: qat - Fix KASAN stack-out-of-bounds bug in adf_probe()
   23b043d513e3 ALSA: hda/realtek - Cannot adjust speaker's volume on Dell XPS 27 7760
   6abd14f40148 iommu/amd: Clear memory encryption mask from physical address
   8cdcd02d9985 smb2: fix missing files in root share directory listing
   17e5fb7f93f8 cpufreq: qcom-kryo: Fix section annotations
   5105f039ef26 firmware: Always initialize the fw_priv list object
   aa26105b73b0 firmware: Fix security issue with request_firmware_into_buf()
   8b84e8d275d8 b43: fix DMA error related regression with proprietary firmware
   23917913b671 sysfs: Do not return POSIX ACL xattrs via listxattr
   51da3fc5cbce ovl: fix format of setxattr debug
   1c7949a5f637 ovl: fix memory leak on unlink of indexed file
   c33def1bb3aa ovl: fix access beyond unterminated strings
   a6aa74c2ad61 ovl: set I_CREATING on inode being created
   90f06e1b81b9 vfs: don't evict uninitialized inode
   d08d1bb535f4 new primitive: discard_new_inode()
   87a50a5e94e3 x86/APM: Fix build warning when PROC_FS is not enabled
   dd618fe2ffa1 xen: fix GCC warning and remove duplicate EVTCHN_ROW/EVTCHN_COL usage
   b207598b0abe xen: avoid crash in disable_hotplug_cpu
   58d77fd26f83 xen/manage: don't complain about an empty value in control/sysrq node
   20d06facfd2f asm-generic: io: Fix ioport_map() for !CONFIG_GENERIC_IOMAP && CONFIG_INDIRECT_PIO
   80e4d9a51376 cifs: read overflow in is_valid_oplock_break()
   e8dcd7866638 s390/qeth: don't dump past end of unknown HW header
   31ae67ad9ed6 s390/qeth: use vzalloc for QUERY OAT buffer
   d3a7c76eb490 r8169: Clear RTL_FLAG_TASK_*_PENDING when clearing RTL_FLAG_TASK_ENABLED
   5113d730a1ee drm/amdgpu: fix error handling in amdgpu_cs_user_fence_chunk
   e76f7b7df846 arm64: jump_label.h: use asm_volatile_goto macro instead of "asm goto"
   ed14acd316ba drm/amdgpu: Fix SDMA hang in prt mode v2
   7389051d3c63 hexagon: modify ffs() and fls() to return int
   cbbb852e4556 arch/hexagon: fix kernel/dma.c build warning
   41b2bc509cda netfilter: xt_hashlimit: use s->file instead of s->private
   419033c32a82 netfilter: nfnetlink_queue: Solve the NFQUEUE/conntrack clash for NF_REPEAT
   e63d53f2835d dm thin metadata: try to avoid ever aborting transactions
   7c995133d035 sched/topology: Set correct NUMA topology type
   52017328fa15 perf/x86/intel: Add support/quirk for the MISPREDICT bit on Knights Landing CPUs
   1080c0f57e00 net: ena: fix missing calls to READ_ONCE
   968759747e95 net: ena: fix missing lock during device destruction
   cfa70f3c46f1 net: ena: fix potential double ena_destroy_device()
   023ae1b4c025 net: ena: fix device destruction to gracefully free resources
   3953e192748f net: ena: fix driver when PAGE_SIZE == 64kB
   0728c271d518 net: ena: fix surprise unplug NULL dereference kernel crash
   3a035b70eb92 fs/cifs: suppress a string overflow warning
   07d1b1058aea r8169: set TxConfig register after TX / RX is enabled, just like RxConfig
   8a100be2813a dm raid: fix RAID leg rebuild errors
   659cd50c8ace dm raid: fix rebuild of specific devices by updating superblock
   895fe22aa4d6 dm raid: fix stripe adding reshape deadlock
   00063fa09bc1 drm/nouveau/disp/gm200-: enforce identity-mapped SOR assignment for LVDS/eDP panels
   6978b0eb61c0 drm/nouveau/disp: fix DP disable race
   c65768326592 drm/nouveau/TBDdevinit: don't fail when PMU/PRE_OS is missing from VBIOS
   e4a75379e8eb drm/nouveau/mmu: don't attempt to dereference vmm without valid instance pointer
   5f0e9912e82c drm/nouveau: fix oops in client init failure path
   d097790cec56 dm raid: fix reshape race on small devices
   816f7c26eee3 HID: i2c-hid: Don't reset device upon system resume
   bfe18751bf8a net/mlx5: Consider PCI domain in search for next dev
   3029f6d6608d bnxt_re: Fix couple of memory leaks that could lead to IOMMU call traces
   80b6e9d53846 nvmet-rdma: fix possible bogus dereference under heavy load
   1d44f7f5bc07 USB: yurex: Check for truncation in yurex_read()
   e6ecfa261ae6 usb: host: xhci-plat: Iterate over parent nodes for finding quirks
   3f97eca3c822 HID: sensor-hub: Restore fixup for Lenovo ThinkPad Helix 2 sensor hub report
   027f315487ef riscv: Do not overwrite initrd_start and initrd_end
   59db47dd566b RDMA/ucma: check fd type in ucma_migrate_id()
   d77c7de489ff iio: imu: st_lsm6dsx: take into account ts samples in wm configuration
   86716fd6b985 Revert "iio: temperature: maxim_thermocouple: add MAX31856 part"
   c296c887f743 netfilter: nf_tables: release chain in flushing set
   7e8fc7dcb4d6 netfilter: kconfig: nat related expression depend on nftables core
   c3501b899ff9 perf annotate: Fix parsing aarch64 branch instructions after objdump update
   3cc1b441a4b9 perf probe powerpc: Ignore SyS symbols irrespective of endianness
   6f8073072f7b perf util: Fix bad memory access in trace info.
   56b4732271c7 perf evsel: Fix potential null pointer dereference in perf_evsel__new_idx()
   4ac14f4b3179 perf annotate: Properly interpret indirect call
   dbd0ea4cfa2a scsi: qedi: Add the CRC size within iSCSI NVM image
   319949c5e4a8 scsi: iscsi: target: Fix conn_ops double free
   27fbee89e119 scsi: iscsi: target: Set conn->sess to NULL when iscsi_login_set_conn_values fails
   820c01bcca82 HID: hid-saitek: Add device ID for RAT 7 Contagion
   3f2822e4dadd usb: gadget: fotg210-udc: Fix memory leak of fotg210->ep[i]
   386562cba8c2 HID: add support for Apple Magic Keyboards
   11c069b7eb84 HID: intel-ish-hid: Enable Sunrise Point-H ish driver
   3403eaa94cfc netfilter: xt_checksum: ignore gso skbs
   1d569211070e netfilter: xt_cluster: add dependency on conntrack module
   11b165210c72 bpf: 32-bit RSH verification must truncate input before the ALU op
   f69ad066fb2b mm: madvise(MADV_DODUMP): allow hugetlbfs pages
   53df63ddc599 afs: Fix cell specification to permit an empty address list
   784ce43a54fa firmware: arm_scmi: fix divide by zero when sustained_perf_level is zero
   131a6926fa4d ceph: avoid a use-after-free in ceph_destroy_options()
   e5f09c519ea0 nds32: linker script: GCOV kernel may refers data in __exit
   20107ca73afe tools/vm/page-types.c: fix "defined but not used" warning
   9f62a57c6670 tools/vm/slabinfo.c: fix sign-compare warning
   8474b701d459 nds32: fix build error because of wrong semicolon
   392a9a4a1c1e nds32: Fix get_user/put_user macro expand pointer problem
   447ec6add595 nds32: Fix empty call trace
   76d9688fbebb nds32: add NULL entry to the end of_device_id array
   2b847f91abb8 nds32: fix logic for module
   5bdcac88df0b net/ibm/emac: wrong emac_calc_base call was used by typo
   a06e07ce6f61 fsnotify: fix ignore mask logic in fsnotify()
   5ce55b0915e7 mac80211: shorten the IBSS debug messages
   3bcf74fdbd50 mac80211: don't Tx a deauth frame if the AP forbade Tx
   7cd6df93a292 mac80211: Fix station bandwidth setting after channel switch
   07715e528d18 mac80211: fix a race between restart and CSA flows
   040695971ce1 mac80211: fix WMM TXOP calculation
   71f1b196fb29 cfg80211: fix a type issue in ieee80211_chandef_to_operating_class()
   39bcc4406f83 mac80211: fix an off-by-one issue in A-MSDU max_subframe computation
   05166cf09a6e fs/cifs: don't translate SFM_SLASH (U+F026) to backslash
   43160392b3eb net: cadence: Fix a sleep-in-atomic-context bug in macb_halt_tx()
   26c9b6f0c196 i2c: uniphier-f: issue STOP only for last message or I2C_M_STOP
   182ae0d8643f i2c: uniphier: issue STOP only for last message or I2C_M_STOP
   abb518640aaf bpf: avoid misuse of psock when TCP_ULP_BPF collides with another ULP
   23fa01c0fcb5 bpf: Fix bpf_msg_pull_data()
   7e2069153a58 ibmvnic: Include missing return code checks in reset function
   005caa1288d9 selftests: pmtu: detect correct binary to ping ipv6 addresses
   ec0029c2aca1 selftests: pmtu: maximum MTU for vti4 is 2^16-1-20
   d65d1dd8be05 RAID10 BUG_ON in raise_barrier when force is true and conf->barrier is 0
   34ff707ac863 md/raid5-cache: disable reshape completely
   561deb108ca4 Revert "blk-throttle: fix race between blkcg_bio_issue_check() and cgroup_rmdir()"
   8dbbc215f2ba ARC: atomics: unbork atomic_fetch_##op()
   29c9e7e73dda gpio: Fix crash due to registration race
   e8f38e4e2216 tools/kvm_stat: fix updates for dead guests
   52ff1e423ec9 tools/kvm_stat: fix handling of invalid paths in debugfs provider
   a9ffbadacc94 tools/kvm_stat: fix python3 issues
   58ec0839af0d mac80211: always account for A-MSDU header changes
   511edc415c6c mac80211: do not convert to A-MSDU if frag/subframe limited
   6f01b1a3c4ad cfg80211: nl80211_update_ft_ies() to validate NL80211_ATTR_IE
   aadc5d1ee02d tc-testing: add test-cases for numeric and invalid control action
   468bcedcd850 net: mvpp2: initialize port of_node pointer
   4abef73b0770 sh_eth: Add R7S9210 support
   4440af5a7e45 net: hns: add netif_carrier_off before change speed and duplex
   f97a366fdbad net: hns: add the code for cleaning pkt in chip
   7d3acb1372f6 tipc: switch to rhashtable iterator
   cf09d1f5a507 bpf: fix sg shift repair start offset in bpf_msg_pull_data
   89826ce1bbca bpf: fix shift upon scatterlist ring wrap-around in bpf_msg_pull_data
   0920815e24f0 bpf: fix msg->data/data_end after sg shift repair in bpf_msg_pull_data
   34930327c610 gpio: dwapb: Fix error handling in dwapb_gpio_probe()
   6c5cdd4730b1 gpiolib-acpi: Register GpioInt ACPI event handlers from a late_initcall
   13db4478a11e gpiolib: acpi: Switch to cansleep version of GPIO library call
   06a62b7a0c5e mac80211: avoid kernel panic when building AMSDU from non-linear SKB
   d935ea54dbd8 mac80211: mesh: fix HWMP sequence numbering to follow standard
   a1f9ac32509a gpio: adp5588: Fix sleep-in-atomic-context bug
   3f84a6c18fce bpf: fix several offset tests in bpf_msg_pull_data
   bd266daa9fe1 nl80211: Pass center frequency in kHz instead of MHz
   5955b8ec20d7 nl80211: Fix nla_put_u8 to u16 for NL80211_WMMR_TXOP
   03950ebc945c mac80211_hwsim: Fix possible Spectre-v1 for hwsim_world_regdom_custom
   bfcb6097e5f3 cfg80211: make wmm_rule part of the reg_rule structure
   9df4febf5e91 mac80211_hwsim: correct use of IEEE80211_VHT_CAP_RXSTBC_X
   3d0d794ca9ef mac80211: correct use of IEEE80211_VHT_CAP_RXSTBC_X
   36de3d48270d bpf: sockmap, decrement copied count correctly in redirect error case
   7feb1f2b5d8d bpf, sockmap: fix psock refcount leak in bpf_tcp_recvmsg
   427e7707d932 bpf, sockmap: fix potential use after free in bpf_tcp_close
   0dcf1bcde827 scsi: aacraid: fix a signedness bug
   c08d2054307f scsi: libata: Add missing newline at end of file
   4f3e708120f3 scsi: csiostor: fix incorrect port capabilities
   74a301701659 scsi: csiostor: add a check for NULL pointer after kmalloc()
   c31c8008c757 btrfs: btrfs_shrink_device should call commit transaction at the end
   0d6ba1ecba26 cfg80211: remove division by size of sizeof(struct ieee80211_wmm_rule)
   1f0f925f98b4 KVM: PPC: Book3S HV: Don't truncate HPTE index in xlate function
   9e07d06651bc Btrfs: fix unexpected failure of nocow buffered writes after snapshotting when low on space
   32c7667fbcbd mac80211_hwsim: require at least one channel
   2466b26094bc mac80211: Run TXQ teardown code before de-registering interfaces
   3964f22686a6 rseq/selftests: fix parametrized test with -fpie
   7da07a3216a0 Linux 4.18.12
   c483061d4610 media: v4l: event: Prevent freeing event subscriptions while accessed
   926415e1e4c9 arm64: KVM: Sanitize PSTATE.M when being set from userspace
   5fddc4cd7aec powerpc/pseries: Fix unitialized timer reset on migration
   7f3a5baeacdf powerpc/pkeys: Fix reading of ibm, processor-storage-keys property
   4faeadc4f7b5 powerpc: fix csum_ipv6_magic() on little endian platforms
   31d2bff9f696 KVM: PPC: Book3S HV: Fix guest r11 corruption with POWER9 TM workarounds
   8379aa480e95 x86/pti: Fix section mismatch warning/error
   0f40f4a21a10 clk: x86: Set default parent to 48Mhz
   d948acce9a0c i2c: i801: Allow ACPI AML access I/O ports not reserved for SMBus
   31b5f66e90b2 arm/arm64: smccc-1.1: Handle function result as parameters
   c1baf3699d84 arm/arm64: smccc-1.1: Make return values unsigned long
   8ad1f551f802 drm/amdgpu: Need to set moved to true when evict bo
   68327465ccdb ARM: dts: omap4-droid4: Fix emmc errors seen on some devices
   b32e647a8375 nvme-fcloop: Fix dropped LS's to removed target port
   22670e847f7c ata: ftide010: Add a quirk for SQ201
   65c96da9c684 drm/amdgpu: Update power state at the end of smu hw_init.
   21a73b809735 drm/amdgpu: Enable/disable gfx PG feature in rlc safe mode
   4adf34c33950 Revert "ARM: dts: imx7d: Invert legacy PCI irq mapping"
   78dabdae8108 hwmon: (adt7475) Make adt7475_read_word() return errors
   e41ea7c77cb2 hwmon: (ina2xx) fix sysfs shunt resistor read access
   aada57693e81 crypto: cavium/nitrox - fix for command corruption in queue full case with backlog submissions.
   19f2fedf4f43 crypto: chtls - fix null dereference chtls_free_uld()
   ff53d5051675 i40e: fix condition of WARN_ONCE for stat strings
   be97150c4a54 i40e: Fix for Tx timeouts when interface is brought up if DCB is enabled
   4ef71783033a ixgbe: fix driver behaviour after issuing VFLR
   3e8566205e04 e1000: ensure to free old tx/rx rings in set_ringparam()
   f9b0af8f9ad5 e1000: check on netif_running() before calling e1000_up()
   1ca43c80d80f ice: Fix potential return of uninitialized value
   0753c86efc6c ice: Fix a few null pointer dereference issues
   939817cd00d2 tools: bpftool: return from do_event_pipe() on bad arguments
   1dec7a1e6a54 ice: Set VLAN flags correctly
   1c83a5aa0f26 ice: Use order_base_2 to calculate higher power of 2
   1dd0b6ce76ee ice: Fix bugs in control queue processing
   9289b179fc4e ice: Clean control queues only when they are initialized
   32d99e3e63c7 ice: Report stats for allocated queues via ethtool stats
   c0f20df3b1fc ice: Fix multiple static analyser warnings
   1801431dc7aa net: hns3: fix page_offset overflow when CONFIG_ARM64_64K_PAGES
   374eb417162b net: hns: fix skb->truesize underestimation
   2d4a79238686 net: hns: fix length and page_offset overflow when CONFIG_ARM64_64K_PAGES
   d96820d46bc3 tcp_bbr: in restart from idle, see if we should exit PROBE_RTT
   e5e63d2bb9b2 tcp_bbr: add bbr_check_probe_rtt_done() helper
   a66193f585eb net/ncsi: Fixup .dumpit message flags and ID check in Netlink handler
   9d028c09d1cf amdgpu: fix multi-process hang issue
   8824ceb2580c drm/amdgpu: fix preamble handling
   8483f3b7f424 drm/amdgpu: fix VM clearing for the root PD
   a5c7547b45b4 bpf: sockmap: write_space events need to be passed to TCP handler
   9c3d97879505 tls: possible hang when do_tcp_sendpages hits sndbuf is full case
   a0be77d6d940 bpf, sockmap: fix sock hash count in alloc_sock_hash_elem
   efed642bc585 bpf, sockmap: fix sock_hash_alloc and reject zero-sized keys
   0a9fd2a9875b ARM: dts: omap4-droid4: fix vibrations on Droid 4
   f7468a7160e1 bus: ti-sysc: Fix no_console_suspend handling
   b8f4b96768c0 mmc: android-goldfish: fix bad logic of sg_copy_{from,to}_buffer conversion
   d02aee5cf4ea mmc: atmel-mci: fix bad logic of sg_copy_{from,to}_buffer conversion
   1a7a1ad290d4 isofs: reject hardware sector size > 2048 bytes
   2da832f43da5 thermal: of-thermal: disable passive polling when thermal zone is disabled
   6a3f378b7614 qed: Avoid sending mailbox commands when MFW is not responsive
   c36724c64780 qed: Prevent a possible deadlock during driver load and unload
   1e85fc417c11 qed: Wait for MCP halt and resume commands to take place
   c91ab927a8b7 qed: Wait for ready indication before rereading the shmem
   67eb28b0f832 bus: ti-sysc: Fix module register ioremap for larger offsets
   3609bd6105c1 ARM: OMAP2+: Fix module address for modules using mpu_rt_idx
   1fcd5e01d26e ARM: OMAP2+: Fix null hwmod for ti-sysc debug
   4435064439c6 arm64: KVM: Tighten guest core register access from userspace
   12a7e915c506 RDMA/uverbs: Atomically flush and mark closed the comp event queue
   cbbb9f08566e ACPI / hotplug / PCI: Don't scan for non-hotplug bridges if slot is not bridge
   0c7898792c9a IB/hfi1: Fix destroy_qp hang after a link down
   b34ba9e02408 IB/hfi1: Fix context recovery when PBC has an UnsupportedVL
   bcc5f9f5e11e IB/hfi1: Invalid user input can result in crash
   2cced23e5483 IB/hfi1: Fix SL array bounds check
   fa22f4874e94 IB/srp: Avoid that sg_reset -d ${srp_device} triggers an infinite loop
   ebc51114fa51 Input: elantech - enable middle button of touchpad on ThinkPad P72
   f44f3d0a9e9f filesystem-dax: Fix use of zero page
   7ebfc8f69a37 ext2, dax: set ext2_dax_aops for dax files
   2436ce1bad9e uaccess: Fix is_source param for check_copy_size() in copy_to_iter_mcsafe()
   dc38ebde8a52 USB: remove LPM management from usb_driver_claim_interface()
   de425c9ae7bf Revert "usb: cdc-wdm: Fix a sleep-in-atomic-context bug in service_outstanding_interrupt()"
   8badb9b1af73 USB: usbdevfs: restore warning for nonsensical flags
   b5376ef73d33 USB: usbdevfs: sanitize flags more
   8e2842a2e175 usb: musb: dsps: do not disable CPPI41 irq in driver teardown
   608677656ac2 usb: core: safely deal with the dynamic quirk lists
   7b169e33a3bc usb: roles: Take care of driver module reference counting
   95b273c4038c USB: handle NULL config in usb_find_alt_setting()
   f3a6a40b3793 USB: fix error handling in usb_driver_claim_interface()
   2c2860d0e876 regulator: Fix 'do-nothing' value for regulators without suspend state
   ad023c0c3613 regulator: fix crash caused by null driver data
   bc9f63756ac8 spi: rspi: Fix interrupted DMA transfers
   f9ca5597ab70 spi: rspi: Fix invalid SPI use during system suspend
   2469b01fa514 spi: sh-msiof: Fix handling of write value for SISTR register
   38274415d118 spi: sh-msiof: Fix invalid SPI use during system suspend
   a2b928011352 spi: tegra20-slink: explicitly enable/disable clock
   825e12a2ed63 intel_th: Fix resource handling for ACPI glue layer
   c3b92e93b23a intel_th: Fix device removal logic
   98e1a83c338e serial: cpm_uart: return immediately from console poll
   e91bf9073b44 serial: mvebu-uart: Fix reporting of effective CSIZE to userspace
   5d554763aaac serial: imx: restore handshaking irq for imx1
   98ecfdf49ff7 tty: serial: lpuart: avoid leaking struct tty_struct
   fdbbdfeeb699 x86/mm: Expand static page table for fixmap space
   41a770d90b88 block: fix deadline elevator drain for zoned block devices
   0051646c2cc2 floppy: Do not copy a kernel pointer to user memory in FDGETPRM ioctl
   acee207b7cc9 gpio: tegra: Fix tegra_gpio_irq_set_type()
   dbb2a1e3bb37 perf tests: Fix indexing when invoking subtests
   6b07342e2596 drm/vc4: plane: Expand the lower bits by repeating the higher bits
   c94ce4bf1aff ARM: dts: dra7: fix DCAN node addresses
   e80225d36dca drm/vc4: Add missing formats to vc4_format_mod_supported().
   70b914929ad7 iio: 104-quad-8: Fix off-by-one error in register selection
   b6b75c81c31a Input: xen-kbdfront - fix multi-touch XenStore node's locations
   31a92226a5d5 ath10k: fix memory leak of tpc_stats
   5f2391032c06 fs/lock: skip lock owner pid translation in case we are in init_pid_ns
   00b438869cbe ath10k: snoc: use correct bus-specific pointer in RX retry
   06c21f7423e7 ath10k: fix incorrect size of dma_free_coherent in ath10k_ce_alloc_src_ring_64
   10db0e22fb8c staging: pi433: fix race condition in pi433_ioctl
   fff64d9fb381 EDAC, altera: Fix an error handling path in altr_s10_sdram_probe()
   0855e6e1ac14 EDAC: Fix memleak in module init error path
   6e67b33dbe43 nfsd: fix corrupted reply to badly ordered compound
   af4b12c54b3b gpio: Fix wrong rounding in gpio-menz127
   8463cd689be0 module: exclude SHN_UNDEF symbols from kallsyms api
   163ac07ff0b2 ASoC: dapm: Fix potential DAI widget pointer deref when linking DAIs
   2edaabf0e58d EDAC, i7core: Fix memleaks and use-after-free on probe and remove
   1e4b176959fb ASoC: rsnd: SSI parent cares SWSP bit
   8d07efbdf84f ASoC: rt1305: Use ULL suffixes for 64-bit constants
   3e28a96b87f6 ASoC: Intel: bytcr_rt5640: Fix Acer Iconia 8 over-current detect threshold
   ebce61bb2c86 scsi: megaraid_sas: Update controller info during resume
   b38977a36625 spi: orion: fix CS GPIO handling again
   d731684c4496 scsi: hisi_sas: Fix the conflict between dev gone and host reset
   2f7b94ebaa19 iomap: complete partial direct I/O writes synchronously
   939dd916dc25 scsi: bnx2i: add error handling for ioremap_nocache
   074e4687846e perf/x86/intel/lbr: Fix incomplete LBR call stack
   09468e65ec7d drm/v3d: Take a lock across GPU scheduler job creation and queuing.
   dbdef3dff35b arm64: dts: renesas: Fix VSPD registers range
   56984081650a MIPS: boot: fix build rule of vmlinux.its.S
   d0f7fbdb1cf9 HID: i2c-hid: Use devm to allocate i2c_hid struct
   46066a10dd7a HID: hid-ntrig: add error handling for sysfs_create_group
   d79cdff57285 arm: dts: mediatek: Add missing cooling device properties for CPUs
   65470af8b10d perf/hw_breakpoint: Split attribute parse and commit
   7f22023170f7 Documentation/process: fix reST table border error
   53b56e401d93 RDMA/uverbs: Don't overwrite NULL pointer with ZERO_SIZE_PTR
   1da59841eea9 ARM: mvebu: declare asm symbols as character arrays in pmsu.c
   3fc862c26744 drm/omap: gem: Fix mm_list locking
   f7867f358bfe wlcore: Add missing PM call for wlcore_cmd_wait_for_event_or_timeout()
   13c4f14d8cf2 bitfield: fix *_encode_bits()
   1ae0268dc54e brcmsmac: fix wrap around in conversion from constant to s16
   af1c6a743c98 rndis_wlan: potential buffer overflow in rndis_wlan_auth_indication()
   35ba78548948 mt76x2: fix mrr idx/count estimation in mt76x2_mac_fill_tx_status()
   882791abd11d ath10k: transmit queued frames after processing rx packets
   9f81b08ad8ea drm/sun4i: Fix releasing node when enumerating enpoints
   900812a0d318 net: phy: xgmiitorgmii: Check phy_driver ready before accessing
   d0a4b7b3792f drm/sun4i: Enable DW HDMI PHY clock
   c247a4bf53b6 ath10k: protect ath10k_htt_rx_ring_free with rx_ring.lock
   fcd12823cd57 net: phy: xgmiitorgmii: Check read_status results
   6cdfe3ed6c9d ALSA: hda: Add AZX_DCAPS_PM_RUNTIME for AMD Raven Ridge
   3dc220c5253e ASoC: qdsp6: qdafe: fix some off by one bugs
   49fc6188cdb6 media: tm6000: add error handling for dvb_register_adapter
   6c695a374b0b staging: mt7621-dts: Fix remaining pcie warnings
   7a887d2a1f91 serial: pxa: Fix an error handling path in 'serial_pxa_probe()'
   e8db58e3d80b arm64: dts: renesas: salvator-common: Fix adv7482 decimal unit addresses
   e65f712ea936 drivers/tty: add error handling for pcmcia_loop_config
   5208cebb4ca3 staging: mt7621-eth: Fix memory leak in mtk_add_mac() error path
   6cbaed5c50ac media: ov772x: allow i2c controllers without I2C_FUNC_PROTOCOL_MANGLING
   47da213433ae staging: android: ashmem: Fix mmap size validation
   20d705e92eb7 media: ov772x: add checks for register read errors
   eab10433598a media: omap3isp: zero-initialize the isp cam_xclk{a,b} initial data
   870878d2c941 media: soc_camera: ov772x: correct setting of banding filter
   39a372355b5a media: s3c-camif: ignore -ENOIOCTLCMD from v4l2_subdev_call for s_power
   8086828bed84 ath10k: use locked skb_dequeue for rx completions
   11750fe66e26 selftests: forwarding: Tweak tc filters for mirror-to-gretap tests
   a4c7557bc547 ALSA: snd-aoa: add of_node_put() in error path
   5f6b9cd5c5f2 posix-timers: Sanitize overrun handling
   c0d08296a291 posix-timers: Make forward callback return s64
   90f955af43fe iio: accel: adxl345: convert address field usage in iio_chan_spec
   f1915d5162a9 mtd: rawnand: atmel: add module param to avoid using dma
   ff9ac7d9bdda s390/extmem: fix gcc 8 stringop-overflow warning
   6143a4525c3e s390/scm_blk: correct numa_node in scm_blk_dev_setup
   0c6df6d17ab4 s390/dasd: correct numa_node in dasd_alloc_queue
   04937aaaf8c7 alarmtimer: Prevent overflow for relative nanosleep
   4add6942e51e s390/sysinfo: add missing #ifdef CONFIG_PROC_FS
   ab0fd80d8747 ACPI / button: increment wakeup count only when notified
   f2514c04f556 platform/x86: asus-wireless: Fix uninitialized symbol usage
   677b34aa38ed powerpc/powernv/ioda2: Reduce upper limit for DMA window size
   ee1df10ae020 ath10k: sdio: set skb len for all rx packets
   bd9b4e606902 ath10k: sdio: use same endpoint id for all packets in a bundle
   420c37a784a7 usb: wusbcore: security: cast sizeof to int for comparison
   90c00dd1798d scsi: target: Avoid that EXTENDED COPY commands trigger lock inversion
   d08b7218cea0 scsi: ibmvscsi: Improve strings handling
   7369c88b59a9 scsi: klist: Make it safe to use klists in atomic context
   9d6b653c0509 thermal: i.MX: Allow thermal probe to fail gracefully in case of bad calibration.
   92e96ad168ea scsi: target/iscsi: Make iscsit_ta_authentication() respect the output buffer size
   6cf7be0267f7 ARM: dts: ls1021a: Add missing cooling device properties for CPUs
   f0c6c6ec02a1 x86/entry/64: Add two more instruction suffixes
   06f91031931a ARM: hwmod: RTC: Don't assume lock/unlock will be called with irq enabled
   11a88b9218e7 x86/tsc: Add missing header to tsc_msr.c
   2bffdc28ee60 include/rdma/opa_addr.h: Fix an endianness issue
   b40f2ec52bf5 IB/mlx5: Fix GRE flow specification
   c26fc717b13b media: staging/imx: fill vb2_v4l2_buffer field entry
   0bd77cd5c2da vhost_net: Avoid tx vring kicks during busyloop
   af58a41db9cc media: fsl-viu: fix error handling in viu_of_probe()
   ec0e373a6214 powerpc/kdump: Handle crashkernel memory reservation failure
   4fd56423854c IB/mlx4: Test port number before querying type.
   76e2bf1d322a media: exynos4-is: Prevent NULL pointer dereference in __isp_video_try_fmt()
   203ae10a4713 IB/core: type promotion bug in rdma_rw_init_one_mr()
   16fc25226707 RDMA/bnxt_re: Fix a bunch of off by one bugs in qplib_fp.c
   6a4d21a7664b RDMA/i40w: Hold read semaphore while looking after VMA
   5ae7031fea6a RDMA/bnxt_re: Fix a couple off by one bugs
   be853349a4a9 cxgb4: Fix the condition to check if the card is T5
   69b921bdab4b md-cluster: clear another node's suspend_area after the copy is finished
   dd5ac3dcb22e drm/amd/display: fix use of uninitialized memory
   e21238f1be65 drm/amd/display/dc/dce: Fix multiple potential integer overflows
   9fa1c8f4b9b2 power: remove possible deadlock when unregistering power_supply
   ff8aa171ef8c s390/mm: correct allocate_pgste proc_handler callback
   596ee3e366eb iommu/msm: Don't call iommu_device_{,un}link from atomic context
   c4ea4d6928bd 6lowpan: iphc: reset mac_header after decompress to fix panic
   d3f86dceb54c USB: serial: kobil_sct: fix modem-status error handling
   41086956a32b Bluetooth: Add a new Realtek 8723DE ID 0bda:b009
   9032c7d6d57f iommu/amd: make sure TLB to be flushed before IOVA freed
   8ae46971d69e power: vexpress: fix corruption in notifier registration
   3c8527e5a6e4 uwb: hwa-rc: fix memory leak at probe
   cb39b07bf5f9 serial: sh-sci: Stop RX FIFO timer during port shutdown
   741b2c3b62cf misc: sram: enable clock before registering regions
   919618d23234 power: supply: axp288_charger: Fix initial constant_charge_current value
   df09a796560a staging: rts5208: fix missing error check on call to rtsx_write_register
   e3deb9b3c252 x86/numa_emulation: Fix emulated-to-physical node mapping
   bb2ca3d777d9 net: hns3: Fix get_vector ops in hclgevf_main module
   6739fc895c80 net: hns3: Fix warning bug when doing lp selftest
   87dbcb1ce9c2 net: hns3: Fix for mac pause not disable in pfc mode
   4a659cb2f0fd net: hns3: Fix for mailbox message truncated problem
   1bb1252b4e78 siox: don't create a thread without starting it
   e83bd606a14e vmci: type promotion bug in qp_host_get_user_memory()
   46ba8d1156e7 misc: ibmvmc: Use GFP_ATOMIC under spin lock
   1d3de3d5e274 tsl2550: fix lux1_input error in low light
   c9bcfbebca40 iio: adc: ina2xx: avoid kthread_stop() with stale task_struct
   d08aa810ddd1 crypto: skcipher - Fix -Wstringop-truncation warnings
   2f411a0873a9 Linux 4.18.11
   e5bd6aca70ef spi: Fix double IDR allocation with DT aliases
   4fda8face67c iw_cxgb4: only allow 1 flush on user qps
   61b5194808f4 vmw_balloon: include asm/io.h
   ac586a2ffe31 sched/fair: Fix vruntime_normalized() for remote non-migration wakeup
   ec215095ac28 ext4, dax: set ext4_dax_aops for dax files
   e2dd3371bfd1 ext4, dax: add ext4_bmap to ext4_dax_aops
   d60e0a56ac37 ext4: show test_dummy_encryption mount option in /proc/mounts
   da7a6e25fe8e ext4: don't mark mmp buffer head dirty
   705bcb551648 ext4: fix online resizing for bigalloc file systems with a 1k block size
   d47e119158ec ext4: fix online resize's handling of a too-small final block group
   2d0cd272e096 ext4: recalucate superblock checksum after updating free blocks/inodes
   a4cb1bf267a6 ext4: avoid arithemetic overflow that can trigger a BUG
   976eeff67a3a ext4: avoid divide by zero fault when deleting corrupted inline directories
   fdad4e17dc61 ext4: check to make sure the rename(2)'s destination is not freed
   52ef74c21c27 tty: vt_ioctl: fix potential Spectre v1
   5a5338e45009 drm/amdgpu: add new polaris pci id
   4cd5d680d815 drm: udl: Destroy framebuffer only if it was initialized
   934df3d13fc6 drm/vc4: Fix the "no scaling" case on multi-planar YUV formats
   21fb862e0e3c drm/nouveau/drm/nouveau: Prevent handling ACPI HPD events too early
   99aa61fb35ed drm/nouveau/drm/nouveau: Use pm_runtime_get_noresume() in connector_detect()
   9c7443a7aa64 drm/nouveau/drm/nouveau: Fix deadlock with fb_helper with async RPM requests
   563f482029d4 drm/nouveau/drm/nouveau: Fix bogus drm_kms_helper_poll_enable() placement
   0f756495557c drm/nouveau/drm/nouveau: Don't forget to cancel hpd_work on suspend/unload
   86393a7e3315 drm/nouveau: Fix deadlocks in nouveau_connector_detect()
   573eeddd4538 drm/nouveau: Remove duplicate poll_enable() in pmops_runtime_suspend()
   aed4ca2690c2 drm/nouveau: Only write DP_MSTM_CTRL when needed
   04393d257207 drm/nouveau: Reset MST branching unit before enabling
   1f4401ece98b drm/i915/bdw: Increase IPS disable timeout to 100ms
   1e0be23859b9 ocfs2: fix ocfs2 read block panic
   23fe9688228c libata: mask swap internal and hardware tag
   f8b35f82a252 Revert "ubifs: xattr: Don't operate on deleted inodes"
   94403d71bb9e scsi: target: iscsi: Use bin2hex instead of a re-implementation
   8e31c95fe085 scsi: target: iscsi: Use hex2bin instead of a re-implementation
   31426b50594c Revert "uapi/linux/keyctl.h: don't use C++ reserved keyword as a struct member name"
   bc35488686c3 bpf/verifier: disallow pointer subtraction
   909828a2920b Revert "rpmsg: core: add support to power domains for devices"
   946f8052f7ee mm: shmem.c: Correctly annotate new inodes for lockdep
   4cdb6f01e9e5 mm: disable deferred struct page for 32-bit arches
   3299a0eead68 fork: report pid exhaustion correctly
   30938d20eb1a crypto: x86/aegis,morus - Do not require OSXSAVE for SSE2
   d73ccd8bb732 ring-buffer: Allow for rescheduling when removing pages
   6bed4f10277b Revert "PCI: Add ACS quirk for Intel 300 series"
   6d8911403d99 spi: fix IDR collision on systems with both fixed and dynamic SPI bus numbers
   1318b2c26b78 xen/x86/vpmu: Zero struct pt_regs before calling into sample handling code
   b73a161e9bef xen/netfront: don't bug in case of too many frags
   5e17a1ecc44b platform/x86: alienware-wmi: Correct a memory leak
   8879342a67a4 platform/x86: dell-smbios-wmi: Correct a memory leak
   0639ddca2c8c mtd: rawnand: denali: fix a race condition when DMA is kicked
   f11b8aad34fa mtd: devices: m25p80: Make sure the buffer passed in op is DMA-able
   1501a0f2e14e ALSA: oxfw: fix memory leak of private data
   9d07f491db95 ALSA: oxfw: fix memory leak of discovered stream formats at error path
   82567fb09846 ALSA: oxfw: fix memory leak for model-dependent data at error path
   8e54fc8910f3 ALSA: fireworks: fix memory leak of response buffer at error path
   e5301d45d01c ALSA: firewire-tascam: fix memory leak of private data
   7c57a806be78 ALSA: firewire-digi00x: fix memory leak of private data
   e9355495975d ALSA: fireface: fix memory leak in ff400_switch_fetching_mode()
   cedfb9f8a588 ALSA: emu10k1: fix possible info leak to userspace on SNDRV_EMU10K1_IOCTL_INFO
   c143935a34a5 ALSA: bebob: use address returned by kmalloc() instead of kernel stack for streaming DMA mapping
   28114caeb0ab ALSA: bebob: fix memory leak for M-Audio FW1814 and ProjectMix I/O at error path
   30100a475167 ASoC: uapi: fix sound/skl-tplg-interface.h userspace compilation errors
   341ff629a2e9 ASoC: rsnd: fixup not to call clk_get/set under non-atomic
   9e6a69b06575 ASoC: tas6424: Save last fault register even when clear
   df231dbe93eb ASoC: cs4265: fix MMTLR Data switch control
   401e975e5950 ASoC: wm9712: fix replace codec to component
   58be75ff0878 NFC: Fix the number of pipes
   0ad778eeee6d NFC: Fix possible memory corruption when handling SHDLC I-Frame commands
   18b8a9c5dab3 net: rtnl_configure_link: fix dev flags changes arg to __dev_notify_flags
   1b46979978c0 net: mvpp2: let phylink manage the carrier state
   001e4e5537d8 net/ipv6: do not copy dst flags on rt init
   1328a5a40fde ipv6: use rt6_info members when dst is set in rt6_fill_node
   b5fc7f300cdb bnxt_en: Fix VF mac address regression.
   8ac22b327cc2 tls: fix currently broken MSG_PEEK behavior
   17eef150f66b socket: fix struct ifreq size in compat ioctl
   263baf63bdfb net: dsa: mv88e6xxx: Fix ATU Miss Violation
   4188aa049107 hv_netvsc: fix schedule in RCU context
   9f2489640a57 net/sched: act_sample: fix NULL dereference in the data path
   1708cc7ed059 udp6: add missing checks on edumux packet processing
   c0d10c5d5d71 neighbour: confirm neigh entries when ARP packet is received
   77971ea816ba tls: clear key material from kernel memory when do_tls_setsockopt_conf fails
   13d1bdc70bc2 tls: zero the crypto information from tls_context before freeing
   d8e6fc73d2eb tls: don't copy the key out of tls12_crypto_info_aes_gcm_128
   6d7a3fd5cfae udp4: fix IP_CMSG_CHECKSUM for connected sockets
   a02ff7df6a3b qmi_wwan: set DTR for modems in forced USB2 mode
   89721b836972 pppoe: fix reception of frames with no mac header
   b411479d5268 net: hp100: fix always-true check for link up state
   6a9c934f04e6 net/appletalk: fix minor pointer leak to userspace in SIOCFINDIPDDPRT
   6b4d14c57381 ipv6: fix possible use-after-free in ip6_xmit()
   288942f4a669 gso_segment: Reset skb->mac_len after modifying network header
   183348489d36 Linux 4.18.10
   52b732648371 crypto: ccp - add timeout support in the SEV command
   d6c9bc664918 mei: bus: type promotion bug in mei_nfc_if_version()
   920b0e3c5e24 clk: tegra: bpmp: Don't crash when a clock fails to register
   fdf0d6477376 pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get() to be compliant
   5d10592e292f pinctrl: msm: Fix msm_config_group_get() to be compliant
   bbcdd75166d9 blk-mq: avoid to synchronize rcu inside blk_cleanup_queue()
   864e90ed4a8f blk-mq: only attempt to merge bio if there is rq in sw queue
   83459da8e319 IB/mlx5: fix uaccess beyond "count" in debugfs read/write handlers
   53a1ee238c84 block/DAC960.c: fix defined but not used build warnings
   dc78a980f995 staging: fsl-dpaa2/eth: Fix DMA mapping direction
   8d425fae2cf6 dmaengine: sh: rcar-dmac: avoid to write CHCR.TE to 1 if TCR is set to 0
   93b100ddda3b drm/amd/pp: Send khz clock values to DC for smu7/8
   0cbb058be904 arm64: perf: Disable PMU while processing counter overflows
   b89c077eff7c drm/panel: type promotion bug in s6e8aa0_read_mtp_id()
   252cdf1f5db5 ASoC: rt5651: Fix workqueue cancel vs irq free race on remove
   6c9e72d66dbf selftest: timers: Tweak raw_skew to SKIP when ADJ_OFFSET/other clock adjustments are in progress
   6e36e98ecb0a remoteproc: qcom: q6v5-pil: fix modem hang on SDM845 after axis2 clk unvote
   435962f3beaa scsi: lpfc: Fix panic if driver unloaded when port is offline
   074263d61eed scsi: lpfc: Fix NVME Target crash in defer rcv logic
   84159b84f331 scsi: libfc: fixup 'sleeping function called from invalid context'
   f7ee7f7b0618 ALSA: pcm: Fix snd_interval_refine first/last with open min/max
   0fce3c91ba68 selftests/android: initialize heap_type to avoid compiling warning
   330e11b03099 selftests: vDSO - fix to return KSFT_SKIP when test couldn't be run
   04ea31a181d3 rtc: bq4802: add error handling for devm_ioremap
   1950f800faa1 drm/amdkfd: Fix error codes in kfd_get_process
   4841f051b32c drm/amdkfd: Fix kernel queue 64 bit doorbell offset calculation
   b1373b80f9ec input: rohm_bu21023: switch to i2c_lock_bus(..., I2C_LOCK_SEGMENT)
   ae8247766d56 mfd: 88pm860x-i2c: switch to i2c_lock_bus(..., I2C_LOCK_SEGMENT)
   f40d90dd5567 rcutorture: Use monotonic timestamp for stall detection
   7961182ace13 net: mvpp2: make sure we use single queue mode on PPv2.1
   466ec0c2ba2d net: gemini: Allow multiple ports to instantiate
   382ca1b7ca79 gpiolib: Mark gpio_suffixes array with __maybe_unused
   a35951e982eb gpio: pxa: Fix potential NULL dereference
   c6bc7c725409 staging: bcm2835-audio: Don't leak workqueue if open fails
   28929ceced7d lightnvm: pblk: enable line minor version detection
   7785ada57436 lightnvm: pblk: assume that chunks are closed on 1.2 devices
   070b164edc30 ASoC: qdsp6: q6afe-dai: fix a range check in of_q6afe_parse_dai_data()
   b0442208f62f drm/amd/display: support access ddc for mst branch
   67a281a8bee9 tools/testing/nvdimm: Fix support for emulating controller temperature
   22df0497e104 f2fs: do checkpoint in kill_sb
   6e530bf7d202 coresight: ETM: Add support for Arm Cortex-A73 and Cortex-A35
   8da6cd501998 coresight: tpiu: Fix disabling timeouts
   d0fb01bb8ed9 coresight: Handle errors in finding input/output ports
   b3cf69dd8a2b sched/fair: Fix util_avg of new tasks for asymmetric systems
   a9093ae70197 parport: sunbpp: fix error return code
   cc55678dd2f8 tls: Fix zerocopy_from_iter iov handling
   88b8d17d3ab0 drm/nouveau: tegra: Detach from ARM DMA/IOMMU mapping
   e293c3e0e60b drm/nouveau/debugfs: Wake up GPU before doing any reclocking
   3c266a692dda drm/nouveau: Fix runtime PM leak in drm_open()
   5d421dae2364 mmc: sdhci: do not try to use 3.3V signaling if not supported
   566b4caf1143 mmc: tegra: prevent HS200 on Tegra 3
   5f366ee1f1ff mmc: sdhci-of-esdhc: set proper dma mask for ls104x chips
   442f4d1e9aa6 tty: fix termios input-speed encoding
   859a99742a95 tty: fix termios input-speed encoding when using BOTHER
   24d7347116ba serial: 8250: of: Correct of_platform_serial_setup() error handling
   cc04d14157b8 ASoC: hdmi-codec: fix routing
   179dbd5fc4f1 gpu: ipu-v3: csi: pass back mbus_code_to_bus_cfg error codes
   b720a10bf407 liquidio: fix hang when re-binding VF host drv after running DPDK VF driver
   af62ca55dc1f ARM: hisi: check of_iomap and fix missing of_node_put
   c55e49df5371 net: hns3: Fix return value error in hns3_reset_notify_down_enet
   7c3197ac7034 ARM: hisi: fix error handling and missing of_node_put
   34330aee6948 ARM: hisi: handle of_iomap and fix missing of_node_put
   cef4231adf55 net: hns3: Fix for reset_level default assignment probelm
   4d23263a5a8e net: hns3: Reset net device with rtnl_lock
   ddf5261f9068 efi/esrt: Only call efi_mem_reserve() for boot services memory
   c1424ee6462b sched/core: Use smp_mb() in wake_woken_function()
   5c4a6af4c694 arm64: dts: mt7622: update a clock property for UART0
   5471c19b92f8 pinctrl: rza1: Fix selector use for groups and functions
   cb5b08a8ec5f pinctrl: mt7622: Fix probe fail by misuse the selector
   b07bfd045c5f configfs: fix registered group removal
   e75b2324e385 MIPS: loongson64: cs5536: Fix PCI_OHCI_INT_REG reads
   d5d7da805a06 KVM: PPC: Book3S: Fix matching of hardware and emulated TCE tables
   7974b0c64934 PM / devfreq: use put_device() instead of kfree()
   81ce15b06c0f security: check for kstrdup() failure in lsm_append()
   91c26cb2293f KVM: PPC: Book3S HV: Add of_node_put() in success path
   6a69ccd2ec68 evm: Don't deadlock if a crypto algorithm is unavailable
   f4a6c71481e3 Bluetooth: Use lock_sock_nested in bt_accept_enqueue
   b4a9422266f2 spi: dw: fix possible race condition
   f90ccc03b438 bpf: fix rcu annotations in compute_effective_progs()
   5e1002ab5c9b vfs: fix freeze protection in mnt_want_write_file() for overlayfs
   d466b2d4e4e7 mtdchar: fix overflows in adjustment of `count`
   babc65c641b1 audit: fix use-after-free in audit_add_watch
   a9fb28b40a36 arm64: dts: uniphier: Add missing cooling device properties for CPUs
   f48256986e0f net/mlx5: Add missing SET_DRIVER_VERSION command translation
   3caf6c73c0b4 binfmt_elf: Respect error return from `regset->active'
   6eb8c64e9afd mmc: meson-mx-sdio: fix OF child-node lookup
   0c6e2a79715a of: add helper to lookup compatible child node
   8bfbd71c1146 NFSv4.1 fix infinite loop on I/O.
   a12ad4f33e6f NFSv4: Fix a tracepoint Oops in initiate_file_draining()
   afaef9ba4486 x86/EISA: Don't probe EISA bus for Xen PV guests
   05a993198ded of: fix phandle cache creation for DTs with no phandles
   1f3cb0604f0f perf tools: Fix maps__find_symbol_by_name()
   a543f61a2775 perf/core: Force USER_DS when recording user stack data
   b205f931b0c0 xtensa: ISS: don't allocate memory in platform_setup
   f63dbd23e8a7 cifs: integer overflow in in SMB2_ioctl()
   6565bd3e63d3 CIFS: fix wrapping bugs in num_entries()
   bf1c05755d45 cifs: prevent integer overflow in nxt_dir_entry()
   8c7488864bdf Revert "cdc-acm: implement put_char() and flush_chars()"
   c705bfe3c3d6 usb: cdc-wdm: Fix a sleep-in-atomic-context bug in service_outstanding_interrupt()
   cb55532b9e64 USB: yurex: Fix buffer over-read in yurex_write()
   48f17ac733c6 USB: serial: ti_usb_3410_5052: fix array underflow in completion handler
   8a74265c0a05 usb: misc: uss720: Fix two sleep-in-atomic-context bugs
   9bf71499046e USB: serial: io_ti: fix array underflow in completion handler
   97180428d24b USB: net2280: Fix erroneous synchronization change
   bfe24fcf1fb0 usb: gadget: udc: renesas_usb3: fix maxpacket size of ep0
   23256d450acc USB: add quirk for WORLDE Controller KS49 or Prodipe MIDI 49C USB controller
   c6346e3fbb18 usb: host: u132-hcd: Fix a sleep-in-atomic-context bug in u132_get_frame()
   066bfee7ec75 usb: Avoid use-after-free by flushing endpoints early in usb_set_interface()
   13b6b8a90cab usb: uas: add support for more quirk flags
   cba0cba54741 USB: Add quirk to support DJI CineSSD
   59efbbc9a611 dm verity: fix crash on bufio buffer that was allocated with vmalloc
   f5f0f2ad7099 mei: bus: need to unlink client before freeing
   a1a8326f891c mei: bus: fix hw module get/put balance
   93f03d6dcbb6 mei: ignore not found client in the enumeration
   4c3af2149535 usb: mtu3: fix error of xhci port id when enable U3 dual role
   3f081e53ccd0 usb: xhci: fix interrupt transfer error happened on MTK platforms
   3d7a00c4f0aa usb: Don't die twice if PCI xhci host is not responding in resume
   87d948fe3a27 xhci: Fix use after free for URB cancellation on a reallocated endpoint
   9ed3ad68de71 misc: hmc6352: fix potential Spectre v1
   094302a07e89 misc: ibmvsm: Fix wrong assignment of return code
   662b1033af66 Tools: hv: Fix a bug in the key delete code
   d5995b9a926e vmbus: don't return values for uninitalized channels
   4585b79971f7 ovl: fix oopses in ovl_fill_super() failure paths
   617afda7f5d9 ipmi: Fix I2C client removal in the SSIF driver
   31364b2e1fb1 ipmi: Move BT capabilities detection to the detect call
   288bd736c8a0 ipmi: Rework SMI registration failure
   53c7bb8b93d0 mmc: omap_hsmmc: fix wakeirq handling on removal
   8cddf23b74d6 s390/crypto: Fix return code checking in cbc_paes_crypt()
   3e6bba18b8ef IB/ipoib: Avoid a race condition between start_xmit and cm_rep_handler
   9c58e39e3736 xen/netfront: fix waiting for xenbus state change
   d0028f48b330 pstore: Fix incorrect persistent ram buffer mapping
   40a31b8c9b90 RDMA/cma: Protect cma dev list with lock
   367c9cb26e65 xen-netfront: fix warn message as irq device name has '/'
   08012969004d PCI/AER: Honor "pcie_ports=native" even if HEST sets FIRMWARE_FIRST
   12f21ddaf49d x86/mm/pti: Add an overflow check to pti_clone_pmds()
   19700e6c1d40 x86/pti: Check the return value of pti_user_pagetable_walk_pmd()
   a9edba8f5f3c x86/pti: Check the return value of pti_user_pagetable_walk_p4d()
   7763d301d75d crypto: sharah - Unregister correct algorithms for SAHARA 3
   4d18bcc6ec97 dmaengine: mv_xor_v2: kill the tasklets upon exit
   7c14a171825c iommu/ipmmu-vmsa: IMUCTRn.TTSEL needs a special usage on R-Car Gen3
   d655b0e7d1a5 regulator: qcom_spmi: Fix warning Bad of_node_put()
   9611efe67019 regulator: qcom_spmi: Use correct regmap when checking for error
   4a5dfbca3e03 drm/amd/pp: Set Max clock level to display by default
   283ca5fd5b94 i2c: aspeed: Fix initial values of master and slave state
   ee4fa1801dfb drivers/base: stop new probing during shutdown
   8a1df288fc7d KVM: arm/arm64: Fix vgic init race
   77a7d97a4aad platform/x86: toshiba_acpi: Fix defined but not used build warnings
   dacc647eb982 s390/qeth: reset layer2 attribute on layer switch
   8f93a540b618 s390/qeth: fix race in used-buffer accounting
   b72b40d5dacf soc: qcom: smem: Correct check for global partition
   ed3ee622cda9 ARM: dts: qcom: msm8974-hammerhead: increase load on l20 for sdhci
   3679b8e9af6d arm64: dts: qcom: db410c: Fix Bluetooth LED trigger
   9ac72cec7e58 xen-netfront: fix queue name setting
   87fe89ddbf57 nfp: avoid buffer leak when FW communication fails
   6da3c7c96e0a ALSA: usb-audio: Generic DSD detection for Thesycon-based implementations
   78fcf13d0235 efi/arm: preserve early mapping of UEFI memory map longer for BGRT
   e505be5d53e0 reset: imx7: Fix always writing bits as 0
   cf29c5b3d339 arm64: fix possible spectre-v1 write in ptrace_hbp_set_event()
   e635ed205ad8 wan/fsl_ucc_hdlc: use IS_ERR_VALUE() to check return value of qe_muram_alloc
   5573ec7a7114 Smack: Fix handling of IPv4 traffic received by PF_INET6 sockets
   f5b4d1cce4a2 mac80211: restrict delayed tailroom needed decrement
   e19f90c90555 MIPS: jz4740: Bump zload address
   4105a80d60c0 ASoC: rt5514: Fix the issue of the delay volume applied
   ad60f993f3ec staging: bcm2835-camera: handle wait_for_completion_timeout return properly
   3360648a723d staging: bcm2835-camera: fix timeout handling in wait_for_completion_timeout
   acd8e75056b8 perf script: Show correct offsets for DWARF-based unwinding
   41870d0faa92 powerpc/powernv: opal_put_chars partial write fix
   575f58226b31 KVM: arm/arm64: vgic: Fix possible spectre-v1 write in vgic_mmio_write_apr()
   3e8433730a7c nvme-rdma: unquiesce queues when deleting the controller
   ab79cc228cce nvmet: fix file discard return status
   b42c221e6c6f perf powerpc: Fix callchain ip filtering
   7871bdd93e26 ARM: exynos: Clear global variable on init error path
   01a16afcdd8e omapfb: rename omap2 module to omap2fb.ko
   8c448f47bf01 fbdev: Distinguish between interlaced and progressive modes
   8fc18a9186d1 video: fbdev: pxafb: clear allocated memory for video modes
   0c664f04c204 perf powerpc: Fix callchain ip filtering when return address is in a register
   e04ab6fae461 fbdev/via: fix defined but not used warning
   4cecf931f72e video: goldfishfb: fix memory leak on driver remove
   6619761e5594 perf tools: Fix struct comm_str removal crash
   3bc6debeee75 fbdev: omapfb: off by one in omapfb_register_client()
   3340ab9770ee perf tests: Fix record+probe_libc_inet_pton.sh to ensure cleanups
   a036a42625e5 perf tests: Fix record+probe_libc_inet_pton.sh when event exists
   7909633281bf perf tests: Fix record+probe_libc_inet_pton.sh for powerpc64
   aee426d18f8b perf tools: Synthesize GROUP_DESC feature in pipe mode
   6779c908d67a gfs2: Don't reject a supposedly full bitmap if we have blocks reserved
   4d63cecf086c perf test: Fix subtest number when showing results
   2bcb521130c6 media: ov5645: Supported external clock is 24MHz
   105b0d0e07c5 mtd/maps: fix solutionengine.c printk format warnings
   10edff95113a IB/ipoib: Fix error return code in ipoib_dev_init()
   b5781a323ac8 block: allow max_discard_segments to be stacked
   ded17a42ebf5 IB/rxe: Drop QP0 silently
   e41669ba0dcf media: videobuf2-core: check for q->error in vb2_core_qbuf()
   b37f1ffead9a MIPS: ath79: fix system restart
   11091b725238 dmaengine: pl330: fix irq race with terminate_all
   7549795df383 media: tw686x: Fix oops on buffer alloc failure
   e8b53e57272c kbuild: do not update config when running install targets
   69383cdcb314 kbuild: add .DELETE_ON_ERROR special target
   d3847b6449a0 clk: clk-fixed-factor: Clear OF_POPULATED flag in case of failure
   825568027a58 clk: core: Potentially free connection id
   36c234a7d639 Input: pxrc - fix freeing URB on device teardown
   10acffe4e6af clk: mvebu: armada-37xx-periph: Fix wrong return value in get_parent
   62d658666e16 clk: imx6sll: fix missing of_node_put()
   404280dc8655 clk: imx6ul: fix missing of_node_put()
   3ace27266f11 gfs2: Special-case rindex for gfs2_grow
   cffab62aa38c iwlwifi: cancel the injective function between hw pointers to tfd entry index
   aca7943ece90 nfp: don't fail probe on pci_sriov_set_totalvfs() errors
   38c65d4ed86c amd-xgbe: use dma_mapping_error to check map errors
   7ac07ffd7a1d xfrm: fix 'passing zero to ERR_PTR()' warning
   912e58471dc4 ALSA: usb-audio: Fix multiple definitions in AU0828_DEVICE() macro
   e87ce12cce31 ALSA: usb-audio: Add support for Encore mDSD USB DAC
   14b41aea20aa ALSA: msnd: Fix the default sample sizes
   071929af7183 iommu/io-pgtable-arm: Fix pgtable allocation in selftest
   6bd162fc88d2 iommu/io-pgtable-arm-v7s: Abort allocation when table address overflows the PTE
   129a7aebd133 iommu/arm-smmu-v3: sync the OVACKFLG to PRIQ consumer register
   602b80704322 usb: dwc3: change stream event enable bit back to 13
   9739856df45d net/mlx5: Use u16 for Work Queue buffer fragment size
   032fcd76b6b1 net/mlx5: Fix possible deadlock from lockdep when adding fte to fg
   7da7294ce303 net/mlx5: Fix not releasing read lock when adding flow rules
   60486fee29bb tcp: really ignore MSG_ZEROCOPY if no SO_ZEROCOPY
   87754d1856ac erspan: return PACKET_REJECT when the appropriate tunnel is not found
   a4eae12522a5 erspan: fix error handling for erspan tunnel
   17c7263eea85 net/mlx5: Fix debugfs cleanup in the device init/remove flow
   645e035edefe net/mlx5: Check for error in mlx5_attach_interface
   b800b7ef44b5 net/tls: Set count of SG entries if sk_alloc_sg returns -ENOSPC
   c73238573dea net/mlx5: E-Switch, Fix memory leak when creating switchdev mode FDB tables
   73da60476f94 tipc: orphan sock in tipc_release()
   de83178fddfb rds: fix two RCU related problems
   d34b61509c18 net: qca_spi: Fix race condition in spi transfers
   9a22310f122b net/mlx5: Fix use-after-free in self-healing flow
   da0e36fa0942 be2net: Fix memory leak in be_cmd_get_profile_config()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 920c2a5858af..f77de3a05ff8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4eb8994d5c8556fe917d851d678f7db8cfc30c77"
-SRCREV_meta ?= "76b18ecbd6c324b400c4f08e212b8acd605d2d69"
+SRCREV_machine ?= "8e00c30ce22f378ecb7f243b1df3d209b8ee29bc"
+SRCREV_meta ?= "bf98e195a4cf2404a064056b3593e83a7de84f25"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.9"
+LINUX_VERSION ?= "4.18.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index bf595a7717e0..591d41bd1b1a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.9"
+LINUX_VERSION ?= "4.18.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -13,8 +13,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_meta ?= "76b18ecbd6c324b400c4f08e212b8acd605d2d69"
+SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
+SRCREV_meta ?= "bf98e195a4cf2404a064056b3593e83a7de84f25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index e1fbb8f1f807..81160ca50f33 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ef0043f38afb743bffdc39aacc54ea2419da0be3"
-SRCREV_machine_qemuarm64 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_machine_qemumips ?= "a6d4477ea91aec9d3d6af538f8f9d27a687540aa"
-SRCREV_machine_qemuppc ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_machine_qemux86 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_machine_qemux86-64 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_machine_qemumips64 ?= "766c469b1707fd3101116f572052a7b8d5ac0658"
-SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_meta ?= "76b18ecbd6c324b400c4f08e212b8acd605d2d69"
+SRCREV_machine_qemuarm ?= "0573ed3c737c82b24fd661cc5ea961cac07ea2fe"
+SRCREV_machine_qemuarm64 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
+SRCREV_machine_qemumips ?= "465252ba0ec00ae10397cb4623c3d77c89e542a5"
+SRCREV_machine_qemuppc ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
+SRCREV_machine_qemux86 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
+SRCREV_machine_qemux86-64 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
+SRCREV_machine_qemumips64 ?= "6d91dc62811f4688efc67845185858645b4ccfb8"
+SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
+SRCREV_meta ?= "bf98e195a4cf2404a064056b3593e83a7de84f25"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.9"
+LINUX_VERSION ?= "4.18.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


