Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.10146.1619186452308569936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CxWtUJtg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id o16so11660733plg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rhA2VppeFNx1idR0wlgADCwsG7BPLK0pqLNnu/yA2Js=;
        b=CxWtUJtgkzJ4m3NTHGr78yj2/L+iqCvmTOB/mr0s0TxQ6VFR6ZBjyO0d0u3CNuefo7
         /ebPuHWX0fTHkS8TTXSy9Q/ATzxNMjbRisdYLOm9zHSsT8fnDpJkQwXuIMdnwEnD1Zue
         p1zK5lAuykipG3fO0LdS/euPQfRNtRBq+oGKVt/N4DrgMW+bLmnQmO3kbophtWZChQgb
         sQHRzj+g4FDX2WcDQXHO3FoXDxhbDniZb+TsPAMUBmiONirlsPBic6o5s3mcP25CDQy0
         0mrHpJooSPt7X7aPCLrBzfQy09T8yz/5cI3Pa8NK6DnzGVSmw0vAVIhUvgk2YqofJ8ta
         ydlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rhA2VppeFNx1idR0wlgADCwsG7BPLK0pqLNnu/yA2Js=;
        b=S59vTx7mGJlsBN09bx1P+QKNZon+lVQjWW797/w+DRBqo0jXzC0Cp4vQz/h9ZTWY3e
         0Of65pWvV76cPcEGxyIszCBzJ8uALh5PKZ1tr50SKFy0a6FHA307+KlQtBDY5y/U7XBI
         A8ZZ4ykSTF+2Glnz+f/v2YHPBbtsTtYWgiaZP3EXViJ6AtETy0iBEDdVhIuha2NWqtbu
         acrFtuL3g3wHyusGae8upkviZdKw6LVC9dwcYjlJHjauNZsNBcF9mw+qi9KM13TlCXHx
         Q23OHtGKjbVcGN4HJChfaZVtY4PiobBNvkV+SoLarmP5ZG2Zwni+yATVv6X1yf8PefiG
         FvrQ==
X-Gm-Message-State: AOAM531/MdEiqLeo5Ez1QysqjPziateWqGI7+D1JuNHJx8aaJeg5Uu3i
	jBEIKIzkmfyL7LuGBqbIbgwNQGwydgfXYscD3ns=
X-Google-Smtp-Source: ABdhPJwtXIPAlAaN3r/koPOhUSm4kZ0NJHrPUt0p29KpvZXUvP+hf2GIKKYegblHU22mtyhv5FhKYQ==
X-Received: by 2002:a17:90a:e507:: with SMTP id t7mr4659729pjy.14.1619186451219;
        Fri, 23 Apr 2021 07:00:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/19] linux-yocto/5.4: update to v5.4.112
