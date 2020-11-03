Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.6228.1604419500894732192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WogH9AjZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id j31so5221252qtb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FfuR0WeQynkHtHdRmXhoU4rsVuPW9gpltE1LUmVtR4=;
        b=WogH9AjZUt98MSk23barWsvn9uHMZFk0BXWqXDkSYgl+7Q+lhpzPsxEtvOFOPWGRsu
         ATEs3zZwlfvqItiEfYqWG1c4EU/D6M+pEdq/Frkv/t9u9qG9c3VVDBB60Br/8Qk4W00n
         /XwaaqH1hzQOXGN3hH0qRkJ5TqTnzWRvs9jon8elYbAm9WsLYnnJxYQT717W1V7eDxTR
         i1vZE/0wr22UDI6bnTDbAS/xgKn1hGrOh8nhvzbVoqde6Be+RXnTT1hOmZwPfIQTK4ip
         PwkBxwd4PBYams7qPvJWbkTMr8FS6rfDaaVFtZX4jOfxkGUL2/loQl1/kjU/R1mV7Tt2
         2mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FfuR0WeQynkHtHdRmXhoU4rsVuPW9gpltE1LUmVtR4=;
        b=bpOJwkL7gA0t+yIM903Jm95WgfSMJw1EH9rOMBZQa9v4wqou4PJh0PYhl2l4HXxP2H
         3zrdRv/X9LtnHcdHg5i0vw/uCZx1OQtKY12dvrqQPz7oi+BaT2p8wmdwNye03OeNyXSD
         w+r4XR/X71E+YC4gavfR9MDHkZ8yFPP/06duDex8j16hJG7Euz5n/vLKIkRfm6AXGYcE
         lwHxzEQtGUzHFkT85qqki0BblCvU5WJrPnYn3avQcMKt5Qfnv3HR+NqIPqZK1R1NKY6/
         dHZnX+NwMVDRpjLhoZnhfZPeEjoBLpUtx2s7vWZf5YQvnEskk4awDV2oK1jze99muofv
         xsiQ==
X-Gm-Message-State: AOAM530ol5WSfjE3R0uTBixM0sWmfVzy4zr7cuNsOtiIAKafQ6BRqaYe
	8F9dH1nHES0O/u2K1bYRNBsDmG6PffFRhAcT
X-Google-Smtp-Source: ABdhPJza3SsV+6h31K1PPDwiNbq8sljWaSF2QlnCte0WOCHCEKcHS33n1AfxVMCXgkcqQXnRzgOAYQ==
X-Received: by 2002:ac8:5854:: with SMTP id h20mr19564104qth.176.1604419499829;
        Tue, 03 Nov 2020 08:04:59 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u5sm10454809qtg.57.2020.11.03.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:04:58 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/5.8: update to v5.8.15
