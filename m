Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47711C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:47 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.14680.1699452998476257207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acGR5Q0g;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41e3e77e675so45623941cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699452997; x=1700057797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7WQDoA76ovnDAc42mDFLJWgVhbtJecoYIoNNQSO5SE=;
        b=acGR5Q0gr0HHYEXR6Uq/j1o0cADWFkQPqgGns91hvvuHuZDPFcXkZpprY+FGI0ZWLR
         7xXDvOyRL0/AS335wC9MFxHNl4mt2XxIprqQ3Lu6pskxWjNVrCz5SrdgtPPW7pnjzL1B
         sTe2VsqTPnWq5KazFus+3r8xvErAQAl0jSfZXOmfhvMX2fdaK3CmTiw3rBJWxBv9QNWa
         lkzyUlHrYF/QRNI+TE5EzfkCu6M7fHFeYazdjNs8OZ5kXw3rqdcnNf6dYUZjuGvsTirj
         XMS7Y0RAj6Y4V6IgygEc5GZHExpDE5LHxq9gnQ+NxfkYtS9GLJYiOHCZUkxgJprdR8hQ
         hHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699452997; x=1700057797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7WQDoA76ovnDAc42mDFLJWgVhbtJecoYIoNNQSO5SE=;
        b=kW47wTphQbQ8JJMM9w4D9idj0VtF/HC0EtjzO6Gp5+r2q7dSr3YFYH2O0Hn59Ko8Jt
         Ty8V1OotmASERFvqeIUG5xVeYJ5pkW0cMXLae1B5CzpfwQxXAjnFvNhhyDJecBN+2PzE
         sLgZM6a2FGSlcrjnag1gzhXzhFLRLuAKHQBrNvkbQdbfKBdTFzQQTTgGqbF7JZZKBLKk
         0Gpr+yifvWzo7Y1q8BTc2JUMFMTaY2fhrM68aibP5K1j2+ANPXoX55rsazT4lrFY8Ai6
         istpZg0mswO6g8QdoIrfkIliG43l6ztBwyUhfSToYmYcxX7r/q0WTmcCL5eKB5xrEdsR
         jbng==
X-Gm-Message-State: AOJu0YwmofFpMMw3HJNHHnyMDtSiGZSAwdERFdFtz74ZsqxKUNxPxhSX
	IE1FG7eari9lf9WxF7LBh6sLgkp8yfVSbJIa
X-Google-Smtp-Source: AGHT+IHsAuUDBwrUsPyGeU8UuKENGe5DrkouIT0UdroWmHxeuI+bkdr4e4L7GF3Qvz6i2eSuEx1PSA==
X-Received: by 2002:ac8:5a41:0:b0:41f:ae4a:9b22 with SMTP id o1-20020ac85a41000000b0041fae4a9b22mr2444036qta.24.1699452997226;
        Wed, 08 Nov 2023 06:16:37 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] linux-yocto/6.5: update to v6.5.9
