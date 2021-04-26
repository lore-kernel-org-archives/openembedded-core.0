Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.928.1619398453420840329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: f5XUR2gWSrvPWE0v43rMXtezdpQgcYA/TiCjP5WA97CD7aMHwouH3gE/2oAk7G74z6b5bmBkPo
 rXFnngtJHuIA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818058"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
IronPort-SDR: ICmVbzGQOa8IfWpS4yh0yrX03KJbm+nnT1MoXPorOw0sW0wOaN5tiQ9NcgV1S8kElx5gYzXDVS
 1gr3/vjmOB+Q==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067255"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/64] linux-yocto/5.10: BSP configuration fixes
Date: Mon, 26 Apr 2021 08:52:41 +0800
Message-Id: <2ce5cf55ab534ea3959daeb3de181a51b313bdec.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10.:

    fa039db710c qemuppc64: Enable the RTC driver
    f6cfc23fbfc nxp-s32g2xx: add HSE UIO related configs to make hse demo work
    2b445fb1e0b firmware: fix CONFIG_FW_LOADER option mismatch warning
    60dde01d949 nxp-imx8: Correct DRM_TTM config and delete redundant config
    07119316ee5 xlnx: bsp: drop obsolete kernel options for xilinx-zynqmp and xilinx-zynq
    0cf78165f8e bcm-2xxx-rpi: update v5.10 kernel config for raspberrypi 4b platform
    9b5a9e46778 marvell-cn96xx: Add the preempt-rt support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6186f21b29e7a152d34c620e81878bf6eff6519d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3e08b5aec5..1896b2f295 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8262073e1b09920fb55a32d698c3a98c3af628eb"
-SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
+SRCREV_machine ?= "57f0dabaec5ad65d936350e9b1f69791c8ddf97e"
+SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 92c15e9b5b..a7b93fce7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2825075bb360f256c3a9dcdf3cf67b34423d657d"
-SRCREV_machine ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
+SRCREV_machine_qemuarm ?= "ae643fde3bb3d99f194ec0b6b9662bdd1d508c2f"
+SRCREV_machine ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f89f513878..d480fc27c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0441d737d347be0b8bcf9bef0b7707d5ba2741a0"
-SRCREV_machine_qemuarm64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemumips ?= "5fbc41f5c569e11bf5e56beea77c432efa69b99e"
-SRCREV_machine_qemuppc ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemuriscv64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemuriscv32 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemux86 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemux86-64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemumips64 ?= "a60cf276769d28c6c495dbf2816a50871705d5eb"
-SRCREV_machine ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
+SRCREV_machine_qemuarm ?= "036f0e96d68be58be2e97ea7cab11f9ca2fb8e1c"
+SRCREV_machine_qemuarm64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemumips ?= "46964fe445c229120a9733ed98dcd5ab8454c999"
+SRCREV_machine_qemuppc ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemuriscv64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemuriscv32 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemux86 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemux86-64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemumips64 ?= "efe9e0c23330929c92a364d2497b231d1325ef29"
+SRCREV_machine ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.30.2

