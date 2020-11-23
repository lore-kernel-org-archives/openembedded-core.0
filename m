Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.36700.1606144036796152410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4xnNVlr0mXtRiYwhQ5LWEdJOM8Dhm0MwJU+lIqAIfgGMTUsnU4FdIaujs9NUZossRK/cUNk7Yr
 hwKovWWsGW8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="170996089"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="170996089"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:15 -0800
IronPort-SDR: J0U2Ln+M5CJaW4YlYhdGVlLWpReGb+o4xr2ArRuhs0IWQ1jwNjl1r4U/eyqTRtbgxpnL6+VzeH
 GHXU7EahgSyQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475177"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/21] linux-yocto/5.4: config cleanup / warnings
Date: Mon, 23 Nov 2020 23:06:39 +0800
Message-Id: <33edfd487088b674b1e512eaa33c43542a9d1441.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    eadca496e9f bsp/mti-malta64: fix warning of CONFIG_SCSI_VIRTIO on qemumips64
    203911bc035 net/l2tp.cfg: fix CONFIG_PPPOL2TP mismatched warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8df0a1f9607417f3f308b9ff852e287837b6cdf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 563f2d5b76..d7e0072a30 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "689799c6846313eb19566dd4afb69d30353dd351"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9f17d56b6a..44646ebd84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "f37a22c3ddab9db618ad302cce77825dae2cda87"
 SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index eb2793c9a2..dea2d515e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
 SRCREV_machine_qemux86-64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
 SRCREV_machine_qemumips64 ?= "536bda19159206ac7f60165f71bbf892cb8ad3fd"
 SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.28.0

