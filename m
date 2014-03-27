Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A06A66F877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPLT2026221
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:21 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:25:01 -0400
Message-ID: <dbba77d5012c3e06eb5bee6fd412fdb74b930d91.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 06/13] linux-yocto/3.10: update to v3.10.34
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:22 -0000
Content-Type: text/plain

Updating to the latest korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index abacb8edf548..98f4936c873f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "adc7322e1696fd53f1915c40c87c98cf5c98ebf0"
-SRCREV_machine_qemuppc ?= "1d6cce881e4fefb5d5e0691da62d8f71f51e342c"
-SRCREV_meta ?= "99c503a92885060bebf2bba6747735e8e9346a40"
+SRCREV_machine ?= "f121a3aa028df37b8050779adaa239d29aaa2edd"
+SRCREV_machine_qemuppc ?= "7172d3cbc73584e724b61ef5d13fc3519720f4c0"
+SRCREV_meta ?= "cce9fc32c10dc875bf1ae0a4a86fe3ce79138f5a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.33"
+LINUX_VERSION ?= "3.10.34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index abb53e81d42a..bb41ef2b1691 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.33"
+LINUX_VERSION ?= "3.10.34"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "21df0c8486e129a4087970a07b423c533ae05de7"
-SRCREV_meta ?= "99c503a92885060bebf2bba6747735e8e9346a40"
+SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
+SRCREV_meta ?= "cce9fc32c10dc875bf1ae0a4a86fe3ce79138f5a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 08b7087d6718..2586ffc0d5d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "670a1d401ace1c5894a87466e5136ed60cf66966"
-SRCREV_machine_qemumips ?= "45fc480deb2f4e5b42265c59fa4bec784e995294"
-SRCREV_machine_qemuppc ?= "ac1c54b68ee44c00906933547b310652fd725d4b"
-SRCREV_machine_qemux86 ?= "21df0c8486e129a4087970a07b423c533ae05de7"
-SRCREV_machine_qemux86-64 ?= "21df0c8486e129a4087970a07b423c533ae05de7"
-SRCREV_machine_qemumips64 ?= "31139804e58e049e696fa49175544a43c40b3506"
-SRCREV_machine ?= "21df0c8486e129a4087970a07b423c533ae05de7"
-SRCREV_meta ?= "99c503a92885060bebf2bba6747735e8e9346a40"
+SRCREV_machine_qemuarm ?= "e18e8c2c7cad913a25342f9f860eeeefce24b8aa"
+SRCREV_machine_qemumips ?= "6f191aaecfdbebda450cec4a1f30fb0d1a2ed889"
+SRCREV_machine_qemuppc ?= "ba2e16160c7f910de432511ca0008101a7b2263b"
+SRCREV_machine_qemux86 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
+SRCREV_machine_qemux86-64 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
+SRCREV_machine_qemumips64 ?= "e05f0378e9c21d689eed8aacb306d2c1a044e0d0"
+SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
+SRCREV_meta ?= "cce9fc32c10dc875bf1ae0a4a86fe3ce79138f5a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.33"
+LINUX_VERSION ?= "3.10.34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


