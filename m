Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.928.1619398453420840329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9yOoBsJ6oMUm/DKGGXqPOx6/I2n2SOppDBl2oqeaWGIXJA+C5TttACj+SDBbCF+q+28BqE2IN7
 3720nIYuP9GA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818063"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:13 -0700
IronPort-SDR: 4iWReAJYdEStIqlk+zY+W0uWVPAxms/Ig935oT0KzCBTkeisDrfNBcpkEsExLOtVHNb3ndMatr
 pYINpJptjuJw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067267"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/64] linux-yocto/5.10: update to v5.10.30
Date: Mon, 26 Apr 2021 08:52:44 +0800
Message-Id: <ccbfd33bea75460cc97ffaeea78972ca3b6bd395.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    1e798745fa8e Linux 5.10.30
    b451aed56348 Revert "net: sched: bump refcount for new action in ACT replace mode"
    a22115c3492f net: ieee802154: stop dump llsec params for monitors
    f872fb3feadd net: ieee802154: forbid monitor for del llsec seclevel
    a933bcbb1f7f net: ieee802154: forbid monitor for set llsec params
    0238c7b47f77 net: ieee802154: fix nl802154 del llsec devkey
    d06a96e72803 net: ieee802154: fix nl802154 add llsec key
    399f38c420ee net: ieee802154: fix nl802154 del llsec dev
    07699fcce052 net: ieee802154: fix nl802154 del llsec key
    8bfb45fa131d net: ieee802154: nl-mac: fix check on panid
    38731bbcd9f0 net: mac802154: Fix general protection fault
    9f51a42d81f6 drivers: net: fix memory leak in peak_usb_create_dev
    160ac0d55d52 drivers: net: fix memory leak in atusb_probe
    4d9117b7404a net: tun: set tun->dev->addr_len during TUNSETLINK processing
    26ab092615f5 cfg80211: remove WARN_ON() in cfg80211_sme_connect
    138a6e1dc35e gpiolib: Read "gpio-line-names" from a firmware node
    300368c59cf0 net: sched: bump refcount for new action in ACT replace mode
    982dd14fba0f dt-bindings: net: ethernet-controller: fix typo in NVMEM
    c65a000a236e lockdep: Address clang -Wformat warning printing for %hd
    4c4aa344edf4 clk: socfpga: fix iomem pointer cast on 64-bit
    674ddb52f94b RAS/CEC: Correct ce_add_elem()'s returned values
    253acf2e983b vdpa/mlx5: Fix wrong use of bit numbers
    0ddb34c2ccce vdpa/mlx5: should exclude header length and fcs from mtu
    5700c3d4abb2 RDMA/addr: Be strict with gid size
    e53ff6e59144 i40e: Fix parameters in aq_get_phy_register()
    999852207464 drm/vc4: crtc: Reduce PV fifo threshold on hvs4
    d8a0861e269d RDMA/qedr: Fix kernel panic when trying to access recv_cq
    3fa7ae3f3754 perf report: Fix wrong LBR block sorting
    7f40e9332898 RDMA/cxgb4: check for ipv6 address properly while destroying listener
    03ad6a2521a0 net/mlx5: Fix PBMC register mapping
    1312f11eb33d net/mlx5: Fix PPLM register mapping
    f92faf0bdd25 net/mlx5: Fix placement of log_max_flow_counter
    f780a0808827 net: hns3: clear VF down state bit before request link status
    f473789db536 tipc: increment the tmp aead refcnt before attaching it
    3292c4fc9ce2 can: mcp251x: fix support for half duplex SPI host controllers
    a96f1ed70927 iwlwifi: fix 11ax disabled bit in the regulatory capability flags
    363d610a9652 i2c: designware: Adjust bus_freq_hz when refuse high speed mode set
    cc5418973cc9 openvswitch: fix send of uninitialized stack memory in ct limit reply
    3e288c3a7d55 net: openvswitch: conntrack: simplify the return expression of ovs_ct_limit_get_default_limit()
    3b70c6f26364 perf inject: Fix repipe usage
    d9dc1b406cb9 s390/cpcmd: fix inline assembly register clobbering
    7943f749f0d2 workqueue: Move the position of debug_work_activate() in __queue_work()
    b3f29ed5dd4b clk: fix invalid usage of list cursor in unregister
    2307baac56af clk: fix invalid usage of list cursor in register
    d9c55b2d3368 net: macb: restore cmp registers on resume path
    af36da5becfb net: cls_api: Fix uninitialised struct field bo->unlocked_driver_cb
    ffd5f1e87c15 scsi: ufs: core: Fix wrong Task Tag used in task management request UPIUs
    ff9231ddfec8 scsi: ufs: core: Fix task management request completion timeout
    71ee255d0698 mptcp: forbit mcast-related sockopt on MPTCP sockets
    24bbfe89b1c7 net: udp: Add support for getsockopt(..., ..., UDP_GRO, ..., ...);
    a08d5d3bec53 drm/msm: Set drvdata to NULL when msm_drm_init() fails
    7290bf419894 RDMA/rtrs-clt: Close rtrs client conn before destroying rtrs clt session files
    49cfa2b20193 i40e: Fix display statistics for veb_tc
    e8c96b57a781 soc/fsl: qbman: fix conflicting alignment attributes
    553290002aa8 xdp: fix xdp_return_frame() kernel BUG throw for page_pool memory model
    4cfae7b23889 net/rds: Fix a use after free in rds_message_map_pages
    05bbe9d85a4c net/mlx5: Don't request more than supported EQs
    86530effd18f net/mlx5e: Fix ethtool indication of connector type
    bde64eac2379 net/mlx5e: Fix mapping of ct_label zero
    d65b66ca3334 ASoC: sunxi: sun4i-codec: fill ASoC card owner
    dcdf0876b040 I2C: JZ4780: Fix bug for Ingenic X1000.
    f295dfc831bc net: phy: broadcom: Only advertise EEE for supported modes
    7a896e189361 nfp: flower: ignore duplicate merge hints from FW
    6af631d1caf2 net: qrtr: Fix memory leak on qrtr_tx_wait failure
    dfe7805e6aa6 net/ncsi: Avoid channel_monitor hrtimer deadlock
    ae4a8d10ac8b ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces
    e5e5ecc9d9fd net:tipc: Fix a double free in tipc_sk_mcast_rcv
    f273e3726e14 cxgb4: avoid collecting SGE_QBASE regs during traffic
    63a64c366ce0 net: dsa: Fix type was not set for devlink port
    ed613d96842e gianfar: Handle error code at MAC address change
    1eb5f4e00755 ethernet: myri10ge: Fix a use after free in myri10ge_sw_tso
    759b44d247c6 mlxsw: spectrum: Fix ECN marking in tunnel decapsulation
    d02b68a92905 can: isotp: fix msg_namelen values depending on CAN_REQUIRED_SIZE
    1d3837ca7335 can: bcm/raw: fix msg_namelen values depending on CAN_REQUIRED_SIZE
    58f8f1074039 xfrm: Provide private skb extensions for segmented and hw offloaded ESP packets
    bc0b89a9a28f arm64: dts: imx8mm/q: Fix pad control of SD1_DATA0
    d9670f5e77e5 drivers/net/wan/hdlc_fr: Fix a double free in pvc_xmit
    d38bce5adcd9 sch_red: fix off-by-one checks in red_check_params()
    985c9bb1b594 geneve: do not modify the shared tunnel info when PMTU triggers an ICMP reply
    f3bc1885746f vxlan: do not modify the shared tunnel info when PMTU triggers an ICMP reply
    f33f79703a4e amd-xgbe: Update DMA coherency values
    e5a3449ce16a hostfs: fix memory handling in follow_link()
    3cc4db1213a4 i40e: Fix kernel oops when i40e driver removes VF's
    9856607c9c29 i40e: Added Asym_Pause to supported link modes
    d4d4c6a4ca7c virtchnl: Fix layout of RSS structures
    95d58bf5ed43 xfrm: Fix NULL pointer dereference on policy lookup
    48a443026bb6 ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled for some chips
    f6db9dbfa6b6 ASoC: SOF: Intel: HDA: fix core status verification
    ef4ddd1d6d93 esp: delete NETIF_F_SCTP_CRC bit from features for esp offload
    0224432a8fc1 net: xfrm: Localize sequence counter per network namespace
    1e6a3b41cf2a ARM: OMAP4: PM: update ROM return address for OSWR and OFF
    042b2cad81de ARM: OMAP4: Fix PMIC voltage domains for bionic
    1f51cb88e788 regulator: bd9571mwv: Fix AVS and DVFS voltage range
    b267688ce007 remoteproc: qcom: pil_info: avoid 64-bit division
    c7a175a24b0e xfrm: Use actual socket sk instead of skb socket for xfrm_output_resume
    3b74ce529ece xfrm: interface: fix ipv4 pmtu check to honor ip header df
    2d62d6980c2b ice: Recognize 860 as iSCSI port in CEE mode
    fd92e7aacc16 ice: Refactor DCB related variables out of the ice_port_info struct
    4a78ae127803 net: sched: fix err handler in tcf_action_init()
    3c7d3d188ca7 KVM: x86/mmu: preserve pending TLB flush across calls to kvm_tdp_mmu_zap_sp
    25fc773b21ce KVM: x86/mmu: Don't allow TDP MMU to yield when recovering NX pages
    be2c527b5d39 KVM: x86/mmu: Ensure TLBs are flushed for TDP MMU during NX zapping
    0aa4dd9e5132 KVM: x86/mmu: Ensure TLBs are flushed when yielding during GFN range zap
    3c7a18440638 KVM: x86/mmu: Yield in TDU MMU iter even if no SPTES changed
    85f4ff2b06af KVM: x86/mmu: Ensure forward progress when yielding in TDP MMU iter
    1cd17c5c9b8a KVM: x86/mmu: Rename goal_gfn to next_last_level_gfn
    b4a3a0d27924 KVM: x86/mmu: Merge flush and non-flush tdp_mmu_iter_cond_resched
    8f90432d7f59 KVM: x86/mmu: change TDP MMU yield function returns to match cond_resched
    5ea9e6038d29 i2c: turn recovery error on init to debug
    efa869b68be9 percpu: make pcpu_nr_empty_pop_pages per chunk type
    c441949184a9 scsi: target: iscsi: Fix zero tag inside a trace event
    d8e7fa8509d7 scsi: pm80xx: Fix chip initialization failure
    0c47d8a55f7f driver core: Fix locking bug in deferred_probe_timeout_work_func()
    f06cb4641b15 usbip: synchronize event handler with sysfs code paths
    28dc9237fe83 usbip: vudc synchronize sysfs code paths
    513765b186c9 usbip: stub-dev synchronize sysfs code paths
    68be610c19a5 usbip: add sysfs_lock to synchronize sysfs code paths
    126ce97d39cf thunderbolt: Fix off by one in tb_port_find_retimer()
    256ece954961 thunderbolt: Fix a leak in tb_retimer_add()
    b830650c1a0c net: let skb_orphan_partial wake-up waiters.
    5d9216b85100 net-ipv6: bugfix - raw & sctp - switch to ipv6_can_nonlocal_bind()
    b82816d77875 net: hsr: Reset MAC header for Tx path
    9b9c910ccc19 mac80211: fix TXQ AC confusion
    cc357c29358d mac80211: fix time-is-after bug in mlme
    cc1a702e6ec0 cfg80211: check S1G beacon compat element length
    fea52345f422 nl80211: fix potential leak of ACL params
    42e4450e3790 nl80211: fix beacon head validation
    81692c6add7e net: sched: fix action overwrite reference counting
    cdcf3829f418 net: sched: sch_teql: fix null-pointer dereference
    422eda625516 vdpa/mlx5: Fix suspend/resume index restoration
    89e406e95278 i40e: Fix sparse errors in i40e_txrx.c
    12e1438a0946 i40e: Fix sparse error: uninitialized symbol 'ring'
    2472ba1c46b4 i40e: Fix sparse error: 'vsi->netdev' could be null
    792387118204 i40e: Fix sparse warning: missing error code 'err'
    f0b4c9acf5fe net: ensure mac header is set in virtio_net_hdr_to_skb()
    72c5de25ba83 bpf, sockmap: Fix incorrect fwd_alloc accounting
    00c01de1a994 bpf, sockmap: Fix sk->prot unhash op reset
    d921baabd964 bpf: Refcount task stack in bpf_get_task_stack
    caef7806141a libbpf: Only create rx and tx XDP rings when necessary
    4cc9177b099e libbpf: Restore umem state after socket create failure
    5aa7df172207 libbpf: Ensure umem pointer is non-NULL before dereferencing
    b52e88638f71 ethernet/netronome/nfp: Fix a use after free in nfp_bpf_ctrl_msg_rx
    d86046a77535 bpf: link: Refuse non-O_RDWR flags in BPF_OBJ_GET
    b7004ecafade bpf: Enforce that struct_ops programs be GPL-only
    3015db3de715 libbpf: Fix bail out from 'ringbuf_process_ring()' on error
    dc195928d7e4 net: hso: fix null-ptr-deref during tty device unregistration
    c2743e0a631c ice: fix memory leak of aRFS after resuming from suspend
    6bd4e822925d iwlwifi: pcie: properly set LTR workarounds on 22000 devices
    e5386e87f8aa ice: Cleanup fltr list in case of allocation issues
    9d1c342c5018 ice: Use port number instead of PF ID for WoL
    b69686110291 ice: Fix for dereference of NULL pointer
    4d73a6143d40 ice: remove DCBNL_DEVRESET bit from PF state
    286830a8469c ice: fix memory allocation call
    4686a26e9536 ice: prevent ice_open and ice_stop during reset
    ef7ed8c77d1c ice: Increase control queue timeout
    6590b7bfbc2b ice: Continue probe on link/PHY errors
    9a7bc0c40367 batman-adv: initialize "struct batadv_tvlv_tt_vlan_data"->reserved field
    d1173effc574 ARM: dts: turris-omnia: configure LED[2]/INTn pin as interrupt pin
    4941889535f3 parisc: avoid a warning on u8 cast for cmpxchg on u8 pointers
    597121792eb4 parisc: parisc-agp requires SBA IOMMU driver
    9b54dad28def of: property: fw_devlink: do not link ".*,nr-gpios"
    009c5665278b ethtool: fix incorrect datatype in set_eee ops
    3a675c1b507f fs: direct-io: fix missing sdio->boundary
    b1a5122554ae ocfs2: fix deadlock between setattr and dio_end_io_write
    4fabcf229477 nds32: flush_dcache_page: use page_mapping_file to avoid races with swapoff
    7d9da660affc ia64: fix user_stack_pointer() for ptrace()
    8e5bfafedf6d gcov: re-fix clang-11+ support
    43908139368e LOOKUP_MOUNTPOINT: we are cleaning "jumped" flag too late
    de427b662bfb IB/hfi1: Fix probe time panic when AIP is enabled with a buggy BIOS
    856f60e3e800 ACPI: processor: Fix build when CONFIG_ACPI_PROCESSOR=m
    8599a39adca8 drm/i915: Fix invalid access to ACPI _DSM objects
    bf991df9535e net: dsa: lantiq_gswip: Configure all remaining GSWIP_MII_CFG bits
    c4ae852ec940 net: dsa: lantiq_gswip: Don't use PHY auto polling
    ba39959bfebd net: dsa: lantiq_gswip: Let GSWIP automatically set the xMII clock
    40375bc3d0f9 net: ipv6: check for validity before dereferencing cfg->fc_nlinfo.nlh
    005c5afa9f85 xen/evtchn: Change irq_info lock to raw_spinlock_t
    a28124e8ad03 selinux: fix race between old and new sidtab
    fd75d73aa214 selinux: fix cond_list corruption when changing booleans
    4f29b08e238f selinux: make nslot handling in avtab more robust
    a12a2fa9a129 nfc: Avoid endless loops caused by repeated llcp_sock_connect()
    568ac94df580 nfc: fix memory leak in llcp_sock_connect()
    99b596199e84 nfc: fix refcount leak in llcp_sock_connect()
    6fb003e5ae18 nfc: fix refcount leak in llcp_sock_bind()
    117557711974 ASoC: intel: atom: Stop advertising non working S24LE support
    c4a6fb0e8389 ALSA: hda/conexant: Apply quirk for another HP ZBook G5 model
    6c9119de7ffe ALSA: hda/realtek: Fix speaker amp setup on Acer Aspire E1
    6efe4c1f4d17 ALSA: aloop: Fix initialization of controls
    4c933ff31f21 xfrm/compat: Cleanup WARN()s that can be user-triggered

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aec9a6d709f14decd65013434f13a26c57e9196f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ce88554830..b22eb94e41 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a1cb83d2e69b4c895cefa0e8716c8e9021d757bf"
-SRCREV_meta ?= "6dbb20d3127b3380779a11b1552429c5d4a0417e"
+SRCREV_machine ?= "60ca2b8c07383a2d46fef1b668e34dff90c1b404"
+SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.29"
+LINUX_VERSION ?= "5.10.30"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3581f3b4b0..54575a7917 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.29"
+LINUX_VERSION ?= "5.10.30"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bbc9efbcc604d823555794878f966b2ad7e5f4ca"
-SRCREV_machine ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_meta ?= "6dbb20d3127b3380779a11b1552429c5d4a0417e"
+SRCREV_machine_qemuarm ?= "ee7efde0c94e8b2eba1a5a2709f2d21874ac7525"
+SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 278f8a67fe..e93e41c69b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "13b4e1548d504dca91ff49abba5be4df728840e6"
-SRCREV_machine_qemuarm64 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_machine_qemumips ?= "ba6c1c115792e0c80412a7e0b54d6003cfbed491"
-SRCREV_machine_qemuppc ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_machine_qemuriscv64 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_machine_qemuriscv32 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_machine_qemux86 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_machine_qemux86-64 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_machine_qemumips64 ?= "2e99735de1312c0403ff23cb0c50fa8153e80be7"
-SRCREV_machine ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
-SRCREV_meta ?= "6dbb20d3127b3380779a11b1552429c5d4a0417e"
+SRCREV_machine_qemuarm ?= "4f13e8499f2bfc9d95dcc70b981ea16351ff088b"
+SRCREV_machine_qemuarm64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemumips ?= "64f8949180b1a6375abef20eebf735e853701c71"
+SRCREV_machine_qemuppc ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemuriscv64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemuriscv32 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemux86 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemux86-64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemumips64 ?= "6bf49ed9b223173d918b7c0140b8d0561bc2674c"
+SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.29"
+LINUX_VERSION ?= "5.10.30"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

