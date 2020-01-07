Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1C07C4DB
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q127so27764220pga.4
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O22UU277G8vR6tHlQMQ639+u34jTvyb9xs+cfmYs96k=;
	b=Bu1EbAyKzEySExdboc2VntSVPCEaRMIlyh5UGXt2pGEBLj0EzA7KIO+HhGq+ELJQk/
	HBYxMpfGaxm/+7lUb+ft6aao/MeiELARyb4lMBZdjY6EWAPWKEZ7ysAbXUl8+hF1PvSv
	UzipewpOv3XxYq+ZmFoblxWPbn9DYhxMD3vlt2vf1r9dc3WAIRVVvFDfe5kskyDZC/8i
	B7hk7/YhDOj+fUzkKYQ8bTFz2s6FbsQCs9HkZt3OW+uJFVa205wMcHHLqKGFCXmIxQiv
	LIODocIb0bjeJPPK+n/nAhmDaz2afF0X0rOioDaSQ3K52DCG4CWZewqaR6DgeaWnLGC2
	FjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O22UU277G8vR6tHlQMQ639+u34jTvyb9xs+cfmYs96k=;
	b=becv0xiuzwc4LouV2pc+/349w1FJlO8FIfpLAVoZ8H/SGDN1yiOhyOugiFHAgScZpL
	83dvT0rIGhYxlbcTxy29iyUYDoEUvYuNBO//FF/JnfNMbrp0qMB0xxgYZ+39zx7F9wG0
	HEpahLZLG037Pm3V0HP7VElRhwV5rBPR+rxuYxH3ROWI/lFereEzIuqVaFrg2S4L953v
	VWpDWcPb/vQ1whYPkgjD/LskTuRngCpbQ8mNCoz8IvZ18+k7tQ9LHmMee6qtGzcsfFUO
	7vHJ65Xl5LswlKjVHTblk+jnHIAaj13wjuUyl8q5pgFpI8E8lm/U/Amh/dE7ey3uqunN
	mgTQ==
X-Gm-Message-State: APjAAAWtHyh34hqP93hO9a7FFM8VkYrWLXTWTavvWS/GJKJbBP72fG6a
	MRAYDVvZ7EAcvLsHteZT/KDlD6GZ
