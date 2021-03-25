Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.3175.1616704377875359698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 13:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NAWkvaUz;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q3so3136712qkq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rw5aGx44mdmlDumCDHuTItFCLbZu3aJhJe/ifptoorI=;
        b=NAWkvaUz1cVn0mTt8nyggSJ2RaSUAEhRi2EyvKHZABis/zKRRIbbODlb9zu/Kim92w
         HDSuQEDJAFOJMeaz40H3AVlXIXaZ3S7Ts8trvC2Yi2ndd+VEMgVxpKj+faqZAnH3DFTQ
         s0SN8L7Cx0v1zyzxZ+imWpTXO9NyHcvGvJBfpQ7D2/qyCGukAy++gIQHNczxKSfTtx5H
         TpkLTOA/biLGItK+naGAJcgQJ5nPMtENh9BD7z2JTlSSAfbeegDsK+eCXt6jaTijBAkh
         UN8v0YBz5h2PiyiaeRC93xELwy2DugcoME1HnWrc9R62jIGIQeLTefZkNnlmfVsJjJsN
         hkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rw5aGx44mdmlDumCDHuTItFCLbZu3aJhJe/ifptoorI=;
        b=HvnWvkoJRuoPXwdclwlY/fXtfLTsX3d3uTBjqeO9gEus11j+omaW58LZWF79Ty4V8N
         PS1nMaHenLd8JPFoyIvlunfm1nJElcQWqkxCW/kBDT8hRAmtdVFkT4NFNBu1IguVzAZe
         Jt7lx+M88ZrPKToiG2PMd83bf6800yw+mXejmSz0G+Tc5q56L7a/uguC1liD63AEc7sa
         0EDQfeuNo5aE/q85MSMIEnZRwZ42S1JoXu/ARc658e0nIsY6Rp7YmNJwMSWDBtT2OE10
         8lIEAV0lvW/QPEpi1c1kVKkm+R7unyogeWnTJIAMZ9wssRmLbLbcyhoYMSmyGW+5jCWx
         Hq0A==
X-Gm-Message-State: AOAM533AmWcvAzQFEiIt33IpOgh7ThVr5vJmzxvrAQ2QILn3CSltrleo
	KSH46etpWNo2Sqt3dimWPi0=
X-Google-Smtp-Source: ABdhPJw7YsnzUEU7IXbdsgrTXFY+wglAkoT2hsICMnMkXFc8GiwG0bm5DGm8pWg08F81NF0BwIUUcA==
X-Received: by 2002:ae9:e502:: with SMTP id w2mr10150502qkf.75.1616704376804;
        Thu, 25 Mar 2021 13:32:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id z124sm5221090qke.36.2021.03.25.13.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 13:32:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/5.10: update to v5.10.25
