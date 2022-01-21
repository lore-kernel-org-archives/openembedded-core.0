Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAC8C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:35 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Jc1y5Jng;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776695; x=1674312695;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=upIdhj8SKLUYDOHrMM8Dk0Qcsi29W90uIdXZqZMMZLM=;
  b=Jc1y5JngTK6x5MFmK645HAio4/LeoXZwssrWwn9Wa7IA3sFkOcAqvKVS
   zSDAhgr7ZzA5w5XKUueBAsRruZYyP0Hndj3ZbMAN0knGDK2eI8O0ByNip
   vzIG868XMldEsk/vqRjSHgtZ6c3guxCxZpOvFO1K3O7xqrrgXip0Hi81S
   qdtHk3Y1wENdJ8UZT2fISESQuXSbPrEBKBrVIjxpmt9Df5Lj6fgpsGlLq
   ZassJhS6ThgR3r0U1nywu/GtkSPNnBxuNyT655WxMS91kC/bQGxtsAAL6
   iFkCzgVzLtVbn0jkr+P0qMR2/4pcHtJAFqnDwc4PqNEnbRoDYC5rAZeqp
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886118"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886118"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336894"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/15] linux-yocto/5.10: update to v5.10.91
Date: Fri, 21 Jan 2022 22:51:02 +0800
Message-Id: 
 <48b0ab78f968d48887ab8ff8267782a200cbff19.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160845

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    df395c763ba0 Linux 5.10.91
    674071c9eb26 Input: zinitix - make sure the IRQ is allocated before it gets enabled
    ef81f7d406c2 ARM: dts: gpio-ranges property is now required
    f63fa1a0d4df ipv6: raw: check passed optlen before reading
    cf07884e6bec drm/amd/display: Added power down for DCN10
    10b9ccd0674d mISDN: change function names to avoid conflicts
    dd8a09cfbb99 atlantic: Fix buff_ring OOB in aq_ring_rx_clean
    c2f4bb251eb4 net: udp: fix alignment problem in udp4_seq_show()
    f82b48d1d86b ip6_vti: initialize __ip6_tnl_parm struct in vti6_siocdevprivate
    8c87a83ef891 scsi: libiscsi: Fix UAF in iscsi_conn_get_param()/iscsi_conn_teardown()
    b798b677f94d usb: mtu3: fix interval value for intr and isoc
    498d77fc5e38 ipv6: Do cleanup if attribute validation fails in multipath route
    72b0d14a0a88 ipv6: Continue processing multipath route even if gateway attribute is invalid
    5a7d650bb181 power: bq25890: Enable continuous conversion for ADC at charging
    4f260ea5537d phonet: refcount leak in pep_sock_accep
    61952934608c rndis_host: support Hytera digital radios
    62cbde77d9c1 power: reset: ltc2952: Fix use of floating point literals
    998d157e3b2a power: supply: core: Break capacity loop
    16d8568378f9 xfs: map unwritten blocks in XFS_IOC_{ALLOC,FREE}SP just like fallocate
    aa606b82cdfb net: ena: Fix error handling when calculating max IO queues number
    e7f5480978fd net: ena: Fix undefined state when tx request id is out of bounds
    2de3d961f8e7 sch_qfq: prevent shift-out-of-bounds in qfq_init_qdisc
    4c34d5fd8c96 batman-adv: mcast: don't send link-local multicast to mcast routers
    f403b5f96e9a lwtunnel: Validate RTA_ENCAP_TYPE attribute length
    48d5adb08d60 ipv6: Check attribute length for RTA_GATEWAY when deleting multipath route
    173bfa2782fa ipv6: Check attribute length for RTA_GATEWAY in multipath route
    914420a2a6c5 ipv4: Check attribute length for RTA_FLOW in multipath route
    a8fe915be6c2 ipv4: Check attribute length for RTA_GATEWAY in multipath route
    786a335fef18 ftrace/samples: Add missing prototypes direct functions
    c859c4de0bd7 i40e: Fix incorrect netdev's real number of RX/TX queues
    d0ad64438fb5 i40e: Fix for displaying message regarding NVM version
    32845aa60203 i40e: fix use-after-free in i40e_sync_filters_subtask()
    f7edb6b9438b sfc: The RX page_ring is optional
    2b3f34da0d79 mac80211: initialize variable have_higher_than_11mbit
    16e5cad6eca1 RDMA/uverbs: Check for null return of kmalloc_array
    a7c2cae997db netrom: fix copying in user data in nr_setsockopt
    beeb0fdedae8 RDMA/core: Don't infoleak GRH fields
    3ca132e6b065 iavf: Fix limit of total number of queues to active queues of VF
    396e3016905d i40e: Fix to not show opcode msg on unsuccessful VF MAC change
    7f13d14e563c ieee802154: atusb: fix uninit value in atusb_set_extended_addr
    7db1e245cb71 tracing: Tag trace_percpu_buffer as a percpu pointer
    760c6a625506 tracing: Fix check for trace_percpu_buffer validity in get_trace_buf()
    c1e2da4b3f72 selftests: x86: fix [-Wstringop-overread] warn in test_process_vm_readv()
    384111e12367 f2fs: quota: fix potential deadlock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13b53d922df1a53913fbe7a0dfbf2adaedfe5dfd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 41047bac04..ca7d5dd97c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fbed4064df813f01c1a862548f28b2050ee9b09e"
-SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
+SRCREV_machine ?= "85c14e209f1ab7cee673735c4561e656b4e65217"
+SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.90"
+LINUX_VERSION ?= "5.10.91"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5ae12b1953..dbfeea6c82 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.90"
+LINUX_VERSION ?= "5.10.91"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca2928bf9b108b45a8ecfe6c76ae9d66b9527f0c"
-SRCREV_machine ?= "5d7922b2755129e1066944a25675a4f9bdbbe706"
-SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
+SRCREV_machine_qemuarm ?= "2227ab16358ca3193f03d0cd8509092076aeffbb"
+SRCREV_machine ?= "b3fdab7a9f3c11a61565cead0445883a61081583"
+SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2b1d7bbff9..82dfb0f903 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dbf49e7b0801b1b92994f7bc3c6bba943340e273"
-SRCREV_machine_qemuarm64 ?= "0b092f0c4e3471ef22aef0343477519b0ba8b533"
-SRCREV_machine_qemumips ?= "1806335706c3549985836385bb400c1d80819d73"
-SRCREV_machine_qemuppc ?= "270ee670f95ad200c7c32bf8a8ffbf6ed43d7964"
-SRCREV_machine_qemuriscv64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine_qemuriscv32 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine_qemux86 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine_qemux86-64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine_qemumips64 ?= "ea456bce3f1ed65b1ab00a0cf8cf551b5967aec3"
-SRCREV_machine ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
+SRCREV_machine_qemuarm ?= "fb570663823bd492e4c8d4339be825bda4210dc6"
+SRCREV_machine_qemuarm64 ?= "5a52b700c1693a95b8efa54cb65bec7807a75cd2"
+SRCREV_machine_qemumips ?= "8eb8a801f5f4764c362aefd5e97e704755cf740b"
+SRCREV_machine_qemuppc ?= "21b014e385a6b54a2fd7d667a1b556c69cda77de"
+SRCREV_machine_qemuriscv64 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine_qemuriscv32 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine_qemux86 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine_qemux86-64 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine_qemumips64 ?= "5468343e50389dba73b5d441289d5094bd0dc9f0"
+SRCREV_machine ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.90"
+LINUX_VERSION ?= "5.10.91"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


