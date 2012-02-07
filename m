Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvP-0004HK-JX
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206422"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:41 -0800
Message-Id: <aa6293ffbc7f8f17e55f2105de56384e14591b44.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/35] linux-yocto: fri2: use emgd-1.10
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:13 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating meta for the following change:

[
    fri2: use emgd-1.10

    Use the yocto/emgd-1.10 branch in place of yocto/emgd.
]

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index d7e4e7a..b947a48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "2f9d925f5681eaae7f341cc1270c739e8b329c03"
 SRCREV_machine_qemuppc ?= "c66f7ef2315010756c8c97af6b13d52f9f18c03b"
-SRCREV_meta ?= "70e86dc937a40c0dc7c84549de0e86bb09f12da3"
+SRCREV_meta ?= "b78a519841bd8b477cad599af8d38df6760445c1"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 67f8da1..44a9fe4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "15fd748017f0849138ff4b47d73f6866fa26cfe8"
 SRCREV_machine_qemux86 ?= "8f74a4339b3dc029fafff0ba7d88d6dc950d4b31"
 SRCREV_machine_qemux86-64 ?= "610c5a62daeda033755b0b7bfcb3e2cad5c76f3f"
 SRCREV_machine ?= "5df0b4c2538399aed543133b3855f809adf08ab8"
-SRCREV_meta ?= "70e86dc937a40c0dc7c84549de0e86bb09f12da3"
+SRCREV_meta ?= "b78a519841bd8b477cad599af8d38df6760445c1"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6.5



