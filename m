Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TB8eo-0004bK-Lc
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 20:24:27 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8AIBqbv007192;
	Mon, 10 Sep 2012 11:11:53 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 10 Sep 2012 14:11:41 -0400
Message-Id: <cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347300360.git.bruce.ashfield@windriver.com>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347300360.git.bruce.ashfield@windriver.com>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
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
X-List-Received-Date: Mon, 10 Sep 2012 18:24:27 -0000

Updating to 3.4.10 which has been soaking for a bit now, as well
as picking up the following meta commits from Tom Z:

  a82db2f meta: have systemtap use kprobes and uprobes feature
  d5d5b80 meta: add kprobes support to ktypes/standard
  b32d373 meta: add kprobes feature
  d40ed99 meta: have uprobe feature use uprobe.cfg
  a69d1db meta: add uprobe.cfg

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index b2620ea..3b36378 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.9"
+LINUX_VERSION ?= "3.4.10"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "9032b1e9daf5b4396f939981c3be95f67802d18c"
-SRCREV_machine_qemuppc ?= "08ce190232f89303772b6591ca7daaf2820eb74e"
-SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
+SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
+SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
+SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 06bcb9a..7258cba 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d"
-SRCREV_machine_qemumips  ?= "ba0e336d4527080233c3c410989d4f351529ee4e"
-SRCREV_machine_qemuppc ?= "e82b8a111430e3820b11f507863c4b8e8734ed8e"
-SRCREV_machine_qemux86 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
-SRCREV_machine_qemux86-64 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
-SRCREV_machine ?= "0985844fa6235422c67ef269952fa4e765f252f9"
-SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
+SRCREV_machine_qemuarm ?= "b15e7b1e9b58b9863bd87778775f86cd8d8880ea"
+SRCREV_machine_qemumips  ?= "8d5b98f263b5119af2dc30223f311be17173bab9"
+SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
+SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
+SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
+SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
+SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.9"
+LINUX_VERSION ?= "3.4.10"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



