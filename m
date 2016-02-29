Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53145731F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1TMAaYB025669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 14:10:37 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:36 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:25 -0500
Message-ID: <d8cde7ceb6dc7647719701279421c986fbde3512.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 5/8] linux-yocto: braswell: Remove feature and move DRM_I915_PRELIMINARY_HW_SUPPORT option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 22:10:37 -0000
Content-Type: text/plain

From Cal:

  fixes the issue where Skylake doesn't have graphics support
  by default before kernel version 4.4, and also brings the kernel
  metadata closer together for intel-* and common-pc* BSPs.

[YOCTO 9#319]

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 8135d3ba24ca..33fbb45272ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "73c76150065091f6cc1751a3c8ec2d8a8cf8b6af"
-SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
+SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 29752413b930..65fc9ab94154 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "10a99cd2bfbbea9fa82b5a988eb8cb9c5f7b6600"
-SRCREV_meta ?= "39d849b041409ddd8fa4f8102f6adb2d57c1fb60"
+SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index e27c9dbfccea..c802df797f54 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "dd6492b44151164242718855d6c9eebbf0018eac"
-SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
+SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 71a64d87fe7d..0b2975c0e9b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
-SRCREV_meta ?= "39d849b041409ddd8fa4f8102f6adb2d57c1fb60"
+SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9ac098afd1a7..82cfb7422325 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
 SRCREV_machine_qemux86-64 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
 SRCREV_machine_qemumips64 ?= "4984422b4cd3deb6d68f46d010fb8eb007468677"
 SRCREV_machine ?= "dd6492b44151164242718855d6c9eebbf0018eac"
-SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
+SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 104fe664acd9..6645c98048fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
 SRCREV_machine_qemux86-64 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
 SRCREV_machine_qemumips64 ?= "de5aa76a9b909645533b44018bed0aa110e2dbd0"
 SRCREV_machine ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
-SRCREV_meta ?= "39d849b041409ddd8fa4f8102f6adb2d57c1fb60"
+SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


