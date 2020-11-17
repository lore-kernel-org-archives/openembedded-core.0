Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.9276.1605626684781454967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AhuE/W3/;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 11so20668759qkd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sLvQyKcRjr6EpWBKUlEnp9ePnIABfyQZcsb8VKmYZQ0=;
        b=AhuE/W3/LIpTssYfwzhrWmIEgMnpo2yOmPEj3PY9A7ZgwHck+pf2RDkuTt1hRGQFv0
         n3h0QVnNjx6oEkFwFPmowwBXutvfKUdFn654CC/i7zSNZgK538LiERp7NbzhBxkVBpil
         Dmprque3hic353JsLx1wsbd9a9QIg7VnE8bH/BMPSUl0TRQ69gxKXGBW2GIqbIcUDFB1
         FwlcANa+JAnrno2xeUZEWkAOaiJTEhV7HCAyZ+p2JxXQi2+W+QKKagTGwleqE9mnZgMm
         eyAqGivtmGUOCDV7cuH8QTnlgNzxu8AacBckhufIUOP36EC5jl8UkkqaKiLC6L4oT+CB
         obGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sLvQyKcRjr6EpWBKUlEnp9ePnIABfyQZcsb8VKmYZQ0=;
        b=aTIDJTY8W6VhHlCRB0rF+2doWYkpZOd6sI7tgqWpQGgD27wdulyuAwurq0I4vj3Apk
         mwVBFI6f0jkAPPk7gM65GqooCXI1dhyGbwdQXG9A7FW5EUZGj8l9KtPyD1/xSGMYZr+s
         cNZh8yDj75C6QxdmYV5nEfJPB8+vY/JZ7axnhNX5BWMHFeZeafybrMJisLwtKzQ9I2da
         HdXNO1Ul/+gMIe2+jAxhfYRwU1tRFdmnsAPM7k/5rRNarqbobQI9OBGBf81KVFRCcqxG
         7dYfig1X3KYkKWTm01QxUpmJQTCjG2tNz57KO5oIpTbeB5Be92hH5+pP5O5PoHWwL23b
         QDTQ==
X-Gm-Message-State: AOAM533DL0X5yGtMSXtxDTIxljesi98IeV6YWHBaA6BTVPF1j6m3q1xA
	MRqt1tALsm6vYcIXFfqtpqJgL+WYCgnP6cCR
X-Google-Smtp-Source: ABdhPJyDO/Iv4rw39wc6QcxKHswm6YLhlEUoHSahCPMN/QsUi3HLyNQz5p0lbceLSst/ZzZC4It1Fg==
X-Received: by 2002:a37:5243:: with SMTP id g64mr68244qkb.248.1605626682268;
        Tue, 17 Nov 2020 07:24:42 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:41 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] linux-yocto/5.4: update to v5.4.71
