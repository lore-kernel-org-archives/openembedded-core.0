Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A481BC25B75
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:25 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.4161.1714705224099394925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHFU676e;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6a0ce3e823fso26092406d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705223; x=1715310023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQZKCWloZbB5vel8kovoXXGeY/ohV61DQgEl4LmCopM=;
        b=FHFU676ej5K0xferTpQ98IE+wj84fqpWEZ1M8w9CZP0J7jlHaw/l+ZCTUmYCKV6vrg
         fwpPabb9xh1dhQ70JxCEA/9DJobKgE2xgs4ixGixgBTo0XkWLkNQFabQ+HDxpF7APCfk
         0doRy5071YHZfhGLELVYwmFnMzN24zAKh4EIbVkZmxtsaY2zA4hC2ldhGnSFBkQRtoDh
         Q0SgT+UsatptvKSc06hTBwwWbB9EacMK2+52mlph5rqj6bfQqTbAQK3Hc82nqPOj6FNP
         Qt+X/E+V9w6v832Q/V2LTlVLOuCpXxqJgvYw+fAIR8n1x1c6jVOtg80ZwEkjuTPJugUo
         Ggfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705223; x=1715310023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQZKCWloZbB5vel8kovoXXGeY/ohV61DQgEl4LmCopM=;
        b=osqGLjTvkPyMHrz6/LCreGIdOxo6hf8HHUTdnwzgZtanJ5k1P5fEkyNw9gut91bxs2
         9F1iaQP8Oy3VeSc17XgQkRtTUXIdBeNoY88BrkXSwKUOadVSBlzo7XJvLr29GwfL3nHo
         6scrmUdZ/geehWtdcs4phm7tEM2i98JMVr26u1/QcC9O2OnXDKkofb0Neu/21cyWze/w
         9BdoDD4QjmME+GdaJEfYw7iFV+shpoes4ouoLphPwOYRc4mjdf4daq9i47Hv0Z8SB1mh
         ETVJW7v9YdoiwjxMorOa0z0T/1kesR9VimfQVJe5XX7+1On8FcYf2udq2/ddLmzfCCJS
         /NkA==
X-Gm-Message-State: AOJu0Yy3MkJlIAlfysKgryWLIlK9+fDp/vb9lSp99HgLesCWDFQQ+z30
	td8WKbc9us5kYUJL3JHHbxk4bNXGxttL00ZLPaYIP4JE/SCYDqy7NQzQ/w==
X-Google-Smtp-Source: AGHT+IHL3ouYATStVvFh7qQJFrA5GR/RJY8+baCREnch+4xdpe+SuVmZc1M7ToGCl4JXjzzruBPoUA==
X-Received: by 2002:a05:6214:f6a:b0:6a0:bb9d:e890 with SMTP id iy10-20020a0562140f6a00b006a0bb9de890mr1823370qvb.41.1714705222796;
        Thu, 02 May 2024 20:00:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/10] linux-yocto/6.1: update to v6.1.84
