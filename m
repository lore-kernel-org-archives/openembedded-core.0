Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxqw-0004L2-T7
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752118"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:43 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:18:51 -0800
Message-Id: <0d91d4dc6618b453ebcd0c357fd15ce4e28f1341.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 005/113] linux-yocto: update hardware reference boards to 3.0.12
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:07 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the meta SRCREV to pickup 3.0.12 support for the remaining
non-x86 boards (routerstation and pandaboard).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index b854ab5..81d22d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "6e96ccbbf19a4a7b67d98fdcd74d2c9da2c7c463"
 SRCREV_machine_qemuppc ?= "8ea61de7fd201ff0001a039f2fda8ec2e4a562a1"
-SRCREV_meta ?= "44ce39d43d1c7f98ab7aaa01c1bdf87498fb2253"
+SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index cc1fe83..b650c84 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "7ecece328c5987112de2959f8f998dfcedaf7210"
 SRCREV_machine_qemux86 ?= "a611ba462ac51b2bfdac1c5c6538dac95ad9b4dd"
 SRCREV_machine_qemux86-64 ?= "b15a9b67089e31ef9780fdbd0481f48ef7facdba"
 SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
-SRCREV_meta ?= "44ce39d43d1c7f98ab7aaa01c1bdf87498fb2253"
+SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6.4



