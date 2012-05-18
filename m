Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAe-0000XG-RD
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583556"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:15 +0300
Message-Id: <6f28cc98875e09743dddd786cfe065a53cbce8f2.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 5/9] linux-yocto: intel BSP config changes
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
X-List-Received-Date: Fri, 18 May 2012 14:28:45 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the meta SRCREV for the following fixes:

   1dfd60f meta/fishriver: move smp options from recipe-space
   012780a meta/emenlow: move smp options from recipe-space
   b59b1a5 meta/crownbay: move smp options from recipe-space
   74dc6ac meta/sugarbay: remove boot-live options
   a4bedcb meta/jasperforest: remove boot-live options
   4ae7b81 meta/sugarbay: use usb features
   30e7e8c meta/jasperforest: use usb features
   22d0c5d meta/fishriver: use usb features
   e262965 meta/emenlow: use usb features

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 8ec366c..4a1101e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -18,7 +18,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "3ebf4d172cf4a41d2abf09e4036f0850e08064e7"
 SRCREV_machine_qemuppc ?= "7cebfe717987f4ffa9ae90558c28f45049847c1c"
-SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
+SRCREV_meta ?= "1dfd60fa1250259eed38ae5b2840eb37e3758a1b"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 27de229..5d6450e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -12,7 +12,7 @@ KCONFIG_MODE = "--allnoconfig"
 LINUX_VERSION ?= "3.2.11"
 
 SRCREV_machine ?= "61960ba8e910d54b5525d5e9b6a7469bc399c246"
-SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
+SRCREV_meta ?= "1dfd60fa1250259eed38ae5b2840eb37e3758a1b"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 71290bd..cdd59f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "cf3e188cf2a18c48a0e6f9ca54c36e6ac39512ec"
 SRCREV_machine_qemux86 ?= "46f1007ad22b6790224c66a8dc4e80fdbd21eea1"
 SRCREV_machine_qemux86-64 ?= "00e5ec2393bada6723bd9a07ded3d001c02fa727"
 SRCREV_machine ?= "f4f8ba730e7783e09413872414d0a17c142c816d"
-SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
+SRCREV_meta ?= "1dfd60fa1250259eed38ae5b2840eb37e3758a1b"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.7.6



