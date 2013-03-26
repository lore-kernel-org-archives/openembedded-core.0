Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UKVPl-0002Vx-9U
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 16:04:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QEknIs005927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 07:46:49 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 07:46:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Mar 2013 07:46:36 -0700
Message-ID: <3c3b98be91ebc7749c71b649e7aa6bfd333ef98b.1364308617.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364308617.git.bruce.ashfield@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/3.4: import v3.4.36 -stable fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
Content-Type: text/plain

Updating the 3.4 tree to import the korg -stable fixes for v3.4.36.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 65ebc46..42339a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.34"
+LINUX_VERSION ?= "3.4.36"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "96730f882e5b3f60d259ef41ed7c18c95512194a"
-SRCREV_machine_qemuppc ?= "9a013a2a1facf949d9f8cc1b2a291651235c75ea"
-SRCREV_meta ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine ?= "7302a8f84da657ff72ca5a27b9212c9d3bee2fbf"
+SRCREV_machine_qemuppc ?= "494b16c51c6f6dc272eb820eaa57028ca8ee9da2"
+SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 6c37b57..4b6b4a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.34"
+LINUX_VERSION ?= "3.4.36"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-SRCREV_meta ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
+SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 702008c..604aa48 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "c7cc288f0113433bd51d4958d36d4ef4bf13c214"
-SRCREV_machine_qemumips  ?= "d4f5af54aa6a3592c6b2656ef20ea98bee14fde9"
-SRCREV_machine_qemuppc ?= "8afd98bd2aae1ad86b97d4333107408745518f8d"
-SRCREV_machine_qemux86 ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-SRCREV_machine_qemux86-64 ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-SRCREV_machine ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-SRCREV_meta ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_qemuarm ?= "7cc80532306889b75619f8a1b713048e25f59e19"
+SRCREV_machine_qemumips  ?= "debce6677988e03b50c369aba5861d4f9b2e557d"
+SRCREV_machine_qemuppc ?= "ddbc382cbc45a009e9ce17f7d448fcfd050ab5fc"
+SRCREV_machine_qemux86 ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
+SRCREV_machine_qemux86-64 ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
+SRCREV_machine ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
+SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.34"
+LINUX_VERSION ?= "3.4.36"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



