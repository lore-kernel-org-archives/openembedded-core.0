Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B98EE7828E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:10:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4QKAssV011909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 May 2017 13:10:54 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 26 May 2017 13:10:53 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 May 2017 16:10:46 -0400
Message-ID: <4121fb9febb4932b9544aa8925d2b690d5f19d24.1495829213.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1495829213.git.bruce.ashfield@windriver.com>
References: <cover.1495829213.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kernel/meta: add virtualbox configuration fragment
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
X-List-Received-Date: Fri, 26 May 2017 20:10:53 -0000
Content-Type: text/plain

As suggested by Khem, we can create a virtualbox configuration
fragment that helps to run XFCE under virtualization.

This can be enabled via KERNEL_FEATURES for targest that
require it, and may be enabled by default in the future.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index d69b9ade2ce1..2df6d3fee964 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ec0bfadaeac24cc63fa05521c6608b79b26a5e5d"
-SRCREV_meta ?= "82aa97b3ebb3cd7eec8296a7cb090dfc67c2d382"
+SRCREV_meta ?= "c55c877244b49a12c7f1bcf7e05d44e64e10046f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index e6890e3497b4..fc235c98d435 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "21488a58127eebac2b6b656305aa0fb695e46c50"
+SRCREV_meta ?= "79a4c1b415207961ba47c5d58f7625000218e98b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 061ada0d35e8..3946e1d89b8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "cb23b8e3ce0ad77acb717e249b4821c8350f1c83"
-SRCREV_meta ?= "9d268bd8a8f0e01de550aef730e639bd6b148132"
+SRCREV_meta ?= "877a7cd7da402200aab62dcc8583134d0947fa30"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index fa1263d817ad..c87c01c19337 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "095698fd99b452d95188ff6f2cce3df5127beb5c"
-SRCREV_meta ?= "5fd0435f4d40c03bc5a06389d22dbafd5086e7ab"
+SRCREV_meta ?= "fcc729412013996e17f7aa3953b21cb0a1521108"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index f7c969a1bece..b77b7ff9d4a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_meta ?= "82aa97b3ebb3cd7eec8296a7cb090dfc67c2d382"
+SRCREV_meta ?= "c55c877244b49a12c7f1bcf7e05d44e64e10046f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index d61a1ee97df0..21ca972e252a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "21488a58127eebac2b6b656305aa0fb695e46c50"
+SRCREV_meta ?= "79a4c1b415207961ba47c5d58f7625000218e98b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 8bc8b5774300..0bc9205c2441 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_meta ?= "9d268bd8a8f0e01de550aef730e639bd6b148132"
+SRCREV_meta ?= "877a7cd7da402200aab62dcc8583134d0947fa30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index a55decae84e2..919a25847cd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "5fd0435f4d40c03bc5a06389d22dbafd5086e7ab"
+SRCREV_meta ?= "fcc729412013996e17f7aa3953b21cb0a1521108"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index c6cdcab95030..9a2bf15425b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
 SRCREV_machine_qemux86-64 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
 SRCREV_machine_qemumips64 ?= "59727538774860381f42bcfb6ec05fe21facd319"
 SRCREV_machine ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_meta ?= "82aa97b3ebb3cd7eec8296a7cb090dfc67c2d382"
+SRCREV_meta ?= "c55c877244b49a12c7f1bcf7e05d44e64e10046f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 1c35ebe4b749..cbcd38e6d4d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
 SRCREV_machine_qemux86-64 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
 SRCREV_machine_qemumips64 ?= "229abf6f63652058db1308a0c07e59652d3e6a23"
 SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "21488a58127eebac2b6b656305aa0fb695e46c50"
+SRCREV_meta ?= "79a4c1b415207961ba47c5d58f7625000218e98b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 9406a05e2ed1..589531866749 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
 SRCREV_machine_qemux86-64 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
 SRCREV_machine_qemumips64 ?= "a9b8241a0c0e7626baba529abb4940831ff3a83e"
 SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_meta ?= "9d268bd8a8f0e01de550aef730e639bd6b148132"
+SRCREV_meta ?= "877a7cd7da402200aab62dcc8583134d0947fa30"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 5d73cfeb1894..b986d11c3226 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
 SRCREV_machine_qemux86-64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
 SRCREV_machine_qemumips64 ?= "bfdb9d2cf36f5ded1cd8d03e58465d9f6250bba8"
 SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "5fd0435f4d40c03bc5a06389d22dbafd5086e7ab"
+SRCREV_meta ?= "fcc729412013996e17f7aa3953b21cb0a1521108"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


