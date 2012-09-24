Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TGFQp-0008W7-AF
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:39:07 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8OKQGrx000055;
	Mon, 24 Sep 2012 13:26:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 24 Sep 2012 16:25:45 -0400
Message-Id: <59fa30340aa4f8cce04ca7043ad227137a4da652.1348518160.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348518160.git.bruce.ashfield@windriver.com>
References: <cover.1348518160.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1348518160.git.bruce.ashfield@windriver.com>
References: <cover.1348518160.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/3.4: update kver to v3.4.11
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
X-List-Received-Date: Mon, 24 Sep 2012 20:39:07 -0000

Updating the machine and meta SRCREVs to the latest 3.4.x -stable
release.

See git whatchanged v3.4.10..v3.4.11 for the full changelog.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 5a26055..ccc06f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.10"
+LINUX_VERSION ?= "3.4.11"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "dcecefa43e05f5450886648a93e2fda2ec35e2dc"
-SRCREV_machine_qemuppc ?= "5e8709c4777f07a12b0a05a22f0864f552ef9449"
-SRCREV_meta ?= "c5bddf8ea379406ffec550528e17b777a0eba24b"
+SRCREV_machine ?= "6d7122966eaae849ba3f2e1ccb94cdab17a46fbd"
+SRCREV_machine_qemuppc ?= "8b2acbc859c616dfcad79f786bacb856f370f4c2"
+SRCREV_meta ?= "3086a24972b0290156fb7993b659b91872388a4a"
 
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 364b702..a59a7c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "679978b4fd1ef8cfea97d4ee4b4cd7c51bc62ee2"
-SRCREV_machine_qemumips  ?= "9c7810609ff37a77e8d39680f98f1baefee18a80"
-SRCREV_machine_qemuppc ?= "cf4bad14983753ad4b592c40fb36466b202b24a4"
-SRCREV_machine_qemux86 ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
-SRCREV_machine_qemux86-64 ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
-SRCREV_machine ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
-SRCREV_meta ?= "c5bddf8ea379406ffec550528e17b777a0eba24b"
+SRCREV_machine_qemuarm ?= "8f05f1d8adbf1551a80225049dd381ffbb64a6c5"
+SRCREV_machine_qemumips  ?= "fb23a2ed7b94548b1736fdb55efb26f88bc5c171"
+SRCREV_machine_qemuppc ?= "cdecf5940d81330680ce1517a7bc101556792e71"
+SRCREV_machine_qemux86 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_machine_qemux86-64 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_meta ?= "3086a24972b0290156fb7993b659b91872388a4a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.10"
+LINUX_VERSION ?= "3.4.11"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



