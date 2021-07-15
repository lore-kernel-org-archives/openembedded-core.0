Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.229.1626377421067549655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a0zqk0du;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 23so6346872qke.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ijBVSBbAJ0utZW5xViFb1D4Oy45Sv9u5+mQkWeAaOBI=;
        b=a0zqk0duvhin8Nt5W3rGar4F4LHvFnmoNF8qgSQaO6Uu5nlRmYf9iEuP/eZv+Hmd2D
         VRRszu1kT1VHzRFngHa9dKZt6Qom6A8/xn/UUG3ZxykUZcg+fywPhD+Gd+cNeE+0OqvW
         kdK9ytA/3acR0tcvSjQfArShG3Afsoa/o8rsCQzbfQrsW0dXcz/G8C3+OfpG3L/IbagY
         U3e6NZOFYGyejAFuJxTI/da2QvsOPYfvCP8l+QlzEGcw37K8kZLFrmdxnlLawWIsytwz
         3oUFy7GQy7+MZm9GoKawmX8NL9RxN1ZvTL2iTnRL+pNA9X2mUSDdDwdkcNXd5UGbD8Hk
         aIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ijBVSBbAJ0utZW5xViFb1D4Oy45Sv9u5+mQkWeAaOBI=;
        b=k8J85OixOoiGs0xbfW/F0uwq2NTrwMPcIifss9H/Ij4lQs+KqXqU8wLU6sAbGFiJja
         qmCbP5Xwk2Vvl4WEQiPX54UfuZaf7yNn7RAIFH0+R3rEU60RIMZ3pK+0tBoupU/La2NI
         xpn1x2zySfGAiiTWFnbbKErwGWHS73FublFubVhYxKsMr9h5rjgEwUKIBY2i9O2lQf8Y
         Oct3ls6I9RQ1O/0Eq/dVPA17R0aBF4F7z3M8kC8iOsvDBYCLnK9GvZWaMADpsB5hDKgA
         QPbEpUje1E7dOjHpcJeik+CoISqQAsL+zdYKgilTYoIzRsoAOJL49FQ0CMBHzpDG9P7W
         PzOA==
X-Gm-Message-State: AOAM531kY3mRdic/rx9X8NtufCRc1ynaI8s83oAaqlQebMxZDi6S8fL4
	L+BBAa+hOVdBB8SARJgY4Z0=
X-Google-Smtp-Source: ABdhPJxY8Lfo5l+p8x7JWk7fOx7npdPLJOlabS2BTmi9wCw1kT1DSJvqWNUG8r7/bZfT8Ahza/HwJw==
X-Received: by 2002:a37:7c3:: with SMTP id 186mr5616500qkh.109.1626377419673;
        Thu, 15 Jul 2021 12:30:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:19 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/5.13: update to v5.13.2
