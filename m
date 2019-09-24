Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4C47E08B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 22:01:04 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q10so8365602iop.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wkfWAmrGfoJYdjCxwl6kUVVw7RQXDDLUpFzQiiE39lQ=;
	b=LV21bTIK+aHXzzTXXO1Wo93U8FWaQxdngqjutzLmPZoPNWWGLaaEQanwQHuFNiMULl
	ncffA3W5hplBy1ZQVg1IKHBRmyfVdYAUxqiD23J1Ks7trGIAZWARpC6JLsNw/ydvap4f
	oL9G5QN7psnTfcJ7K5sfnOg3VkUIA+L8gvljBMGHHdlqCYOrssJscu6tv2XMUT02bnST
	0RUkxwTl+TJSZB5iyqWXMRj9JBzLRjPC4k6zEXgqg9LhVujrHE7T4ti+RctXeyc8v7np
	BJrhIm+/VyRfndEIsZHvc8Im/tRTx1lgd71C1MgoTEaA2elubSXC8L1bmGaTOjvgGgHb
	PX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wkfWAmrGfoJYdjCxwl6kUVVw7RQXDDLUpFzQiiE39lQ=;
	b=Gg7s7lDo/DE8v7fNf+zHIt2GtE9NSReif3dmYB23IVB1Wqy8wNzeHOxMh5YcPiSd5o
	jmC7iviYU4t8QtkHFRuhzCQrtm8W7AGpZiRk0Kc0XqfBf92zqEyFvjQ9OzbCHoXC3LyS
	g3CEa5fYzNQ9DUvAMlkvtlbMwMxe1H5JdJf6lVrVF+/7lGJAItufrcFNu7MbHcHLuPAO
	f8R58q0kAANfVot+tCYuQoLwQmZDXBTLFQakPMWrTkV1PJepUd1gw5/VFDii8kr4uZGs
	9Ry9nNpFKZm76Hv+TEArCI3oVNUp58JrROZGFQqt9BFiOrTN7V4DDq0OqB7+jaxMEjBn
	axGg==
X-Gm-Message-State: APjAAAWG8bRZ9Xnj5yqT1F7C3rua7NzSIgh9MWY90e/rdN6OSP69BFYE
	9zsofboeiAI0T1dYJesSh6k=
X-Google-Smtp-Source: APXvYqxSZSkKkWnhavFZPJnoaqDknP1p2lZ7wKMy72Q+9/xUh7VuaPyyHWHYGBYVb9ol8i2mBwA9Gg==
X-Received: by 2002:a6b:254:: with SMTP id 81mr5969404ioc.17.1569362465087;
	Tue, 24 Sep 2019 15:01:05 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	x12sm3040895ioh.76.2019.09.24.15.01.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:01:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 24 Sep 2019 18:00:56 -0400
