Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.45029.1597677144179300902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BY4jYGNB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id y10so6108976plr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KqFnntXzNQozH0dJfX0aQYLxVZ2xvZge1cq35i3yIzM=;
        b=BY4jYGNB4BOSwRzKowbj9cGZ8dt9e3tkzR2Qe9pNj9NQQlqDG013mNQ9na/JuZdQOo
         HkxUusj+DQQA25ebkO4+tjThEKAySfoGX6uv5NdvQZmaTwxhth5rKEgs+yymapjD2hZm
         9/TPww4whPJbVZFg/BfszcRgxcUd4DL7b400/cMIA0o9sG9jmbOZXB+cEi8t3lR0bOCq
         3lA51jK30t1ZGToFkByj7qsyh7aiiJS5EBV6HJt/lo0ZCQXfiTuRAuoLEcxKE7OOyn6p
         lryqZMtWKdzGD91PDoa0jMna+v4nsFPwLu3vesG9a/jjHYQI8ApxQ4m2iOjayP4lSXbb
         Q7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KqFnntXzNQozH0dJfX0aQYLxVZ2xvZge1cq35i3yIzM=;
        b=cN5njA8ebSVZZ0MjH6m4nZOkPLNPqLROH3tc9odW5a3Ev5tH1w6nA3izGcx8CVSYwi
         MhEe88wHoOGiD/8H4bvqVsu3Y2E8bIfQTvUgcCmjL1aNpVMmbxJ+qTCrcmViILNYtW9Z
         A877mHl3In6wwicCKQKlannXD0HM6zBlcxoJHS5Ku6xWmVARPtJyBYzOKvLgIB7INjfQ
         BEJW9QkTwgKtSIejuf7Q4PbwWvkAC3wUHcqfoSuzOVGpybSyNPFo+/+utMpP5MAoAX8z
         50BIfbfuZ7jRaeijRDIJKQeMlHcWdq9K186rrXqFQ3Zrx8WNu9kCfSnhbZiNjYedjKtK
         3oSg==
X-Gm-Message-State: AOAM530BzeOjMOK4sMZ+UV6h0DJBFohzqa4d8zRlKYmNMgjbITlKrkBM
	LbgCStuKneh2DudJQU7NabSMuiHRwFR1mFGbF1U=
X-Google-Smtp-Source: ABdhPJzJTZA+VC6If2z07m8QnxKGLBxhvZ44dIW0h6m3z+wBH35qAmjzlqkdJaHAQ9RrAChYne95jQ==
X-Received: by 2002:a17:90a:6e09:: with SMTP id b9mr12998322pjk.136.1597677143027;
        Mon, 17 Aug 2020 08:12:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] linux-yocto/5.4: update to v5.4.56
