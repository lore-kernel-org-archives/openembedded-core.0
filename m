Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5bmET+Vl0131gjPBNW29CeCdLkpOsShg0cZ+pIzmHoGJ/nuPpLyLqgJorbgOwMz/Jgc67Qe+3H
 6nKATGeJpSGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613703"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613703"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:44 -0800
IronPort-SDR: Rf4xOt3xdVKsID8la/YkpZyjcwwOZAOdQAL4x6dfuSWU4W/L63P6JGi75XIk8wQJ+jKENpqjPV
 wS8nQKIlGfOg==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209463"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:43 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/30] linux-yocto/5.8/cfg: fix -tiny warnings
Date: Fri,  8 Jan 2021 12:18:01 +0800
Message-Id: <ec3efb1fca933c0ae2dbe74238ba8cb966246995.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) for configuration tweaks:

    b976de4f41d drm: change CONFIG_DRM_KMS_HELPER to =m
    669f5aa3795 tiny: enable CONFIG_FW_LOADER on a per-BSP basis
    d94b2d9f137 i915: adust helper to 'm'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2c77a34d338d0347fb4206eb2185adc01e58416)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index fae984cd4e..d20b8b10ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
+SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index b98d99a81f..a5135155d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
+SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index a2dacb2676..f6ebefbf1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
+SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.29.2

