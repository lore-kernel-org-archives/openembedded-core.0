Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6639C7E816
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 07:50:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5I7nwAP007501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2019 00:50:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 18 Jun 2019 00:49:47 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
Date: Tue, 18 Jun 2019 15:49:46 +0800
Message-ID: <1560844186-105711-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kernel: qemuarmv5: Update machine overrides of KERNEL_DEVICETREE
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
X-List-Received-Date: Tue, 18 Jun 2019 07:50:33 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The original BSP qemuarm has been renamed to qemuarmv5. Update the machine
overrides accordingly to avoid not generating dtb.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 1 -
 7 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 3a055c1..8c83620 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -41,7 +41,7 @@ DEPENDS += "openssl-native util-linux-native"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 0836dc7..a4facfe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -33,7 +33,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index b5e415f..8bd9d74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -33,7 +33,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 4ca11d7..e668854 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -29,4 +29,4 @@ COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
 # Functionality flags
 KERNEL_FEATURES = ""
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index a9c463c..226a90c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -29,4 +29,4 @@ COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
 # Functionality flags
 KERNEL_FEATURES = ""
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index cda4ecf..014d689 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -36,7 +36,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 8aec315..bb7ed56 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -38,7 +38,6 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-- 
2.7.4