Date: Mon, 17 Aug 2020 05:11:50 -1000
Message-Id: <27e82a421ec4614bff2841734fa19c1ec455ae3b.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    1b940bbc5c55 Linux 5.4.56
    df35e878d0a5 perf bench: Share some global variables to fix build with gcc 10
    702d1b287fd2 perf env: Do not return pointers to local variables
    73d2d6b421df perf tests bp_account: Make global variable static
    39568546706f x86/i8259: Use printk_deferred() to prevent deadlock
    01ac46c6baf0 KVM: LAPIC: Prevent setting the tscdeadline timer if the lapic is hw disabled
    fd412846a6ec KVM: arm64: Don't inherit exec permission across page-table levels
    1aff51292ee8 drivers/net/wan: lapb: Corrected the usage of skb_cow
    f88c909dc28c RISC-V: Set maximum number of mapped pages correctly
    e3043abb5baa xen-netfront: fix potential deadlock in xennet_remove()
    a7b488d65d39 cxgb4: add missing release on skb in uld_send()
    5f4e6b874b57 x86/stacktrace: Fix reliable check for empty user task stacks
    32344d2993b0 x86/unwind/orc: Fix ORC for newly forked tasks
    a14d6a9ddf33 Revert "i2c: cadence: Fix the hold bit setting"
    df366abb9c8f net: ethernet: ravb: exit if re-initialization fails in tx timeout
    ac7c3b8f34ec parisc: add support for cmpxchg on u8 pointers
    a0ba41317c89 scsi: core: Run queue in case of I/O resource contention failure
    0ac155dcf048 nfc: s3fwrn5: add missing release on skb in s3fwrn5_recv_frame
    50c5f89637bc selftests: net: ip_defrag: modprobe missing nf_defrag_ipv6 support
    78c7532b80c6 qed: Disable "MFW indication via attention" SPAM every 5 minutes
    6e4620df9cbc selftests: fib_nexthop_multiprefix: fix cleanup() netns deletion
    5b235c1d9022 usb: hso: Fix debug compile warning on sparc32
    cac2b7ad0915 vxlan: fix memleak of fdb
    1df0000b30cd perf tools: Fix record failure when mixed with ARM SPE event
    568995fb61e7 net/mlx5e: fix bpf_prog reference count leaks in mlx5e_alloc_rq
    e68b7b9b03fb net: gemini: Fix missing clk_disable_unprepare() in error path of gemini_ethernet_port_probe()
    1158aa743a0b net: nixge: fix potential memory leak in nixge_probe()
    9acd96f14a49 Bluetooth: fix kernel oops in store_pending_adv_report
    3bb2f52ad9e7 arm64: csum: Fix handling of bad packets
    8a90b436a0c9 arm64/alternatives: move length validation inside the subsection
    4a50753aacb5 mac80211: mesh: Free pending skb when destroying a mpath
    3f15e3e62c80 mac80211: mesh: Free ie data when leaving mesh
    fe58e3dd6e11 bpf: Fix map leak in HASH_OF_MAPS map
    43c390b751ba ibmvnic: Fix IRQ mapping disposal in error path
    ea559138b331 mlxsw: core: Free EMAD transactions using kfree_rcu()
    57f498ced731 mlxsw: core: Increase scope of RCU read-side critical section
    0f424eda4705 mlx4: disable device on shutdown
    c3883876d3f1 rhashtable: Fix unprotected RCU dereference in __rht_ptr
    b1d629d32910 net: lan78xx: fix transfer-buffer memory leak
    9db3040eb952 net: lan78xx: add missing endpoint sanity check
    32ec4441cca1 net/mlx5e: Fix kernel crash when setting vf VLANID on a VF dev
    475cbcef491a net/mlx5e: Modify uplink state on interface up/down
    43608372b84d net/mlx5: Verify Hardware supports requested ptp function on a given pin
    8901896f69d4 net/mlx5e: Fix error path of device attach
    00bedd730d1f net/mlx5: E-switch, Destroy TSAR when fail to enable the mode
    d70f9a3cc32c net: hns3: fix aRFS FD rules leftover after add a user FD rule
    475b8d619268 net: hns3: fix a TX timeout issue
    5fc02e8d1bfd sh: Fix validation of system call number
    2f2674997dfb sh/tlb: Fix PGTABLE_LEVELS > 2
    222dbeca05fb selftests/net: so_txtime: fix clang issues for target arch PowerPC
    d817b2c8d3cf selftests/net: psock_fanout: fix clang issues for target arch PowerPC
    22f84cce9527 selftests/net: rxtimestamp: fix clang issues for target arch PowerPC
    831c904a0f68 nvme-tcp: fix possible hang waiting for icresp response
    9a1d0084cbe1 ARM: dts: armada-38x: fix NETA lockup when repeatedly switching speeds
    731e013e33b3 xfrm: Fix crash when the hold queue is used.
    a4c902887f1d ARM: dts sunxi: Relax a bit the CMA pool allocation range
    0307da686660 xfrm: policy: match with both mark and mask on user interfaces
    bbb13adb07af net/x25: Fix null-ptr-deref in x25_disconnect
    69cd304cfa5c net/x25: Fix x25_neigh refcnt leak when x25 disconnect
    c2fd34d43110 libtraceevent: Fix build with binutils 2.35
    2ec69499b758 rds: Prevent kernel-infoleak in rds_notify_queue_get()
    6a9428427da1 drm: hold gem reference until object is no longer accessed
    7eef3b463d88 drm/dbi: Fix SPI Type 1 (9-bit) transfer
    8ea180f1c7ec drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()
    f1b4bdde2bdc drm/amd/display: Clear dm_state for fast updates
    22d3202e51a7 Revert "drm/amdgpu: Fix NULL dereference in dpm sysfs handlers"
    cea6633d5382 virtio_balloon: fix up endian-ness for free cmd id
    c2f787f904e0 ARM: dts: imx6qdl-icore: Fix OTG_ID pin and sdcard detect
    b9274613114a ARM: dts: imx6sx-sdb: Fix the phy-mode on fec2
    c4738c67a569 ARM: dts: imx6sx-sabreauto: Fix the phy-mode on fec2
    3b7e4a5ba95d ARM: 8986/1: hw_breakpoint: Don't invoke overflow handler on uaccess watchpoints
    b8fa0b037047 wireless: Use offsetof instead of custom macro.
    d3472f74d229 9p/trans_fd: Fix concurrency del of req_list in p9_fd_cancelled/p9_read_work
    96f105943cff vhost/scsi: fix up req type endian-ness
    951117a2079b IB/rdmavt: Fix RQ counting issues causing use of an invalid RWQE
    dc731d262811 ALSA: hda/hdmi: Fix keep_power assignment for non-component devices
    6a67b05c6f30 ALSA: hda/realtek - Fixed HP right speaker no sound
    09832a9e0b76 ALSA: hda/realtek: Fix add a "ultra_low_power" function for intel reference board (alc256)
    e9f147c937a5 ALSA: hda/realtek: typo_fix: enable headset mic of ASUS ROG Zephyrus G14(GA401) series with ALC289
    cd76d30f51fb ALSA: hda/realtek: enable headset mic of ASUS ROG Zephyrus G15(GA502) series with ALC289
    6d84a8cf8a02 ALSA: usb-audio: Add implicit feedback quirk for SSL2
    47e20933814f mm/filemap.c: don't bother dropping mmap_sem for zero size readahead
    140210554274 PCI/ASPM: Disable ASPM on ASMedia ASM1083/1085 PCIe-to-PCI bridge
    2ff65580d477 ath10k: enable transmit data ack RSSI for QCA9884
    98cef10fbcca sunrpc: check that domain table is empty at module unload.
    84da97713b91 media: rc: prevent memory leak in cx23888_ir_probe
    ecfa7fa198fc crypto: ccp - Release all allocated memory if sha type is invalid
    169b93899c7d Linux 5.4.55
    909dbf09cd01 Revert "dpaa_eth: fix usage as DSA master, try 3"
    4918285a6c7d PM: wakeup: Show statistics for deleted wakeup sources again
    59242fa1d2ba regmap: debugfs: check count when read regmap file
    df89c1ee034c udp: Improve load balancing for SO_REUSEPORT.
    6735c126d272 udp: Copy has_conns in reuseport_grow().
    86512c6938a9 sctp: shrink stream outq when fails to do addstream reconf
    46e7c7efc30d sctp: shrink stream outq only when new outcnt < old outcnt
    bbf6af4a938a AX.25: Prevent integer overflows in connect and sendmsg
    182ffc66456b tcp: allow at most one TLP probe per flight
    e2f904fd79a0 rxrpc: Fix sendmsg() returning EPIPE due to recvmsg() returning ENODATA
    01c928350641 rtnetlink: Fix memory(net_device) leak when ->newlink fails
    b7d3d6df72a8 qrtr: orphan socket in qrtr_release()
    2bf797a8691a net: udp: Fix wrong clean up for IS_UDPLITE macro
    274b40b6df6c net-sysfs: add a newline when printing 'tx_timeout' by sysfs
    8d9f13dd400c ip6_gre: fix null-ptr-deref in ip6gre_init_net()
    fbcd85cd11de drivers/net/wan/x25_asy: Fix to make it work
    d109acd58052 dev: Defer free of skbs in flush_backlog
    52aeeec1a635 AX.25: Prevent out-of-bounds read in ax25_sendmsg()
    2f1624faf647 AX.25: Fix out-of-bounds read in ax25_connect()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9b3ecf377a1c01979311dc7082c401c957ca6ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 6d3adb5dbd..56f6c2462a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2739bdb0bfa0d9b423ffa940150e539c80bc0bfd"
-SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
+SRCREV_machine ?= "de6b368e4875392d9dc0342a0991f74285e4955d"
+SRCREV_meta ?= "33bd5e8ac6fa46d5d7891b6e850603159f095b1a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.54"
+LINUX_VERSION ?= "5.4.56"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3cc8537973..4aeb560f2a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.54"
+LINUX_VERSION ?= "5.4.56"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "58d322d637edd20fe24aadfdc0d621f63700c009"
-SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
+SRCREV_machine_qemuarm ?= "0f2bcc4968dd118d71c06c59f3159b8fd0eafbe9"
+SRCREV_machine ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_meta ?= "33bd5e8ac6fa46d5d7891b6e850603159f095b1a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 7904850317..8874c40623 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "84e270de836971e9fec8e6acbe06f8a2e1405916"
-SRCREV_machine_qemuarm64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_machine_qemumips ?= "f418fa62aec041e4c3b5c28df853a8c636fa2f62"
-SRCREV_machine_qemuppc ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_machine_qemuriscv64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_machine_qemux86 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_machine_qemux86-64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_machine_qemumips64 ?= "3a515b583c3efc896cafa4f7f1e784456a360f8f"
-SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
+SRCREV_machine_qemuarm ?= "078735bf2317d85576c7d144b867c13c02dfc317"
+SRCREV_machine_qemuarm64 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_machine_qemumips ?= "7db7c284d5a9fb3a19d3c0ee1218be340cd48506"
+SRCREV_machine_qemuppc ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_machine_qemuriscv64 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_machine_qemux86 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_machine_qemux86-64 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_machine_qemumips64 ?= "dce45211b696761c4cef078eb682f278ea38a72b"
+SRCREV_machine ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
+SRCREV_meta ?= "33bd5e8ac6fa46d5d7891b6e850603159f095b1a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.54"
+LINUX_VERSION ?= "5.4.56"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

