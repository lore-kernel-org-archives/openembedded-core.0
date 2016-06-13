Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A310F602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:56:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5DFud5c024795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 08:56:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 13 Jun 2016 08:56:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Jun 2016 11:56:32 -0400
Message-ID: <d0930779c2d1a4686e5307986b67495743c4e584.1465833140.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465833140.git.bruce.ashfield@windriver.com>
References: <cover.1465833140.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/4.4: update to v4.4.13
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
X-List-Received-Date: Mon, 13 Jun 2016 15:56:39 -0000
Content-Type: text/plain

Integrating the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index b887bf49262c..03380e07e379 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,12 +12,12 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
+SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.12"
+LINUX_VERSION ?= "4.4.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 0186856b8595..23188a5371ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.12"
+LINUX_VERSION ?= "4.4.13"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
-SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
+SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 48f997353c17..d69ecec90d55 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ae04be16985c86803d8016b06aa57c02fe63cab3"
-SRCREV_machine_qemuarm64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
-SRCREV_machine_qemumips ?= "1d16db0bce02f4f46a925e5425194de8d25a926e"
-SRCREV_machine_qemuppc ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
-SRCREV_machine_qemux86 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
-SRCREV_machine_qemux86-64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
-SRCREV_machine_qemumips64 ?= "6fe42d5321cd24411c2a4b7f2aac8a01dfa82b8f"
-SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
-SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
+SRCREV_machine_qemuarm ?= "cdfdcbd7ee553dc2e483813054a378ef9eaa44b6"
+SRCREV_machine_qemuarm64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_machine_qemumips ?= "b1f51ad1d4e95be437bf7725e094d6ad1b8286b0"
+SRCREV_machine_qemuppc ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_machine_qemux86 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_machine_qemux86-64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_machine_qemumips64 ?= "4b17815085dbd2a0408d7969bf4689a4c2b12942"
+SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.12"
+LINUX_VERSION ?= "4.4.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


