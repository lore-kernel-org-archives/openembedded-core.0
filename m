Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9A37F8AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 03:07:26 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e5so28863567qtm.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 19:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k3XSsmJNz7uuSIhtTocyok3pAWdsXP/lki5nBwlNt6A=;
	b=Ry8VS2SyzBAEmgp3B7Awp9+Tz1/s+yOh8unb1TyX/0Wm0/8cKqkKiLZIp2HNe41wLJ
	s4RC1rDcrxiskQ/CCAPCWz2eBnkDdbSBt9aVl6spO6cvmA3p9Y4v9BtLgh5xudWtS4zM
	8PI9B0XTZLsZ7BEyEhK8q3lU9NASEPTrriKL+foaTJGKNysE4RNFJOka0yhakAv8IqjP
	yy1XztHdKe9W8L+RAuEdKmkUWLRG3eGmT5GTuq8ZV6ms4GW9ToXdh1JJJK4NKk00KzyB
	20HLkrUk6Q/u0X9WPWjFXDtpbgjDUIhVmNpJ8th6cOQRmrNcVFrNVGZ6nGDQf0U4KXIC
	C4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k3XSsmJNz7uuSIhtTocyok3pAWdsXP/lki5nBwlNt6A=;
	b=DpdjKVVIKmL5yuXlsgAOUYOLyuIRS38j76164zRzXpDpDSqog8alv8YMPFV/xNgFaE
	vXOiDzat6TKj/eZXFWYZ1cn/0LM2j2HQEvkq6FtCEEw7vk6GohPKJvMR4DD4aMDRRY0L
	gswL++0QOuAfJhh0kecMkaqBWbfh9o/4JXoVicG1XePgGRvIVh9pF1lZjD1nGcFgd1ZQ
	9+v0w4clh0YKgvU9SPzojr7Bvf/Vp2bVA8rJiIfdYLIzEK6K4Qhk+g3e5IYE6rF+pqOc
	ypk/rSqcMnR77j2hy+MBYbw/1eq7d68xtywBzCaWvxLL3aY/qQtsld607V1aJDwzdvCP
	fVxA==
X-Gm-Message-State: APjAAAVf4OEJhuPrzh0KJqYSCzuHMPXiPX+8Ld0lLfN2tPjPFwMsPxl3
	GNuDCqZVO+ZKzkmbvAub2go=
X-Google-Smtp-Source: APXvYqwPRr0w8ONQQKLdjTHKo88nqTzCpHK9Euw8GoD20ni4tAAiMYpMhKo0IQmkhCcprac7ojZ5Vw==
X-Received: by 2002:ac8:4554:: with SMTP id z20mr45549641qtn.121.1577675246871;
	Sun, 29 Dec 2019 19:07:26 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	z141sm12036800qkb.63.2019.12.29.19.07.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 19:07:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 29 Dec 2019 22:07:20 -0500
