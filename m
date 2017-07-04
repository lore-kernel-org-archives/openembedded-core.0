Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2FEF60119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 03:06:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6436JYW010466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 3 Jul 2017 20:06:19 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 3 Jul 2017 20:06:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Jul 2017 23:06:15 -0400
Message-ID: <5e5327f15c904347c7b20743de24d3123597c151.1499137428.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1499137428.git.bruce.ashfield@windriver.com>
References: <cover.1499137428.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kernel-yocto/meta: smp configuration changes
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
X-List-Received-Date: Tue, 04 Jul 2017 03:06:20 -0000
Content-Type: text/plain

Integrating the following kernel configuration changes to
clean up the SMP configuration fragments and fix a configuration
audit warning.

  d0e5ea0e199b smp: Separate smp into 32 and 64 bit versions to avoid kernel warnings
  f1369c1d817e bsp/mohonpeak: smp gets added by default, remove unnecessary include
  6fc22aa1200b bsp/rangeley: smp gets added by default, remove unnecessary include

[YOCTO #11743]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index f25974cb6895..e804d8953397 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "4b89f331d4220f6f62d20ef60aa59edcd9b44106"
+SRCREV_meta ?= "e92bd55409a6ded89642f5ac22391487364ac798"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 4ad799058b9a..f423604f663f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b0b44854bfb7f7ea10890ab8d8fff936be7e37da"
-SRCREV_meta ?= "c3f8900923a7b56ea6231d31a1a4e81306156dc5"
+SRCREV_meta ?= "d0e5ea0e199b591cc7588dc80b6ec07ea05f74b8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 3bfa24b0c98b..f0e9180ac13c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ab749ed8fd7beb6c63ec62a808eac8678db83810"
-SRCREV_meta ?= "60dd89e2423aaa2e7be680db09be43d1f47471e0"
+SRCREV_meta ?= "299f12a06ca1d6fd90b24450dae3b9f257a536be"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index 2e98914abb7b..f58799be9139 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "4b89f331d4220f6f62d20ef60aa59edcd9b44106"
+SRCREV_meta ?= "e92bd55409a6ded89642f5ac22391487364ac798"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 3f987a905173..868e70edc45a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_meta ?= "c3f8900923a7b56ea6231d31a1a4e81306156dc5"
+SRCREV_meta ?= "d0e5ea0e199b591cc7588dc80b6ec07ea05f74b8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 8041c5f77130..482e38c8ce8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_meta ?= "60dd89e2423aaa2e7be680db09be43d1f47471e0"
+SRCREV_meta ?= "299f12a06ca1d6fd90b24450dae3b9f257a536be"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index fa85b21d4bd8..f3966d4fa588 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
 SRCREV_machine_qemux86-64 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
 SRCREV_machine_qemumips64 ?= "b442c964432938cbe10c4cc578260353045af980"
 SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "4b89f331d4220f6f62d20ef60aa59edcd9b44106"
+SRCREV_meta ?= "e92bd55409a6ded89642f5ac22391487364ac798"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 2643415429d9..48f4e94640e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
 SRCREV_machine_qemux86-64 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
 SRCREV_machine_qemumips64 ?= "dfd0bad7365562bf39b16630c59dcb4b18a09396"
 SRCREV_machine ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_meta ?= "c3f8900923a7b56ea6231d31a1a4e81306156dc5"
+SRCREV_meta ?= "d0e5ea0e199b591cc7588dc80b6ec07ea05f74b8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index ba43d5aabe61..acfae37fb631 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
 SRCREV_machine_qemux86-64 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
 SRCREV_machine_qemumips64 ?= "5b396803703aa5c1bd1e6f5cc7ac02de05cd0d08"
 SRCREV_machine ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_meta ?= "60dd89e2423aaa2e7be680db09be43d1f47471e0"
+SRCREV_meta ?= "299f12a06ca1d6fd90b24450dae3b9f257a536be"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


