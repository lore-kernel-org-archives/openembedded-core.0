Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C286C724DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:49:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAno3X008068
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:49:50 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:49:49 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 10 Dec 2014 05:49:42 -0500
Message-ID: <4dc8b61b082a8026119173f0b766c4bbacdbd640.1418208337.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418208337.git.bruce.ashfield@windriver.com>
References: <cover.1418208337.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4][daisy] linux-yocto/3.14: update to v3.14.4
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
X-List-Received-Date: Wed, 10 Dec 2014 10:49:53 -0000
Content-Type: text/plain

Bumping the 3.14 recipes to the latest korg -stable release.

(From OE-Core rev: 5c0088767a59c63d2197b54450a54578fa10fa07)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index c7b74d661d33..a8e344728d8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "c88f5ec9b328da501be970b814fbc9cc4a09fa4f"
-SRCREV_machine_qemuppc ?= "05629993752031b9de3f4792cfbd98caf60593da"
-SRCREV_meta ?= "4df1e2ed992adeac4da60ad5118d0237e8cb88df"
+SRCREV_machine ?= "00343b1573f3392688ddceac0b3da0d307ab81b9"
+SRCREV_machine_qemuppc ?= "c7eae6cfd7bbe69d2340c6fd6bf35fbca88706c4"
+SRCREV_meta ?= "6fe191e807c9f6f3df57a72c5fc2ffb147f3129a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.2"
+LINUX_VERSION ?= "3.14.4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 2110e8a45ec0..626add9dc303 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KBRANCH = "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.14.2"
+LINUX_VERSION ?= "3.14.4"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "b0b9c962ea01f9356fc1542b9696ebe4a38e196a"
-SRCREV_meta ?= "4df1e2ed992adeac4da60ad5118d0237e8cb88df"
+SRCREV_machine ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
+SRCREV_meta ?= "6fe191e807c9f6f3df57a72c5fc2ffb147f3129a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 5271bb016356..1179640b005a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "54ecc26cb84e939753eee811395435f8a4377c86"
-SRCREV_machine_qemumips ?= "cc7b8670680fcd794dba0b21a1db1dbbda432924"
-SRCREV_machine_qemuppc ?= "5ac4b714c656323b6099e8ab435fc05903d69874"
-SRCREV_machine_qemux86 ?= "3904476fb890e014a244e1fc48342683d7ff7e0e"
-SRCREV_machine_qemux86-64 ?= "b0b9c962ea01f9356fc1542b9696ebe4a38e196a"
-SRCREV_machine_qemumips64 ?= "a9c251d64f5df58c41473ccb1d52143cc5247911"
-SRCREV_machine ?= "b0b9c962ea01f9356fc1542b9696ebe4a38e196a"
-SRCREV_meta ?= "4df1e2ed992adeac4da60ad5118d0237e8cb88df"
+SRCREV_machine_qemuarm ?= "9882294294f307dc52c29e5dbb24d7f9a2f5a635"
+SRCREV_machine_qemumips ?= "94e2f8429bcc953cb0df499446b847ba67a0f334"
+SRCREV_machine_qemuppc ?= "2795a4d16724b41fbcd62c2f9f56c427d1ce3797"
+SRCREV_machine_qemux86 ?= "4aa41764bf8dba2044ff9fae806d61cac7cdd9de"
+SRCREV_machine_qemux86-64 ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
+SRCREV_machine_qemumips64 ?= "342ccacd4e28d1cc7e30277ee4ac6caa3086ff2f"
+SRCREV_machine ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
+SRCREV_meta ?= "6fe191e807c9f6f3df57a72c5fc2ffb147f3129a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.2"
+LINUX_VERSION ?= "3.14.4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


