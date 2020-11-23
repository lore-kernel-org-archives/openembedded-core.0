Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RcCkWIW/ShzaJeexE2e8aol241UMvgemXVY5d/wisZIjiD/6tz6w/Fu37fPdHmwM7wkMsr5zp/
 3dD3jpRxtIFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920690"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920690"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:17 -0800
IronPort-SDR: 6Gxm7jP3ZkHOlYaRBVAPGumWnO2NOU04KMIdDQEjyd02DfjY3+fESPsa7CYmla8UVbCqk9yXJG
 5kVFz65ACkjw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475184"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:15 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/21] linux-yocto/5.8: config cleanup / warnings
Date: Mon, 23 Nov 2020 23:06:40 +0800
Message-Id: <f74584cfafccad63967ff8ae63bf3375f5e2c274.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to:

    d5ca337b7e9 bsp/mti-malta64: fix warning of CONFIG_SCSI_VIRTIO on qemumips64
    63c7a70c90f net/l2tp.cfg: fix CONFIG_PPPOL2TP mismatched warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc51dcff0b23827fc05a6203c889154616f48014)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 8b6a742834..d0f3ecb8c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
+SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 5045f6aa5a..536bc26c5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "c548e45d83f9cdf224d2a7e318d68aecf390f3bd"
 SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
+SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index d4f780ce44..c468170968 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
 SRCREV_machine_qemux86-64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
 SRCREV_machine_qemumips64 ?= "a92b9df163d6e6b05bf1e7137d6868760537f326"
 SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
+SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.28.0