Date: Thu, 25 Mar 2021 16:32:51 -0400
Message-Id: <fea719d9d036c23bab456becf2f3f54fc4e778f5.1616704280.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616704280.git.bruce.ashfield@gmail.com>
References: <cover.1616704280.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    3ba56f490c7a Linux 5.10.25
    dd0b7edb7794 net: dsa: b53: Support setting learning on port
    0f6cab2350d5 ALSA: usb-audio: Don't avoid stopping the stream at disconnection
    df8596f57743 Revert "nfsd4: a client's own opens needn't prevent delegations"
    894ecf0cb505 Revert "nfsd4: remove check_conflicting_opens warning"
    d955f13ea212 fuse: fix live lock in fuse_iget()
    2d7888b2c4cd RDMA/srp: Fix support for unpopulated and unbalanced NUMA nodes
    3672c3ce622e bpf, selftests: Fix up some test_verifier cases for unprivileged
    1010f17aaa78 bpf: Add sanity check for upper ptr_limit
    6a3504bf4006 bpf: Simplify alu_limit masking for pointer arithmetic
    ac1b87a18c1f bpf: Fix off-by-one for area size in creating mask to left
    c4d37eea1c64 bpf: Prohibit alu ops for pointer types not defining ptr_limit
    bf93113d46f8 crypto: x86/aes-ni-xts - use direct calls to and 4-way stride
    fcfab1a9aa40 crypto: aesni - Use TEST %reg,%reg instead of CMP $0,%reg
    05d125f7524e Linux 5.10.24
    1c0899636d44 RDMA/umem: Use ib_dma_max_seg_size instead of dma_get_max_seg_size
    1dbce9ba2aa9 KVM: arm64: Fix nVHE hyp panic host context restore
    f67e5243d0f3 xen/events: avoid handling the same event on two cpus at the same time
    30cdb862e831 xen/events: don't unmask an event channel when an eoi is pending
    4c84191cbc3e mm/page_alloc.c: refactor initialization of struct page for holes in memory layout
    e7afadd0dbe2 KVM: arm64: Ensure I-cache isolation between vcpus of a same VM
    518f98e39077 mm/madvise: replace ptrace attach requirement for process_madvise
    2aaa79f69417 mm/userfaultfd: fix memory corruption due to writeprotect
    c3d70b1bf1ce KVM: arm64: Fix exclusive limit for IPA size
    ada8817ab674 KVM: arm64: Reject VM creation when the default IPA size is unsupported
    eeba4e4cc524 KVM: arm64: nvhe: Save the SPE context early
    a9779820bb97 KVM: arm64: Avoid corrupting vCPU context register in guest exit
    17becbfca9fc KVM: arm64: Fix range alignment when walking page tables
    a688bf8cf550 KVM: kvmclock: Fix vCPUs > 64 can't be online/hotpluged
    4ab5d1b70929 KVM: x86: Ensure deadline timer has truly expired before posting its IRQ
    e40384fcd600 x86/entry: Fix entry/exit mismatch on failed fast 32-bit syscalls
    a2bab396cb97 x86/sev-es: Use __copy_from_user_inatomic()
    977b9f4190ad x86/sev-es: Correctly track IRQ states in runtime #VC handler
    269424432731 x86/entry: Move nmi entry/exit into common code
    752fbe0c8ddd x86/sev-es: Check regs->sp is trusted before adjusting #VC IST stack
    871fd1e3ee8e x86/sev-es: Introduce ip_within_syscall_gap() helper
    d327d8632cdb x86/unwind/orc: Disable KASAN checking in the ORC unwinder, part 2
    5ab9464a2a3c binfmt_misc: fix possible deadlock in bm_register_write
    0e4750f69c17 powerpc: Fix missing declaration of [en/dis]able_kernel_vsx()
    1f372e89567b powerpc: Fix inverted SET_FULL_REGS bitop
    9776812ee861 powerpc/64s: Fix instruction encoding for lis in ppc_function_entry()
    8571c66401ea efi: stub: omit SetVirtualAddressMap() if marked unsupported in RT_PROP table
    68b4378d910e sched/membarrier: fix missing local execution of ipi_sync_rq_state()
    5f2f616343b1 linux/compiler-clang.h: define HAVE_BUILTIN_BSWAP*
    bc7c1b09f7a4 zram: fix return value on writeback_store
    3cbe8f9193e6 include/linux/sched/mm.h: use rcu_dereference in in_vfork()
    7da7542c04a4 stop_machine: mark helpers __always_inline
    2a39eb7b8670 seqlock,lockdep: Fix seqcount_latch_init()
    372734dc1897 powerpc/64s/exception: Clean up a missed SRR specifier
    df7dbfc24c33 hrtimer: Update softirq_expires_next correctly after __hrtimer_get_next_event()
    896846b8151d perf/x86/intel: Set PERF_ATTACH_SCHED_CB for large PEBS and LBR
    82ad50c112f8 perf/core: Flush PMU internal buffers for per-CPU events
    3ebd4bd2eb6f arm64: mm: use a 48-bit ID map when possible on 52-bit VA builds
    109720342efd configfs: fix a use-after-free in __configfs_open_file
    6cf11f3a09a2 nvme-fc: fix racing controller reset and create association
    d1d918492e6e block: rsxx: fix error return code of rsxx_pci_probe()
    caa86901c863 NFSv4.2: fix return value of _nfs4_get_security_label()
    e181960ec51d NFS: Don't gratuitously clear the inode cache when lookup failed
    dd756d05bee5 NFS: Don't revalidate the directory permissions on a lookup failure
    faa48b23d0e3 SUNRPC: Set memalloc_nofs_save() for sync tasks
    475a4307c14c arm64/mm: Fix pfn_valid() for ZONE_DEVICE based memory
    e50ada589497 cpufreq: qcom-hw: Fix return value check in qcom_cpufreq_hw_cpu_init()
    7dfe37e9ea69 cpufreq: qcom-hw: fix dereferencing freed memory 'data'
    75d9be57cf2e sh_eth: fix TRSCER mask for R7S72100
    a854bd051465 staging: comedi: pcl818: Fix endian problem for AI command data
    ddfeb236ed8e staging: comedi: pcl711: Fix endian problem for AI command data
    c30fe0f767c3 staging: comedi: me4000: Fix endian problem for AI command data
    2c1ea26a289e staging: comedi: dmm32at: Fix endian problem for AI command data
    c36d2f40c1bc staging: comedi: das800: Fix endian problem for AI command data
    d8f26a4122db staging: comedi: das6402: Fix endian problem for AI command data
    b46f6908ea3e staging: comedi: adv_pci1710: Fix endian problem for AI command data
    66a44ed42367 staging: comedi: addi_apci_1500: Fix endian problem for command sample
    4d14685f9f74 staging: comedi: addi_apci_1032: Fix endian problem for COS sample
    c5d3e25e1808 staging: rtl8192e: Fix possible buffer overflow in _rtl92e_wx_set_scan
    74a14d8ae20d staging: rtl8712: Fix possible buffer overflow in r8712_sitesurvey_cmd
    66cf4f582987 staging: ks7010: prevent buffer overflow in ks_wlan_set_scan()
    be9745304e3e staging: rtl8188eu: fix potential memory corruption in rtw_check_beacon_data()
    550c9e49eb42 staging: rtl8712: unterminated string leads to read overflow
    d972a516958d staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()
    1642b5153ba5 staging: rtl8192u: fix ->ssid overflow in r8192_wx_set_scan()
    52feb58f9b5b misc: fastrpc: restrict user apps from sending kernel RPC messages
    7ae2482c7042 misc/pvpanic: Export module FDT device table
    70c26fc71b7e Revert "serial: max310x: rework RX interrupt handling"
    9951e64550d0 usbip: fix vudc usbip_sockfd_store races leading to gpf
    116a71087875 usbip: fix vhci_hcd attach_store() races leading to gpf
    ab5c3186686a usbip: fix stub_dev usbip_sockfd_store() races leading to gpf
    e033d7f79995 usbip: fix vudc to check for stream socket
    2aa21585adbd usbip: fix vhci_hcd to check for stream socket
    6d7452392151 usbip: fix stub_dev to check for stream socket
    b249b8f9b740 USB: serial: cp210x: add some more GE USB IDs
    0aa33c041e84 USB: serial: cp210x: add ID for Acuity Brands nLight Air Adapter
    3aa50426c72c USB: serial: ch341: add new Product ID
    a347908c5192 USB: serial: io_edgeport: fix memory leak in edge_startup
    fc411ca43bed xhci: Fix repeated xhci wake after suspend due to uncleared internal wake state
    209b3ff98deb usb: xhci: Fix ASMedia ASM1042A and ASM3242 DMA addressing
    e7800913ac97 xhci: Improve detection of device initiated wake signal.
    203060896dbe usb: xhci: do not perform Soft Retry for some xHCI hosts
    7c87f4ea3f16 usb: renesas_usbhs: Clear PIPECFG for re-enabling pipe with other EPNUM
    48c7fc4f14b6 USB: usblp: fix a hang in poll() if disconnected
    adb9639d1e50 usb: dwc3: qcom: Honor wakeup enabled/disabled state
    13c9e76cdda6 usb: dwc3: qcom: add ACPI device id for sc8180x
    39bcc4b7f398 usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot
    10551fbc5517 usb: dwc3: qcom: Add missing DWC3 OF node refcount decrement
    32ad0eb74eac usb: gadget: f_uac1: stop playback on function disable
    30a187afdbd2 usb: gadget: f_uac2: always increase endpoint max_packet_size by one audio slot
    50233f8220f0 USB: gadget: u_ether: Fix a configfs return code
    80091541a46b USB: gadget: udc: s3c2410_udc: fix return value check in s3c2410_udc_probe()
    b0db0c76a2ba Goodix Fingerprint device is not a modem
    d308202c1b96 cifs: do not send close in compound create+close requests
    310a1ffe7b36 mmc: cqhci: Fix random crash when remove mmc module/card
    a61596a9b2a7 mmc: core: Fix partition switch time for eMMC
    6c971bd99cb8 mmc: mmci: Add MMC_CAP_NEED_RSP_BUSY for the stm32 variants
    bb815894ba37 xen/events: reset affinity of 2-level event when tearing it down
    e86abde80d12 software node: Fix node registration
    08bccd721243 s390/dasd: fix hanging IO request during DASD driver unbind
    5d766455510c s390/dasd: fix hanging DASD driver unbind
    fb242be88da9 arm64: perf: Fix 64-bit event counter read truncation
    ffb9a77d0a7f arm64: mte: Map hotplugged memory as Normal Tagged
    d73665b4a9f6 arm64: kasan: fix page_alloc tagging with DEBUG_VIRTUAL
    d44c9780ed40 block: Try to handle busy underlying device on discard
    a53477849286 block: Discard page cache of zone reset target range
    5d5422a294e6 Revert 95ebabde382c ("capabilities: Don't allow writing ambiguous v3 file capabilities")
    29bc89c8b48d ALSA: usb-audio: fix use after free in usb_audio_disconnect
    d2fdcc82d866 ALSA: usb-audio: fix NULL ptr dereference in usb_audio_probe
    e4493974dbce ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()
    144ebd02a118 ALSA: usb-audio: Apply the control quirk to Plantronics headsets
    723bf21ceab0 ALSA: usb-audio: Fix "cannot get freq eq" errors on Dell AE515 sound bar
    4b536c1ec8b3 ALSA: hda: Avoid spurious unsol event handling during S3/S4
    f1d28b1310bb ALSA: hda: Flush pending unsolicited events before suspend
    ebbb9bbe35ae ALSA: hda: Drop the BATCH workaround for AMD controllers
    f5278fcfb760 ALSA: hda/ca0132: Add Sound BlasterX AE-5 Plus support
    064ac8ed90a3 ALSA: hda/conexant: Add quirk for mute LED control on HP ZBook G5
    4dc34571e973 ALSA: hda/hdmi: Cancel pending works before suspend
    d77540ada71b ALSA: usb: Add Plantronics C320-M USB ctrl msg delay quirk
    d291b2594f85 ARM: efistub: replace adrl pseudo-op with adr_l macro invocation
    fd863653ad63 ARM: assembler: introduce adr_l, ldr_l and str_l macros
    917220f362a0 ARM: 9029/1: Make iwmmxt.S support Clang's integrated assembler
    69f845526833 mmc: sdhci: Update firmware interface API
    73d1a11a198a clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
    1b0b0c0b9ae9 scsi: target: core: Prevent underflow for service actions
    17c2c52051c4 scsi: target: core: Add cmd length set before cmd complete
    79b4fdd8b4cf scsi: libiscsi: Fix iscsi_prep_scsi_cmd_pdu() error handling
    f49bdac3e7f4 sysctl.c: fix underflow value setting risk in vm_table
    8876cc237e04 drivers/base/memory: don't store phys_device in memory blocks
    e4b98e2260fd s390/smp: __smp_rescan_cpus() - move cpumask away from stack
    219fc4b30058 kasan: fix memory corruption in kasan_bitops_tags test
    6c73bc9f28e2 i40e: Fix memory leak in i40e_probe
    6d4fabc6c7ec PCI: Fix pci_register_io_range() memory leak
    950bff22a98a kbuild: clamp SUBLEVEL to 255
    64578f9417e1 ext4: don't try to processed freed blocks until mballoc is initialized
    d49f86e88859 PCI/LINK: Remove bandwidth notification
    732bb21397ee drivers/base: build kunit tests without structleak plugin
    fa6dae9d7ffd PCI: mediatek: Add missing of_node_put() to fix reference leak
    d26949c732e4 PCI: xgene-msi: Fix race in installing chained irq handler
    8282ec632443 Input: applespi - don't wait for responses to commands indefinitely.
    f27af42b1f10 sparc64: Use arch_validate_flags() to validate ADI flag
    99ed6ae4d000 sparc32: Limit memblock allocation to low memory
    661cba45dc67 clk: qcom: gdsc: Implement NO_RET_PERIPH flag
    a19d18a1171b iommu/amd: Fix performance counter initialization
    adc631d87ea9 powerpc/64: Fix stack trace not displaying final frame
    9fbbc5d3f7e0 HID: logitech-dj: add support for the new lightspeed connection iteration
    eb5a9ee32c76 powerpc/perf: Record counter overflow always if SAMPLE_IP is unset
    87e443255dce powerpc: improve handling of unrecoverable system reset
    2314d5061709 spi: stm32: make spurious and overrun interrupts visible
    912237ec3485 powerpc/pci: Add ppc_md.discover_phbs()
    711112e99a65 Platform: OLPC: Fix probe error handling
    09ef146f640d mmc: sdhci-iproc: Add ACPI bindings for the RPi
    35f662ba915e mmc: mediatek: fix race condition between msdc_request_timeout and irq
    7cb2c431583e mmc: mxs-mmc: Fix a resource leak in an error handling path in 'mxs_mmc_probe()'
    1e5ac057b05c iommu/vt-d: Clear PRQ overflow only when PRQ is empty
    82d6c12899e2 udf: fix silent AED tagLocation corruption
    cd69732c2579 scsi: ufs: WB is only available on LUN #0 to #7
    2b6105746b83 i2c: rcar: optimize cacheline to minimize HW race condition
    222a825f6bdb i2c: rcar: faster irq code to minimize HW race condition
    4d65eb3df0ad ath11k: fix AP mode for QCA6390
    700e2b63cbc8 ath11k: start vdev if a bss peer is already created
    dbec869d234e ath11k: peer delete synchronization with firmware
    781e956a8277 net: enetc: initialize RFS/RSS memories for unused ports too
    a3df6b7a8a41 enetc: Fix unused var build warning for CONFIG_OF
    606cfdeebd3d net: dsa: tag_mtk: fix 802.1ad VLAN egress
    409af8946619 net: dsa: tag_ar9331: let DSA core deal with TX reallocation
    a2fd181b4b7a net: dsa: tag_gswip: let DSA core deal with TX reallocation
    9bb1bec952ad net: dsa: tag_dsa: let DSA core deal with TX reallocation
    9ad635b75e42 net: dsa: tag_brcm: let DSA core deal with TX reallocation
    67fd35c21a60 net: dsa: tag_edsa: let DSA core deal with TX reallocation
    6702dd45534a net: dsa: tag_lan9303: let DSA core deal with TX reallocation
    27f014eb6627 net: dsa: tag_mtk: let DSA core deal with TX reallocation
    54787024c8fb net: dsa: tag_ocelot: let DSA core deal with TX reallocation
    cf5c6682e274 net: dsa: tag_qca: let DSA core deal with TX reallocation
    8f17133cc3ae net: dsa: trailer: don't allocate additional memory for padding/tagging
    a4d2836de5c6 net: dsa: tag_ksz: don't allocate additional memory for padding/tagging
    162c423e6071 net: dsa: implement a central TX reallocation procedure
    f91a299fb160 s390/qeth: fix notification for pending buffers during teardown
    f7a7d3ede5f5 s390/qeth: improve completion of pending TX buffers
    144dbdf86c7a s390/qeth: remove QETH_QDIO_BUF_HANDLED_DELAYED state
    926200fd224c s390/qeth: don't replace a fully completed async TX buffer
    13e312dca2f2 net: hns3: fix error mask definition of flow director
    3370a84d781c cifs: fix credit accounting for extra channel
    83ff4f644de4 media: rc: compile rc-cec.c into rc-core
    db2ae26d7855 media: v4l: vsp1: Fix bru null pointer access
    465fd4191aaa media: v4l: vsp1: Fix uif null pointer access
    17c6d693a33a media: rkisp1: params: fix wrong bits settings
    c29dcb253a6a media: usbtv: Fix deadlock on suspend
    a5190a7865b6 sh_eth: fix TRSCER mask for R7S9210
    c6ecc613ef16 qxl: Fix uninitialised struct field head.surface_id
    1afe77386a6d s390/crypto: return -EFAULT if copy_to_user() fails
    dac4e0e10b9b s390/cio: return -EFAULT if copy_to_user() fails
    d7b8aef5b6d1 drm/i915: Wedge the GPU if command parser setup fails
    335d21ad8a9a drm/shmem-helpers: vunmap: Don't put pages for dma-buf
    d4ec1ffbdaa8 drm: meson_drv add shutdown function
    915f2f8cadbd drm: Use USB controller's DMA mask when importing dmabufs
    5e9b01152527 drm/shmem-helper: Don't remove the offset in vm_area_struct pgoff
    368b53e797c9 drm/shmem-helper: Check for purged buffers in fault handler
    ad106ddd3366 drm/amdgpu/display: handle aux backlight in backlight_get_brightness
    fd87d778642b drm/amdgpu/display: don't assert in set backlight function
    4b55b9fd9bfc drm/amdgpu/display: simplify backlight setting
    96b097e84101 drm/amd/pm: bug fix for pcie dpm
    6b9900263a31 drm/amd/display: Fix nested FPU context in dcn21_validate_bandwidth()
    b40528bcc10b drm/amdgpu/display: use GFP_ATOMIC in dcn21_validate_bandwidth_fp()
    55086176c75a drm/amd/display: Add a backlight module option
    e30ce84181cf drm/compat: Clear bounce structures
    ccc942eaf570 gpio: fix gpio-device list corruption
    2e3c8a28f465 gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2
    f60ffab25855 gpiolib: acpi: Allow to find GpioInt() resource by name and index
    8df70a5b4d0c gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk
    845ec460537d bnxt_en: reliably allocate IRQ table on reset to avoid crash
    686874ca92c2 s390/cio: return -EFAULT if copy_to_user() fails again
    fd61e772f036 net: hns3: fix bug when calculating the TCAM table info
    3c7f1304ee71 net: hns3: fix query vlan mask value error for flow director
    f9a87999bdd9 perf report: Fix -F for branch & mem modes
    57a798e4a197 perf traceevent: Ensure read cmdlines are null terminated.
    e4f7ffaa7cdf mlxsw: spectrum_ethtool: Add an external speed to PTYS register
    824c94cbf4d6 selftests: forwarding: Fix race condition in mirror installation
    c1e1a64a2313 net: phy: make mdio_bus_phy_suspend/resume as __maybe_unused
    ad59796872ae ethtool: fix the check logic of at least one channel for RX/TX
    482f99d0ad39 net: stmmac: fix wrongly set buffer2 valid when sph unsupport
    333dbdee0651 net: stmmac: fix watchdog timeout during suspend/resume stress test
    3c1b58261ff8 net: stmmac: stop each tx channel independently
    640492cf1732 perf build: Fix ccache usage in $(CC) when generating arch errno table
    8493877b58b6 tools/resolve_btfids: Fix build error with older host toolchains
    ee7eac24b5b4 ixgbe: fail to create xfrm offload of IPsec tunnel mode SA
    cab735320fe9 r8169: fix r8168fp_adjust_ocp_cmd function
    84ef8a8cb789 s390/qeth: fix memory leak after failed TX Buffer allocation
    345d90cd741a net: qrtr: fix error return code of qrtr_sendmsg()
    4f8e71a770dd net: enetc: allow hardware timestamping on TX queues with tc-etf enabled
    4fd0654b8f21 net: davicom: Fix regulator not turned off on driver removal
    e334c401f3fc net: davicom: Fix regulator not turned off on failed probe
    6342ccdfdf2b net: lapbether: Remove netif_start_queue / netif_stop_queue
    9c4136081cc2 stmmac: intel: Fixes clock registration error seen for multiple interfaces
    d78f23ef3040 net: stmmac: Fix VLAN filter delete timeout issue in Intel mGBE SGMII
    85178d76febd cipso,calipso: resolve a number of problems with the DOI refcounts
    e03ed1190d56 netdevsim: init u64 stats for 32bit hardware
    6ed0a2cafd1f net: usb: qmi_wwan: allow qmimux add/del with master up
    565b2d3ae202 net: dsa: sja1105: fix SGMII PCS being forced to SPEED_UNKNOWN instead of SPEED_10
    719611e806de net: mscc: ocelot: properly reject destination IP keys in VCAP IS1
    2809a5ca962e net: sched: avoid duplicates in classes dump
    9c61f1e1c40e nexthop: Do not flush blackhole nexthops when loopback goes down
    87b7b19d6e1d net: stmmac: fix incorrect DMA channel intr enable setting of EQoS v4.10
    6b0d3ae1051b net/mlx4_en: update moderation when config reset
    fa0bc09db49b net: ethernet: mtk-star-emac: fix wrong unmap in RX handling
    1cdd008902d4 net: enetc: keep RX ring consumer index in sync with hardware
    531736540111 net: enetc: remove bogus write to SIRXIDR from enetc_setup_rxbdr
    63876df5615e net: enetc: force the RGMII speed and duplex instead of operating in inband mode
    5732688c8411 net: enetc: don't disable VLAN filtering in IFF_PROMISC mode
    d56e3f8d289b net: enetc: fix incorrect TPID when receiving 802.1ad tagged packets
    bf9c564716a1 net: enetc: take the MDIO lock only once per NAPI poll cycle
    dfaf418dfff8 net: enetc: don't overwrite the RSS indirection table when initializing
    4ea379733555 sh_eth: fix TRSCER mask for SH771x
    68277f69a873 net: dsa: tag_rtl4_a: fix egress tags
    389055e7b970 docs: networking: drop special stable handling
    e1759160877a Revert "mm, slub: consider rest of partial list if acquire_slab() fails"
    3d0bbd97eb6f cifs: return proper error code in statfs(2)
    36e1efcdc542 mount: fix mounting of detached mounts onto targets that reside on shared mounts
    aa1258d91455 powerpc/603: Fix protection of user pages mapped with PROT_NONE
    e36d276dd4be mt76: dma: do not report truncated frames to mac80211
    1e343b2e7b96 ibmvnic: always store valid MAC address
    57ac75f8d241 ibmvnic: Fix possibly uninitialized old_num_tx_queues variable warning.
    2f6f72ee9a98 libbpf: Clear map_info before each bpf_obj_get_info_by_fd
    f126147970a1 samples, bpf: Add missing munmap in xdpsock
    4d2cdb2ded60 selftests/bpf: Mask bpf_csum_diff() return value to 16 bits in test_verifier
    4fa0ece2e0eb selftests/bpf: No need to drop the packet when there is no geneve opt
    7653656be252 selftests/bpf: Use the last page in test_snprintf_btf on s390
    6aa23829949c net: phy: fix save wrong speed and duplex problem if autoneg is on
    91796b65563b net: always use icmp{,v6}_ndo_send from ndo_start_xmit
    8abbf7e53e17 netfilter: x_tables: gpf inside xt_find_revision()
    42402bd84530 netfilter: nf_nat: undo erroneous tcp edemux lookup
    046f3c1c2ff4 tcp: add sanity tests to TCP_QUEUE_SEQ
    e95ebe1ed6ab tcp: Fix sign comparison bug in getsockopt(TCP_ZEROCOPY_RECEIVE)
    473bce9b9393 can: tcan4x5x: tcan4x5x_init(): fix initialization - clear MRAM before entering Normal Mode
    c537011c99ab can: flexcan: invoke flexcan_chip_freeze() to enter freeze mode
    e24c53182850 can: flexcan: enable RX FIFO after FRZ/HALT valid
    98b7f969116d can: flexcan: assert FRZ bit in flexcan_chip_freeze()
    4224890edff1 can: skb: can_skb_set_owner(): fix ref counting if socket was closed before setting skb ownership
    fa5d019c56e7 net: l2tp: reduce log level of messages in receive path, add counter instead
    453fff24f52e net: avoid infinite loop in mpls_gso_segment when mpls_hlen == 0
    faa3baa2828c net: check if protocol extracted by virtio_net_hdr_set_proto is correct
    09af4362ba47 net: Fix gro aggregation for udp encaps with zero csum
    d2fb1911a7a8 ath9k: fix transmitting to stations in dynamic SMPS mode
    b0454a28f608 crypto: mips/poly1305 - enable for all MIPS processors
    a0df424a863a ethernet: alx: fix order of calls on resume
    a9c55f22a0b9 powerpc/pseries: Don't enforce MSI affinity with kdump
    ac022fbee685 powerpc/perf: Fix handling of privilege level checks in perf interrupt context
    7732f57f0f52 uapi: nfnetlink_cthelper.h: fix userspace compilation error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 094fc41705..840cef88e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "09e60e61f3a0716c1d715024db69ed493b374352"