Date: Thu,  2 May 2024 23:00:11 -0400
Message-Id: <20240503030015.374078-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198961

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    347385861c50 Linux 6.1.84
    7b970a145c90 tools/resolve_btfids: fix build with musl libc
    ab062fa3dc69 USB: core: Fix deadlock in usb_deauthorize_interface()
    df84d9f7796f x86/sev: Skip ROM range scans and validation for SEV-SNP guests
    98cfafaf2f41 scsi: libsas: Fix disk not being scanned in after being removed
    d511040d8169 scsi: libsas: Add a helper sas_get_sas_addr_and_dev_type()
    8dbc1762202a scsi: lpfc: Correct size for wqe for memset()
    d8cd93e03047 scsi: lpfc: Correct size for cmdwqe/rspwqe for memset()
    f2b85a4cc763 tls: fix use-after-free on failed backlog decryption
    00f511d71629 x86/cpu: Enable STIBP on AMD if Automatic IBRS is enabled
    f30b3ee9a486 scsi: qla2xxx: Delay I/O Abort on PCI error
    65f195232b37 scsi: qla2xxx: Change debug message during driver unload
    282877633b25 scsi: qla2xxx: Fix double free of fcport
    09c0ac18cac2 scsi: qla2xxx: Fix command flush on cable pull
    1bcbd100abb8 scsi: qla2xxx: NVME|FCP prefer flag not being honored
    101c1d2d46a1 scsi: qla2xxx: Update manufacturer detail
    14a3ca35c523 scsi: qla2xxx: Split FCE|EFT trace control
    3cd58084e48e scsi: qla2xxx: Fix N2N stuck connection
    3b9d72442adf scsi: qla2xxx: Prevent command send on chip reset
    c223bc352cd3 usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE before reset
    12d0306cecf1 usb: typec: ucsi_acpi: Refactor and fix DELL quirk
    f8704d54c8e7 usb: typec: ucsi: Ack unsupported commands
    959aacfe3ab6 usb: typec: ucsi: Clear EVENT_PENDING under PPM lock
    2d28af770d4d usb: typec: Return size of buffer if pd_set operation succeeds
    f74c5e0b54b0 usb: udc: remove warning when queue disabled ep
    19ca7ef7d839 usb: dwc2: gadget: LPM flow fix
    74cdf12f8dd8 usb: dwc2: gadget: Fix exiting from clock gating
    bc48eb1b53ce usb: dwc2: host: Fix ISOC flow in DDMA mode
    329492820681 usb: dwc2: host: Fix hibernation flow
    4a8a42e16a5e usb: dwc2: host: Fix remote wakeup from hibernation
    3e284e15b7f0 scsi: sd: Fix TCG OPAL unlock on system resume
    9dac54f08198 USB: core: Fix deadlock in port "disable" sysfs attribute
    cd20a6e83ba0 USB: core: Add hub_get() and hub_put() routines
    8416da2df7e0 staging: vc04_services: fix information leak in create_component()
    008bf3d622a9 staging: vc04_services: changen strncpy() to strscpy_pad()
    3678cf67ff71 scsi: core: Fix unremoved procfs host directory regression
    9d66ae0e7bb7 ALSA: sh: aica: reorder cleanup operations to avoid UAF bugs
    6c6a45645a2e usb: dwc3-am62: fix module unload/reload behavior
    aa1d1ce1ad6b usb: dwc3-am62: Rename private data
    c9006b90ba68 USB: UAS: return ENODEV when submit urbs fail with device not attached
    916cd2fcbc1e usb: cdc-wdm: close race between read and workqueue
    181f92abda61 Revert "usb: phy: generic: Get the vbus supply"
    fa2b938438cd Bluetooth: hci_sync: Fix not checking error on hci_cmd_sync_cancel_sync
    7eab7b021835 drm/i915/gt: Reset queue_priority_hint on parking
    72e4d3fb72e9 drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode()
    b691954c94db drm/amdkfd: fix TLB flush after unmap for GFX9.4.2
    016119154981 drm/vmwgfx: Create debugfs ttm_resource_manager entry only if needed
    46efbdbc95a3 net: ll_temac: platform_get_resource replaced by wrong function
    9acfd8b083a0 nouveau/dmem: handle kcalloc() allocation failure
    6fc218ccd534 thermal: devfreq_cooling: Fix perf state when calculate dfc res_util
    244cb8200e3a block: Do not force full zone append completion in req_bio_endio()
    ad9cc5e9e53a mmc: core: Avoid negative index with array access
    547f4afaced0 mmc: core: Initialize mmc_blk_ioc_data
    a433300285d7 mmc: sdhci-omap: re-tuning is needed after a pm transition to support emmc HS200 mode
    192058bb3e1b hexagon: vmlinux.lds.S: handle attributes section
    4e79b4a64d08 exec: Fix NOMMU linux_binprm::exec in transfer_args_to_stack()
    7aa70c492272 wifi: iwlwifi: fw: don't always use FW dump trig
    7eeabcea79b6 wifi: mac80211: check/clear fast rx for non-4addr sta VLAN changes
    d7387bcb7781 btrfs: zoned: use zone aware sb location for scrub
    a321a9907c0e btrfs: zoned: don't skip block groups with 100% zone unusable
    6b226ae43d82 efi/libstub: Cast away type warning in use of max()
    ca8106fffc11 x86/efistub: Add missing boot_params for mixed mode compat entry
    bf2ba0b241e8 init: open /initrd.image with O_LARGEFILE
    3372c3ffc345 mm/migrate: set swap entry values of THP tail pages properly.
    fe272b61506b x86/sev: Fix position dependent variable references in startup code
    77e3de411395 x86/Kconfig: Remove CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT
    851ddc358737 x86/coco: Get rid of accessor functions
    452a38297064 x86/coco: Export cc_vendor
    083e750c9f5f vfio/fsl-mc: Block calling interrupt handler without trigger
    7932db06c82c vfio/platform: Create persistent IRQ handlers
    7d29d4c72c1e vfio/pci: Create persistent INTx handler
    33dc33f56001 vfio: Introduce interface to flush virqfd inject workqueue
    139dfcc4d723 vfio/pci: Disable auto-enable of exclusive INTx IRQ
    6d87a9be2215 selftests: mptcp: diag: return KSFT_FAIL not test_cnt
    052e4c8987ee blk-mq: release scheduler resource when request completes
    242006996d15 block: Fix page refcounts for unaligned buffers in __bio_release_pages()
    4f2debd9c680 tty: serial: imx: Fix broken RS485
    44b6fb6cdedb pwm: img: fix pwm clock lookup
    b9d103aca85f efi: fix panic in kdump kernel
    21c7c00dae55 x86/fpu: Keep xfd_state in sync with MSR_IA32_XFD
    493ed133b4e4 efi/libstub: fix efi_random_alloc() to allocate memory at alloc_min or higher address
    641768431508 kprobes/x86: Use copy_from_kernel_nofault() to read from unsafe address
    dc33e92af306 irqchip/renesas-rzg2l: Prevent spurious interrupts when setting trigger type
    573777eb5607 irqchip/renesas-rzg2l: Rename rzg2l_irq_eoi()
    551ad70e8662 irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
    5dc2cb3eeeee irqchip/renesas-rzg2l: Add macro to retrieve TITSR register offset based on register's index
    7775e87f503a irqchip/renesas-rzg2l: Flush posted write in irq_eoi()
    0250a68a35c9 irqchip/renesas-rzg2l: Implement restriction when writing ISCR register
    2f67c82ed04e printk: Update @console_may_schedule in console_trylock_spinning()
    d7f62fde4191 iommu/dma: Force swiotlb_max_mapping_size on an untrusted device
    ef80ecc72127 swiotlb: Fix alignment checks when both allocation and DMA masks are present
    8d8be62a7d53 minmax: add umin(a, b) and umax(a, b)
    3e5222a17914 entry: Respect changes to system call number by trace_sys_enter()
    936381380ae8 clocksource/drivers/arm_global_timer: Fix maximum prescaler value
    64c3873cb255 iommu: Avoid races around default domain allocations
    6ee02e355931 ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
    cd1bbca03f3c net: tls: handle backlogging of crypto requests
    2149f8a56e2e x86/efistub: Call mixed mode boot services on the firmware's stack
    7a391de927a7 drm/amd/display: handle range offsets in VRR ranges
    43fe5dc9faa0 i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
    d50fd2f24f3e iio: accel: adxl367: fix I2C FIFO data register
    5df4c386d35e iio: accel: adxl367: fix DEVID read after reset
    155a3d8d8f77 mm, vmscan: prevent infinite loop for costly GFP_NOIO | __GFP_RETRY_MAYFAIL allocations
    e5b5948c769a tee: optee: Fix kernel panic caused by incorrect error handling
    2cfa00b0e87f ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook
    635e23035dd4 ALSA: hda/realtek - Add Headset Mic supported Acer NB platform
    18d5fc3c16cc fs/aio: Check IOCB_AIO_RW before the struct aio_kiocb conversion
    994a1e583c0c vt: fix unicode buffer corruption when deleting characters
    99cd2d491d1c mei: me: add arrow lake point H DID
    2d56aca54847 mei: me: add arrow lake point S DID
    4154e7673541 misc: lis3lv02d_i2c: Fix regulators getting en-/dis-abled twice on suspend/resume
    d40ab6921748 tty: serial: fsl_lpuart: avoid idle preamble pending if CTS is enabled
    ccaa4fb8dc4f usb: port: Don't try to peer unused USB ports based on location
    7664ee8bd803 usb: gadget: ncm: Fix handling of zero block length packets
    f42ba916689f USB: usb-storage: Prevent divide-by-0 error in isd200_ata_command
    e5b3ad3e8ee4 ALSA: hda/realtek - Fix headset Mic no show at resume back for Lenovo ALC897 platform
    2eadf1adf513 drm/i915: Check before removing mm notifier
    7f122486a061 drm/amdgpu/pm: Fix the error of pwm1_enable setting
    3a70b1c93264 tracing: Use .flush() call to wake up readers
    4868c0ecdb6c KVM: SVM: Flush pages under kvm->lock to fix UAF in svm_register_enc_region()
    726374dde5d6 KVM: x86: Mark target gfn of emulated atomic instruction as dirty
    d24a79ccdf25 init/Kconfig: lower GCC version check for -Warray-bounds
    408837d7ef66 xfrm: Avoid clang fortify warning in copy_to_user_tmpl()
    4f34b79c77ec Drivers: hv: vmbus: Calculate ring buffer size for more efficient use of memory
    73e4f955b3f8 netfilter: nf_tables: reject constant set with timeout
    72c1efe3f247 netfilter: nf_tables: disallow anonymous set with timeout flag
    406b0241d0eb netfilter: nf_tables: mark set as dead when unbinding anonymous set with timeout
    196f198ca6fc tls: fix race between tx work scheduling and socket close
    36c676e2ed36 platform/x86: p2sb: On Goldmont only cache P2SB and SPI devfn BAR
    e82dc11315a7 cpufreq: brcmstb-avs-cpufreq: fix up "add check for cpufreq_cpu_get's return value"
    62e06fdd180a x86/pm: Work around false positive kmemleak report in msr_build_context()
    3d47eb405781 dm snapshot: fix lockup in dm_exception_table_exit
    3070c70a3e46 drm/amd/display: Fix noise issue on HDMI AV mute
    0581a4dac661 drm/amd/display: Return the correct HDCP error code
    589c414138a1 drm/amdgpu: amdgpu_ttm_gart_bind set gtt bound flag
    139845240d27 ahci: asm1064: asm1166: don't limit reported ports
    25bc98657021 ahci: asm1064: correct count of reported ports
    09c3fa70f651 wireguard: netlink: access device through ctx instead of peer
    b7cea3a9af08 wireguard: netlink: check for dangling peer via is_dead instead of empty list
    97cd43ba824a LoongArch: Define the __io_aw() hook as mmiowb()
    77eae2d257d6 LoongArch: Change __my_cpu_offset definition to avoid mis-optimization
    0e21852b888d net: hns3: tracing: fix hclgevf trace event strings
    6bcf9d2cade1 NFSD: Fix nfsd_clid_class use of __string_len() macro
    efd67e570ae7 x86/CPU/AMD: Update the Zenbleed microcode revisions
    9f23176ad72f cpufreq: dt: always allocate zeroed cpumask
    bbec4e4d84c3 cifs: open_cached_dir(): add FILE_READ_EA to desired access
    192e9f9078c9 nilfs2: prevent kernel bug at submit_bh_wbc()
    46b832e09d43 nilfs2: fix failure to detect DAT corruption in btree and direct mappings
    f5bc133ef62e f2fs: truncate page cache before clearing flags when aborting atomic write
    1f5124c74aaa f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag
    af4b1a5aa00b Revert "block/mq-deadline: use correct way to throttling write requests"
    50e9f82b1c1d memtest: use {READ,WRITE}_ONCE in memory scanning
    fcf7345280af drm/vc4: hdmi: do not return negative values from .get_modes()
    ae696b7c00ef drm/imx/ipuv3: do not return negative values from .get_modes()
    8f914db6fe25 drm/exynos: do not return negative values from .get_modes()
    191df89d8fb0 drm/panel: do not return negative error codes from drm_panel_get_modes()
    cb676955d1ac drm/probe-helper: warn about negative .get_modes()
    b7f6c3630eb3 s390/zcrypt: fix reference counting on zcrypt card objects
    d6b5aac451c9 soc: fsl: qbman: Use raw spinlock for cgr_lock
    a62168653774 soc: fsl: qbman: Always disable interrupts when taking cgr_lock
    b1cf18e5bd87 ring-buffer: Use wait_event_interruptible() in ring_buffer_wait()
    6e0f7e6fb1c4 ring-buffer: Fix full_waiters_pending in poll
    6c2f0e055085 ring-buffer: Fix resetting of shortest_full
    1df7dcfb8af3 ring-buffer: Do not set shortest_full when full target is hit
    6615ef6e3166 ring-buffer: Fix waking up ring buffer readers
    2952d0db18cf ksmbd: retrieve number of blocks using vfs_getattr in set_file_allocation_info
    4ee09d4099bb vfio/platform: Disable virqfds on cleanup
    3fe0ac10bd11 vfio/pci: Lock external INTx masking ops
    f56ba2d48434 vfio/pci: Remove negative check on unsigned vector
    dcc6b99c61ec vfio/pci: Consolidate irq cleanup on MSI/MSI-X disable
    0f1e6cd8fb3c vfio: Use GFP_KERNEL_ACCOUNT for userspace persistent allocations
    4732ac1c23b5 PCI: hv: Fix ring buffer size calculation
    3d863cf20797 PCI: dwc: endpoint: Fix advertised resizable BAR size
    04f3652bd0fd PCI: qcom: Enable BDF to SID translation properly
    a601e7a7fc8e PCI: qcom: Rename qcom_pcie_config_sid_sm8250() to reflect IP version
    32eaf695d3c7 kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1
    3abc2d160ed8 nfs: fix UAF in direct writes
    f3ed58d7b356 sparc32: Fix parport build with sparc32
    bda2265e6d1c sparc: Explicitly include correct DT includes
    220778af6c72 io_uring/net: correctly handle multishot recvmsg retry setup
    3a342fa31840 PCI/AER: Block runtime suspend when handling errors
    768625f84b2a speakup: Fix 8bit characters from direct synth
    bf1eef7fc0f3 usb: gadget: tegra-xudc: Fix USB3 PHY retrieval logic
    9cb3ace50238 phy: tegra: xusb: Add API to retrieve the port number of phy
    b4139fe933df slimbus: core: Remove usage of the deprecated ida_simple_xx() API
    08eceec7931e nvmem: meson-efuse: fix function pointer type mismatch
    fb1088d51bba ext4: fix corruption during on-line resize
    b04abf51d725 hwmon: (amc6821) add of_match table
    acda20add476 landlock: Warn once if a Landlock action is requested while disabled
    03f58a64794a drm/etnaviv: Restore some id values
    ad8a4eb66352 mmc: core: Fix switch on gp3 partition
    1ede7f1d7eed mm: swap: fix race between free_swap_and_cache() and swapoff()
    509546fc0347 swap: comments get_swap_device() with usage rule
    dcd51ab42b7a mac802154: fix llsec key resources release in mac802154_llsec_key_del
    f299404fd869 powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
    aab8a0745f87 dm-raid: fix lockdep waring in "pers->hot_add_disk"
    c9ef367b3e39 PCI/DPC: Quirk PIO log size for Intel Raptor Lake Root Ports
    900b81caf00c PCI/PM: Drain runtime-idle callbacks before driver removal
    50361c2af756 btrfs: fix off-by-one chunk length calculation at contains_pending_extent()
    c13e7256571f btrfs: qgroup: always free reserved space for extent records
    b8073c069a84 serial: Lock console when calling into driver before registration
    2496e37ada36 usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
    371f27c2c8fc fuse: don't unhash root
    970e8c49f2cf fuse: fix root lookup with nonzero generation
    bdba49e46905 mmc: tmio: avoid concurrent runs of mmc_request_done()
    56a2038d0017 PM: sleep: wakeirq: fix wake irq warning in system suspend
    a43ebdbd39ce USB: serial: cp210x: add pid/vid for TDK NC0110013M and MM0110113M
    ed85c3113ad1 KVM: x86/xen: inject vCPU upcall vector when local APIC is enabled
    8093d6e928bd USB: serial: option: add MeiG Smart SLM320 product
    d0ab375e730a USB: serial: cp210x: add ID for MGP Instruments PDS100
    b67095647f5b USB: serial: add device ID for VeriFone adapter
    a87209645494 USB: serial: ftdi_sio: add support for GMC Z216C Adapter IR-USB
    33a4aa08d5f0 powerpc/fsl: Fix mfpmr build errors with newer binutils
    b2c898469dfc usb: xhci: Add error handling in xhci_map_urb_for_dma
    537040c257ab clk: qcom: mmcc-msm8974: fix terminating of frequency table arrays
    185de0b7cdea clk: qcom: mmcc-apq8084: fix terminating of frequency table arrays
    dd92b159c506 clk: qcom: gcc-ipq8074: fix terminating of frequency table arrays
    852db52b45ea clk: qcom: gcc-ipq6018: fix terminating of frequency table arrays
    a7b6523f9200 PM: suspend: Set mem_sleep_current during kernel command line setup
    56452891e262 cpufreq: Limit resolving a frequency to policy min/max
    9477cfeb3008 md/raid5: fix atomicity violation in raid5_cache_count
    ceffd026f851 parisc: Strip upper 32 bit of sum in csum_ipv6_magic for 64-bit builds
    053bb9aab73d parisc: Fix csum_ipv6_magic on 64-bit systems
    a5d32783a566 parisc: Fix csum_ipv6_magic on 32-bit systems
    3b64d68d90f5 parisc: Fix ip_fast_csum
    6eb684e9c0d0 parisc: Avoid clobbering the C/B bits in the PSW with tophys and tovirt macros
    10857a2412fc parisc/unaligned: Rewrite 64-bit inline assembly of emulate_ldd()
    ffbfea10d9c9 mtd: rawnand: meson: fix scrambling mode value in command macro
    5d1442eeb936 ubi: correct the calculation of fastmap size
    5ecbc7465f66 ubi: Check for too small LEB size in VTBL code
    142d87c958d9 ubifs: Set page uptodate in the correct place
    c8cc05de8e6b fat: fix uninitialized field in nostale filehandles
    428ca0000f0a bounds: support non-power-of-two CONFIG_NR_CPUS
    03b821647b73 kasan/test: avoid gcc warning for intentional overflow
    5ea241b1931f block: Clear zone limits for a non-zoned stacked queue
    719d7f899df4 ext4: correct best extent lstart adjustment logic
    81479bf75809 selftests/mqueue: Set timeout to 180 seconds
    226fc408c5fc crypto: qat - resolve race condition during AER recovery
    efffffde33d6 crypto: qat - fix double free during reset
    8557bef80cc3 sparc: vDSO: fix return value of __setup handler
    0993f7f85d26 sparc64: NMI watchdog: fix return value of __setup handler
    605ddb3a6e5f powerpc/smp: Increase nr_cpu_ids to include the boot CPU
    334fb14389b5 powerpc/smp: Adjust nr_cpu_ids to cover all threads of a core
    14cdbd9440a4 cpufreq: amd-pstate: Fix min_perf assignment in amd_pstate_adjust_perf()
    b54478d20375 KVM: Always flush async #PF workqueue when vCPU is being destroyed
    e2c545b841a7 media: mc: Expand MUST_CONNECT flag to always require an enabled link
    61656ca92ea9 media: mc: Rename pad variable to clarify intent
    cff51913c5cc media: mc: Add num_links flag to media_pad
    f29793c33984 media: mc: Fix flags handling when creating pad links
    1025ff4e6a7a media: mc: Add local pad to pipeline regardless of the link state
    09c1be4d581d media: xc4000: Fix atomicity violation in xc4000_get_frequency
    6d21d0356aa4 pci_iounmap(): Fix MMIO mapping leak
    12609c76b755 serial: max310x: fix NULL pointer dereference in I2C instantiation
    07c3fe923ff7 drm/vmwgfx: Fix possible null pointer derefence with invalid contexts
    74cd997ba17b arm: dts: marvell: Fix maxium->maxim typo in brownstone dts
    dee9c2586555 smack: Handle SMACK64TRANSMUTE in smack_inode_setsecurity()
    d4b1c3b5ec1c smack: Set SMACK64TRANSMUTE only for dirs in smack_inode_setxattr()
    a881dd09fd99 clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
    9875deeefedf remoteproc: virtio: Fix wdg cannot recovery remote processor
    5166fc45d7ea arm64: dts: qcom: sc7280: Add additional MSI interrupts
    e144e47703ce media: staging: ipu3-imgu: Set fields before media_entity_pads_init()
    0b812f706fd7 wifi: brcmfmac: Fix use-after-free bug in brcmf_cfg80211_detach
    113d5341ee12 timers: Rename del_timer_sync() to timer_delete_sync()
    2957037c1d94 timers: Use del_timer_sync() even on UP
    a50fd9871257 timers: Update kernel-doc for various functions
    981cf0cab48a KVM: x86: Use a switch statement and macros in __feature_translate()
    b6aa21725fbe KVM: x86: Advertise CPUID.(EAX=7,ECX=2):EDX[5:0] to userspace
    8d70aa08326c KVM: x86: Update KVM-only leaf handling to allow for 100% KVM-only leafs
    3769db86adec x86/bugs: Use sysfs_emit()
    f1ee75aa66c7 x86/cpu: Support AMD Automatic IBRS
    cc4860dd1375 Subject: [PATCH v6.1] powerpc: drop duplicate entry in Makefile for lib dir
    e083231c43f3 net: fix IPSTATS_MIB_OUTFORWDATAGRAMS increment after fragment check
    6ee7f29fed8c net: ipv4, ipv6: fix IPSTATS_MIB_OUTOCTETS increment duplicated
    a771780cdf4a net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    8a9f2d0717f0 riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT
    786775632028 kernel/sched: Fix double free on invalid isolcpus/nohz_full params
    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup
    f46dc32a8617 bpf: btf: limit logging of ignored BTF mismatches
    4687b40201db Revert "Revert "tick/common: Align tick period with the HZ tick.""
    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."
    dded404c66bb yaffs2: Fix miscalculation of devname buffer length
    30350f237490 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    0ac32a83ca02 OF: DT-Overlay configfs interface (v8)
    0b07d2478b6b fat: Replace prandom_u32() with get_random_u32()
    927b66bfd641 aufs6: core
    2af5eb310b11 aufs6: standalone
    e6537c94f033 aufs6: mmap
    c51d7f19876f aufs6: base
    1785f762bbbb aufs6: kbuild
    8f625cf94585 qemux86: add configuration symbol to select values
    d81fac6e842a sched/isolation: really align nohz_full with rcu_nocbs
    07c526200cb3 clear_warn_once: add a clear_warn_once= boot parameter
    61e2c52ce198 clear_warn_once: bind a timer to written reset value
    de03f5a3e6c6 clear_warn_once: expand debugfs to include read support
    d3f9a25028d4 tools: Remove some options from CLANG_CROSS_FLAGS
    0fb98cd2429a libbpf: Fix build warning on ref_ctr_off
    e156ff56a19f perf python: Account for multiple words in CC
    f06b9c6ae59d perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    1b099e82095d perf: x86-32: explicitly include <errno.h>
    5fec311e2fd2 perf: mips64: Convert __u64 to unsigned long long
    6cf30287aeaa perf: fix bench numa compilation
    bd8f67dcb8e4 perf: add SLANG_INC for slang.h
    0314b09bf6b9 perf: add sgidefs.h to for mips builds
    4a39cc37b957 perf: change --root to --prefix for python install
    3db4f4e91769 perf: add 'libperl not found' warning
    fa3d24bac29a perf: force include of <stdbool.h>
    deaadc523f8d fat: don't use obsolete random32 call in namei_vfat
    d3c72f5df9a3 FAT: Added FAT_NO_83NAME
    8f1eebeb519c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    78b0423ccc14 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    e998ad53fb68 yaffs2: replace bdevname call with sprintf
    1175db6bf4cb yaffs2: convert read_page -> readfolio
    beb275c683de yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    e807c9e420bd yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    2fdd54282de3 yaffs2: v5.12+ build fixups (not runtime tested)
    869f41030ed8 yaffs: include blkdev.h
    e955b68f2b1f yaffs: fix misplaced variable declaration
    f089603aba1d yaffs2: v5.6 build fixups
    82da54859f0b yaffs2: fix memory leak when /proc/yaffs is read
    2c4cf6808649 yaffs: add strict check when call yaffs_internal_read_super
    e7dadb47ef11 yaffs: repair yaffs_get_mtd_device
    f2e29be130f7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    8ea43ac7f3a3 yaffs2: fix memory leak in mount/umount
    56db60d0abd2 yaffs: Avoid setting any ACL releated xattr
    023baea095bc Yaffs:check oob size before auto selecting Yaffs1
    409d39918661 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    4bf42c774804 yaffs2: adjust to proper location of MS_RDONLY
    08696e21a84c yaffs2: import git revision b4ce1bb (jan, 2020)
    ca3d9f546a60 initramfs: allow an optional wrapper script around initramfs generation
    301742baace5 pnmtologo: use relocatable file name
    aba96ccce7d9 tools: use basename to identify file in gen-mach-types
    e195c32ca7c7 lib/build_OID_registry: fix reproducibility issues
    876e2f1f7726 vt/conmakehash: improve reproducibility
    28b7a366cfef iwlwifi: select MAC80211_LEDS conditionally
    69933d85f61e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5a308d8f142a arm64/perf: Fix wrong cast that may cause wrong truncation
    339523a797e9 defconfigs: drop obselete options
    3d751aeb9bcd arm64/perf: fix backtrace for AAPCS with FP enabled
    86fa47f362ae linux-yocto: Handle /bin/awk issues
    86f04668ef6e uvesafb: provide option to specify timeout for task completion
    0db5521a1b3c uvesafb: print error message when task timeout occurs
    710303c12e99 compiler.h: Undef before redefining __attribute_const__
    14a0ede85080 vmware: include jiffies.h
    e232e6ffe081 Resolve jiffies wrapping about arp
    c16abf2d705f nfs: Allow default io size to be configured.
    9e9e885f4a6c check console device file on fs when booting
    0ce0ce443d58 mount_root: clarify error messages for when no rootfs found
    32449db67de8 menuconfig,mconf-cfg: Allow specification of ncurses location
    c55f1054bdce modpost: mask trivial warnings
    30a45d4ee261 kbuild: exclude meta directory from distclean processing
    0890b10d8fb1 powerpc: serialize image targets
    6c0feb81c3ae arm: serialize build targets
    77fa1b70cdbd crtsavres: fixups for 5.4+
    cd107e4edd5f crtsavres: fixups for 5.4+
    8f763b35ae5b powerpc/ptrace: Disable array-bounds warning with gcc8
    fe6f93755196 powerpc: Disable attribute-alias warnings from gcc8
    9b7097364b87 powerpc: add crtsavres.o to archprepare for kbuild
    c106cd86a07b powerpc: kexec fix for powerpc64
    33b7738c61fc powerpc: Add unwind information for SPE registers of E500 core
    c04e26a9beda mips: vdso: fix 'jalr $t9' crash in vdso code
    4733368eab80 mips: Kconfig: add QEMUMIPS64 option
    ec2df6ae5ee5 4kc cache tlb hazard: tlbp cache coherency
    c8c511fae0f0 malta uhci quirks: make allowance for slow 4k(e)c
    b2bf1b6e971a arm64: defconfig: cleanup config options
    a40a34b02336 vexpress: Pass LOADADDR to Makefile
    7c51524611bb arm: ARM EABI socketcall
    1f6e77027c24 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 6ad7302ad3..d0173e3ee7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f01320520068df70be5d8c916f1d792f69643fe6"