Date: Wed,  8 Nov 2023 09:16:21 -0500
Message-Id: <75b82176c6d6c3fddb9d215b68e1706846a9a534.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190342

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d0e42510ae83 Linux 6.5.9
    f879295c92b1 selftests: mptcp: join: correctly check for no RST
    85577dd61990 mptcp: avoid sending RST when closing the initial subflow
    1978b69212ed Bluetooth: hci_sock: Correctly bounds check and pad HCI_MON_NEW_INDEX name
    2a3c9d689d6b kbuild: remove old Rust docs output path
    8436370b5a79 docs: rust: update Rust docs output path
    479935768842 net: rfkill: reduce data->mtx scope in rfkill_fop_open
    2ca5210807f1 Bluetooth: hci_sock: fix slab oob read in create_monitor_event
    5a7b9ca3ec2c net: move altnames together with the netdevice
    b583bfcc5a36 efi/unaccepted: Fix soft lockups caused by parallel memory acceptance
    1a19b7394a6c phy: qcom-qmp-combo: initialize PCS_USB registers
    5389ae6d399d phy: qcom-qmp-combo: Square out 8550 POWER_STATE_CONFIG1
    43196ab56d1a phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p
    ddf000488df4 phy: qcom-qmp-usb: initialize PCS_USB registers
    2a90676f997a phy: mapphone-mdm6600: Fix pinctrl_pm handling for sleep pins
    da02a53bd04a phy: mapphone-mdm6600: Fix runtime PM for remove
    9f35d798d13d phy: mapphone-mdm6600: Fix runtime disable on probe
    69cd19101248 rust: docs: fix logo replacement
    43f4e8e32b97 docs: Move rustdoc output, cross-reference it
    362a407559f5 powerpc/qspinlock: Fix stale propagated yield_cpu
    164e66ef89d1 powerpc/mm: Allow ARCH_FORCE_MAX_ORDER up to 12
    fefac8c4686f drm/amdgpu: Fix possible null pointer dereference
    935df6cfa78a drm/i915/cx0: Only clear/set the Pipe Reset bit of the PHY Lanes Owned
    fa8361159a12 drm/bridge: ti-sn65dsi86: Associate DSI device lifetime with auxiliary device
    f5d03923f8bd ASoC: cs42l42: Fix missing include of gpio/consumer.h
    2756d8399ea4 ASoC: pxa: fix a memory leak in probe()
    8247e4d5cba5 ASoC: cs35l56: Fix illegal use of init_completion()
    9955bc6e6be9 gpio: vf610: mask the gpio irq in system suspend and support wakeup
    96964c192aa2 gpio: vf610: set value before the direction to avoid a glitch
    204c78f852e6 gpiolib: acpi: Add missing memset(0) to acpi_get_gpiod_from_data()
    0236504746dd rust: error: fix the description for `ECHILD`
    56d2f7796ab8 platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events
    119a52c632d7 platform/x86: asus-wmi: Only map brightness codes when using asus-wmi backlight control
    7422c4a4cbd9 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e
    a3939c1a96eb platform/x86: msi-ec: Fix the 3rd config
    61ab10af6843 platform/x86: intel-uncore-freq: Conditionally create attribute for read frequency
    18e77f174fc9 platform/surface: platform_profile: Propagate error if profile registration fails
    183aff269bfe s390/cio: fix a memleak in css_alloc_subchannel
    6ccb89a7010e apple-gmux: Hard Code max brightness for MMIO gmux
    efea19a2889c KEYS: asymmetric: Fix sign/verify on pkcs1pad without a hash
    3e25a4bc5023 selftests/ftrace: Add new test case which checks non unique symbol
    d78936d7da27 tracing/kprobes: Return EADDRNOTAVAIL when func matches several symbols
    9a7f36028015 s390/pci: fix iommu bitmap allocation
    20f925d38e1e perf: Disallow mis-matched inherited group reads
    12614cd08c2c thunderbolt: Call tb_switch_put() once DisplayPort bandwidth request is finished
    7cb7903eb22e USB: serial: option: add Fibocom to DELL custom modem FM101R-GL
    d617569fc517 USB: serial: option: add entry for Sierra EM9191 with new firmware
    0b53c322db2f USB: serial: option: add Telit LE910C4-WWX 0x1035 composition
    06a2165f1d36 nvme-rdma: do not try to stop unallocated queues
    7d3641c2ed7a nvmet-auth: complete a request only after freeing the dhchap pointers
    f660a391e54c nvme-auth: use chap->s2 to indicate bidirectional authentication
    38f5ff32ccda nvme-pci: add BOGUS_NID for Intel 0a54 device
    2194ee65b29d nvme: sanitize metadata bounce buffer for reads
    16b99c6d6f34 nfs42: client needs to strip file mode's suid/sgid bit after ALLOCATE op
    8183b745d8cd NFS: Fix potential oops in nfs_inode_remove_request()
    4538b3bdcdef fanotify: limit reporting of event with non-decodeable file handles
    62b7f49d3a78 Revert "accel/ivpu: Use cached buffers for FW loading"
    7d6179ce5b4a perf dlfilter: Fix use of addr_location__exit() in dlfilter__object_code()
    b2c39ae29f2b ACPI: bus: Move acpi_arm_init() to the place of after acpi_ghes_init()
    14189248711e ACPI: irq: Fix incorrect return value in acpi_register_gsi()
    dba32abd641d NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNFS_DS for DS server
    2f1c0be27909 pNFS/flexfiles: Check the layout validity in ff_layout_mirror_prepare_stats
    0026f4f9657d pNFS: Fix a hang in nfs4_evict_inode()
    1e8fa3dd1ddb Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
    914f9b0cbefa pinctrl: qcom: lpass-lpi: fix concurrent register updates
    1e3d8720507e mmc: core: Capture correct oemid-bits for eMMC cards
    67a5bfcf83dc mmc: core: sdio: hold retuning if sdio in 1-bit mode
    1226f14ae02c mmc: core: Fix error propagation for some ioctl commands
    3d83022bf9b9 mmc: mtk-sd: Use readl_poll_timeout_atomic in msdc_reset_hw
    14eb82d52117 mmc: sdhci-pci-gli: fix LPM negotiation so x86/S0ix SoCs can suspend
    b6aa73574dd4 dt-bindings: mmc: sdhci-msm: correct minimum number of clocks
    81f0c091c37a mtd: physmap-core: Restore map_rom fallback
    73df8fcfe785 mtd: spinand: micron: correct bitmask for ecc status
    13d605fb6b2b mtd: rawnand: Ensure the nand chip supports cached reads
    2cdca57606b1 mtd: rawnand: arasan: Ensure program page operations are successful
    d20ec8d2f31c mtd: rawnand: marvell: Ensure program page operations are successful
    6225891e7960 mtd: rawnand: pl353: Ensure program page operations are successful
    42a17fc11578 mtd: rawnand: qcom: Unmap the right resource upon probe failure
    6f3e86a85ab2 tcp_bpf: properly release resources on error paths
    057fabf0ba77 Bluetooth: hci_event: Fix using memcmp when comparing keys
    30fa7600e058 tcp: allow again tcp_disconnect() when threads are waiting
    3d45ae77292e net/tls: split tls_rx_reader_lock
    cb9a6db7a58f net/mlx5e: Fix VF representors reporting zero counters to "ip -s" command
    150de4a3f0c6 net/mlx5e: Don't offload internal port if filter device is out device
    8b7f7beba354 net/mlx5e: Take RTNL lock before triggering netdev notifiers
    f2997256d0d8 net/mlx5e: XDP, Fix XDP_REDIRECT mpwqe page fragment leaks on shutdown
    7bef60897d24 net/mlx5e: RX, Fix page_pool allocation failure recovery for legacy rq
    d630fe115ef9 net/mlx5e: RX, Fix page_pool allocation failure recovery for striding rq
    f0fbcbb70472 net/mlx5: Handle fw tracer change ownership event based on MTRC
    dc426bd9d813 net/mlx5: E-switch, register event handler before arming the event
    36eee433e85e Bluetooth: hci_sync: always check if connection is alive before deleting
    3b9e2e14ba36 Bluetooth: hci_sync: delete CIS in BT_OPEN/CONNECT/BOUND when aborting
    8f3a578a9fef Bluetooth: ISO: Fix invalid context error
    98c78aef17bc Bluetooth: hci_sync: Introduce PTR_UINT/UINT_PTR macros
    d924ba62fe86 Bluetooth: hci_sync: Fix not handling ISO_LINK in hci_abort_conn_sync
    054dfb821c6e io-wq: fully initialize wqe before calling cpuhp_state_add_instance_nocalls()
    c63d66006bdc cpufreq: schedutil: Update next_freq when cpufreq_limits change
    7bfc1d3e3d93 platform/x86: touchscreen_dmi: Add info for the Positivo C4128B
    ef8073649841 HID: Add quirk to ignore the touchscreen battery on HP ENVY 15-eu0556ng
    8db5b5641edb HID: nintendo: reinitialize USB Pro Controller after resuming from suspend
    37640aaacb3f HID: multitouch: Add required quirk for Synaptics 0xcd7e device
    ae02f63718e6 drm/amd/pm: add unique_id for gc 11.0.3
    ac0893f7a48a platform/x86: touchscreen_dmi: Add info for the BUSH Bush Windows tablet
    3149ea595239 btrfs: error out when reallocating block for defrag using a stale transaction
    71e385e8e042 btrfs: error when COWing block from a root that is being deleted
    55a0567f6461 btrfs: error out when COWing block using a stale transaction
    1472a1d9c294 btrfs: fix some -Wmaybe-uninitialized warnings in ioctl.c
    9c91266a003b drm: panel-orientation-quirks: Add quirk for One Mix 2S
    0fd1a377b08e ipv4/fib: send notify when delete source address routes
    7a0ed30fbb66 sky2: Make sure there is at least one frag_addr available
    c2d0245661f6 nfs: decrement nrequests counter before releasing the req
    a6e63b482084 SUNRPC/TLS: Lock the lower_xprt during the tls handshake
    e039d9b24920 SUNRPC: Fail quickly when server does not recognize TLS
    20eb79ccdaa3 regulator/core: Revert "fix kobject release warning and memory leak in regulator_register()"
    42dc95950d7d wifi: cfg80211: avoid leaking stack data into trace
    4d5ea9a1b21d wifi: mac80211: allow transmitting EAPOL frames with tainted key
    96b83be278ee wifi: mac80211: work around Cisco AP 9115 VHT MPDU length
    670894d8905a wifi: cfg80211: Fix 6GHz scan configuration
    5558f4312dca Bluetooth: hci_core: Fix build warnings
    c4ac1d80eaa6 Bluetooth: Avoid redundant authentication
    6dd41ebf7c9e Bluetooth: btusb: add shutdown function for QCA6174
    b095011d0dad HID: holtek: fix slab-out-of-bounds Write in holtek_kbd_input_event
    b404427a7be2 HID: logitech-hidpp: Add Bluetooth ID for the Logitech M720 Triathlon mouse
    47a066e866aa rfkill: sync before userspace visibility/changes
    f19e6337aa9b wifi: iwlwifi: Ensure ack flag is properly cleared.
    22d405f5c1e6 wifi: cfg80211: validate AP phy operation before starting it
    84a89ef8acf3 wifi: mwifiex: Sanity check tlv_len and tlv_bitmap_len
    26feeeb70477 tracing: relax trace_event_eval_update() execution with cond_resched()
    72ec64ea0e12 ata: libata-eh: Fix compilation warning in ata_eh_link_report()
    5bd7eba2174c ata: libata-core: Fix compilation warning in ata_dev_config_ncq()
    21a696f3a91d gpio: timberdale: Fix potential deadlock on &tgpio->lock
    6d3ab53ab7f9 accel/ivpu: Don't flood dmesg with VPU ready message
    90647d0da861 overlayfs: set ctime when setting mtime and atime
    2bc65f2ef8da i2c: mux: Avoid potential false error message in i2c_mux_add_adapter
    c3d5ec9fe0ee btrfs: initialize start_slot in btrfs_log_prealloc_extents
    43cd1b16afbe btrfs: return -EUCLEAN for delayed tree ref with a ref count not equals to 1
    417753a1af5b btrfs: prevent transaction block reserve underflow when starting transaction
    e2829b94c62f btrfs: fix race when refilling delayed refs block reserve
    982142576477 fs-writeback: do not requeue a clean inode having skipped pages
    98e737c3e86c arm64: dts: mediatek: Fix "mediatek,merge-mute" and "mediatek,merge-fifo-en" types
    245cade8fc9a ARM: dts: ti: omap: Fix noisy serial with overrun-throttle-ms for mapphone
    94de81b46a83 pwr-mlxbf: extend Kconfig to include gpio-mlxbf3 dependency
    6ebc25a77ed5 iio: light: vcnl4000: Don't power on/off chip in config
    f7a69786fe5e net: check for altname conflicts when changing netdev's netns
    95e76a1f9988 net: fix ifname in netlink ntf during netns move
    d1d14bcc14bc net: avoid UAF on deleted altname
    f3036796e67d net: mdio-mux: fix C45 access returning -EIO after API change
    f53e11725233 net: more strict VIRTIO_NET_HDR_GSO_UDP_L4 validation
    bd076ba9d762 net: pktgen: Fix interface flags printing
    34f15aeeec57 net: phy: bcm7xxx: Add missing 16nm EPHY statistics
    d8bc92ce877b selftests: openvswitch: Add version check for pyroute2
    eeaa4fcd1f72 netfilter: nf_tables: revert do not remove elements if set backend implements .abort
    2ec18541f390 netfilter: nf_tables: do not remove elements if set backend implements .abort
    d6ba6de49c2d nf_tables: fix NULL pointer dereference in nft_inner_init()
    8a544721329e nf_tables: fix NULL pointer dereference in nft_expr_inner_parse()
    60a203111170 netfilter: nf_tables: do not refresh timeout when resetting element
    bfc88a6ce66e netlink: Correct offload_xstats size
    0317bd5e189f netfilter: nft_set_rbtree: .deactivate fails if element has expired
    6d466bfe7bf3 selftests: netfilter: Run nft_audit.sh in its own netns
    79fbd1c110b3 selftests: openvswitch: Fix the ct_tuple for v4
    7b624e1f9d20 selftests: openvswitch: Catch cases where the tests are killed
    4efeda952519 neighbor: tracing: Move pin6 inside CONFIG_IPV6=y section
    a851f8c93533 net/sched: sch_hfsc: upgrade 'rt' to 'sc' when it becomes a inner curve
    9e8ada3bf27e bonding: Return pointer to data after pull on skb
    b72539b62d24 net: dsa: bcm_sf2: Fix possible memory leak in bcm_sf2_mdio_register()
    bcfb10a8d722 i40e: prevent crash on probe if hw registers have invalid values
    3bbb112aa138 octeon_ep: update BQL sent bytes before ringing doorbell
    48984949e51d net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
    394c8055fd0e ipv4: fib: annotate races around nh->nh_saddr_genid and nh->nh_saddr
    dd6a8651b98f gve: Do not fully free QPL pages on prefill errors
    e6386242b4cd tun: prevent negative ifindex
    50969e0e05d1 docs: fix info about representor identification
    5b62f58c8288 tcp: Fix listen() warning with v4-mapped-v6 address.
    5019131495d5 tcp: tsq: relax tcp_small_queue_check() when rtx queue contains a single skb
    f74b518c4bb7 tcp: fix excessive TLP and RACK timeouts from HZ rounding
    db4cf95a7636 net: rfkill: gpio: prevent value glitch during probe
    c5b46524c367 net: ipv6: fix return value check in esp_remove_trailer
    10b650138379 net: ipv4: fix return value check in esp_remove_trailer
    89ffd5e26ec3 wifi: cfg80211: use system_unbound_wq for wiphy work
    c91f8adb7414 fprobe: Fix to ensure the number of active retprobes is not zero
    e0cc481c1fa0 net: xfrm: skip policies marked as dead while reinserting policies
    071bba39638f xfrm: interface: use DEV_STATS_INC()
    abfe309fc6dc xfrm: fix a data-race in xfrm_gen_index()
    71998cd436fd xfrm6: fix inet6_dev refcount underflow problem
    de0bfd6026c8 xfrm: fix a data-race in xfrm_lookup_with_ifid()
    40aa935e9e6b qed: fix LL2 RX buffer allocation
    27e7ea6c3ad8 ASoC: codecs: wcd938x: fix runtime PM imbalance on remove
    f0c191c0977a ASoC: codecs: wcd938x: fix regulator leaks on probe errors
    3d4a0f272ff2 ASoC: codecs: wcd938x: fix resource leaks on bind errors
    6165999b6f65 ASoC: codecs: wcd938x: fix unbind tear down order
    2324407dbdfa ASoC: codecs: wcd938x: drop bogus bind error handling
    ea75399184ec ASoC: codecs: wcd938x-sdw: fix runtime PM imbalance on probe errors
    fe672874b968 ASoC: codecs: wcd938x-sdw: fix use after free on driver unbind
    15d4d00e27df ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq5xxx
    302a721307ad ALSA: hda/realtek: Add quirk for ASUS ROG GU603ZV
    56d5acef3b3c ALSA: hda/realtek - Fixed ASUS platform headset Mic issue
    ac1084e2b0b4 drm/edid: add 8 bpc quirk to the BenQ GW2765
    6eb4a83e612a drm/nouveau/disp: fix DP capable DSM connectors
    aa01884d6501 drm/mediatek: Correctly free sg_table in gem prime vmap
    2c9e90773fab drm/i915: Retry gtt fault when out of fence registers
    675f0e9bb716 nvmet-tcp: Fix a possible UAF in queue intialization setup
    7053f66e945d io_uring: fix crash with IORING_SETUP_NO_MMAP and invalid SQ ring address
    55b97a33e5aa netfilter: nft_payload: fix wrong mac header matching
    fd9c3d0fb488 Revert "net: wwan: iosm: enable runtime pm support for 7560"
    9312862d7d03 fs/ntfs3: fix deadlock in mark_as_free_ex
    93600a9e5d24 fs/ntfs3: Fix shift-out-of-bounds in ntfs_fill_super
    15db99c9c7c7 fs/ntfs3: fix panic about slab-out-of-bounds caused by ntfs_list_ea()
    ebcabbe6e00f fs/ntfs3: Fix possible null-pointer dereference in hdr_find_e()
    a1f9acb20402 fs/ntfs3: Fix OOB read in ntfs_init_from_boot
    40cadbcba00c mm: slab: Do not create kmalloc caches smaller than arch_slab_minalign()
    a9feea2fee9c selftests: mptcp: join: no RST when rm subflow/addr
    f080044ecc35 mptcp: more conservative check for zero probes
    b454bd5583a7 tcp: check mptcp-level constraints for backlog coalescing
    6952b951ac9b audit,io_uring: io_uring openat triggers audit reference count underflow
    a672863f5645 x86: KVM: SVM: refresh AVIC inhibition in svm_leave_nested()
    7996dc48ba78 x86: KVM: SVM: add support for Invalid IPI Vector interception
    94805f9d3a3f x86: KVM: SVM: always update the x2avic msr interception
    3365b42624bf KVM: x86: Constrain guest-supported xfeatures only at KVM_GET_XSAVE{2}
    3de2cf8d8287 KVM: x86/pmu: Truncate counter value to allowed width on write
    4d16224bcc3b x86/fpu: Allow caller to constrain xfeatures when copying to uabi buffer
    11b975cb82cc x86/sev: Check for user-space IOIO pointing to kernel space
    dcb55b683118 x86/sev: Check IOBM for IOIO exceptions from user-space
    f44a58134e6a x86/sev: Disable MMIO emulation from user mode
    ecaf25786553 KVM: x86: Mask LVTPC when handling a PMI
    9379a0ef1852 regmap: fix NULL deref on lookup
    bb6cacc439dd nfc: nci: fix possible NULL pointer dereference in send_acknowledge()
    e7acd6209f21 btrfs: fix stripe length calculation for non-zoned data chunk allocation
    c60f54a8868d net/smc: return the right falback reason when prefix checks fail
    74dcd829d94f ice: reset first in crash dump kernels
    9e1dd9401dff ice: Fix safe mode when DDP is missing
    df23c09a7441 ice: fix over-shifted variable
    06a5e7bf1cab Bluetooth: hci_conn: Fix modifying handle while aborting
    5b7a24872c2a Bluetooth: avoid memcmp() out of bounds warning
    75d889f69238 Bluetooth: hci_event: Fix coding style
    c4fb6456420a Bluetooth: vhci: Fix race when opening vhci device
    746dbb0fc639 Bluetooth: Fix a refcnt underflow problem for hci_conn
    2f6495fe89e8 Bluetooth: Reject connection with the device which has same BD_ADDR
    0d04728e2743 Bluetooth: hci_event: Ignore NULL link key

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index edd6cd67fe..b34351529d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6e643d0d0344bba195b8c8c5532de9b77ae5a9b4"
-SRCREV_meta ?= "1920717e6c53d0bdd0ebb6aa943657854c44b5db"
+SRCREV_machine ?= "a19b0be3292c96a0cc9c0ebb8f9d104d6a4d3e10"
+SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.8"
+LINUX_VERSION ?= "6.5.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index e8e7de57a4..abf548b2c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.8"
+LINUX_VERSION ?= "6.5.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e36ee0929b3072f10e3749279ca498bfaee2454d"
-SRCREV_meta ?= "1920717e6c53d0bdd0ebb6aa943657854c44b5db"
+SRCREV_machine ?= "4e79d57b9c5cc230d2d8cb40c393515fedfed134"
+SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index f0f3706784..120a3afe25 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "38c4fee81a4d2da3be10690f5b78151e0bd544ac"
-SRCREV_machine:qemuarm64 ?= "7358f19647fcab467f6d00d9a24aec8e99f8cd00"
-SRCREV_machine:qemuloongarch64 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
-SRCREV_machine:qemumips ?= "5b03adb9d873c62991c87fed8a186bbd8d65987c"
-SRCREV_machine:qemuppc ?= "7c2b15eb10d4337712627cd70d668184bfd0d177"
-SRCREV_machine:qemuriscv64 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
-SRCREV_machine:qemuriscv32 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
-SRCREV_machine:qemux86 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
-SRCREV_machine:qemux86-64 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
-SRCREV_machine:qemumips64 ?= "ce7978769497891f4d4a7c0b310515febd208b6d"
-SRCREV_machine ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
-SRCREV_meta ?= "1920717e6c53d0bdd0ebb6aa943657854c44b5db"
+SRCREV_machine:qemuarm ?= "bf5b3a74274d87b15ebc752af9aa05f11e675ad1"
+SRCREV_machine:qemuarm64 ?= "2432f34de9751a230a832a870763d8588897c5df"
+SRCREV_machine:qemuloongarch64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
+SRCREV_machine:qemumips ?= "a9934c8f85b3c9b89e132304ff248f701e67e04d"
+SRCREV_machine:qemuppc ?= "9ad77a0fec52d67a292aeb413e9992d6df037ca3"
+SRCREV_machine:qemuriscv64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
+SRCREV_machine:qemuriscv32 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
+SRCREV_machine:qemux86 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
+SRCREV_machine:qemux86-64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
+SRCREV_machine:qemumips64 ?= "3b119ebc63b9889194b0125bfae96ee5830e538c"
+SRCREV_machine ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
+SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8bbe7c640d76724e9cfd8aa130b8d36ad6db77a9"
+SRCREV_machine:class-devupstream ?= "d0e42510ae8347e27d416356291b7546fb7681f5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.8"
+LINUX_VERSION ?= "6.5.9"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


