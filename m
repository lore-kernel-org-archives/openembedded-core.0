Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71683C6377C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.9943.1650471889347408054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AmJUOP2W;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id b17so1689170qvp.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svxBi2FjTdg4D+a3aQ7xHFl4N0xvX5MgO7BV+YKOOyk=;
        b=AmJUOP2WlaUJmOT+KF2QkWIUm22PaALdw5Um7WCyAKVa/7o9v/QOEx/1m0CAZspDyI
         AICz/Q319CVMoDXdievwzvtVk3rJvhOP6eoqpnTtgUHCtJ6bkpT7EoLr0CcFdV4VAj3F
         SEKGhiWjrMOV6cF1k4dlueNztYBI7zQhOpvRCc8fFNtQrugJ5CQnfLPRKuKcoKeItHCJ
         KJdTxyyqqqNY3gVwml+T9x3TI7+ocMXUA2owvkPKJZ1ZgU2wLM/yz6LdQlGaa+CtRNxA
         qgMv8lvvejAvxrIsQTDO/Fq3cGRAoQnc0HfPkV5DYyNFnpjaYpv/ICl1RupkATXVp7Of
         si8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svxBi2FjTdg4D+a3aQ7xHFl4N0xvX5MgO7BV+YKOOyk=;
        b=K4je+XOdvHsUnFf2fvtVtnGGHgAZcNN35StpzzUy9INOn3Pjqb4b/LMpRCrFntKFtB
         konUXHtDXRBeszufLp7xkcLeb4LDPt3szdV6Wyfyjk6ECunxwrvoTx0sr+uYqCtlAONk
         RnwwvbdE55g/5li9ZqctQJrOYSG9mGjwXCHgGLWXYsdMWACec2+wy/IgGSGL2qNUuzfH
         VpR+mAmMsmc6STFi2vCnAQ1EGDOalqVGcgmPHNTbAu4b2gZMBIuWR7Gc87iDTmGpwVkq
         avKlXBdTn2pQ9BjMry9TCXwbV9UWTNeYO3TEUPfKLZz1Tq8MWbISRlFED751i3kC+oVF
         QY6Q==
X-Gm-Message-State: AOAM5329fSClWwEJNA1eyGJasV2HhEjdqg87uy/Ah6eoOAIDUfepqXRQ
	a5zCQ6ban3thVk9ak3RVVWs=
X-Google-Smtp-Source: 
 ABdhPJzMx9st5zJWRii0XM7BwlGMNgPzQQnmDKHKv7fEaWisimTaDNe6ytooUTo5+N4yTJ1Qqp8ZyQ==
X-Received: by 2002:ad4:5be1:0:b0:430:c99:8a87 with SMTP id
 k1-20020ad45be1000000b004300c998a87mr15990830qvc.82.1650471888285;
        Wed, 20 Apr 2022 09:24:48 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 l19-20020a37f513000000b0069c5807ff10sm1657236qkk.27.2022.04.20.09.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:24:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5][dunfell] linux-yocto/5.4: update to v5.4.182
