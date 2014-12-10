Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEFA87258B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:38:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAculb005888
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:38:56 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:38:56 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:38:43 -0500
Message-ID: <b42ce5836946575e9b8e2f1ff5cea7c875d9b1d7.1418207729.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207729.git.bruce.ashfield@windriver.com>
References: <cover.1418207729.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/3.10: update to v3.10.59
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
X-List-Received-Date: Wed, 10 Dec 2014 10:39:03 -0000
Content-Type: text/plain

Updating to the latest 3.10 -korg stable update. We also bring in a meta
change for the valley island IO configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index ad55a2ed8082..91b37d3c19ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "cbaa8c8b83a7da70b94cc6cc1a25090071af4c3f"
-SRCREV_machine_qemuppc ?= "41338ab2a1c19435e24bbd162ff6b3f8b90d7afa"
-SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
+SRCREV_machine ?= "38885f87b7240587194597c3658ba2c0ac5960e7"
+SRCREV_machine_qemuppc ?= "535a7403beabe9c4aa394a1f9efa755eb33966c8"
+SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.55"
+LINUX_VERSION ?= "3.10.59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 9e33aa692b63..cc70388302fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.55"
+LINUX_VERSION ?= "3.10.59"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
+SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index e612d36e28d0..043f2e0b23a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9c8da40f662806406940decf972841c1b86895a5"
-SRCREV_machine_qemumips ?= "96adff9ce54c009ba90c3ddcaa6d16beb7a9c2b3"
-SRCREV_machine_qemuppc ?= "cf3a9a021e2abb3b19807b2ba3c29c1d0918730b"
-SRCREV_machine_qemux86 ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_machine_qemux86-64 ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_machine_qemumips64 ?= "89ab3082e01c4d98f9d14630aa904dba641c5373"
-SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
+SRCREV_machine_qemuarm ?= "896f87d1003331d7a307c9f855cdbb78c9a2a033"
+SRCREV_machine_qemumips ?= "9e616945464ab97a050da96a025d88c809d05144"
+SRCREV_machine_qemuppc ?= "692b2de590668de2e15461879cf9301a0e6fedf6"
+SRCREV_machine_qemux86 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_machine_qemux86-64 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_machine_qemumips64 ?= "d237cab9f483ea512ded4ea311902763c1a3ae68"
+SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.55"
+LINUX_VERSION ?= "3.10.59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