Date: Tue,  3 Nov 2020 11:04:49 -0500
Message-Id: <af995f4793e869da04cdaababc21d5765c291dce.1604415988.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1604415988.git.bruce.ashfield@gmail.com>
References: <cover.1604415988.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    665c6ff082e2 Linux 5.8.15
    03b7311c2d35 net_sched: commit action insertions together
    1e02bbf908d3 net_sched: defer tcf_idr_insert() in tcf_action_init_1()
    b6a788af71ed net: qrtr: ns: Protect radix_tree_deref_slot() using rcu read locks
    691847cc626c net: usb: rtl8150: set random MAC address when set_ethernet_addr() fails
    624143319921 Input: ati_remote2 - add missing newlines when printing module parameters
    2cdb64863860 tty/vt: Do not warn when huge selection requested
    af2c68e241ba net/mlx5e: Fix driver's declaration to support GRE offload
    13e623dc2772 net/tls: race causes kernel panic
    d1a1891a5865 net: bridge: fdb: don't flush ext_learn entries
    54d2034e1d13 net/core: check length before updating Ethertype in skb_mpls_{push,pop}
    912721b3ad72 netlink: fix policy dump leak
    85355299d6fa tcp: fix receive window update in tcp_add_backlog()
    a4c5f912c926 mm: khugepaged: recalculate min_free_kbytes after memory hotplug as expected by khugepaged
    0d600018dde7 mm: validate inode in mapping_set_error()
    270974601ea5 mmc: core: don't set limits.discard_granularity as 0
    23030fd91348 perf: Fix task_function_call() error handling
    02b573f11b1c afs: Fix deadlock between writeback and truncate
    29c60e82c6a5 net: mscc: ocelot: divide watermark value by 60 when writing to SYS_ATOP
    9fd541ad02bd net: mscc: ocelot: extend watermark encoding function
    13c116784250 net: mscc: ocelot: split writes to pause frame enable bit and to thresholds
    43e89f7e3c98 net: mscc: ocelot: rename ocelot_board.c to ocelot_vsc7514.c
    78272109f44d rxrpc: Fix server keyring leak
    bf1235365637 rxrpc: The server keyring isn't network-namespaced
    0fb27a1f99c1 rxrpc: Fix some missing _bh annotations on locking conn->state_lock
    6343a701ca68 rxrpc: Downgrade the BUG() for unsupported token type in rxrpc_read()
    3a15888ff3df rxrpc: Fix rxkad token xdr encoding
    41d0598c0f43 net: mvneta: fix double free of txq->buf
    d5c6f130b6f0 vhost-vdpa: fix page pinning leakage in error path
    ec7257845d40 vhost-vdpa: fix vhost_vdpa_map() on error condition
    72d41c97e736 net: hinic: fix DEVLINK build errors
    a974b4bddae3 net: stmmac: Modify configuration method of EEE timers
    d0eb9588f724 net/mlx5e: Fix race condition on nhe->n pointer in neigh update
    eef0da156040 net/mlx5e: Fix VLAN create flow
    b6dc435f3603 net/mlx5e: Fix VLAN cleanup flow
    f2140d0c6b93 net/mlx5e: Fix return status when setting unsupported FEC mode
    96e80a346634 net/mlx5e: Add resiliency in Striding RQ mode for packets larger than MTU
    4dc4c132f27f net/mlx5: Fix request_irqs error flow
    91ddbc505218 net/mlx5: Add retry mechanism to the command entry index allocation
    963f9da02730 net/mlx5: poll cmd EQ in case of command timeout
    da87ea137373 net/mlx5: Avoid possible free of command entry while timeout comp handler
    eb50f5c289e6 net/mlx5: Fix a race when moving command interface to polling mode
    04f31610f34f pipe: Fix memory leaks in create_pipe_files()
    ce1dde198079 octeontx2-pf: Fix synchnorization issue in mbox
    5cfc870ede16 octeontx2-pf: Fix the device state on error
    7778b8860228 octeontx2-pf: Fix TCP/UDP checksum offload for IPv6 frames
    921dfb5fec6b octeontx2-af: Fix enable/disable of default NPC entries
    b9f0dcfbfc07 net: phy: realtek: fix rtl8211e rx/tx delay config
    9d41929ceea9 virtio-net: don't disable guest csum when disable LRO
    f5f8861d01d3 net: usb: ax88179_178a: fix missing stop entry in driver_info
    fb4fb78d23fc r8169: fix RTL8168f/RTL8411 EPHY config
    0ea7fe7c26ef mlxsw: spectrum_acl: Fix mlxsw_sp_acl_tcam_group_add()'s error path
    698075baae0b mdio: fix mdio-thunder.c dependency & build error
    c83ed7bb7469 bonding: set dev->needed_headroom in bond_setup_by_slave()
    665298cbd6bd net: ethernet: cavium: octeon_mgmt: use phy_start and phy_stop
    2cb43007e060 net: stmmac: Fix clock handling on remove path
    39d93de64749 vmxnet3: fix cksum offload issues for non-udp tunnels
    6ececc888c0c ice: fix memory leak in ice_vsi_setup
    c4b9b9d7eb10 ice: fix memory leak if register_netdev_fails
    33e948635e65 iavf: Fix incorrect adapter get in iavf_resume
    1e0cdecfb896 iavf: use generic power management
    13685508abf3 xfrm: Use correct address family in xfrm_state_find
    3e835221d670 net: dsa: felix: convert TAS link speed based on phylink speed
    24bc1ec457c8 hinic: fix wrong return value of mac-set cmd
    43b7d340cb3a hinic: add log in exception handling processes
    5f8c48c299bc platform/x86: fix kconfig dependency warning for FUJITSU_LAPTOP
    6d9886e6081b platform/x86: fix kconfig dependency warning for LG_LAPTOP
    046add2ce07c net: stmmac: removed enabling eee in EEE set callback
    ac25c357463b xsk: Do not discard packet when NETDEV_TX_BUSY
    38dd384ce429 xfrm: clone whole liftime_cur structure in xfrm_do_migrate
    8baab8024028 xfrm: clone XFRMA_SEC_CTX in xfrm_do_migrate
    3ab37554e6ce xfrm: clone XFRMA_REPLAY_ESN_VAL in xfrm_do_migrate
    958c224a99d3 xfrm: clone XFRMA_SET_MARK in xfrm_do_migrate
    954adf701189 iommu/vt-d: Fix lockdep splat in iommu_flush_dev_iotlb()
    31bc10ac6d01 btrfs: move btrfs_rm_dev_replace_free_srcdev outside of all locks
    b50aa502610f drm/amd/display: fix return value check for hdcp_work
    b02b690b4bb3 drm/amd/pm: Removed fixed clock in auto mode DPM
    9e184961ddb7 io_uring: fix potential ABBA deadlock in ->show_fdinfo()
    287d8f00338d btrfs: move btrfs_scratch_superblocks into btrfs_dev_replace_finishing
    cefd370cb723 drm/amdgpu: prevent double kfree ttm->sg
    9c6944b53f1d openvswitch: handle DNAT tuple collision
    0388ffce1059 net: team: fix memory leak in __team_options_register
    70af9c28d423 team: set dev->needed_headroom in team_setup_by_port()
    9360901e714d sctp: fix sctp_auth_init_hmacs() error path
    d63492ab001b i2c: owl: Clear NACK and BUS error bits
    08a1313bfca0 i2c: meson: fixup rate calculation with filter delay
    3531df70c312 i2c: meson: keep peripheral clock enabled
    fe6124585cfe i2c: meson: fix clock setting overwrite
    d681bce5bc03 cifs: Fix incomplete memory allocation on setxattr path
    80683929112b espintcp: restore IP CB before handing the packet to xfrm
    1427c13cc16f xfrmi: drop ignore_df check before updating pmtu
    c2a55388bada nvme-tcp: check page by sendpage_ok() before calling kernel_sendpage()
    f4abc5911a9e tcp: use sendpage_ok() to detect misused .sendpage
    854828e10e2d net: introduce helper sendpage_ok() in include/linux/net.h
    89bec0adbf50 mm/khugepaged: fix filemap page_to_pgoff(page) != offset
    f994c81fe4c5 gpiolib: Disable compat ->read() code in UML case
    987c12d56402 RISC-V: Make sure memblock reserves the memory containing DT
    659a68b11df3 macsec: avoid use-after-free in macsec_handle_frame()
    8c995b27d066 nvme-core: put ctrl ref when module ref get fail
    3113391293be platform/x86: thinkpad_acpi: re-initialize ACPI buffer size when reuse
    46a00e3e9275 platform/x86: intel-vbtn: Switch to an allow-list for SW_TABLET_MODE reporting
    402ee2f96fb9 r8169: consider that PHY reset may still be in progress after applying firmware
    a73bb4ddee83 bpf: Prevent .BTF section elimination
    bc33b9bb0757 bpf: Fix sysfs export of empty BTF section
    944e354acfc3 platform/x86: asus-wmi: Fix SW_TABLET_MODE always reporting 1 on many different models
    88ddba3ebc3c platform/x86: thinkpad_acpi: initialize tp_nvram_state variable
    b9c0333ac6c8 platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360
    6b010ed04d50 Platform: OLPC: Fix memleak in olpc_ec_probe
    6ad52d3ee278 splice: teach splice pipe reading about empty pipe buffers
    c679280057ee usermodehelper: reset umask to default before executing user process
    3d36be053e58 vhost: Use vhost_get_used_size() in vhost_vring_set_addr()
    3480587d9b9d vhost: Don't call access_ok() when using IOTLB
    145a5510ef6a block/scsi-ioctl: Fix kernel-infoleak in scsi_put_cdrom_generic_arg()
    128f5fe7c102 partitions/ibm: fix non-DASD devices
    ef29249b066f drm/nouveau/mem: guard against NULL pointer access in mem_del
    e82867e1c2b4 drm/nouveau/device: return error for unknown chipsets
    bc7382371b2d net: wireless: nl80211: fix out-of-bounds access in nl80211_del_key()
    82dfd230b0c0 exfat: fix use of uninitialized spinlock on error path
    6a4bf26a176d crypto: arm64: Use x16 with indirect branch to bti_c
    fc5b5ae8ac3c bpf: Fix scalar32_min_max_or bounds tracking
    849d01ef1894 Revert "ravb: Fixed to be able to unload modules"
    e57db2fee8b1 fbcon: Fix global-out-of-bounds read in fbcon_get_font()
    34873e40e8d8 Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
    3714c5596a9d fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
    70b225d0a8ca Linux 5.8.14
    8eec10e1335d ep_create_wakeup_source(): dentry name can change under you...
    4306cae1d98a epoll: EPOLL_CTL_ADD: close the race in decision to take fast path
    a6a47119b527 epoll: replace ->visited/visited_list with generation count
    bdb43b31e65d epoll: do not insert into poll queues until all sanity checks are done
    5e6bc9b1f1ae scsi: sd: sd_zbc: Fix ZBC disk initialization
    a12f67b54771 scsi: sd: sd_zbc: Fix handling of host-aware ZBC disks
    ecd72c95c278 drm/i915/gvt: Fix port number for BDW on EDID region setup
    115b0aed8b74 gpiolib: Fix line event handling in syscall compatible mode
    b4b93f8c92bb random32: Restore __latent_entropy attribute on net_rand_state
    d4ff049a3463 pipe: remove pipe_wait() and fix wakeup race with splice
    f6e5c604d67b iommu/amd: Fix the overwritten field in IVMD header
    7af706248ce2 gpio: pca953x: Correctly initialize registers 6 and 7 for PCA957x
    b7d423041485 pinctrl: mediatek: check mtk_is_virt_gpio input parameter
    1b62e4935b0c pinctrl: qcom: sm8250: correct sdc2_clk
    5f040ac168f3 autofs: use __kernel_write() for the autofs pipe writing
    b06582ae5052 scripts/dtc: only append to HOST_EXTRACFLAGS instead of overwriting
    c53cd1877406 blk-mq: call commit_rqs while list empty but error happen
    a6141f191d83 Input: trackpoint - enable Synaptics trackpoints
    83884333497f i2c: npcm7xx: Clear LAST bit after a failed transaction.
    95b874d021f6 i2c: cpm: Fix i2c_ram structure
    f6ae5ac641a8 gpio: aspeed: fix ast2600 bank properties
    cf7f69852717 gpio/aspeed-sgpio: don't enable all interrupts by default
    7dc4222171ce gpio/aspeed-sgpio: enable access to all 80 input & output sgpios
    20d7a2cbc339 gpio: pca953x: Fix uninitialized pending variable
    c8a8adc7df57 iommu/exynos: add missing put_device() call in exynos_iommu_of_xlate()
    32b462c501ee scsi: target: Fix lun lookup for TARGET_SCF_LOOKUP_LUN_FROM_TAG case
    40e2e6c71ac1 clk: samsung: exynos4: mark 'chipid' clock as CLK_IGNORE_UNUSED
    f6e9c4310f5a dmaengine: dmatest: Prevent to run on misconfigured channel
    ec9002ead04b clk: tegra: Fix missing prototype for tegra210_clk_register_emc()
    ef3f3611b462 clk: tegra: Always program PLL_E when enabled
    63cd394fa3f0 pNFS/flexfiles: Ensure we initialise the mirror bsizes correctly on read
    ac376f2245bb NFSv4.2: fix client's attribute cache management for copy_file_range
    a98e3583bd8d nfs: Fix security label length not being reset
    6846eb762344 pinctrl: mvebu: Fix i2c sda definition for 98DX3236
    fdf8212f0260 phy: ti: am654: Fix a leak in serdes_am654_probe()
    9f6c717ffa47 gpio: sprd: Clear interrupt when setting the type as edge
    6bef7d4b4770 scripts/kallsyms: skip ppc compiler stub *.long_branch.* / *.plt_branch.*
    a50ea89d1ae5 nvme-fc: fail new connections to a deleted host or remote port
    7d2120bc38b9 nvme-pci: fix NULL req in completion handler
    189c154bc593 net: dsa: felix: fix some key offsets for IP4_TCP_UDP VCAP IS2 entries
    b23f9f0dc930 spi: fsl-espi: Only process interrupts for expected events
    cbbc927e0e62 cpuidle: psci: Fix suspicious RCU usage
    f833ed7a202b io_uring: mark statx/files_update/epoll_ctl as non-SQPOLL
    fc4b56ae9e76 tools/io_uring: fix compile breakage
    4ff709d00af4 tracing: Make the space reserved for the pid wider
    f2465c7d069c mac80211: do not allow bigger VHT MPDUs than the hardware supports
    9c72951f9e97 mac80211: Fix radiotap header channel flag for 6GHz band
    2dd5f2a99bf3 drivers/net/wan/hdlc: Set skb->protocol before transmitting
    3074634461c5 drivers/net/wan/lapbether: Make skb->protocol consistent with the header
    74e81de01e49 fuse: fix the ->direct_IO() treatment of iov_iter
    72adaf934802 nvme-core: get/put ctrl and transport module in nvme_dev_open/release()
    f3f3da8c1ff9 nvme-pci: disable the write zeros command for Intel 600P/P3100
    33701f04a59a rndis_host: increase sleep time in the query-response loop
    21f41dd7e883 net: dec: de2104x: Increase receive ring size for Tulip
    9c524f9df9c7 hv_netvsc: Cache the current data path to avoid duplicate call and message
    caac35688ac1 drm/sun4i: mixer: Extend regmap max_register
    b92f98f9307c Revert "wlcore: Adding suppoprt for IGTK key in wlcore driver"
    73fadce8c80b drivers/net/wan/hdlc_fr: Add needed_headroom for PVC devices
    1017b151fb4a libbpf: Remove arch-specific include path in Makefile
    9f183485e888 mt76: mt7915: use ieee80211_free_txskb to free tx skbs
    057c9ed4565b vboxsf: Fix the check for the old binary mount-arguments struct
    4a1db91e697a clocksource/drivers/timer-gx6605s: Fixup counter reload
    5d48f7b0ed06 xen/events: don't use chip_data for legacy IRQs
    e99ecd62bb9c drm/amdgpu: restore proper ref count in amdgpu_display_crtc_set_config
    b64a43b072c7 memstick: Skip allocating card when removing host
    13cee195a180 tracing: Fix trace_find_next_entry() accounting of temp buffer size
    7f5d5928b9cc ftrace: Move RCU is watching check after recursion check
    1f0038ad6eed iio: adc: qcom-spmi-adc5: fix driver name
    14f6276e202f Input: i8042 - add nopnp quirk for Acer Aspire 5 A515
    6901d792bc35 i2c: i801: Exclude device from suspend direct complete optimization
    7d29e9507663 scsi: iscsi: iscsi_tcp: Avoid holding spinlock while calling getpeername()
    c32f1ee1d6d0 clk: socfpga: stratix10: fix the divider for the emac_ptp_free_clk
    a77ae2f6d900 clk: samsung: Keep top BPLL mux on Exynos542x enabled
    9705d89518ae gpio: amd-fch: correct logic of GPIO_LINE_DIRECTION
    f67837215194 gpio: tc35894: fix up tc35894 interrupt configuration
    baeac67ee6e2 gpio: mockup: fix resource leak in error path
    cb2480639590 gpio: siox: explicitly support only threaded irqs
    5ae75e1e510d usbcore/driver: Accommodate usbip
    ab3edda370ee usbcore/driver: Fix incorrect downcast
    dc1e84d05a96 usbcore/driver: Fix specific driver selection
    36ec30f02a00 Revert "usbip: Implement a match function to fix usbip"
    9c69e3a769db USB: gadget: f_ncm: Fix NDP16 datagram validation
    26be1c145cfe mmc: sdhci: Workaround broken command queuing on Intel GLK based IRBIS models
    a8183e677fc1 btrfs: fix filesystem corruption after a device replace
    f2a5cb2f24ae io_uring: always delete double poll wait entry on match

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 3d6d750c86..ad93121661 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_meta ?= "34775c20bc4f4ac32ac7eded79f9dc8ca77e4277"
+SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.13"
+LINUX_VERSION ?= "5.8.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 764264f637..bee0cebcfa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.13"
+LINUX_VERSION ?= "5.8.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "627cc1717f47c4d9bc9d58f88b1764990d982a99"
-SRCREV_machine ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_meta ?= "34775c20bc4f4ac32ac7eded79f9dc8ca77e4277"
+SRCREV_machine_qemuarm ?= "29bb8494265c9b2b4c6263cd182d9698803bca70"
+SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index f80ae2359b..b70319d8d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "41542e01d0deb5a38c190809f4fd01a442769938"
-SRCREV_machine_qemuarm64 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_machine_qemumips ?= "36e642d5b6c5b1d05f6172a75df172ad8fefc30b"
-SRCREV_machine_qemuppc ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_machine_qemuriscv64 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_machine_qemux86 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_machine_qemux86-64 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_machine_qemumips64 ?= "5538a54afd2525803729c85a40609cae292cb242"
-SRCREV_machine ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
-SRCREV_meta ?= "34775c20bc4f4ac32ac7eded79f9dc8ca77e4277"
+SRCREV_machine_qemuarm ?= "3a57eada4ccbc6c770cf1352b60e74b845f01ee8"
+SRCREV_machine_qemuarm64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_machine_qemumips ?= "c2b7ecc61b0e3dbe394eabc90f7ac681a5a7bfaa"
+SRCREV_machine_qemuppc ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_machine_qemuriscv64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_machine_qemux86 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_machine_qemux86-64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_machine_qemumips64 ?= "71dc25ebfb9b5860d2d2340a5372958c707a831a"
+SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
+SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.13"
+LINUX_VERSION ?= "5.8.15"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

