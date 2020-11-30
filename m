Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eUAvnHH6lqOjL1yHbBR+N3YBW73AM/hoMUVqdHUrzmfFJEAp8mi3ORlu4QE1mhYBhqqg1FUAiM
 I8i+fWoCBm1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004365"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:55 -0800
IronPort-SDR: 6lVR55R63k6DOwD84bmJwynaNOtSvCL5F5nwWnbEBAVKMKJvvl/6iU4xVNlQvU/6mfVO0uDY4A
 YPNnS/VvIAlQ==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302629"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:53 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/21] linux-yocto/5.8: ext4/tipc warning fixups
Date: Mon, 30 Nov 2020 09:11:20 +0800
Message-Id: <234c8101d642120b08b369d305914b1560f140db.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.8:

    3c5d210805d6 tipc: fix -Wstringop-truncation warnings
    cc89fd77c248 ext4: fix -Wstringop-truncation warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45a229f84fe71b251530bb182c1ad03a88f592a8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.8.bb |  2 +-
 .../linux/linux-yocto-tiny_5.8.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index c2d627acb7..033dfc76a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 31a84f3972..50cee07620 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3e9aa72b02cf7d04096e367c99d503cd1d26cc6c"
-SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
+SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c6fb9e9f86..af576891e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0c6d276c75233f9b8d05103ff652676a2c271868"
-SRCREV_machine_qemuarm64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemumips ?= "4c07d59936f8e28eadecab8f56ef14726f77ccb8"
-SRCREV_machine_qemuppc ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemuriscv64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemux86 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemux86-64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemumips64 ?= "2224bf83cf372bb729583dfb93ad28abba9905fd"
-SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemuarm ?= "14b463d0e5c1e2ff354244420f9bbc7f0ab80533"
+SRCREV_machine_qemuarm64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemumips ?= "8d8d9afb396f154f366f32948fdff3cf4e269841"
+SRCREV_machine_qemuppc ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemuriscv64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
+SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.28.0

