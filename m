Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvo-0003cc-8S
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714856"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:14 -0800
Message-Id: <2944bdfb77b5aaf63a6946e80324c7f8f562b4bb.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/20] linux-yocto/meta: fix incorrect config references
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:13 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the meta SRCREV to pickup the following fixes:

  a9ffedb meta/fri2/sys940x: fix incorrect cfg includes
  3d1a678 meta/sys940x: fix incorrect emgd branch merge

During the merge of the 3.0 BSPs forward to 3.2, a few moved config
fragments were missed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index efb1bc9..872289f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "3652b606f1ab7769a7ecc86c70d22db4ef99fb2a"
 SRCREV_machine_qemuppc ?= "0c8f5214bc15699b41369751cdecea45f717c79c"
-SRCREV_meta ?= "fa83c7b0b47d1aa3e25594ddbcd125a1108d3aaa"
+SRCREV_meta ?= "a9ffedb3d7ed7a1da79d8b46b36518865f7ae4d0"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 2d2542a..6da16c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "74364f1062a219eb242d7cb300a404516c297601"
 SRCREV_machine_qemux86 ?= "ea0a62d6821aede782c2b9457639f1ca7f2ddc07"
 SRCREV_machine_qemux86-64 ?= "626165edf65281d9b933a6129e935c7a73ab63a7"
 SRCREV_machine ?= "6f164ae4ef5aeec2bef40a1b936ac1f9b9db46ba"
-SRCREV_meta ?= "fa83c7b0b47d1aa3e25594ddbcd125a1108d3aaa"
+SRCREV_meta ?= "a9ffedb3d7ed7a1da79d8b46b36518865f7ae4d0"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.7.6



