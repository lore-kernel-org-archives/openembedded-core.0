Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UF3xV-0000Ju-IV
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:44:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BERYxa008900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 07:27:34 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 07:27:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 10:27:12 -0400
Message-ID: <acaa667b2553bcae55ec4e5386efccb417345dcd.1363011775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363011775.git.bruce.ashfield@windriver.com>
References: <cover.1363011775.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.4: update to v3.4.34 and LTSI refresh
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
X-List-Received-Date: Mon, 11 Mar 2013 14:44:26 -0000
Content-Type: text/plain

Updating the 3.4 SRCREVs to incorporate the -stable release of 3.4.34 and
the latest LTSI fixes up to [36a9caf 2 more fixes added].

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 50cf953..65ebc46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.28"
+LINUX_VERSION ?= "3.4.34"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3d56b103cd7072d520c395194e620aba2f6e52e3"
-SRCREV_machine_qemuppc ?= "09178bc8825d6fb66ddcb1785f20a022c4ba2efd"
-SRCREV_meta ?= "c0b1845314cebb21694dbb4459fcc6f80feb01d0"
+SRCREV_machine ?= "96730f882e5b3f60d259ef41ed7c18c95512194a"
+SRCREV_machine_qemuppc ?= "9a013a2a1facf949d9f8cc1b2a291651235c75ea"
+SRCREV_meta ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 35edbd4..6c37b57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.28"
+LINUX_VERSION ?= "3.4.34"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
-SRCREV_meta ?= "c0b1845314cebb21694dbb4459fcc6f80feb01d0"
+SRCREV_machine ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+SRCREV_meta ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index ca43944..702008c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "a720acacc415b3323a3ee9076bf9a621a964af2f"
-SRCREV_machine_qemumips  ?= "7d9f14326db1e602b4408f295bef7d12fd07dd55"
-SRCREV_machine_qemuppc ?= "62d3cb6a8e048c4833a5501bea2f35998de0b89d"
-SRCREV_machine_qemux86 ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
-SRCREV_machine_qemux86-64 ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
-SRCREV_machine ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
-SRCREV_meta ?= "c0b1845314cebb21694dbb4459fcc6f80feb01d0"
+SRCREV_machine_qemuarm ?= "c7cc288f0113433bd51d4958d36d4ef4bf13c214"
+SRCREV_machine_qemumips  ?= "d4f5af54aa6a3592c6b2656ef20ea98bee14fde9"
+SRCREV_machine_qemuppc ?= "8afd98bd2aae1ad86b97d4333107408745518f8d"
+SRCREV_machine_qemux86 ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+SRCREV_machine_qemux86-64 ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+SRCREV_machine ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+SRCREV_meta ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.28"
+LINUX_VERSION ?= "3.4.34"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