Message-Id: <ffa8402227d1591ce6d09f149da88fa432af93ce.1569362299.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1569362299.git.bruce.ashfield@gmail.com>
References: <cover.1569362299.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.2: update to v5.2.14
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
X-List-Received-Date: Tue, 24 Sep 2019 22:01:04 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to the latest korg -stable for 5.2, which comprises the
following changes:

   997fee5473ce Linux 5.2.14
   0ccc5c227f88 Revert "mmc: core: do not retry CMD6 in __mmc_switch()"
   317a66e24b46 x86/boot: Preserve boot_params.secure_boot from sanitizing
   1a7fd193e9d8 Revert "x86/apic: Include the LDR when clearing out APIC registers"
   ae96cf9e1e31 libceph: allow ceph_buffer_put() to receive a NULL ceph_buffer
   8d50b82ea79b x86/boot/compressed/64: Fix missing initialization in find_trampoline_placement()
   852a051ef22b KVM: arm/arm64: VGIC: Properly initialise private IRQ affinity
   44dfa46aaf7c gpio: Fix irqchip initialization order
   157ec0a3f834 RDMA/bnxt_re: Fix stack-out-of-bounds in bnxt_qplib_rcfw_send_message
   cf9ec2e9056c afs: use correct afs_call_type in yfs_fs_store_opaque_acl2
   3f6685835889 afs: Fix possible oops in afs_lookup trace event
   c231241d83b9 afs: Fix leak in afs_lookup_cell_rcu()
   7f134d569e1a KVM: arm/arm64: Only skip MMIO insn once
   39c62cdaa2d4 ceph: fix buffer free while holding i_ceph_lock in fill_inode()
   c4e28be29a45 ceph: fix buffer free while holding i_ceph_lock in __ceph_build_xattrs_blob()
   f41cd559f1f3 ceph: fix buffer free while holding i_ceph_lock in __ceph_setxattr()
   3ebab463e9f4 drm/amdgpu: prevent memory leaks in AMDGPU_CS ioctl
   23da8e9ef69b selftests/kvm: make platform_info_test pass on AMD
   666a41848d72 selftests: kvm: fix state save/load on processors without XSAVE
   dd53d830bb30 infiniband: hfi1: fix memory leaks
   bcb3211656fa infiniband: hfi1: fix a memory leak bug
   1e93149659cc IB/mlx4: Fix memory leaks
   fc38afc04343 RDMA/cma: fix null-ptr-deref Read in cma_cleanup
   d61a256fece2 nvme: Fix cntlid validation when not using NVMEoF
   e1031b6c8100 nvme-multipath: fix possible I/O hang when paths are updated
   6950d5b64a15 Tools: hv: kvp: eliminate 'may be used uninitialized' warning
   195b5aa923ec Input: hyperv-keyboard: Use in-place iterator API in the channel callback
   31b60e5c604c scsi: lpfc: Mitigate high memory pre-allocation by SCSI-MQ
   aa4bc3a35253 x86/boot/compressed/64: Fix boot on machines with broken E820 table
   3091859b0b5e HID: cp2112: prevent sleeping function called from invalid context
   e8fd4f47b224 HID: intel-ish-hid: ipc: add EHL device id
   d58500c6fcb4 kprobes: Fix potential deadlock in kprobe_optimizer()
   9ad89d579c01 sched/core: Schedule new worker even if PI-blocked
   086ddc5e7172 ravb: Fix use-after-free ravb_tstamp_skb
   37f12b895446 wimax/i2400m: fix a memory leak bug
   461f5b613b4d net: cavium: fix driver name
   1915dd1826be ibmvnic: Unmap DMA address of TX descriptor buffers after use
   895a07a5a03a net: kalmia: fix memory leaks
   241a735f5f68 cx82310_eth: fix a memory leak bug
   e8f8411a8def vfs: fix page locking deadlocks when deduping files
   a4234e27ed05 lan78xx: Fix memory leaks
   96ece5798677 clk: Fix potential NULL dereference in clk_fetch_parent_index()
   a6cb8dd3664e clk: Fix falling back to legacy parent string matching
   7da16490e5a5 net: myri10ge: fix memory leaks
   0f1c537cf09c liquidio: add cleanup in octeon_setup_iq()
   101743ca0284 selftests: kvm: fix vmx_set_nested_state_test
   5aac82ac9c7c selftests: kvm: provide common function to enable eVMCS
   926a6e9efce9 selftests: kvm: do not try running the VM in vmx_set_nested_state_test
   bf31a46ead59 cxgb4: fix a memory leak bug
   46bf670f4455 scsi: target: tcmu: avoid use-after-free after command timeout
   8e639df33729 scsi: qla2xxx: Fix gnl.l memory leak on adapter init failure
   6fe444e60cda drm/mediatek: set DMA max segment size
   1e12afb4c60a drm/mediatek: use correct device to import PRIME buffers
   2b4a29f04533 netfilter: nft_flow_offload: skip tcp rst and fin packets
   1dcb0d4eaf85 gpio: Fix build error of function redefinition
   f6bd80bc6223 ibmveth: Convert multicast list size for little-endian system
   d45c33d890bc s390/qeth: serialize cmd reply with concurrent timeout
   b12691c24ea9 Bluetooth: hci_qca: Send VS pre shutdown command.
   113d5ca74866 Bluetooth: btqca: Add a short delay before downloading the NVM
   ab0f749707ea net: tc35815: Explicitly check NET_IP_ALIGN is not zero in tc35815_rx
   37a0be861375 hv_netvsc: Fix a warning of suspicious RCU usage
   936315c0c94e ixgbe: fix possible deadlock in ixgbe_service_task()
   1dc961de7733 tools: bpftool: fix error message (prog -> object)
   ea3c243ce799 netfilter: nf_flow_table: teardown flow timeout race
   96a517d0ba5f netfilter: nf_flow_table: conntrack picks up expired flows
   586f00143091 netfilter: nf_tables: use-after-free in failing rule with bound set
   830b5c3760ff net: tundra: tsi108: use spin_lock_irqsave instead of spin_lock_irq in IRQ context
   60a4f2b2b6b8 clk: samsung: exynos542x: Move MSCL subsystem clocks to its sub-CMU
   c65a2b20a934 clk: samsung: exynos5800: Move MAU subsystem clocks to MAU sub-CMU
   f7bd5e9fe13f clk: samsung: Change signature of exynos5_subcmus_init() function
   8f37477964e9 net/mlx5e: Fix error flow of CQE recovery on tx reporter
   701b89908ba1 netfilter: nf_flow_table: fix offload for flows that are subject to xfrm
   b8a132a4c4b6 libbpf: set BTF FD for prog only when there is supported .BTF.ext data
   a65fb2895af4 libbpf: fix erroneous multi-closing of BTF FD
   fa689968da49 batman-adv: Fix netlink dumping of all mcast_flags buckets
   a4c88340b3ea net/rds: Fix info leak in rds6_inc_info_copy()
   fdd2bc365fc6 net/sched: pfifo_fast: fix wrong dereference when qdisc is reset
   e9cc0513248f net/sched: pfifo_fast: fix wrong dereference in pfifo_fast_enqueue
   0b003edac850 net: dsa: tag_8021q: Future-proof the reserved fields in the custom VID
   c7f05c1d9bf4 Add genphy_c45_config_aneg() function to phy-c45.c
   98ded313ffda net/sched: cbs: Set default link speed to 10 Mbps in cbs_set_port_rate
   622f16b30519 taprio: Set default link speed to 10 Mbps in taprio_set_picos_per_byte
   4f15d0e51268 taprio: Fix kernel panic in taprio_destroy
   61f10b1bb84d r8152: remove calling netif_napi_del
   5a9ceccb6385 Revert "r8152: napi hangup fix after disconnect"
   7e21536433d0 nfp: flower: handle neighbour events on internal ports
   f7ec32a4ae5c nfp: flower: prevent ingress block binds on internal ports
   64a2a93ba385 tcp: remove empty skb from write queue in error cases
   5cef2bfc9e3f tcp: inherit timestamp on mtu probe
   939cc35d5f81 net: stmmac: dwmac-rk: Don't fail if phy regulator is absent
   505aac7f4e48 net_sched: fix a NULL pointer deref in ipt action
   3c6dfd2adb7a net: sched: act_sample: fix psample group handling on overwrite
   5038bd027ac3 net: fix skb use after free in netpoll
   baa513580b25 mld: fix memory leak in mld_del_delrec()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 763e60984d..490b1259b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9a8cede3b709ca206cf8f133cd0d708a83846c97"
