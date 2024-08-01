Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB64C52D72
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:17:58 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.70936.1722525473586250072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgBybZ6s;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d7a544e7so500663185a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722525472; x=1723130272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsZxLg8qyRktnspvKOAqE0SqMXKj80oWY/Q2RAUKRLY=;
        b=kgBybZ6s2Am0sjDRg5OY+v9zCVghKADa5U4wb6J96VmvH4iKW3uPqYkDtPkGGKkrxC
         qHKkj3toPv/lwHgrLt7ZEWJTfAjsW8G9Q3iKh1CLdIo44ePcZ6IWG+PW3HGiiOD25DaB
         LdWSXndTJnF+J3GcTcaB+ziCdBNLwuSwcWIZtQtIMpWvcxTRToUfkp7buyY6a18Hj89j
         cxrHorK/K49qnDYIWgf7STou9r1pvfFRHrBzORvMOniphSdVISnL7Rvkl36LWXWScMgP
         KjL3XHECODwO4BwNJQFi9J0MnBeOAdiLuvg0didg+KxR7NV6kH0Krc5C1bumvvVVRxmq
         N6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525472; x=1723130272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsZxLg8qyRktnspvKOAqE0SqMXKj80oWY/Q2RAUKRLY=;
        b=JwuLRu9qFM6myWf3BQCNJNxXske2oHUPfnHKb3xSbrro0BhCHVpPZHjjDDNw1Tj9ne
         dL1y7SoFgeJXexSP6Isnd2QX6KF28V4UgSoNwlwJQPf2GFXApHbh/He1LxHgnGh2FJ8+
         CBdAtW9tqenQzA/Je92uTNRPZDpNWPvkALvoijzPv/UFLWaeSrt80OgIO2eHm43sNx+A
         eIKh4Zf8lRzKCN9DYiDbbBX2zgdpIni8p+sjrO95P5SU31Idd3OX4jKTpN6Ht8f8qn30
         Vz53BxdVRpgW1S9WXr8lEz4JoX3T/uGx3ueIw18MsL9A8Pw1g+dEZ47aDTUEiSuGtglA
         fY3A==
X-Gm-Message-State: AOJu0YzF8hbDpjBtFkwj+oTaiRodMJEvg1PN1qbubT9k1L3Tn1s+a4zv
	SXA9OjCdRDvrB3FywSD86RCocl5Pzs/qMEogyg+9UWPIYijvlPGVTy0g2hY9
X-Google-Smtp-Source: AGHT+IG0/PXHvCzjh4j3L+4GIQd3QWUhsMzjsj6AUWGY7cNA1dQg1gvj15OScFcsIjvWwCZuXz/txg==
X-Received: by 2002:a05:620a:1aa4:b0:7a1:c431:3587 with SMTP id af79cd13be357-7a34ef4798bmr42421585a.32.1722525472114;
        Thu, 01 Aug 2024 08:17:52 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73ee80esm863306085a.70.2024.08.01.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:17:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] linux-yocto/5.15: update to v5.15.161
