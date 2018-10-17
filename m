Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A555879AF4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:40:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9HDe6sq016912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Oct 2018 06:40:06 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 17 Oct 2018 06:40:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 17 Oct 2018 09:38:58 -0400
Message-ID: <7bec5720af30ececc714d0b98f65907b4b7e4dc6.1539783452.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1539783452.git.bruce.ashfield@windriver.com>
References: <cover.1539783452.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/4.14: update to v4.14.76
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

   0b46ce3e3423 Linux 4.14.76
   c03f0ab15f3b ath10k: fix scan crash due to incorrect length calculation
   711b942ae3be virtio_balloon: fix increment of vb->num_pfns in fill_balloon()
   7f42eada5e3f virtio_balloon: fix deadlock on OOM
   251bc1f44c33 rds: rds_ib_recv_alloc_cache() should call alloc_percpu_gfp() instead
   4c925efc2230 ubifs: Check for name being NULL while mounting
   5656b7354183 ucma: fix a use-after-free in ucma_resolve_ip()
   3a7a9fb68c97 f2fs: fix invalid memory access
   dfe96e30b5a5 perf utils: Move is_directory() to path.h
   75fc05a20f5f crypto: chelsio - Fix memory corruption in DMA Mapped buffers.
   b5dcd4ab8e6c ARC: clone syscall to setp r25 as thread pointer
   af1a8101794d powerpc/lib: fix book3s/32 boot failure due to code patching
   609fbeddb24c powerpc: Avoid code patching freed init sections
   4e43fbc8ef25 powerpc/lib/code-patching: refactor patch_instruction()
   0f6e2f4e06be nvme_fc: fix ctrl create failures racing with workq items
   1b2ad48a85c4 ath10k: fix kernel panic issue during pci probe
   8146256b7dcd ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait
   327400b3a708 perf tools: Fix python extension build for gcc 8
   ec727693a9ef perf annotate: Use asprintf when formatting objdump command line
   79f87e09bcb2 of: unittest: Disable interrupt node tests for old world MAC systems
   171f90d4ae84 tty: Drop tty->count on tty_reopen() failure
   c92e73b11ed1 usb: cdc_acm: Do not leak URB buffers
   821c42e7d5ea USB: serial: simple: add Motorola Tetra MTP6550 id
   35123e64a168 usb: xhci-mtk: resume USB3 roothub first
   c096f5c4a8bc xhci: Add missing CAS workaround for Intel Sunrise Point xHCI
   ec6ae632e04b dm cache: fix resize crash if user doesn't reload cache table
   f11a6abfdb41 dm cache metadata: ignore hints array being too small during resize
   1364055c96c5 PM / core: Clear the direct_complete flag on errors
   9047696cb3f8 mac80211: fix setting IEEE80211_KEY_FLAG_RX_MGMT for AP mode keys
   8ebd65583375 PCI: Reprogram bridge prefetch registers on resume
   25bc6e80f9d6 x86/vdso: Fix vDSO syscall fallback asm constraint regression
   1194e838b879 x86/vdso: Only enable vDSO retpolines when enabled and supported
   64ff5747e2af selftests/x86: Add clock_gettime() tests to test_vdso
   30500cc74a36 x86/vdso: Fix asm constraints on vDSO syscall fallbacks
   71a0556255de drm/syncobj: Don't leak fences when WAIT_FOR_SUBMIT is set
   0c0dd182adae drm/amdgpu: Fix vce work queue was not cancelled when suspend
   309a1c5cfc59 xen-netback: fix input validation in xenvif_set_hash_mapping()
   f66d89483bb3 fbdev/omapfb: fix omapfb_memory_read infoleak
   887361696fb9 clocksource/drivers/timer-atmel-pit: Properly handle error cases
   8e2e2192eb35 blk-mq: I/O and timer unplugs are inverted in blktrace
   87a9d1cc2e8f KVM: x86: fix L1TF's MMIO GFN calculation
   5178716b55c4 mm/vmstat.c: skip NR_TLB_REMOTE_FLUSH* properly
   a2e0493f99e6 mm, thp: fix mlocking THP page with migration enabled
   5f4f5b1f4491 mm: migration: fix migration of huge PMD shared pages
   ab18409cf05f perf/core: Add sanity check to deal with pinned event failure
   8e6a9240b191 Linux 4.14.75
   4e7ea65127ac dm thin metadata: fix __udivdi3 undefined on 32-bit
   07f79b39d474 ixgbe: check return value of napi_complete_done()
   de0e2a92ccc5 ocfs2: fix locking for res->tracking and dlm->tracking_list
   f8566a92ab75 proc: restrict kernel stack dumps to root
   4de0fb95a287 tools: hv: fcopy: set 'error' in case an unknown operation was requested
   1d24e2609002 Drivers: hv: vmbus: Use get/put_cpu() in vmbus_connect()
   119bf9470be9 gpiolib: Free the last requested descriptor
   1df517a4cafd crypto: caam/jr - fix ablkcipher_edesc pointer arithmetic
   3b1a8535b8e1 crypto: mxs-dcp - Fix wait logic on chan threads
   90ecb700345c crypto: qat - Fix KASAN stack-out-of-bounds bug in adf_probe()
   a5bb359c078a ALSA: hda/realtek - Cannot adjust speaker's volume on Dell XPS 27 7760
   06f93e40f939 iommu/amd: Clear memory encryption mask from physical address
   dcdb2262d389 smb2: fix missing files in root share directory listing
   b420b7b7923b sysfs: Do not return POSIX ACL xattrs via listxattr
   fa7d75f64b80 ovl: fix format of setxattr debug
   8d75ecc13fdc ovl: fix memory leak on unlink of indexed file
   be406434737b ovl: fix access beyond unterminated strings
   aa41fb9593af xen: fix GCC warning and remove duplicate EVTCHN_ROW/EVTCHN_COL usage
   a502165dae09 xen: avoid crash in disable_hotplug_cpu
   4e1494794ebc xen/manage: don't complain about an empty value in control/sysrq node
   dfb29d69e4d8 cifs: read overflow in is_valid_oplock_break()
   7d60f98cde7a s390/qeth: don't dump past end of unknown HW header
   d5afd6b6eae5 s390/qeth: use vzalloc for QUERY OAT buffer
   ad297898159f r8169: Clear RTL_FLAG_TASK_*_PENDING when clearing RTL_FLAG_TASK_ENABLED
   f7b86faf0bd1 drm/amdgpu: fix error handling in amdgpu_cs_user_fence_chunk
   f2c9d68ed3c2 arm64: jump_label.h: use asm_volatile_goto macro instead of "asm goto"
   7a2df42a5371 hexagon: modify ffs() and fls() to return int
   2eb3072b2785 arch/hexagon: fix kernel/dma.c build warning
   1484d4ff2770 dm thin metadata: try to avoid ever aborting transactions
   1e9054e75d22 perf/x86/intel: Add support/quirk for the MISPREDICT bit on Knights Landing CPUs
   36918e899e3c net: ena: fix missing calls to READ_ONCE
   3e2cc5bd61fe net: ena: fix driver when PAGE_SIZE == 64kB
   a5bdc726e5ff fs/cifs: suppress a string overflow warning
   3941dbe190ba dm raid: fix rebuild of specific devices by updating superblock
   112d65a51f2b drm/nouveau/disp: fix DP disable race
   1a255bf1e749 drm/nouveau/TBDdevinit: don't fail when PMU/PRE_OS is missing from VBIOS
   34d54566ae4a net/mlx5: Consider PCI domain in search for next dev
   f36f3ebdf1e1 nvmet-rdma: fix possible bogus dereference under heavy load
   a90a52c51ad4 USB: yurex: Check for truncation in yurex_read()
   2c423318f07c HID: sensor-hub: Restore fixup for Lenovo ThinkPad Helix 2 sensor hub report
   d4da71220317 RDMA/ucma: check fd type in ucma_migrate_id()
   60ea8815d6e8 Revert "iio: temperature: maxim_thermocouple: add MAX31856 part"
   1173678a4f4a netfilter: nf_tables: release chain in flushing set
   c00f01c40211 perf probe powerpc: Ignore SyS symbols irrespective of endianness
   4095fd29fee7 perf util: Fix bad memory access in trace info.
   9d7bc329c123 perf evsel: Fix potential null pointer dereference in perf_evsel__new_idx()
   8b98b7eeb45d scsi: qedi: Add the CRC size within iSCSI NVM image
   dd44c35cc16c scsi: iscsi: target: Set conn->sess to NULL when iscsi_login_set_conn_values fails
   b6515e0f915b HID: hid-saitek: Add device ID for RAT 7 Contagion
   81c823c22355 usb: gadget: fotg210-udc: Fix memory leak of fotg210->ep[i]
   b6cc0ba2cbf4 HID: add support for Apple Magic Keyboards
   b969656b4662 netfilter: xt_cluster: add dependency on conntrack module
   10fdfea70d46 bpf: 32-bit RSH verification must truncate input before the ALU op
   dcc89aaf5a8d mm: madvise(MADV_DODUMP): allow hugetlbfs pages
   ee0516c4a1fe tools/vm/page-types.c: fix "defined but not used" warning
   5cbf015b971c tools/vm/slabinfo.c: fix sign-compare warning
   27c4ad84fd01 mac80211: shorten the IBSS debug messages
   e132eb09fdd2 mac80211: don't Tx a deauth frame if the AP forbade Tx
   8788737af389 mac80211: Fix station bandwidth setting after channel switch
   37cdc7e35ae4 mac80211: fix a race between restart and CSA flows
   4fa55f6d29fd cfg80211: fix a type issue in ieee80211_chandef_to_operating_class()
   43a01409ef4c mac80211: fix an off-by-one issue in A-MSDU max_subframe computation
   25cb8544342a fs/cifs: don't translate SFM_SLASH (U+F026) to backslash
   8590e6fecb5e net: cadence: Fix a sleep-in-atomic-context bug in macb_halt_tx()
   b08d15cc921f i2c: uniphier-f: issue STOP only for last message or I2C_M_STOP
   82fc9c6b7b9a i2c: uniphier: issue STOP only for last message or I2C_M_STOP
   da26e5729c04 RAID10 BUG_ON in raise_barrier when force is true and conf->barrier is 0
   36fadeb87be8 md/raid5-cache: disable reshape completely
   dc492842b700 ARC: atomics: unbork atomic_fetch_##op()
   7e259a0537be gpio: Fix crash due to registration race
   3b83a52796cd tools/kvm_stat: fix handling of invalid paths in debugfs provider
   52614f7bf1b5 tools/kvm_stat: fix python3 issues
   0d66ce687869 mac80211: always account for A-MSDU header changes
   2592adfe326b mac80211: do not convert to A-MSDU if frag/subframe limited
   b22a5d20aab1 cfg80211: nl80211_update_ft_ies() to validate NL80211_ATTR_IE
   e7577a1f1a65 net: hns: add netif_carrier_off before change speed and duplex
   7fd11a1ad542 net: hns: add the code for cleaning pkt in chip
   bdd29365a74c gpiolib-acpi: Register GpioInt ACPI event handlers from a late_initcall
   73bfec0a6bde gpiolib: acpi: Switch to cansleep version of GPIO library call
   9a5d353908db mac80211: avoid kernel panic when building AMSDU from non-linear SKB
   79448960e3d7 mac80211: mesh: fix HWMP sequence numbering to follow standard
   34bec4daf88c gpio: adp5588: Fix sleep-in-atomic-context bug
   0081e67083ed mac80211_hwsim: correct use of IEEE80211_VHT_CAP_RXSTBC_X
   7c209ebc7f15 mac80211: correct use of IEEE80211_VHT_CAP_RXSTBC_X
   6054817c5e07 scsi: csiostor: add a check for NULL pointer after kmalloc()
   4e380c50cf12 btrfs: btrfs_shrink_device should call commit transaction at the end
   9e685bec07ae KVM: PPC: Book3S HV: Don't truncate HPTE index in xlate function
   381538ae75cf mac80211_hwsim: require at least one channel
   4ae9a73be7ac mac80211: Run TXQ teardown code before de-registering interfaces
   3a738e7f734c tools/power turbostat: fix possible sprintf buffer overflow
   cdb2d37d345d serial: mvebu-uart: Fix reporting of effective CSIZE to userspace
   a17e2a72e714 drm/amdgpu: add another ATPX quirk for TOPAZ
   d9e61345652b drm/amd/pp: initialize result to before or'ing in data
   e6abbe80c883 Linux 4.14.74
   d61ba3417e4f media: v4l: event: Prevent freeing event subscriptions while accessed
   fcaca557760f arm64: KVM: Sanitize PSTATE.M when being set from userspace
   4fff53acff15 x86/pti: Fix section mismatch warning/error
   23210d92f617 i2c: i801: Allow ACPI AML access I/O ports not reserved for SMBus
   647b6d4ff699 arm/arm64: smccc-1.1: Handle function result as parameters
   826d8678cde2 arm/arm64: smccc-1.1: Make return values unsigned long
   75b3054d6807 ARM: dts: omap4-droid4: Fix emmc errors seen on some devices
   d11237bdcf95 nvme-fcloop: Fix dropped LS's to removed target port
   516b72e36ded ata: ftide010: Add a quirk for SQ201
   46cb720a8a3e drm/amdgpu: Update power state at the end of smu hw_init.
   50850b432cc5 drm/amdgpu: Enable/disable gfx PG feature in rlc safe mode
   9190a7ea313f Revert "ARM: dts: imx7d: Invert legacy PCI irq mapping"
   d3ddd8e16cab hwmon: (adt7475) Make adt7475_read_word() return errors
   0647ce03bd48 hwmon: (ina2xx) fix sysfs shunt resistor read access
   59f5838cc950 crypto: cavium/nitrox - fix for command corruption in queue full case with backlog submissions.
   243af256387c e1000: ensure to free old tx/rx rings in set_ringparam()
   716865940461 e1000: check on netif_running() before calling e1000_up()
   e8baff89bc3f net: hns: fix skb->truesize underestimation
   333f26129fd9 net: hns: fix length and page_offset overflow when CONFIG_ARM64_64K_PAGES
   92935e1c2a7e bpf: sockmap: write_space events need to be passed to TCP handler
   f0a8c1257fc3 tls: possible hang when do_tcp_sendpages hits sndbuf is full case
   97ee8505c637 isofs: reject hardware sector size > 2048 bytes
   083be6fbfdcb thermal: of-thermal: disable passive polling when thermal zone is disabled
   308206bd2770 qed: Avoid sending mailbox commands when MFW is not responsive
   583f866501c1 qed: Prevent a possible deadlock during driver load and unload
   73046b822c4c qed: Wait for MCP halt and resume commands to take place
   33906ae926e0 qed: Wait for ready indication before rereading the shmem
   38d070f9090a arm64: KVM: Tighten guest core register access from userspace
   d428e43eb684 serial: imx: restore handshaking irq for imx1
   016d4aae9d84 drm/i915: Remove vma from object on destroy, not close
   d134e9170417 ovl: hash non-dir by lower inode for fsnotify
   105470069de3 RDMA/uverbs: Atomically flush and mark closed the comp event queue
   693536a7ce39 IB/hfi1: Fix context recovery when PBC has an UnsupportedVL
   412a4b4db1a6 IB/hfi1: Invalid user input can result in crash
   d9e49e9ed8d6 IB/hfi1: Fix SL array bounds check
   fcbe49c82b82 IB/srp: Avoid that sg_reset -d ${srp_device} triggers an infinite loop
   3011b91478ff Input: elantech - enable middle button of touchpad on ThinkPad P72
   9691f745e17a USB: remove LPM management from usb_driver_claim_interface()
   be2360ed2d22 Revert "usb: cdc-wdm: Fix a sleep-in-atomic-context bug in service_outstanding_interrupt()"
   ec6dc4b61c33 USB: usbdevfs: restore warning for nonsensical flags
   25a8d4825165 USB: usbdevfs: sanitize flags more
   67d8e231759f media: uvcvideo: Support realtek's UVC 1.5 device
   1ddc0781c0ce slub: make ->cpu_partial unsigned int
   e75c01761a11 usb: musb: dsps: do not disable CPPI41 irq in driver teardown
   5b6717c6a3c0 USB: handle NULL config in usb_find_alt_setting()
   4253abe6a3aa USB: fix error handling in usb_driver_claim_interface()
   5eaaa5e9bd56 regulator: fix crash caused by null driver data
   b6adc1f24bb3 spi: rspi: Fix interrupted DMA transfers
   082e34f367a5 spi: rspi: Fix invalid SPI use during system suspend
   6074b71d617d spi: sh-msiof: Fix handling of write value for SISTR register
   d120858fca5f spi: sh-msiof: Fix invalid SPI use during system suspend
   429773341c34 spi: tegra20-slink: explicitly enable/disable clock
   dc89d37f9098 intel_th: Fix device removal logic
   247cc73cd8f5 serial: cpm_uart: return immediately from console poll
   2b7ba104769b tty: serial: lpuart: avoid leaking struct tty_struct
   4fe780c1baec x86/mm: Expand static page table for fixmap space
   04bc4dd86d0f floppy: Do not copy a kernel pointer to user memory in FDGETPRM ioctl
   f88e50ea0300 ARM: dts: dra7: fix DCAN node addresses
   99795ed0c62d iio: 104-quad-8: Fix off-by-one error in register selection
   a82a772da750 Input: xen-kbdfront - fix multi-touch XenStore node's locations
   91e30cae8903 fs/lock: skip lock owner pid translation in case we are in init_pid_ns
   0c4439c44416 EDAC: Fix memleak in module init error path
   a4f7bea87887 nfsd: fix corrupted reply to badly ordered compound
   de6ccdbd7734 gpio: Fix wrong rounding in gpio-menz127
   5bcbbadf6ac5 module: exclude SHN_UNDEF symbols from kallsyms api
   05f78b1a0e0c ASoC: dapm: Fix potential DAI widget pointer deref when linking DAIs
   3fd534a5480e EDAC, i7core: Fix memleaks and use-after-free on probe and remove
   c96c2f2b11b6 scsi: megaraid_sas: Update controller info during resume
   a56b97a2fc2d iomap: complete partial direct I/O writes synchronously
   13ab355240a9 scsi: bnx2i: add error handling for ioremap_nocache
   d5963fae7f36 perf/x86/intel/lbr: Fix incomplete LBR call stack
   85222eb56f2a MIPS: boot: fix build rule of vmlinux.its.S
   b8e30b822d08 HID: hid-ntrig: add error handling for sysfs_create_group
   69cb15d6596d arm: dts: mediatek: Add missing cooling device properties for CPUs
   5ef7a3782de8 ARM: mvebu: declare asm symbols as character arrays in pmsu.c
   e87efc44dd36 wlcore: Add missing PM call for wlcore_cmd_wait_for_event_or_timeout()
   dad01c56989a brcmsmac: fix wrap around in conversion from constant to s16
   62bd8064fa88 rndis_wlan: potential buffer overflow in rndis_wlan_auth_indication()
   3c7f6b2cf6d6 ath10k: transmit queued frames after processing rx packets
   c1283a6270a2 drm/sun4i: Fix releasing node when enumerating enpoints
   3f7056e1822d net: phy: xgmiitorgmii: Check phy_driver ready before accessing
   accb431813bf ath10k: protect ath10k_htt_rx_ring_free with rx_ring.lock
   0f4ca55e441c net: phy: xgmiitorgmii: Check read_status results
   8d9fd12b1eef ALSA: hda: Add AZX_DCAPS_PM_RUNTIME for AMD Raven Ridge
   0ebe95dee2f2 media: tm6000: add error handling for dvb_register_adapter
   0091a4ede783 drivers/tty: add error handling for pcmcia_loop_config
   3af342f5ddbd staging: android: ashmem: Fix mmap size validation
   1b16d06a9e27 media: omap3isp: zero-initialize the isp cam_xclk{a,b} initial data
   daefaacc6e02 media: soc_camera: ov772x: correct setting of banding filter
   381f8d235dd8 media: s3c-camif: ignore -ENOIOCTLCMD from v4l2_subdev_call for s_power
   85d3dbd8e7f2 ALSA: snd-aoa: add of_node_put() in error path
   3e3f075f72bd posix-timers: Sanitize overrun handling
   a05bd4ba655f posix-timers: Make forward callback return s64
   cf373da10039 iio: accel: adxl345: convert address field usage in iio_chan_spec
   8cbb2f74c093 mtd: rawnand: atmel: add module param to avoid using dma
   a838008bb11f s390/extmem: fix gcc 8 stringop-overflow warning
   33cd135ebc97 s390/scm_blk: correct numa_node in scm_blk_dev_setup
   98a34e26d93d s390/dasd: correct numa_node in dasd_alloc_queue
   a4dbaf7c2de0 alarmtimer: Prevent overflow for relative nanosleep
   9374ffc6f3d3 s390/sysinfo: add missing #ifdef CONFIG_PROC_FS
   8deb5801f154 powerpc/powernv/ioda2: Reduce upper limit for DMA window size
   45d3d58f9739 ath10k: sdio: set skb len for all rx packets
   b31f41e02c80 ath10k: sdio: use same endpoint id for all packets in a bundle
   149f530334f0 usb: wusbcore: security: cast sizeof to int for comparison
   ebee32dd8f04 scsi: target: Avoid that EXTENDED COPY commands trigger lock inversion
   336b73754169 scsi: ibmvscsi: Improve strings handling
   1390c37d1670 scsi: klist: Make it safe to use klists in atomic context
   bdfc40bc1b09 scsi: target/iscsi: Make iscsit_ta_authentication() respect the output buffer size
   2cbead46fd4e ARM: dts: ls1021a: Add missing cooling device properties for CPUs
   8430918a04e3 x86/entry/64: Add two more instruction suffixes
   8e90c7ef50e2 ARM: hwmod: RTC: Don't assume lock/unlock will be called with irq enabled
   0a29ab00339e x86/tsc: Add missing header to tsc_msr.c
   23e4ab4069d1 media: staging/imx: fill vb2_v4l2_buffer field entry
   6fd38ba41e34 media: fsl-viu: fix error handling in viu_of_probe()
   769ae06e4442 powerpc/kdump: Handle crashkernel memory reservation failure
   333cb98f393b IB/mlx4: Test port number before querying type.
   1f94cf4c81cb media: exynos4-is: Prevent NULL pointer dereference in __isp_video_try_fmt()
   0ca45668ecdb IB/core: type promotion bug in rdma_rw_init_one_mr()
   eca859882359 RDMA/i40w: Hold read semaphore while looking after VMA
   e862ab6b69c4 RDMA/bnxt_re: Fix a couple off by one bugs
   e0ccd2360a47 md-cluster: clear another node's suspend_area after the copy is finished
   e70f938a605a power: remove possible deadlock when unregistering power_supply
   1117e411a46c s390/mm: correct allocate_pgste proc_handler callback
   bc4ce060b305 iommu/msm: Don't call iommu_device_{,un}link from atomic context
   96e878907c90 6lowpan: iphc: reset mac_header after decompress to fix panic
   410534a34315 USB: serial: kobil_sct: fix modem-status error handling
   90de5688afc3 Bluetooth: Add a new Realtek 8723DE ID 0bda:b009
   834a9ef5f831 iommu/amd: make sure TLB to be flushed before IOVA freed
   c7e653a24c18 power: vexpress: fix corruption in notifier registration
   c1a630680c8b uwb: hwa-rc: fix memory leak at probe
   72bad20e9316 serial: sh-sci: Stop RX FIFO timer during port shutdown
   0470189cd9b9 misc: sram: enable clock before registering regions
   914b4daa9b6d power: supply: axp288_charger: Fix initial constant_charge_current value
   2efa4bd5aa9a staging: rts5208: fix missing error check on call to rtsx_write_register
   6ecd10b1aa22 x86/numa_emulation: Fix emulated-to-physical node mapping
   127cd4e23323 vmci: type promotion bug in qp_host_get_user_memory()
   4804f372b53f tsl2550: fix lux1_input error in low light
   db12e7d3e9bc iio: adc: ina2xx: avoid kthread_stop() with stale task_struct
   29db2772349d crypto: skcipher - Fix -Wstringop-truncation warnings
   3b65f403d7d0 Linux 4.14.73
   97513162cd6d spi: Fix double IDR allocation with DT aliases
   ed5e9462f661 tick/nohz: Prevent bogus softirq pending warning
   3a411a04be4e iw_cxgb4: only allow 1 flush on user qps
   956fa50745b3 vmw_balloon: include asm/io.h
   23ac2a32b2f8 PCI: aardvark: Size bridges before resources allocation
   fe87d18b1471 sched/fair: Fix vruntime_normalized() for remote non-migration wakeup
   0d09307bc242 ext4: show test_dummy_encryption mount option in /proc/mounts
   3dc006d212e3 ext4: don't mark mmp buffer head dirty
   ba48e66e3f53 ext4: fix online resizing for bigalloc file systems with a 1k block size
   6a4d7b584d38 ext4: fix online resize's handling of a too-small final block group
   22654a3b4a30 ext4: recalucate superblock checksum after updating free blocks/inodes
   779af00b3fa3 ext4: avoid arithemetic overflow that can trigger a BUG
   3f9eafe8772f ext4: avoid divide by zero fault when deleting corrupted inline directories
   31343d27f18f ext4: check to make sure the rename(2)'s destination is not freed
   4334a6ae867a tty: vt_ioctl: fix potential Spectre v1
   57c806be0160 drm/amdgpu: add new polaris pci id
   5575041b09cd drm: udl: Destroy framebuffer only if it was initialized
   c70d8a488a41 drm/vc4: Fix the "no scaling" case on multi-planar YUV formats
   35e48a086071 drm/nouveau/drm/nouveau: Prevent handling ACPI HPD events too early
   0f966da783a3 drm/nouveau/drm/nouveau: Use pm_runtime_get_noresume() in connector_detect()
   409af02c200e drm/nouveau/drm/nouveau: Fix bogus drm_kms_helper_poll_enable() placement
   9ac837e079a0 drm/nouveau/drm/nouveau: Don't forget to cancel hpd_work on suspend/unload
   42387d8e4aef drm/nouveau: Fix deadlocks in nouveau_connector_detect()
   7c1ca8fb8633 ocfs2: fix ocfs2 read block panic
   1d7e23f9068f Revert "ubifs: xattr: Don't operate on deleted inodes"
   44383139a39c scsi: target: iscsi: Use bin2hex instead of a re-implementation
   755e45f3155c scsi: target: iscsi: Use hex2bin instead of a re-implementation
   50ec69edf3f0 Revert "uapi/linux/keyctl.h: don't use C++ reserved keyword as a struct member name"
   13d216167d3d Revert "rpmsg: core: add support to power domains for devices"
   6447b34fc270 mm: shmem.c: Correctly annotate new inodes for lockdep
   7eba38a3f65d ring-buffer: Allow for rescheduling when removing pages
   0e5cdbac0303 Revert "PCI: Add ACS quirk for Intel 300 series"
   f3765abb60c7 spi: fix IDR collision on systems with both fixed and dynamic SPI bus numbers
   5ca87a38202e xen/x86/vpmu: Zero struct pt_regs before calling into sample handling code
   7eced4478f4e xen/netfront: don't bug in case of too many frags
   e2d5285b98ef platform/x86: alienware-wmi: Correct a memory leak
   ff6805037d83 ALSA: oxfw: fix memory leak of private data
   08f4f8b93809 ALSA: oxfw: fix memory leak of discovered stream formats at error path
   996899a9cbd8 ALSA: oxfw: fix memory leak for model-dependent data at error path
   d9929097176d ALSA: fireworks: fix memory leak of response buffer at error path
   40e2596f06b0 ALSA: firewire-tascam: fix memory leak of private data
   933f20a61e26 ALSA: firewire-digi00x: fix memory leak of private data
   70165a445b00 ALSA: fireface: fix memory leak in ff400_switch_fetching_mode()
   352701c288c1 ALSA: emu10k1: fix possible info leak to userspace on SNDRV_EMU10K1_IOCTL_INFO
   7c4881d64ed7 ALSA: bebob: use address returned by kmalloc() instead of kernel stack for streaming DMA mapping
   16b8c03864b7 ALSA: bebob: fix memory leak for M-Audio FW1814 and ProjectMix I/O at error path
   c7cf0304d41f ASoC: rsnd: fixup not to call clk_get/set under non-atomic
   a388e6d7a822 ASoC: cs4265: fix MMTLR Data switch control
   6ead7a8a4ec1 NFC: Fix the number of pipes
   4a16b3cd084d NFC: Fix possible memory corruption when handling SHDLC I-Frame commands
   18fef87e05d3 tls: clear key material from kernel memory when do_tls_setsockopt_conf fails
   0c0334299a7e tls: zero the crypto information from tls_context before freeing
   10cacaf13189 tls: don't copy the key out of tls12_crypto_info_aes_gcm_128
   ee547ed7dee4 net/sched: act_sample: fix NULL dereference in the data path
   b13f721a3409 udp6: add missing checks on edumux packet processing
   ff64a1a2ca3d neighbour: confirm neigh entries when ARP packet is received
   0f6f77f3b8f4 udp4: fix IP_CMSG_CHECKSUM for connected sockets
   6f5ec16ee02b qmi_wwan: set DTR for modems in forced USB2 mode
   f3aa1f3a1113 pppoe: fix reception of frames with no mac header
   c0f2c063abc8 net: hp100: fix always-true check for link up state
   9951e17efd05 net/appletalk: fix minor pointer leak to userspace in SIOCFINDIPDDPRT
   bba90d3686fd ipv6: fix possible use-after-free in ip6_xmit()
   13a47054f0b2 gso_segment: Reset skb->mac_len after modifying network header

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 3f60baf40491..d6d37ed315d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ad0965b9752eb70d74206dc942803d1ea6c6c93d"
-SRCREV_meta ?= "1fb0b0379fb5883ce5af7485374e3f78ee4272d3"
+SRCREV_machine ?= "eafe398ca1404953c2a01559c83d3a983f8717b1"
+SRCREV_meta ?= "3435617380af107e31ec4e36173b9cf1f8a371a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.71"
+LINUX_VERSION ?= "4.14.76"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index f599c90db256..d613ff05f7d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.71"
+LINUX_VERSION ?= "4.14.76"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3218be18094b7dfb4471b083c469452c8c7709ce"
-SRCREV_meta ?= "1fb0b0379fb5883ce5af7485374e3f78ee4272d3"
+SRCREV_machine ?= "c5aca000e387da12ce375251c829f653503d32b4"
+SRCREV_meta ?= "3435617380af107e31ec4e36173b9cf1f8a371a0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 40ee1e9fc400..cb4a66b71149 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "01420c91452e2d0b3e2979fa28e4223d3febecac"
-SRCREV_machine_qemuarm64 ?= "8a03088a8a605ecaaa3d50fd01df879db51e7658"
-SRCREV_machine_qemumips ?= "ec4f1d52fb385941f77a3611a833153f24354d98"
-SRCREV_machine_qemuppc ?= "51e55e9630dc7bc351dc659eb7fa97446a84cf9f"
-SRCREV_machine_qemux86 ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
-SRCREV_machine_qemux86-64 ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
-SRCREV_machine_qemumips64 ?= "f074d718736e95e8ed5460bf8e85c7e77ff7df87"
-SRCREV_machine ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
-SRCREV_meta ?= "1fb0b0379fb5883ce5af7485374e3f78ee4272d3"
+SRCREV_machine_qemuarm ?= "91251c7c3d5e9ba9bb527130db440c00bec30fe6"
+SRCREV_machine_qemuarm64 ?= "72e2b6e07170fd84a93469830c69c31c9fa1c1dd"
+SRCREV_machine_qemumips ?= "fe1a03895bd26473b6e60e76ed54d021561374a7"
+SRCREV_machine_qemuppc ?= "e1d81834af552e5caf6c968d2f755866cee19d4e"
+SRCREV_machine_qemux86 ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
+SRCREV_machine_qemux86-64 ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
+SRCREV_machine_qemumips64 ?= "512b0a8df98e49746548444cc4c9543ef0c23369"
+SRCREV_machine ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
+SRCREV_meta ?= "3435617380af107e31ec4e36173b9cf1f8a371a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.71"
+LINUX_VERSION ?= "4.14.76"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


