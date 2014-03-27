Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB9E46F8CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPJGX026218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:19 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:24:59 -0400
Message-ID: <c714f9ee332c980517fd989e86f0dcb35b25ab2d.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 04/13] linux-yocto/3.10: update to v3.10.33
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:28 -0000
Content-Type: text/plain

Updating to the latest -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index b1eea52c4242..8c9e81e912fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "5f466af88f885705efe0f018c027b2631f6724e4"
-SRCREV_machine_qemuppc ?= "e497cba7496e4ae6fc4d018bce57695a61766d22"
+SRCREV_machine ?= "adc7322e1696fd53f1915c40c87c98cf5c98ebf0"
+SRCREV_machine_qemuppc ?= "1d6cce881e4fefb5d5e0691da62d8f71f51e342c"
 SRCREV_meta ?= "284e9589436a5b199cf44b7261640c944558a35e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.32"
+LINUX_VERSION ?= "3.10.33"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index f7ce82e5bd74..c969461c8ffb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,11 +5,11 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.32"
+LINUX_VERSION ?= "3.10.33"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
+SRCREV_machine ?= "21df0c8486e129a4087970a07b423c533ae05de7"
 SRCREV_meta ?= "284e9589436a5b199cf44b7261640c944558a35e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 1f8d312ae2e0..4c7ddc95f76d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c295c53987007a5d0c87cc9b23125e9ff85900bd"
-SRCREV_machine_qemumips ?= "2833be8c96671b24a203a5dc45a21c38d5d841c3"
-SRCREV_machine_qemuppc ?= "cf413ddca8b974a473b72635e1499223a02d7949"
-SRCREV_machine_qemux86 ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
-SRCREV_machine_qemux86-64 ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
-SRCREV_machine_qemumips64 ?= "3e1899546c014808fed8d336b777bf8d81f50d7b"
-SRCREV_machine ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
+SRCREV_machine_qemuarm ?= "670a1d401ace1c5894a87466e5136ed60cf66966"
+SRCREV_machine_qemumips ?= "45fc480deb2f4e5b42265c59fa4bec784e995294"
+SRCREV_machine_qemuppc ?= "ac1c54b68ee44c00906933547b310652fd725d4b"
+SRCREV_machine_qemux86 ?= "21df0c8486e129a4087970a07b423c533ae05de7"
+SRCREV_machine_qemux86-64 ?= "21df0c8486e129a4087970a07b423c533ae05de7"
+SRCREV_machine_qemumips64 ?= "31139804e58e049e696fa49175544a43c40b3506"
+SRCREV_machine ?= "21df0c8486e129a4087970a07b423c533ae05de7"
 SRCREV_meta ?= "284e9589436a5b199cf44b7261640c944558a35e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.32"
+LINUX_VERSION ?= "3.10.33"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