Date: Tue, 17 Nov 2020 10:24:28 -0500
Message-Id: <7152ca7290252e81826231688668259649acc4d2.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    85b0841aab15 Linux 5.4.71
    22e6625babfc net_sched: commit action insertions together
    a5de4ee6d055 net_sched: defer tcf_idr_insert() in tcf_action_init_1()
    dbb763107d3e net: usb: rtl8150: set random MAC address when set_ethernet_addr() fails
    6c9edf2d855a Input: ati_remote2 - add missing newlines when printing module parameters
    536c767b14e3 net/mlx5e: Fix driver's declaration to support GRE offload
    8dc5025c6a44 net/tls: race causes kernel panic
    a42dbd059ef6 net/core: check length before updating Ethertype in skb_mpls_{push,pop}
    e39c9eba9bef tcp: fix receive window update in tcp_add_backlog()
    2729afe17987 mm: khugepaged: recalculate min_free_kbytes after memory hotplug as expected by khugepaged
    d94c1505fa91 mmc: core: don't set limits.discard_granularity as 0
    760c7a948bea perf: Fix task_function_call() error handling
    b750f86a62d1 rxrpc: Fix server keyring leak
    ae1a085b4aac rxrpc: The server keyring isn't network-namespaced
    513dd1609c9d rxrpc: Fix some missing _bh annotations on locking conn->state_lock
    422f5c5d3ef9 rxrpc: Downgrade the BUG() for unsupported token type in rxrpc_read()
    7e1f39b5c1d5 rxrpc: Fix rxkad token xdr encoding
    9a52da3f61b4 net/mlx5e: Fix VLAN create flow
    6b9752d85e72 net/mlx5e: Fix VLAN cleanup flow
    47e83c69fe14 net/mlx5e: Add resiliency in Striding RQ mode for packets larger than MTU
    1e7a94724b78 net/mlx5: Fix request_irqs error flow
    073fff810206 net/mlx5: Avoid possible free of command entry while timeout comp handler
    0955c774f32d virtio-net: don't disable guest csum when disable LRO
    15f84bdf6185 net: usb: ax88179_178a: fix missing stop entry in driver_info
    70877d04d41f r8169: fix RTL8168f/RTL8411 EPHY config
    7a96cbd74fcd mlxsw: spectrum_acl: Fix mlxsw_sp_acl_tcam_group_add()'s error path
    f3b35c3782ed mdio: fix mdio-thunder.c dependency & build error
    8d103b1f9ce5 bonding: set dev->needed_headroom in bond_setup_by_slave()
    3ce96a55b756 net: ethernet: cavium: octeon_mgmt: use phy_start and phy_stop
    e987ea087fd2 iavf: Fix incorrect adapter get in iavf_resume
    029ced5cce89 iavf: use generic power management
    84ab35eacdf2 xfrm: Use correct address family in xfrm_state_find
    4d3edb2e4d6e platform/x86: fix kconfig dependency warning for FUJITSU_LAPTOP
    dd2786a3e521 net: stmmac: removed enabling eee in EEE set callback
    e9a12de5a2be xfrm: clone whole liftime_cur structure in xfrm_do_migrate
    7ea7436c406c xfrm: clone XFRMA_SEC_CTX in xfrm_do_migrate
    c1becfebe33e xfrm: clone XFRMA_REPLAY_ESN_VAL in xfrm_do_migrate
    0bea401a9a5a xfrm: clone XFRMA_SET_MARK in xfrm_do_migrate
    f825fd534f8b iommu/vt-d: Fix lockdep splat in iommu_flush_dev_iotlb()
    bdffb36bcd38 drm/amdgpu: prevent double kfree ttm->sg
    4034664a733e openvswitch: handle DNAT tuple collision
    f89128ad358e net: team: fix memory leak in __team_options_register
    003269d8d6de team: set dev->needed_headroom in team_setup_by_port()
    fb3681c20fbf sctp: fix sctp_auth_init_hmacs() error path
    040e3110d49c i2c: owl: Clear NACK and BUS error bits
    abe997f632d1 i2c: meson: fixup rate calculation with filter delay
    6db69c390622 i2c: meson: fix clock setting overwrite
    209549c1c0f0 cifs: Fix incomplete memory allocation on setxattr path
    0afdda28eb2b xfrmi: drop ignore_df check before updating pmtu
    49af88ac6534 nvme-tcp: check page by sendpage_ok() before calling kernel_sendpage()
    15cac17d9d39 tcp: use sendpage_ok() to detect misused .sendpage
    d23dd3864b4c net: introduce helper sendpage_ok() in include/linux/net.h
    5c62d335317c mm/khugepaged: fix filemap page_to_pgoff(page) != offset
    1317469fa05b macsec: avoid use-after-free in macsec_handle_frame()
    20f96fee81c6 nvme-core: put ctrl ref when module ref get fail
    c0f3c5386995 btrfs: allow btrfs_truncate_block() to fallback to nocow for data space reservation
    e531fd7f8b3a btrfs: fix RWF_NOWAIT write not failling when we need to cow
    1f90600e259b btrfs: Ensure we trim ranges across block group boundary
    6a0f5da2db3b btrfs: volumes: Use more straightforward way to calculate map length
    5aefd1fa9f4d Btrfs: send, fix emission of invalid clone operations within the same file
    19d8412679f2 Btrfs: send, allow clone operations within the same file
    f02dc39bbb20 arm64: dts: stratix10: add status to qspi dts node
    e8e1d16e0b89 i2c: i801: Exclude device from suspend direct complete optimization
    2118c7ba5f2a perf top: Fix stdio interface input handling with glibc 2.28+
    2499c15115ac perf test session topology: Fix data path
    7c1847aa4932 driver core: Fix probe_count imbalance in really_probe()
    3fd2647f9d68 platform/x86: thinkpad_acpi: re-initialize ACPI buffer size when reuse
    da4cdc87dfeb platform/x86: intel-vbtn: Switch to an allow-list for SW_TABLET_MODE reporting
    6440fb9bda91 bpf: Prevent .BTF section elimination
    67a57230b4bf bpf: Fix sysfs export of empty BTF section
    9bd694ccfd44 platform/x86: thinkpad_acpi: initialize tp_nvram_state variable
    d101961ce588 platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360
    2293272345ff Platform: OLPC: Fix memleak in olpc_ec_probe
    ce8432912f1b usermodehelper: reset umask to default before executing user process
    920a61ddd3b5 vhost: Use vhost_get_used_size() in vhost_vring_set_addr()
    57b47abc1a4a vhost: Don't call access_ok() when using IOTLB
    456d77c1bdfa drm/nouveau/mem: guard against NULL pointer access in mem_del
    8ece83bf754f net: wireless: nl80211: fix out-of-bounds access in nl80211_del_key()
    ee413b2915bf io_uring: Fix double list add in io_queue_async_work()
    efb1cef27d59 io_uring: Fix remove irrelevant req from the task_list
    75524f753318 io_uring: Fix missing smp_mb() in io_cancel_async_work()
    d9e81b2fb372 io_uring: Fix resource leaking when kill the process
    4f46ef7bec86 Revert "ravb: Fixed to be able to unload modules"
    1b2fcd82c0ca fbcon: Fix global-out-of-bounds read in fbcon_get_font()
    f51ec3fd7128 Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
    eebe3685701b fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
    d22f99d235e1 Linux 5.4.70
    253052b636e9 netfilter: ctnetlink: add a range check for l3/l4 protonum
    27423bb05e25 ep_create_wakeup_source(): dentry name can change under you...
    8e58bad666bb epoll: EPOLL_CTL_ADD: close the race in decision to take fast path
    099b7a1bc791 epoll: replace ->visited/visited_list with generation count
    8993da3d4d3a epoll: do not insert into poll queues until all sanity checks are done
    8db44b30d392 nvme: consolidate chunk_sectors settings
    03f4f85bbd7d nvme: Introduce nvme_lba_to_sect()
    34b939695f28 nvme: Cleanup and rename nvme_block_nr()
    9626c1a63703 mm: don't rely on system state to detect hot-plug operations
    42b7153dd6a6 mm: replace memmap_context by meminit_context
    2334b2d5a2bd block/diskstats: more accurate approximation of io_ticks for slow disks
    1d13c3a5000b random32: Restore __latent_entropy attribute on net_rand_state
    4faf2c3a97ec scripts/dtc: only append to HOST_EXTRACFLAGS instead of overwriting
    ea4c691b58d7 Input: trackpoint - enable Synaptics trackpoints
    21b9387253a7 i2c: cpm: Fix i2c_ram structure
    811ac052e264 gpio: aspeed: fix ast2600 bank properties
    f2a2380812c6 gpio/aspeed-sgpio: don't enable all interrupts by default
    8323d1e09037 gpio/aspeed-sgpio: enable access to all 80 input & output sgpios
    eddeff708c15 iommu/exynos: add missing put_device() call in exynos_iommu_of_xlate()
    08e66c0c1c0e clk: samsung: exynos4: mark 'chipid' clock as CLK_IGNORE_UNUSED
    0ded28e3c468 clk: tegra: Always program PLL_E when enabled
    2f37a1ef1e5d nfs: Fix security label length not being reset
    6c5a11ead942 pinctrl: mvebu: Fix i2c sda definition for 98DX3236
    ae68b15839b0 phy: ti: am654: Fix a leak in serdes_am654_probe()
    543ea1af5744 gpio: sprd: Clear interrupt when setting the type as edge
    8c03d0ef62dd nvme-fc: fail new connections to a deleted host or remote port
    2b217eafcf74 nvme-pci: fix NULL req in completion handler
    157ccdf7eb2c spi: fsl-espi: Only process interrupts for expected events
    8cc5eb809aa5 tools/io_uring: fix compile breakage
    4e4646c85e89 tracing: Make the space reserved for the pid wider
    a0fe7f705457 mac80211: do not allow bigger VHT MPDUs than the hardware supports
    355a710f0813 mac80211: Fix radiotap header channel flag for 6GHz band
    126e6099b8c1 drivers/net/wan/hdlc: Set skb->protocol before transmitting
    3ba3fc3e7ea6 drivers/net/wan/lapbether: Make skb->protocol consistent with the header
    89fd103fbbb0 fuse: fix the ->direct_IO() treatment of iov_iter
    44b4baf850bd nvme-core: get/put ctrl and transport module in nvme_dev_open/release()
    0bcc3480393b rndis_host: increase sleep time in the query-response loop
    f19ff011027b net: dec: de2104x: Increase receive ring size for Tulip
    e9af030ddd4b drm/sun4i: mixer: Extend regmap max_register
    985a56c58c4f drivers/net/wan/hdlc_fr: Add needed_headroom for PVC devices
    91d59157b103 libbpf: Remove arch-specific include path in Makefile
    688aa0e0aaf9 clocksource/drivers/timer-gx6605s: Fixup counter reload
    3d54a640e20c drm/amdgpu: restore proper ref count in amdgpu_display_crtc_set_config
    de21eb7f8cb0 memstick: Skip allocating card when removing host
    c524a17312d4 ftrace: Move RCU is watching check after recursion check
    5ac7065e0866 iio: adc: qcom-spmi-adc5: fix driver name
    ac3bf99fc26a Input: i8042 - add nopnp quirk for Acer Aspire 5 A515
    aee38af574a1 xfs: trim IO to found COW extent limit
    aed60a1746ba net: virtio_vsock: Enhance connection semantics
    215459ff3666 vsock/virtio: add transport parameter to the virtio_transport_reset_no_sock()
    14c79ef213c2 clk: socfpga: stratix10: fix the divider for the emac_ptp_free_clk
    79c8ebdce55c gpio: tc35894: fix up tc35894 interrupt configuration
    035f59ad4ba8 gpio: mockup: fix resource leak in error path
    b079337f697a gpio: siox: explicitly support only threaded irqs
    57bd08a301f7 USB: gadget: f_ncm: Fix NDP16 datagram validation
    23389cf97aa1 mmc: sdhci: Workaround broken command queuing on Intel GLK based IRBIS models
    09c826447cb0 btrfs: fix filesystem corruption after a device replace

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 13f7246f46..8a8a3a91c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a5f7e9a874f0a6e9ad599b4fc6c491db231dd6f"
-SRCREV_meta ?= "7f765dcb29003bafc9c0ac770147940be6c420b2"
+SRCREV_machine ?= "5488b835533bde7677d5c3f2e12470fe8eb1f946"
+SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.69"
+LINUX_VERSION ?= "5.4.71"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 00e1b65782..9f27a0c47d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.69"
+LINUX_VERSION ?= "5.4.71"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "58f39df46d9daf12a095ffe225032ec325612960"
-SRCREV_machine ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_meta ?= "7f765dcb29003bafc9c0ac770147940be6c420b2"
+SRCREV_machine_qemuarm ?= "3f21b080aecabda99b3ba488f7bb8835e03779f7"
+SRCREV_machine ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index bcc5003268..bffe595809 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "561d4f6eb1de32e1448451db86656826cf406eb5"
-SRCREV_machine_qemuarm64 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_machine_qemumips ?= "e421f3f2399c153c4d58241cb6d1be926f7efc45"
-SRCREV_machine_qemuppc ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_machine_qemuriscv64 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_machine_qemux86 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_machine_qemux86-64 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_machine_qemumips64 ?= "72d2f11b5f171e196d6b9824b82575d9a7b59e6f"
-SRCREV_machine ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
-SRCREV_meta ?= "7f765dcb29003bafc9c0ac770147940be6c420b2"
+SRCREV_machine_qemuarm ?= "f14906a7f7547ce17fadb77a883a96471cb8efdf"
+SRCREV_machine_qemuarm64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_machine_qemumips ?= "0a724c6a22022929cc8f952f9f2f22126b6965ed"
+SRCREV_machine_qemuppc ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_machine_qemuriscv64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_machine_qemux86 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_machine_qemux86-64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_machine_qemumips64 ?= "c279484fbef538f67662c3b845b13407e467d610"
+SRCREV_machine ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
+SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.69"
+LINUX_VERSION ?= "5.4.71"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

