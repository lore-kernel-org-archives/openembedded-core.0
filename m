Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0946D70100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u44HrL5a027113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 May 2016 10:53:21 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:08 -0400
Message-ID: <d27a64e0953406ad02d87e3ebccad642b83afb67.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] linux-yocto/4.1: update to v4.1.22
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
X-List-Received-Date: Wed, 04 May 2016 17:53:22 -0000
Content-Type: text/plain

Integrating the korg -stable releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index bf69ab7f0883..8d02a909595a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "d62fce1a7030dd2bc9db1f058d95dbac5fce85da"
+SRCREV_machine ?= "1947ac40bb819120f1e0dff6ae281cc024ce77bb"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.18"
+LINUX_VERSION ?= "4.1.22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 71b18cb4d781..1bbfff28a469 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.18"
+LINUX_VERSION ?= "4.1.22"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
+SRCREV_machine ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b227d767e673..e61f5b11f909 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0151a12b692fe02660a7bcf1edda81b2468c016b"
-SRCREV_machine_qemuarm64 ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
-SRCREV_machine_qemumips ?= "ea167e2fdb145ef2bccd79234ac43ac3fee0fb67"
-SRCREV_machine_qemuppc ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
-SRCREV_machine_qemux86 ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
-SRCREV_machine_qemux86-64 ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
-SRCREV_machine_qemumips64 ?= "5b8d8e6d06206f59662075f74126352a500df106"
-SRCREV_machine ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
+SRCREV_machine_qemuarm ?= "aea95f103a4f5fccc342bb763af9cfba0623fccc"
+SRCREV_machine_qemuarm64 ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
+SRCREV_machine_qemumips ?= "df85b27d70cb259662a00f5ad860eb3deba63b7f"
+SRCREV_machine_qemuppc ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
+SRCREV_machine_qemux86 ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
+SRCREV_machine_qemux86-64 ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
+SRCREV_machine_qemumips64 ?= "d371bd9361507ef0b03544f2190a63211fe31c87"
+SRCREV_machine ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.18"
+LINUX_VERSION ?= "4.1.22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


