Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1786FDEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLaw7012411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:36 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:28 -0400
Message-ID: <8cfd2b2f4088bc827ada38223a8b94229bab77fb.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/3.14: update to v3.14.13
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
X-List-Received-Date: Wed, 20 Aug 2014 16:21:53 -0000
Content-Type: text/plain

Updating from 3.14.5 -> 3.14.13 to pick up the latest series of korg
stable updates.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 4a91638c55b4..503185ee2d88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "9e6a44f2c638dc94692a8094eda3919cbc53cdb7"
-SRCREV_machine_qemuppc ?= "04464fbce3be9894f0752d3fbd5c1bf3fb14ebcf"
-SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
+SRCREV_machine ?= "5935fa1a250b3da3fe37297ce8bc9eb4f54438a6"
+SRCREV_machine_qemuppc ?= "36f6a51491f8f4c4bfc83800dae36f85b2bad922"
+SRCREV_meta ?= "3a897e59cb5de59e7fdaabdfa89db5da69966def"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.5"
+LINUX_VERSION ?= "3.14.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 8cc1d5660849..ffe198e58bc2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KBRANCH = "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.14.5"
+LINUX_VERSION ?= "3.14.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c1750e55eb751d4773ea4c3e924e1858feb15e4e"
-SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
+SRCREV_machine ?= "59ed057796efe35d264c2ebe4f79acdbe40026e5"
+SRCREV_meta ?= "3a897e59cb5de59e7fdaabdfa89db5da69966def"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 52ba9336dc16..e7a733cc91b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b91ab4c1bf0dccef4c93aeb184fca3a933682ba0"
-SRCREV_machine_qemumips ?= "1fdf6bfb5ecefccddead6e1d53b6e19d52da092e"
-SRCREV_machine_qemuppc ?= "8a44bd5e4fca2260d2e24e2cb4a5f276d000fae8"
-SRCREV_machine_qemux86 ?= "984636272f33a48803e1b0f8f48553894306b4e2"
-SRCREV_machine_qemux86-64 ?= "c1750e55eb751d4773ea4c3e924e1858feb15e4e"
-SRCREV_machine_qemumips64 ?= "a240524ebe0051faf7ada3cdb3241dda6d8d3ba3"
-SRCREV_machine ?= "c1750e55eb751d4773ea4c3e924e1858feb15e4e"
-SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
+SRCREV_machine_qemuarm ?= "c3aa4d4809315f226de525a20072d0055fbb2649"
+SRCREV_machine_qemumips ?= "40fb9a61f54d3090be4046d0fef3ea635f53023e"
+SRCREV_machine_qemuppc ?= "0fb630e8897fe7d4e8ddda667df5d5701b71c409"
+SRCREV_machine_qemux86 ?= "6fc66b1dbd642850474145f49b387e19be1e04c9"
+SRCREV_machine_qemux86-64 ?= "59ed057796efe35d264c2ebe4f79acdbe40026e5"
+SRCREV_machine_qemumips64 ?= "886a5a31a12305148b7e7cac1200b521eec3fdfc"
+SRCREV_machine ?= "59ed057796efe35d264c2ebe4f79acdbe40026e5"
+SRCREV_meta ?= "3a897e59cb5de59e7fdaabdfa89db5da69966def"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.5"
+LINUX_VERSION ?= "3.14.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


