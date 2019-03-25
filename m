Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id A80FF7D06C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:05 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id s7so6395759iom.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NyAnoqLK2Ck3OL+TraciIaqzFps4SzjksqMMq+Xapa0=;
	b=PULY68lQja1rbaxsq4jl6dLRg7UHsagIWbRyfGjWAeZ0/hhmj64gSiwLI7eqluXiLl
	/L//NxbxCVvVk/S10XwZY7H+8BZiuX2PeVZjaVlmrSHYJGdQdBClMfTanwWxQ5aKJ7XO
	nAYVSsTLX8N8t25xE4In+IYW0Z3Xz2xfHwys7yReTPx3G7+LandT+31eqVteBZqtDfre
	FJGfd/lSDx5fIXtnKNuCkLFwRnUzOqF65onQhyN02EKQlElJhc3Akl3CtdmyHoNG+fs9
	wunJE2A0BhsylA8Rvo1tL/S8AodcXIov6z//OTsZjRP0AINEgxPVMOlMQi/LV4FaZq7A
	nIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NyAnoqLK2Ck3OL+TraciIaqzFps4SzjksqMMq+Xapa0=;
	b=hxxy1b0J8C5OPq0zTGBAe+w4gKQwoAfLHLxPKPuDkyGOcjvbBlX+UiEbS5MPGp7yfp
	xTuGop+nGUtNSByp/YKL4izRn9Mqpx3PpbLBgVGuNrLmlH/Pji7jb/yCHZToT3Y/WfWo
	mr6zn/LdZHoftPud57wvnlYHtNAmAHODNVCLFsLjxLsUhmbQ5sOHtHf2mS9tWmjheXHd
	z2jKM5+Xv9b+YAHjI2GP9J36+eGL3hvzcZ/VajkrJbuV1SRN1BsBmpBOEL2Fh93BTHAm
	K/H4GwaZ7rjHIRSEondDtyo19VdBeohcYFPmWs6rlNt4RDLcWWWUigIhHtDQHr6BcDpV
	1nlg==
X-Gm-Message-State: APjAAAXkDfKoG+8BHSJoHdJTr9ETLhrDgKyTlHya7EQbJZtRDsmLvJhi
	jdh+PgW44Jp9OIpwkYc2MRc=
X-Google-Smtp-Source: APXvYqyCS5wcIm9DA+7dsJbVDeGve+IgGeNlfWK5qJm3oWO5vhNTL4AZxdlWSuhAzcnllJI6Wn3mGA==
X-Received: by 2002:a5e:dc0a:: with SMTP id b10mr16628415iok.34.1553483526366; 
	Sun, 24 Mar 2019 20:12:06 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:54 -0400
