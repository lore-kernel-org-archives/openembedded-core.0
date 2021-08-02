Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002046"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002046"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651961"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/37] linux-yocto/5.4: update to v5.4.131
Date: Mon,  2 Aug 2021 15:52:01 +0800
Message-Id: <45f4b0475a41e8417f76ca96636c902502817b9e.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e8d9b740a550 Linux 5.4.131
    d2f8a8a07ee3 xen/events: reset active flag for lateeoi events later
    a05499b29a6e KVM: SVM: Call SEV Guest Decommission if ASID binding fails
    58356f448b61 s390/stack: fix possible register corruption with stack switch helper
    abbd42939db6 KVM: SVM: Periodically schedule when unregistering regions on destroy
    8b24c7edc2f2 Linux 5.4.130
    5e8519c4083b RDMA/mlx5: Block FDB rules when not in switchdev mode
    c5fb49e12f2c gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
    cf5eb8209723 drm/nouveau: fix dma_address check for CPU/GPU sync
    3edfd34f1338 scsi: sr: Return appropriate error code when disk is ejected
    a6c85a8433e0 x86/efi: remove unused variables

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edfd97ac5a11f46b9f3b905373abe3554f4b85db)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7a4267531f..48514bfe83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c86c4081f4764f57bbb26df8a9202c01799c3771"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine ?= "2bfba6ef5182dbebe73e576c6d8a629285148215"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5d487ac23f..33d65466a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca636d1a2ccbb2626c4eacbdb0da2c30654b108c"
-SRCREV_machine ?= "d46f8ecb3f81bdba8131b90dc90174ecb36a1b78"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine_qemuarm ?= "88ff7ffcdf2653941105106e5e26717f0a78d7a9"
+SRCREV_machine ?= "b9bcd1be30f8be9c00797a6368a1f8df7aa21916"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 94605b3942..0430e06995 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dfb964733268c1e6f932900a384a793a0ca8de34"
-SRCREV_machine_qemuarm64 ?= "7d3eac73a6edc8fdcd701bbb0aa8c21030eb2027"
-SRCREV_machine_qemumips ?= "a40b68f2f4be601dfe020940ad29ac894cc31298"
-SRCREV_machine_qemuppc ?= "a3258c8b1690ecfa620eae9552a75cec9224ecd4"
-SRCREV_machine_qemuriscv64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemux86 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemux86-64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemumips64 ?= "dded4f6e58cd90c7333b5257c9327e5e30f78e26"
-SRCREV_machine ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine_qemuarm ?= "1fe32172ee9971daa7debf3fc8165b6ccb80fe85"
+SRCREV_machine_qemuarm64 ?= "087640d0be07b7160b8012ee0e0b08c21915a632"
+SRCREV_machine_qemumips ?= "2e6db18dd388f7b35f70727556e5e55556b5d0a4"
+SRCREV_machine_qemuppc ?= "672230448073e1342fb18137654abff89baacf5f"
+SRCREV_machine_qemuriscv64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemux86 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemux86-64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemumips64 ?= "92e0699c1dfc9e9fe6b2dd0015f36a7fcc76092c"
+SRCREV_machine ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