Date: Thu, 15 Jul 2021 15:30:10 -0400
Message-Id: <54df03bd7767343532e2dea3e69be5f9b7bf1bce.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626377295.git.bruce.ashfield@gmail.com>
References: <cover.1626377295.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    d6fc894baac7 Linux 5.13.2
    20a015e948b8 powerpc/preempt: Don't touch the idle task's preempt_count during hotplug
    51189a3c6e54 iommu/dma: Fix compile warning in 32-bit builds
    572b2a62a94f cred: add missing return error code when set_cred_ucounts() failed
    c3f65e8e26ee sched: Stop PF_NO_SETAFFINITY from being inherited by various init system threads
    f13f01567321 s390: preempt: Fix preempt_count initialization
    fbbd050e05d1 crypto: qce - fix error return code in qce_skcipher_async_req_handle()
    bd619678f674 scsi: core: Retry I/O for Notify (Enable Spinup) Required error
    d7c62923708b media: exynos4-is: remove a now unused integer
    8d3433ec89cc mmc: vub3000: fix control-request direction
    165d6c32f8d0 mmc: block: Disable CMDQ on the ioctl path
    03105a24cd2b io_uring: add IOPOLL and reserved field checks to IORING_OP_UNLINKAT
    4f5be8b54bd4 io_uring: add IOPOLL and reserved field checks to IORING_OP_RENAMEAT
    378a830c2608 io_uring: fix blocking inline submission
    89d2a15d0526 block: return the correct bvec when checking for gaps
    3f7e6cae2064 erofs: fix error return code in erofs_read_superblock()
    9d2da0b8863a tpm: Replace WARN_ONCE() with dev_err_once() in tpm_tis_status()
    5859c67160c3 fscrypt: fix derivation of SipHash keys on big endian CPUs
    119782bf159e fscrypt: don't ignore minor_hash when hash is 0
    2f2d7dc088c3 mailbox: qcom-ipcc: Fix IPCC mbox channel exhaustion
    610de611adae scsi: libfc: Correct the condition check and invalid argument passed
    17902d3eb4dd scsi: lpfc: Fix Node recovery when driver is handling simultaneous PLOGIs
    fc9f2f00424d scsi: lpfc: Fix unreleased RPIs when NPIV ports are created
    1d51f50c5af9 scsi: target: cxgbit: Unmap DMA buffer before calling target_execute_cmd()
    c593bc3cb872 scsi: fc: Correct RHBA attributes length
    63b60a83ce27 scsi: megaraid_sas: Send all non-RW I/Os for TYPE_ENCLOSURE device through firmware
    646efb94462b exfat: handle wrong stream entry size in exfat_readdir()
    43661346eb26 csky: syscache: Fixup duplicate cache flush
    268e8c75ecdf i2c: mpc: Restore reread of I2C status register
    ffa7e0d5920e perf llvm: Return -ENOMEM when asprintf() fails
    5d12814f02d4 selftests/vm/pkeys: refill shadow register after implicit kernel write
    328f60fa16d7 selftests/vm/pkeys: handle negative sys_pkey_alloc() return code
    b8e5d3ad5f5e selftests/vm/pkeys: fix alloc_random_pkey() to make it really, really random
    0ef6f9783957 lib/math/rational.c: fix divide by zero
    928003bd28c3 kfence: unconditionally use unbound work queue
    11ebc09e50dc mm/zswap.c: fix two bugs in zswap_writeback_entry()
    72b032f10071 mm: migrate: fix missing update page_private to hugetlb_page_subpool
    95d192da198d mm/z3fold: use release_z3fold_page_locked() to release locked z3fold page
    ccb7848e2344 mm/z3fold: fix potential memory leak in z3fold_destroy_pool()
    093d3fc8cb23 hugetlb: remove prep_compound_huge_page cleanup
    9f7229c901c1 mm/huge_memory.c: don't discard hugepage if other processes are mapping it
    f13259175e4f mm/huge_memory.c: add missing read-only THP checking in transparent_hugepage_enabled()
    afafd371e7de mm/huge_memory.c: remove dedicated macro HPAGE_CACHE_INDEX_MASK
    ada044539470 vfio/pci: Handle concurrent vma faults
    13a4d6ea398e powerpc/64s/interrupt: preserve regs->softe for NMI interrupts
    9924e27c19ac powerpc/64s: fix hash page fault interrupt handler
    4dcbce306d75 arm64: dts: marvell: armada-37xx: Fix reg for standard variant of UART
    25b601d9d877 serial: mvebu-uart: correctly calculate minimal possible baudrate
    59146c5835a4 serial: mvebu-uart: do not allow changing baudrate when uartclk is not available
    ce2d17c9801b ALSA: firewire-lib: Fix 'amdtp_domain_start()' when no AMDTP_OUT_STREAM stream is found
    1a09a3788772 powerpc: Fix is_kvm_guest() / kvm_para_available()
    0cbe9d9639d1 powerpc/papr_scm: Make 'perf_stats' invisible if perf-stats unavailable
    3ffbbc876404 powerpc/64s: Fix copy-paste data exposure into newly created tasks
    ba824a836d68 powerpc/papr_scm: Properly handle UUID types and API
    410006801ea4 powerpc: Offline CPU in stop_this_cpu()
    ed87ec89b7f6 serial: 8250: 8250_omap: Fix possible interrupt storm on K3 SoCs
    a8f4bf372aae staging: rtl8723bs: Fix an error handling path
    905bb4b7c2c1 selftests/sgx: remove checks for file execute permissions
    16bd2acbad85 selftests/ftrace: fix event-no-pid on 1-core machine
    5b2499ec3fb0 leds: ktd2692: Fix an error handling path
    2f0b82e12dbc leds: as3645a: Fix error return code in as3645a_parse_node()
    3a75092cac53 ASoC: fsl_spdif: Fix unexpected interrupt after suspend
    d759ee26be7c ASoC: Intel: sof_sdw: add SOF_RT715_DAI_ID_FIX for AlderLake
    19a4d95bfadd configfs: fix memleak in configfs_release_bin_file
    2c3bf6723aa5 ASoC: fsl_xcvr: disable all interrupts when suspend happens
    86f6ad630bfa ASoC: atmel-i2s: Fix usage of capture and playback at the same time
    0f2f89c0642a ASoC: atmel-i2s: Set symmetric sample bits
    7ff5db55f657 powerpc/powernv: Fix machine check reporting of async store errors
    c6c8a250117f extcon: max8997: Add missing modalias string
    3076d98e2c7f extcon: sm5502: Drop invalid register write in sm5502_reg_data
    b27d30b9a006 phy: ti: dm816x: Fix the error handling path in 'dm816x_usb_phy_probe()
    a3b870c5f130 phy: uniphier-pcie: Fix updating phy parameters
    96e9297738d6 soundwire: stream: Fix test for DP prepare complete
    f7150fc410e7 scsi: mpt3sas: Fix error return value in _scsih_expander_add()
    6e0b909ad746 habanalabs: Fix an error handling path in 'hl_pci_probe()'
    e0eaeea9a9ff mtd: rawnand: marvell: add missing clk_disable_unprepare() on error in marvell_nfc_resume()
    93968d634142 of: Fix truncation of memory sizes on 32-bit platforms
    fe1870f414cb ASoC: cs42l42: Correct definition of CS42L42_ADC_PDN_MASK
    db91960d40bc iio: prox: isl29501: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    4637815d7922 iio: light: vcnl4035: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    1e8c05290286 serial: 8250: Actually allow UPF_MAGIC_MULTIPLIER baud rates
    63432a8b2af2 usb: phy: tegra: Correct definition of B_SESS_VLD_WAKEUP_EN bit
    13c6cb27fe17 usb: phy: tegra: Wait for VBUS wakeup status deassertion on suspend
    94dd90587784 staging: mt7621-dts: fix pci address for PCI memory range
    ab28a20dda47 coresight: core: Fix use of uninitialized pointer
    5f7ce5c416f4 staging: rtl8712: fix memory leak in rtl871x_load_fw_cb
    7709bce7514d staging: rtl8712: fix error handling in r871xu_drv_init
    cf011614add0 staging: gdm724x: check for overflow in gdm_lte_netif_rx()
    b48eb064f4ef staging: gdm724x: check for buffer overflow in gdm_lte_multi_sdu_pkt()
    bf0c039cd5d8 ASoC: fsl_spdif: Fix error handler with pm_runtime_enable
    a122de486271 iio: light: vcnl4000: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    181d881980c0 iio: magn: rm3100: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    3563bb70d6ba iio: adc: ti-ads8688: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    129cef3b2a6c iio: adc: mxs-lradc: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    4a67fd76a418 iio: adc: hx711: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    60882b0995a3 iio: adc: at91-sama5d2: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    5e8a3efb3e9c iio: dummy: Fix build error when CONFIG_IIO_TRIGGERED_BUFFER is not set
    d4ff9e9ed5af kunit: Fix result propagation for parameterised tests
    61dc159ec20e mtd: spinand: Fix double counting of ECC stats
    505056e4bdc2 thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
    ab9e76493196 mtd: spi-nor: otp: return -EROFS if region is read-only
    534ba50f4de9 mtd: spi-nor: otp: fix access to security registers in 4 byte mode
    3802b97849b6 eeprom: idt_89hpesx: Restore printing the unsupported fwnode name
    21652cc1d368 eeprom: idt_89hpesx: Put fwnode in matching case during ->probe()
    9d5d1903cde3 usb: dwc2: Don't reset the core after setting turnaround time
    3328f627c90b usb: gadget: f_fs: Fix setting of device and driver data cross-references
    e78e2c04941a ASoC: mediatek: mtk-btcvsd: Fix an error handling path in 'mtk_btcvsd_snd_probe()'
    8a7cbece6b69 ASoC: rt711-sdca: handle mbq_regmap in rt711_sdca_io_init
    060735a28a1f ASoC: rt711-sdca-sdw: add readable for SDW_SDCA_CTL() registers
    c7c275d9930c ASoC: rt5682-sdw: set regcache_cache_only false before reading RT5682_DEVICE_ID
    186373129258 ASoC: rt5682: Fix a problem with error handling in the io init function of the soundwire
    5544d5522a19 ASoC: rt715-sdca: fix clock stop prepare timeout issue
    15e920874b4d ASoC: rt715-sdw: use first_hw_init flag on resume
    ea62150dd733 ASoC: rt715-sdca-sdw: use first_hw_init flag on resume
    7b87d4763fe2 ASoC: rt711-sdw: use first_hw_init flag on resume
    9c06ea07f82e ASoC: rt711-sdca-sdw: use first_hw_init flag on resume
    7baba8a47772 ASoC: rt700-sdw: use first_hw_init flag on resume
    b4b4f4c0df1f ASoC: rt5682-sdw: use first_hw_init flag on resume
    d2d2558c1920 ASoC: rt1316-sdw: use first_hw_init flag on resume
    b1cdc0cdf894 ASoC: rt1308-sdw: use first_hw_init flag on resume
    c96efdc4e755 ASoC: max98373-sdw: use first_hw_init flag on resume
    fd999972a61b ASoC: max98373-sdw: add missing memory allocation check
    0420caf49693 iommu/dma: Fix IOVA reserve dma ranges
    2efa055728cd selftests: splice: Adjust for handler fallback removal
    c7f4ec0649dc s390: appldata depends on PROC_SYSCTL
    11a86e01ae29 s390: enable HAVE_IOREMAP_PROT
    5cef83686407 iommu/amd: Tidy up DMA ops init
    a935344b6dac iommu/amd: Fix extended features logging
    a9c55cbadef5 visorbus: fix error return code in visorchipset_init()
    3886a5e6bbe3 fsi/sbefifo: Fix reset timeout
    657cd9acd6ef fsi/sbefifo: Clean up correct FIFO when receiving reset request from SBE
    ebb29df21cec fsi: occ: Don't accept response from un-initialized OCC
    485d8c421dbc fsi: scom: Reset the FSI2PIB engine for any error
    7d884f6f7faa fsi: core: Fix return of error values on failures
    51ab817f8a0b mfd: rn5t618: Fix IRQ trigger by changing it to level mode
    f0a5801a8df2 mfd: Remove software node conditionally and locate at right place
    cffae75db764 mfd: mp2629: Select MFD_CORE to fix build error
    270c97c23e0d scsi: iscsi: Flush block work before unblock
    bee1e10216dc scsi: iscsi: Fix in-kernel conn failure handling
    3f1782fc50f9 scsi: iscsi: Rel ref after iscsi_lookup_endpoint()
    96a6275ea900 scsi: iscsi: Use system_unbound_wq for destroy_work
    6622a20c1c70 scsi: iscsi: Force immediate failure during shutdown
    901d6de154af scsi: iscsi: Stop queueing during ep_disconnect
    c7db90f1ad98 scsi: FlashPoint: Rename si_flags field
    710c7ffff9ae leds: lp50xx: Put fwnode in error case during ->probe()
    93d38eec2923 leds: lm3697: Don't spam logs when probe is deferred
    a20a178d2aaf leds: lm3692x: Put fwnode in any case during ->probe()
    4c8bfceb5c40 leds: lm36274: Put fwnode in error case during ->probe()
    0045de214652 leds: lm3532: select regmap I2C API
    bd9b145ab8ab leds: lgm-sso: Fix clock handling
    fee25ffa1454 leds: class: The -ENOTSUPP should never be seen by user space
    e25b5dcc4c86 tty: nozomi: Fix the error handling path of 'nozomi_card_init()'
    1d1edde89cb4 firmware: stratix10-svc: Fix a resource leak in an error handling path
    51790ca96fd0 misc/pvpanic-mmio: Fix error handling in 'pvpanic_mmio_probe()'
    a9ecb8bc82ab misc/pvpanic-pci: Fix error handling in 'pvpanic_pci_probe()'
    b91a065a5ba4 char: pcmcia: error out if 'num_bytes_read' is greater than 4 in set_protocol()
    f46e3fd7d965 staging: mmal-vchiq: Fix incorrect static vchiq_instance.
    9e6812ac02cb mtd: rawnand: arasan: Ensure proper configuration for the asserted target
    765beb5ef9da mtd: parsers: qcom: Fix leaking of partition name
    d5023eb76f0d mtd: partitions: redboot: seek fis-index-block in the right node
    e6fd14af0e6b perf scripting python: Fix tuple_set_u64()
    693c6dc2bdb3 Input: hil_kbd - fix error return code in hil_dev_connect()
    0a663843c2d5 ASoC: rsnd: tidyup loop on rsnd_adg_clk_query()
    524f37995032 usb: typec: tcpm: Fix up PR_SWAP when vsafe0v is signalled
    69660a9aee19 backlight: lm3630a_bl: Put fwnode in error case during ->probe()
    bed4f1f93767 ASoC: hisilicon: fix missing clk_disable_unprepare() on error in hi6210_i2s_startup()
    4f662271fc5b ASoC: rk3328: fix missing clk_disable_unprepare() on error in rk3328_platform_probe()
    af74662aaa87 iio: potentiostat: lmp91000: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    90c16bad0d13 iio: cros_ec_sensors: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    b1d6d4cecdaa iio: chemical: atlas: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    5499e7544736 iio: light: tcs3472: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    57df003962c4 iio: light: tcs3414: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    61aa73978ae5 iio: light: isl29125: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    b25f1318c124 iio: magn: bmc150: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    d40bbe4ccfe6 iio: magn: hmc5843: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    c8d0c967c042 iio: prox: as3935: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    ca40b4e4d0fb iio: prox: pulsed-light: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    f124951d8b2f iio: prox: srf08: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    870214f4d617 iio: humidity: am2315: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    e41a3882768d iio: gyro: bmg160: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    64dff722b0df iio: adc: vf610: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    c4302d44f1f1 iio: adc: ti-ads1015: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    927a7d88f085 iio: accel: stk8ba50: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    cc3e33b0c9a4 iio: accel: stk8312: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    3ef6d9ff5b73 iio: accel: mxc4005: Fix overread of data and alignment issue.
    f8bd73333948 iio: accel: kxcjk-1013: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    8d49028df646 iio: accel: hid: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    72daeb5f020e iio: accel: bma220: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    b9e837d4a7a4 iio: accel: bma180: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    0a918214b71a iio: adis16475: do not return ints in irq handlers
    cac49141208a iio: adis16400: do not return ints in irq handlers
    7ad60ebd7c04 iio: adis_buffer: do not return ints in irq handlers
    52728a7966da mwifiex: re-fix for unaligned accesses
    b25bc3e21b80 phy: ralink: phy-mt7621-pci: properly print pointer address
    c99410c9223d tty: nozomi: Fix a resource leak in an error handling function
    527cc7317abf serial: 8250_omap: fix a timeout loop condition
    d12c159cdd24 serial: fsl_lpuart: remove RTSCTS handling from get_mctrl()
    032c57aadf36 serial: fsl_lpuart: don't modify arbitrary data on lpuart32
    75f27ce5b93b rcu: Invoke rcu_spawn_core_kthreads() from rcu_spawn_gp_kthread()
    0b5edb884bf7 ASoC: rt5682: Disable irq on shutdown
    6dfbed1ac573 staging: fbtft: Don't spam logs when probe is deferred
    37a3335c1b45 staging: fbtft: Rectify GPIO handling
    3fc3179becfa staging: rtl8712: Fix some tests against some 'data' subtype frames
    466654d21be1 MIPS: Fix PKMAP with 32-bit MIPS huge page support
    7ab2438efaba RDMA/core: Always release restrack object
    d19a51aaafcf RDMA/mlx5: Don't access NULL-cleared mpi pointer
    420451e090ee net: tipc: fix FB_MTU eat two pages
    281c4b33035b net: sched: fix warning in tcindex_alloc_perfect_hash
    37287acdae77 net: lwtunnel: handle MTU calculation in forwading
    cae2f265c5a9 writeback: fix obtain a reference to a freeing memcg css
    6eeb73fa1492 bpf, x86: Fix extable offset calculation
    514795d6fb84 clk: si5341: Update initialization magic
    2f19f9ef84c2 clk: si5341: Check for input clock presence and PLL lock on startup
    f09f20dc21b2 clk: si5341: Avoid divide errors due to bogus register contents
    91a1de176b94 clk: si5341: Wait for DEVICE_READY on startup
    884a39889228 clk: qcom: clk-alpha-pll: fix CAL_L write in alpha_pll_fabia_prepare
    39468899710a clk: actions: Fix AHPPREDIV-H-AHB clock chain on Owl S500 SoC
    bb4367cc3722 clk: actions: Fix bisp_factor_table based clocks on Owl S500 SoC
    7f8d9cca344f clk: actions: Fix SD clocks factor table on Owl S500 SoC
    059f4c4ca01e clk: actions: Fix UART clock dividers on Owl S500 SoC
    51c2a6cd472a clk: qcom: gcc: Add support for a new frequency for SC7280
    4c41eceb422b Bluetooth: Fix handling of HCI_LE_Advertising_Set_Terminated event
    606c3bdfa66a Bluetooth: Fix Set Extended (Scan Response) Data
    077f680b0e36 Bluetooth: mgmt: Fix slab-out-of-bounds in tlv_data_is_valid
    3b760a0a24c7 Bluetooth: virtio_bt: add missing null pointer check on alloc_skb call return
    bed9525b9322 clk: zynqmp: fix compile testing without ZYNQMP_FIRMWARE
    5fe0ca3d5d92 Revert "be2net: disable bh with spin_lock in be_process_mcc"
    51a36dde7aa5 gve: Fix swapped vars when fetching max queues
    58faaa992dee RDMA/cma: Fix incorrect Packet Lifetime calculation
    2eddafd7ec46 bpfilter: Specify the log level for the kmsg message
    9c34dfa6f036 net: dsa: sja1105: fix NULL pointer dereference in sja1105_reload_cbs()
    f6bb341b08ae e1000e: Check the PCIm state
    f5311a0c02aa ipv6: fix out-of-bound access in ip6_parse_tlv()
    710f87cb04f9 net: atlantic: fix the macsec key length
    d22eadd94ca5 net: phy: mscc: fix macsec key length
    70521208f6ce net: macsec: fix the length used to copy the key for offloading
    1e3b94af52bf RDMA/cma: Protect RMW with qp_mutex
    3e174152dfb9 ibmvnic: free tx_pool if tso_pool alloc fails
    ca854faf0b85 ibmvnic: set ltb->buff to NULL after freeing
    781b69c0d216 ibmvnic: account for bufs already saved in indir_buf
    5142c3925338 ibmvnic: clean pending indirect buffs during reset
    eacd61111d91 Revert "ibmvnic: remove duplicate napi_schedule call in open function"
    e7f3c4348fb1 Revert "ibmvnic: simplify reset_long_term_buff function"
    8b09cfd020cf RDMA/hns: Add window selection field of congestion control
    f067cd951611 RDMA/hns: Add a check to ensure integer mtu is positive
    8853324cd846 i40e: Fix missing rtnl locking when setting up pf switch
    431557e806dc i40e: Fix autoneg disabling for non-10GBaseT links
    7cd87f624d5e i40e: Fix error handling in i40e_vsi_open
    138fa2ab24ae bpf: Do not change gso_size during bpf_skb_change_proto()
    c7e78a1b0af7 can: j1939: j1939_sk_setsockopt(): prevent allocation of j1939 filter for optlen == 0
    59e8f3f131a1 ipv6: exthdrs: do not blindly use init_net
    80dbfebba92f net: bcmgenet: Fix attaching to PYH failed on RPi 4B
    abca3782c5d6 mac80211: remove iwlwifi specific workaround NDPs of null_response
    be7be4caa6d0 drm/msm/dpu: Fix error return code in dpu_mdss_init()
    48a14a2d67e9 drm/msm: Fix error return code in msm_drm_init()
    e75247cd4522 drm/msm/disp/dpu1: avoid perf update in frame done event
    17992ed2fb98 drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
    b8a6022adad6 bpf: Fix null ptr deref with mixed tail calls and subprogs
    7fc2cbe4c840 ieee802154: hwsim: avoid possible crash in hwsim_del_edge_nl()
    812801e0b924 ieee802154: hwsim: Fix memory leak in hwsim_add_one
    4416dc914cca RDMA/hns: Fix uninitialized variable
    5fc0d1725e73 RDMA/hns: Force rewrite inline flag of WQE
    3c4a4c05b01f tc-testing: fix list handling
    d44313d1240c net: ti: am65-cpsw-nuss: Fix crash when changing number of TX queues
    9d47eeb96ddc net: broadcom: bcm4908_enet: reset DMA rings sw indexes properly
    a7d381c90c4b net/ipv4: swap flow ports when validating source
    6380a373f9d1 ip6_tunnel: fix GRE6 segmentation
    a1a10328ddab mptcp: avoid race on msk state changes
    027c5a4c89ec bpf: Fix integer overflow in argument calculation for bpf_map_area_alloc
    f4ecb17d3ad4 vxlan: add missing rcu_read_lock() in neigh_reduce()
    f433230c5433 rtw88: 8822c: fix lc calibration timing
    1f7495df501f bpf: Fix regression on BPF_OBJ_GET with non-O_RDWR flags
    ef8f0bdbb724 iwlwifi: increase PNVM load timeout
    e47311366a79 netfilter: nf_tables: do not allow to delete table with owner by handle
    1433324d08ab netfilter: nf_tables: skip netlink portID validation if zero
    445e7e3cfe74 xfrm: Fix xfrm offload fallback fail case
    8e3823a5d97b pkt_sched: sch_qfq: fix qfq_change_class() error path
    7c8e4bc68e58 net: dsa: mv88e6xxx: Fix adding vlan 0
    c648c4bd3233 net: mana: Fix a memory leak in an error handling path in 'mana_create_txq()'
    7dc2320844fe mptcp: fix 32 bit DSN expansion
    9405815dad41 mptcp: fix bad handling of 32 bit ack wrap-around
    4a4d230b1778 netfilter: nf_tables_offload: check FLOW_DISSECTOR_KEY_BASIC in VLAN transfer logic
    09b1f676e2e0 netfilter: nf_tables: memleak in hw offload abort path
    0fe29dd70194 tls: prevent oversized sendfile() hangs by ignoring MSG_MORE
    6f26c4e638cd selftests: tls: fix chacha+bidir tests
    f4b35106f13c selftests: tls: clean up uninitialized warnings
    99b0c836b3d8 net: sched: add barrier to ensure correct ordering for lockless qdisc
    754da271ff3e vrf: do not push non-ND strict packets with a source LLA through packet taps again
    74a084743db0 skmsg: Teach sk_psock_verdict_apply() to return errors
    a72fd1ef2ddf skmsg: Fix a memory leak in sk_psock_verdict_apply()
    60eef5b7eecb skmsg: Clear skb redirect pointer before dropping it
    b2265f3e7fbe udp: Fix a memory leak in udp_read_sock()
    600a68d582b7 selftests/bpf: Retry for EAGAIN in udp_redir_to_connected()
    48c858a38ad2 net: ethernet: ezchip: fix error handling
    062e01fdb281 net: ethernet: ezchip: fix UAF in nps_enet_remove
    7e6f10fb798f net: ethernet: aeroflex: fix UAF in greth_of_remove
    d07ebb093e08 mt76: mt7921: fix the coredump is being truncated
    29ba2ad0ff18 mt76: mt7921: fix kernel warning when reset on vif is not sta
    611beba9b300 mt76: mt7915: fix rx fcs error count in testmode
    0a446c73492b mt76: mt7921: wake the device before dumping power table
    3acae0c71d2b mt76: mt7915: fix MT_EE_CAL_GROUP_SIZE
    734f5fe1b860 mt76: mt7615: fix potential overflow on large shift
    31635a9389f9 mt76: testmode: remove undefined behaviour in mt76_testmode_alloc_skb
    5b2deebec2b9 mt76: testmode: fix memory leak in mt76_testmode_alloc_skb
    2e25e8e35ab6 mt76: mt7921: do not schedule hw reset if the device is not running
    d26261090df5 mt76: mt7921: avoid unnecessary consecutive WiFi resets
    7c041b2b416a mt76: mt7921: fix OMAC idx usage
    7fd445618a31 mt76: mt7921: fix invalid register access in wake_work
    9d9fb322b13d mt76: mt7921: add back connection monitor support
    fcab20e23e3c mt76: mt7921: consider the invalid value for to_rssi
    a889b3e5efbb mt76: connac: fix WoW with disconnetion and bitmap pattern
    3c72c4f4013b mt76: connac: fw_own rely on all packet memory all being free
    7966772888c3 mt76: mt7921: Don't alter Rx path classifier
    ca72aaa9bdeb mt76: mt7921: fix mt7921_wfsys_reset sequence
    6d4004306f3a mt76: mt7615: fix NULL pointer dereference in tx_prepare_skb()
    fb63ea6702f4 mt76: fix possible NULL pointer dereference in mt76_tx
    57fa5990a28d mt76: mt7915: fix a signedness bug in mt7915_mcu_apply_tx_dpd()
    ba9232736dd4 net: pxa168_eth: Fix a potential data race in pxa168_eth_remove
    a00c9faf7efa samples/bpf: Fix the error return code of xdp_redirect's main()
    9abfeb4e2c5f samples/bpf: Fix Segmentation fault for xdp_redirect command
    a6f6a2fe3f2c RDMA/hns: Clear extended doorbell info before using
    fffdf02df829 RDMA/rtrs-srv: Set minimal max_send_wr and max_recv_wr
    3cb841954361 bpf: Fix libelf endian handling in resolv_btfids
    01faf195e638 xsk: Fix broken Tx ring validation
    85912942f7fb xsk: Fix missing validation for skb and unaligned mode
    95599ef3256c selftests/bpf: Fix ringbuf test fetching map FD
    bb5639045961 selftests/bpf: Whitelist test_progs.h from .gitignore
    f35dd32ac502 RDMA/rxe: Fix qp reference counting for atomic ops
    d8a190f35b3b netfilter: nft_tproxy: restrict support to TCP and UDP transport protocols
    da0fa9a91fbd netfilter: nft_osf: check for TCP packet before further processing
    34a76bb820d6 netfilter: nft_exthdr: check for IPv6 packet before further processing
    803ffe5f1fa5 RDMA/mlx5: Don't add slave port to unaffiliated list
    e3fdf2f3cbbf netlabel: Fix memory leak in netlbl_mgmt_add_common
    4074391995a6 wil6210: remove erroneous wiphy locking
    c497a0c9c457 ath11k: send beacon template after vdev_start/restart during csa
    7f72b0b6c15a ath10k: Fix an error code in ath10k_add_interface()
    ab8fee33b6ec ath11k: Fix an error handling path in ath11k_core_fetch_board_data_api_n()
    fdb3f590eb4a cw1200: Revert unnecessary patches that fix unreal use-after-free bugs
    eb6219ebf416 brcmsmac: mac80211_if: Fix a resource leak in an error handling path
    f257ee3efae5 brcmfmac: Delete second brcm folder hierarchy
    837f0c940b49 brcmfmac: Fix a double-free in brcmf_sdio_bus_reset
    35bb54ed3124 brcmfmac: correctly report average RSSI in station info
    da997cc14d9b brcmfmac: fix setting of station info chains bitmask
    aa68a411acd0 ssb: Fix error return code in ssb_bus_scan()
    88d70c35d1bf drm/i915/selftests: Reorder tasklet_disable vs local_bh_disable
    c1df1d2271da net: wwan: Fix WWAN config symbols
    af6eaa8f7031 wcn36xx: Move hal_buf allocation to devm_kmalloc in probe
    4ec8141fe718 clk: imx8mq: remove SYS PLL 1/2 clock gates
    0757175bd62f ieee802154: hwsim: Fix possible memory leak in hwsim_subscribe_all_others
    e41dc10d83b7 wireless: carl9170: fix LEDS build errors & warnings
    4407f2b03b32 ath10k: add missing error return code in ath10k_pci_probe()
    bce39420d111 ath10k: go to path err_unsupported when chip id is not supported
    f3fe80f74081 tools/bpftool: Fix error return code in do_batch()
    944be014f9c1 net: stmmac: Fix potential integer overflow
    c7cfbf45325a stmmac: prefetch right address
    6be3f2d04fbe drm: qxl: ensure surf.data is ininitialized
    296031d154af clk: vc5: fix output disabling when enabling a FOD
    ef06eab3b9a6 drm/vc4: hdmi: Fix error path of hpd-gpios
    8434d0dadad3 drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
    616a5ba2f822 RDMA/rxe: Fix failure during driver load
    987e84710dc7 drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
    16723287bd62 IB/cm: Improve the calling of cm_init_av_for_lap and cm_init_av_by_path
    325554115332 Revert "IB/cm: Mark stale CM id's whenever the mad agent was unregistered"
    020155e97970 IB/cm: Split cm_alloc_msg()
    ad6608cdd66d IB/cm: Pair cm_alloc_response_msg() with a cm_free_response_msg()
    66dfc041f8a9 RDMA/core: Sanitize WQ state received from the userspace
    9c13e23c16d6 net/sched: act_vlan: Fix modify to allow 0
    9177b18f8b54 xfrm: remove the fragment check for ipv6 beet mode
    ee3582564a16 clk: tegra30: Use 300MHz for video decoder by default
    96d211bddcf6 ehea: fix error return code in ehea_restart_qps()
    ca86c8cc2643 RDMA/rtrs-clt: Fix memory leak of not-freed sess->stats and stats->pcpu_stats
    84d3b0760dfc RDMA/rtrs-clt: Check if the queue_depth has changed during a reconnection
    b69606171c14 RDMA/rtrs-srv: Fix memory leak when having multiple sessions
    1ec059871932 RDMA/rtrs-srv: Fix memory leak of unfreed rtrs_srv_stats object
    7fa6e4879492 RDMA/rtrs: Do not reset hb_missed_max after re-connection
    05c10aaaa068 RDMA/rtrs-clt: Check state of the rtrs_clt_sess before reading its stats
    695f54b87dc9 RDMA/srp: Fix a recently introduced memory leak
    c49229641646 RDMA/hns: Fix wrong timer context buffer page size
    63919d8eada1 mptcp: make sure flag signal is set when add addr with port
    e1c7a2f1f185 mptcp: generate subflow hmac after mptcp_finish_join()
    4eafee9b9ef6 mptcp: fix pr_debug in mptcp_token_new_connect
    005d5d547fdc drm/rockchip: cdn-dp: fix sign extension on an int multiply for a u64 result
    64751457f5ef drm/rockchip: lvds: Fix an error handling path
    a087222cde4e drm/rockchip: dsi: move all lane config except LCDC mux to bind()
    0070511f03d1 drm/rockchip: cdn-dp-core: add missing clk_disable_unprepare() on error in cdn_dp_grf_write()
    e9815b831963 drm: rockchip: set alpha_en to 0 if it is not used
    8cb95b48901e drm/vc4: crtc: Lookup the encoder from the register at boot
    81ae7270122f drm/vc4: crtc: Fix vc4_get_crtc_encoder logic
    bba1c86f1156 drm/vc4: crtc: Pass the drm_atomic_state to config_pv
    0e9dce911326 clk: sunxi-ng: v3s: fix incorrect postdivider on pll-audio
    e1fd4e8e99e5 clk: rockchip: fix rk3568 cpll clk gate bits
    8989945c62c7 net: ftgmac100: add missing error return code in ftgmac100_probe()
    9834e8264623 drm/amd/display: take dc_lock in short pulse handler only
    700c74b34241 drm/amd/display: Avoid HPD IRQ in GPU reset state
    490649a08850 drm/amd/display: fix potential gpu reset deadlock
    5dd6cdd732df clk: meson: g12a: fix gp0 and hifi ranges
    e5c790fd50cf net: qrtr: ns: Fix error return code in qrtr_ns_init()
    78c9dc7c59f8 drm/i915: Merge fix for "drm: Switch to %p4cc format modifier"
    26bbe384ea65 libbpf: Fix ELF symbol visibility update logic
    47bba472eba5 drm/vmwgfx: Fix cpu updates of coherent multisample surfaces
    6fd687491711 drm/vmwgfx: Mark a surface gpu-dirty after the SVGA3dCmdDXGenMips command
    b400d6618f0d RDMA/hns: Remove the condition of light load for posting DWQE
    bea7a8218abc pinctrl: renesas: r8a77990: JTAG pins do not have pull-down capabilities
    c2331bec030a pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
    35713cfa8c64 net: pch_gbe: Propagate error from devm_gpio_request_one()
    8487f76454dd net: mvpp2: Put fwnode in error case during ->probe()
    4e953e501b9f rtnetlink: avoid RCU read lock when holding RTNL
    2e023412a150 drm/imx: ipuv3-plane: fix PRG modifiers after drm managed resource conversion
    99631d4f4e9a drm/imx: ipuv3-plane: do not advertise YUV formats on planes without CSC
    7c15cfa409d8 video: fbdev: imxfb: Fix an error message
    a5eebe5b3258 drm/bridge: fix LONTIUM_LT8912B dependencies
    918fd0d654c8 drm/bridge: anx7625: Fix power on delay
    61eab97d07ef drm/ast: Fix missing conversions to managed API
    5164492766f4 drm/amd/dc: Fix a missing check bug in dm_dp_mst_detect()
    89714541150a drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
    725d15c4427a drm/bridge/sii8620: fix dependency on extcon
    d3209bf8be21 xfrm: xfrm_state_mtu should return at least 1280 for ipv6
    67a7436a51ae mm/page_alloc: fix counting of managed_pages
    b38b1d0b34dd mm: memcg/slab: properly set up gfp flags for objcg pointer array
    a533a21b692f mm/shmem: fix shmem_swapin() race with swapoff
    c3b39134bbd0 swap: fix do_swap_page() race with swapoff
    c24d5da468e4 mm: mmap_lock: use local locks instead of disabling preemption
    f9416bf072fe mm/debug_vm_pgtable: ensure THP availability via has_transparent_hugepage()
    a800caba3854 dax: fix ENOMEM handling in grab_mapping_entry()
    1e515576f826 ocfs2: fix snprintf() checking
    4e38237b3a52 blk-mq: update hctx->dispatch_busy in case of real scheduler
    1ae8fd0cfaec block: fix trace completion for chained bio
    c4b228181982 PM / devfreq: passive: Fix get_target_freq when not using required-opp
    e3ff9b26bbb2 cpufreq: Make cpufreq_online() call driver->offline() on errors
    3baa60e2801e ACPI: bgrt: Fix CFI violation
    ad90f92825de block, bfq: reset waker pointer with shared queues
    833cf2c80aa3 block, bfq: avoid delayed merge of async queues
    30d5c741d111 blk-wbt: make sure throttle is enabled properly
    1c0d0e179994 blk-wbt: introduce a new disable state to prevent false positive by rwb_enabled()
    9dc613454be9 EDAC/igen6: fix core dependency
    b0f3df13bdc7 ACPI: APEI: fix synchronous external aborts in user-mode
    98c349bb2782 extcon: extcon-max8997: Fix IRQ freeing at error path
    adfbc32044cd nvme-tcp: fix error codes in nvme_tcp_setup_ctrl()
    f1a3f6f8ef13 clocksource/drivers/timer-ti-dm: Save and restore timer TIOCP_CFG
    31d1545b81a7 HID: surface-hid: Fix get-report request
    3e556500bd49 md: revert io stats accounting
    d67ff22c7fc8 mark pstore-blk as broken
    780ce7b2994f ACPI: sysfs: Fix a buffer overrun problem with description_show()
    942511da9f3e ACPI: tables: FPDT: Add missing acpi_put_table() in acpi_init_fpdt()
    620f58c6c0d8 nvme-pci: look for StorageD3Enable on companion ACPI device instead
    52a535c630e5 x86/hyperv: fix logical processor creation
    9ec73d75f8c6 block: avoid double io accounting for flush request
    25adea167870 ACPI: PM / fan: Put fan device IDs into separate header file
    7e95c52cb786 PM / devfreq: Add missing error code in devfreq_add_device()
    73bbd350e9eb EDAC/aspeed: Use proper format string for printing resource
    a976b32a125f media: s5p-mfc: Fix display delay control creation
    f77ecd22b784 media: mtk-vpu: on suspend, read/write regs only if vpu is running
    e92492c7cb15 media: video-mux: Skip dangling endpoints
    27a1251783a5 KVM: selftests: Remove errant asm/barrier.h include to fix arm64 build
    aa138d422904 KVM: selftests: fix triple fault if ept=0 in dirty_log_test
    979965c33f73 psi: Fix race between psi_trigger_create/destroy
    a476aa9eea4b objtool: Don't make .altinstructions writable
    c7c6fb95d7c4 crypto: nx - Fix RCU warning in nx842_OF_upd_status
    10a5921d19c7 perf: Fix task context PMU for Hetero
    48a513f67b27 spi: spi-sun6i: Fix chipselect/clock bug
    0a32c742e877 x86/sev: Use "SEV: " prefix for messages from sev.c
    a2c53d934a91 lockdep/selftests: Fix selftests vs PROVE_RAW_LOCK_NESTING
    5fd218de86a3 lockdep: Fix wait-type for empty stack
    eed2284c449f sched/uclamp: Fix uclamp_tg_restrict()
    00e1a563f1ec sched/rt: Fix Deadline utilization tracking during policy change
    b5ee2425eaf6 sched/rt: Fix RT utilization tracking during policy change
    c6362a74da0c x86/sev: Split up runtime #VC handler for correct state tracking
    99e67ee2a1f8 x86/sev: Make sure IRQs are disabled while GHCB is active
    c7b63ad221fb btrfs: clear log tree recovering status if starting transaction fails
    f65ff29ff3a5 regulator: bd9576: Fix the driver name in id table
    3fefb73f890d regulator: hi6421v600: Fix setting idle mode
    cf6fd4b281a6 regulator: qcom-rpmh: Add terminator at the end of pm7325x_vreg_data[] array
    35cf50efb779 regulator: hi655x: Fix pass wrong pointer to config.driver_data
    33e8f03d5950 KVM: arm64: Don't zero the cycle count register when PMCR_EL0.P is set
    50cd74c7f38a perf/arm-cmn: Fix invalid pointer when access dtc object sharing the same IRQ number
    e96f6d4bb390 KVM: x86/mmu: Fix pf_fixed count in tdp_mmu_map_handle_target_level()
    5f7fe9c419e7 KVM: x86/mmu: Fix return value in tdp_mmu_map_handle_target_level()
    31678100f32a KVM: nVMX: Don't clobber nested MMU's A/D status on EPTP switch
    ffaaf321c09c KVM: nVMX: Ensure 64-bit shift when checking VMFUNC bitmap
    2e5c0d69ec46 KVM: nVMX: Sync all PGDs on nested transition with shadow paging
    80c0f6a4f636 KVM: nVMX: Add a return code to vmx_complete_nested_posted_interrupt
    8077ff1eeccb hwmon: (max31790) Fix fan speed reporting for fan7..12
    8ba1cbcacb8d hwmon: (max31722) Remove non-standard ACPI device IDs
    4d557422aa28 hwmon: (lm70) Revert "hwmon: (lm70) Add support for ACPI"
    1288a814a1b0 hwmon: (pmbus/bpa-rs600) Handle Vin readings >= 256V
    41e7e8d94576 media: i2c: rdacm21: Power up OV10640 before OV490
    10cd7a128225 media: i2c: rdacm21: Fix OV10640 powerup
    bd03f1cf32a1 media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
    b3362260388a media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
    52d7255c1432 media: v4l2-core: ignore native time32 ioctls on 64-bit
    99876d2f3316 arm64/mm: Fix ttbr0 values stored in struct thread_info for software-pan
    c8255c905aa1 mmc: usdhi6rol0: fix error return code in usdhi6_probe()
    1f8d5a578c87 crypto: sm2 - fix a memory leak in sm2
    dfc62a9fb18a crypto: x86/curve25519 - fix cpu feature checking logic in mod_exit
    334ea984ff36 crypto: omap-sham - Fix PM reference leak in omap sham ops
    46b988b2ce98 crypto: nitrox - fix unchecked variable in nitrox_register_interrupts
    ba68a06cfcbc regulator: fan53880: Fix vsel_mask setting for FAN53880_BUCK
    b0b3a5151649 media: siano: Fix out-of-bounds warnings in smscore_load_firmware_family2()
    7f245ea447dd m68k: atari: Fix ATARI_KBD_CORE kconfig unmet dependency warning
    262c340bf7e8 drivers/perf: hisi: Fix data source control
    9234c34f62c8 regulator: fan53555: Fix missing slew_reg/mask/shift settings for FAN53526
    d017709732cc media: gspca/gl860: fix zero-length control requests
    0a84a0cd4eb6 media: vicodec: Use _BITUL() macro in UAPI headers
    cf689b19af21 media: tc358743: Fix error return code in tc358743_probe_of()
    b01b4817f2e6 media: au0828: fix a NULL vs IS_ERR() check
    ff7233a3d085 media: exynos4-is: Fix a use after free in isp_video_release
    4085aa9b6182 media: rkvdec: Fix .buf_prepare
    ba2e3533e321 media: venus: hfi_cmds: Fix conceal color property
    ba10157cd0f8 media: ipu3-cio2: Fix reference counting when looping over ACPI devices
    1b76864f4da7 sched: Don't defer CPU pick to migration_cpu_stop()
    e2263985ad57 locking/lockdep: Reduce LOCKDEP dependency list
    ebc9f608afa0 pata_ep93xx: fix deferred probing
    614016e8cd5d regulator: bd71815: add select to fix build
    7ef5567a8af8 media: rc: i2c: Fix an error message
    1640411aa297 crypto: ccp - Fix a resource leak in an error handling path
    e6678d845127 crypto: sa2ul - Use of_device_get_match_data() helper
    dc0dae25ae08 crypto: sa2ul - Fix pm_runtime enable in sa_ul_probe()
    b595f995689e crypto: sa2ul - Fix leaks on failure paths with sa_dma_init()
    61b720aa441f x86/elf: Use _BITUL() macro in UAPI headers
    2df42a9a9b48 crypto: hisilicon/hpre - fix unmapping invalid dma address
    b47dc857836c crypto: testmgr - fix initialization of 'secret_size'
    b62d59e57437 evm: fix writing <securityfs>/evm overflow
    152c2b7fd126 pata_octeon_cf: avoid WARN_ON() in ata_host_activate()
    e77e1ad45f22 kbuild: Fix objtool dependency for 'OBJECT_FILES_NON_STANDARD_<obj> := n'
    c5b50bd025de sched/uclamp: Fix locking around cpu_util_update_eff()
    894ac20220b6 sched/uclamp: Fix wrong implementation of cpu.uclamp.min
    9e7050230b15 media: I2C: change 'RST' to "RSET" to fix multiple build errors
    25a0bda95d96 pata_rb532_cf: fix deferred probing
    f704f09d3dfa sata_highbank: fix deferred probing
    ddac7d88f7e2 crypto: ux500 - Fix error return code in hash_hw_final()
    88004270271a crypto: ixp4xx - update IV after requests
    8d75dedf2098 crypto: ixp4xx - dma_unmap the correct address
    f152f5e20cb2 media: hantro: do a PM resume earlier
    7ed930e68a12 media: i2c: ccs-core: return the right error code at suspend
    130fb80cabdf media: s5p_cec: decrement usage count if disabled
    8dd33849ea9d media: venus: Rework error fail recover logic
    5698d3e1fbb1 spi: Avoid undefined behaviour when counting unused native CSs
    bbf7cde09e9b spi: Allow to have all native CSs in use along with GPIOs
    3d9d4aa8dad3 kbuild: skip per-CPU BTF generation for pahole v1.18-v1.21
    d5719131c5ca mm: define default MAX_PTRS_PER_* in include/pgtable.h
    3921b835fbae writeback, cgroup: increment isw_nr_in_flight before grabbing an inode
    53602599e6f6 ia64: mca_drv: fix incorrect array size calculation
    10855647c0cb kthread_worker: fix return value when kthread_mod_delayed_work() races with kthread_cancel_delayed_work_sync()
    cf46e6f4898f block: fix discard request merge
    c9e970ed58c0 mailbox: qcom: Use PLATFORM_DEVID_AUTO to register platform device
    bebfd66f067c cifs: fix missing spinlock around update to ses->status
    b25ec82321ad HID: wacom: Correct base usage for capacitive ExpressKey status bits
    fee404cb4657 smb3: fix possible access to uninitialized pointer to DACL
    2e4c04443e58 ACPI: tables: Add custom DSDT file as makefile prerequisite
    e34583fce2ea tpm_tis_spi: add missing SPI device ID entries
    155d3c5d24ee clocksource: Check per-CPU clock synchronization when marked unstable
    d13f68003342 clocksource: Retry clock read if long delays detected
    c37238fae66d block, bfq: fix delayed stable merge check
    a1e7400147eb ACPI: EC: trust DSDT GPE for certain HP laptop
    fa004a75b5ff cifs: fix SMB1 error path in cifs_get_file_info_unix
    9a0c82374f67 smb3: fix uninitialized value for port in witness protocol move
    027c9f092d15 cifs: retry lookup and readdir when EAGAIN is returned.
    1c25524992af cifs: fix check of dfs interlinks
    5e397c943424 cifs: improve fallocate emulation
    5f28c21d7702 PCI: hv: Add check for hyperv_initialized in init_hv_pci_drv()
    8104b56965e1 tools/power/x86/intel-speed-select: Fix uncore memory frequency display
    35d976c35502 EDAC/Intel: Do not load EDAC driver when running as a guest
    2fe788c18b66 nvmet-fc: do not check for invalid target port in nvmet_fc_handle_fcp_rqst()
    1205de7c198f nvme-pci: fix var. type for increasing cq_head
    c74f85583f6d platform/x86: toshiba_acpi: Fix missing error code in toshiba_acpi_setup_keyboard()
    6632da07ac6c platform/x86: asus-nb-wmi: Revert "add support for ASUS ROG Zephyrus G14 and G15"
    91634181ba81 platform/x86: asus-nb-wmi: Revert "Drop duplicate DMI quirk structures"
    6c22172ca781 block: fix race between adding/removing rq qos and normal IO
    02f04a3c5d74 HID: sony: fix freeze when inserting ghlive ps3/wii dongles
    3cc07545a3ea HID: hid-input: add Surface Go battery quirk
    bf155b2eaab4 ACPI: resources: Add checks for ACPI IRQ override
    69136f2492dd ACPI: bus: Call kobject_put() in acpi_init() error path
    2bf1f848ca0a ACPICA: Fix memory leak caused by _CID repair function
    60c534a4a79e fs: dlm: fix memory leak when fenced
    087f6c68e2ba fs: dlm: fix lowcomms_start error case
    7f9887a1a9e9 drivers: hv: Fix missing error code in vmbus_connect()
    2b2a31cad66c open: don't silently ignore unknown O-flags in openat2()
    02d6273ab9be random32: Fix implicit truncation warning in prandom_seed_state()
    871166f159b3 fs: dlm: fix connection tcp EOF handling
    38ef63844ef4 fs: dlm: cancel work sync othercon
    18e5651e39a5 fs: dlm: reconnect if socket error report occurs
    7ae861bbfa0f fs: dlm: fix srcu read lock usage
    b407bf68af32 blk-mq: clear stale request in tags->rq[] before freeing one request pool
    0c0e6cd55d87 blk-mq: grab rq->refcount before calling ->fn in blk_mq_tagset_busy_iter
    b3ed6b4e39f2 block_dump: remove block_dump feature in mark_inode_dirty()
    5c2e42a7ff69 ACPI: EC: Make more Asus laptops use ECDT _GPE
    6e288c3f4b6a platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of TM800A550L tablets
    978dd194fd4a platform/x86: touchscreen_dmi: Add an extra entry for the upside down Goodix touchscreen on Teclast X89 tablets
    2f09dc35f8d6 Input: goodix - platform/x86: touchscreen_dmi - Move upside down quirks to touchscreen_dmi.c
    69476379eb45 lib: vsprintf: Fix handling of number field widths in vsscanf
    782da090933c hv_utils: Fix passing zero to 'PTR_ERR' warning
    9e86d9c12351 ACPI: processor idle: Fix up C-state latency if not ordered
    93545e3b7fe9 ACPI: scan: Rearrange dep_unmet initialization
    f5512b405739 ACPI: PM: s2idle: Add missing LPS0 functions for AMD
    4b0f6a85a59a EDAC/ti: Add missing MODULE_DEVICE_TABLE
    892ca2b2ff3a HID: do not use down_interruptible() when unbinding devices
    31a5fc473d74 seccomp: Support atomic "addfd + send reply"
    95dafa3beb94 media: Fix Media Controller API config checks
    57013d106790 regulator: da9052: Ensure enough delay time for .set_voltage_time_sel
    6130d2ec297e regulator: mt6358: Fix vdram2 .vsel_mask
    72c4df2e3c06 KVM: s390: get rid of register asm usage
    51653ce74174 lockding/lockdep: Avoid to find wrong lock dep path in check_irq_usage()
    6f0a350c2667 locking/lockdep: Fix the dep path printing for backwards BFS
    da5a7fbfc5ca btrfs: disable build on platforms having page size 256K
    23f3aff83a25 btrfs: don't clear page extent mapped if we're not invalidating the full page
    77848dc0cf94 btrfs: sysfs: fix format string for some discard stats
    5f10bddef823 btrfs: always abort the transaction if we abort a trans handle
    0f9a0de7baa1 btrfs: abort transaction if we fail to update the delayed inode
    24c08d4b6f90 btrfs: fix error handling in __btrfs_update_delayed_inode
    3c9cb03aa19f KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and POWER10 processors
    f5822ae7d660 KVM: arm64: Restore PMU configuration on first run
    60c54321c822 drivers/perf: fix the missed ida_simple_remove() in ddr_perf_probe()
    2c95ccb350be perf/x86: Reset the dirty counter to prevent the leak for an RDPMC task
    4c305975c29a sched/fair: Take thermal pressure into account while estimating energy
    d5d76329a97c hwmon: (max31790) Fix pwmX_enable attributes
    508cd1209b7d hwmon: (max31790) Report correct current pwm duty cycles
    ead128748cab media: imx-csi: Skip first few frames from a BT.656 source
    271e441c9a0a media: siano: fix device register error path
    bd6288233a8d media: dvbdev: fix error logic at dvb_register_device()
    a64ddb6976e6 media: dvb_net: avoid speculation from net slot
    47a03368229e crypto: shash - avoid comparing pointers to exported functions under CFI
    239a5e142d25 regulator: mt6315: Fix checking return value of devm_regmap_init_spmi_ext
    230a4bf84904 spi: meson-spicc: fix memory leak in meson_spicc_probe
    c77cbc710389 spi: meson-spicc: fix a wrong goto jump for avoiding memory leak.
    99c514bea5fa mmc: sdhci-of-aspeed: Turn down a phase correction warning
    a62b72916a2c mmc: via-sdmmc: add a check against NULL pointer dereference
    c543fd01940d mmc: sdhci-sprd: use sdhci_sprd_writew
    e0a53f67fed6 memstick: rtsx_usb_ms: fix UAF
    8d570a009647 media: dvd_usb: memory leak in cinergyt2_fe_attach
    8d2d4b753431 Makefile: fix GDB warning with CONFIG_RELR
    b8ce443813d5 arm64: entry: don't instrument entry code with KCOV
    6a8665574f6b crypto: hisilicon/sec - fixup 3des minimum key size declaration
    d686a29b3f3e media: st-hva: Fix potential NULL pointer dereferences
    8b367af282d6 media: bt8xx: Fix a missing check bug in bt878_probe
    0227d4ffca0a media: v4l2-core: Avoid the dangling pointer in v4l2_fh_release
    94b73f521e52 media: cedrus: Fix .buf_prepare
    5ecae6b93cf5 media: hantro: Fix .buf_prepare
    e7a3ea26832c media: em28xx: Fix possible memory leak of em28xx struct
    6dc17634c116 media: bt878: do not schedule tasklet when it is not setup
    2375ab34f7f3 media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off
    ac302ca5829f ima: Don't remove security.ima if file must not be appraised
    0221e855eb01 sched/fair: Fix ascii art by relpacing tabs
    b2e7f2f9701c arm64: perf: Convert snprintf to sysfs_emit
    cab7a8c8ac9c crypto: ecdh - fix 'ecdh_init'
    9a091b3fe9a3 crypto: ecdh - fix ecdh-nist-p192's entry in testmgr
    3b29a41e8e16 crypto: qce: skcipher: Fix incorrect sg count for dma transfers
    4d9440ec7e31 crypto: qat - remove unused macro in FW loader
    39d92a5c89e3 crypto: qat - check return code of qat_hal_rd_rel_reg()
    12dc9abe3423 media: imx: imx7_mipi_csis: Fix logging of only error event counters
    8a1ef71e3fa3 media: pvrusb2: fix warning in pvr2_i2c_core_done
    27be0f88baed media: hevc: Fix dependent slice segment flags
    b42989b813f2 media: cobalt: fix race condition in setting HPD
    a24a3803d883 media: cpia2: fix memory leak in cpia2_usb_probe
    dc6a87f5450d sched: Make the idle task quack like a per-CPU kthread
    b03f44f12056 media: sti: fix obj-$(config) targets
    536898457d30 crypto: nx - add missing MODULE_DEVICE_TABLE
    56e208fd789a hwrng: exynos - Fix runtime PM imbalance on error
    24c79a7e54cc sched/core: Initialize the idle task with preemption disabled
    08d3c4504a7a regulator: uniphier: Add missing MODULE_DEVICE_TABLE
    2183eb0f23ca spi: omap-100k: Fix the length judgment problem
    4e2c9415918f spi: spi-topcliff-pch: Fix potential double free in pch_spi_process_messages()
    b198e32d5f56 spi: spi-loopback-test: Fix 'tx_buf' might be 'rx_buf'
    946e1956adc4 media: exynos-gsc: fix pm_runtime_get_sync() usage count
    e320bd62f343 media: exynos4-is: fix pm_runtime_get_sync() usage count
    8de265ab0659 media: sti/bdisp: fix pm_runtime_get_sync() usage count
    c816ee302c4f media: sunxi: fix pm_runtime_get_sync() usage count
    3ac22a1256fb media: s5p-jpeg: fix pm_runtime_get_sync() usage count
    74cdbfc4a632 media: mtk-vcodec: fix PM runtime get logic
    22d11e498877 media: sh_vou: fix pm_runtime_get_sync() usage count
    eb29fa40a3a2 media: am437x: fix pm_runtime_get_sync() usage count
    2982dfc00e6d media: s5p: fix pm_runtime_get_sync() usage count
    55eed167f79d media: mdk-mdp: fix pm_runtime_get_sync() usage count
    e0a7065748d0 media: marvel-ccic: fix some issues when getting pm_runtime
    59378a815637 media: i2c: imx334: fix the pm runtime get logic
    58bc5e46ba44 staging: media: rkvdec: fix pm_runtime_get_sync() usage count
    1199573d2601 Add a reference to ucounts for each cred
    9057b6cca151 spi: Make of_register_spi_device also set the fwnode
    a004cf847764 thermal/cpufreq_cooling: Update offline CPUs per-cpu thermal_pressure
    0c1678f223da fuse: reject internal errno
    2644fd6588e5 fuse: check connected before queueing on fpq->io
    76d97f2f3b02 fuse: ignore PG_workingset after stealing
    108adb1a5668 fuse: Fix infinite loop in sget_fc()
    809b077db6b8 fuse: Fix crash if superblock of submount gets killed early
    7ef44eacefc1 fuse: Fix crash in fuse_dentry_automount() error path
    1c7c1de40632 evm: Refuse EVM_ALLOW_METADATA_WRITES only if an HMAC key is loaded
    22527af823fa evm: Execute evm_inode_init_security() only when an HMAC key is loaded
    335d92decfdc loop: Fix missing discard support when using LOOP_CONFIGURE
    dac1e7eb17cf perf/x86/intel: Fix instructions:ppp support in Sapphire Rapids
    f457b2b8edd8 perf/x86/intel: Add more events requires FRONTEND MSR on Sapphire Rapids
    ef52fc1cc475 perf/x86/intel: Fix fixed counter check warning for some Alder Lake
    4a16324ff687 x86/gpu: add JasperLake to gen11 early quirks
    371764e376d1 powerpc/stacktrace: Fix spurious "stale" traces in raise_backtrace_ipi()
    468e5a5c9d08 seq_buf: Make trace_seq_putmem_hex() support data longer than 8
    751d51f3e9b2 tracepoint: Add tracepoint_probe_register_may_exist() for BPF tracing
    31d28f8a04b3 tracing/histograms: Fix parsing of "sym-offset" modifier
    3b0bfe43fecc selftests/resctrl: Fix incorrect parsing of option "-t"
    b8ffd9d4b949 rsi: fix AP mode with WPA failure due to encrypted EAPOL
    c812eb280471 rsi: Assign beacon rate settings to the correct rate_info descriptor field
    1852c5f9916b ssb: sdio: Don't overwrite const buffer if block_write fails
    b3a3ff8b0e7a ath9k: Fix kernel NULL pointer dereference during ath_reset_internal()
    019f2c9f98a4 serial_cs: remove wrong GLOBETROTTER.cis entry
    8c0484fd3f11 serial_cs: Add Option International GSM-Ready 56K/ISDN modem
    a9cd055e36e5 serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
    10f409e7ffb5 serial: mvebu-uart: fix calculation of clock divisor
    de8eea1e7636 iio: accel: bmc150: Don't make the remove function of the second accelerometer unregister itself
    aabcb52a2a1a iio: accel: bmc150: Fix dereferencing the wrong pointer in bmc150_get/set_second_device
    bcb312ee98a3 iio: accel: bmc150: Fix bma222 scale unit
    0deff8dcd0fc iio: accel: bma180: Fix BMA25x bandwidth register values
    f78812513693 iio: ltr501: ltr501_read_ps(): add missing endianness conversion
    77825e12cc2f iio: ltr501: ltr559: fix initialization of LTR501_ALS_CONTR
    acead08f0fad iio: ltr501: mark register holding upper 8 bits of ALS_DATA{0,1} and PS_DATA as volatile, too
    9495675ef266 iio: light: tcs3472: do not free unallocated IRQ
    9cc4994b50c1 iio: frequency: adf4350: disable reg and clk on error in adf4350_probe()
    7f6494552897 rtc: stm32: Fix unbalanced clk_disable_unprepare() on probe error path
    468fd1960b4f clk: agilex/stratix10: add support for the 2nd bypass
    e6b46c20ccda clk: agilex/stratix10: fix bypass representation
    acfd0d44231e clk: agilex/stratix10: remove noc_clk
    55f03f3bed19 clk: agilex/stratix10/n5x: fix how the bypass_reg is handled
    6c1265d7d32d clk: k210: Fix k210_clk_set_parent()
    a97c0590bde4 f2fs: Prevent swap file in LFS mode
    7b8881bcd7f3 f2fs: Advertise encrypted casefolding in sysfs
    1254698f9d63 s390: mm: Fix secure storage access exception handling
    81bb61abaceb s390/cio: dont call css_wait_for_slow_path() inside a lock
    6bb7392f6365 KVM: x86: Force all MMUs to reinitialize if guest CPUID is modified
    40928ae22323 KVM: x86: Properly reset MMU context at vCPU RESET/INIT
    88edf696be93 KVM: x86/mmu: Use MMU's role to detect CR4.SMEP value in nested NPT walk
    66b1a19cfbac KVM: x86/mmu: Treat NX as used (not reserved) for all !TDP shadow MMUs
    60ef300a34de KVM: x86/mmu: Remove broken WARN that fires on 32-bit KVM w/ nested EPT
    c3439d333f2d KVM: PPC: Book3S HV: Workaround high stack usage with clang
    79739fc3cfdd KVM: nVMX: Handle split-lock #AC exceptions that happen in L2
    283d80b859f8 perf/smmuv3: Don't trample existing events with global filter
    562521b6fb37 mm/gup: fix try_grab_compound_head() race with split_huge_page()
    38a5c79ea17b bus: mhi: pci-generic: Add missing 'pci_disable_pcie_error_reporting()' calls
    b98470e38ae2 bus: mhi: Wait for M2 state during system resume
    0b509e3ec35d bus: mhi: core: Fix power down latency
    0530021455af SUNRPC: Should wake up the privileged task firstly.
    e66509e7c90a SUNRPC: Fix the batch tasks count wraparound.
    18836fcf7a29 mac80211: fix NULL ptr dereference during mesh peer connection for non HE devices
    4cc6ec81f987 mac80211: remove iwlwifi specific workaround that broke sta NDP tx
    9e59c8d4172c can: peak_pciefd: pucan_handle_status(): fix a potential starvation issue in TX path
    54dc7c15743e can: j1939: j1939_sk_init(): set SOCK_RCU_FREE to call sk_destruct() after RCU is done
    ebf91625b3e4 can: isotp: isotp_release(): omit unintended hrtimer restart on socket release
    2e934deaa8fd can: gw: synchronize rcu operations before removing gw job entry
    014f8baa9d24 can: bcm: delay release of struct bcm_op after synchronize_rcu()
    42da0c84419c ext4: use ext4_grp_locked_error in mb_find_extent
    e59789c9cdb8 ext4: fix avefreec in find_group_orlov
    0b2f4710e9dc ext4: remove check for zero nr_to_scan in ext4_es_scan()
    74983f8c0d03 ext4: correct the cache_nr in tracepoint ext4_es_shrink_exit
    9785e209bc20 ext4: return error code when ext4_fill_flex_info() fails
    1e60f8ff27be ext4: fix overflow in ext4_iomap_alloc()
    befdd44d4632 ext4: fix kernel infoleak via ext4_extent_header
    573d64e85e0d ext4: cleanup in-core orphan list if ext4_truncate() failed to get a transaction handle
    806f5845757e btrfs: clear defrag status of a root if starting transaction fails
    1720dde8dfec btrfs: fix unbalanced unlock in qgroup_account_snapshot()
    14265d0b84eb btrfs: compression: don't try to compress if we don't have enough pages
    661907edc07c btrfs: send: fix invalid path for unlink operations after parent orphanization
    c90d10b45928 btrfs: zoned: bail out if we can't read a reliable write pointer
    2f57967716f4 btrfs: zoned: print message when zone sanity check type fails
    acae585838aa ARM: dts: at91: sama5d4: fix pinctrl muxing
    e2d7f388bbf7 ARM: dts: ux500: Fix LED probing
    d6c8a2650306 arm_pmu: Fix write counter incorrect in ARMv7 big-endian mode
    2497ef4cc77b crypto: ccp - Annotate SEV Firmware file names
    ef70c1c3cee5 crypto: nx - Fix memcpy() over-reading in nonce
    81acf1015233 Input: joydev - prevent use of not validated data in JSIOCSBTNMAP ioctl
    4f73f383f4f9 Input: elants_i2c - fix NULL dereference at probing
    fcc4582ff286 iov_iter_fault_in_readable() should do nothing in xarray case
    3854f9c612ae teach copy_page_to_iter() to handle compound pages
    64c430ea07a4 copy_page_to_iter(): fix ITER_DISCARD case
    baf1972e7901 selftests/lkdtm: Avoid needing explicit sub-shell
    9e4ac5eba035 ntfs: fix validity check for file name attribute
    d089a9af0cfa gfs2: Fix error handling in init_statfs
    396a707096ce gfs2: Fix underflow in gfs2_page_mkwrite
    73b4b15fa758 mm/page_alloc: fix memory map initialization for descending nodes
    6f648906e86e xhci: solve a double free problem while doing s4
    2802e5d7072e usb: typec: Add the missed altmode_id_remove() in typec_register_altmode()
    ec357da5b47f usb: typec: tcpm: Relax disconnect threshold during power negotiation
    d864070b33a6 usb: typec: tcpci: Fix up sink disconnect thresholds for PD
    f077ba7a104d usb: dwc3: Fix debugfs creation flow
    4df012c3c866 USB: cdc-acm: blacklist Heimann USB Appset device
    ed76fed81754 usb: renesas-xhci: Fix handling of unknown ROM state
    a55093941e38 usb: gadget: eem: fix echo command packet response issue
    15e94ea49bea net: can: ems_usb: fix use-after-free in ems_usb_disconnect()
    7763d4aaebaf Input: usbtouchscreen - fix control-request directions
    82d7e9597e6d media: dvb-usb: fix wrong definition
    efad996fc1c3 ALSA: hda/realtek: fix mute led of the HP Pavilion 15-eh1xxx series
    1ccc1686b3cc ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 830 G8 Notebook PC
    e4ca3c1dc370 ALSA: hda/realtek: Apply LED fixup for HP Dragonfly G1, too
    29e622eb3d63 ALSA: hda/realtek: Fix bass speaker DAC mapping for Asus UM431D
    85aa18d63ace ALSA: hda/realtek: Improve fixup for HP Spectre x360 15-df0xxx
    5f33519ffa29 ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook x360 830 G8
    496df16507ad ALSA: hda/realtek: Add another ALC236 variant support
    6e4b638ba2b5 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 630 G8
    be688c0763bf ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 445 G8
    2b7c96d5d7c2 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 450 G8
    61d14781e51e ALSA: intel8x0: Fix breakage at ac97 clock measurement
    d36a88504d87 ALSA: usb-audio: scarlett2: Fix wrong resume call
    493cce3d1f60 ALSA: firewire-motu: fix stream format for MOTU 8pre FireWire
    61f57e686753 ALSA: usb-audio: Fix OOB access at proc output
    f446bfac9d78 ALSA: usb-audio: fix rate on Ozone Z90 USB headset
    4448de6006fb ALSA: bebob: fix rx packet format for Yamaha GO44/GO46, Terratec Phase 24/x24
    146017a71748 Bluetooth: Remove spurious error message
    ab4e95250d9c Bluetooth: btqca: Don't modify firmware contents in-place
    13dbf9944e36 Bluetooth: hci_qca: fix potential GPF
    aaa1f5834d71 Linux 5.13.1
    7f6cbd0b3e1e mm/page_alloc: correct return value of populated elements if bulk array is populated
    5863699d2391 Revert "KVM: x86/mmu: Drop kvm_mmu_extended_role.cr4_la57 hack"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index 8dd6791b02..aeeb565db2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e60f9507dee72c63193cbafe0a3c754210ff69fc"
-SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
+SRCREV_machine ?= "41ea72d0815da26eea1e7ae6fd3fc12b891f656f"
+SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13"
+LINUX_VERSION ?= "5.13.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 83cfdba568..f06e5f2ffc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13"
+LINUX_VERSION ?= "5.13.2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "51e261b235385efcee08c4b5489c544fb2935e2a"
-SRCREV_machine ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
+SRCREV_machine_qemuarm ?= "054e53c50b92e2d6fdc7c21209ee7666d0a45a67"
+SRCREV_machine ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index a96eab7fdb..cf38303984 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.13/standard/base"
 KBRANCH_qemux86-64 ?= "v5.13/standard/base"
 KBRANCH_qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "60de9ae7ec5086c7aab26fef79c5ee22673e984b"
-SRCREV_machine_qemuarm64 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_machine_qemumips ?= "4ba021f55cd0f90d34d2432de21282e792e6ad06"
-SRCREV_machine_qemuppc ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_machine_qemuriscv64 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_machine_qemuriscv32 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_machine_qemux86 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_machine_qemux86-64 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_machine_qemumips64 ?= "1fb4f7d7204bffe99a86e72b3cffe84c770be3ee"
-SRCREV_machine ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
-SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
+SRCREV_machine_qemuarm ?= "5eaf18f1e3fb22c99d8a1cf7cd4148f10fa01d3c"
+SRCREV_machine_qemuarm64 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_machine_qemumips ?= "8f960c63f6bd32557af074932f53f56bd9af423d"
+SRCREV_machine_qemuppc ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_machine_qemuriscv64 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_machine_qemuriscv32 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_machine_qemux86 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_machine_qemux86-64 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_machine_qemumips64 ?= "c4651adf3e0a55fed797f0963a94aa02974dc591"
+SRCREV_machine ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
+SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRCREV_class-devupstream = "62fb9874f5da54fdb243003b386128037319b219"
+SRCREV__class-devupstream ?= "d6fc894baac777c38a95a31f65343bea8b1a2678"
 PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13"
+LINUX_VERSION ?= "5.13.2"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

