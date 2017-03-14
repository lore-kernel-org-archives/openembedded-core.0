Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D529776E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2EDVL08003921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Mar 2017 06:31:21 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:12 -0400
Message-ID: <87e5edd99739ea6f9d882fc9c1dbcb859f23edf0.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1489498044.git.bruce.ashfield@windriver.com>
References: <cover.1489498044.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/4.9: bump to v4.9.13
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:26 -0000
Content-Type: text/plain

Change summary is as follows:

  3737a5f72234 Linux 4.9.13
  d00400605597 xfs: clear delalloc and cache on buffered write failure
  57d759622aa7 rtlwifi: rtl_usb: Fix for URB leaking when doing ifconfig up/down
  1cb3de83ab74 block: fix double-free in the failure path of cgwb_bdi_init()
  62c153f346fe ACPICA: Linuxize: Restore and fix Intel compiler build
  8f9872be6db9 netfilter: nf_ct_helper: warn when not applying default helper assignment
  e6bdd8d2fffc goldfish: Sanitize the broken interrupt handler
  2709c2a1b016 x86/platform/goldfish: Prevent unconditional loading
  fef3fdf2d83c USB: serial: console: fix uninitialised spinlock
  960a38eae80a USB: serial: ark3116: fix register-accessor error handling
  a2ce74e35d5f USB: serial: opticon: fix CTS retrieval at open
  a1fc6fb5f31e USB: serial: spcp8x5: fix modem-status handling
  26805681a45d USB: serial: ftdi_sio: fix line-status over-reporting
  a1510a8c0ded USB: serial: ftdi_sio: fix extreme low-latency setting
  f3d56f7a586e USB: serial: ftdi_sio: fix modem-status error handling
  4420e0f8fddf USB: serial: cp210x: add new IDs for GE Bx50v3 boards
  308a96c857cc USB: serial: mos7840: fix another NULL-deref at open
  9ab870e7425c tty: serial: msm: Fix module autoload
  1a0e2594ef76 net: socket: fix recvmmsg not returning error from sock_error
  481aedf869fb ip: fix IP_CHECKSUM handling
  7c56012e92b5 ptr_ring: fix race conditions when resizing
  c2219da51664 irda: Fix lockdep annotations in hashbin_delete().
  f23fd87e154f vxlan: fix oops in dev_fill_metadata_dst
  171d92a9d915 dccp: fix freeing skb too early for IPV6_RECVPKTINFO
  6c854afc5399 net: neigh: Fix netevent NETEVENT_DELAY_PROBE_TIME_UPDATE notification
  9206efc8a1f7 packet: Do not call fanout_release from atomic contexts
  722737f27774 packet: fix races in fanout_add()
  e0cb28247882 net: ethernet: ti: cpsw: fix cpsw assignment in resume
  42b52783a59c net/llc: avoid BUG_ON() in skb_orphan()
  859900c24bff net/mlx5e: Disable preemption when doing TC statistics upcall
  90aa7993d5c7 kcm: fix a null pointer dereference in kcm_sendmsg()
  1409935400aa kcm: fix 0-length case for kcm_sendmsg()
  ae7d43192ff2 Linux 4.9.12
  7b0712345376 videodev2.h: go back to limited range Y'CbCr for SRGB and, ADOBERGB
  8629aed2387c bcache: Make gc wakeup sane, remove set_task_state()
  68214ad3926c ntb_transport: Pick an unused queue
  f42026015094 ntb: ntb_perf missing dmaengine_unmap_put
  43325382fc7a NTB: ntb_transport: fix debugfs_remove_recursive
  215d4d62ccfd timekeeping: Use deferred printk() in debug code
  7ee210365adf printk: use rcuidle console tracepoint
  5c3765bbc1db PCI/PME: Restore pcie_pme_driver.remove
  48a415827882 Revert "i2c: designware: detect when dynamic tar update is possible"
  17c443421458 ARM: 8658/1: uaccess: fix zeroing of 64-bit get_user()
  808de347ebd4 futex: Move futex_init() to core_initcall
  dfe8f5757ec4 drm/dp/mst: fix kernel oops when turning off secondary monitor
  7499da90c0cc drm/radeon: Use mode h/vdisplay fields to hide out of bounds HW cursor
  19d2d869d00e Input: elan_i2c - add ELAN0605 to the ACPI table
  a975e8e81e55 Fix missing sanity check in /dev/sg
  a026c97e8824 scsi: don't BUG_ON() empty DMA transfers
  920b60aa3cc2 powerpc/64: Disable use of radix under a hypervisor
  ef746a305de3 mmc: core: fix multi-bit bus width without high-speed mode
  80a0477665d0 fuse: fix uninitialized flags in pipe_buffer
  7283448f8273 fuse: fix use after free issue in fuse_dev_do_read()
  6cf921be8fb9 siano: make it work again with CONFIG_VMAP_STACK
  166a2464cdcf vfs: fix uninitialized flags in splice_to_pipe()
  eee1550b3e89 Linux 4.9.11
  724aedaa5ca6 x86/fpu/xstate: Fix xcomp_bv in XSAVES header
  0d4c19ee68c9 tcp: don't annotate mark on control socket from tcp_v6_send_response()
  0e0751cdfa46 net/mlx5: Don't unlock fte while still using it
  7c4c32a2976e tcp: fix mark propagation with fwmark_reflect enabled
  16a3fbe5239a igmp, mld: Fix memory leak in igmpv3/mld_del_delrec()
  53a76d633b86 mld: do not remove mld souce list info when set link down
  5b1bb4cbd7ec l2tp: do not use udp_ioctl()
  12758a282435 net: dsa: Do not destroy invalid network devices
  a700cf26a3be ping: fix a null pointer dereference
  82849541895f packet: round up linear to header len
  6ebde312a8ed net: introduce device min_header_len
  4cd0362114c8 sit: fix a double free on error path
  2b7f50d67f5d lwtunnel: valid encap attr check should return 0 when lwtunnel is disabled
  00eff2ebbd22 sctp: avoid BUG_ON on sctp_wait_for_sndbuf
  4400acce6881 mlx4: Invoke softirqs after napi_reschedule
  970390fd5d53 catc: Use heap buffer for memory size test
  61bf9f381c38 catc: Combine failure cleanup code in catc_probe()
  e898f6f008aa rtl8150: Use heap buffers for all register access
  878b015bcc72 pegasus: Use heap buffers for all register access
  b90cb484c068 macvtap: read vnet_hdr_size once
  26989c9d9904 tun: read vnet_hdr_sz once
  0f895f51a831 tcp: avoid infinite loop in tcp_splice_read()
  1e340bb22af3 ipv6: tcp: add a missing tcp_v6_restore_cb()
  ae1768bbbc46 ip6_gre: fix ip6gre_err() invalid reads
  66cdd4347573 netlabel: out of bound access in cipso_v4_validate()
  f5b54446630a ipv4: keep skb->dst around in presence of IP options
  d5b6fd77519d net: use a work queue to defer net_disable_timestamp() work
  455a457780b6 stmmac: Discard masked flags in interrupt status register
  ca876dff1e8c tcp: fix 0 divide in __tcp_select_window()
  e6fbace87c7b ipv6: pointer math error in ip6_tnl_parse_tlv_enc_lim()
  a7fe4e5d0633 ipv6: fix ip6_tnl_parse_tlv_enc_lim()
  6c8556f6e114 net/sched: matchall: Fix configuration race
  64cc7ef5cf1d net/mlx5e: Fix update of hash function/key via ethtool
  adf86d59bb9b can: Fix kernel panic at security_sock_rcv_skb

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 4c6f6c36665a..d95e89feac71 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4b45c66b706a2bf859e7672d03ab525ea6bd3d75"
-SRCREV_meta ?= "7e8ec462b6bc68cb0f3cb0064909e035db1c4038"
+SRCREV_machine ?= "56827595acb884098f350b1d4b32ac8914f63ce2"
+SRCREV_meta ?= "d8d88204d080817cb6e4d3a9b8e15b7a7fbf8267"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.9"
+LINUX_VERSION ?= "4.9.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 93230e079036..145ed6c85d0c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.9"
+LINUX_VERSION ?= "4.9.13"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_meta ?= "7e8ec462b6bc68cb0f3cb0064909e035db1c4038"
+SRCREV_machine ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
+SRCREV_meta ?= "d8d88204d080817cb6e4d3a9b8e15b7a7fbf8267"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 92870f3b90de..f48c86c94690 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b486cccff0f7d0b8329d1563cb7f6f37bd61218c"
-SRCREV_machine_qemuarm64 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_machine_qemumips ?= "25272505ce62183927098e2834dc039bef127043"
-SRCREV_machine_qemuppc ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_machine_qemux86 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_machine_qemux86-64 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_machine_qemumips64 ?= "2ee2ed6d782e36fd705cc8f6ad9de98606ca227e"
-SRCREV_machine ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_meta ?= "7e8ec462b6bc68cb0f3cb0064909e035db1c4038"
+SRCREV_machine_qemuarm ?= "68df4c9ef9dcc59836e9e0a932bca9a4e6c201b7"
+SRCREV_machine_qemuarm64 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
+SRCREV_machine_qemumips ?= "864b3dc5e39eaf1a6b8665894ef4ff34396d8704"
+SRCREV_machine_qemuppc ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
+SRCREV_machine_qemux86 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
+SRCREV_machine_qemux86-64 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
+SRCREV_machine_qemumips64 ?= "ac72601920adbc163cd691fa060177137e41bf22"
+SRCREV_machine ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
+SRCREV_meta ?= "d8d88204d080817cb6e4d3a9b8e15b7a7fbf8267"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.9"
+LINUX_VERSION ?= "4.9.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


