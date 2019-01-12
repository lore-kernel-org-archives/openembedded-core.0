Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0C8A7C120
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:13:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0CID5wu024195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 12 Jan 2019 10:13:36 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 12 Jan 2019 10:13:21 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 12 Jan 2019 13:12:51 -0500
Message-ID: <a5bbd32ecd957f036a9b1e47cc4e3c813d206111.1547316462.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1547316462.git.bruce.ashfield@windriver.com>
References: <cover.1547316462.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.19: introduce qemuriscv64 and qemuarma15 BSP definitions
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
X-List-Received-Date: Sat, 12 Jan 2019 18:13:55 -0000
Content-Type: text/plain

Incorporating the BSP definitions for two new qemu targets.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index cdcdff2e1746..f823683526ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
-SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
+SRCREV_machine ?= "78404e3a73613f8e07c276e55112989f897cdd04"
+SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 89c4b9f14d4c..0a79f442a075 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
-SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
+SRCREV_machine_qemuarm ?= "2594d14d76ae2c49ad43b626662fe53da807ddca"
+SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
+SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index bf4fec71d86c..f410cc8cdb31 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ec8e55a97ad8a88107c5af069ece1b7f203f4ac4"
-SRCREV_machine_qemuarm64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_machine_qemumips ?= "3b5fba0207a870c1de76c5dd80d8d3c0e42aa1cf"
-SRCREV_machine_qemuppc ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
-SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
+SRCREV_machine_qemuarm ?= "8b378ac8aca51207085c8df616a6fe56af19f0b4"
+SRCREV_machine_qemuarm64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
+SRCREV_machine_qemumips ?= "58f59c2213a657515a158379db153ad618986235"
+SRCREV_machine_qemuppc ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
+SRCREV_machine_qemux86 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
+SRCREV_machine_qemux86-64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
+SRCREV_machine_qemumips64 ?= "6f56a58c214379efe8949da6921b1c00c2af353a"
+SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
+SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.5.0


