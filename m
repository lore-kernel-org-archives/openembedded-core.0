Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /buwiK7Oam/v+TBKYs93xaPg09QOiHAxiNDVAJIuC61v4NvpnAY1t3I+VZnaU+jWy4bGR6Zv9q
 5lhg16Ms7jpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004362"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004362"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:53 -0800
IronPort-SDR: eJziExeYAXjz+py/99oxOW5kcqoe3GjVlpzckUvNwEy3vPcmxfa7EYLFY5/QJm+qGJI6cyq9lq
 wPph7nKydfqA==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302619"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:52 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/21] linux-yocto/5.8: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t
Date: Mon, 30 Nov 2020 09:11:19 +0800
Message-Id: <fbcd54a3db79e85aa1180523ca2903bf03ff7462.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.8:

    52b840afae05 perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 41135c844af1165b1e74e8e2654784f3cd4def8b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.8.bb |  2 +-
 .../linux/linux-yocto-tiny_5.8.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 203ddf6684..c2d627acb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index f37f525cc3..31a84f3972 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "aa614dcf182db126013b255968ab125afd96eb88"
-SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemuarm ?= "3e9aa72b02cf7d04096e367c99d503cd1d26cc6c"
+SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c0cdffce73..c6fb9e9f86 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cd6c8c74317d2f9504c25e28e37f4140deec2d19"
-SRCREV_machine_qemuarm64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemumips ?= "c610a204d0821f5abc253e72894fd32b41b92db3"
-SRCREV_machine_qemuppc ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemuriscv64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemux86 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemux86-64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemumips64 ?= "86cc0d9a3f6751ada12fa4630b3e3c23221d6da7"
-SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemuarm ?= "0c6d276c75233f9b8d05103ff652676a2c271868"
+SRCREV_machine_qemuarm64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemumips ?= "4c07d59936f8e28eadecab8f56ef14726f77ccb8"
+SRCREV_machine_qemuppc ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemuriscv64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemux86 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemux86-64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemumips64 ?= "2224bf83cf372bb729583dfb93ad28abba9905fd"
+SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.28.0

