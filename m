Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1AAC3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:31 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.30061.1722791308679229675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uHkEK3nc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d1c655141so7213858b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791308; x=1723396108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oeYsqr10kdIq9mUn+P0gW4E30ypmLOC3ndR0oJQzio=;
        b=uHkEK3ncIIULSYvGRmF/Ln3Vq8RkcmA4JJvQpxIjvG45o5MnNh2NLEF7guF6A06xpo
         6vUd9gkqX3QtDcFwldCDsr9VyXQIoap5FzNHFJPFMYlFlTlRyqZxtlgPUn6XPiGNymJQ
         hJ5nUiRRdSt9i8Z/Lvm84j4eVga+h0Uu4/lMHE4nMfHya4bZPhc3l3hFgxbmV0ZvBQVB
         obZHrMFwPiyxmwKU18Ui2AXwHjsC2XAO40o6s8szII/s/prpm5HQ9iIKLcnHrU8dtue4
         uk/QfJYJnfN00sQQscj14pZ4cPiycNtKkk5G9PKgIoCdinUWeX6wV1ZDkeEcR/uGMCEK
         w8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791308; x=1723396108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oeYsqr10kdIq9mUn+P0gW4E30ypmLOC3ndR0oJQzio=;
        b=T6f47th/h9MYKTEqw7UvKNwgzqITOUe+4D3mZBzJ+BWGh+0brzClwTGRczN7yOAvB7
         qq+MRyXxvn6daE4C/n0GQY2F/h0gYlkdR9crfFyPWhJhXeQUptDvczh60IXduiTsQAf2
         w+++FkrDfdTA1GfF/OLO++SBvQRoDBmWvzejkdAAUPE/u42Tw3judednCHRAmjvnqg/P
         CGyodtwwgvTCWsXWLVbWfPJEUJcDQKRQDFuhw0UTNhMTkf4etT3+83/CVNDtdeIx5vUu
         efse8LB1DtgiSfZQqMlNIEN4q9mlRYD3+hTR/rADveirWVuK8ZztLElAwDKPZNTe6eDK
         8+sw==
X-Gm-Message-State: AOJu0Yy8f2x3ENxTacvLI0Bl1GGq7ET2yBTUEvGBNrTTKI5ZBXNf1KEJ
	rlnpIQyZPM1bm6RbpI/ZH0RucD9gPggXR0ilTn3Cj+dU/bicQixBfoA2zk2O22gL0z4hL2Nr8ge
	aJytq+w==
X-Google-Smtp-Source: AGHT+IGBBySUaNH2kPve0ey4BTPeRaEYGImEOcz6a16efX/aTqNeGDh85kdhwo2SgI8mEMQuUSV86g==
X-Received: by 2002:a05:6a21:3384:b0:1c4:c7ae:ecea with SMTP id adf61e73a8af0-1c69955109fmr943612637.11.1722791307420;
        Sun, 04 Aug 2024 10:08:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] linux-yocto/5.15: update to v5.15.160
