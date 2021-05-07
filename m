Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8BMntvTV1bSG2S3WZDt/NSQk9cQaqCf5W2WBaEmhy57HzHcG9Cg4hQNY24HQBaj395bwurkIE3
 xnyftPzqVlbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794736"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794736"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:07 -0700
IronPort-SDR: ZqQCAsnzn8G3RjKRfvKFCvNK05S95ccf9PBYXFOfjF3nqDZ8vOInGlteTwbHo3ZzxbuGVk6G9Q
 9oK8cIEVmcxQ==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331588"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/31] linux-yocto/5.10: qemuriscv32.cfg: RV32 only supports 1G physical memory
Date: Fri,  7 May 2021 15:02:24 +0800
Message-Id: <27f691faf496d67de99538ee19ce79edfb4cc192.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    a19886b00ea qemuriscv32.cfg: RV32 only supports 1G physical memory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 894f5328d395872f69bd48c59518bbafb7cbd61e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c491eed163..0902fe4fa1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "196677064883beeaacb68de437512a0e4ee07050"
-SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
+SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 0e3771461b..079f4a215e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "bcb76d132fb1e90f6db0a598b3c46b180a9b71ea"
 SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
+SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2221e99f3c..c8a2e3906f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
 SRCREV_machine_qemux86-64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
 SRCREV_machine_qemumips64 ?= "f89a64b85a068ac96ccd69f5170b2fbe957d4162"
 SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
+SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.30.2

