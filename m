Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC99BC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915837"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915837"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956823"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/26] linux-yocto/5.14: update to v5.14.15
Date: Tue,  9 Nov 2021 22:37:41 +0800
Message-Id: 
 <e745b0d7c2354405946ab669281224747d255a6c.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158027

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    b46092c7497e Linux 5.14.15
    96e4ea34f6d7 pinctrl: stm32: use valid pin identifier in stm32_pinctrl_resume()
    4850e9e3c6a3 ARM: 9122/1: select HAVE_FUTEX_CMPXCHG
    80344938e468 e1000e: Separate TGP board type from SPT
    0c4e87ba11eb net: mdiobus: Fix memory leak in __mdiobus_register
    2f4356963624 bpf, test, cgroup: Use sk_{alloc,free} for test cases
    4e5d794a2743 s390/pci: fix zpci_zdev_put() on reserve
    e27170d5f2fc s390/pci: cleanup resources only if necessary
    2be38f02ec89 scsi: core: Fix shost->cmd_per_lun calculation in scsi_add_host_with_dma()
    ff261f9aa654 autofs: fix wait name hash calculation in autofs_wait()
    1009f098dfbe drm/kmb: Limit supported mode to 1080p
    217d42e8b835 drm/kmb: Enable alpha blended second plane
    c1ad040dbea8 net/mlx5: Lag, change multipath and bonding to be mutually exclusive
    d2ec7d208d8e net/mlx5: Lag, move lag destruction to a workqueue
    42b6431f1c17 net: hns3: fix for miscalculation of rx unused desc
    f1972f14f16e sched/scs: Reset the shadow stack when idle_task_exit
    c4813d308517 mm/thp: decrease nr_thps in file's mapping on THP split
    a7fbb56e6c94 scsi: qla2xxx: Fix a memory leak in an error path of qla2x00_process_els()
    c8c1b2183fb8 scsi: mpi3mr: Fix duplicate device entries when scanning through sysfs
    ce527668277c scsi: storvsc: Fix validation for unsolicited incoming packets
    08d82a9b65e7 scsi: iscsi: Fix set_param() handling
    6408a4c8da2f ASoC: codec: wcd938x: Add irq config support
    9eb2aaede632 Input: snvs_pwrkey - add clk handling
    9dd0389d77b9 perf/x86/msr: Add Sapphire Rapids CPU support
    11d6811cbde0 libperf tests: Fix test_stat_cpu
    65eec1fb58c1 libperf test evsel: Fix build error on !x86 architectures
    b6062308c510 spi-mux: Fix false-positive lockdep splats
    722ef19a161c spi: Fix deadlock when adding SPI controllers on SPI buses
    785d69099ef4 ALSA: hda: avoid write to STATESTS if controller is in reset
    3972b03ed085 platform/x86: intel_scu_ipc: Update timeout value in comment
    6659008140b4 platform/x86: intel_scu_ipc: Increase virtual timeout to 10s
    f5966ba53013 isdn: mISDN: Fix sleeping function called from invalid context
    ef24577a52ba ARM: dts: spear3xx: Fix gmac node
    834cc3fc2b99 net: stmmac: add support for dwmac 3.40a
    0c878175dd2f btrfs: deal with errors when checking if a dir entry exists during log replay
    051995bd0f42 ALSA: hda: intel: Allow repeatedly probing on codec configuration errors
    9906da162dc8 objtool: Update section header before relocations
    e73e72be194e objtool: Check for gelf_update_rel[a] failures
    515e03331255 bitfield: build kunit tests without structleak plugin
    3f66b6e01c82 thunderbolt: build kunit tests without structleak plugin
    d9f94a8ec35a device property: build kunit tests without structleak plugin
    2c793a67d71b iio/test-format: build kunit tests without structleak plugin
    930f561aae28 gcc-plugins/structleak: add makefile var for disabling structleak
    1d1af4da1c44 drm/msm/a6xx: Serialize GMU communication
    bbdd158b40b6 kunit: fix reference count leak in kfree_at_end
    dfcc47a1fe36 KVM: MMU: Reset mmu->pkru_mask to avoid stale data
    e647d75565ab net: hns3: fix the max tx size according to user manual
    b0e6db0656dd drm: mxsfb: Fix NULL pointer dereference crash on unload
    56a3d9637b77 KVM: SEV-ES: Set guest_state_protected after VMSA update
    d469678d6b50 net: bridge: mcast: use multicast_membership_interval for IGMPv3
    8f20259f186e selftests: netfilter: remove stray bash debug line
    057aef8df940 netfilter: Kconfig: use 'default y' instead of 'm' for bool config option
    cc20226e218a isdn: cpai: check ctr->cnr to avoid array index out of bound
    6197eb050cfa nfc: nci: fix the UAF of rf_conn_info object
    fb82d4dbee95 KVM: x86: remove unnecessary arguments from complete_emulator_pio_in
    66e46fe3f276 KVM: x86: split the two parts of emulator_pio_in
    9887c1668ada KVM: x86: check for interrupts before deciding whether to exit the fast path
    169577c8840e KVM: x86: leave vcpu->arch.pio.count alone in emulator_pio_in_out
    62a1a254ed83 KVM: SEV-ES: reduce ghcb_sa_len to 32 bits
    3f54362dc7d7 KVM: SEV-ES: go over the sev_pio_data buffer in multiple passes if needed
    4988e000b3a8 KVM: SEV-ES: fix length of string I/O
    727286b23f93 KVM: SEV-ES: keep INS functions together
    98c55c508df0 KVM: SEV-ES: clean up kvm_sev_es_ins/outs
    abcae3cd6272 KVM: SEV-ES: rename guest_ins_data to sev_pio_data
    6697ceb9f6cd KVM: SEV: Flush cache on non-coherent systems before RECEIVE_UPDATE_DATA
    495bd03b6ba5 KVM: nVMX: promptly process interrupts delivered while in guest mode
    dc94b8b3f28a mm, slub: fix incorrect memcg slab count for bulk free
    159d8cfbd042 mm, slub: fix potential use-after-free in slab_debugfs_fops
    42b81946e3ac mm, slub: fix potential memoryleak in kmem_cache_open()
    ec93d4a439c3 mm, slub: fix mismatch between reconstructed freelist depth and cnt
    65ede7bd9713 powerpc/idle: Don't corrupt back chain when going idle
    5a8c22e7fb66 KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest
    6d077c37c464 KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()
    e8735e2e306f ucounts: Fix signal ucount refcounting
    1eb825343d63 ucounts: Proper error handling in set_cred_ucounts
    f7f7e4dbc41c ucounts: Pair inc_rlimit_ucounts with dec_rlimit_ucoutns in commit_creds
    32880dcecb51 ucounts: Move get_ucounts from cred_alloc_blank to key_change_session_keyring
    04b938ff2d2c net: dsa: mt7530: correct ds->num_ports
    4e9e46a70020 audit: fix possible null-pointer dereference in audit_filter_rules
    b1a34f86b41f blk-cgroup: blk_cgroup_bio_start() should use irq-safe operations on blkg->iostat_cpu
    152f35191d12 ASoC: nau8824: Fix headphone vs headset, button-press detection no longer working
    a60ce083dcbf ASoC: DAPM: Fix missing kctl change notifications
    9da68a107d07 ALSA: hda/realtek: Add quirk for Clevo PC50HS
    896fc3ab9fc1 ALSA: usb-audio: Provide quirk for Sennheiser GSP670 Headset
    b77ba1e02345 mm/secretmem: fix NULL page->mapping dereference in page_is_secretmem()
    abe046ddf311 vfs: check fd has read access in kernel_read_file_from_fd()
    3681e4772c78 elfcore: correct reference to CONFIG_UML
    9ee4e9ae98f1 mm/mempolicy: do not allow illegal MPOL_F_NUMA_BALANCING | MPOL_LOCAL in mbind()
    149958ecd062 userfaultfd: fix a race between writeprotect and exit_mmap()
    6de91691768c mm/userfaultfd: selftests: fix memory corruption with thp enabled
    0e677ea5b739 ocfs2: mount fails with buffer overflow in strlen
    fa9b6b6c953e ocfs2: fix data corruption after conversion from inline format
    909c8482d8ac tracing: Have all levels of checks prevent recursion
    54dc25f4e31e ceph: fix handling of "meta" errors
    0ff7b35631ac ceph: skip existing superblocks that are blocklisted or shut down when mounting
    d832133cf228 can: j1939: j1939_xtp_rx_rts_session_new(): abort TP less than 9 bytes
    03ec23e55e3e can: j1939: j1939_xtp_rx_dat_one(): cancel session if receive TP.DT with error length
    6e8811707e2d can: j1939: j1939_netdev_start(): fix UAF for rx_kref of j1939_priv
    fb545be86c53 can: j1939: j1939_tp_rxtimer(): fix errant alert in j1939_tp_rxtimer
    013e7890663d can: isotp: isotp_sendmsg(): fix TX buffer concurrent access in isotp_sendmsg()
    a76abedd2be3 can: isotp: isotp_sendmsg(): add result check for wait_event_interruptible()
    1d12d110a820 can: isotp: isotp_sendmsg(): fix return error on FC timeout on TX path
    0e5afdc2315b can: peak_pci: peak_pci_remove(): fix UAF
    44c353a14375 can: peak_usb: pcan_usb_fd_decode_status(): fix back to ERROR_ACTIVE state notification
    e18b9f4d62c1 can: rcar_can: fix suspend/resume
    113f7a1f3421 net: enetc: make sure all traffic classes can send large frames
    284c68cae7e0 net: enetc: fix ethtool counter name for PM0_TERR
    eff55ddd240f drm/kmb: Enable ADV bridge after modeset
    c0179dbae96d drm/kmb: Corrected typo in handle_lcd_irq
    566ec004ed8b drm/kmb: Disable change of plane parameters
    2317b45fb3d2 drm/kmb: Remove clearing DPHY regs
    97cfc4b28c4d drm/kmb: Work around for higher system clock
    4dbf3d658540 drm/panel: ilitek-ili9881c: Fix sync for Feixin K101-IM2BYL02 panel
    3b194affe445 net/mlx5e: IPsec: Fix work queue entry ethernet segment checksum flags
    ea7a4d6132ce net/mlx5e: IPsec: Fix a misuse of the software parser's fields
    e867502bc4f6 ice: Add missing E810 device ids
    9b76c3fedb24 igc: Update I226_K device ID
    3300633367b6 e1000e: Fix packet loss on Tiger Lake and later
    95c0a0c5ec88 ptp: Fix possible memory leak in ptp_clock_register()
    d487413c020f net: stmmac: Fix E2E delay mechanism
    9b5a29f0acef net: hns3: disable sriov before unload hclge layer
    82a136c15a77 net: hns3: fix vf reset workqueue cannot exit
    9ee9191d3384 net: hns3: schedule the polling again when allocation fails
    6446be7c9090 net: hns3: add limit ets dwrr bandwidth cannot be 0
    dddafeda454a net: hns3: reset DWRR of unused tc to zero
    93fa0277ea4e net: hns3: Add configuration of TM QCN error event
    3ea0b497a7a2 powerpc/smp: do not decrement idle task preempt count in CPU offline
    0666c4cd67b1 net: dsa: Fix an error handling path in 'dsa_switch_parse_ports_of()'
    9ef9a287aab5 NIOS2: irqflags: rename a redefined register name
    8b523da74a22 net/sched: act_ct: Fix byte count on fragmented packets
    872b836a183d net: dsa: lantiq_gswip: fix register definition
    57deb5ffd8f6 hamradio: baycom_epp: fix build for UML
    c74f3c127e6c ipv6: When forwarding count rx stats on the orig netdev
    1dda424ef5c4 tcp: md5: Fix overlap between vrf and non-vrf keys
    9c281a1006f4 lan78xx: select CRC32
    5220cad0e69e sctp: fix transport encap_port update in sctp_vtag_verify
    ddffcd23d325 netfilter: ipvs: make global sysctl readonly in non-init netns
    cd3d0282dd3d netfilter: ip6t_rt: fix rt0_hdr parsing in rt_mt6
    aabf95dddb45 ice: Print the api_patch as part of the fw.mgmt.api
    75ebc3b08bbd ice: fix getting UDP tunnel entry
    777682e59840 ice: Avoid crash from unnecessary IDA free
    31b4517293bf ice: Fix failure to re-add LAN/RDMA Tx queues
    18b4fcfeab6d ASoC: wm8960: Fix clock configuration on slave mode
    2b7d598b9651 dma-debug: fix sg checks in debug_dma_map_sg()
    90c7c58aa2bd netfilter: nf_tables: skip netdev events generated on netns removal
    cae7cab804c9 netfilter: xt_IDLETIMER: fix panic that occurs when timer_type has garbage value
    78325fcb17f3 KVM: arm64: Release mmap_lock when using VM_SHARED with MTE
    b372264c66ef KVM: arm64: Fix host stage-2 PGD refcount
    649c2e76632d ASoC: cs4341: Add SPI device ID table
    efdcc26785de ASoC: pcm179x: Add missing entries SPI to device ID table
    242ce1c51b69 ASoC: fsl_xcvr: Fix channel swap issue with ARC
    41551810285e ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2 registers
    c8ecd221db9a powerpc/bpf: Emit stf barrier instruction sequences for BPF_NOSPEC
    663e89b7f4cc powerpc/security: Add a helper to query stf_barrier type
    23d127cf5e66 powerpc/bpf: Validate branch ranges
    e680ab91a034 powerpc/lib: Add helper to check if offset is within conditional branch range
    6fe5d304ca49 NFSD: Keep existing listeners on portlist error
    9ad89fcde18c xtensa: xtfpga: Try software restart before simulating CPU reset
    8287678c20b2 xtensa: xtfpga: use CONFIG_USE_OF instead of CONFIG_OF
    2602e9cc283a drm/amdgpu: init iommu after amdkfd device init
    68771262aab3 drm/amdgpu/display: fix dependencies for DRM_AMD_DC_SI
    537a7189df57 r8152: avoid to resubmit rx immediately
    7d8cdaffc518 xen/x86: prevent PVH type from getting clobbered
    28d084adc22d block: decode QUEUE_FLAG_HCTX_ACTIVE in debugfs output
    96a37f6acb6a ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default
    470585caf603 arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
    79e3dc32f14f sh: pgtable-3level: fix cast to pointer from integer of different size
    d3f4c51c2a7f parisc: math-emu: Fix fall-through warnings
    4248f37f6cfc block/mq-deadline: Move dd_queued() to fix defined but not used warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c2c7e54bf17d28fe8b918ee8f053748b2b13e01)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index e5dc3c30c4..05f5df71b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "725e45fd0b3b344905a44398b1d7ba64b76c6af2"
-SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
+SRCREV_machine ?= "dcf40cf2b562e9b6ec814a9ca1912aab881de0e0"
+SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.14"
+LINUX_VERSION ?= "5.14.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 0da8ae5e69..f752b61d2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.14"
+LINUX_VERSION ?= "5.14.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "bdbb56b345a04855091cbf667c70d761f417ddff"
-SRCREV_machine ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
+SRCREV_machine:qemuarm ?= "70f10165ff7c856cbf0512231ef9b6533efe1d1d"
+SRCREV_machine ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index ed20557183..f719966a7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3e04a89e8e89fe2f799cd201f6994ff515ca95c1"
-SRCREV_machine:qemuarm64 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_machine:qemumips ?= "566b7915f715e00e4ebb2a4121239de4cb1f33b5"
-SRCREV_machine:qemuppc ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_machine:qemuriscv64 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_machine:qemuriscv32 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_machine:qemux86 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_machine:qemux86-64 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_machine:qemumips64 ?= "13d9e1b6481efec1e72733134e83b981e0adf6bb"
-SRCREV_machine ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
-SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
+SRCREV_machine:qemuarm ?= "8b3f9104862f9486f4a6fb526e4d9cc9dc2217cb"
+SRCREV_machine:qemuarm64 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_machine:qemumips ?= "fab0cfca42f3509a5570b437f2a2df216927c055"
+SRCREV_machine:qemuppc ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_machine:qemuriscv64 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_machine:qemuriscv32 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_machine:qemux86 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_machine:qemux86-64 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_machine:qemumips64 ?= "baf66f78949c175483eea2a5d0e7221a997d8e44"
+SRCREV_machine ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
+SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "fe024e004fa31dc64d18440c006b02cd8d722a03"
+SRCREV_machine:class-devupstream ?= "b46092c7497e5aaede15b10f162e32d6473f1862"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.14"
+LINUX_VERSION ?= "5.14.15"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