-SRCREV_meta ?= "f88e1531f8ff31810f40482371450932b927f0c8"
+SRCREV_machine ?= "89f4bf508fd9ac595f548351e5558ba5d9f16a44"
+SRCREV_meta ?= "1763be055f7ff1a3215c2d068f1df1b08ad5ac70"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.13"
+LINUX_VERSION ?= "5.2.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index ae196c64c2..a55fd3d3e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.13"
+LINUX_VERSION ?= "5.2.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8c520d2fa63f9d778ebc76577407efa36228a0d1"
-SRCREV_machine ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_meta ?= "f88e1531f8ff31810f40482371450932b927f0c8"
+SRCREV_machine_qemuarm ?= "cbcaf69305e4b0790bbdce30a615e5adfcba74a2"
+SRCREV_machine ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_meta ?= "1763be055f7ff1a3215c2d068f1df1b08ad5ac70"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index ffb7c28cee..8857bd019b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a79bec3a74094b71c15b55d6fd2bd705aeda13d5"
-SRCREV_machine_qemuarm64 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_machine_qemumips ?= "5510032fbac1094d8868953c12303f465858a05d"
-SRCREV_machine_qemuppc ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_machine_qemuriscv64 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_machine_qemux86 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_machine_qemux86-64 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_machine_qemumips64 ?= "d30be093f992de20a76c5eee972b74edf986a66c"
-SRCREV_machine ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
-SRCREV_meta ?= "f88e1531f8ff31810f40482371450932b927f0c8"
+SRCREV_machine_qemuarm ?= "b1a5d8b801acdd81240824e167126adb3cdcd9f1"
+SRCREV_machine_qemuarm64 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_machine_qemumips ?= "26055f7dcb659edd43b21519019d4773188570c7"
+SRCREV_machine_qemuppc ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_machine_qemuriscv64 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_machine_qemux86 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_machine_qemux86-64 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_machine_qemumips64 ?= "1266ed0842cc08adba6086ec4af268bc87a576a4"
+SRCREV_machine ?= "c225913886b6aff4372d209f41f59cee4eeae724"
+SRCREV_meta ?= "1763be055f7ff1a3215c2d068f1df1b08ad5ac70"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.13"
+LINUX_VERSION ?= "5.2.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