Date: Fri, 23 Apr 2021 03:59:00 -1000
Message-Id: <d7577189b7ee234c733c1997aee83a1908c36b65.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    8f55ad4daf00 Linux 5.4.112
    ea42fd91d304 Revert "cifs: Set CIFS_MOUNT_USE_PREFIX_PATH flag on setting cifs_sb->prepath."
    7ee5bde3164c net: ieee802154: stop dump llsec params for monitors
    b4042ecc12cb net: ieee802154: forbid monitor for del llsec seclevel
    e82f8b7713ab net: ieee802154: forbid monitor for set llsec params
    948a2817f71d net: ieee802154: fix nl802154 del llsec devkey
    b3a105e15cd6 net: ieee802154: fix nl802154 add llsec key
    4097afd93df7 net: ieee802154: fix nl802154 del llsec dev
    7d32fc7964d6 net: ieee802154: fix nl802154 del llsec key
    8f4c815c74f4 net: ieee802154: nl-mac: fix check on panid
    38ea2b3ed00f net: mac802154: Fix general protection fault
    6e7098f56c83 drivers: net: fix memory leak in peak_usb_create_dev
    32e2f9a708e1 drivers: net: fix memory leak in atusb_probe
    0a790ad1358b net: tun: set tun->dev->addr_len during TUNSETLINK processing
    ed13df88c6d5 cfg80211: remove WARN_ON() in cfg80211_sme_connect
    628ac886dfba net: sched: bump refcount for new action in ACT replace mode
    3dbafee8426f dt-bindings: net: ethernet-controller: fix typo in NVMEM
    f4c5968da773 clk: socfpga: fix iomem pointer cast on 64-bit
    35ba6d9240ee RAS/CEC: Correct ce_add_elem()'s returned values
    f666ad4f8d87 RDMA/addr: Be strict with gid size
    44d03319fe77 RDMA/cxgb4: check for ipv6 address properly while destroying listener
    3ca5345db92c net/mlx5: Fix PBMC register mapping
    798d94a274fb net/mlx5: Fix placement of log_max_flow_counter
    9716aac17419 net: hns3: clear VF down state bit before request link status
    9dd7092d1a96 openvswitch: fix send of uninitialized stack memory in ct limit reply
    731abf396e37 net: openvswitch: conntrack: simplify the return expression of ovs_ct_limit_get_default_limit()
    d0aab59f0993 perf inject: Fix repipe usage
    d3343a35d108 s390/cpcmd: fix inline assembly register clobbering
    c88fa8d4f994 workqueue: Move the position of debug_work_activate() in __queue_work()
    14060454cdb9 clk: fix invalid usage of list cursor in unregister
    bedda47d5dce clk: fix invalid usage of list cursor in register
    b3717885865c net: macb: restore cmp registers on resume path
    c61fe6b7e21f scsi: ufs: core: Fix wrong Task Tag used in task management request UPIUs
    81fddc7be649 scsi: ufs: core: Fix task management request completion timeout
    f6abec1a3172 scsi: ufs: Use blk_{get,put}_request() to allocate and free TMFs
    a8d2d45c70c7 scsi: ufs: Avoid busy-waiting by eliminating tag conflicts
    c5efc9d26c84 scsi: ufs: Fix irq return code
    537a2449cc6f net: udp: Add support for getsockopt(..., ..., UDP_GRO, ..., ...);
    de8c5962bdae drm/msm: Set drvdata to NULL when msm_drm_init() fails
    e22ce1d21b42 i40e: Fix display statistics for veb_tc
    7c0d2372298f soc/fsl: qbman: fix conflicting alignment attributes
    c178e8a19937 net/rds: Fix a use after free in rds_message_map_pages
    73f88cc2bf5c net/mlx5: Don't request more than supported EQs
    029416e14be2 net/mlx5e: Fix ethtool indication of connector type
    1f3010fc3fe6 ASoC: sunxi: sun4i-codec: fill ASoC card owner
    db4600aa938c net: phy: broadcom: Only advertise EEE for supported modes
    6aa7d2621b19 nfp: flower: ignore duplicate merge hints from FW
    bbbee59f4f32 net/ncsi: Avoid channel_monitor hrtimer deadlock
    c66b672a231c ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces
    c991ca6a2c79 net:tipc: Fix a double free in tipc_sk_mcast_rcv
    200c8453287f cxgb4: avoid collecting SGE_QBASE regs during traffic
    e9bdd3e45f0e gianfar: Handle error code at MAC address change
    516c436ff5d6 can: bcm/raw: fix msg_namelen values depending on CAN_REQUIRED_SIZE
    ca443546f8d4 arm64: dts: imx8mm/q: Fix pad control of SD1_DATA0
    840a181729ac sch_red: fix off-by-one checks in red_check_params()
    accb27006595 amd-xgbe: Update DMA coherency values
    e472f6814ceb hostfs: fix memory handling in follow_link()
    613f35568a5d hostfs: Use kasprintf() instead of fixed buffer formatting
    fec47d458add i40e: Fix kernel oops when i40e driver removes VF's
    c0aacaa0a8f2 i40e: Added Asym_Pause to supported link modes
    f819977ad42c xfrm: Fix NULL pointer dereference on policy lookup
    bac7e764e5d5 ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled for some chips
    b32969aaed1c ASoC: SOF: Intel: HDA: fix core status verification
    99b4e9af8f00 ASoC: SOF: Intel: hda: remove unnecessary parentheses
    540ddeed5c51 esp: delete NETIF_F_SCTP_CRC bit from features for esp offload
    a128e07b472b net: xfrm: Localize sequence counter per network namespace
    34659399e713 regulator: bd9571mwv: Fix AVS and DVFS voltage range
    d78e99dd4960 xfrm: interface: fix ipv4 pmtu check to honor ip header df
    7977d5fe3d5b net: dsa: lantiq_gswip: Configure all remaining GSWIP_MII_CFG bits
    249908ed36a8 net: dsa: lantiq_gswip: Don't use PHY auto polling
    910e785ba8de virtio_net: Add XDP meta data support
    0534f1f1bc76 i2c: turn recovery error on init to debug
    cafced041915 usbip: synchronize event handler with sysfs code paths
    37168011d427 usbip: vudc synchronize sysfs code paths
    06fedcc6870e usbip: stub-dev synchronize sysfs code paths
    6a435364b608 usbip: add sysfs_lock to synchronize sysfs code paths
    b02bded94b91 net: let skb_orphan_partial wake-up waiters.
    fd8a95d56050 net-ipv6: bugfix - raw & sctp - switch to ipv6_can_nonlocal_bind()
    b5e7653ffdd1 net: hsr: Reset MAC header for Tx path
    a9311be5f617 mac80211: fix TXQ AC confusion
    5a4f39f19e6f net: sched: sch_teql: fix null-pointer dereference
    2f5edf14f62a i40e: Fix sparse error: 'vsi->netdev' could be null
    b31d91e9e8c8 i40e: Fix sparse warning: missing error code 'err'
    599200ad44e7 net: ensure mac header is set in virtio_net_hdr_to_skb()
    158a9b815c54 bpf, sockmap: Fix sk->prot unhash op reset
    0242251d6a97 ethernet/netronome/nfp: Fix a use after free in nfp_bpf_ctrl_msg_rx
    4a2933c88399 net: hso: fix null-ptr-deref during tty device unregistration
    ef2ccf84071f ice: Cleanup fltr list in case of allocation issues
    0df579b3de8c ice: Fix for dereference of NULL pointer
    1aecc5781101 ice: Increase control queue timeout
    9de1caa1103f batman-adv: initialize "struct batadv_tvlv_tt_vlan_data"->reserved field
    79407ae3475e ARM: dts: turris-omnia: configure LED[2]/INTn pin as interrupt pin
    9dfd74a8c015 parisc: avoid a warning on u8 cast for cmpxchg on u8 pointers
    957d0308aa36 parisc: parisc-agp requires SBA IOMMU driver
    507c2009dc4c fs: direct-io: fix missing sdio->boundary
    f495bedb001b ocfs2: fix deadlock between setattr and dio_end_io_write
    52999a66c0b3 nds32: flush_dcache_page: use page_mapping_file to avoid races with swapoff
    75fd54ea1b60 ia64: fix user_stack_pointer() for ptrace()
    7a92396bf8dd gcov: re-fix clang-11+ support
    c2b3cf2c70d6 drm/i915: Fix invalid access to ACPI _DSM objects
    0e8f850e26b2 net: dsa: lantiq_gswip: Let GSWIP automatically set the xMII clock
    6649b5eda131 net: ipv6: check for validity before dereferencing cfg->fc_nlinfo.nlh
    a09acbb53934 xen/evtchn: Change irq_info lock to raw_spinlock_t
    aa0cff2e0751 nfc: Avoid endless loops caused by repeated llcp_sock_connect()
    404daa4d62a3 nfc: fix memory leak in llcp_sock_connect()
    41bc58ba0945 nfc: fix refcount leak in llcp_sock_connect()
    c89903c9eff2 nfc: fix refcount leak in llcp_sock_bind()
    12289d9840d6 ASoC: intel: atom: Stop advertising non working S24LE support
    c99780f782aa ALSA: hda/realtek: Fix speaker amp setup on Acer Aspire E1
    da8f3cc5771e ALSA: aloop: Fix initialization of controls
    8732c2df9d15 counter: stm32-timer-cnt: fix ceiling miss-alignment with reload register

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd41c1b7170b4d27bebac0a4387cad070c41e03d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 93a5a95a7a..8ae1e91cad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cccae402fe6c1892e4395e25bd482d6bc8f00826"
-SRCREV_meta ?= "5973c11656b6d5221a764be1b2f1622c7e905e6c"
+SRCREV_machine ?= "324e77d816cf6434507ab29140beb24044009efa"
+SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.111"
+LINUX_VERSION ?= "5.4.112"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 059a7196fe..f07375c761 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.111"
+LINUX_VERSION ?= "5.4.112"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "519d4d331aad2c1302530c5af0b4356b6f362be9"
-SRCREV_machine ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_meta ?= "5973c11656b6d5221a764be1b2f1622c7e905e6c"
+SRCREV_machine_qemuarm ?= "8463db325b93f0669446f68c19334cfe11ffb9c2"
+SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 69f1ffff65..85ac0a651b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "eee89fab3a932bbd8a54995a5da2ac15af2d929f"
-SRCREV_machine_qemuarm64 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_machine_qemumips ?= "7cafd60186c08ce6d941ad1bcfc539950534a178"
-SRCREV_machine_qemuppc ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_machine_qemuriscv64 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_machine_qemux86 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_machine_qemux86-64 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_machine_qemumips64 ?= "e7d9c5457ce29ae61c37580888743951f2bf65b9"
-SRCREV_machine ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
-SRCREV_meta ?= "5973c11656b6d5221a764be1b2f1622c7e905e6c"
+SRCREV_machine_qemuarm ?= "133328e5d558f6060a5633d71506a6b716bb4fc6"
+SRCREV_machine_qemuarm64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_machine_qemumips ?= "eef7365804592f95bceefa143cdb3cc19e8c6b66"
+SRCREV_machine_qemuppc ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_machine_qemuriscv64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_machine_qemux86 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_machine_qemux86-64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_machine_qemumips64 ?= "996fe040c8d8d01a9af6be42dae3844d127471bf"
+SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
+SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.111"
+LINUX_VERSION ?= "5.4.112"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