Message-Id: <f80737280bcc2775ff8ed400eef5bac3b4cfb144.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/5.0: update to v5.0.3
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:05 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable releases that comprise the following
commits:

   449959917f0c Linux 5.0.3
   847c02bcb48a drm: Block fb changes for async plane updates
   a51603120204 It's wrong to add len to sector_nr in raid10 reshape twice
   0912fa3dfcea perf/x86/intel: Make dev_attr_allow_tsx_force_abort static
   c075798c05d9 perf/x86/intel: Fix memory corruption
   291ad91aad03 ALSA: hda/realtek: Enable headset MIC of Acer TravelMate X514-51T with ALC255
   843a9a5b5675 ALSA: hda/realtek - Reduce click noise on Dell Precision 5820 headphone
   6f63adaf8881 ALSA: hda/realtek: Enable audio jacks of ASUS UX362FA with ALC294
   19fcfe5ad57c ALSA: hda - add more quirks for HP Z2 G4 and HP Z240
   f36b6691acdd ALSA: hda: Extend i915 component bind timeout
   69bf155eec9e ALSA: firewire-motu: fix construction of PCM frame for capture direction
   b072cb42f01e ALSA: bebob: use more identical mod_alias for Saffire Pro 10 I/O against Liquid Saffire 56
   9826a60a2aca perf/x86: Fixup typo in stub functions
   94f93c5900e3 f2fs: wait on atomic writes to count F2FS_CP_WB_DATA
   15c5945f83c1 net: sched: flower: insert new filter to idr after setting its mask
   882e7866ad28 vsock/virtio: fix kernel panic from virtio_transport_reset_no_sock
   c7bc9d62033a net: hns3: fix to stop multiple HNS reset due to the AER changes
   b31539bd3595 net: dsa: mv88e6xxx: Set correct interface mode for CPU/DSA ports
   7e30fd0627db net/mlx4_core: Fix qp mtt size calculation
   979785bea346 net/mlx4_core: Fix locking in SRIOV mode when switching between events and polling
   f1ac81bb23a4 net/mlx4_core: Fix reset flow when in command polling mode
   11e457c165d0 vxlan: test dev->flags & IFF_UP before calling gro_cells_receive()
   854b83c7493c vxlan: Fix GRO cells race condition between receive and link delete
   3460bb198560 tcp: handle inet_csk_reqsk_queue_add() failures
   dfcf44d29a7f tcp: Don't access TCP_SKB_CB before initializing it
   75c9b039f9bd tcp: do not report TCP_CM_INQ of 0 for closed connections
   05ad31a85e96 sctp: remove sched init from sctp_stream_init
   3aca89318497 rxrpc: Fix client call queueing, waiting for channel
   ed98b01c0523 route: set the deleted fnhe fnhe_daddr to 0 in ip_del_fnhe to fix a race
   cfa5b557d9d0 ravb: Decrease TxFIFO depth of Q3 and Q2 to one
   41b802e6f2a8 pptp: dst_release sk_dst_cache in pptp_sock_destruct
   a6e37802e050 net/x25: reset state in x25_connect()
   391c4c5228d8 net/x25: fix use-after-free in x25_device_event()
   0f27e8de5678 net: sit: fix UBSAN Undefined behaviour in check_6rd
   bfca8925f758 net/hsr: fix possible crash in add_timer()
   251eb21781bf net: hsr: fix memory leak in hsr_dev_finalize()
   4b7730375855 net: hns3: add dma_rmb() for rx description
   93a96dc0a610 lan743x: Fix TX Stall Issue
   8c223fee4ad4 lan743x: Fix RX Kernel Panic
   a53dc7db54c7 l2tp: fix infoleak in l2tp_ip6_recvmsg()
   b41988c24100 ipv4/route: fail early when inet dev is missing
   ab62510ac2ea gro_cells: make sure device is up in gro_cells_receive()
   a9b0ebbf75c3 fou, fou6: avoid uninit-value in gue_err() and gue6_err()
   c4b5717a0168 connector: fix unsafe usage of ->real_parent
   9e6fdea016e4 Linux 5.0.2
   84ff8f265a91 perf/x86/intel: Implement support for TSX Force Abort
   9870cd07a132 x86: Add TSX Force Abort CPUID/MSR
   93c2f72c7933 perf/x86/intel: Generalize dynamic constraint creation
   3ad8e57560d7 perf/x86/intel: Make cpuc allocations consistent
   3dfe7538f80a ath9k: Avoid OF no-EEPROM quirks without qca,no-eeprom
   72bc954e8a5f scripts/gdb: replace flags (MS_xyz -> SB_xyz)
   e7b0b71c22e7 staging: erofs: compressed_pages should not be accessed again after freed
   a56c9e263786 staging: erofs: keep corrupted fs from crashing kernel in erofs_namei()
   66ad3d56ab62 gfs2: Fix missed wakeups in find_insert_glock
   97e5d51f123a bpf: Stop the psock parser before canceling its work
   5b31a61305cd Revert "PCI/PME: Implement runtime PM callbacks"
   fd0b578b41c6 media: Revert "media: rc: some events are dropped by userspace"
   e3f5c3cbe163 drm: disable uncached DMA optimization for ARM and arm64
   b7ea06838d14 ARM: dts: exynos: Fix max voltage for buck8 regulator on Odroid XU3/XU4
   cc637b0563f7 ARM: dts: exynos: Add minimal clkout parameters to Exynos3250 PMU
   6eb775cb560d ARM: dts: exynos: Fix pinctrl definition for eMMC RTSN line on Odroid X2/U3
   d2370201967a arm64: dts: hikey: Revert "Enable HS200 mode on eMMC"
   34294e187622 arm64: dts: hikey: Give wifi some time after power-on
   bab3cf9d1531 arm64: dts: zcu100-revC: Give wifi some time after power-on
   39ab777e42ec x86/PCI: Fixup RTIT_BAR of Intel Denverton Trace Hub
   1830d0d33dcd scsi: aacraid: Fix missing break in switch statement
   d4f05a4aaf98 iscsi_ibft: Fix missing break in switch statement
   61f7963e347d Input: elan_i2c - add id for touchpad found in Lenovo s21e-20
   4a33538bd425 Input: wacom_serial4 - add support for Wacom ArtPad II tablet
   e83b05c4c17e media: uvcvideo: Fix 'type' check leading to overflow
   283506fcd65d Linux 5.0.1
   a9bda122bd77 exec: Fix mem leak in kernel_read_file
   bc60931448e7 Bluetooth: Fix locking in bt_accept_enqueue() for BH context
   95b6840860ee Bluetooth: btrtl: Restore old logic to assume firmware is already loaded
   302f4908d4f9 selftests: firmware: fix verify_reqs() return value
   5e73c19ca66e Revert "selftests: firmware: remove use of non-standard diff -Z option"
   66da661f94eb Revert "selftests: firmware: add CONFIG_FW_LOADER_USER_HELPER_FALLBACK to config"
   44c81a482310 USB: serial: cp210x: fix GPIO in autosuspend
   02c66213c80a gnss: sirf: fix premature wakeup interrupt enable
   ff204bb4c71b xtensa: fix get_wchan
   c9255e2479ef aio: Fix locking in aio_poll()
   2ac0fa7f3373 MIPS: irq: Allocate accurate order pages for irq stack
   a8cc62bd8806 alpha: wire up io_pgetevents system call
   46ce9ec42b78 applicom: Fix potential Spectre v1 vulnerabilities
   92424a683915 usb: xhci: Fix for Enabling USB ROLE SWITCH QUIRK on INTEL_SUNRISEPOINT_LP_XHCI
   511ba5f2287c xhci: tegra: Prevent error pointer dereference
   1eadda06dcda tracing: Fix event filters and triggers to handle negative numbers
   ad0051c0d6da x86/boot/compressed/64: Do not read legacy ROM on EFI system
   b8907034edaf x86/CPU/AMD: Set the CPB bit unconditionally on F17h
   258c4bfcea44 tipc: fix RDM/DGRAM connect() regression
   b0c649843a76 team: Free BPF filter when unregistering netdev
   3445d44b8330 sky2: Disable MSI on Dell Inspiron 1545 and Gateway P-79
   9dc9563fbb38 sctp: call iov_iter_revert() after sending ABORT
   43610748b73d qmi_wwan: Add support for Quectel EG12/EM12
   1ba288215704 net-sysfs: Fix mem leak in netdev_register_kobject
   cd267ea6a70c net: sched: put back q.qlen into a single location
   e1c9e3fe2d34 net: mscc: Enable all ports in QSGMII
   050c7ff6f46c net: dsa: mv8e6xxx: fix number of internal PHYs for 88E6x90 family
   c2e346e38c2a net: dsa: mv88e6xxx: handle unknown duplex modes gracefully in mv88e6xxx_port_set_duplex
   9590cdffe8c4 net: dsa: mv88e6xxx: add call to mv88e6xxx_ports_cmode_init to probe for new DSA framework
   9b3149338ace ip6mr: Do not call __IP6_INC_STATS() from preemptible context
   b592247edd6b staging: android: ashmem: Avoid range_alloc() allocation with ashmem_mutex held.
   6a6b0c1b4731 staging: android: ashmem: Don't call fallocate() with ashmem_mutex held.
   6e2cda2e854b staging: android: ion: fix sys heap pool's gfp_flags
   f14ab1e367d2 staging: wilc1000: fix to set correct value for 'vif_num'
   e872d586158c staging: comedi: ni_660x: fix missing break in switch statement
   116ad909da64 staging: erofs: fix illegal address access under memory pressure
   fa42199d9dab staging: erofs: fix race of initializing xattrs of a inode at the same time
   6df0b3ebdade staging: erofs: fix memleak of inode's shared xattr array
   27f2f4877a00 staging: erofs: fix fast symlink w/o xattr when fs xattr is on
   091520a14086 driver core: Postpone DMA tear-down until after devres release
   0e14eb6e3f42 USB: serial: ftdi_sio: add ID for Hjelmslund Electronics USB485
   eefd31d3c9af USB: serial: cp210x: add ID for Ingenico 3070
   8510d6a23c3d USB: serial: option: add Telit ME910 ECM composition
   ed1776bb5d0b binder: create node flag to request sender's security context
   e93cd6500ff9 staging: erofs: fix mis-acted TAIL merging behavior
   e36e066ffa78 cpufreq: Use struct kobj_attribute instead of struct global_attr

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.0.bb               |  6 +++---
 .../linux/linux-yocto-tiny_5.0.bb             |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index bec4931012..5a185ffa0c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "122f60c86239e6b181f4c59a444140138ec074b6"
+SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_meta ?= "0c703cb02387003c85fe28cff228cc5c8eda45c4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.0"
+LINUX_VERSION ?= "5.0.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 760a1fbc56..cb6b2bf157 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.0"
+LINUX_VERSION ?= "5.0.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2260c031075188dce4d30223527dda68e3940574"
-SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "122f60c86239e6b181f4c59a444140138ec074b6"
+SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
+SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_meta ?= "0c703cb02387003c85fe28cff228cc5c8eda45c4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index bba6829571..e42ead01e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "23b538073fdc803b0a749de77677508671e246af"
-SRCREV_machine_qemuarm64 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_machine_qemumips ?= "50b5b709ac6b1d14ac815f9a002c50a196306b02"
-SRCREV_machine_qemuppc ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_machine_qemux86 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_machine_qemux86-64 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_machine_qemumips64 ?= "8322515ba7a858c47386b95c6e7201c8a3a41175"
-SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "122f60c86239e6b181f4c59a444140138ec074b6"
+SRCREV_machine_qemuarm ?= "18a5ffa0e90184c8503ff1df45e4e5e501b1bab3"
+SRCREV_machine_qemuarm64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_machine_qemumips ?= "c4d3cd6437329407e2cc7e3e4615769452d426b1"
+SRCREV_machine_qemuppc ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
+SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+SRCREV_meta ?= "0c703cb02387003c85fe28cff228cc5c8eda45c4"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.0"
+LINUX_VERSION ?= "5.0.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


