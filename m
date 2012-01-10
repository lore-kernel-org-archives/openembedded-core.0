Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUml-00042N-2F
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535267"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:14 -0800
Message-Id: <911a3ac9a58d1d5e709cff776ecd1ab507642006.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/22] task-core-tools: adapt to kexec-tools package split
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
X-List-Received-Date: Tue, 10 Jan 2012 06:04:36 -0000

From: Andrea Adami <andrea.adami@gmail.com>

* The recipe packages now kexec and kdump separately.
* For standard purposes only kexec is needed.
* Bump PR.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 6632b4f..1a42f15 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r14"
+PR = "r15"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -25,7 +25,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY = "1"
 
 # kexec-tools doesn't work on Mips
-KEXECTOOLS ?= "kexec-tools"
+KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
 KEXECTOOLS_mipsel ?= ""
 KEXECTOOLS_powerpc ?= ""
-- 
1.7.6.5



