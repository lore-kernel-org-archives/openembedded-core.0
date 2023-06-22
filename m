Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0529BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 23:22:21 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.25850.1687476133997931682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 16:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZhEgoxXM;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-62ffc10180aso407616d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687476133; x=1690068133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlRuAXLoG19CF2ny/dE2CeZYVcr2XF4Ia2+wn2W2xPo=;
        b=ZhEgoxXMQJCTzlynpvkapwH+kWrC4r6KjHDH+yMlkEGpC/OUfWNkEwdzGx7ElYndgE
         tW0aTZj2k2LVmlZJmr2BfBCmT2eFX7VPwET2T0J4ldrYBgHA71ssC1NwG1BLdCIM+DCW
         wKQ3Xh07OJvZKPwMvQ2OSpnjzPeOKg6g7VXnjkwVL8WR+noHhI989Cp5trcWTOTAL87V
         hcuAK4LOdRvMr78+Nm8ZqKPM+LpnkZFQ5mXNWbi9xyggwzqLfEHe1CtbNxG7tSPX1Blr
         tkdR387ruTQYzs/4lyZQnmObWeJM+rwuwX86Sil7/KNvxAmqLVWjy0mCTn/4WK7ZnQ3q
         w4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687476133; x=1690068133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlRuAXLoG19CF2ny/dE2CeZYVcr2XF4Ia2+wn2W2xPo=;
        b=A/EupPdE4Vc3TXTM1l8sZYR/grfglADzKSdkyt+TEcRefH2IIa/4ffIOf94aR4tN2d
         LBovCcKDV64wAPRauogUFcEYbwGJ9BKjpndQGe/yKDHhvU02RghcXClO75Tl73VKsh0k
         hDyQrvugDOCjeQWbt5Ptf/kdetNWWFRWApsVI7TymxEEB0SH/E+LXdgN56MNZNJ22pEv
         hCfMACh70pA2MTjAm/2H4FmxYEez1LIgB0y5hixSVK7aOc3d9ofQpb0lj0ceqhe55ajH
         eNiQrXkE0DXUj+pCFwT/dlenjEj9MkidnWzcr0v2ZdN2U/8jTNyt9gPd+H1gNsEuKS/m
         Hicw==
X-Gm-Message-State: AC+VfDzaMcyGlfTiYCi7YXsscsf1PwZVN6MaDbhilwIk4DgCP0M5M1nm
	lVbL7BWJNQiWBG3kpqgKmpUZOSva0DmQbw==
X-Google-Smtp-Source: ACHHUZ7NzrRwxpRwMT8EaBr8Co/A1fcHeXEtkvHR8ho+D+PhLqO8kWh1JeUUF7K9PgIszkzJ9w/4yQ==
X-Received: by 2002:a05:6214:20ef:b0:623:a60e:e50 with SMTP id 15-20020a05621420ef00b00623a60e0e50mr26074720qvk.40.1687476132699;
        Thu, 22 Jun 2023 16:22:12 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ce391000000b0062df95d7ef6sm4291625qvl.115.2023.06.22.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:22:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] linux-yocto/5.4: update to v5.4.246
