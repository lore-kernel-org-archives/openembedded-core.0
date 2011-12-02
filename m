Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8s-0002b8-EW
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189780"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:45 -0800
Message-Id: <f2b589ed6e4f475ef66c8135d472a132d783325e.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/18] linux-yocto: v3.0.9 + enhancements
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:42 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the branch SRCREVs to pickup:

 - The kernel.org -stable update to v3.0.9 is available and merged into
   all BSP / kernel branches.
 - Darren Hart's cleanups to the mount root patch.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index ed93fbe..85c8e39 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.8"
-
-SRCREV_machine_qemuarm ?= "d2f4973505e9cebcf2fc0058434214927deed5e6"
-SRCREV_machine_qemumips ?= "42968ceaecd71ae57157676aa63542db409732cb"
-SRCREV_machine_qemuppc ?= "16eb6506148ff163cfc4f4516110275726831014"
-SRCREV_machine_qemux86 ?= "fea3842615c13a54180b6600783b222f499002ef"
-SRCREV_machine_qemux86-64 ?= "5f86f8f0a3102e1c7d0164abefcd50d825aa468f"
-SRCREV_machine ?= "a811486d28dd9b0e1af0672a65ad9fa97873b82a"
-SRCREV_meta ?= "ae3e64c077972fe87f09946bd215620df68ca327"
+LINUX_VERSION ?= "3.0.9"
+
+SRCREV_machine_qemuarm ?= "774710abff369c063226452de2114403e0bbff9f"
+SRCREV_machine_qemumips ?= "a558a07a706756cd83199146c89c2677d9f14364"
+SRCREV_machine_qemuppc ?= "d06082c227f12f62b9ce9e3823f8b7d2ad055880"
+SRCREV_machine_qemux86 ?= "a231348953ce9f1bc2f520b2fe6806337efccfa8"
+SRCREV_machine_qemux86-64 ?= "08db6e4d159a26a4caf06258b1d7dbd17e6ebe26"
+SRCREV_machine ?= "5c974770213858c380599a0fb743f24ffb619d62"
+SRCREV_meta ?= "74665003a89510fb5bd4e29e81d568d72eede08c"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6.4



