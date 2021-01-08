Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kj+Vg6btLSsRzLk7ZVSRBcau9B1mkWeBMEU4c87ag4HnQ9PyJzBAaUKR2ItUVy+ZcnhCdh+0oa
 4CBwwtilGKqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613688"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613688"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:38 -0800
IronPort-SDR: MITOnNioG4dVifRVxQifdjaci8qiCSvX24Gu20L2MKEokINPB/sfcL7wXehTXwt5HVXzOPKGLF
 ndJ6tHD/8i5Q==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209444"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/30] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
Date: Fri,  8 Jan 2021 12:17:57 +0800
Message-Id: <6f20e6c12f0796dac088a249543d7945f76f0764.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration commit(s):

    72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d21c81b04142a48539b3262318860f2719c11ca)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d415c3c63a..8bc93bf438 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 033dfc76a2..f5f7c87a31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 33ca5856a3..3b462d5872 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 50cee07620..4afddae092 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 1a14c8bdb5..456875a7b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index af576891e2..3f94d22654 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.29.2