Message-Id: <4de4b1521ab4abebe68047c94da02c368093f0ef.1577674956.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1577674956.git.bruce.ashfield@gmail.com>
References: <cover.1577674956.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.2: update to v5.2.28
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Dec 2019 03:07:26 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    7943d7e69aa7 Linux 5.2.28
    b5db992cfdd3 usbip: Fix uninitialized symbol 'nents' in stub_recv_cmd_submit()
    a0b637f7868d usb: gadget: configfs: Fix missing spin_lock_init()
    aee8c2147a36 net: cdc_ncm: Signedness bug in cdc_ncm_set_dgram_size()
    a04397ac5986 bonding: fix active-backup transition after link failure
    0993efbf3f01 ALSA: usb-audio: Fix incorrect size check for processing/extension units
    66375457a696 ALSA: usb-audio: Fix incorrect NULL check in create_yamaha_midi_quirk()
    c0920628d63f ALSA: hda/ca0132 - Fix work handling in delayed HP detection
    e14b1f4b4011 mwifiex: fix possible heap overflow in mwifiex_process_country_ie()
    060505a3c9dc io_uring: use current task creds instead of allocating a new one
    8d113ae57534 io_uring: async workers should inherit the user creds
    4079323e2113 net/ibmvnic: unlock rtnl_lock in reset so linkwatch_event can run
    013e927d5204 arm64: errata: Update stale comment
    2c8f51168b64 netfilter: ipset: Copy the right MAC address in hash:ip,mac IPv6 sets
    911f63fa6335 bonding: fix using uninitialized mode_lock
    ab3e4e6f92d4 usbip: Fix free of unallocated memory in vhci tx
    516423c1395e cgroup,writeback: don't switch wbs immediately on dead wbs if the memcg is dead
    2c17159569ee mm/filemap.c: don't initiate writeback if mapping has no dirty pages
    a53a54cbee03 ocfs2: protect extent tree in ocfs2_prepare_inode_for_write()
    96e3c3553d84 e1000: fix memory leaks
    ef2c5f55f92e igb: Fix constant media auto sense switching when no cable is connected
    5853c1ae13c9 net: ethernet: arc: add the missed clk_disable_unprepare
    330a0ce1737a NFSv4: Don't allow a cached open with a revoked delegation
    ecb481d00e39 arm64: apply ARM64_ERRATUM_843419 workaround for Brahma-B53 core
    c3cc8b365b07 arm64: Brahma-B53 is SSB and spectre v2 safe
    87251ea1e89b arm64: apply ARM64_ERRATUM_845719 workaround for Brahma-B53 core
    36c2624f9432 usb: dwc3: gadget: fix race when disabling ep with cancelled xfers
    93268e187878 arm64: cpufeature: Enable Qualcomm Falkor errata 1009 for Kryo
    1498bf362a53 x86, efi: Never relocate kernel below lowest acceptable address
    3cfc26fc6f99 efi: libstub/arm: Account for firmware reserved memory at the base of RAM
    fc5ffc1e3fdd hv_netvsc: Fix error handling in netvsc_attach()
    92b10afd667e SUNRPC: The RDMA back channel mustn't disappear while requests are outstanding
    086a81dbfba3 SUNRPC: The TCP back channel mustn't disappear while requests are outstanding
    ffdad349b545 drm/amd/display: Passive DP->HDMI dongle detection fix
    35be94b64940 drm/amd/display: do not synchronize "drr" displays
    7c39460cb5ac drm/amdgpu: If amdgpu_ib_schedule fails return back the error.
    78d726f10338 drm/sched: Set error to s_fence if HW job submission failed.
    9830f79967bf mt76: dma: fix buffer unmap with non-linear skbs
    720d823bdb4b iommu/amd: Apply the same IVRS IOAPIC workaround to Acer Aspire A315-41
    63fd1ae15909 net: mscc: ocelot: refuse to overwrite the port's native vlan
    9016218584da net: mscc: ocelot: fix vlan_filtering when enslaving to bridge before link is up
    28c0b80eaf33 net: hisilicon: Fix "Trying to free already-free IRQ"
    1ecc30627dde fjes: Handle workqueue allocation failure
    e87e60d8b437 nvme-multipath: fix possible io hang after ctrl reconnect
    4872894ab801 sched/topology: Allow sched_asym_cpucapacity to be disabled
    1da63fea0a7b sched/topology: Don't try to build empty sched domains
    70e90b283406 scsi: qla2xxx: stop timer in shutdown path
    1cc270775485 hwmon: (ina3221) Fix read timeout issue
    45239aea409d RDMA/hns: Prevent memory leaks of eq->buf_list
    53fa37993b30 RDMA/iw_cxgb4: Avoid freeing skb twice in arp failure case
    7ff5b79bbbeb usbip: tools: Fix read_usb_vudc_device() error path handling
    a2938e175103 USB: ldusb: use unsigned size format specifiers
    680a523e29ac USB: Skip endpoints with 0 maxpacket length
    e0d7df991267 perf/x86/uncore: Fix event group support
    89cc224ca642 perf/x86/amd/ibs: Handle erratum #420 only on the affected CPU family (10h)
    3cef7fe493bc perf/x86/amd/ibs: Fix reading of the IBS OpData register and thus precise RIP validity
    b2dce44309c3 usb: dwc3: remove the call trace of USBx_GFLADJ
    2a3754959b17 usb: gadget: configfs: fix concurrent issue between composite APIs
    b97e16bf764c usb: gadget: composite: Fix possible double free memory bug
    f28bdd84158d usb: gadget: udc: atmel: Fix interrupt storm in FIFO mode.
    5853c961dc7f usb: fsl: Check memory resource before releasing it
    95100a241e6d usb: dwc3: select CONFIG_REGMAP_MMIO
    108ae240a478 scsi: sd: define variable dif as unsigned int instead of bool
    6525d5046fc8 virt_wifi: fix refcnt leak in module exit routine
    d7aaa2cc70d4 macsec: fix refcnt leak in module exit routine
    9ca46b3266cd bonding: use dynamic lockdep key instead of subclass
    09dd999301fe bonding: fix unexpected IFF_BONDING bit unset
    b3ba6e2b6620 ipvs: move old_secure_tcp into struct netns_ipvs
    d532f1fd8afb ipvs: don't ignore errors in case refcounting ip_vs module fails
    70cbcdb17ff0 net: phy: smsc: LAN8740: add PHY_RST_AFTER_CLK_EN flag
    0e4ba0c6840e xsk: Fix registration of Rx-only sockets
    ef1fdf7f97d0 netfilter: nf_flow_table: set timeout before insertion into hashes
    38521edda858 iwlwifi: pcie: 0x2720 is qu and 0x30DC is not
    8560aaae6c0e iwlwifi: pcie: fix all 9460 entries for qnj
    bd7630c67813 iwlwifi: pcie: fix PCI ID 0x2720 configs that should be soc
    dbd6c9966dd8 bpf: Fix use after free in bpf_get_prog_name
    86e351f38ec7 scsi: qla2xxx: Initialized mailbox to prevent driver load failure
    efb36f318994 scsi: lpfc: Honor module parameter lpfc_use_adisc
    9bff69da3b99 net: openvswitch: free vport unless register_netdevice() succeeds
    193fa1a4522a bpf: Fix use after free in subprog's jited symbol removal
    1ee4522aa93c RDMA/uverbs: Prevent potential underflow
    9c018cb9f15b scsi: ufs-bsg: Wake the device before sending raw upiu commands
    682f81e5304b scsi: qla2xxx: fixup incorrect usage of host_byte
    dca864479cde selftests/bpf: More compatible nc options in test_tc_edt
    7ad63e706f31 net/mlx5e: TX, Fix consumer index of error cqe dump
    b3c5d67904a8 net/mlx5e: Tx, Fix assumption of single WQEBB of NOP in cleanup flow
    de4ed191ea6a IB/core: Use rdma_read_gid_l2_fields to compare GID L2 fields
    b4912439edec RDMA/qedr: Fix reported firmware version
    8291185a312b iw_cxgb4: fix ECN check on the passive accept
    fc84b384eb40 RDMA/mlx5: Clear old rate limit when closing QP
    c76d7b0214ee powerpc/32s: fix allow/prevent_user_access() when crossing segment boundaries.
    13fecbf4a027 HID: intel-ish-hid: fix wrong error handling in ishtp_cl_alloc_tx_ring()
    e6d91869518a dmaengine: sprd: Fix the possible memory leak issue
    55d41c0f1470 dmaengine: xilinx_dma: Fix control reg update in vdma_channel_set_config
    cb7318f2b0e4 dmaengine: xilinx_dma: Fix 64-bit simple AXIDMA transfer
    03a1b968775d bpf: lwtunnel: Fix reroute supplying invalid dst
    4903f1d1bf8b dmaengine: sprd: Fix the link-list pointer register configuration issue
    556cf9124c0a HID: google: add magnemite/masterball USB ids
    09e8a1ec600e usbip: Implement SG support to vhci-hcd and stub driver
    065245f072da ALSA: usb-audio: Fix copy&paste error in the validator
    51db18fc1b06 ALSA: usb-audio: remove some dead code
    eeb8753a5329 ALSA: usb-audio: Fix possible NULL dereference at create_yamaha_midi_quirk()
    5159d8aab602 ALSA: usb-audio: Clean up check_input_term()
    594d9d1e5e17 ALSA: usb-audio: Remove superfluous bLength checks
    44db0074cd7c ALSA: usb-audio: Unify the release of usb_mixer_elem_info objects
    443cff51a6bb ALSA: usb-audio: Simplify parse_audio_unit()
    bcc4dd818640 ALSA: usb-audio: More validations of descriptor units
    af26301992ac configfs: fix a deadlock in configfs_symlink()
    58e23dc42be6 can: dev: add missing of_node_put() after calling of_get_child_by_name()
    b2b42b51675f can: rx-offload: can_rx_offload_queue_sorted(): fix error handling, avoid skb mem leak
    35b90e57a289 can: peak_usb: fix a potential out-of-sync while decoding packets
    6cc9a0bb94de can: c_can: c_can_poll(): only read status register after status IRQ
    78aa7546e343 can: flexcan: disable completely the ECC mechanism
    60eb5bed4403 can: usb_8dev: fix use-after-free on disconnect
    573872be4f06 SMB3: Fix persistent handles reconnect
    a422197a1eab x86/apic/32: Avoid bogus LDR warnings
    46279c9462f3 x86/dumpstack/64: Don't evaluate exception stacks before setup
    c6c6ac3c04b2 intel_th: pci: Add Jasper Lake PCH support
    911ece5b25e1 intel_th: pci: Add Comet Lake PCH support
    3f2a73ab3b0a intel_th: gth: Fix the window switching sequence
    ecb83032ecac netfilter: ipset: Fix an error code in ip_set_sockfn_get()
    343ebeaf5062 netfilter: nf_tables: Align nft_expr private data to 64-bit
    97d84484d0e6 cpufreq: intel_pstate: Fix invalid EPB setting
    7c985c014425 ARM: sunxi: Fix CPU powerdown on A83T
    43a2cca05874 iio: srf04: fix wrong limitation in distance measuring
    b870132ec166 iio: imu: inv_mpu6050: fix no data on MPU6050
    e48c1fca5974 iio: imu: adis16480: make sure provided frequency is positive
    9dca863d3b35 iio: adc: stm32-adc: fix stopping dma
    8fc1bf8f2be7 ceph: don't allow copy_file_range when stripe_count != 1
    8cfda9695cf9 ceph: don't try to handle hashed dentries in non-O_CREAT atomic_open
    4ad07fc427d4 ceph: add missing check in d_revalidate snapdir handling
    ef1848480086 ceph: fix RCU case handling in ceph_d_revalidate()
    d97f80fd208a ceph: fix use-after-free in __ceph_remove_cap()
    dfe4803a9068 ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif dma address
    5e23235c9524 arm64: Do not mask out PTE_RDONLY in pte_same()
    48c2025b2f09 blkcg: make blkcg_print_stat() print stats only for online blkgs
    034d5809a5f4 soundwire: bus: set initial value to port_status
    649b8fd670bc soundwire: depend on ACPI || OF
    94aa8ee28648 soundwire: depend on ACPI
    ee8af21351c4 mm/khugepaged: fix might_sleep() warn with CONFIG_HIGHPTE=y
    d66df2eb6b3a HID: wacom: generic: Treat serial number and related fields as unsigned
    e1ffbf4ecc06 drm/radeon: fix si_enable_smc_cac() failed issue
    69d06ef9e08d perf map: Use zalloc for map_groups
    782163d51e60 perf tools: Fix time sorting
    3067a7cc476a pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
    b69bf236dff2 tools: gpio: Use !building_out_of_srctree to determine srctree
    e231278b0d22 btrfs: save i_size to avoid double evaluation of i_size_read in compress_file_range
    5e162cf4feec btrfs: tree-checker: Fix wrong check on max devid
    3f2943947386 dump_stack: avoid the livelock of the dump_lock
    4355d417a94f mm, vmstat: hide /proc/pagetypeinfo from normal users
    953014f940f5 mm: thp: handle page cache THP correctly in PageTransCompoundMap
    61650775cd53 mm, meminit: recalculate pcpu batch and high limits after init completes
    2dcc41fdaf8a mm: memcontrol: fix network errors from failing __GFP_ATOMIC charges
    aa9bf5f11454 ALSA: hda/ca0132 - Fix possible workqueue stall
    3b82b35a59db ALSA: bebob: fix to detect configured source of sampling clock for Focusrite Saffire Pro i/o series
    e2ba23d39223 ALSA: timer: Fix incorrectly assigned timer instance
    0dc0b91d07e4 vsock/virtio: fix sock refcnt holding during the shutdown
    420c2d73c309 net/smc: fix ethernet interface refcounting
    d7b3e1639bd7 net: sched: prevent duplicate flower rules from tcf_proto destroy race
    343d798fc32d net: prevent load/store tearing on sk->sk_stamp
    7dae346fabf5 net: hns: Fix the stray netpoll locks causing deadlock in NAPI path
    d8dd70306467 ipv6: fixes rt6_probe() and fib6_nh->last_probe init
    28b0701981a4 selftests/tls: add test for concurrent recv and send
    e35586c32b38 net/tls: add a TX lock
    a440797c1de5 net/tls: don't pay attention to sk_write_pending when pushing partial records
    d606d0d99205 net: mscc: ocelot: fix NULL pointer on LAG slave removal
    0be7d0f645a9 net: mscc: ocelot: don't handle netdev events for other netdevs
    7c406bd7d55b qede: fix NULL pointer deref in __qede_remove()
    a09ec9b4cc7d NFC: st21nfca: fix double free
    0c0b3ac80ac8 nfc: netlink: fix double device reference drop
    90a397f2593f NFC: fdp: fix incorrect free object
    cfe446854a9c net: usb: qmi_wwan: add support for DW5821e with eSIM support
    8d510fd1378a net/tls: fix sk_msg trim on fallback to copy mode
    55a7a495b3fe net: qualcomm: rmnet: Fix potential UAF when unregistering
    756e7124cde2 net: fix data-race in neigh_event_send()
    212322510b49 net: ethernet: octeon_mgmt: Account for second possible VLAN header
    b0855a3ad221 ipv4: Fix table id reference in fib_sync_down_addr
    9dfa56e19c37 CDC-NCM: handle incomplete transfer of MTU
    86e7bde87d43 bonding: fix state transition issue in link monitoring

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 673208e4c3..5391e052c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b31e1489cfd0f383e662b5599beb83dfe24507bc"
-SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
+SRCREV_machine ?= "e2d396270864afd14f5882ce8921d8fb562f5665"
+SRCREV_meta ?= "dd6019025cbb701b9818102f267c26e87031a59b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.27"
+LINUX_VERSION ?= "5.2.28"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 8bee225287..986dd6e351 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.27"
+LINUX_VERSION ?= "5.2.28"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0196404da85d109064f138a4a712061bcb999bbc"
-SRCREV_machine ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
+SRCREV_machine_qemuarm ?= "d79fa780eef7c3b08fcff8a44070c211afa91214"
+SRCREV_machine ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_meta ?= "dd6019025cbb701b9818102f267c26e87031a59b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index bc859519cf..358c0ad80a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c0864234924e6b1fb2b5bcf817c88fab1c237d7b"
-SRCREV_machine_qemuarm64 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_machine_qemumips ?= "534d14808c2948d6e3464735f5dcc203cb4be7f7"
-SRCREV_machine_qemuppc ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_machine_qemuriscv64 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_machine_qemux86 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_machine_qemux86-64 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_machine_qemumips64 ?= "d052f8cffc2a4ce18def4d9ee66e3c2e4f822150"
-SRCREV_machine ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
-SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
+SRCREV_machine_qemuarm ?= "ed43b791f2cca6e87928fa47556e540333385187"
+SRCREV_machine_qemuarm64 ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_machine_qemumips ?= "5d47f37ab0b7bcd5c0aaf0ecbd6d00bb8a22ddf4"
+SRCREV_machine_qemuppc ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_machine_qemuriscv64 ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_machine_qemux86 ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_machine_qemux86-64 ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_machine_qemumips64 ?= "894ee953d9c4036003f41e0800315efe3bab8492"
+SRCREV_machine ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
+SRCREV_meta ?= "dd6019025cbb701b9818102f267c26e87031a59b"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.27"
+LINUX_VERSION ?= "5.2.28"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