-SRCREV_meta ?= "c0cfc016a512f4b2922e15e43e3d4b421cdceb97"
+SRCREV_machine ?= "5ae660cafcd609de82c450999487d4e6169f9f1f"
+SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.23"
+LINUX_VERSION ?= "5.10.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c55d02ab65..83e59b0ebb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.23"
+LINUX_VERSION ?= "5.10.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "828298476280f149282db7209dd18c8bd0f46657"
-SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_meta ?= "c0cfc016a512f4b2922e15e43e3d4b421cdceb97"
+SRCREV_machine_qemuarm ?= "0f87ec9fea7a5695cd063d9d11d89751efa53ddd"
+SRCREV_machine ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2d84018bb5..026e69511a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e3b57b3a99ff881a16bbdff86ba811bf251c10a9"
-SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
-SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
-SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_meta ?= "c0cfc016a512f4b2922e15e43e3d4b421cdceb97"
+SRCREV_machine_qemuarm ?= "d8551cae1ccdbe062a5c6068ce39ea8f4e1c72db"
+SRCREV_machine_qemuarm64 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_machine_qemumips ?= "7f1f1ad2f2d90b1b070c6b0a82f0add9aa492e37"
+SRCREV_machine_qemuppc ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_machine_qemuriscv64 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_machine_qemuriscv32 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_machine_qemux86 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_machine_qemux86-64 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_machine_qemumips64 ?= "fd5ac097b891642eea13659bea536f3ec5910d6d"
+SRCREV_machine ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
+SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.23"
+LINUX_VERSION ?= "5.10.25"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

