Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id AAB417FF44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:07:47 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z76so2000621qka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aJnh4F4/PLVKO4JAhhcPUTq8Kd7olHJOenRxPTQqwhM=;
	b=Z5ViCndiB9X3o9+/SKblWzasE/lq/KljGqszxebLLjbD5w2LQ63XtCYKAm/Kr17USz
	uvMor09aBAZzabwWd2gGFxp4r+k+kx5IpJeAm1EZo4uuRROiyegai5rn8kNiMHK4ntzz
	nwXwNYX8GnhEIN+iR3TZWJv8/4JDXXb72ufO/MJX7ve+jOvUYOMtBtMgluvVWHNChsVv
	ekOThB4z6vWemVIjZyFsyemYiuQR8blIeT/3lMMvY41HfT0Rd/OEy32LUS77OW8BWJfp
	GJfp5y6gAK2FsY8otzUenJsN+o+hS4S83uHfdgyVPIjEIvd0hosccBEx5KGWLXvFit9d
	YcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aJnh4F4/PLVKO4JAhhcPUTq8Kd7olHJOenRxPTQqwhM=;
	b=J9i6t9XHMtao4kNJKuzRg48zyUsxH4zEon/+qZIlkZs2Qi0PxddG3WBXMMyHwpxp0V
	bCQTgsBuSPB247OY3w3T9ucwSV/oQ/EwG/1YMwXDnNTwi3fqTzQm6Nylmmi4KYaf6Swj
	LKzsNkal6QR0DCyFEBgZW62oGT+qmVFQJgb6iYTIWNlUfyADUCaPhDBRuqWa97idTIgL
	0aHiCOdsQ2kDNd++0Z4r7HLufvTCw8sMd87pyc/Eo9KY58rGTIAzy6qNhAwicmaoVCZA
	tJqeKgM7SjGoUpjXw1rITojFHWLsz3osj5sZwu7tccR9DxCNkEWhe5DLHu9RrTpmIqoK
	KwLg==
X-Gm-Message-State: APjAAAUiip14VT0+vcGWNjh8GuonMMxV+fBVb2oYQ3dOsbyYIKx7Lj7K
	3MKMSaBeNps1Ll0KVrhU6eBxKOOUZenErg==
X-Google-Smtp-Source: APXvYqynVv0cYEgQymHDY6kZ8vq0NuBugzTIM55IuZJ8KFBEqJ5bT60RmVuLPdoumjEbngJ1IBFiTg==
X-Received: by 2002:a37:4dc4:: with SMTP id a187mr2716043qkb.436.1576678068486;
	Wed, 18 Dec 2019 06:07:48 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id k14sm668918qki.66.2019.12.18.06.07.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:07:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Dec 2019 09:07:34 -0500
