Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D11C65F28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:08:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAGsm016790
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:17 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:10 -0400
Message-ID: <9c982d0a9a463b5dfda36a4667d109454f852536.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399297986.git.bruce.ashfield@windriver.com>
References: <cover.1399297986.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/3.10: update to v3.10.38
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
X-List-Received-Date: Mon, 05 May 2014 15:08:26 -0000
Content-Type: text/plain

Updating to the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 4087d02f6ba5..ff1e13fe64f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "d1e73a1e09f9641c44e7d713d1a6b5b088411459"
-SRCREV_machine_qemuppc ?= "9a34d9c957e69f28e89e879d9dd6e8fe5c7270c5"
-SRCREV_meta ?= "7df9ef8ee47dc9023044614210f4c1d9d916dd5f"
+SRCREV_machine ?= "8aa9023c5e2e2ca4180e971da9a2c139d5b3c79e"
+SRCREV_machine_qemuppc ?= "3dd7fd5d191245ab92889e69060ff732bdec770b"
+SRCREV_meta ?= "1eb79862c2959cfa305773e7f785d6d1810bf190"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.35"
+LINUX_VERSION ?= "3.10.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 099655f381e3..57f12fe9ecdc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.35"
+LINUX_VERSION ?= "3.10.38"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
-SRCREV_meta ?= "7df9ef8ee47dc9023044614210f4c1d9d916dd5f"
+SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
+SRCREV_meta ?= "1eb79862c2959cfa305773e7f785d6d1810bf190"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 89263d98b91e..f6e05c2c6edf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7b466aae62395490769f96635bd077ee8f313f18"
-SRCREV_machine_qemumips ?= "cc5059ae360e0586375bbd1ed46e1e6f3e267dea"
-SRCREV_machine_qemuppc ?= "663a3068c9756137a84bbfb3a76eeae7cb4373e1"
-SRCREV_machine_qemux86 ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
-SRCREV_machine_qemux86-64 ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
-SRCREV_machine_qemumips64 ?= "a1491c3b367a75c7003b2fb58706e3631413b337"
-SRCREV_machine ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
-SRCREV_meta ?= "7df9ef8ee47dc9023044614210f4c1d9d916dd5f"
+SRCREV_machine_qemuarm ?= "dd18759fd19771885589066811e254852e56d421"
+SRCREV_machine_qemumips ?= "2dbb607d161aeaa8d542b128203d7a10527aec7e"
+SRCREV_machine_qemuppc ?= "92dda91b216cbacfa71fd9036413dba0d2406332"
+SRCREV_machine_qemux86 ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
+SRCREV_machine_qemux86-64 ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
+SRCREV_machine_qemumips64 ?= "ebd521c1b609b445d8baf522d71453d4c26a0440"
+SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
+SRCREV_meta ?= "1eb79862c2959cfa305773e7f785d6d1810bf190"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.35"
+LINUX_VERSION ?= "3.10.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


