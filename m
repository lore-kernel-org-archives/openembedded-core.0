Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A63F72341
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGSOr028957
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:28 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:15 -0500
Message-ID: <55d2d3ad1ba91d7c2a5ce7dbc47492b3ef504944.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/3.10: update to v3.10.62
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
X-List-Received-Date: Wed, 10 Dec 2014 14:16:31 -0000
Content-Type: text/plain

Updating to the latest korg -stable update for the 3.10 series. Minor
merge conflict resolution was done with the standard/ltsi and
standard/preempt-rt branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 91b37d3c19ea..8acbd2e59b09 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "38885f87b7240587194597c3658ba2c0ac5960e7"
-SRCREV_machine_qemuppc ?= "535a7403beabe9c4aa394a1f9efa755eb33966c8"
-SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
+SRCREV_machine ?= "94a79d98e40b51466600fb3375ad2908c38dd192"
+SRCREV_machine_qemuppc ?= "c1dcbac7751652784f180fdb91f87bc37fba8c52"
+SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.59"
+LINUX_VERSION ?= "3.10.62"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index cc70388302fd..9ea81b8874f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.59"
+LINUX_VERSION ?= "3.10.62"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
+SRCREV_machine ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 043f2e0b23a8..978775a7d33d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "896f87d1003331d7a307c9f855cdbb78c9a2a033"
-SRCREV_machine_qemumips ?= "9e616945464ab97a050da96a025d88c809d05144"
-SRCREV_machine_qemuppc ?= "692b2de590668de2e15461879cf9301a0e6fedf6"
-SRCREV_machine_qemux86 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_machine_qemux86-64 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_machine_qemumips64 ?= "d237cab9f483ea512ded4ea311902763c1a3ae68"
-SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
+SRCREV_machine_qemuarm ?= "f6b075991c91b7c2bb641b389757863e2fd34b8c"
+SRCREV_machine_qemumips ?= "48afdc632312b6cc26fe7bca151cfb66b2ebc308"
+SRCREV_machine_qemuppc ?= "cf35ea9ac92153858dadd2f4ab71cccd3a1fa26b"
+SRCREV_machine_qemux86 ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_machine_qemux86-64 ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_machine_qemumips64 ?= "ebdb374ca5130ef456d0baf75b6fe7a242932d0d"
+SRCREV_machine ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.59"
+LINUX_VERSION ?= "3.10.62"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