X-Google-Smtp-Source: APXvYqzrpUwEM+KFg+t5SGZuLeCwNAk5vEMh2RaguG/VdnckK/TGbw0P56cQlCkHo88bKp+zSK4rMg==
X-Received: by 2002:a63:e14b:: with SMTP id
	h11mr110053567pgk.297.1578364489425; 
	Mon, 06 Jan 2020 18:34:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.48
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:16 -0800
Message-Id: <f093d1b41baed86c4a6f2c17c6e45ccece1ed52e.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 11/28] linux-yocto/5.2: update to v5.2.24
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:50 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    67c4ef96da8e Linux 5.2.24
    b65008090e4e blk-rq-qos: fix first node deletion of rq_qos_del()
    660039a1505a opp: of: drop incorrect lockdep_assert_held()
    915ff97f555d PCI: PM: Fix pci_power_up()
    160278e4d967 xen/netback: fix error path of xenvif_connect_data()
    cb67e6c61f1b ceph: just skip unrecognized info in ceph_reply_info_extra
    216d0d68a639 cpufreq: Avoid cpufreq_suspend() deadlock on system shutdown
    e1f8c7185612 memstick: jmb38x_ms: Fix an error handling path in 'jmb38x_ms_probe()'
    2a25e88d19a9 KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already in use
    83a4472477a0 btrfs: tracepoints: Fix bad entry members of qgroup events
    f861e5d90514 btrfs: tracepoints: Fix wrong parameter order for qgroup events
    e9ee3be6143d Btrfs: check for the full sync flag while holding the inode lock during fsync
    dea5fb68615d Btrfs: fix qgroup double free after failure to reserve metadata for delalloc
    e79a8938b3db btrfs: don't needlessly create extent-refs kernel thread
    ea54be3ae39e Btrfs: add missing extents release on file extent cluster relocation error
    350af44ebf89 btrfs: block-group: Fix a memory leak due to missing btrfs_put_block_group()
    2598b914d8e7 pinctrl: armada-37xx: swap polarity on LED group
    c2c5f397f100 pinctrl: armada-37xx: fix control of pins 32 and up
    e7592916ea17 pinctrl: cherryview: restore Strago DMI workaround for all versions
    d799e86fafb6 x86/hyperv: Make vapic support x2apic mode
    a1b5e414e2f0 x86/apic/x2apic: Fix a NULL pointer deref when handling a dying cpu
    753cf99522be x86/boot/64: Make level2_kernel_pgt pages invalid outside kernel area
    6112a6de4c94 irqchip/sifive-plic: Switch to fasteoi flow
    e0b798bf1f89 dm cache: fix bugs when a GFP_NOWAIT allocation fails
    01201d4129db fs/dax: Fix pmd vs pte conflict detection
    26b699f52cdd tracing: Fix race in perf_trace_buf initialization
    20c15650fac8 perf/aux: Fix AUX output stopping
    a4c470b4ce43 cifs: Fix missed free operations
    ef349a5dbe21 CIFS: avoid using MID 0xFFFF
    9153eea1aef9 EDAC/ghes: Fix Use after free in ghes_edac remove path
    2c05afe496d9 parisc: Fix vmap memory leak in ioremap()/iounmap()
    c422c3941ebd s390/kaslr: add support for R_390_GLOB_DAT relocation type
    4d81f7b538a9 s390/zcrypt: fix memleak at release
    b641f048fd85 xtensa: fix change_bit in exclusive access option
    63ef015fd0d6 xtensa: drop EXPORT_SYMBOL for outs*/ins*
    607aad67d79e zram: fix race between backing_dev_show and backing_dev_store
    fa13957c99d1 mm/memory-failure: poison read receives SIGKILL instead of SIGBUS if mmaped more than once
    ef506f2a8158 hugetlbfs: don't access uninitialized memmaps in pfn_range_valid_gigantic()
    9585141a3645 mm: memblock: do not enforce current limit for memblock_phys* family
    2da60e78efbf mm: memcg: get number of pages on the LRU list in memcgroup base on lru_zone_size
    1c72ac7b41e4 mm, compaction: fix wrong pfn handling in __reset_isolation_pfn()
    714213ef3a7a mm/page_owner: don't access uninitialized memmaps when reading /proc/pagetypeinfo
    5180116dff45 mm/slub: fix a deadlock in show_slab_objects()
    224b4490619c mm/memory-failure.c: don't access uninitialized memmaps in memory_failure()
    94d4f140cfb9 mmc: sdhci-omap: Fix Tuning procedure for temperatures < -20C
    a76022591624 mmc: cqhci: Commit descriptors before setting the doorbell
    ca380ac56424 mmc: mxs: fix flags passed to dmaengine_prep_slave_sg
    6bc5498c702e fs/proc/page.c: don't access uninitialized memmaps in fs/proc/page.c
    ff7e418c7e8e drivers/base/memory.c: don't access uninitialized memmaps in soft_offline_page_store()
    f364590d8ab4 drm/amdgpu/uvd7: fix allocation size in enc ring test (v2)
    363471d25d92 drm/amdgpu/uvd6: fix allocation size in enc ring test (v2)
    78bc8daa826d drm/amdgpu/vcn: fix allocation size in enc ring test
    edd872deff06 drm/amdgpu/vce: fix allocation size in enc ring test
    d1f35310fac2 drm/amdgpu: Bail earlier when amdgpu.cik_/si_support is not set to 1
    1f2551687ba9 drm/panfrost: Handle resetting on timeout better
    5c2e8711136e drm/ttm: Restore ttm prefaulting
    59a21feaf42c drm/edid: Add 6 bpc quirk for SDC panel in Lenovo G50
    180a1b6fef83 mac80211: Reject malformed SSID elements
    930b9ba2a46d iwlwifi: pcie: change qu with jf devices to use qu configuration
    de326ae7e864 ACPI: CPPC: Set pcc_data[pcc_ss_id] to NULL in acpi_cppc_processor_exit()
    136bd113a26a ASoC: rsnd: Reinitialize bit clock inversion flag for every format setting
    11861621576c Input: st1232 - fix reporting multitouch coordinates
    1ac8d0c02e34 Input: synaptics-rmi4 - avoid processing unknown IRQs
    0337cdfd1172 Input: da9063 - fix capability and drop KEY_SLEEP
    38d23aa7eaeb scsi: ch: Make it possible to open a ch device multiple times again
    ea6645c4fb39 scsi: core: try to get module before removing device
    77957d171255 scsi: core: save/restore command resid for error handling
    1feb8a7203f8 scsi: sd: Ignore a failure to sync cache due to lack of authorization
    9f1c82f12b62 scsi: zfcp: fix reaction on bit error threshold notification
    e8c96fb7e7f3 staging: kpc2000: fix integer overflow with left shifts
    529ca74d5730 staging: wlan-ng: fix exit return when sme->key_idx >= NUM_WEPKEYS
    5f65debeb6f6 MIPS: tlbex: Fix build_restore_pagemask KScratch restore
    0a496dac91ac binder: Don't modify VMA bounds in ->mmap handler
    b7a359f53d87 USB: ldusb: fix read info leaks
    72665117bd21 USB: ldusb: fix memleak on disconnect
    a93c0f8a448e USB: serial: ti_usb_3410_5052: fix port-close races
    e6c0a2973542 usb: udc: lpc32xx: fix bad bit shift operation
    609978137cc2 ALSA: usb-audio: Disable quirks for BOSS Katana amplifiers
    7ebfbd60d38b ALSA: hda/realtek - Enable headset mic on Asus MJ401TA
    33bac14d01de ALSA: hda/realtek - Add support for ALC711
    d46df68073e6 USB: legousbtower: fix memleak on disconnect
    7585815e0141 io_uring: fix bad inflight accounting for SETUP_IOPOLL|SETUP_SQTHREAD
    b0c129ccba46 rxrpc: use rcu protection while reading sk->sk_user_data
    5cfde84829d4 netdevsim: Fix error handling in nsim_fib_init and nsim_fib_exit
    b8ce2c4f92e3 net: phy: micrel: Update KSZ87xx PHY name
    61ece488ec6a net: phy: micrel: Discern KSZ8051 and KSZ8795 PHYs
    2e2eadc05885 net: aquantia: correctly handle macvlan and multicast coexistence
    10ebf6d7c7ab net: aquantia: do not pass lro session with invalid tcp checksum
    b48166bebe46 net: aquantia: when cleaning hw cache it should be toggled
    1d3a96408673 net: aquantia: temperature retrieval fix
    ef857690724a sctp: change sctp_prot .no_autobind with true
    8748438651fe sched: etf: Fix ordering of packets with same txtime
    502ead97c900 rxrpc: Fix possible NULL pointer access in ICMP handling
    0f0957b39c65 net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow
    c96d1c298473 net: ipv6: fix listify ip6_rcv_finish in case of forwarding
    792dffb6c25f net/ibmvnic: Fix EOI when running in XIVE mode.
    1eff1ddb41d1 net: i82596: fix dma_alloc_attr for sni_82596
    789b5b2296d0 net: bcmgenet: Set phydev->dev_flags only for internal PHYs
    26b5aad017f8 net: bcmgenet: Fix RGMII_MODE_EN value for GENET v1/2/3
    39b4db2c205f net: avoid potential infinite loop in tc_ctl_action()
    f6e58b1a1237 ipv4: Return -ENETUNREACH if we can't create route but saddr is valid
    15136dd27a2a ipv4: fix race condition between route lookup and invalidation
    04a68067f471 nvme: change nvme_passthru_cmd64 to explicitly mark rsvd
    7e42a8fc20bc nvme-pci: Set the prp2 correctly when using more than 4k page
    f6a8d244495e ocfs2: fix panic due to ocfs2_wq is null
    dd9fa2a089de Revert "drm/radeon: Fix EEH during kexec"
    8129be7b7cf1 md/raid0: fix warning message for parameter default_layout
    8cf008b91833 libata/ahci: Fix PCS quirk application
    22d516a43782 net_sched: fix backward compatibility for TCA_ACT_KIND
    ba69d901e036 net_sched: fix backward compatibility for TCA_KIND
    b826ad4c7669 filldir[64]: remove WARN_ON_ONCE() for bad directory entries
    9df0c66d5143 uaccess: implement a proper unsafe_copy_to_user() and switch filldir over to it
    30043672b8e6 Make filldir[64]() verify the directory entry filename is valid
    2fcaa9a2e8c9 elf: don't use MAP_FIXED_NOREPLACE for elf executable mappings
    a9397425edf9 Convert filldir[64]() from __put_user() to unsafe_put_user()
    0c03d3d9a998 namespace: fix namespace.pl script to support relative paths
    e5df7c23ef1c net: phy: fix write to mii-ctrl1000 register
    e6378e134543 net: phy: allow for reset line to be tied to a sleepy GPIO controller
    3951482af0d5 r8152: Set macpassthru in reset_resume callback
    85e2c81d8964 s390/mm: fix -Wunused-but-set-variable warnings
    fbd0915567ea lib: textsearch: fix escapes in example code
    2cf2b8c86277 selftests: kvm: Fix libkvm build error
    54cccd9f3fd0 net: hisilicon: Fix usage of uninitialized variable in function mdio_sc_cfg_reg_write()
    8f634c4755d6 mips: Loongson: Fix the link time qualifier of 'serial_exit()'
    009d3d7135af drm/amd/display: memory leak
    d0d9f70beb32 drm/amdgpu: fix multiple memory leaks in acp_hw_init
    9cac23841d31 RISC-V: Clear load reservations while restoring hart contexts
    a1fffbb6cfd8 net: stmmac: Correctly take timestamp for PTPv2
    b115b9832dc2 net: dsa: rtl8366rb: add missing of_node_put after calling of_get_child_by_name
    45f3a8886a6a netfilter: nft_connlimit: disable bh on garbage collection
    420a015ed643 mac80211: fix txq null pointer dereference
    51340f3579a0 nl80211: fix null pointer dereference
    0e53662be2aa loop: change queue block size to match when using DIO
    0ce37f356397 xen/efi: Set nonblocking callbacks
    fe4b184d832e MIPS: dts: ar9331: fix interrupt-controller size
    fa7e74d07aaa net: dsa: qca8k: Use up to 7 ports for all operations
    12afa6d96de4 ARM: dts: am4372: Set memory bandwidth limit for DISPC
    c41a0bf4ba4d ieee802154: ca8210: prevent memory leak
    4cbc0b08406d nvme-rdma: fix possible use-after-free in connect timeout
    61c456e74461 nvme: allow 64-bit results in passthru commands
    e3e3c343b869 Added QUIRKs for ADATA XPG SX8200 Pro 512GB
    e3f58f778cee nvme: fix an error code in nvme_init_subsystem()
    902c726061a9 nvme-tcp: fix wrong stop condition in io_work
    9f1ce805b4fc ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
    64719bd78a0b ARM: OMAP2+: Add missing LCDC midlemode for am335x
    4b6e2a327e7c ARM: OMAP2+: Fix missing reset done flag for am3 and am43
    db825fd99455 ARM: dts: Fix gpio0 flags for am335x-icev2
    0e65dece86ca scsi: qla2xxx: Fix unbound sleep in fcport delete path.
    950b905e2cbe scsi: qla2xxx: Silence fwdump template message
    276ae12e3b8d scsi: megaraid: disable device when probe failed after enabled device
    e8d688a3f957 scsi: ufs: skip shutdown if hba is not powered
    a1318847f2d5 nvme-pci: Fix a race in controller removal
    f1f8bc4e1d87 ARM: dts: Fix wrong clocks for dra7 mcasp
    d1a356d53545 clk: ti: dra7: Fix mcasp8 clock bits
    6e16a5de5c09 drm: Clear the fence pointer when writeback job signaled
    5cc2a052ef35 RDMA/cxgb4: Do not dma memory off of the stack
    60f32e5e3ae6 usb: dwc3: pci: prevent memory leak in dwc3_pci_probe
    7a745fd3fdc5 ASoC: SOF: ipc: Fix memory leak in sof_set_get_large_ctrl_data
    240452393720 net: dsa: sja1105: Prevent leaking memory
    c9ed1ddd76de iwlwifi: pcie: fix memory leaks in iwl_pcie_ctxt_info_gen3_init

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit c54b02ab238fe7682a0beac2f2afeb418406dd48)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 60a98c518f..61eb8d6b67 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b26332b386cedfa5084fb373f78fb129523288fa"
-SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
+SRCREV_machine ?= "2761299685e59f4838784b9764f22f31c0ba78cc"
+SRCREV_meta ?= "5c56ad2c2261408c85713ed338d0449646d48e58"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.23"
+LINUX_VERSION ?= "5.2.24"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 24d08860dd..61ec18eec1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.23"
+LINUX_VERSION ?= "5.2.24"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d919a90f1f3a8234d8eb60b0a03b07a90d7d3234"
-SRCREV_machine ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
+SRCREV_machine_qemuarm ?= "fdfb41a859911607f9be6719615365e222c41c5c"
+SRCREV_machine ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_meta ?= "5c56ad2c2261408c85713ed338d0449646d48e58"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index b7146fa23d..28d89ff94f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c823471bf471b472ff36b3c2ca1fed70ca972eda"
-SRCREV_machine_qemuarm64 ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_machine_qemumips ?= "e3f9bf8ec923e973dc2c49512cbaf45f8f88e8b5"
-SRCREV_machine_qemuppc ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_machine_qemuriscv64 ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_machine_qemux86 ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_machine_qemux86-64 ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_machine_qemumips64 ?= "6b57735a83936356279cf553329e72688b4f17f9"
-SRCREV_machine ?= "4642ca5f2e968a24227eec72c363117397358c28"
-SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
+SRCREV_machine_qemuarm ?= "eae79a47742a27b57895dfc31033940078a58591"
+SRCREV_machine_qemuarm64 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_machine_qemumips ?= "f5039ff845ae347063e6880d89d2e60f879ff856"
+SRCREV_machine_qemuppc ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_machine_qemuriscv64 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_machine_qemux86 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_machine_qemux86-64 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_machine_qemumips64 ?= "1c863c05958faf522455713270317a4647e27578"
+SRCREV_machine ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
+SRCREV_meta ?= "5c56ad2c2261408c85713ed338d0449646d48e58"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.23"
+LINUX_VERSION ?= "5.2.24"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


