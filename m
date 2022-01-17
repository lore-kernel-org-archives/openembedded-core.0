Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B98C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Z86Sqhw0;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385460; x=1673921460;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ievXX15orQ01UXXX3t0j0D4gEgytCR6DtlMkndTVKMs=;
  b=Z86Sqhw0lAH/VrNqWxry9D4Zir5MmVXqfleaYNg9d6+DTu4VMzojWDqp
   ZcrUOwW2+Rca60m/q2VvoeM1wN1+jsa/S5IUhAEUgmHaxVghINT+Kcnyr
   NjNbHuzbiERg40YA/Sorlx+QlG1m5vw873hq8aNB0/uTrfofyBpJPGPiS
   YYUWf4/7u2artC3Ch4xex8hJdp0PGT1iD/rKY5P8xE/DpAwFi5gg/5uuS
   WNIiU0WTIizxtoFpT35Z7PeaddcadFDrwah5fo1cqIhrbQ86q05f/KjNl
   e6AEe34rGAJ5CBK7WLAxva5MbEa23ldV3kfo/RFHHeGbWAZ2xGB6x05Z4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094285"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220744"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:54 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/12] linux-yocto/5.10: update to v5.10.90
Date: Mon, 17 Jan 2022 10:10:30 +0800
Message-Id: 
 <a729a56973fcfa8b016cd4768b75b2e9ee16a771.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160629

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

