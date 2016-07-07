Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B522F73175
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:39:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u67IdFlJ000006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jul 2016 11:39:15 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Jul 2016 11:39:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 Jul 2016 14:39:08 -0400
Message-ID: <2d632f93d89f9fb6d0146d2e1f9434c22363d3fc.1467916601.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467916601.git.bruce.ashfield@windriver.com>
References: <cover.1467916601.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/4.1: update to 4.1.27
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
X-List-Received-Date: Thu, 07 Jul 2016 18:39:15 -0000
Content-Type: text/plain

Integrating the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 858518baa0f7..7f2e31d57884 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6d00f6d73a3268e99092096a3f5699c57370ece0"
-SRCREV_meta ?= "0845ec79bc2fbc45efcf4c44138fd698039960c5"
+SRCREV_machine ?= "dc71da8bddd86d34896d97291e0d84c29fe4806d"
+SRCREV_meta ?= "672a86bd4bac288b4cc222112d3826837181583b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.26"
+LINUX_VERSION ?= "4.1.27"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index a062272c3d46..1ea77a4f8aa9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.26"
+LINUX_VERSION ?= "4.1.27"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
-SRCREV_meta ?= "0845ec79bc2fbc45efcf4c44138fd698039960c5"
+SRCREV_machine ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_meta ?= "672a86bd4bac288b4cc222112d3826837181583b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 49adad0fd15e..5004fb5d897d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "494bf106c15685dafa318f418ce86228728006f1"
-SRCREV_machine_qemuarm64 ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
-SRCREV_machine_qemumips ?= "3d9c0d5f502f7ae6f74766b2e9980df2cf5f661c"
-SRCREV_machine_qemuppc ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
-SRCREV_machine_qemux86 ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
-SRCREV_machine_qemux86-64 ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
-SRCREV_machine_qemumips64 ?= "6c9b0acfa18a1c86da12ae17da643cde03dd82cd"
-SRCREV_machine ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
-SRCREV_meta ?= "0845ec79bc2fbc45efcf4c44138fd698039960c5"
+SRCREV_machine_qemuarm ?= "f217a40e5b17deb87ed3859b29b1c355e3bb4abc"
+SRCREV_machine_qemuarm64 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_machine_qemumips ?= "7f1ea2fe2cf42f117c37cd174236e07eba576382"
+SRCREV_machine_qemuppc ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_machine_qemux86 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_machine_qemux86-64 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_machine_qemumips64 ?= "7d7a10a3c4465eca0e0879b3596da9b013ed3bb8"
+SRCREV_machine ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_meta ?= "672a86bd4bac288b4cc222112d3826837181583b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.26"
+LINUX_VERSION ?= "4.1.27"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


