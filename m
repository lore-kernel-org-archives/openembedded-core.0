Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.14936.1602253171352939671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1Q4YjsiG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id w21so7002943pfc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=m59ND/gZVKyb/mj/akG0CSC13JrzZmKWCYAdlzcVxo4=;
        b=1Q4YjsiGsSRBnimsLTRSgMYD03DmLjrTMaqQwMZ9z/bwalRbNuhMzGkpKAandv/tZN
         vfP8xS6+iFYbHpLtyradEEejDVtzh0N129wMraC3R3wvEtfYa1XpHSiNl+5uD17EmYjZ
         RkxnZ9uDcgMBaiSUugefw+R2yjapTkLXQkHWhSyZH6JJ/99sslxBU9HQLrjqQQeJ7ZSH
         0zVuRx4B45qtLie87uXTU/82QYZfzPtXlXVI1So2QRgeKYHsCWopclFgSIOOrx8zG635
         ZG54LTx6mLxQY24qhj5m8MRlym2I8Xf4tQlzRt6Zqe9Kj3pB65ul6cEmDWdF4mMzlK9o
         4YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=m59ND/gZVKyb/mj/akG0CSC13JrzZmKWCYAdlzcVxo4=;
        b=JKAG55ioroF5J7VlTCUH+nDUiL02+a127UAXke4XEP2gZzxi6G+RIrXaLHrwNY5a1x
         c73TXsImjdjS/XMlGTthNa/0YwXerTHnreEkCYMmhyjucrYpYDx4zLBZPX3QVy6bAJH7
         x4raQPn1hzCJirwmlz+p0Rc2cEn0+KrQMPJ1c79lbmaJrQcZNE3smzaAX6vTAXiItH8s
         3ye1ql8vIXVVa+LrIyFjdHj4pFyhdtp4dwbUbz6ueG7zZ5wu2QWPspZ5Vd3HyET5Hfgt
         gy2Yr5hwrWHUCRIxn+vH24OUJJ/5f0UaleDM6BUY9lBdTCj1yJJ7cAyrprH0vSuWFV1u
         4Vsw==
X-Gm-Message-State: AOAM533mYyYtbmlo3wterJHl2kSd6SiWsVO0edQduKo1voGXFj6vmX3b
	4EFuxPWASqFJNoKjpkna06hHtxMTwqMh10Iw
X-Google-Smtp-Source: ABdhPJw6RdpoSB+xAzv9TkTmSo0IjHTwOLR1F6XJfryXmlFt+AwSwEIlElyFFdbTX/Txx1dP+FVXVA==
X-Received: by 2002:a17:90a:7f8c:: with SMTP id m12mr5129268pjl.22.1602253170107;
        Fri, 09 Oct 2020 07:19:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] linux-yocto/5.4: update to v5.4.67
