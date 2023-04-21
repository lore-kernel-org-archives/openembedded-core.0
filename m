Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32950C77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 16:42:03 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.17735.1682095316456878020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 09:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dEZrUwwy;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3ef31b7b868so18830681cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682095315; x=1684687315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQw2+jNXdU9z4a7oO+9YfAtbEuRU76O8Z9IjneaQiWw=;
        b=dEZrUwwyoogjCZcx9CJZorPqwO7NN9FpSUclKroQtmvyoKWS6FWM5YNSZuMWX6DW+j
         JMNAS+p1mSi9gWEdBlWxSdCQw5ZCOkGX9bV9zVlOv/o+5VdEr4zouQf/mvTg5ZXV7MT6
         8QjHXJMu5IyBsQfnc0LUdZ9Qj32PvZD3z6sHQ0gho5eh7zK1XltINTZaTnOMbpOx46e0
         CtPYO6ui0Q3ymmpXLqqVW1+DjTG3vImcC/CWrhwo/3loEfWjaZWUW8KePlW8r/iyJSv8
         Cfp4LxidMRpAmbkVUMWGF0S51StyBkTkSzQbEkq3ZwwdGS53xwpRd8Hw/rO2GIh9qxd6
         rEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095315; x=1684687315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQw2+jNXdU9z4a7oO+9YfAtbEuRU76O8Z9IjneaQiWw=;
        b=N7ypDvgYqkGkUWyPT4RDvfeFZNnO7emQqfjI2uF1NSIzOaxUKKvs6UG+a0IN/BYl0N
         wSKHV8bo286LlYRx0vuPWDX6vxlARGVuwUByK6BaTdU9Y7tsLRt/NLiwyiQ54196NkLU
         tuhWYpU4feEd5ZFCSPsLxroOcP6JT3RatUxa+6Y+vd69wCtkfNvmmuDdewF0oOySHOnb
         RPg/ZdpHZt0t6JlOx4f5cUnIwfi+V6m2ESrtz/fXskVLRLtxjOJqjgcmV6FHHIncgBil
         3LExgVN32zJXC5O3oQvVD1YvFMsu3YcvV5rJkUNbKAx1IfPmzzJ6KNKEp5ZLg03FQKfm
         LM9g==
X-Gm-Message-State: AAQBX9eXFrbNjpXM9czbQuWZkm4gpTEZvYO27+tjqHHXMtun3RvfMd4O
	vep0B9jb1VaeB6HhZ6yny4x5FJQu+yJ94w==
X-Google-Smtp-Source: AKy350b+KWlUKLDampIUBDAucs0I6MUPyZvxu8foDpunHoUQC/aMD9GLwUuHT2qLeJk1RX5WsiMzHA==
X-Received: by 2002:a05:622a:1746:b0:3ea:246e:c2c5 with SMTP id l6-20020a05622a174600b003ea246ec2c5mr9736551qtk.33.1682095315208;
        Fri, 21 Apr 2023 09:41:55 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85909000000b003ef573e24cfsm1131245qty.12.2023.04.21.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 09:41:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.15: update to v5.15.106
