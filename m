Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3e-0004Xl-H9
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:30:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897565"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:03 -0700
Message-Id: <87948ec75a095598042b48b9a233af7368ea4f11.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/28] linux-yocto/3.4: 3.4.6 and 3.4.x-rt14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 07:30:58 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the 3.4 kernel to the latest -stable release and updating preempt-rt
to 3.4.4-rt14.

Tested on qemu*

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 97a1a19..3e7952d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.4"
+LINUX_VERSION ?= "3.4.6"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "b25f7c9730e3bd3be1bf7b7982251b7459ad6579"
-SRCREV_machine_qemuppc ?= "2777125ab6f92b624ecaf11d6b1ab604e64497a8"
-SRCREV_meta ?= "949fddda61053cc15e46c015e8f7db17e7b33360"
+SRCREV_machine ?= "2d008a6dcbf565878cee14c5f050eca53897316f"
+SRCREV_machine_qemuppc ?= "94d25f958b6dfb1e8009a0feea7ab4c9a8f54a99"
+SRCREV_meta ?= "d7a96809a585e06933d8c08adb9b9f66b21efb4c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index f031e1b..f3867f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,17 +10,17 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "9aca8fec49787efbe44d0f137f31ee59edd94c49"
-SRCREV_machine_qemumips  ?= "23fa942849b1207dbfc4528e2a5c8df0fd71870c"
-SRCREV_machine_qemuppc ?= "08732f25bc3cb404e29ae201074bcf5c1661ea83"
-SRCREV_machine_qemux86 ?= "6297e4c1d57e1063bfce297c2e12392348598559"
-SRCREV_machine_qemux86-64 ?= "6297e4c1d57e1063bfce297c2e12392348598559"
-SRCREV_machine ?= "6297e4c1d57e1063bfce297c2e12392348598559"
-SRCREV_meta ?= "949fddda61053cc15e46c015e8f7db17e7b33360"
+SRCREV_machine_qemuarm ?= "b57548a29e44655e27cfbdf3a0642d682401b835"
+SRCREV_machine_qemumips  ?= "633d487b0f6e5d328400b47f0d69d9dac7354c84"
+SRCREV_machine_qemuppc ?= "6229fc0f62283e0dc9f8b5d2be01b048a92867f3"
+SRCREV_machine_qemux86 ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
+SRCREV_machine_qemux86-64 ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
+SRCREV_machine ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
+SRCREV_meta ?= "d7a96809a585e06933d8c08adb9b9f66b21efb4c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.4"
+LINUX_VERSION ?= "3.4.6"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.7.6