Date: Fri,  9 Oct 2020 04:18:45 -1000
Message-Id: <ec411cb105efb755f0fc18db11cf7682761c796a.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    a4bea6a4f1e0 Linux 5.4.67
    ef6458fdbb5c dax: Fix compilation for CONFIG_DAX && !CONFIG_FS_DAX
    d6712eefc77e dm: Call proper helper to determine dax support
    6b02d0598554 mm/memory_hotplug: drain per-cpu pages again during memory offline
    908272a5e9e4 dm/dax: Fix table reference counts
    0df6aeac967f selftests/vm: fix display of page size in map_hugetlb
    5ed6a7e1a7e1 powerpc/dma: Fix dma_map_ops::get_required_mask
    264ae08bb774 ehci-hcd: Move include to keep CRC stable
    fceeea8b35cb s390/zcrypt: fix kmalloc 256k failure
    463a0d4c1b94 x86/boot/compressed: Disable relocation relaxation
    b703bd1e9285 serial: 8250_pci: Add Realtek 816a and 816b
    96e6de09097b Input: i8042 - add Entroware Proteus EL07R4 to nomux and reset lists
    c0190d14b9a8 Input: trackpoint - add new trackpoint variant IDs
    e44bd84cd2ab percpu: fix first chunk size calculation for populated bitmap
    32f60ecbb9b8 ALSA: hda/realtek - The Mic on a RedmiBook doesn't work
    dda1362d6bce ALSA: hda: fixup headset for ASUS GX502 laptop
    87e1dbe6c6c5 Revert "ALSA: hda - Fix silent audio output and corrupted input on MSI X570-A PRO"
    b0b68bfe729a i2c: i801: Fix resume bug
    7c96edc6e719 usb: typec: ucsi: Prevent mode overrun
    6c56942bd2e6 usblp: fix race between disconnect() and read()
    56ad2cab0845 USB: UAS: fix disconnect by unplugging a hub
    d8c0a033d9ce USB: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for BYD zhaoxin notebook
    a0fec594b0a5 drm/i915: Filter wake_flags passed to default_wake_function
    daf646fd3247 riscv: Add sfence.vma after early page table changes
    8a568d7fc295 i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of DMA_CTRL_ACK
    a55eec14a4e1 iommu/amd: Fix potential @entry null deref
    ecd219c72945 arm64: bpf: Fix branch offset in JIT
    c6fa55a3130d drm/mediatek: Add missing put_device() call in mtk_hdmi_dt_parse_pdata()
    566e86327754 drm/mediatek: Add exception handing in mtk_drm_probe() if component init fail
    549efeaa96d8 MIPS: SNI: Fix spurious interrupts
    73d58890be30 fbcon: Fix user font detection test at fbcon_resize().
    b7b136191170 perf test: Free formats for perf pmu parse test
    b116e2d37b03 perf parse-event: Fix memory leak in evsel->unit
    43d9473e7cd9 perf evlist: Fix cpu/thread map leak
    751930560ea4 MIPS: SNI: Fix MIPS_L1_CACHE_SHIFT
    b86434c072d4 perf test: Fix the "signal" test inline assembly
    e03e0498b453 Drivers: hv: vmbus: Add timeout to vmbus_wait_for_unload
    cdf990e2b24e arm64: Allow CPUs unffected by ARM erratum 1418040 to come in late
    09aadf403225 scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
    9afe75149419 Drivers: hv: vmbus: hibernation: do not hang forever in vmbus_bus_resume()
    b12029411b25 ASoC: meson: axg-toddr: fix channel order on g12 platforms
    600cafd55bfd powerpc/book3s64/radix: Fix boot failure with large amount of guest memory
    f6d4afd008a6 ASoC: qcom: common: Fix refcount imbalance on error
    911c69245a27 ASoC: qcom: Set card->owner to avoid warnings
    cf111e31eae6 clk: rockchip: Fix initialization of mux_pll_src_4plls_p
    af8f780eee47 clk: davinci: Use the correct size when allocating memory
    d81d1306d6c9 KVM: MIPS: Change the definition of kvm type
    88a637d56567 spi: Fix memory leak on splited transfers
    9f09e86200fd i2c: algo: pca: Reapply i2c bus settings after reset
    78d48322dd54 f2fs: Return EOF on unaligned end of file DIO read
    e34313d1b7e9 f2fs: fix indefinite loop scanning for free nid
    7f07bbf9bc16 block: only call sched requeue_request() for scheduled requests
    373312e8513c nvme-tcp: cancel async events before freeing event struct
    89669cae6de8 nvme-rdma: cancel async events before freeing event struct
    103e82d5e82b nvme-fc: cancel async events before freeing event struct
    4951def1e258 openrisc: Fix cache API compile issue when not inlining
    5dda8b9b6ad7 cifs: fix DFS mount with cifsacl/modefromsid
    72efc1488dad rapidio: Replace 'select' DMAENGINES 'with depends on'
    b85406bf1bd7 SUNRPC: stop printk reading past end of string
    7b8fb2a4d373 NFS: Zero-stateid SETATTR should first return delegation
    7fa3ef52032e spi: spi-loopback-test: Fix out-of-bounds read
    8aeb6173e87f regulator: pwm: Fix machine constraints application
    618fcfb5e3f3 scsi: lpfc: Fix FLOGI/PLOGI receive race condition in pt2pt discovery
    f8f1eea08820 scsi: libfc: Fix for double free()
    4a9e028f6db0 scsi: pm8001: Fix memleak in pm8001_exec_internal_task_abort
    db081ee4d8c0 NFSv4.1 handle ERR_DELAY error reclaiming locking state on delegation recall
    9b6caf4ccb44 firmware_loader: fix memory leak for paged buffer
    51fe5c82c759 hv_netvsc: Remove "unlikely" from netvsc_select_queue
    78607d494c92 net: handle the return value of pskb_carve_frag_list() correctly
    b3dacce5025c dsa: Allow forwarding of redirected IGMP traffic
    cd171c18d3d5 e1000e: Add support for Comet Lake
    a73e9ea38d5d RDMA/bnxt_re: Restrict the max_gids to 256
    29dd419f56fc gfs2: initialize transaction tr_ailX_lists earlier
    bdc3a8f6a8e8 Linux 5.4.66
    d3c2b7d2856c gcov: add support for GCC 10.1
    fe79f1cf177a drm/msm: Disable the RPTR shadow
    8cbe9b765487 drm/msm/gpu: make ringbuffer readonly
    ebd9aff7b62a usb: typec: ucsi: acpi: Check the _DEP dependencies
    848eeb75c81d usb: Fix out of sync data toggle if a configured device is reconfigured
    224fa057d72a USB: serial: option: add support for SIM7070/SIM7080/SIM7090 modules
    dbbb21384fe6 USB: serial: option: support dynamic Quectel USB compositions
    38e75a99b486 USB: serial: ftdi_sio: add IDs for Xsens Mti USB converter
    70a9c0352e21 usb: core: fix slab-out-of-bounds Read in read_descriptors
    83db8dd32b1d phy: qcom-qmp: Use correct values for ipq8074 PCIe Gen2 PHY init
    524e525fa73e staging: greybus: audio: fix uninitialized value issue
    3aa4c49c8d41 video: fbdev: fix OOB read in vga_8planes_imageblit()
    9dd48c399a81 ARM: dts: vfxxx: Add syscon compatible with OCOTP
    323159acb2b5 debugfs: Fix module state check condition
    41b2ea7a6a11 KVM: fix memory leak in kvm_io_bus_unregister_dev()
    d334a67d3ed0 KVM: arm64: Do not try to map PUDs when they are folded into PMD
    a86743ebe680 KVM: VMX: Don't freeze guest when event delivery causes an APIC-access exit
    087b6cb17df5 vgacon: remove software scrollback support
    0d123a8c64fd fbcon: remove now unusued 'softback_lines' cursor() argument
    cf5a7ded5365 fbcon: remove soft scrollback code
    a0f6bdafaa4c RDMA/mlx4: Read pkey table length instead of hardcoded value
    616a0c13e432 RDMA/rxe: Fix the parent sysfs read when the interface has 15 chars
    ea3d3bf85669 rbd: require global CAP_SYS_ADMIN for mapping and unmapping
    c2fb443bde82 mmc: sdhci-of-esdhc: Don't walk device-tree on every interrupt
    c724eb78c1ec mmc: sdio: Use mmc_pre_req() / mmc_post_req()
    becb3bbb2911 drm/msm: Disable preemption on all 5xx targets
    404ab35baae4 drm/tve200: Stabilize enable/disable
    701b385f6877 drm/i915/gvt: do not check len & max_len for lri
    a5bfcf2455d4 scsi: target: iscsi: Fix hang in iscsit_access_np() when getting tpg->np_login_sem
    fa4372668f58 scsi: target: iscsi: Fix data digest calculation
    a467624aef02 regulator: core: Fix slab-out-of-bounds in regulator_unlock_recursive()
    dfbb9cea5a4b regulator: plug of_node leak in regulator_register()'s error path
    047a71ff5e9d regulator: push allocation in set_consumer_device_supply() out of lock
    31d89652c384 regulator: push allocations in create_regulator() outside of lock
    e7249ceb7ff8 regulator: push allocation in regulator_init_coupling() outside of lock
    b9fb631f6b03 kobject: Restore old behaviour of kobject_del(NULL)
    b85c64a7161f btrfs: fix wrong address when faulting in pages in the search ioctl
    524f3f303079 btrfs: fix lockdep splat in add_missing_dev
    1aaceffa5ace btrfs: require only sector size alignment for parent eb bytenr
    c570a3d660a2 staging: wlan-ng: fix out of bounds read in prism2sta_probe_usb()
    e9f7332b0040 iio:accel:mma8452: Fix timestamp alignment and prevent data leak.
    a6dc50f30129 iio:accel:mma7455: Fix timestamp alignment and prevent data leak.
    e94ec7f512cf iio: accel: kxsd9: Fix alignment of local buffer.
    b040ac56b264 iio:chemical:ccs811: Fix timestamp alignment and prevent data leak.
    cd1a2517b35e iio:light:max44000 Fix timestamp alignment and prevent data leak.
    176fb9423ab8 iio:magnetometer:ak8975 Fix alignment and data leak issues.
    c4b67a1dcba0 iio:adc:ti-adc081c Fix alignment and data leak issues
    e691d264ddf9 iio:adc:max1118 Fix alignment of timestamp and data leak issues
    24c4430c9b18 iio:adc:ina2xx Fix timestamp alignment issue.
    de2fa1f48a52 iio:adc:ti-adc084s021 Fix alignment and data leak issues.
    13a76aae01c7 iio:accel:bmc150-accel: Fix timestamp alignment and prevent data leak.
    66b8b8f75e35 iio:proximity:mb1232: Fix timestamp alignment and prevent data leak.
    0616d908aef5 iio:light:ltr501 Fix timestamp alignment issue.
    c80210735f31 iio: cros_ec: Set Gyroscope default frequency to 25Hz
    c71e70a85b4b iio: adc: ti-ads1015: fix conversion when CONFIG_PM is not set
    d4bdcf4f1154 gcov: Disable gcov build with GCC 10
    104bc6027b27 iommu/amd: Do not use IOMMUv2 functionality when SME is active
    cab731c6c873 drm/amdgpu: Fix bug in reporting voltage for CIK
    d6ccea92b1e1 ALSA: hda: fix a runtime pm issue in SOF when integrated GPU is disabled
    56117aa69301 ALSA: hda: hdmi - add Rocketlake support
    ff37a2636464 arm64/module: set trampoline section flags regardless of CONFIG_DYNAMIC_FTRACE
    2423f3a7ef52 cpufreq: intel_pstate: Fix intel_pstate_get_hwp_max() for turbo disabled
    1f1169474803 cpufreq: intel_pstate: Refuse to turn off with HWP enabled
    b011e41a8e48 ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
    82d4cfa185a9 HID: elan: Fix memleak in elan_input_configured
    bc818ce2d51e drivers/net/wan/hdlc_cisco: Add hard_header_len
    052750976d03 HID: microsoft: Add rumble support for the 8bitdo SN30 Pro+ controller
    52fa4a63ab14 HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for all Saitek X52 devices
    9eef311eb524 nvme-pci: cancel nvme device request before disabling
    068f73f767a1 nvme-rdma: fix reset hang if controller died in the middle of a reset
    d409ed019236 nvme-rdma: fix timeout handler
    9cf1ee492f23 nvme-rdma: serialize controller teardown sequences
    bb018c73500b nvme-tcp: fix reset hang if controller died in the middle of a reset
    34b1b26b2d8f nvme-tcp: fix timeout handler
    7abff44756fe nvme-tcp: serialize controller teardown sequences
    7598a9d0a756 nvme: have nvme_wait_freeze_timeout return if it timed out
    35d841908c0b nvme-fabrics: don't check state NVME_CTRL_NEW for request acceptance
    f9af5758b19b nvmet-tcp: Fix NULL dereference when a connect data comes in h2cdata pdu
    6ce06caf6b44 irqchip/eznps: Fix build error for !ARC700 builds
    41ac2e8a6a1f xfs: initialize the shortform attr header padding entry
    a33cab0fbd2f cfg80211: Adjust 6 GHz frequency to channel conversion
    0aa356dde967 drivers/net/wan/lapbether: Set network_header before transmitting
    e91f2ec0bfbd xfs: fix off-by-one in inode alloc block reservation calculation
    983efe173e37 net: hns3: Fix for geneve tx checksum bug
    cb54984b7989 drivers/dma/dma-jz4780: Fix race condition between probe and irq handler
    bcdbb7c8c7f9 ALSA: hda/tegra: Program WAKEEN register for Tegra
    ad360686fcd2 ALSA: hda: Fix 2 channel swapping for Tegra
    1518c24b3265 firestream: Fix memleak in fs_open
    818c725c1241 NFC: st95hf: Fix memleak in st95hf_in_send_cmd
    0faee7f8c236 drivers/net/wan/lapbether: Added needed_tailroom
    59d2b1e5cb05 netfilter: conntrack: allow sctp hearbeat after connection re-use
    444bf09f2be4 dmaengine: acpi: Put the CSRT table after using it
    89c4339c4d35 ARC: HSDK: wireup perf irq
    75a81be8fb3e arm64: dts: ns2: Fixed QSPI compatible string
    cd0ffeb0b879 ARM: dts: BCM5301X: Fixed QSPI compatible string
    8a9383e277e4 ARM: dts: NSP: Fixed QSPI compatible string
    7a1e2c816acc ARM: dts: bcm: HR2: Fixed QSPI compatible string
    0f632bc48355 IB/isert: Fix unaligned immediate-data handling
    6736317f350a block: Set same_page to false in __bio_try_merge_page if ret is false
    45ffad151bae spi: stm32: fix pm_runtime_get_sync() error checking
    9ed3ab0c62d4 nvme-fabrics: allow to queue requests for live queues
    43b3d09c5142 spi: stm32: Rate-limit the 'Communication suspended' message
    15dc0695a3b0 mmc: sdhci-msm: Add retries when all tuning phases are found valid
    5bead6811610 mmc: sdhci-acpi: Clear amd_sdhci_host on reset
    c46eabd1e6cc drm/sun4i: backend: Disable alpha on the lowest plane on the A20
    f3c982d8e60a drm/sun4i: backend: Support alpha property on lowest plane
    fe0278843b64 soundwire: fix double free of dangling pointer
    122cdbd5019f scsi: mpt3sas: Don't call disable_irq from IRQ poll handler
    aa204e20f4d4 scsi: megaraid_sas: Don't call disable_irq from process IRQ poll
    0b4662709ced RDMA/core: Fix reported speed and width
    b3f6c2ca326b scsi: libsas: Set data_dir as DMA_NONE if libata marks qc as NODATA
    5571056a5805 iio: adc: mcp3422: fix locking scope
    f7db02316a00 iio: adc: mcp3422: fix locking on error path
    376bc3643eeb drm/sun4i: Fix dsi dcs long write function
    af0d98184575 arm64: dts: imx8mq: Fix TMU interrupt property
    ddd3698271da drm/sun4i: add missing put_device() call in sun8i_r40_tcon_tv_set_mux()
    1a2d6e722b49 RDMA/bnxt_re: Do not report transparent vlan from QP1
    aaca68671376 RDMA/rxe: Fix panic when calling kmem_cache_create()
    d1878b298fc6 RDMA/rxe: Drop pointless checks in rxe_init_ports
    ca337b53fff3 RDMA/rxe: Fix memleak in rxe_mem_init_user
    af2e06b02575 ARM: dts: imx7ulp: Correct gpio ranges
    ab56ed56f8c8 ARM: dts: ls1021a: fix QuadSPI-memory reg range
    d5763bbf8664 selftests/timers: Turn off timeout setting
    6a2be713c78f ARM: dts: socfpga: fix register entry for timer3 on Arria10
    25915590865c regulator: remove superfluous lock in regulator_resolve_coupling()
    69163464bcd3 regulator: push allocation in regulator_ena_gpio_request() out of lock
    e9019af9b0cc ARM: dts: logicpd-som-lv-baseboard: Fix missing video
    678cde6f4e2b ARM: dts: logicpd-som-lv-baseboard: Fix broken audio
    06fb37a1725d ARM: dts: logicpd-torpedo-baseboard: Fix broken audio

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eae616c0cca482a3ce720de3d7d1caded9f79942)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 22fc6f3881..4e7d9162c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7845a542e9defb056524ac7b362a9fd2eb3fd0c7"
-SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
+SRCREV_machine ?= "c0b26698464b75654e2fd1a1fd9231d2cbb0fa88"
+SRCREV_meta ?= "60baed909b5629b59c42cdc7013765c753143e04"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.65"
+LINUX_VERSION ?= "5.4.67"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index c6e5bff052..989fff1354 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.65"
+LINUX_VERSION ?= "5.4.67"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c7da9d62e37698db556ccb45f20b6a7953769793"
-SRCREV_machine ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
+SRCREV_machine_qemuarm ?= "d4dc6b3d3702783af555accd4a4b04b791ec4650"
+SRCREV_machine ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_meta ?= "60baed909b5629b59c42cdc7013765c753143e04"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ce6188ca6a..4b1552618d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ea89b3a28f6a28c4c158ca3d64c2df4dd68321ed"
-SRCREV_machine_qemuarm64 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_machine_qemumips ?= "d1f9cfb34040a4fc2d7a6827a27893aaa6b434e6"
-SRCREV_machine_qemuppc ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_machine_qemuriscv64 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_machine_qemux86 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_machine_qemux86-64 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_machine_qemumips64 ?= "362db79de010ca86e7e75fa468083ffbd6006e54"
-SRCREV_machine ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
-SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
+SRCREV_machine_qemuarm ?= "1cacaf327a609eac95b810a47b5178ef508a6984"
+SRCREV_machine_qemuarm64 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_machine_qemumips ?= "463a664b0d3b215fb4a083561a2420b26ef6be2e"
+SRCREV_machine_qemuppc ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_machine_qemuriscv64 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_machine_qemux86 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_machine_qemux86-64 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_machine_qemumips64 ?= "2bbd27680546f778a06d45cc13ebc26c219bd5bd"
+SRCREV_machine ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
+SRCREV_meta ?= "60baed909b5629b59c42cdc7013765c753143e04"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.65"
+LINUX_VERSION ?= "5.4.67"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