Date: Wed, 20 Apr 2022 12:24:41 -0400
Message-Id: <20220420162445.56096-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164711

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    866ae42cf478 Linux 5.4.182
    fb2bbb7d3021 fget: clarify and improve __fget_files() implementation
    d6a29ce52a79 memblock: use kfree() to release kmalloced memblock regions
    5d9453bf4126 Revert "drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/ACR"
    1fb051bbbce3 gpio: tegra186: Fix chip_data type confusion
    2782b05d0208 tty: n_gsm: fix NULL pointer access due to DLCI release
    c03a49581417 tty: n_gsm: fix proper link termination after failed open
    912144e8a3b0 tty: n_gsm: fix encoding of control signal octet bit DV
    1879db4f2521 xhci: Prevent futile URB re-submissions due to incorrect return value.
    80922d7b52b0 xhci: re-initialize the HC during resume if HCE was set
    0139a10090da usb: dwc3: gadget: Let the interrupt handler disable bottom halves.
    6e74aebbf78b usb: dwc3: pci: Fix Bay Trail phy GPIO mappings
    ba3e83e5a0b4 USB: serial: option: add Telit LE910R1 compositions
    92ac25b79d5d USB: serial: option: add support for DW5829e
    40256addf566 tracefs: Set the group ownership in apply_options() not parse_options()
    6b23eda98923 USB: gadget: validate endpoint index for xilinx udc
    9ab652d41dea usb: gadget: rndis: add spinlock for rndis response list
    39848d7e4ea6 Revert "USB: serial: ch341: add new Product ID for CH341A"
    7c453de366c3 ata: pata_hpt37x: disable primary channel on HPT371
    a28f8dbd474a iio: Fix error handling for PM
    8fff0310e66c iio: adc: ad7124: fix mask used for setting AIN_BUFP & AIN_BUFM bits
    ce1076b33e29 iio: adc: men_z188_adc: Fix a resource leak in an error handling path
    cb90ab3f0997 tracing: Have traceon and traceoff trigger honor the instance
    901206f71e6a RDMA/ib_srp: Fix a deadlock
    b7e2b91fcb5c configfs: fix a race in configfs_{,un}register_subsystem()
    df14d2bed8e2 spi: spi-zynq-qspi: Fix a NULL pointer dereference in zynq_qspi_exec_mem_op()
    a62f4266d572 net/mlx5: Fix wrong limitation of metadata match on ecpf
    45618e915757 net/mlx5: Fix possible deadlock on rule deletion
    53026346a94c netfilter: nf_tables: fix memory leak during stateful obj update
    5ad5886f85b6 nfp: flower: Fix a potential leak in nfp_tunnel_add_shared_mac()
    dfe537b0c94e net: Force inlining of checksum functions in net/checksum.h
    eee01c88c90f net: ll_temac: check the return value of devm_kmalloc()
    fc92a14fa076 net/mlx5e: Fix wrong return value on ioctl EEPROM query failure
    3cbf1f98d893 drm/edid: Always set RGB444
    d0251c38dff8 openvswitch: Fix setting ipv6 fields causing hw csum failure
    2b3cdd70ea5f gso: do not skip outer ip header in case of ipip and net_failover
    0240bb276fd6 tipc: Fix end of loop tests for list_for_each_entry()
    2ed132637619 net: __pskb_pull_tail() & pskb_carve_frag_list() drop_monitor friends
    97a6c07d6ff4 bpf: Do not try bpf_msg_push_data with len 0
    dffce58f6f75 perf data: Fix double free in perf_session__delete()
    3174b09fe16c ping: remove pr_err from ping_lookup
    767099f0ec5b lan743x: fix deadlock in lan743x_phy_link_status_change()
    5d76e0b69da9 optee: use driver internal tee_context for some rpc
    0e526f533f35 tee: export teedev_open() and teedev_close_context()
    64e0b5894c81 x86/fpu: Correct pkru/xstate inconsistency
    49c011a44edd netfilter: nf_tables_offload: incorrect flow offload action array size
    49a4536a46ed USB: zaurus: support another broken Zaurus
    b95d71abeb7d sr9700: sanity check for packet length
    d0dac454b9e3 drm/amdgpu: disable MMHUB PG for Picasso
    eb88a38831e5 parisc/unaligned: Fix ldw() and stw() unalignment handlers
    b783ef3eb66a parisc/unaligned: Fix fldd and fstd unaligned handlers on 32-bit kernel
    0b608b3392c4 vhost/vsock: don't check owner in vhost_vsock_stop() while releasing
    dd0de3510240 clk: jz4725b: fix mmc0 clock gating
    d1f1de5dff78 cgroup/cpuset: Fix a race between cpuset_attach() and cpu hotplug
    b6e8856b8a5f Linux 5.4.181
    3e73b02af6c3 kconfig: fix failing to generate auto.conf
    90c0d3cc676f net: macb: Align the dma and coherent dma masks
    f1c3f41245d8 net: usb: qmi_wwan: Add support for Dell DW5829e
    6b364ca4814a tracing: Fix tp_printk option related with tp_printk_stop_on_boot
    8bf73d5ea94a drm/rockchip: dw_hdmi: Do not leave clock enabled in error case
    5a21d5072300 ata: libata-core: Disable TRIM on M88V29
    41da91158ed9 kconfig: let 'shell' return enough output for deep path names
    913932a306f0 arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610
    d2fd1c7804e8 arm64: dts: meson-g12: add ATF BL32 reserved-memory region
    daa868080996 arm64: dts: meson-gx: add ATF BL32 reserved-memory region
    ba4b40356abd netfilter: conntrack: don't refresh sctp entries in closed state
    d4de2bbcbc91 irqchip/sifive-plic: Add missing thead,c900-plic match string
    2d7a327a129e ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of
    fff21185f598 ARM: OMAP2+: hwmod: Add of_node_put() before break
    3deabc3f60fd KVM: x86/pmu: Use AMD64_RAW_EVENT_MASK for PERF_TYPE_RAW
    fe595759c2a4 Drivers: hv: vmbus: Fix memory leak in vmbus_add_channel_kobj
    ba71b1b30d85 i2c: brcmstb: fix support for DSL and CM variants
    6f08452c560d copy_process(): Move fd_install() out of sighand->siglock critical section
    e52dfd2a4906 dmaengine: sh: rcar-dmac: Check for error num after setting mask
    c83049cb8817 net: sched: limit TC_ACT_REPEAT loops
    87c575d2a238 lib/iov_iter: initialize "flags" in new pipe_buffer
    091dac5c6392 EDAC: Fix calculation of returned address and next offset in edac_align_ptr()
    f0c2c023c226 scsi: lpfc: Fix pt2pt NVMe PRLI reject LOGO loop
    56f9abba9805 mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC status
    bdc70b603da9 mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
    3758a570762e NFS: Do not report writeback errors in nfs_getattr()
    357d42d593fc NFS: LOOKUP_DIRECTORY is also ok with symlinks
    20f4ee3c3340 block/wbt: fix negative inflight counter when remove scsi device
    4cd3281a910a mtd: rawnand: gpmi: don't leak PM reference in error path
    c6fee7c8546a powerpc/lib/sstep: fix 'ptesync' build error
    edfac6b77bc2 ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_range()
    d6d8d1db8094 ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw()
    99c2b13ce951 ALSA: hda: Fix missing codec probe on Shenker Dock 15
    2b2b531ceba9 ALSA: hda: Fix regression on forced probe mask option
    aca7e5b6a500 libsubcmd: Fix use-after-free for realloc(..., 0)
    7af6164ceefe bonding: fix data-races around agg_select_timer
    aeb993412eb2 drop_monitor: fix data-race in dropmon_net_event / trace_napi_poll_hit
    db3ffc5d332e bonding: force carrier update when releasing slave
    fb8c98f92ad3 ping: fix the dif and sdif check in ping_lookup
    8198c4d4c2f8 net: ieee802154: ca8210: Fix lifs/sifs periods
    a06440508acd net: dsa: lan9303: fix reset on probe
    73f8575216b1 netfilter: nft_synproxy: unregister hooks on init error path
    5e8c5b217cfb iwlwifi: pcie: gen2: fix locking when "HW not ready"
    e1d0e738b02e iwlwifi: pcie: fix locking when "HW not ready"
    902528183f4d mmc: block: fix read single on recovery logic
    5f326fe2aef4 vsock: remove vsock from connected table when connect is interrupted by a signal
    f48a38703c11 dmaengine: at_xdmac: Start transfer for cyclic channels in issue_pending
    41ce06a3ec6a taskstats: Cleanup the use of task->exit_code
    8583d2ea90fe ext4: prevent partial update of the extent blocks
    d57fcf0d9195 ext4: check for inconsistent extents between index and leaf block
    6a332d095ce4 ext4: check for out-of-order index extents in ext4_valid_extent_entries()
    13f6ebef03b0 drm/radeon: Fix backlight control on iMac 12,1
    494de920d98f iwlwifi: fix use-after-free
    6194b4689731 arm64: module/ftrace: intialize PLT at load time
    adcc4b795f4c arm64: module: rework special section handling
    dfe928f16cc5 module/ftrace: handle patchable-function-entry
    30af4dcfa8b4 ftrace: add ftrace_init_nop()
    42c8cccf83d5 Revert "module, async: async_synchronize_full() on module init iff async is used"
    5c7726bd5736 drm/amdgpu: fix logic inversion in check
    d411b2a5da68 nvme-rdma: fix possible use-after-free in transport error_recovery work
    61a26ffd5ad3 nvme-tcp: fix possible use-after-free in transport error_recovery work
    70356b756a58 nvme: fix a possible use-after-free in controller reset during load
    89d2bd13252a quota: make dquot_quota_sync return errors from ->sync_fs
    f124d9eff984 vfs: make freeze_super abort when sync_filesystem returns error
    cfc8b37ef041 ax25: improve the incomplete fix to avoid UAF and NPD bugs
    dd2fcac324ea selftests/zram: Adapt the situation that /dev/zram0 is being used
    c3a9afa82493 selftests/zram01.sh: Fix compression ratio calculation
    8d1c50c8683e selftests/zram: Skip max_comp_streams interface on newer kernel
    455ef08d6e54 net: ieee802154: at86rf230: Stop leaking skb's
    3bd8bebb16fe selftests: rtc: Increase test timeout so that all tests run
    bc6ac6c0f67d platform/x86: ISST: Fix possible circular locking dependency detected
    bd6492930a10 btrfs: send: in case of IO error log it
    3ff48a67ed65 parisc: Fix sglist access in ccio-dma.c
    efccc9b0c7e2 parisc: Fix data TLB miss in sba_unmap_sg
    3434d8837fe9 parisc: Drop __init from map_pages declaration
    bd282ee53e34 serial: parisc: GSC: fix build when IOSAPIC is not set
    9d2aad133b22 Revert "svm: Add warning message for AVIC IPI invalid target"
    190272552099 HID:Add support for UGTABLET WP5540
    866a85813b92 Makefile.extrawarn: Move -Wunaligned-access to W=1
    7b3eb66d0daf Linux 5.4.180
    9d09cb110868 ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE
    a2ed7b29d067 perf: Fix list corruption in perf_cgroup_switch()
    f79cbf75ac76 scsi: lpfc: Remove NVMe support if kernel has NVME_FC disabled
    a1a018e2a068 hwmon: (dell-smm) Speed up setting of fan speed
    1e30073c0e55 seccomp: Invalidate seccomp mode to catch death failures
    a3769078c945 USB: serial: cp210x: add CPI Bulk Coin Recycler id
    fade0cbf6682 USB: serial: cp210x: add NCR Retail IO box id
    697b9ed28b39 USB: serial: ch341: add support for GW Instek USB2.0-Serial devices
    ed4fddac9d7c USB: serial: option: add ZTE MF286D modem
    f729dfd364b8 USB: serial: ftdi_sio: add support for Brainboxes US-159/235/320
    f297b6109cbe usb: gadget: f_uac2: Define specific wTerminalType
    c9e952871ae4 usb: gadget: rndis: check size of RNDIS_MSG_SET command
    38fd68f55a7e USB: gadget: validate interface OS descriptor requests
    3054dfef06a7 usb: gadget: udc: renesas_usb3: Fix host to USB_ROLE_NONE transition
    8f032eaebc2f usb: dwc3: gadget: Prevent core from processing stale TRBs
    3a9953b2806c usb: ulpi: Call of_node_put correctly
    12ab57a21372 usb: ulpi: Move of_node_put to ulpi_dev_release
    a0fd5492ee76 net: usb: ax88179_178a: Fix out-of-bounds accesses in RX fixup
    3937c35493ee eeprom: ee1004: limit i2c reads to I2C_SMBUS_BLOCK_MAX
    d4dc28db1b98 n_tty: wake up poll(POLLRDNORM) on receiving data
    0e31f914d761 vt_ioctl: add array_index_nospec to VT_ACTIVATE
    ae3d57411562 vt_ioctl: fix array_index_nospec in vt_setactivate
    311c82a68093 net: amd-xgbe: disable interrupts during pci removal
    b3e998a5dc46 tipc: rate limit warning for received illegal binding update
    e7daad5c28ad net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
    c99e66350ca0 veth: fix races around rq->rx_notify_masked
    a80817adc2a4 net: fix a memleak when uncloning an skb dst and its metadata
    0b6087c63586 net: do not keep the dst cache when uncloning an skb dst and its metadata
    3f41ec8c830e nfp: flower: fix ida_idx not being released
    16dcfde98a25 ipmr,ip6mr: acquire RTNL before calling ip[6]mr_free_table() on failure path
    4bcfbec337cf bonding: pair enable_port with slave_arr_updates
    e432f25c77a2 ixgbevf: Require large buffers for build_skb on 82599VF
    4e6fd2b5fcf8 misc: fastrpc: avoid double fput() on failed usercopy
    c9fc422c9a43 usb: f_fs: Fix use-after-free for epfile
    336222182a3b ARM: dts: imx6qdl-udoo: Properly describe the SD card detect
    94888cf75535 staging: fbtft: Fix error path in fbtft_driver_module_init()
    2650ed47077b ARM: dts: meson: Fix the UART compatible strings
    4ccb639bde50 perf probe: Fix ppc64 'perf probe add events failed' case
    b4a59eafcbc5 net: bridge: fix stale eth hdr pointer in br_dev_xmit
    b55a0cdbec5b PM: s2idle: ACPI: Fix wakeup interrupts handling
    e37a2a6b52d4 ACPI/IORT: Check node revision for PMCG resources
    153d0f357b12 nvme-tcp: fix bogus request completion when failing to send AER
    a44ca4038725 ARM: socfpga: fix missing RESET_CONTROLLER
    8a0bad445a50 ARM: dts: imx23-evk: Remove MX23_PAD_SSP1_DETECT from hog group
    9d5e5832ffe7 riscv: fix build with binutils 2.38
    c230f6ba1011 bpf: Add kconfig knob for disabling unpriv bpf by default
    e2424c010a98 KVM: nVMX: eVMCS: Filter out VM_EXIT_SAVE_VMX_PREEMPTION_TIMER
    a437c524394c net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
    032065cc5b6c usb: dwc2: gadget: don't try to disable ep0 in dwc2_hsotg_suspend
    0863dedf58c8 PM: hibernate: Remove register_nosave_region_late()
    5c5ceea00c8c scsi: myrs: Fix crash in error case
    7cc32ff0cd6c scsi: qedf: Fix refcount issue when LOGO is received during TMF
    c6a7077144ed scsi: target: iscsi: Make sure the np under each tpg is unique
    9babdef28879 net: sched: Clarify error message when qdisc kind is unknown
    978264fbc524 drm: panel-orientation-quirks: Add quirk for the 1Netbook OneXPlayer
    162e8d788545 NFSv4 expose nfs_parse_server_name function
    852c95db75a7 NFSv4 remove zero number of fs_locations entries error check
    75e67eed756a NFSv4.1: Fix uninitialised variable in devicenotify
    6efe39614039 nfs: nfs4clinet: check the return value of kstrdup()
    2acac498a507 NFSv4 only print the label when its queried
    891c4ebf3b94 nvme: Fix parsing of ANA log page
    d7d345c80727 NFSD: Fix offset type in I/O trace points
    34217d7730b9 NFSD: Clamp WRITE offsets
    5fde7ca7b17d NFS: Fix initialisation of nfs_client cl_flags field
    09295a989319 net: phy: marvell: Fix MDI-x polarity setting in 88e1118-compatible PHYs
    f84d17e6dd90 net: phy: marvell: Fix RGMII Tx/Rx delays setting in 88e1121-compatible PHYs
    60027834114d mmc: sdhci-of-esdhc: Check for error num after setting mask
    8a9511fd10ea ima: Do not print policy rule with inactive LSM labels
    89e51f2ab81c ima: Allow template selection with ima_template[_fmt]= after ima_hash=
    0939988b16a4 ima: Remove ima_policy file before directory
    ea58704f06f1 integrity: check the return value of audit_log_start()
    52871671099d Linux 5.4.179
    d692e3406e05 tipc: improve size validations for received domain records
    3a0a7ec5574b moxart: fix potential use-after-free on remove path

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 523ace3e14..b8bd5cbd59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40423bc7ab2cc609f955a3dc16a0d854c1504ce3"
-SRCREV_meta ?= "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
+SRCREV_machine ?= "ca1275f9e3d6f98df59045cdbbbcea68a4919009"
+SRCREV_meta ?= "337c38059f2fd562199b0e5133b71410240004e9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.178"
+LINUX_VERSION ?= "5.4.182"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 35177d4f6c..9f57b8a52a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.178"
+LINUX_VERSION ?= "5.4.182"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f6e09845d8bf3c307da395497b21c1ff17ef575c"
-SRCREV_machine ?= "a7ba52065be4401b5d73b6b020770f7d260b7bf1"
-SRCREV_meta ?= "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
+SRCREV_machine_qemuarm ?= "bf64274799c0c40e46d9b838d4811556e4dd4c99"
+SRCREV_machine ?= "1018938d65e434be727182856c4a18bfa7013906"
+SRCREV_meta ?= "337c38059f2fd562199b0e5133b71410240004e9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 081052d87c..5a6949ee1d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b3ee7c62bf5a5ce3c7e30aff6c3dd9f70a847a28"
-SRCREV_machine_qemuarm64 ?= "bf6581eba15cb43af60fda7053edaf66990c18ac"
-SRCREV_machine_qemumips ?= "05580fff716df568dc3f737b288e0e514a908572"
-SRCREV_machine_qemuppc ?= "0a016b0775980f67d686e47cc8637adec46856dc"
-SRCREV_machine_qemuriscv64 ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
-SRCREV_machine_qemux86 ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
-SRCREV_machine_qemux86-64 ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
-SRCREV_machine_qemumips64 ?= "68f35eeca08d2a681495fd3a7b823ac34d9a97bc"
-SRCREV_machine ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
-SRCREV_meta ?= "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
+SRCREV_machine_qemuarm ?= "c9a67a307feed6f22008fbd5e661d73542b93672"
+SRCREV_machine_qemuarm64 ?= "beb8ea86967232e0594184153d2d6bfaf208ae4d"
+SRCREV_machine_qemumips ?= "30f488f7e446f074aa7925584e3a4653d062e5b6"
+SRCREV_machine_qemuppc ?= "73d9421c2d9075b03fe02d5777f1ef15845a6f60"
+SRCREV_machine_qemuriscv64 ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
+SRCREV_machine_qemux86 ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
+SRCREV_machine_qemux86-64 ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
+SRCREV_machine_qemumips64 ?= "b47369b2a3dda9358cfc06ce7fe3bc9647b67872"
+SRCREV_machine ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
+SRCREV_meta ?= "337c38059f2fd562199b0e5133b71410240004e9"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.178"
+LINUX_VERSION ?= "5.4.182"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