Date: Thu,  1 Aug 2024 11:17:44 -0400
Message-Id: <20240801151746.3685916-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801151746.3685916-1-bruce.ashfield@gmail.com>
References: <20240801151746.3685916-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202755

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    4878aadf2d15 Linux 5.15.161
    24665fc4bbef scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW major version > 5
    59b12bff04dd NFS: Fix READ_PLUS when server doesn't support OP_READ_PLUS
    f80c02175293 nfs: fix undefined behavior in nfs_block_bits()
    480aba20fa08 EDAC/igen6: Convert PCIBIOS_* return codes to errnos
    4ead622f74c9 i3c: master: svc: fix invalidate IBI type and miss call client IBI handler
    08de19f2b7a8 s390/cpacf: Make use of invalid opcode produce a link error
    edaaf1f94e24 s390/cpacf: Split and rework cpacf query functions
    67011123453b s390/ap: Fix crash in AP internal function modify_bitmap()
    681ff9a09acc ext4: fix mb_cache_entry's e_refcnt leak in ext4_xattr_block_cache_find()
    74f234f2b1d8 ext4: set type of ac_groups_linear_remaining to __u32 to avoid overflow
    0b787c79dab9 sparc: move struct termio to asm/termios.h
    eacb8b195579 net: fix __dst_negative_advice() race
    f76fd94ae697 kdb: Use format-specifiers rather than memset() for padding in kdb_read()
    98261a093571 kdb: Merge identical case statements in kdb_read()
    1c214d379191 kdb: Fix console handling when editing and tab-completing commands
    e350d3a6bfb8 kdb: Use format-strings rather than '\0' injection in kdb_read()
    f636a40834d2 kdb: Fix buffer overflow during tab-complete
    3f531c4cb789 watchdog: rti_wdt: Set min_hw_heartbeat_ms to accommodate a safety margin
    40f05fd442ba sparc64: Fix number of online CPUs
    532f40f279dc intel_th: pci: Add Meteor Lake-S CPU support
    89969ffbeb94 net/9p: fix uninit-value in p9_client_rpc()
    c84978d773f3 net/ipv6: Fix route deleting failure when metric equals 0
    3fb4601e0db1 crypto: qat - Fix ADF_DEV_RESET_SYNC memory leak
    8287a9d7d45e crypto: ecrdsa - Fix module auto-load on add_key
    b76d165bb4ad crypto: ecdsa - Fix module auto-load on add-key
    b7e69087b03f KVM: arm64: Allow AArch32 PSTATE.M to be restored as System mode
    511ff49371b9 KVM: arm64: Fix AArch32 register narrowing on userspace write
    421b55ea8497 drm/amdgpu/atomfirmware: add intergrated info v2.3 table
    4b2c67e30b4e fbdev: savage: Handle err return when savagefb_check_var failed
    ef34833373ed mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
    ffb56af9f293 mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not working
    8280d35cb9ee mmc: sdhci-acpi: Sort DMI quirks alphabetically
    ee89a7d663da mmc: core: Add mmc_gpiod_set_cd_config() function
    4b2be0d3e3ad media: v4l2-core: hold videodev_lock until dev reg, finishes
    e8b445e1578b media: mxl5xx: Move xpt structures off stack
    8149eaddde86 media: mc: mark the media devnode as registered from the, start
    9c414fdb803a arm64: dts: hi3798cv200: fix the size of GICR
    e586ec1890cf wifi: rtlwifi: rtl8192de: Fix endianness issue in RX path
    4437888840d1 wifi: rtlwifi: rtl8192de: Fix low speed with WPA3-SAE
    70787344e5f4 wifi: rtl8xxxu: Fix the TX power of RTL8192CU, RTL8723AU
    098d54934814 md/raid5: fix deadlock that raid5d() wait for itself to clear MD_SB_CHANGE_PENDING
    f085591a871f arm64: dts: qcom: qcs404: fix bluetooth device address
    0778d97bcae6 arm64: tegra: Correct Tegra132 I2C alias
    dc15cd0a8964 ACPI: resource: Do IRQ override on TongFang GXxHRXx and GMxHGxx
    83c4aba920e3 soc: qcom: rpmh-rsc: Enhance check for VRM in-flight request
    2226b145afa5 thermal/drivers/qcom/lmh: Check for SCM availability at probe
    c422e1d407ae ata: pata_legacy: make legacy_exit() work again
    ea906e9ac61e drm/amdgpu: add error handle to avoid out-of-bounds
    526238d32c3a media: lgdt3306a: Add a check against null-pointer-def
    1640dcf383cd f2fs: fix to do sanity check on i_xattr_nid in sanity_check_inode()
    3feac2b55293 sunrpc: exclude from freezer when waiting for requests:
    a89f73ed5630 scripts/gdb: fix SB_* constants parsing
    e9ffc1951302 net: dsa: tag_sja1105: always prefer source port information from INCL_SRCPT
    c23b1a3bdbca net: dsa: sja1105: always enable the INCL_SRCPT option
    21c0fe2dfbbb vxlan: Fix regression when dropping packets due to invalid src addresses
    874aae15fbef mptcp: fix full TCP keep-alive support
    7f8c1cbb7819 Revert "drm/amdgpu: init iommu after amdkfd device init"
    e65ccf3a4de4 nilfs2: fix use-after-free of timer for log writer thread
    f2aca0a2d940 afs: Don't cross .backup mountpoint from backup volume
    88678723cb0b io_uring: fail NOP if non-zero op flags is passed in
    e345538cbc2f mmc: core: Do not force a retune before RPMB switch
    2ac168c67267 drm: Check polling initialized before enabling in drm_helper_probe_single_connector_modes
    786c27982a39 drm: Check output polling initialized before disabling
    b4878ea99f2b SUNRPC: Fix loop termination condition in gss_free_in_token_pages()
    a896c674d512 media: cec: core: add adap_nb_transmit_canceled() callback
    8d49ca19727b net: ena: Fix DMA syncing in XDP path when SWIOTLB is on
    9eeda3e0071a genirq/cpuhotplug, x86/vector: Prevent vector leak during CPU offline
    625872d22f53 KVM: x86: Don't advertise guest.MAXPHYADDR as host.MAXPHYADDR in CPUID
    83f0ba8592b9 ALSA: timer: Set lower bound of start tick time
    9b65598adffa hwmon: (shtc1) Fix property misspelling
    183c4b416454 ipvlan: Dont Use skb->sk in ipvlan_process_v{4,6}_outbound
    2292bfd243ae net: ena: Fix redundant device NUMA node override
    477c137131ec net: ena: Reduce lines with longer column width boundary
    a087d4b502ff net: ena: Add dynamic recycling mechanism for rx buffers
    600e8d0f47f6 net: ena: Do not waste napi skb cache
    cd549bd6cb1e net: ena: Extract recurring driver reset code into a function
    4ad48d7f26bb net: ena: Add capabilities field with support for ENI stats capability
    e5ed2cd0550f spi: stm32: Don't warn about spurious interrupts
    cbd383ebbabe kconfig: fix comparison to constant symbols, 'm', 'n'
    6fe5af4ff06d netfilter: tproxy: bail out if IP has been disabled on the device
    47ef50eb0443 netfilter: nft_payload: skbuff vlan metadata mangle support
    831292373921 netfilter: nft_payload: rebuild vlan header on h_proto access
    ae4053a6d4e3 netfilter: nft_payload: rebuild vlan header when needed
    bf83de0a51f2 netfilter: nft_payload: move struct nft_payload_set definition where it belongs
    b02c55e47e94 net:fec: Add fec_enet_deinit()
    11e8ecc5b860 bpf: Allow delete from sockmap/sockhash only if update is allowed
    a1f34dd7b8bb net: usb: smsc95xx: fix changing LED_SEL bit value updated from EEPROM
    25571a12fbc8 enic: Validate length of nl attributes in enic_set_vf_port
    e5138f43c97d bpf: Fix potential integer overflow in resolve_btfids
    9d75fab2c14a dma-buf/sw-sync: don't enable IRQ from sync_print_obj()
    d523719e7436 net/mlx5e: Use rx_missed_errors instead of rx_dropped for reporting buffer exhaustion
    98f1c6e5d73a net/mlx5e: Fix IPsec tunnel mode offload feature check
    16f0de919100 net: phy: micrel: set soft_reset callback to genphy_soft_reset for KSZ8061
    81f9b2a9a8c5 nvmet: fix ns enable/disable possible hang
    b41b0018e8ca dma-mapping: benchmark: handle NUMA_NO_NODE correctly
    35d31c8bd472 dma-mapping: benchmark: fix node id validation
    314607e65a67 spi: Don't mark message DMA mapped when no transfer in it is
    748cf3c26cfd netfilter: nft_payload: restore vlan q-in-q match support
    25ea5377e3d2 netfilter: nfnetlink_queue: acquire rcu_read_lock() in instance_destroy_rcu()
    5935b9ff690d ice: Interpret .set_channels() input differently
    0f3ced8b4d33 nfc: nci: Fix handling of zero-length payload packets in nci_rx_work()
    6e48baec2e15 nfc: nci: Fix kcov check in nci_rx_work()
    2c260a24cf1c tls: fix missing memory barrier in tls_init
    2cc3da9ae0f4 net: fec: avoid lock evasion when reading pps_enable
    b8d78a7573ff riscv: stacktrace: fixed walk_stackframe()
    aae5f57c43a9 riscv: stacktrace: Make walk_stackframe cross pt_regs frame
    42d30da50d5c virtio: delete vq in vp_find_vqs_msix() when request_irq() fails
    c1929c041a26 arm64: asm-bug: Add .align 2 to the end of __BUG_ENTRY
    6eec23fa6e90 openvswitch: Set the skbuff pkt_type for proper pmtud support.
    8602150286a2 tcp: Fix shift-out-of-bounds in dctcp_update_alpha().
    61d31ac85b45 ipv6: sr: fix memleak in seg6_hmac_init_algo
    518a994aa0b8 af_unix: Update unix_sk(sk)->oob_skb under sk_receive_queue lock.
    39818fbd3e3a rpcrdma: fix handling for RDMA_CM_EVENT_DEVICE_REMOVAL
    e5c34f10534d sunrpc: fix NFSACL RPC retry on soft mount
    61ceeebbd2a0 NFSv4: Fixup smatch warning for ambiguous return
    1c03ea9acb14 ASoC: tas2552: Add TX path for capturing AUDIO-OUT data
    ad4d196d2008 nfc: nci: Fix uninit-value in nci_rx_work
    e8688218e381 ipv6: sr: fix missing sk_buff release in seg6_input_core
    c707bf57a8db net: Always descend into dsa/ folder with CONFIG_NET_DSA enabled
    42952002ec9f x86/kconfig: Select ARCH_WANT_FRAME_POINTERS again when UNWINDER_FRAME_POINTER=y
    dab0d7e67d33 regulator: bd71828: Don't overwrite runtime voltages
    fde10aab8264 ASoC: mediatek: mt8192: fix register configuration for tdm
    4bb60a0ecee3 null_blk: Fix the WARNING: modpost: missing MODULE_DESCRIPTION()
    f86a3b7ce88b media: cec: core: avoid confusing "transmit timed out" message
    b5da8217c000 media: cec: core: avoid recursive cec_claim_log_addrs
    1e2dbdf6ec88 media: cec-adap.c: drop activate_cnt, use state info instead
    1d1d76a69961 media: cec: use call_op and check for !unregistered
    54e5e151eb4f media: cec: correctly pass on reply results
    b945810fe2cb media: cec: abort if the current transmit was canceled
    6f6340dbe60b media: cec: call enable_adap on s_log_addrs
    f0266ee4cd03 media: cec: cec-api: add locking in cec_release()
    2698f28b1d1e media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
    026ea9532a9b um: Fix the -Wmissing-prototypes warning for __switch_mm
    97e1f40f9f51 powerpc/pseries: Add failure related checks for h_get_mpp and h_get_ppp
    c94e77516fc3 media: flexcop-usb: fix sanity check of bNumEndpoints
    061057a94997 media: flexcop-usb: clean up endpoint sanity checks
    f99809fdeb50 Input: cyapa - add missing input core locking to suspend/resume functions
    124b0afdd17c scsi: qla2xxx: Replace all non-returning strlcpy() with strscpy()
    7532bcec0797 media: stk1160: fix bounds checking in stk1160_copy_video()
    6721557404cf drm/bridge: tc358775: fix support for jeida-18 and jeida-24
    a2de301d90b7 fs/ntfs3: Use variable length array instead of fixed size
    2d1ad595d15f fs/ntfs3: Use 64 bit variable to avoid 32 bit overflow
    90bfce05a370 um: vector: fix bpfflash parameter evaluation
    31960d991e43 um: Add winch to winch_handlers before registering winch IRQ
    78863940745f um: Fix return value in ubd_init()
    0854c0efd383 drm/msm/dpu: Always flush the slave INTF on the CTL
    912f8385ebfc drm/msm/dsi: Print dual-DSI-adjusted pclk instead of original mode pclk
    a992b28aa265 Input: pm8xxx-vibrator - correct VIB_MAX_LEVELS calculation
    ccdc1b2baa36 mmc: sdhci_am654: Fix ITAPDLY for HS400 timing
    a2ffc95f2c9e mmc: sdhci_am654: Add ITAPDLYSEL in sdhci_j721e_4bit_set_clock
    81360e7fdc3c mmc: sdhci_am654: Add OTAP/ITAP delay enable
    21deb1a72279 mmc: sdhci_am654: Drop lookup for deprecated ti,otap-del-sel
    e5eefc47c934 mmc: sdhci_am654: Write ITAPDLY for DDR52 timing
    b2d13473d091 mmc: sdhci_am654: Add tuning algorithm for delay chain
    f23f82b42556 Input: ioc3kbd - add device table
    369d8da0185b Input: ioc3kbd - convert to platform remove callback returning void
    13e975b09b1e Input: ims-pcu - fix printf string overflow
    e1e40928b78b s390/boot: Remove alt_stfle_fac_list from decompressor
    3a091c2010aa s390/ipl: Fix incorrect initialization of nvme dump block
    79e71379f3a2 s390/ipl: Fix incorrect initialization of len fields in nvme reipl block
    cede8ab8528f s390/vdso: Use standard stack frame layout
    24d50b7148b2 s390/vdso: Generate unwind information for C modules
    ddfd7ca99e7c s390/vdso64: filter out munaligned-symbols flag for vdso
    1bc9dd3aea45 s390/vdso: filter out mno-pic-data-is-text-relative cflag
    6dbeee1608ea libsubcmd: Fix parse-options memory leak
    b28bdc96074b serial: sh-sci: protect invalidating RXDMA on shutdown
    8acae0472150 f2fs: compress: don't allow unaligned truncation on released compress inode
    3109022d9fb4 f2fs: fix to release node block count in error path of f2fs_new_node_page()
    b5bac43875aa f2fs: compress: fix to cover {reserve,release}_compress_blocks() w/ cp_rwsem lock
    8a8b95be1649 PCI/EDR: Align EDR_PORT_LOCATE_DSM with PCI Firmware r3.3
    44568a390006 PCI/EDR: Align EDR_PORT_DPC_ENABLE_DSM with PCI Firmware r3.3
    d3c257aa1bc0 extcon: max8997: select IRQ_DOMAIN instead of depending on it
    b65d0410b879 ppdev: Add an error check in register_device
    5276c9d90df7 ppdev: Remove usage of the deprecated ida_simple_xx() API
    7419df1acffb stm class: Fix a double free in stm_register_device()
    170b600e5cc3 usb: gadget: u_audio: Clear uac pointer when freed.
    b17f6f448b13 watchdog: bd9576: Drop "always-running" property
    a87a838c6835 watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
    0a1c804cf250 dt-bindings: pinctrl: mediatek: mt7622: fix array properties
    e1768962f1ac microblaze: Remove early printk call from cpuinfo-static.c
    ee0cb15a1405 microblaze: Remove gcc flag for non existing early_printk.c file
    9b4eee8572dc fpga: region: add owner module and take its refcount
    33c213cdfc62 fpga: region: Use standard dev_release for class driver
    194e0455273c coresight: etm4x: Fix access to resource selector registers
    4bc3921911e3 coresight: etm4x: Safe access for TRCQCLTR
    e1eb887d81b7 coresight: etm4x: Cleanup TRCIDR0 register accesses
    4d166858650d coresight: no-op refactor to make INSTP0 check more idiomatic
    355144530b74 coresight: etm4x: Do not save/restore Data trace control registers
    ee5f0eca94b8 coresight: etm4x: Do not hardcode IOMEM access for register restore
    f437c761fc8a iio: pressure: dps310: support negative temperature values
    39c2c97507c8 coresight: etm4x: Fix unbalanced pm_runtime_enable()
    919f899a2207 f2fs: fix to check pinfile flag in f2fs_move_file_range()
    2623fae7e769 f2fs: fix to relocate check condition in f2fs_fallocate()
    71486c10c550 f2fs: fix typos in comments
    603c0c3a83fc f2fs: do not allow partial truncation on pinned file
    4f0750bf8a33 f2fs: compress: fix to relocate check condition in f2fs_ioc_{,de}compress_file()
    4eb2124f453a f2fs: convert to use sbi directly
    84908c23a90e f2fs: compress: fix to relocate check condition in f2fs_{release,reserve}_compress_blocks()
    eeabb84d796e dt-bindings: PCI: rcar-pci-host: Add missing IOMMU properties
    b8e68dbc490a dt-bindings: PCI: rcar-pci-host: Add optional regulators
    703fd706fc14 serial: sc16is7xx: add proper sched.h include for sched_set_fifo()
    dcf811e15ae2 PCI: tegra194: Fix probe path for Endpoint mode
    088139c9d36d greybus: arche-ctrl: move device table to its right location
    b0008a4c83a6 serial: max3100: Fix bitwise types
    361a92c9038e serial: max3100: Update uart_driver_registered on driver removal
    78dbda51bb42 serial: max3100: Lock port->lock when calling uart_handle_cts_change()
    5786b3696110 firmware: dmi-id: add a release callback function
    6bc7423ffdab dmaengine: idma64: Add check for dma_set_max_seg_size
    902f6d656441 soundwire: cadence: fix invalid PDI offset
    a762959a6f43 f2fs: fix to wait on page writeback in __clone_blkaddrs()
    aaac91468f5b f2fs: Delete f2fs_copy_page() and replace with memcpy_page()
    330f6bcdcef0 greybus: lights: check return of get_channel_from_mode
    c002914c0ac9 sched/core: Fix incorrect initialization of the 'burst' parameter in cpu_max_write()
    cc1e9513c180 sched/fair: Allow disabling sched_balance_newidle with sched_relax_domain_level
    c335ad738f52 af_packet: do not call packet_read_pending() from tpacket_destruct_skb()
    421c50fa8183 netrom: fix possible dead-lock in nr_rt_ioctl()
    eaa53a28b74b net: qrtr: ns: Fix module refcnt
    d449edd8063e selftests: net: bridge: increase IGMP/MLD exclude timeout membership interval
    ca759d47ec49 RDMA/IPoIB: Fix format truncation compilation errors
    099750e9d950 selftests/kcmp: remove unused open mode
    e26259f7e754 selftests/kcmp: Make the test output consistent and clear
    fe0b474974fe SUNRPC: Fix gss_free_in_token_pages()
    3ae762f26b67 ext4: fix potential unnitialized variable
    5267b649a956 ext4: remove unused parameter from ext4_mb_new_blocks_simple()
    778b1ac4d672 ext4: try all groups in ext4_mb_new_blocks_simple
    2b9310a99d5b ext4: fix unit mismatch in ext4_mb_new_blocks_simple
    db26ff923faa ext4: simplify calculation of blkoff in ext4_mb_new_blocks_simple
    33feac2e8df3 sunrpc: removed redundant procp check
    5c6705aa47b5 drivers/virt/acrn: fix PFNMAP PTE checks in acrn_vm_ram_map()
    5283ac5e0788 virt: acrn: stop using follow_pfn
    af453dfb4516 virt: acrn: Prefer array_size and struct_size over open coded arithmetic
    239a1dfaaf9b ext4: avoid excessive credit estimate in ext4_tmpfile()
    69db696bdb74 x86/insn: Fix PUSH instruction in x86 instruction decoder opcode map
    08d1c49bfa58 clk: qcom: mmcc-msm8998: fix venus clock issue
    cc699b7eb2bc RDMA/hns: Modify the print level of CQE error
    4d5b155cd495 RDMA/hns: Use complete parentheses in macros
    fc6342d4f082 RDMA/hns: Fix GMV table pagesize
    4a3be1a0ffe0 RDMA/hns: Fix deadlock on SRQ async events.
    ed159691a29c RDMA/hns: Fix return value in hns_roce_map_mr_sg
    f0b2483d45be RDMA/mlx5: Adding remote atomic access flag to updatable flags
    74a9b48bc53c drm/mipi-dsi: use correct return type for the DSC functions
    910594fe9208 drm/panel: simple: Add missing Innolux G121X1-L03 format, flags, connector
    6b887596b6d9 drm/bridge: tc358775: Don't log an error when DSI host can't be found
    078192c48473 drm/bridge: lt9611: Don't log an error when DSI host can't be found
    fb444706ff8c drm/bridge: lt8912b: Don't log an error when DSI host can't be found
    7b94000a8cd1 ASoC: tracing: Export SND_SOC_DAPM_DIR_OUT to its value
    6cf1874aec42 drm: vc4: Fix possible null pointer dereference
    3e54d4e95120 drm/arm/malidp: fix a possible null pointer dereference
    82c2c85aead3 media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries
    f709129f82c2 fbdev: sh7760fb: allow modular build
    5f61df672368 media: dt-bindings: ovti,ov2680: Fix the power supply names
    da8608cf2e5b media: ipu3-cio2: Request IRQ earlier
    04e8b87339d0 media: ipu3-cio2: Use temporary storage for struct device pointer
    89788cd9824c drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
    3770a54a0867 media: radio-shark2: Avoid led_names truncations
    5a0736545151 media: ngene: Add dvb_ca_en50221_init return value check
    916143cff84f fbdev: sisfb: hide unused variables
    1db23928d6ef powerpc/fsl-soc: hide unused const variable
    0e3b6f912372 drm/mediatek: Add 0 size check to mtk_drm_gem_obj
    eb1caaa00e75 drm/meson: vclk: fix calculation of 59.94 fractional rates
    d48d0c5fd733 ASoC: kirkwood: Fix potential NULL dereference
    22509899d56d fbdev: shmobile: fix snprintf truncation
    99bc9199de86 mtd: rawnand: hynix: fixed typo
    96725324ef44 mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
    58374345112a ASoC: Intel: Disable route checks for Skylake boards
    ced9c4e2289a drm/amd/display: Fix potential index out of bounds in color transformation function
    5391368a87bd dev_printk: Add and use dev_no_printk()
    6558872aa04a printk: Let no_printk() use _printk()
    21ca029e23ea mptcp: SO_KEEPALIVE: fix getsockopt support
    16da7f772837 s390/bpf: Emit a barrier for BPF_FETCH instructions
    3cb92b0ad73d net/mlx5: Discard command completions in internal error
    1a63730fb315 ipv6: sr: fix invalid unregister error path
    17e99ea1313b ipv6: sr: fix incorrect unregister order
    bc1b9c255bf2 ipv6: sr: add missing seg6_local_exit
    483eb70f441e net: openvswitch: fix overwriting ct original tuple for ICMPv6
    14f28fd93245 net: usb: smsc95xx: stop lying about skb->truesize
    9aa8773abfa0 af_unix: Fix data races in unix_release_sock/unix_stream_sendmsg
    4cca12e15a22 net: ethernet: cortina: Locking fixes
    fbeeb55dbb33 eth: sungem: remove .ndo_poll_controller to avoid deadlocks
    fb724a948d23 net: ipv6: fix wrong start position when receive hop-by-hop fragment
    48629bdb39e2 m68k: mac: Fix reboot hang on Mac IIci
    77b2b67a0f8b m68k: Fix spinlock race in kernel thread creation
    1119da6a72b7 net: usb: sr9700: stop lying about skb->truesize
    097a9a015b4f usb: aqc111: stop lying about skb->truesize
    0488f7bcac2c wifi: mwl8k: initialize cmd->addr[] properly
    37c82d000270 scsi: qla2xxx: Fix debugfs output for fw_resource_count
    dccd97b39ab2 scsi: qedf: Ensure the copied buf is NUL terminated
    1708e3cf2488 scsi: bfa: Ensure the copied buf is NUL terminated
    3dfc214de694 HID: intel-ish-hid: ipc: Add check for pci_alloc_irq_vectors
    44d7f481da7e selftests/resctrl: fix clang build failure: use LOCAL_HDRS
    0af9e305f1c2 selftests/binderfs: use the Makefile's rules, not Make's implicit rules
    1e6a56726699 Revert "sh: Handle calling csum_partial with misaligned data"
    50e409546001 sh: kprobes: Merge arch_copy_kprobe() into arch_prepare_kprobe()
    b4c24de37a6b wifi: ar5523: enable proper endpoint verification
    6a9892bf24c9 wifi: carl9170: add a proper sanity check for endpoints
    010d4cb19bb1 macintosh/via-macii: Fix "BUG: sleeping function called from invalid context"
    7075faa7544f net: give more chances to rcu in netdev_wait_allrefs_any()
    822c8bb7b9b0 pwm: sti: Simplify probe function using devm functions
    1370b265cdb2 pwm: sti: Prepare removing pwm_chip from driver data
    2da4e80a6791 pwm: sti: Convert to platform remove callback returning void
    05c6b7473427 tcp: avoid premature drops in tcp_add_backlog()
    e040b08648d5 net: dsa: mv88e6xxx: Avoid EEPROM timeout without EEPROM on 88E6250-family switches
    25479712dab1 net: dsa: mv88e6xxx: Add support for model-specific pre- and post-reset handlers
    719dac9679fa wifi: ath10k: populate board data for WCN3990
    2142fc035872 wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()
    27600e0c5272 thermal/drivers/tsens: Fix null pointer dereference
    89e2d5f29a36 x86/purgatory: Switch to the position-independent small code model
    83d460c9f4e4 scsi: hpsa: Fix allocation size for Scsi_Host private data
    a3f5c4404a46 scsi: libsas: Fix the failure of adding phy with zero-address to port
    9a185cc5a79b cppc_cpufreq: Fix possible null pointer dereference
    65cbcec7db54 udp: Avoid call to compute_score on multiple sites
    547c22f28cd7 net: remove duplicate reuseport_lookup functions
    284f738be643 net: export inet_lookup_reuseport and inet6_lookup_reuseport
    35db5e76d5e9 cpufreq: exit() callback is optional
    43b27f9714bd cpufreq: Rearrange locking in cpufreq_remove_dev()
    f0773bd7cab4 cpufreq: Split cpufreq_offline()
    4b29dd145a06 cpufreq: Reorganize checks in cpufreq_offline()
    83ca1efe5044 selftests/bpf: Fix umount cgroup2 error in test_sockmap
    d09a8f2d3004 gfs2: Fix "ignore unlock failures after withdraw"
    1fa360d7441b gfs2: Don't forget to complete delayed withdraw
    d582bb39e0e3 ACPI: disable -Wstringop-truncation
    96c44901df31 irqchip/loongson-pch-msi: Fix off-by-one on allocation error path
    e434ddd1da70 irqchip/alpine-msi: Fix off-by-one in allocation error path
    f98c6fd4ec2b scsi: ufs: core: Perform read back after disabling UIC_COMMAND_COMPL
    64875204247f scsi: ufs: core: Perform read back after disabling interrupts
    dd33e64e50de scsi: ufs: cdns-pltfrm: Perform read back after writing HCLKDIV
    dca83b9fd190 scsi: ufs: qcom: Perform read back after writing CGC enable
    8a4a516a7fdd scsi: ufs: qcom: Perform read back after writing unipro mode
    49edc54dd9b3 scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW version major 5
    f1f8d2978805 scsi: ufs: ufs-qcom: Fix the Qcom register name for offset 0xD0
    52ac441ca7c9 scsi: ufs: qcom: Perform read back after writing REG_UFS_SYS1CLK_1US
    a765a56392af scsi: ufs: qcom: Perform read back after writing reset bit
    f654b258e9fa bpf: Pack struct bpf_fib_lookup
    1a82569ea51a qed: avoid truncating work queue length
    97f0f81eca30 sched/fair: Add EAS checks before updating root_domain::overutilized
    8a1f57539db4 x86/boot: Ignore relocations in .notes sections in walk_relocs() too
    b47b7640ea4c wifi: ath10k: poll service ready message before failing
    69296914bfd5 md: fix resync softlockup when bitmap size is less than array size
    54f39d56d6bf null_blk: Fix missing mutex_destroy() at module removal
    3355628ed097 soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
    a1d21bcd78cf jffs2: prevent xattr node from overflowing the eraseblock
    ff5dbd6a74ff s390/cio: fix tracepoint subchannel type field
    cc1e53c7f77d crypto: x86/sha512-avx2 - add missing vzeroupper
    7bce9cd3da5a crypto: x86/sha256-avx2 - add missing vzeroupper
    d15b50f2ef6b crypto: x86/nh-avx2 - add missing vzeroupper
    b975277e6d7b crypto: ccp - drop platform ifdef checks
    4e56db565120 parisc: add missing export of __cmpxchg_u8()
    669ed3c1ea2d nilfs2: fix out-of-range warning
    12db25a54ce6 ecryptfs: Fix buffer size for tag 66 packet
    eb6d925fe70c firmware: raspberrypi: Use correct device for DMA mappings
    d19ba2e3f5e7 mm/slub, kunit: Use inverted data to corrupt kmem cache
    c69a1e4b419c crypto: bcm - Fix pointer arithmetic
    2be75d2a8d26 openpromfs: finish conversion to the new mount API
    cbfd1088e24e epoll: be better about file lifetimes
    92de16aeca0e nvme: find numa distance only if controller has valid numa id
    e1e4e33df597 x86/mm: Remove broken vsyscall emulation code from the page fault code
    8f11f991f221 drm/amdkfd: Flush the process wq before creating a kfd_process
    77fb5cbe0228 ASoC: da7219-aad: fix usage of device_get_named_child_node()
    19ef439df2a6 softirq: Fix suspicious RCU usage in __do_softirq()
    1d3ff18aeee5 ASoC: rt715-sdca: volume step modification
    5b49e8195f9a ASoC: rt715: add vendor clear control register
    5b4d0d839995 regulator: vqmmc-ipq4019: fix module autoloading
    a06efd8ab975 ASoC: dt-bindings: rt5645: add cbj sleeve gpio property
    f8324c4c3555 ASoC: rt5645: Fix the electric noise due to the CBJ contacts floating
    ab859797e4b8 regulator: irq_helpers: duplicate IRQ name
    621cf1de2d23 selftests: sud_test: return correct emulated syscall value on RISC-V
    3218fd551406 drm/amd/display: Set color_mgmt_changed to true on unsuspend
    c26b6683703b net: usb: qmi_wwan: add Telit FN920C04 compositions
    551b1c385009 dt-bindings: rockchip: grf: Add missing type to 'pcie-phy' node
    a88b42393ab8 wifi: cfg80211: fix the order of arguments for trace events of the tx_rx_evt class
    ff80185e7b7b ALSA: Fix deadlocks with kctl removals at disconnection
    e7e0ca200772 ALSA: core: Fix NULL module pointer assignment at card init
    98740ae2b361 fs/ntfs3: Break dir enumeration if directory contents error
    562c86caed68 fs/ntfs3: Fix case when index is reused during tree transformation
    7ab0c256964e fs/ntfs3: Taking DOS names into account during link counting
    4a8cd11d8538 fs/ntfs3: Remove max link count info display during driver init
    06afce714d87 nilfs2: fix potential hang in nilfs_detach_log_writer()
    257d6c90dc38 nilfs2: fix unexpected freezing of nilfs_segctor_sync()
    e6062c494b93 net: smc91x: Fix m68k kernel compilation for ColdFire CPU
    f3a1efd98ba2 tools/latency-collector: Fix -Wformat-security compile warns
    595363182f28 ring-buffer: Fix a race between readers and resize checks
    b6d21cf40de1 r8169: Fix possible ring buffer corruption on fragmented Tx packets.
    528a620c1397 Revert "r8169: don't try to disable interrupts if NAPI is, scheduled already"
    3adc11febf5a serial: 8250_bcm7271: use default_mux_rate if possible
    504178fb7d9f speakup: Fix sizeof() vs ARRAY_SIZE() bug
    ab1e76993c2a tty: n_gsm: fix missing receive state reset after mode switch
    4c267110fc11 tty: n_gsm: fix possible out-of-bounds in gsm0_receive()
    bdd621ccc993 x86/tsc: Trust initial offset in architectural TSC-adjust MSRs
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e30d62806e..d56f836423 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b51720cb12df1cc8b7db2a5ff54f640c9167ca5e"
-SRCREV_meta ?= "e12e10e0b562f46c1d2f7b71c917d40dd1de339c"
+SRCREV_machine ?= "bb5c5e098fac580b02483dee081215a9311c6ae0"
+SRCREV_meta ?= "e18b1bbce72e4371c787e998793a11d14fc2312a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.160"
+LINUX_VERSION ?= "5.15.161"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 5ef6eb246e..a2ebd3288c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.160"
+LINUX_VERSION ?= "5.15.161"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d83ae507c0959001f23c4cc0f04db10e9afdbe6d"
-SRCREV_meta ?= "e12e10e0b562f46c1d2f7b71c917d40dd1de339c"
+SRCREV_machine ?= "ddd4e95180eff3396e4cf9e154b43cfc1400064c"
+SRCREV_meta ?= "e18b1bbce72e4371c787e998793a11d14fc2312a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9aa7df1d86..90897ac336 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c0c277829e709dc2e9598bf4ad92bd111c1a7b2c"
-SRCREV_machine:qemuarm64 ?= "de5cf198e28050fa834b1ae095c7b25784c9a210"
-SRCREV_machine:qemumips ?= "c458ba72cb6d90db349ecd4ab87e9756acb4167d"
-SRCREV_machine:qemuppc ?= "490a7c62280c51929d4246e9296aa77a72578091"
-SRCREV_machine:qemuriscv64 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
-SRCREV_machine:qemuriscv32 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
-SRCREV_machine:qemux86 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
-SRCREV_machine:qemux86-64 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
-SRCREV_machine:qemumips64 ?= "1df9cd12015ed64948c860d2b43f3b8e59b25c42"
-SRCREV_machine ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
-SRCREV_meta ?= "e12e10e0b562f46c1d2f7b71c917d40dd1de339c"
+SRCREV_machine:qemuarm ?= "688f035c78850cd701e12885fb31ae6aee471ea4"
+SRCREV_machine:qemuarm64 ?= "64dc94083abec04622dec3856f085407b456b6a2"
+SRCREV_machine:qemumips ?= "43bdd49d2338322cf6dbeb5c716822df923d865e"
+SRCREV_machine:qemuppc ?= "ff717d376102db97f22f7f80fd81d60b4f9f8eaf"
+SRCREV_machine:qemuriscv64 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
+SRCREV_machine:qemuriscv32 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
+SRCREV_machine:qemux86 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
+SRCREV_machine:qemux86-64 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
+SRCREV_machine:qemumips64 ?= "2d24caba985f863bc79bab2735e60748b17b1ad5"
+SRCREV_machine ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
+SRCREV_meta ?= "e18b1bbce72e4371c787e998793a11d14fc2312a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c61bd26ae81a896c8660150b4e356153da30880a"
+SRCREV_machine:class-devupstream ?= "4878aadf2d1519f3731ae300ce1fef78fc63ee30"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.160"
+LINUX_VERSION ?= "5.15.161"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


