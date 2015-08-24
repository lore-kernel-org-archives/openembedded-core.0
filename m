Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 882BB76BF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:51:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7ODpTui005932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 06:51:29 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 06:51:29 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 09:51:23 -0400
Message-ID: <f15e79bac48a6c89b058d01c7d19e4888e295cbe.1440424002.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440424002.git.bruce.ashfield@windriver.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/4.1: update to v4.1.6 and v4.1.6-rt5
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
X-List-Received-Date: Mon, 24 Aug 2015 13:51:30 -0000
Content-Type: text/plain

Bumping the SRCREVs to import the latest 4.1-stable and 4.1-rt changes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 3473316d91eb..5c60875c7127 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
 SRCREV_meta ?= "833214b33303ecde02fdcd1a9bc7901ded6a7976"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.2"
+LINUX_VERSION ?= "4.1.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 105f31c90ae5..d79c78611109 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.2"
+LINUX_VERSION ?= "4.1.6"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
 SRCREV_meta ?= "833214b33303ecde02fdcd1a9bc7901ded6a7976"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index ecc72534292f..82511c8dfb76 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0352ebb49ba09bd09dee69d6df4af1388d3f4992"
-SRCREV_machine_qemuarm64 ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
-SRCREV_machine_qemumips ?= "46ec81f8b6d8f6c6906280651d2aa5e18d3bb63f"
-SRCREV_machine_qemuppc ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
-SRCREV_machine_qemux86 ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
-SRCREV_machine_qemux86-64 ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
-SRCREV_machine_qemumips64 ?= "9c23f12286ee4aafe695153f4ebf5b9d4cdfd909"
-SRCREV_machine ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine_qemuarm ?= "89601a6f23a7dd842f24911f0438d0b45c85aa00"
+SRCREV_machine_qemuarm64 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
+SRCREV_machine_qemumips ?= "4132a691d0908d10b8f07ce7ece02e6dc94e17bc"
+SRCREV_machine_qemuppc ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
+SRCREV_machine_qemux86 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
+SRCREV_machine_qemux86-64 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
+SRCREV_machine_qemumips64 ?= "033e1aa633465449edf544eb81adda0caf16ec60"
+SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
 SRCREV_meta ?= "833214b33303ecde02fdcd1a9bc7901ded6a7976"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.2"
+LINUX_VERSION ?= "4.1.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


