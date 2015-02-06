Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B447C72E46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t16GVBYp011222
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:11 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:11 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:03 -0500
Message-ID: <818f8c81ad1726417002e41f1ae4ffd3aa4b8f52.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/3.10: update to v3.10.65
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:12 -0000
Content-Type: text/plain

Integrating the latest korg -stable updates for 3.10 LTSI.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 8acbd2e59b09..36a00cf03b1a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "94a79d98e40b51466600fb3375ad2908c38dd192"
-SRCREV_machine_qemuppc ?= "c1dcbac7751652784f180fdb91f87bc37fba8c52"
-SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
+SRCREV_machine ?= "c75818e2932c3c0444ebebfcc0608fecf2440b92"
+SRCREV_machine_qemuppc ?= "fc7abf900967db5dea8a8f8648b8a0de7032f8d7"
+SRCREV_meta ?= "d5456dd830cad14bd844753b751b83744ced3793"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.62"
+LINUX_VERSION ?= "3.10.65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 9ea81b8874f8..3248c4414b42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.62"
+LINUX_VERSION ?= "3.10.65"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
-SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
+SRCREV_machine ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
+SRCREV_meta ?= "d5456dd830cad14bd844753b751b83744ced3793"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 978775a7d33d..d3cb81662e98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f6b075991c91b7c2bb641b389757863e2fd34b8c"
-SRCREV_machine_qemumips ?= "48afdc632312b6cc26fe7bca151cfb66b2ebc308"
-SRCREV_machine_qemuppc ?= "cf35ea9ac92153858dadd2f4ab71cccd3a1fa26b"
-SRCREV_machine_qemux86 ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
-SRCREV_machine_qemux86-64 ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
-SRCREV_machine_qemumips64 ?= "ebdb374ca5130ef456d0baf75b6fe7a242932d0d"
-SRCREV_machine ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
-SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
+SRCREV_machine_qemuarm ?= "7a8c197b86281f9a445e23378fdfeeb4da0c48e9"
+SRCREV_machine_qemumips ?= "926e71942842a9d1a9f64aae0458b2d777d3bca9"
+SRCREV_machine_qemuppc ?= "65648fce58a5e095cfe2bf394bc0f6200efb281c"
+SRCREV_machine_qemux86 ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
+SRCREV_machine_qemux86-64 ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
+SRCREV_machine_qemumips64 ?= "06d173388a171e7371816d74567fdec994925aa4"
+SRCREV_machine ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
+SRCREV_meta ?= "d5456dd830cad14bd844753b751b83744ced3793"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.62"
+LINUX_VERSION ?= "3.10.65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