Date: Thu, 22 Jun 2023 19:22:09 -0400
Message-Id: <20230622232211.928913-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 23:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183302

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f568a20f058f Linux 5.4.246
    6c0fc4725f6f drm/edid: fix objtool warning in drm_cvt_modes()
    914bf541c3bb wifi: rtlwifi: 8192de: correct checking of IQK reload
    58bc9baaef92 drm/edid: Fix uninitialized variable in drm_cvt_modes()
    77e442733faa RDMA/bnxt_re: Remove the qp from list only if the qp destroy succeeds
    a616aa258e46 RDMA/bnxt_re: Remove set but not used variable 'dev_attr'
    4ffad598bff4 scsi: dpt_i2o: Do not process completions with invalid addresses
    e2897f133acd scsi: dpt_i2o: Remove broken pass-through ioctl (I2OUSERCMD)
    56a4a9dc5ed1 regmap: Account for register length when chunking
    94f3bc7e84af test_firmware: fix the memory leak of the allocated firmware buffer
    fb7dce686fd1 fbcon: Fix null-ptr-deref in soft_cursor
    5ea6122caf51 ext4: add lockdep annotations for i_data_sem for ea_inode's
    b06346ef5778 ext4: disallow ea_inodes with extended attributes
    ec2a04f8fc9f ext4: set lockdep subclass for the ea_inode in ext4_xattr_inode_cache_find()
    2e636c0c9344 ext4: add EA_INODE checking to ext4_iget()
    d9de088797a0 tracing/probe: trace_probe_primary_from_call(): checked list_first_entry
    7df474125c37 selinux: don't use make's grouped targets feature yet
    b18bc3c9c2c5 tty: serial: fsl_lpuart: use UARTCTRL_TXINV to send break instead of UARTCTRL_SBK
    ae7fb0c8bf80 mmc: vub300: fix invalid response handling
    9d8f5797d791 wifi: rtlwifi: remove always-true condition pointed out by GCC 12
    843f51766784 lib/dynamic_debug.c: use address-of operator on section symbols
    0638dcc7e75f treewide: Remove uninitialized_var() usage
    1eb88dccb827 kernel/extable.c: use address-of operator on section symbols
    d069c7ce3995 eth: sun: cassini: remove dead code
    d04adc383f32 gcc-12: disable '-Wdangling-pointer' warning for now
    253d70232573 ACPI: thermal: drop an always true check
    a010f8e64689 x86/boot: Wrap literal addresses in absolute_pointer()
    f0bb5135553c flow_dissector: work around stack frame size warning
    cd943425c6aa ata: libata-scsi: Use correct device no in ata_find_dev()
    76c67ff783ac scsi: stex: Fix gcc 13 warnings
    cd91ead608f0 misc: fastrpc: reject new invocations during device removal
    bf1d0b84dfd2 misc: fastrpc: return -EPIPE to invocations on device removal
    d5f183881529 usb: gadget: f_fs: Add unbind event before functionfs_unbind
    ac388cbbd97c net: usb: qmi_wwan: Set DTR quirk for BroadMobi BM818
    e101e8160cf0 iio: dac: build ad5758 driver when AD5758 is selected
    a87236446a62 iio: dac: mcp4725: Fix i2c_master_send() return value handling
    c3b25245e3a8 iio: light: vcnl4035: fixed chip ID check
    711049e31e09 HID: wacom: avoid integer overflow in wacom_intuos_inout()
    4251ff7fd4a4 HID: google: add jewel USB id
    f3b4e2a636d1 iio: adc: mxs-lradc: fix the order of two cleanup operations
    030ca3f7b042 mailbox: mailbox-test: fix a locking issue in mbox_test_message_write()
    11b084412055 atm: hide unused procfs functions
    cea581b385ab ALSA: oss: avoid missing-prototype warnings
    384fd08858da netfilter: conntrack: define variables exp_nat_nla_policy and any_addr with CONFIG_NF_NAT
    f7e62f1b7229 wifi: b43: fix incorrect __packed annotation
    8a9035110288 scsi: core: Decrease scsi_device's iorequest_cnt if dispatch failed
    f1e6a1097141 arm64/mm: mark private VM_FAULT_X defines as vm_fault_t
    c87334f4e705 ARM: dts: stm32: add pin map for CAN controller on stm32f7
    a39f24357fdc wifi: rtl8xxxu: fix authentication timeout due to incorrect RCR value
    353fd22693a6 media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221
    66a6d704c251 media: dvb-core: Fix kernel WARNING for blocking operation in wait_event*()
    ed47886a73db media: dvb-core: Fix use-after-free due on race condition at dvb_net
    e9033a425ab2 media: mn88443x: fix !CONFIG_OF error by drop of_match_ptr from ID table
    08b20cb8e5b9 media: ttusb-dec: fix memory leak in ttusb_dec_exit_dvb()
    46e8b0fe538b media: dvb_ca_en50221: fix a size write bug
    b66849f35462 media: netup_unidvb: fix irq init by register it at the end of probe
    88aef84eefb3 media: dvb-usb: dw2102: fix uninit-value in su3000_read_mac_address
    6b9a534ec5cf media: dvb-usb: digitv: fix null-ptr-deref in digitv_i2c_xfer()
    f3c8ed7366cd media: dvb-usb-v2: rtl28xxu: fix null-ptr-deref in rtl28xxu_i2c_xfer
    65033ab2f930 media: dvb-usb-v2: ce6230: fix null-ptr-deref in ce6230_i2c_master_xfer()
    37e36b426197 media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()
    64f1b8296bef media: dvb-usb: az6027: fix three null-ptr-deref in az6027_i2c_xfer()
    d16f5dc3aa09 media: dvb_demux: fix a bug for the continuity counter
    a7c87057f259 ASoC: ssm2602: Add workaround for playback distortions
    619f008df14e xfrm: Check if_id in inbound policy/secpath match
    21ca81704611 ASoC: dwc: limit the number of overrun messages
    acd5f476c16e nbd: Fix debugfs_create_dir error checking
    19ce1e1f348d fbdev: stifb: Fix info entry in sti_struct on error path
    aa32f2fadb4c fbdev: modedb: Add 1920x1080 at 60 Hz video mode
    199f9c5430f9 media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE
    b950966b44f9 ARM: 9295/1: unwind:fix unwind abort for uleb128 case
    a823d8e0bb02 mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()
    29bfbc8a63c4 watchdog: menz069_wdt: fix watchdog initialisation
    0018639be2d9 mtd: rawnand: marvell: don't set the NAND frequency select
    5f0043efdc24 mtd: rawnand: marvell: ensure timing values are written
    6c0aacf1b4e1 net: dsa: mv88e6xxx: Increase wait after reset deactivation
    94a00f1142c5 net/sched: flower: fix possible OOB write in fl_set_geneve_opt()
    dd4b5a204dfa udp6: Fix race condition in udp6_sendmsg & connect
    cd4a37f0dcc9 net/netlink: fix NETLINK_LIST_MEMBERSHIPS length report
    cec562fbf8c5 ocfs2/dlm: move BITS_TO_BYTES() to bitops.h for wider use
    9e6bb63e5e66 net: sched: fix NULL pointer dereference in mq_attach
    2188c0f09532 net/sched: Prohibit regrafting ingress or clsact Qdiscs
    80b20d528a71 net/sched: Reserve TC_H_INGRESS (TC_H_CLSACT) for ingress (clsact) Qdiscs
    321f38375517 net/sched: sch_clsact: Only create under TC_H_CLSACT
    5f67d33c01b3 net/sched: sch_ingress: Only create under TC_H_INGRESS
    381a703220fb tcp: Return user_mss for TCP_MAXSEG in CLOSE/LISTEN state if user_mss set
    32e9a9ee285f tcp: deny tcp_disconnect() when threads are waiting
    26e830858a2b af_packet: do not use READ_ONCE() in packet_bind()
    43f1402dc2e9 mtd: rawnand: ingenic: fix empty stub helper definitions
    dd3773e8c8c9 amd-xgbe: fix the false linkup in xgbe_phy_status
    603eec060d14 af_packet: Fix data-races of pkt_sk(sk)->num.
    bab2f42d8d8a netrom: fix info-leak in nr_write_internal()
    d7aeb591b101 net/mlx5: fw_tracer, Fix event handling
    c7ac3ebf41ee dmaengine: pl330: rename _start to prevent build error
    17d70de57248 iommu/amd: Don't block updates to GATag if guest mode is on
    fa961ad9ef91 iommu/rockchip: Fix unwind goto issue
    5abb81b4d762 RDMA/bnxt_re: Fix return value of bnxt_re_process_raw_qp_pkt_rx
    2bafc7f22db3 RDMA/bnxt_re: Refactor queue pair creation code
    56446791bccd RDMA/bnxt_re: Enable SRIOV VF support on Broadcom's 57500 adapter series
    cc5a673d85a9 RDMA/efa: Fix unsupported page sizes in device
    cf0b1e5482ea Linux 5.4.245
    ec14c6e0a2e5 netfilter: ctnetlink: Support offloaded conntrack entry deletion
    5b7d4d91c047 ipv{4,6}/raw: fix output xfrm lookup wrt protocol
    6c88024cab83 binder: fix UAF caused by faulty buffer cleanup
    e6183912ee90 bluetooth: Add cmd validity checks at the start of hci_sock_ioctl()
    9ba28194ea50 io_uring: have io_kill_timeout() honor the request references
    6de3014d4bd8 io_uring: don't drop completion lock before timer is fully initialized
    b0bfceaa8c0e io_uring: always grab lock in io_cancel_async_work()
    00395fd7f9a0 cdc_ncm: Fix the build warning
    672e59995e70 net/mlx5: Devcom, serialize devcom registration
    f42feb29bad9 net/mlx5: devcom only supports 2 ports
    67637a7ee6bd fs: fix undefined behavior in bit shift for SB_NOUSER
    02281c23d069 power: supply: bq24190: Call power_supply_changed() after updating input current
    f6518954c146 power: supply: core: Refactor power_supply_set_input_current_limit_from_supplier()
    db00ef8fd609 power: supply: bq27xxx: After charger plug in/out wait 0.5s for things to stabilize
    ff484163dfb6 net: cdc_ncm: Deal with too low values of dwNtbOutMaxSize
    a270ca35a949 cdc_ncm: Implement the 32-bit version of NCM Transfer Block
    51d0ac4577c2 Linux 5.4.244
    edec0d399907 3c589_cs: Fix an error handling path in tc589_probe()
    3dfc1004d9af net/mlx5: Devcom, fix error flow in mlx5_devcom_register_device
    c59106f8bca1 net/mlx5: Fix error message when failing to allocate device memory
    8680d838c98c forcedeth: Fix an error handling path in nv_probe()
    b8db4a4e2007 ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
    0099a29bc5a0 x86/show_trace_log_lvl: Ensure stack pointer is aligned, again
    c60f38c9bdcb xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()
    9b13972e4f23 coresight: Fix signedness bug in tmc_etr_buf_insert_barrier_packet()
    f6b610730e8f power: supply: sbs-charger: Fix INHIBITED bit for Status reg
    0c5f4cec7596 power: supply: bq27xxx: Fix poll_interval handling and races on remove
    dafe9136be7b power: supply: bq27xxx: Fix I2C IRQ race on remove
    7b3b11964979 power: supply: bq27xxx: Fix bq27xxx_battery_update() race condition
    96bfafbc7d80 power: supply: leds: Fix blink to LED on transition
    011f47c8b838 ipv6: Fix out-of-bounds access in ipv6_find_tlv()
    120cdad8b2ae bpf: Fix mask generation for 32-bit narrow loads of 64-bit fields
    9928ce5225d6 selftests: fib_tests: mute cleanup error message
    58766252f6b2 net: fix skb leak in __skb_tstamp_tx()
    2b580d0f03c4 media: radio-shark: Add endpoint checks
    a730feb672c7 USB: sisusbvga: Add endpoint checks
    80100e0863e5 USB: core: Add routines for endpoint checks in old drivers
    7e3ae83371a4 udplite: Fix NULL pointer dereference in __sk_mem_raise_allocated().
    9ea0c5f90a27 net: fix stack overflow when LRO is disabled for virtual interfaces
    1522dc58bff8 fbdev: udlfb: Fix endpoint check
    be646802b3dc debugobjects: Don't wake up kswapd from fill_pool()
    4e5a7181a6c3 x86/topology: Fix erroneous smp_num_siblings on Intel Hybrid platforms
    6d091e0ddcf3 parisc: Fix flush_dcache_page() for usage from irq context
    b556618baca5 selftests/memfd: Fix unknown type name build failure
    04aee084a3fa x86/mm: Avoid incomplete Global INVLPG flushes
    a9f5423460a6 btrfs: use nofs when cleaning up aborted transactions
    4f92934d8073 gpio: mockup: Fix mode of debugfs files
    da8adda57984 parisc: Allow to reboot machine after system halt
    43ffe982a304 parisc: Handle kgdb breakpoints only in kernel context
    f7d19a366cd2 m68k: Move signal frame following exception on 68020/030
    8facb9cc168a ALSA: hda/realtek: Enable headset onLenovo M70/M90
    5cc3e698c2bb ALSA: hda/ca0132: add quirk for EVGA X299 DARK
    68e4c390173e mt76: mt7615: Fix build with older compilers
    b558275c1b04 spi: fsl-cpm: Use 16 bit mode for large transfers with even size
    d64a45c019ac spi: fsl-spi: Re-organise transfer bits_per_word adaptation
    aabe8ca79139 watchdog: sp5100_tco: Immediately trigger upon starting.
    aeff9e7e87c1 s390/qdio: fix do_sqbs() inline assembly constraint
    ab196fe70a18 s390/qdio: get rid of register asm
    a4e3c4c65ae8 vc_screen: reload load of struct vc_data pointer in vcs_write() to avoid UAF
    74e644795d37 vc_screen: rewrite vcs_size to accept vc, not inode
    e9399d4ea5ee usb: gadget: u_ether: Fix host MAC address case
    939cafcdf7de usb: gadget: u_ether: Convert prints to device prints
    c8489e0fab18 lib/string_helpers: Introduce string_upper() and string_lower() helpers
    7e15602c5073 HID: wacom: add three styli to wacom_intuos_get_tool_type
    2a12339ce34f HID: wacom: Add new Intuos Pro Small (PTH-460) device IDs
    b5185f1b11c7 HID: wacom: Force pen out of prox if no events have been received in a while
    e0c1b35239d9 netfilter: nf_tables: hold mutex on netns pre_exit path
    6236af6936dd netfilter: nf_tables: validate NFTA_SET_ELEM_OBJREF based on NFT_SET_OBJECT flag
    05b4105e6852 netfilter: nf_tables: stricter validation of element data
    e832e4bae556 netfilter: nf_tables: allow up to 64 bytes in the set element data area
    28fe10236a64 netfilter: nf_tables: add nft_setelem_parse_key()
    eb5b579bd69f netfilter: nf_tables: validate registers coming from userspace.
    cfe1b9719cce netfilter: nftables: statify nft_parse_register()
    7c788393d453 netfilter: nftables: add nft_parse_register_store() and use it
    25336cd96b03 netfilter: nftables: add nft_parse_register_load() and use it
    116d53f09ff5 nilfs2: fix use-after-free bug of nilfs_root in nilfs_evict_inode()
    df89b1753eb1 powerpc/64s/radix: Fix soft dirty tracking
    60b9a9c8f370 tpm/tpm_tis: Disable interrupts for more Lenovo devices
    a33c172c1e34 ceph: force updating the msg pointer in non-split case
    6eb9ed0ab7b5 serial: Add support for Advantech PCI-1611U card
    21f107a95965 statfs: enforce statfs[64] structure initialization
    1eb3e32de7b1 KVM: x86: do not report a vCPU as preempted outside instruction boundaries
    a88638a95407 can: kvaser_pciefd: Disable interrupts in probe error path
    4579e2556767 can: kvaser_pciefd: Do not send EFLUSH command on TFD interrupt
    33d5a0a4985a can: kvaser_pciefd: Clear listen-only bit if not explicitly requested
    e5ac4f12074e can: kvaser_pciefd: Empty SRB buffer in probe
    c0e9fb21b612 can: kvaser_pciefd: Call request_irq() before enabling interrupts
    36cd7601e6b9 can: kvaser_pciefd: Set CAN_STATE_STOPPED in kvaser_pciefd_stop()
    e65811289346 can: j1939: recvmsg(): allow MSG_CMSG_COMPAT flag
    880482525101 ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
    57fd0d122edd ALSA: hda/realtek: Add a quirk for HP EliteDesk 805
    739056188ad3 ALSA: hda: Add NVIDIA codec IDs a3 through a7 to patch table
    4ef155ddf957 ALSA: hda: Fix Oops by 9.1 surround channel names
    4f9c0a7c2726 usb: typec: altmodes/displayport: fix pin_assignment_show
    33b6648d27b8 usb: dwc3: debugfs: Resume dwc3 before accessing registers
    241491524ab0 USB: UHCI: adjust zhaoxin UHCI controllers OverCurrent bit value
    1f36dc41616b usb-storage: fix deadlock when a scsi command timeouts more than once
    7cef7681aa77 USB: usbtmc: Fix direction for 0-length ioctl control messages
    f662f856acec vlan: fix a potential uninit-value in vlan_dev_hard_start_xmit()
    53bf7cda160b igb: fix bit_shift to be in [1..8] range
    e20105d967ab cassini: Fix a memory leak in the error handling path of cas_init_one()
    e519a404a5bb wifi: iwlwifi: mvm: don't trust firmware n_channels
    d0baaadd1c5e net: bcmgenet: Restore phy_stop() depending upon suspend/close
    2cca63d5bc4e net: bcmgenet: Remove phy_stop() from bcmgenet_netif_stop()
    435855b0831b net: nsh: Use correct mac_offset to unwind gso skb in nsh_gso_segment()
    ed50fcab1435 drm/exynos: fix g2d_open/close helper function definitions
    1550bcf2983a media: netup_unidvb: fix use-after-free at del_timer()
    69055f99900b net: hns3: fix reset delay time to avoid configuration timeout
    304e5cb77eb8 net: hns3: fix sending pfc frames after reset issue
    d1bcc606870e erspan: get the proto with the md version for collect_md
    f185ede016c9 ip_gre, ip6_gre: Fix race condition on o_seqno in collect_md mode
    0eb3ec0a3553 ip6_gre: Make o_seqno start from 0 in native mode
    304096241398 ip6_gre: Fix skb_under_panic in __gre6_xmit()
    7525aa211758 serial: arc_uart: fix of_iomap leak in `arc_serial_probe`
    5a90309002cd vsock: avoid to close connected socket after the timeout
    5009aead17f0 ALSA: firewire-digi00x: prevent potential use after free
    b22b514209ff net: fec: Better handle pm_runtime_get() failing in .remove()
    033297ef3bba af_key: Reject optional tunnel/BEET mode templates in outbound policies
    912a6cff0db1 cpupower: Make TSC read per CPU for Mperf monitor
    131eb9c9b1a0 ASoC: fsl_micfil: register platform component before registering cpu dai
    a3714a47b401 btrfs: fix space cache inconsistency after error loading it from disk
    596898303745 btrfs: replace calls to btrfs_find_free_ino with btrfs_find_free_objectid
    1e453cb55014 mfd: dln2: Fix memory leak in dln2_probe()
    bdc33478d5d3 phy: st: miphy28lp: use _poll_timeout functions for waits
    e6e917e82de4 Input: xpad - add constants for GIP interface numbers
    9fcef1e37d54 iommu/arm-smmu-v3: Acknowledge pri/event queue overflow if any
    4461f41ece4d clk: tegra20: fix gcc-7 constant overflow warning
    c23e6383d7fe RDMA/core: Fix multiple -Warray-bounds warnings
    3ed95a6f6c64 recordmcount: Fix memory leaks in the uwrite function
    38a118fd545b sched: Fix KCSAN noinstr violation
    cbe3063a9be1 mcb-pci: Reallocate memory region to avoid memory overlapping
    d5cd2928d310 serial: 8250: Reinit port->pm on port specific driver unbind
    ccb12585a735 usb: typec: tcpm: fix multiple times discover svids error
    c5405c767173 HID: wacom: generic: Set battery quirk only when we see battery data
    d3f32dc2ccc2 spi: spi-imx: fix MX51_ECSPI_* macros when cs > 3
    bf80dbd52899 HID: logitech-hidpp: Reconcile USB and Unifying serials
    e28f9de2d4d7 HID: logitech-hidpp: Don't use the USB serial for USB devices
    8a65476dd1ca staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
    2112c4c47d36 Bluetooth: L2CAP: fix "bad unlock balance" in l2cap_disconnect_rsp
    fa57021262e9 wifi: iwlwifi: dvm: Fix memcpy: detected field-spanning write backtrace
    0ad8dd870aa1 wifi: iwlwifi: pcie: Fix integer overflow in iwl_write_to_user_buf
    f6f2d16c77f9 wifi: iwlwifi: pcie: fix possible NULL pointer dereference
    a7ec2f424f6e samples/bpf: Fix fout leak in hbm's run_bpf_prog
    4ceedc2f8bdf f2fs: fix to drop all dirty pages during umount() if cp_error is set
    8659c5f4ffaa ext4: Fix best extent lstart adjustment logic in ext4_mb_new_inode_pa()
    cee78217a7ae ext4: set goal start correctly in ext4_mb_normalize_request
    d43b1bdb1005 gfs2: Fix inode height consistency check
    410e610a96c5 scsi: message: mptlan: Fix use after free bug in mptlan_remove() due to race condition
    cc2d2b3dbfb0 lib: cpu_rmap: Avoid use after free on rmap->obj array entries
    89f5055f9b0b scsi: target: iscsit: Free cmds before session free
    67236cf14db3 net: Catch invalid index in XPS mapping
    92af9cb86ab0 net: pasemi: Fix return type of pasemi_mac_start_tx()
    644a9d5e2276 scsi: lpfc: Prevent lpfc_debugfs_lockstat_write() buffer overflow
    c4813f858e5c ext2: Check block size validity during mount
    56c7e9c39bd5 wifi: brcmfmac: cfg80211: Pass the PMK in binary instead of hex
    c409eb45f5dd ACPICA: ACPICA: check null return of ACPI_ALLOCATE_ZEROED in acpi_db_display_objects
    710e09fd116e ACPICA: Avoid undefined behavior: applying zero offset to null pointer
    99c8f2e6f33a drm/tegra: Avoid potential 32-bit integer overflow
    ccae2233e993 ACPI: EC: Fix oops when removing custom query handlers
    48ac727ea4a3 firmware: arm_sdei: Fix sleep from invalid context BUG
    a2a5d3a584bf memstick: r592: Fix UAF bug in r592_remove due to race condition
    d73e8c47675e regmap: cache: Return error in cache sync operations for REGCACHE_NONE
    9b72cb394f96 drm/amd/display: Use DC_LOG_DC in the trasform pixel function
    a75d9211a07f fs: hfsplus: remove WARN_ON() from hfsplus_cat_{read,write}_inode()
    196528ad4844 af_unix: Fix data races around sk->sk_shutdown.
    7d17bc2d4e75 af_unix: Fix a data race of sk->sk_receive_queue->qlen.
    699c9e7c9f66 net: datagram: fix data-races in datagram_poll()
    1aa872e967f2 ipvlan:Fix out-of-bounds caused by unclear skb->cb
    4188c5269475 net: add vlan_get_protocol_and_depth() helper
    57a269d82f2e net: tap: check vlan with eth_type_vlan() method
    1747aa98ab13 net: annotate sk->sk_err write from do_recvmmsg()
    a507022c862e netlink: annotate accesses to nlk->cb_running
    b47aae7038cc netfilter: conntrack: fix possible bug_on with enable_hooks=1
    d7343f8de019 net: Fix load-tearing on sk->sk_stamp in sock_recv_cmsgs().
    42e1dafa65e2 linux/dim: Do nothing if no time delta between samples
    7460ac5a66fb ARM: 9296/1: HP Jornada 7XX: fix kernel-doc warnings
    22b8ac608af5 drm/mipi-dsi: Set the fwnode for mipi_dsi_device
    d4992b2b5c68 driver core: add a helper to setup both the of_node and fwnode of a device

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 01eca24a00..a604e08822 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c705bb899d37bbd61a87a2f850e4d6f04613a908"
-SRCREV_meta ?= "c7d5b73674d53f51772862b951d8cc56683ef04f"
+SRCREV_machine ?= "5cc4655a187a2c5a1a30c6c2295fefab9c8c986d"
+SRCREV_meta ?= "e454f2ec4c69cd5afd7d13df74dd124b856e8765"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.243"
+LINUX_VERSION ?= "5.4.246"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index c3d4ff4608..0938c3d854 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.243"
+LINUX_VERSION ?= "5.4.246"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "140d4ff6bab1e5959377d4974ade490c837ef9cc"
-SRCREV_machine ?= "66990885cd865944a093b47ee7164ef2838f75a3"
-SRCREV_meta ?= "c7d5b73674d53f51772862b951d8cc56683ef04f"
+SRCREV_machine_qemuarm ?= "ffc4cd8db8b2c495a04a9f28e2da3b4c91f30711"
+SRCREV_machine ?= "9a992a65fe0346b8a7a86ffb2c491dadecada05a"
+SRCREV_meta ?= "e454f2ec4c69cd5afd7d13df74dd124b856e8765"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index c361f0c701..28ef51f883 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3c105623bdba36118195e9c188d728edcc00345a"
-SRCREV_machine_qemuarm64 ?= "993c666984249097d093ee71eb3dffa0844fef6c"
-SRCREV_machine_qemumips ?= "2469bc35f1c2ef5ab2e85b7b705b32e33c6350c7"
-SRCREV_machine_qemuppc ?= "98229034b888ad319d7d030d279381a671c41dc0"
-SRCREV_machine_qemuriscv64 ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
-SRCREV_machine_qemux86 ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
-SRCREV_machine_qemux86-64 ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
-SRCREV_machine_qemumips64 ?= "fb1936fa93be6bfd1b18cd8568cfc5b279904fa5"
-SRCREV_machine ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
-SRCREV_meta ?= "c7d5b73674d53f51772862b951d8cc56683ef04f"
+SRCREV_machine_qemuarm ?= "0682b6432f4fb3931fc5a32938ae2957e97ad3fd"
+SRCREV_machine_qemuarm64 ?= "736062be272094d22416e228b92560302298f9fd"
+SRCREV_machine_qemumips ?= "db77f08d3d5176d1b079195beefd558a32e18b69"
+SRCREV_machine_qemuppc ?= "1dbaf2ab5019f7d114b2c309eb7539828f93f10b"
+SRCREV_machine_qemuriscv64 ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
+SRCREV_machine_qemux86 ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
+SRCREV_machine_qemux86-64 ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
+SRCREV_machine_qemumips64 ?= "19c1ba85d643f819cf3e62ee57d05eec2855e97e"
+SRCREV_machine ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
+SRCREV_meta ?= "e454f2ec4c69cd5afd7d13df74dd124b856e8765"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.243"
+LINUX_VERSION ?= "5.4.246"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


