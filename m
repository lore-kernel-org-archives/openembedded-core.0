Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19D4C770A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 20:16:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t92KGpYl006350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Oct 2015 13:16:51 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 2 Oct 2015 13:16:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 2 Oct 2015 16:16:50 -0400
Message-ID: <1443817010-20551-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.1: drm/i915 backports
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
X-List-Received-Date: Fri, 02 Oct 2015 20:16:53 -0000
Content-Type: text/plain

Updating the SRCREVs to integrate the following backports:

  52a4a9f4a2b4 drm/i915/gen8: Initialize page tables
  a95cb62f8e85 drm/i915: Remove unnecessary gen8_ppgtt_unmap_pages
  a24d98fc488d drm/i915: Remove _entry from PPGTT page structures

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index e02c06b84d1b..32c9f86f2352 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "29257e529f968d17a5238624f27ddc76f759dc9d"
+SRCREV_machine ?= "8acaa791408f146069473a96e3d98bed8be86244"
 SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9fb5eb894b87..f289d37867a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.8"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
+SRCREV_machine ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
 SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index c310ab27fb08..e98f2dec1eb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c92614c6b90f8ab1202b20cc843a9782c9f8f8d5"
-SRCREV_machine_qemuarm64 ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
-SRCREV_machine_qemumips ?= "6b4b777e8467f01b00c4494ffedf1e9134bc52c5"
-SRCREV_machine_qemuppc ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
-SRCREV_machine_qemux86 ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
-SRCREV_machine_qemux86-64 ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
-SRCREV_machine_qemumips64 ?= "90222ca39af5a3252fcba24baec341140e9e7c07"
-SRCREV_machine ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
+SRCREV_machine_qemuarm ?= "187e28708b478b5d01a7df9e6410a340347e4819"
+SRCREV_machine_qemuarm64 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
+SRCREV_machine_qemumips ?= "dd6b1f0940dbffd5e0feef2beecbc89a25da8e8f"
+SRCREV_machine_qemuppc ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
+SRCREV_machine_qemux86 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
+SRCREV_machine_qemux86-64 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
+SRCREV_machine_qemumips64 ?= "8458e792e2c595f48bc5b2924e20e844f2a96522"
+SRCREV_machine ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
 SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