Message-Id: <f705ad40d59b5e041c353f700d5f60dd92780958.1576677592.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1576677592.git.bruce.ashfield@gmail.com>
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/5.2: update to v5.2.26
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
X-List-Received-Date: Wed, 18 Dec 2019 14:07:47 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    d0be30663e55 Linux 5.2.26
    a5f01eb4ae19 can: mcba_usb: fix use-after-free on disconnect
    d440c83adfe2 x86/fpu: Don't cache access to fpu_fpregs_owner_ctx
    d0a6ac8ee861 can: peak_usb: fix slab info leak
    bbbf7603e285 Input: ff-memless - kill timer in destroy()
    91356b4afa6c media: rc: prevent memory leak in cx23888_ir_probe
    51637609104e Revert "ALSA: hda: Flush interrupts on disabling"
    9a4445b878a9 powerpc/powernv: Fix CPU idle to be called with IRQs disabled
    9193213c9e4e sched/fair: Fix -Wunused-but-set-variable warnings
    c43cfdeb169a ALSA: usb-audio: Add DSD support for Gustard U16/X26 USB Interface
    897a94da5ae1 ALSA: usb-audio: Update DSD support quirks for Oppo and Rotel
    7e58efc63bf7 ALSA: usb-audio: DSD auto-detection for Playback Designs
    210ea1053fbd sched/fair: Fix low cpu usage with high throttling by removing expiration of cpu-local slices
    55f7e1c999df iwlwifi: exclude GEO SAR support for 3168
    0d8c60339f82 net: sched: sch_sfb: don't call qdisc_put() while holding tree lock
    0adbd50f981b sch_netem: fix rcu splat in netem_enqueue()
    8efcc97c3e42 net: usb: sr9800: fix uninitialized local variable
    45e162b87d41 netfilter: conntrack: avoid possible false sharing
    3fe6d57d9149 bonding: fix potential NULL deref in bond_update_slave_arr
    a8b0fd3f931d NFC: pn533: fix use-after-free and memleaks
    7ad6fbf0576a rxrpc: Fix trace-after-put looking at the put peer record
    5e24e1198eea rxrpc: rxrpc_peer needs to hold a ref on the rxrpc_local record
    1a6bd945690b rxrpc: Fix call ref leak
    203ec8334e5b llc: fix sk_buff leak in llc_conn_service()
    c438c3900aba llc: fix sk_buff leak in llc_sap_state_process()
    c18d44740378 batman-adv: Avoid free/alloc race when handling OGM buffer
    58d94f9f31f2 NFS: Fix an RCU lock leak in nfs4_refresh_delegation_stateid()
    02da3016e993 drm/amdgpu/powerplay/vega10: allow undervolting in p7
    7722152c2d83 dmaengine: cppi41: Fix cppi41_dma_prep_slave_sg() when idle
    ee388389576c dmaengine: imx-sdma: fix size check for sdma script_number
    55c55744a28e dmaengine: tegra210-adma: fix transfer failure
    f9343260a427 dmaengine: qcom: bam_dma: Fix resource leak
    bd8f667e3a9c KVM: vmx, svm: always run with EFER.NXE=1 when shadow paging is active
    cdee2de27735 rtlwifi: rtl_pci: Fix problem of too small skb->len
    ab8c920166a5 virtio_ring: fix stalls for packed rings
    26579ee95eaa arm64: cpufeature: Enable Qualcomm Falkor/Kryo errata 1003
    54a879fbe1b3 arm64: Ensure VM_WRITE|VM_SHARED ptes are clean by default
    8efd0c50367a IB/hfi1: Avoid excessive retry for TID RDMA READ request
    335bff30e808 ARC: perf: Accommodate big-endian CPU
    ee5a9c33330f s390/idle: fix cpu idle time calculation
    60af342e8b0d s390/cmm: fix information leak in cmm_timeout_handler()
    c86c49b94246 s390/unwind: fix mixing regs and sp
    df9c6fcddce0 um-ubd: Entrust re-queue to the upper layers
    4a1a26a4bf91 HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()
    f6fa66f01aa8 HID: logitech-hidpp: rework device validation
    7fe194de644b HID: logitech-hidpp: split g920_get_config()
    2049b4bb9f81 HID: fix error message in hid_open_report()
    63e52b01254f HID: Fix assumption that devices have inputs
    a3a9f34b88cb HID: i2c-hid: add Trekstor Primebook C11B to descriptor override
    e90905647a5a scsi: target: cxgbit: Fix cxgbit_fw4_ack()
    ac372582cc42 scsi: qla2xxx: Fix partial flash write of MBI
    e57315b44301 USB: serial: whiteheat: fix line-speed endianness
    1f92660c8acf USB: serial: whiteheat: fix potential slab corruption
    00bd2baf8dc4 usb: xhci: fix __le32/__le64 accessors in debugfs code
    098f7b186cbb usb: xhci: fix Immediate Data Transfer endianness
    1b576e218d1e USB: ldusb: fix control-message timeout
    2b3c8a8ec1b4 USB: ldusb: fix ring-buffer locking
    6d678d6fa0d2 usb-storage: Revert commit 747668dbc061 ("usb-storage: Set virt_boundary_mask to avoid SG overflows")
    e32f12632c9f USB: gadget: Reject endpoints with 0 maxpacket value
    3390a1c10bc9 nl80211: fix validation of mesh path nexthop
    c890ae5aac42 UAS: Revert commit 3ae62a42090f ("UAS: fix alignment of scatter/gather segments")
    e382a68d7aed ALSA: hda/realtek - Add support for ALC623
    f7a4541160d1 ALSA: hda/realtek - Fix 2 front mics of codec 0x623
    1ef6d8090939 ALSA: timer: Fix mutex deadlock at releasing card
    0d261a4dc4d2 ALSA: bebob: Fix prototype of helper function to return negative value
    c217d9f666ec fuse: truncate pending writes on O_TRUNC
    7bb177bda49b fuse: flush dirty data/metadata before non-truncate setattr
    270aa285a332 ath6kl: fix a NULL-ptr-deref bug in ath6kl_usb_alloc_urb_from_pipe()
    0278c9083bcd thunderbolt: Use 32-bit writes when writing ring producer/consumer
    eb73fb79781c thunderbolt: Correct path indices for PCIe tunnel
    d87fc8124793 s390/pci: fix MSI message data
    913f0293d40e rtw88: Fix misuse of GENMASK macro
    f85ce6c2ac9f perf/aux: Fix tracking of auxiliary trace buffer allocation
    6bdd6dbc529f perf annotate: Fix multiple memory and file descriptor leaks
    5680844af670 tracing: Initialize iter->seq after zeroing in tracing_read_pipe()
    81fdb3a267a8 s390/uaccess: avoid (false positive) compiler warnings
    b6c9dce7fde4 NFSv4: Fix leak of clp->cl_acceptor string
    b1b57fae22d2 nbd: fix possible sysfs duplicate warning
    da80a689e9e5 MIPS: fw: sni: Fix out of bounds init of o32 stack
    3f5c4e2276b7 MIPS: include: Mark __xchg as __always_inline
    f0bde95d77c1 iio: imu: st_lsm6dsx: fix waitime for st_lsm6dsx i2c controller
    1a5843dc8c0c drm/amdgpu: fix memory leak
    868397e6c42c perf/x86/amd: Change/fix NMI latency mitigation to use a timestamp
    81fc7990a0c5 perf/core: Fix corner case in perf_rotate_context()
    721fa4a46fc9 perf/core: Rework memory accounting in perf_mmap()
    f182d51db406 sched/vtime: Fix guest/system mis-accounting on task switch
    4d182255c178 sched/fair: Scale bandwidth quota and period without losing quota/period ratio precision
    9f951480df73 x86/cpu: Add Comet Lake to the Intel CPU models header
    cc5d1ac88699 arm64: armv8_deprecated: Checking return value for memory allocation
    becc2d395df8 btrfs: silence maybe-uninitialized warning in clone_range
    33fff851e503 fs: ocfs2: fix a possible null-pointer dereference in ocfs2_write_end_nolock()
    32503fb41c44 fs: ocfs2: fix a possible null-pointer dereference in ocfs2_info_scan_inode_alloc()
    db2a5874c6ed ocfs2: clear zero in unaligned direct IO
    ceaf6a8c4ea9 x86/xen: Return from panic notifier
    2f921acb80bf riscv: Correct the handling of unexpected ebreak in do_trap_break()
    97cb8b84f1c3 riscv: avoid sending a SIGTRAP to a user thread trapped in WARN()
    a300b6885c64 riscv: avoid kernel hangs when trapped in BUG()
    da43a3822b64 MIPS: include: Mark __cmpxchg as __always_inline
    373c1dd11b45 efi/x86: Do not clean dummy variable in kexec path
    f9041dd022cb efi/cper: Fix endianness of PCIe class code
    f722f7ecf089 serial: mctrl_gpio: Check for NULL pointer
    a6ff1233680e fs: cifs: mute -Wunused-const-variable message
    c1c06adaa024 gpio: max77620: Use correct unit for debounce times
    a5b546c50f27 RDMA/mlx5: Order num_pending_prefetch properly with synchronize_srcu
    cbbee24f43c9 RDMA/mlx5: Do not allow rereg of a ODP MR
    5c113e817535 RDMA/cm: Fix memory leak in cm_add/remove_one
    735a98c89faf RDMA/core: Fix an error handling path in 'res_get_common_doit()'
    c643e93dc992 tty: n_hdlc: fix build on SPARC
    bf1a30450492 serial/sifive: select SERIAL_EARLYCON
    9b216ebaa0ff tty: serial: rda: Fix the link time qualifier of 'rda_uart_exit()'
    af0e484e2aea tty: serial: owl: Fix the link time qualifier of 'owl_uart_exit()'
    ccc0779a474d arm64: ftrace: Ensure synchronisation in PLT setup for Neoverse-N1 #1542419
    eba84370623a arm64: Fix incorrect irqflag restore for priority masking for compat
    6d4308365bdd nfs: Fix nfsi->nrequests count error on nfs_inode_remove_request
    ba5505b64fff selftests/kselftest/runner.sh: Add 45 second timeout per test
    5611d30695ff kselftest: Fix NULL INSTALL_PATH for TARGETS runlist
    2332b66b6d48 kselftest: exclude failed TARGETS from runlist
    a007910420b3 HID: hyperv: Use in-place iterator API in the channel callback
    d9f1bbf18881 RDMA/iwcm: Fix a lock inversion issue
    97410d49b2c1 RDMA/iw_cxgb4: fix SRQ access from dump_qp()
    812b81500a5a staging: rtl8188eu: fix null dereference when kzalloc fails
    8a9ea260d651 perf script: Fix invalid LBR/binary mismatch error
    e623c8e7aa71 perf annotate: Don't return -1 for error when doing BPF disassembly
    ebf5e2ee8a97 perf annotate: Return appropriate error code for allocation failures
    219422c0e09c perf annotate: Fix arch specific ->init() failure errors
    2dd48965796f perf annotate: Propagate the symbol__annotate() error return
    d58fb414acc7 perf annotate: Fix the signedness of failure returns
    7956b781a7b7 perf annotate: Propagate perf_env__arch() error
    d6f9043d8173 perf tools: Propagate get_cpuid() error
    b2737fe8cbf0 perf jevents: Fix period for Intel fixed counters
    dda1e196d61e perf script brstackinsn: Fix recovery from LBR/binary mismatch
    8b5ae52f9852 perf map: Fix overlapped map handling
    8680453e5d99 perf tests: Avoid raising SEGV using an obvious NULL dereference
    c484a2c277d2 libsubcmd: Make _FORTIFY_SOURCE defines dependent on the feature
    13121b2d6844 iio: fix center temperature of bmc150-accel-core
    2f86da9d6403 iio: adc: meson_saradc: Fix memory allocation order
    58374086dd4d btrfs: qgroup: Always free PREALLOC META reserve in btrfs_delalloc_release_extents()
    da3cb2dc1dce Btrfs: fix inode cache block reserve leak on failure to allocate data space
    0f0914c95877 dm snapshot: rework COW throttling to fix deadlock
    8355852edf97 dm snapshot: introduce account_start_copy() and account_end_copy()
    c69d2a1ac851 dm snapshot: fix oversights in optional discard support
    80fe585a3c4f dm snapshot: add optional discard support features

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 65031c8d15..f7c329c996 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e2077caf7f145e8f8ab98ff39d520e9215692542"
-SRCREV_meta ?= "832aadfe04fb0fea50cf143b639ed18392b7316c"
+SRCREV_machine ?= "e47a046e69c9ab1798c0e246b213d3d051af8565"
+SRCREV_meta ?= "b569dda3975970960e26c45fc1708b1522496b4e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.25"
+LINUX_VERSION ?= "5.2.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 1d9aa56703..833c8fbfb3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.25"
+LINUX_VERSION ?= "5.2.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "95d588ef6f8c1cf5d3478bb60e96e449fa395a73"
-SRCREV_machine ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_meta ?= "832aadfe04fb0fea50cf143b639ed18392b7316c"
+SRCREV_machine_qemuarm ?= "90883e86e6348ad4fdad00a5eaf1fbdc4c5b2504"
+SRCREV_machine ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_meta ?= "b569dda3975970960e26c45fc1708b1522496b4e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 6ae874e3e8..5615d4c773 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d0a10775d1cd3254de5fd7ab0616038e64e883f3"
-SRCREV_machine_qemuarm64 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_machine_qemumips ?= "7b10c4f80e33bf4a5aa1f27e4d33220a5bf4634a"
-SRCREV_machine_qemuppc ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_machine_qemuriscv64 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_machine_qemux86 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_machine_qemux86-64 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_machine_qemumips64 ?= "c19324f7c3cc384a3bdc3e78b95d25528a734578"
-SRCREV_machine ?= "34462d734888f02c88f2fb686d74f42903c5992e"
-SRCREV_meta ?= "832aadfe04fb0fea50cf143b639ed18392b7316c"
+SRCREV_machine_qemuarm ?= "2c9262452bf5b74e820e8435270d76d620e41445"
+SRCREV_machine_qemuarm64 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_machine_qemumips ?= "497185e6a1627c6039dccbb8b7796706abcaf6ad"
+SRCREV_machine_qemuppc ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_machine_qemuriscv64 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_machine_qemux86 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_machine_qemux86-64 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_machine_qemumips64 ?= "1b7bd87c8debcffbfa35d06756c53ad748bc62fd"
+SRCREV_machine ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
+SRCREV_meta ?= "b569dda3975970960e26c45fc1708b1522496b4e"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.25"
+LINUX_VERSION ?= "5.2.26"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


