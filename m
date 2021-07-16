Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494597"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494597"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075443"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/28] linux-yocto/5.10: scsi-debug needs scsi-disk
Date: Fri, 16 Jul 2021 10:42:06 +0800
Message-Id: <8160aa87e23d2b541b64d6cd84f3a02aba1ac8cb.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was pointed out that the default scsi-debug feature didn't behave
the same as other distros, since it doesn't have disk supporrt enabled.
We already have a disk.cfg for scsi so we include it into the debug
fragment to get the support we want.

Integrating the following commit(s) to linux-yocto/.:

    66a4b5fc619 scsi: debug needs disk support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c3ca417a7e9e3c670f1cbff2352c8761b60caff)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1c5bb9753c..e0d8280128 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "42032770803ba26765376967cef09945f48abe04"
-SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
+SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bdc49fb9e2..6b71573a39 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "eaad1adbc817d996edf44fdd520da4810e57e66d"
 SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
+SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index abe837c2f4..0315808989 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
 SRCREV_machine_qemux86-64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
 SRCREV_machine_qemumips64 ?= "1112c8f8594df02dd6f2bd1cf13848536ca3f536"
 SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
+SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.31.1