Date: Fri, 21 Apr 2023 12:41:46 -0400
Message-Id: <ef5d949b48dba3afcd46d83a2d3eeb420628de76.1682095127.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682095127.git.bruce.ashfield@gmail.com>
References: <cover.1682095127.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180291

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d86dfc4d95cd Linux 5.15.106
    06a948b8347c x86/PVH: avoid 32-bit build warning when obtaining VGA console info
    3abdf6d71fdb hsr: ratelimit only when errors are printed
    fcc09ef87e79 libbpf: Fix btf_dump's packed struct determination
    74059587b25d selftests/bpf: Add few corner cases to test padding handling of btf_dump
    c74ae8678dfa libbpf: Fix BTF-to-C converter's padding logic
    17a61d1e9431 selftests/bpf: Test btf dump for struct with padding only fields
    6777291c7b14 zonefs: Fix error message in zonefs_file_dio_append()
    71ab5c1d506d KVM: x86: Purge "highest ISR" cache when updating APICv state
    61e0863dc8dd KVM: x86: Inject #GP on x2APIC WRMSR that sets reserved bits 63:32
    4483dc41d123 KVM: VMX: Move preemption timer <=> hrtimer dance to common x86
    a58d4e66712b s390/uaccess: add missing earlyclobber annotations to __clear_user()
    1dfccde646aa KVM: arm64: Disable interrupts while walking userspace PTs
    25e74e728168 drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
    3bfedfdbf92b drm/etnaviv: fix reference leak when mmaping imported buffer
    fd1f48613e9f rcu: Fix rcu_torture_read ftrace event
    9097ba15ea5c xtensa: fix KASAN report for show_stack
    8861429f883e ALSA: hda/realtek: Add quirk for Lenovo ZhaoYang CF4620Z
    77ab3e5f9873 ALSA: hda/realtek: Add quirks for some Clevo laptops
    f775413ffeff ALSA: usb-audio: Fix regression on detection of Roland VS-100
    b39d42ed67d5 ALSA: hda/conexant: Partial revert of a quirk for Lenovo
    305a171cf617 NFSv4: Fix hangs when recovering open state after a server reboot
    7624973bc15b powerpc: Don't try to copy PPR for task with NULL pt_regs
    3a9510113f5b pinctrl: at91-pio4: fix domain name assignment
    6c1bc7b50e02 pinctrl: amd: Disable and mask interrupts on resume
    45ed4e5149e8 net: phy: dp83869: fix default value for tx-/rx-internal-delay
    0f75ef136169 xen/netback: don't do grant copy across page boundary
    8a581b71cf68 can: j1939: prevent deadlock by moving j1939_sk_errqueue()
    a3373a681d9a zonefs: Always invalidate last cached page on append write
    c1310fc7abe6 btrfs: scan device in non-exclusive mode
    c976f9233ef9 btrfs: fix race between quota disable and quota assign ioctls
    1484852ca152 Input: goodix - add Lenovo Yoga Book X90F to nine_bytes_report DMI table
    b64305185b76 cifs: fix DFS traversal oops without CONFIG_CIFS_DFS_UPCALL
    0a2e0baf3677 cifs: prevent infinite recursion in CIFSGetDFSRefer()
    a5075c097de1 Input: focaltech - use explicitly signed char type
    cf43bc826159 Input: alps - fix compatibility with -funsigned-char
    16c951f3eba4 iommu/vt-d: Allow zero SAGAW if second-stage not supported
    e4fbeaa31362 pinctrl: ocelot: Fix alt mode for ocelot
    76f09582a191 net: ethernet: mtk_eth_soc: fix flow block refcounting logic
    9caf3cbf1224 net: dsa: mv88e6xxx: Enable IGMP snooping on user ports only
    4c6c0e8510a2 bnxt_en: Add missing 200G link speed reporting
    c519174366a3 bnxt_en: Fix typo in PCI id to device description string mapping
    24722a0e0925 bnxt_en: Fix reporting of test result in ethtool selftest
    3e3654bf679f i40e: fix registers dump after run ethtool adapter self test
    8d7b0b22ea22 net: ipa: compute DMA pool size properly
    81d2a7e93c83 ALSA: ymfpci: Fix BUG_ON in probe function
    95642872c466 ALSA: ymfpci: Create card with device-managed snd_devm_card_new()
    9cb4f23e4f7a ice: fix invalid check for empty list in ice_sched_assoc_vsi_to_agg()
    938eba5b434d ice: add profile conflict check for AVF FDIR
    0ea60b230d19 smsc911x: avoid PHY being resumed when interface is not up
    41f77a6d9841 net: mvpp2: parser fix PPPoE
    ec117d22f143 net: mvpp2: parser fix QinQ
    18d6e95fbb08 net: mvpp2: classifier flow fix fragmentation flags
    aa45d3dd74e9 loop: LOOP_CONFIGURE: send uevents for partitions
    83ee49ab185d loop: suppress uevents while reconfiguring the device
    aa2bff25e9bb s390/vfio-ap: fix memory leak in vfio_ap device driver
    bf70e0eab64c can: bcm: bcm_tx_setup(): fix KMSAN uninit-value in vfs_write
    959348f7c300 platform/x86/intel/pmc: Alder Lake PCH slp_s0_residency fix
    c8e7ff3071bf drm/i915/tc: Fix the ICL PHY ownership check in TC-cold state
    61e2e6d444cd net: stmmac: don't reject VLANs when IFF_PROMISC is set
    2d5cebf57296 net/net_failover: fix txq exceeding warning
    829a0d013c00 regulator: Handle deferred clk
    75155f4d8dcd r8169: fix RTL8168H and RTL8107E rx crc error
    4597e104a365 net: dsa: microchip: ksz8863_smi: fix bulk access
    c0de1a26e659 ptp_qoriq: fix memory leak in probe()
    d84796008a89 scsi: mpt3sas: Don't print sense pool info twice
    27b1ae000bf1 scsi: megaraid_sas: Fix crash after a double completion
    d63a83146d25 sfc: ef10: don't overwrite offload features at NIC reset
    7ea88e90dabb SUNRPC: fix shutdown of NFS TCP client socket
    34c554376ec9 mtd: rawnand: meson: invalidate cache on polling ECC bit
    dae47bf0222e platform/x86: think-lmi: Add possible_values for ThinkStation
    e91ffea491af platform/x86: think-lmi: only display possible_values if available
    fbfd5f59fa5c platform/x86: think-lmi: use correct possible_values delimiters
    2c67f08bdc5f platform/x86: think-lmi: add missing type attribute
    cb1baad60e5d ALSA: usb-audio: Fix recursive locking at XRUN during syncing
    65b723644294 mips: bmips: BCM6358: disable RAC flush for TP1
    e38b0ab9dba3 ca8210: Fix unsigned mac_len comparison with zero in ca8210_skb_tx()
    5362344e1c2c tracing: Fix wrong return in kprobe_event_gen_test.c
    19c71156fa92 tools/power turbostat: fix decoding of HWP_STATUS
    f8580c0a3279 tools/power turbostat: Fix /dev/cpu_dma_latency warnings
    6494344d7ef7 fbdev: au1200fb: Fix potential divide by zero
    f9c5deee4b66 fbdev: lxfb: Fix potential divide by zero
    86c8db5d12f4 fbdev: intelfb: Fix potential divide by zero
    c22a8d3ae54a fbdev: nvidia: Fix potential divide by zero
    9de1325bc2cc sched_getaffinity: don't assume 'cpumask_size()' is fully initialized
    f9584dcc5549 fbdev: tgafb: Fix potential divide by zero
    d23f65f08247 ALSA: hda/ca0132: fixup buffer overrun at tuning_ctl_set()
    cb1bc1223906 ALSA: asihpi: check pao in control_message()
    1ec57d1bed38 net: hsr: Don't log netdev_err message on unknown prp dst node
    4e90e52616f6 x86/PVH: obtain VGA console info in Dom0
    5175ed17a5a8 md: avoid signed overflow in slot_store()
    da35a4e6eee5 ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
    0725daaa9a87 xfrm: Zero padding when dumping algos and encap
    7258c58f6e25 bus: imx-weim: fix branch condition evaluates to a garbage value
    07987422023e ksmbd: don't terminate inactive sessions after a few seconds
    0c873ab68fcb kcsan: avoid passing -g for test
    b27e663cf1e5 kernel: kcsan: kcsan_test: build without structleak plugin
    1450c82a16bb usb: dwc3: gadget: Add 1ms delay after end transfer command without IOC
    1536e51c30ad usb: dwc3: gadget: move cmd_endtransfer to extra function
    0f7fddb5a9b7 fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
    c957cbb87315 Linux 5.15.105
    ec5b78143535 NFSD: fix use-after-free in __nfs42_ssc_open()
    a9e53869cb43 ocfs2: fix data corruption after failed write
    5229bb42fba2 mm: kfence: fix using kfence_metadata without initialization in show_object()
    7a74603c248d sched/fair: Sanitize vruntime of entity being migrated
    ab938a0c81eb sched/fair: sanitize vruntime of entity being placed
    1ac20290f6b4 dm crypt: avoid accessing uninitialized tasklet
    eb485b7404a2 dm crypt: add cond_resched() to dmcrypt_write()
    443c9d522397 dm stats: check for and propagate alloc_percpu failure
    272dc775a52f i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
    8e69fae32e88 firmware: arm_scmi: Fix device node validation for mailbox transport
    02b296978a21 tee: amdtee: fix race condition in amdtee_open_session
    9c7ee9471550 riscv: Handle zicsr/zifencei issues between clang and binutils
    c10023682096 riscv: mm: Fix incorrect ASID argument when flushing TLB
    555ec88c75ad drm/i915: Preserve crtc_state->inherited during state clearing
    476b3f03dca8 drm/i915/active: Fix missing debug object activation
    ef3c38f33b62 drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi
    fdd5b4e37200 drm/meson: fix missing component unbind on bind errors
    071a69cde196 drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found
    5bb105cc72be nilfs2: fix kernel-infoleak in nilfs_ioctl_wrap_copy()
    8ec5e996c2f8 wifi: mac80211: fix qos on mesh interfaces
    51a8534c0f35 ksmbd: return unsupported error on smb1 mount
    496e186bc005 ksmbd: return STATUS_NOT_SUPPORTED on unsupported smb2.0 dialect
    604a4a6f8414 ksmbd: set FILE_NAMED_STREAMS attribute in FS_ATTRIBUTE_INFORMATION
    52e7ac849971 KVM: x86: hyper-v: Avoid calling kvm_make_vcpus_request_mask() with vcpu_mask==NULL
    6f682b070f46 kfence: avoid passing -g for test
    7dd27aed9c45 usb: ucsi: Fix NULL pointer deref in ucsi_connector_change()
    27c40c3aa4b0 usb: chipidea: core: fix possible concurrent when switch role
    ef74a7ffe77c usb: chipdea: core: fix return -EINVAL if request role is the same with current role
    76e8bd0f5544 usb: cdnsp: changes PCI Device ID to fix conflict with CNDS3 driver
    e4df290deb33 usb: cdnsp: Fixes issue with redundant Status Stage
    5662d139e6e1 usb: cdns3: Fix issue with using incorrect PCI device function
    bb579b3f75c6 usb: typec: tcpm: fix warning when handle discover_identity message
    0f84b0b71179 dm thin: fix deadlock when swapping to thin device
    66e5577cabc3 igb: revert rtnl_lock() that causes deadlock
    a179d3450c0c arm64: dts: imx8mm-nitrogen-r2: fix WM8960 clock name
    ed1869a25286 lockd: set file_lock start and end when decoding nlm4 testargs
    0bfadbbcd7a5 fsverity: Remove WQ_UNBOUND from fsverity read workqueue
    992a3f3e8a0c fscrypt: destroy keyring after security_sb_delete()
    287bb9a918e2 mm/slab: Fix undefined init_cache_node_node() for NUMA and !SMP
    408dcd7c3883 efi: sysfb_efi: Fix DMI quirks not working for simpledrm
    b131989797f7 usb: gadget: u_audio: don't let userspace block driver unbind
    cba76e1fb896 usb: dwc2: fix a devres leak in hw_enable upon suspend resume
    c83f7ba71d38 scsi: core: Add BLIST_SKIP_VPD_PAGES for SKhynix H28U74301AMR
    df0462e4b361 cifs: print session id while listing open files
    9a45df4ec39b cifs: empty interface list when server doesn't support query interfaces
    169a41073993 act_mirred: use the backlog for nested calls to mirred ingress
    5b347652aebd net/sched: act_mirred: better wording on protection against excessive stack growth
    f6cf5f13fa5b sh: sanitize the flags on sigreturn
    91bcae3df2a4 net: usb: qmi_wwan: add Telit 0x1080 composition
    f631af07cfc9 net: usb: cdc_mbim: avoid altsetting toggling for Telit FE990
    41b67e621b93 scsi: storvsc: Handle BlockSize change in Hyper-V VHD/VHDX file
    60643ef5a139 scsi: lpfc: Avoid usage of list iterator variable after loop
    67b8343998b8 scsi: lpfc: Check kzalloc() in lpfc_sli4_cgn_params_read()
    d758f543cea2 scsi: ufs: core: Add soft dependency on governor_simpleondemand
    0267cd047133 scsi: hisi_sas: Check devm_add_action() return value
    83e7b1db4523 scsi: target: iscsi: Fix an error message in iscsi_check_key()
    40c216efb327 selftests/bpf: check that modifier resolves after pointer
    8bf8d5dade4c m68k: Only force 030 bus error if PC not in exception table
    8c1d378b8c22 HID: intel-ish-hid: ipc: Fix potential use-after-free in work function
    d143e327c972 ca8210: fix mac_len negative array access
    3056af1a2d46 HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
    3e9aac5e935f drm/cirrus: NULL-check pipe->plane.state->fb in cirrus_pipe_update()
    a4c639012ad0 riscv: Bump COMMAND_LINE_SIZE value to 1024
    c2cf47dc0822 ACPI: x86: utils: Add Cezanne to the list for forcing StorageD3Enable
    8dc1c6efd7d2 thunderbolt: Rename shadowed variables bit to interrupt_bit and auto_clear_bit
    a74a2e124c48 thunderbolt: Use const qualifier for `ring_interrupt_index`
    752007df40ca thunderbolt: Add missing UNSET_INBOUND_SBTX for retimer access
    8f7525a8b98c thunderbolt: Disable interrupt auto clear for rings
    56cba129dd11 thunderbolt: Call tb_check_quirks() after initializing adapters
    d50a527b4815 thunderbolt: Use scale field when allocating USB3 bandwidth
    7ab026561cb0 uas: Add US_FL_NO_REPORT_OPCODES for JMicron JMS583Gen 2
    d6f7377528d2 scsi: qla2xxx: Perform lockless command completion in abort path
    6295b3ec64a3 scsi: qla2xxx: Synchronize the IOCB count to be in order
    f1e2ab24c4ea hwmon (it87): Fix voltage scaling for chips with 10.9mV ADCs
    5662f50cd9e9 hwmon: fix potential sensor registration fail if of_node is missing
    8f6b943f9fc9 entry/rcu: Check TIF_RESCHED _after_ delayed RCU wake-up
    eb57d0dcd5da entry: Snapshot thread flags
    d9c53eb46217 thread_info: Add helpers to snapshot thread flags
    ebea2e16504f platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl
    8efae2112d91 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work
    c35fd1b9b90a Bluetooth: L2CAP: Fix responding with wrong PDU type
    b203ee4be2f1 Bluetooth: btqcomsmd: Fix command timeout after setting BD address
    771d3c1c949b net: mdio: thunder: Add missing fwnode_handle_put()
    b433fbf17603 net: dsa: mt7530: move setting ssc_delta to PHY_INTERFACE_MODE_TRGMII case
    01c727402ddc net: dsa: mt7530: move lowering TRGMII driving to mt7530_setup()
    5163bb8e4c6b net: dsa: mt7530: move enabling disabling core clock to mt7530_pll_setup()
    a76d35f3448c gve: Cache link_speed value from device
    c33344b79722 ksmbd: fix possible refcount leak in smb2_open()
    96039c44ae47 ksmbd: add low bound validation to FSCTL_QUERY_ALLOCATED_RANGES
    d897216325d7 ksmbd: add low bound validation to FSCTL_SET_ZERO_DATA
    7a83bb6d56a5 hvc/xen: prevent concurrent accesses to the shared ring
    29e80d7964cf nvme-tcp: fix nvme_tcp_term_pdu to match spec
    c7037dea19f0 net/sonic: use dma_mapping_error() for error check
    b41f37dbd9cd erspan: do not use skb_mac_header() in ndo_start_xmit()
    4a8286baf22e atm: idt77252: fix kmemleak when rmmod idt77252
    48f52431af99 net: dsa: tag_brcm: legacy: fix daisy-chained switches
    388188fb58be net/mlx5: E-Switch, Fix an Oops in error handling code
    6068a6db3a96 net/mlx5: Read the TC mapping of all priorities on ETS query
    4df1f2d36bdc net/mlx5: Fix steering rules cleanup
    2b0f1716c107 net/mlx5e: Set uplink rep as NETNS_LOCAL
    54869daa6a43 bpf: Adjust insufficient default bpf_jit_limit
    9b2e9105230f i40e: fix flow director packet filter programming
    7a29799fc141 iavf: fix hang on reboot with ice
    ce19c70f308f keys: Do not cache key in task struct if key is requested from kernel thread
    0cb68c307e72 bootconfig: Fix testcase to increase max node
    90874b76e5f8 octeontx2-vf: Add missing free for alloc_percpu
    77d2f5ff9365 net/ps3_gelic_net: Use dma_mapping_error
    cc8531d0e223 net/ps3_gelic_net: Fix RX sk_buff length
    8c4a180dc123 net: qcom/emac: Fix use after free bug in emac_remove due to race condition
    e686b78a003a drm/i915/gt: perform uc late init after probe error injection
    cbb8bac2388a net: mdio: fix owner field for mdio buses registered using ACPI
    b94af62cdd50 net: mdio: fix owner field for mdio buses registered using device-tree
    0bdf593390e7 net: phy: Ensure state transitions are processed from phy_stop()
    4ab9e85a5ce0 xirc2ps_cs: Fix use after free bug in xirc2ps_detach
    e42d3bde4ec0 qed/qed_sriov: guard against NULL derefs from qed_iov_get_vf_info
    ba6c40227108 net: usb: smsc95xx: Limit packet length to skb->len
    9bbb3d3f218f net: dsa: b53: mmap: fix device tree support
    9311e7a554df scsi: scsi_dh_alua: Fix memleak for 'qdata' in alua_activate()
    257738627a9b i2c: hisi: Only use the completion interrupt to finish the transfer
    c0deddabb278 i2c: imx-lpi2c: check only for enabled interrupt flags
    b82b0a0eea27 igc: fix the validation logic for taprio's gate list
    68ebdcba619a igbvf: Regard vf reset nack as success
    9630432b427f intel/igbvf: free irq on the error path in igbvf_request_msix()
    2afe7aebf642 iavf: fix non-tunneled IPv6 UDP packet type and hashing
    078e049c49a6 iavf: fix inverted Rx hash condition leading to disabled hash
    3cfc3564411a xsk: Add missing overflow check in xdp_umem_reg
    1d59b8fae0c3 arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes
    98c9bca167e6 ARM: dts: imx6sl: tolino-shine2hd: fix usbotg1 pinctrl
    ed5f3c0b95bd ARM: dts: imx6sll: e60k02: fix usbotg1 pinctrl
    0fdb1cc4fe52 power: supply: da9150: Fix use after free bug in da9150_charger_remove due to race condition
    4ca3fd39c72e power: supply: bq24190: Fix use after free bug in bq24190_remove due to race condition
    10ce6db6253d power: supply: bq24190_charger: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
    0b54d75aa43a net: tls: fix possible race condition between do_tls_getsockopt_conf() and do_tls_setsockopt_conf()
    2ebe231abaf1 trace/hwlat: Do not start per-cpu thread if it is already running
    7743dd873f2a trace/hwlat: make use of the helper function kthread_run_on_cpu()
    909c5eb6ed76 kthread: add the helper function kthread_run_on_cpu()
    09b51f10bc1f serial: 8250: ASPEED_VUART: select REGMAP instead of depending on it
    cfb64de61f07 serial: 8250: SERIAL_8250_ASPEED_VUART should depend on ARCH_ASPEED
    90530e7214c8 tty: serial: fsl_lpuart: fix race on RX DMA shutdown
    b7d0fbe4976d tty: serial: fsl_lpuart: switch to new dmaengine_terminate_* API
    90a77bca4240 serial: fsl_lpuart: Fix comment typo
    bde1ae240751 tracing/hwlat: Replace sched_setaffinity with set_cpus_allowed_ptr
    5255e6d49ff9 perf: fix perf_event_context->time
    ac5f88642cb2 perf/core: Fix perf_output_begin parameter is incorrectly invoked in perf_event_bpf_output
    d2430d45f1a0 interconnect: qcom: osm-l3: fix icc_onecell_data allocation
    115472395b0a Linux 5.15.104
    de3ef7ba684a perf: Fix check before add_event_to_groups() in perf_group_detach()
    02904e8a2f65 HID: uhid: Over-ride the default maximum data buffer value with our own
    3df32812eb4b HID: core: Provide new max_buffer_size attribute to over-ride the default
    ffe2318405e6 PCI/DPC: Await readiness of secondary bus after reset
    09795f82aecc PCI: Unify delay handling for reset and resume
    f4ba55411cc8 io_uring: avoid null-ptr-deref in io_arm_poll_handler
    6ab7d3361755 drm/i915/active: Fix misuse of non-idle barriers as fence trackers
    71dffdd4764c drm/i915: Don't use stolen memory for ring buffers with LLC
    86db319d25db x86/resctrl: Clear staged_config[] before and after it is used
    0186f7656940 x86/mm: Fix use of uninitialized buffer in sme_enable()
    09d3a46c8c02 x86/mce: Make sure logged MCEs are processed after sysfs update
    8575c98224b2 cpuidle: psci: Iterate backwards over list in psci_pd_remove()
    b3d042638049 net: phy: nxp-c45-tja11xx: fix MII_BASIC_CONFIG_REV bit
    f3de49782612 trace/hwlat: Do not wipe the contents of per-cpu thread data
    cb72b4bd81b9 fbdev: stifb: Provide valid pixelclock and add fb_check_var() checks
    e9cdd3f722b6 mmc: sdhci_am654: lower power-on failed message severity
    b02de083c7c7 mm/userfaultfd: propagate uffd-wp bit when PTE-mapping the huge zeropage
    87b9ac7bd301 ice: avoid bonding causing auxiliary plug/unplug under RTNL lock
    520e134431ac nvme-pci: add NVME_QUIRK_BOGUS_NID for Netac NV3000
    2a0d71fabfeb ftrace: Fix invalid address access in lookup_rec() when index is 0
    ad7f9c6982b1 mptcp: fix lockdep false positive in mptcp_pm_nl_create_listen_socket()
    f4afee17de43 mptcp: avoid setting TCP_CLOSE state twice
    64473c18d27a mptcp: add ro_after_init for tcp{,v6}_prot_override
    c1df4bed3d91 mptcp: fix possible deadlock in subflow_error_report
    ccf44ffbbf25 drm/amd/pm: Fix sienna cichlid incorrect OD volage after resume
    64ef8aa3910b drm/sun4i: fix missing component unbind on bind errors
    5cfb617967b0 drm/shmem-helper: Remove another errant put in error path
    d1d826954475 riscv: asid: Fixup stale TLB entry cause application crash
    aeefcfc57978 Revert "riscv: mm: notify remote harts about mmu cache updates"
    882cbe0c5d6a ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book2 Pro
    36d75e1f7357 ALSA: hda: intel-dsp-config: add MTL PCI id
    9c2f09add608 KVM: nVMX: add missing consistency checks for CR0 and CR4
    77fcc52d2919 cifs: Fix smb2_set_path_size()
    9b9a118cc428 tracing: Make tracepoint lockdep check actually test something
    2846bf67cd24 tracing: Check field value in hist_field_name()
    2dd00dbc6a5a tracing: Make splice_read available again
    fd4738ae1a0c interconnect: exynos: fix node leak in probe PM QoS error path
    2e0b13a18272 interconnect: fix mem leak when freeing nodes
    62b74cf8bcee s390/ipl: add missing intersection check to ipl_report handling
    86afb633beaa firmware: xilinx: don't make a sleepable memory allocation from an atomic context
    250a11f9c43b serial: 8250_fsl: fix handle_irq locking
    4c23bf093449 serial: 8250_em: Fix UART port type
    53a5ab3a8991 tty: serial: fsl_lpuart: skip waiting for transmission complete when UARTCTRL_SBK is asserted
    1c93c42c7bb2 ext4: fix possible double unlock when moving a directory
    bec1bea2fa97 drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes
    f9252605b8f3 sh: intc: Avoid spurious sizeof-pointer-div warning
    0fc608a115ce net/9p: fix bug in client create for .L
    2fece63b55c5 drm/amdkfd: Fix an illegal memory access
    1aec41c98cce ext4: fix task hung in ext4_xattr_delete_inode
    499fef2030fb ext4: update s_journal_inum if it changes after journal replay
    088da6b80539 ext4: fail ext4_iget if special inode unallocated
    eccd017165db jffs2: correct logic when creating a hole in jffs2_write_begin
    4392e87c47e8 mmc: atmel-mci: fix race between stop command and start of next command
    0c511f926b00 media: m5mols: fix off-by-one loop termination error
    233058efee02 hwmon: (ltc2992) Set `can_sleep` flag for GPIO chip
    b576de01da80 hwmon: (adm1266) Set `can_sleep` flag for GPIO chip
    c80b2acdb049 kconfig: Update config changed flag before calling callback
    52f64c5fc0d6 hwmon: tmp512: drop of_match_ptr for ID table
    3f3576e25bfe hwmon: (ucd90320) Add minimum delay between bus accesses
    9cc4aa40b58c hwmon: (ina3221) return prober error code
    7091951c2ca9 hwmon: (xgene) Fix use after free bug in xgene_hwmon_remove due to race condition
    a8e42dbfc493 hwmon: (adt7475) Fix masking of hysteresis registers
    d1f4eda1ae85 hwmon: (adt7475) Display smoothing attributes in correct order
    93c8cbeb1b2b bonding: restore bond's IFF_SLAVE flag if a non-eth dev enslave fails
    d424c7b1c478 bonding: restore IFF_MASTER/SLAVE flags on bond enslave ether type change
    8a1ce024f1f6 ethernet: sun: add check for the mdesc_grab()
    030393041f8c qed/qed_mng_tlv: correctly zero out ->min instead of ->hour
    a7836253349e selftests: net: devlink_port_split.py: skip test if no suitable device available
    3cfdefdaaa4b net/iucv: Fix size of interrupt data
    7bf0eac3fdd2 net: usb: smsc75xx: Move packet length check to prevent kernel panic in skb_pull
    c99779740100 ipv4: Fix incorrect table ID in IOCTL path
    340dd8f1942a sh_eth: avoid PHY being resumed when interface is not up
    d5236286398d ravb: avoid PHY being resumed when interface is not up
    7059be754873 net: dsa: mv88e6xxx: fix max_mtu of 1492 on 6165, 6191, 6220, 6250, 6290
    b89a453c6918 ice: xsk: disable txq irq before flushing hw
    d1bfd4cf6bb8 block: sunvdc: add check for mdesc_grab() returning NULL
    f1d5888a5efe nvmet: avoid potential UAF in nvmet_req_complete()
    07eac3310e00 nvme: fix handling single range discard request
    fff9441da1c3 block: null_blk: Fix handling of fake timeout request
    6d3ff07347d3 drm/bridge: Fix returned array size name for atomic_get_input_bus_fmts kdoc
    105db6574281 net: usb: smsc75xx: Limit packet length to skb->len
    b615238e5bc0 net/smc: fix deadlock triggered by cancel_delayed_work_syn()
    84dd9cc34014 nfc: st-nci: Fix use after free bug in ndlc_remove due to race condition
    edc0a34e277b net: phy: smsc: bail out in lan87xx_read_status if genphy_read_status fails
    e0a557fc1daf net: tunnels: annotate lockless accesses to dev->needed_headroom
    407badf73ec9 loop: Fix use-after-free issues
    a0316de981ce net: dsa: mt7530: set PLL frequency and trgmii only when trgmii is used
    f48468b27c0b net: dsa: mt7530: remove now incorrect comment regarding port 5
    6ffa05700100 qed/qed_dev: guard against a possible division by zero
    b108bd9e6be0 net/smc: fix NULL sndbuf_desc in smc_cdc_tx_handler()
    d59d2561da73 drm/i915/psr: Use calculated io and fast wake lines
    297ae18bd2cd drm/i915/display: clean up comments
    21d679cb983e drm/i915/display/psr: Handle plane and pipe restrictions at every page flip
    8c80b12e697f drm/i915/display/psr: Use drm damage helpers to calculate plane damaged area
    eea001d88ffd drm/i915/display: Workaround cursor left overs with PSR2 selective fetch enabled
    437bb839e36c PCI: s390: Fix use-after-free of PCI resources with per-function hotplug
    ee6ef8137789 vdpa_sim: set last_used_idx as last_avail_idx in vdpasim_queue_ready
    1cdbaf18a5e4 vdpa_sim: not reset state in vdpasim_queue_ready
    4ff826952665 i40e: Fix kernel crash during reboot when adapter is in recovery mode
    ecaa1bf50635 ipvlan: Make skb->skb_iif track skb->dev for l3s mode
    2bee84369b76 nfc: pn533: initialize struct pn533_out_arg properly
    ad07290d63ff tcp: tcp_make_synack() can be called from process context
    2a764d55e938 scsi: core: Fix a procfs host directory removal regression
    a219cabadaee netfilter: nft_redir: correct value of inet type `.maxattrs`
    de03d130176b netfilter: nft_redir: correct length for loading protocol registers
    d2a2ad64b9b6 netfilter: nft_masq: correct length for loading protocol registers
    343fe451e6d3 netfilter: nft_nat: correct length for loading protocol registers
    256bcf626b7c ALSA: hda: Match only Intel devices with CONTROLLER_IN_GPU()
    9937f784a608 scsi: mpt3sas: Fix NULL pointer access in mpt3sas_transport_port_add()
    29cb0f6c1dd8 docs: Correct missing "d_" prefix for dentry_operations member d_weak_revalidate
    a5a1a7112e98 clk: HI655X: select REGMAP instead of depending on it
    0f78e36f652a drm/meson: fix 1px pink line on GXM when scaling video overlay
    630f8a857578 cifs: Move the in_send statistic to __smb_send_rqst()
    418bde7227dd drm/panfrost: Don't sync rpm suspension after mmu flushing
    b9cd2f875525 xfrm: Allow transport-mode states with AF_UNSPEC selector

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 38daab6bbe..32fa7c9c07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e1ca9a177aff19013178aa30a8eccb4d7b2b67d7"
-SRCREV_meta ?= "441f5fe00073620cec471166cf6e94c4ef9c69b2"
+SRCREV_machine ?= "8f08817edd40a17f6653c1d83334e7ce80d63120"
+SRCREV_meta ?= "c115a945a64f98eed4cf20a90dbf3043e99c97b9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.103"
+LINUX_VERSION ?= "5.15.106"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index eb6af62015..c511486d23 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.103"
+LINUX_VERSION ?= "5.15.106"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4ae6c9a73f4e6e356186a541e3fcbea4fa6a09f1"
-SRCREV_meta ?= "441f5fe00073620cec471166cf6e94c4ef9c69b2"
+SRCREV_machine ?= "e0157de1c901f48dcdcae0e0ce7ae20798617a5e"
+SRCREV_meta ?= "c115a945a64f98eed4cf20a90dbf3043e99c97b9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 41f20c96dd..3c6aec60b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "21687086c27bb112f19b0aac455d800961c0b830"
-SRCREV_machine:qemuarm64 ?= "7144f86a73fe2ffe4fe57c9e6cf28d8fc8db4b6a"
-SRCREV_machine:qemumips ?= "557c06060cb218ade536fccc66f8f3e755537f31"
-SRCREV_machine:qemuppc ?= "db19dbdcdf51b9d2a071dcf180ba9e20b8286e9b"
-SRCREV_machine:qemuriscv64 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
-SRCREV_machine:qemuriscv32 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
-SRCREV_machine:qemux86 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
-SRCREV_machine:qemux86-64 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
-SRCREV_machine:qemumips64 ?= "6f1dbe8c258d49f4dba59827124dfe9aa2c151db"
-SRCREV_machine ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
-SRCREV_meta ?= "441f5fe00073620cec471166cf6e94c4ef9c69b2"
+SRCREV_machine:qemuarm ?= "e65b22cbbc83e9d36e8e1ec344e7774c70e8e570"
+SRCREV_machine:qemuarm64 ?= "b996e66c4b696160d196ff6f5204ea125a39c1e9"
+SRCREV_machine:qemumips ?= "4f6deb38925508846a45bc33de0bf35b4113c946"
+SRCREV_machine:qemuppc ?= "1b715c2fa0c9224df807807695a1048386c5a355"
+SRCREV_machine:qemuriscv64 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
+SRCREV_machine:qemuriscv32 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
+SRCREV_machine:qemux86 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
+SRCREV_machine:qemux86-64 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
+SRCREV_machine:qemumips64 ?= "6465e8e14e57d6725cbee376f3a2cb9361d29688"
+SRCREV_machine ?= "686a68a75222a0fadc1f829334596b02534dcb42"
+SRCREV_meta ?= "c115a945a64f98eed4cf20a90dbf3043e99c97b9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8020ae3c051d1c9ec7b7a872e226f9720547649b"
+SRCREV_machine:class-devupstream ?= "d86dfc4d95cd218246b10ca7adf22c8626547599"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.103"
+LINUX_VERSION ?= "5.15.106"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