-SRCREV_meta ?= "85ba1038b50deb50445772117e82e3e6f60c3142"
+SRCREV_machine ?= "4df82ffbb2b0f0b0efb545d1f67e61c987d051c1"
+SRCREV_meta ?= "8b555bd39017d9e6b19a0e2c98e563c5ebccef14"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.83"
+LINUX_VERSION ?= "6.1.84"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index d59de65d49..1d438cb43c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.83"
+LINUX_VERSION ?= "6.1.84"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_meta ?= "85ba1038b50deb50445772117e82e3e6f60c3142"
+SRCREV_machine ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_meta ?= "8b555bd39017d9e6b19a0e2c98e563c5ebccef14"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 7f6040ddec..c4e8750e6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5431332379ab328763f6d3945a17420591ca58e8"
-SRCREV_machine:qemuarm64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_machine:qemuloongarch64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_machine:qemumips ?= "0d625849a0114e2389eda2b02c6b79b6b253258e"
-SRCREV_machine:qemuppc ?= "44eb5814d0930deabfa9d4167c1944f3c5e54b79"
-SRCREV_machine:qemuriscv64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_machine:qemuriscv32 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_machine:qemux86 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_machine:qemux86-64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_machine:qemumips64 ?= "848e49dade7ab6c477475dcdc83a1cc2d3da9822"
-SRCREV_machine ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
-SRCREV_meta ?= "85ba1038b50deb50445772117e82e3e6f60c3142"
+SRCREV_machine:qemuarm ?= "6c89adaf651c4599869544f1ccc532641e5e6e9c"
+SRCREV_machine:qemuarm64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_machine:qemuloongarch64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_machine:qemumips ?= "cef1886035a8438205634d51fdfc3c1481b668e8"
+SRCREV_machine:qemuppc ?= "42585bdd38e874d2c4b08364a160e5dad5cd683e"
+SRCREV_machine:qemuriscv64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_machine:qemuriscv32 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_machine:qemux86 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_machine:qemux86-64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_machine:qemumips64 ?= "a6c079ca05576d39ff871aad90050021aecaf3c7"
+SRCREV_machine ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
+SRCREV_meta ?= "8b555bd39017d9e6b19a0e2c98e563c5ebccef14"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e5cd595e23c1a075359a337c0e5c3a4f2dc28dd1"
+SRCREV_machine:class-devupstream ?= "347385861c50adc8d4801d4b899eded38a2f04cd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.83"
+LINUX_VERSION ?= "6.1.84"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