d3e491a20d15 Linux 5.10.90
8c15bfb36a44 bpf: Add kconfig knob for disabling unpriv bpf by default
d8a5b1377bf6 perf script: Fix CPU filtering of a script's switch events
2386e81a1d27 net: fix use-after-free in tw_timer_handler
34087cf96046 Input: spaceball - fix parsing of movement data packets
9f329d0d6c91 Input: appletouch - initialize work before device registration
2a4f551dec1a scsi: vmw_pvscsi: Set residual data length conditionally
1cb8444f3114 binder: fix async_free_space accounting for empty parcels
a6e26251dd3a usb: mtu3: set interval of FS intr and isoc endpoint
3b6efe0b7ba0 usb: mtu3: fix list_head check warning
f10b01c48f85 usb: mtu3: add memory barrier before set GPD's HWO
1c4ace3e6b85 usb: gadget: f_fs: Clear ffs_eventfd in ffs_data_clear.
1933fe8ce712 xhci: Fresco FL1100 controller should not have BROKEN_MSI quirk set.
b8553330a077 drm/amdgpu: add support for IP discovery gc_info table v2
28863ffe21ff drm/amdgpu: When the VCN(1.0) block is suspended, powergating is explicitly enabled
a0f3ac399ef5 uapi: fix linux/nfc.h userspace compilation errors
818c9e0a04df nfc: uapi: use kernel size_t to fix user-space builds
8d31cbab4c29 i2c: validate user data in compat ioctl
51c94d8fbd09 fsl/fman: Fix missing put_device() call in fman_port_probe
920932b20e0c net/ncsi: check for error return from call to nla_put_u32
610af55f9fbe selftests/net: udpgso_bench_tx: fix dst ip argument
78503589b1e0 net/mlx5e: Fix wrong features assignment in case of error
61146008087a ionic: Initialize the 'lif->dbid_inuse' bitmap
b7c9a1427b32 igc: Fix TX timestamp support for non-MSI-X platforms
e8a5988a85c7 net/smc: fix kernel panic caused by race of smc_sock
97c87c1db9ff net/smc: don't send CDC/LLC message if link not ready
99f19566b1c4 net/smc: improved fix wait on already cleared link
e553265ea564 NFC: st21nfca: Fix memory leak in device probe and remove
8d70dc0eecf0 net: lantiq_xrx200: fix statistics of received bytes
7ef89bd1e8f1 net: ag71xx: Fix a potential double free in error handling paths
40d36186913b net: usb: pegasus: Do not drop long Ethernet frames
a67becdaa8ad net/smc: fix using of uninitialized completions
769d14abd35e sctp: use call_rcu to free endpoint
13c1bf43b674 selftests: Calculate udpgso segment count without header adjustment
abe74fb43378 udp: using datalen to cap ipv6 udp max gso segments
5e6ad649e927 net/mlx5e: Fix ICOSQ recovery flow for XSK
73665165b64a net/mlx5e: Wrap the tx reporter dump callback to extract the sq
4cd1da02f0c3 net/mlx5: DR, Fix NULL vs IS_ERR checking in dr_domain_init_resources
fcb32eb3d04d scsi: lpfc: Terminate string in lpfc_debugfs_nvmeio_trc_write()
4833ad4908a1 selinux: initialize proto variable in selinux_ip_postroute_compat()
ec941a2277a1 recordmcount.pl: fix typo in s390 mcount regex
a0e82d5ef992 memblock: fix memblock_phys_alloc() section mismatch error
7da855e93964 platform/x86: apple-gmux: use resource_size() with res
d01e9ce1af61 parisc: Clear stale IIR value on instruction access rights trap
0643d9175dc6 tomoyo: use hwight16() in tomoyo_domain_quota_is_ok()
e2048a1f9186 tomoyo: Check exceeded quota early in tomoyo_domain_quota_is_ok().
210c7c6908f3 Input: i8042 - enable deferred probe quirk for ASUS UM325UA
bb672eff7447 Input: i8042 - add deferred probe support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ada52c924b8033939a448d8cedfc4e587bfdbc46)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index dd8326e92c..52ba3b9f61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "301346d30bcaccedc71da8d5f78bd262063d4ba7"
-SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
+SRCREV_machine ?= "e137d5d92c05530840f2e191ec471f8f0ea2d62e"
+SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.89"
+LINUX_VERSION ?= "5.10.90"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 9d2bbc010c..d0166f6c4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.89"
+LINUX_VERSION ?= "5.10.90"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "913d41ebe409dfd03c49fafd1923f8663df2a4ff"
-SRCREV_machine ?= "5575e67330fb6d979ed1cd2e9e64400b4c21b595"
-SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
+SRCREV_machine:qemuarm ?= "c0774ebd6bc1c7541deb4f9a649a1a6bfa42853f"
+SRCREV_machine ?= "ab201bf6e3f9d187c7c26a0ec6537fadb41de918"
+SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 50fa1fb281..43274a318f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b0dfabc86c3b6e1fb2ddb153664961e107bedfa9"
-SRCREV_machine:qemuarm64 ?= "fea23aa594ce16a15564f991e14868dd255674cf"
-SRCREV_machine:qemumips ?= "0ec16d85647a337f392ae358db3dcc200d958938"
-SRCREV_machine:qemuppc ?= "a6a07d8acd8991883464bd3034beabb9ee23f11a"
-SRCREV_machine:qemuriscv64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_machine:qemuriscv32 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_machine:qemux86 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_machine:qemux86-64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_machine:qemumips64 ?= "29cb56446b0b66b7a15d2577773e69c4e813bfd7"
-SRCREV_machine ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
+SRCREV_machine:qemuarm ?= "d9597fe71e155c5a96452d23694188d6d4091673"
+SRCREV_machine:qemuarm64 ?= "210fcd9ee603afb731beaa5833e7e3f1d1918786"
+SRCREV_machine:qemumips ?= "8688d3707cea38bd7ed115a12005079c2215f77d"
+SRCREV_machine:qemuppc ?= "933b47667b7549bb36a809cca90bc372a7182620"
+SRCREV_machine:qemuriscv64 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
+SRCREV_machine:qemuriscv32 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
+SRCREV_machine:qemux86 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
+SRCREV_machine:qemux86-64 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
+SRCREV_machine:qemumips64 ?= "25fcfe4f5c4be9bbb67498f09b2dd088f8bb6dfd"
+SRCREV_machine ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
+SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.89"
+LINUX_VERSION ?= "5.10.90"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