Date: Sun,  4 Aug 2024 10:08:10 -0700
Message-Id: <973963d56804139193e40fb960aae0b76ed0de46.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722791084.git.steve@sakoman.com>
References: <cover.1722791084.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202954

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    c61bd26ae81a Linux 5.15.160
    0df819cac13e docs: kernel_include.py: Cope with docutils 0.21
    1786e0c96af1 admin-guide/hw-vuln/core-scheduling: fix return type of PR_SCHED_CORE_GET
    96f650995c70 KEYS: trusted: Do not use WARN when encode fails
    00548ac6b144 remoteproc: mediatek: Make sure IPI buffer fits in L2TCM
    da6504c63f78 serial: kgdboc: Fix NMI-safety problems from keyboard reset code
    1768f29972cd usb: typec: ucsi: displayport: Fix potential deadlock
    ddbcd7d36e38 binder: fix max_thread type inconsistency
    7e6d6f27522b drm/amdgpu: Fix possible NULL dereference in amdgpu_ras_query_error_status_helper()
    c9f2b6d88e65 KVM: x86: Clear "has_error_code", not "error_code", for RM exception injection
    2750d7641d08 netlink: annotate data-races around sk->sk_err
    7cff4103be7c netlink: annotate lockless accesses to nlk->max_recvmsg_len
    3ade391adc58 net: tls: handle backlogging of crypto requests
    f17d21ea7391 tls: fix race between async notify and socket close
    94afddde1e92 net: tls: factor out tls_*crypt_async_wait()
    fb782814bf09 tls: extract context alloc/initialization out of tls_set_sw_offload
    704402f913b8 tls: rx: simplify async wait
    cc4fac519d28 net: bcmgenet: synchronize UMAC_CMD access
    1d5d18efc181 net: bcmgenet: synchronize EXT_RGMII_OOB_CTRL access
    52c4287f23c8 Revert "selftests: mm: fix map_hugetlb failure on 64K page size systems"
    1e6914fa8e77 KEYS: trusted: Fix memory leak in tpm2_key_encode()
    9b8a8e5e8129 nfsd: don't allow nfsd threads to be signalled.
    44889eacfe1f pinctrl: core: handle radix_tree_insert() errors in pinctrl_register_one_pin()
    a32c8f951c8a drm/amd/display: Fix division by zero in setup_dsc_config
    83655231580b Linux 5.15.159
    f3a1787dc482 md: fix kmemleak of rdev->serial
    ed79b93f725c keys: Fix overwrite of key expiration on instantiation
    580bcd6bf24f Bluetooth: qca: fix firmware check error path
    b91390f4e828 Bluetooth: qca: fix NVM configuration parsing
    ed53949cc92e Bluetooth: qca: add missing firmware sanity checks
    d68dbfb837c0 regulator: core: fix debugfs creation regression
    1a6be4e70790 hwmon: (pmbus/ucd9000) Increase delay from 250 to 500us
    9518b79bfd2f net: fix out-of-bounds access in ops_init
    b7bab33c4623 drm/vmwgfx: Fix invalid reads in fence signaled events
    c3d84a764ed1 mei: me: add lunar lake point M DID
    2a47da1cd81f slimbus: qcom-ngd-ctrl: Add timeout for wait operation
    ba3c118cff7b dyndbg: fix old BUG_ON in >control parser
    866d84456494 ASoC: ti: davinci-mcasp: Fix race condition during probe
    40098e3fd40d ASoC: tegra: Fix DSPK 16-bit playback
    1cbe6d8999db net: bcmgenet: synchronize use of bcmgenet_set_rx_mode()
    66116556076f tipc: fix UAF in error path
    2a512ca151da iio: accel: mxc4005: Interrupt handling fixes
    93cfed3aea7c iio:imu: adis16475: Fix sync mode setting
    eeee7fc41562 dt-bindings: iio: health: maxim,max30102: fix compatible check
    dc941fec0719 mptcp: ensure snd_nxt is properly initialized on connect
    c5ee5f184da9 btrfs: add missing mutex_unlock in btrfs_relocate_sys_chunks()
    f1f364ffe274 ALSA: hda/realtek: Fix mute led of HP Laptop 15-da3001TU
    2ddbb35a01e7 usb: dwc3: core: Prevent phy suspend during init
    f78ff8825eb8 usb: xhci-plat: Don't include xhci.h
    bad094bd0827 usb: gadget: f_fs: Fix a race condition when processing setup packets.
    0bbb498b8e3e usb: gadget: composite: fix OS descriptors w_value logic
    855717130362 usb: ohci: Prevent missed ohci interrupts
    f157133326cc usb: Fix regression caused by invalid ep0 maxpacket in virtual SuperSpeed device
    a6b9bffbcbb8 usb: typec: ucsi: Fix connector check on init
    5f499d7421ac usb: typec: ucsi: Check for notifications after init
    9f112211cc54 arm64: dts: qcom: Fix 'interrupt-map' parent address cells
    4a89ac4b0921 Reapply "drm/qxl: simplify qxl_fence_wait"
    79f988d3ffc1 firewire: nosy: ensure user_length is taken into account when fetching packet contents
    5ef9681f73b8 btrfs: fix kvcalloc() arguments order in btrfs_ioctl_send()
    890d39f6d974 ACPI: CPPC: Fix access width used for PCC registers
    7fcaa31c0047 ACPI: CPPC: Fix bit_offset shift in MASK_VAL() macro
    6dfd79ed04c5 Revert "Revert "ACPI: CPPC: Use access_width over bit_width for system memory accesses""
    3c7013a87124 drm/amd/display: Atom Integrated System Info v2_2 for DCN35
    edf5238df340 drm/connector: Add \n to message about demoting connector force-probes
    5a5cc5ca725c drm/meson: dw-hdmi: add bandgap setting for g12
    f8229be8d627 drm/meson: dw-hdmi: power up phy on device init
    c5c8616b3534 net: hns3: fix port vlan filter not disabled issue
    2720b9792a52 net: hns3: split function hclge_init_vlan_config()
    45b6316f2373 net: hns3: use appropriate barrier function after setting a bit value
    f37df6f9b5f6 net: hns3: change type of numa_node_mask as nodemask_t
    1e91931e316d net: hns3: refactor hclge_cmd_send with new hclge_comm_cmd_send API
    f9315f3ad186 net: hns3: create new set of unified hclge_comm_cmd_send APIs
    dd69c1c99a54 net: hns3: create new cmdq hardware description structure hclge_comm_hw
    ed3c393fb24f net: hns3: refactor hns3 makefile to support hns3_common module
    50964654df19 net: hns3: direct return when receive a unknown mailbox message
    5789bfcb9ff9 net: hns3: refactor function hclge_mbx_handler()
    52acec0106be net: hns3: add query vf ring and vector map relation
    bc8fb44566ff net: hns3: add log for workqueue scheduled late
    fee4a1e6564c net: hns3: using user configure after hardware reset
    35f8ee4d43ee net: hns3: PF support get unicast MAC address space assigned by firmware
    35297fc68de3 ipv6: fib6_rules: avoid possible NULL dereference in fib6_rule_action()
    21d85ee2d388 net: bridge: fix corrupted ethernet header on multicast-to-unicast
    4ff334cade9d phonet: fix rtm_phonet_notify() skb allocation
    bb739796564a hwmon: (corsair-cpro) Protect ccp->wait_input_report with a spinlock
    073ca0c27b36 hwmon: (corsair-cpro) Use complete_all() instead of complete() in ccp_raw_event()
    6e6644c0a4f8 hwmon: (corsair-cpro) Use a separate buffer for sending commands
    f3c1bf3054f9 rtnetlink: Correct nested IFLA_VF_VLAN_LIST attribute validation
    e97e16433eb4 Bluetooth: l2cap: fix null-ptr-deref in l2cap_chan_timeout
    6a18eeb1b3bb Bluetooth: Fix use-after-free bugs caused by sco_sock_timeout
    27b0284d8be1 tcp: Use refcount_inc_not_zero() in tcp_twsk_unique().
    2552c9d9440f tcp: defer shutdown(SEND_SHUTDOWN) for TCP_SYN_RECV sockets
    20ac71bee028 ARM: 9381/1: kasan: clear stale stack poison
    624cd60d6413 xfrm: Preserve vlan tags for transport mode software GRO
    24dd9b08df71 qibfs: fix dentry leak
    ab5b5e322d12 bpf, sockmap: Improved check for empty queue
    d908a8a3de94 bpf, sockmap: Reschedule is now done through backlog
    657cfb194cdb bpf, sockmap: Convert schedule_work into delayed_work
    bbf2ed06757f bpf, sockmap: Handle fin correctly
    ab3128de6edb bpf, sockmap: TCP data stall on recv before accept
    4105f0c9af39 net:usb:qmi_wwan: support Rolling modules
    90850083ceec drm/nouveau/dp: Don't probe eDP ports twice harder
    859e2448be41 fs/9p: drop inodes immediately on non-.L too
    4d36b9b7ec4f clk: Don't hold prepare_lock when calling kref_put()
    7ca04b83c109 gpio: crystalcove: Use -ENOTSUPP consistently
    c5ad5c7a1eed gpio: wcove: Use -ENOTSUPP consistently
    d6a15d3bb81c 9p: explicitly deny setlease attempts
    2b493bd0da9b fs/9p: translate O_TRUNC into OTRUNC
    ad4f65328661 fs/9p: only translate RWX permissions for plain 9P2000
    3931e927d551 iommu: mtk: fix module autoloading
    12a2ca67f946 selftests: timers: Fix valid-adjtimex signed left-shift undefined behavior
    78f459dce4e3 MIPS: scall: Save thread_info.syscall unconditionally on entry
    5d3392552087 gpu: host1x: Do not setup DMA for virtual devices
    844fc023e9f1 blk-iocost: avoid out of bounds shift
    a95798aa08ac scsi: target: Fix SELinux error when systemd-modules loads the target module
    546e3bc295ce btrfs: always clear PERTRANS metadata during commit
    8b40803c9615 btrfs: make btrfs_clear_delalloc_extent() free delalloc reserve
    a362afd5f2a5 tools/power turbostat: Fix Bzy_MHz documentation typo
    b582c9ffcb69 tools/power turbostat: Fix added raw MSR output
    4f9cc355c328 firewire: ohci: mask bus reset interrupts between ISR and bottom half
    6f6aa8c58de4 ata: sata_gemini: Check clk_enable() result
    c4fa8b793ddb net: bcmgenet: Reset RBUF on first open
    9a41f5e19f27 ALSA: line6: Zero-initialize message buffers
    d1b93d4017c4 kbuild: Disable KCSAN for autogenerated *.mod.c intermediaries
    8943a256b06e btrfs: return accurate error code on open failure in open_fs_devices()
    93aa5ccc4478 scsi: bnx2fc: Remove spin_lock_bh while releasing resources after upload
    c259a4102c84 net: mark racy access on sk->sk_rcvbuf
    5490a385b48d wifi: cfg80211: fix rdev_dump_mpp() arguments order
    5396e63b73e3 wifi: mac80211: fix ieee80211_bss_*_flags kernel-doc
    f5d95eead358 gfs2: Fix invalid metadata access in punch_hole
    4cab23bbcb98 scsi: lpfc: Replace hbalock with ndlp lock in lpfc_nvme_unregister_port()
    e5dcdf60c9a8 scsi: lpfc: Update lpfc_ramp_down_queue_handler() logic
    f2c7f029051e scsi: lpfc: Move NPIV's transport unregistration to after resource clean up
    17db92da8be5 KVM: arm64: vgic-v2: Check for non-NULL vCPU in vgic_v2_parse_attr()
    5ee5997a085e KVM: arm64: vgic-v2: Use cpuid from userspace as vcpu_id
    f1fa9a981620 clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change
    83ac89e3797d net: gro: add flush check in udp_gro_receive_segment
    1b127feac247 drm/panel: ili9341: Use predefined error codes
    9de7f6864aa8 drm/panel: ili9341: Respect deferred probe
    8792b557eb50 s390/qeth: Fix kernel panic after setting hsuid
    b2973b79d5d0 s390/qeth: don't keep track of Input Queue count
    42c8471b0566 tipc: fix a possible memleak in tipc_buf_append
    c7af99cc2192 net: core: reject skb_copy(_expand) for fraglist GSO skbs
    bfd62ca7c87b net: bridge: fix multicast-to-unicast with fraglist GSO
    9672bf3eac4f net: dsa: mv88e6xxx: Fix number of databases for 88E6141 / 88E6341
    19275de18b2f cxgb4: Properly lock TX queue for the selftest.
    c9d48ce16330 s390/cio: Ensure the copied buf is NUL terminated
    bd2d9641a39e ALSA: hda: intel-sdw-acpi: fix usage of device_get_named_child_node()
    fd7dcd658154 ASoC: meson: cards: select SND_DYNAMIC_MINORS
    a4ae1c3692ac ASoC: meson: axg-tdm-interface: manage formatters in trigger
    fd824a1721eb ASoC: meson: axg-card: make links nonatomic
    9719b354f7d4 ASoC: meson: axg-fifo: use threaded irq to check periods
    c3b36cd49217 ASoC: meson: axg-fifo: use FIELD helpers
    56c44b7f7201 net: qede: use return from qede_parse_actions()
    62ad7f87e40b net: qede: use return from qede_parse_flow_attr() for flow_spec
    ccf2317b1565 net: qede: use return from qede_parse_flow_attr() for flower
    3a6929a6f00c net: qede: sanitize 'rc' in qede_add_tc_flower_fltr()
    97005a10bf39 s390/vdso: Add CFI for RA register to asm macro vdso_func
    e97e0051056b net l2tp: drop flow hash on forward
    5a4603fbc285 nsh: Restore skb->{protocol,data,mac_header} for outer header in nsh_gso_segment().
    ec697fbd38cb octeontx2-af: avoid off-by-one read from userspace
    0f560240b4cc bna: ensure the copied buf is NUL terminated
    12481f30128f xdp: use flags field to disambiguate broadcast redirect
    b6a7077c0ffe xdp: Add xdp_do_redirect_frame() for pre-computed xdp_frames
    a174aa99bae8 xdp: Move conversion to xdp_frame out of map functions
    7038794bbfe1 s390/mm: Fix clearing storage keys for huge pages
    e27a0db41537 s390/mm: Fix storage key clearing for guest huge pages
    fef735072de8 spi: hisi-kunpeng: Delete the dump interface of data registers in debugfs
    396df2b93943 bpf: Fix a verifier verbose message
    5965bc7535fb bpf, skmsg: Fix NULL pointer dereference in sk_psock_skb_ingress_enqueue
    16c6e4179041 bpf, kconfig: Fix DEBUG_INFO_BTF_MODULES Kconfig definition
    64ea2f585e3c regulator: mt6360: De-capitalize devicetree regulator subnodes
    76aa2440deb9 pinctrl: devicetree: fix refcount leak in pinctrl_dt_to_map()
    fe881e793fbd power: supply: mt6360_charger: Fix of_match for usb-otg-vbus regulator
    e2ebfee0833d power: rt9455: hide unused rt9455_boost_voltage_values
    ea6ce93327bd nfs: Handle error of rpc_proc_register() in nfs_net_init().
    7ceb89f4016e nfs: make the rpc_stat per net namespace
    0bbd42926082 nfs: expose /proc/net/sunrpc/nfs in net namespaces
    9e644ff63b2d sunrpc: add a struct rpc_stats arg to rpc_create_args
    764e752bf321 pinctrl: mediatek: paris: Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE
    35d704f2b9b9 pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
    5505e5578621 pinctrl: mediatek: paris: Rework mtk_pinconf_{get,set} switch/case logic
    41f88ef8ba38 pinctrl: core: delete incorrect free in pinctrl_enable()
    34674f754960 pinctrl/meson: fix typo in PDM's pin name
    ffa6e4d2d5ba pinctrl: pinctrl-aspeed-g6: Fix register offset for pinconf of GPIOR-T
    26d32bec4c6d eeprom: at24: fix memory corruption race condition
    c4137dee8e81 eeprom: at24: Probe for DDR3 thermal sensor in the SPD case
    6f35227dcd22 eeprom: at24: Use dev_err_probe for nvmem register failure
    91c6dcbc2bab ksmbd: clear RENAME_NOREPLACE before calling vfs_rename
    8f3d0bf1d0c6 ksmbd: validate request buffer size in smb2_allocate_rsp_buf()
    da2140137260 ksmbd: fix slab-out-of-bounds in smb2_allocate_rsp_buf
    ad12c74e953b wifi: nl80211: don't free NULL coalescing rule
    714794ed7a8b dmaengine: Revert "dmaengine: pl330: issue_pending waits until WFP state"
    79a61bfe2ff3 dmaengine: pl330: issue_pending waits until WFP state
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8800806194..e30d62806e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a468d787dfbf768aec6fe4a2ee736a87bdab52af"
-SRCREV_meta ?= "a9112e1b2552a7b037b2f90699505e7c1e4d6a34"
+SRCREV_machine ?= "b51720cb12df1cc8b7db2a5ff54f640c9167ca5e"
+SRCREV_meta ?= "e12e10e0b562f46c1d2f7b71c917d40dd1de339c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.158"
+LINUX_VERSION ?= "5.15.160"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d7fa046f62..5ef6eb246e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.158"
+LINUX_VERSION ?= "5.15.160"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6c57f57bb65c37c020fd6a061d6de383b4313de2"
-SRCREV_meta ?= "a9112e1b2552a7b037b2f90699505e7c1e4d6a34"
+SRCREV_machine ?= "d83ae507c0959001f23c4cc0f04db10e9afdbe6d"
+SRCREV_meta ?= "e12e10e0b562f46c1d2f7b71c917d40dd1de339c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 664637f415..9aa7df1d86 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d9608c78d05977d42b1cbd66aea61e718b5da1d4"
-SRCREV_machine:qemuarm64 ?= "9e2365972e0a5940d366147c330f135edd8788f6"
-SRCREV_machine:qemumips ?= "0be3db6f8f7efe913d84d6d307a4d079df6d423b"
-SRCREV_machine:qemuppc ?= "fd190beb19fa10615d66ab49ff15253588e0c7f6"
-SRCREV_machine:qemuriscv64 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
-SRCREV_machine:qemuriscv32 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
-SRCREV_machine:qemux86 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
-SRCREV_machine:qemux86-64 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
-SRCREV_machine:qemumips64 ?= "9a5e38846a3622fe75124744a6fa17ae4b8e05c4"
-SRCREV_machine ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
-SRCREV_meta ?= "a9112e1b2552a7b037b2f90699505e7c1e4d6a34"
+SRCREV_machine:qemuarm ?= "c0c277829e709dc2e9598bf4ad92bd111c1a7b2c"
+SRCREV_machine:qemuarm64 ?= "de5cf198e28050fa834b1ae095c7b25784c9a210"
+SRCREV_machine:qemumips ?= "c458ba72cb6d90db349ecd4ab87e9756acb4167d"
+SRCREV_machine:qemuppc ?= "490a7c62280c51929d4246e9296aa77a72578091"
+SRCREV_machine:qemuriscv64 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
+SRCREV_machine:qemuriscv32 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
+SRCREV_machine:qemux86 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
+SRCREV_machine:qemux86-64 ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
+SRCREV_machine:qemumips64 ?= "1df9cd12015ed64948c860d2b43f3b8e59b25c42"
+SRCREV_machine ?= "997da1dc4716bb08023dea482672e3ef3bc25666"
+SRCREV_meta ?= "e12e10e0b562f46c1d2f7b71c917d40dd1de339c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "284087d4f7d57502b5a41b423b771f16cc6d157a"
+SRCREV_machine:class-devupstream ?= "c61bd26ae81a896c8660150b4e356153da30880a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.158"
+LINUX_VERSION ?= "5.15.160"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


