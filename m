Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QHGFL-0004Xi-Td
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 16:06:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2011 07:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,309,1301900400"; d="scan'208";a="917317574"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2011 07:04:00 -0700
Message-Id: <21793f72bc1ecc0e70ee3632bdb58f09a37d58e0.1304431099.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1304431099.git.dexuan.cui@intel.com>
References: <cover.1304431099.git.dexuan.cui@intel.com>
Old-Date: Tue, 3 May 2011 21:28:59 +0800
Date: Tue, 03 May 2011 22:01:33 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 1/2] task-core-tools.bb: properly enable lttng-ust for ARM
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
X-List-Received-Date: Tue, 03 May 2011 14:06:40 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fixes [YOCTO #856]

Commit 320a641df18024265c3d2b3b08251a231f9fd6a0 omitted the line when being
merged into master branch.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 9b2a4ce..b2bf5ef 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r9"
+PR = "r10"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -63,6 +63,7 @@ RRECOMMENDS_task-core-tools-profile = "\
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust systemtap"
+RDEPENDS_task-core-tools-profile_append_qemuarm = " lttng-ust"
 RDEPENDS_task-core-tools-profile_append_emenlow = " lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_atom-pc = " lttng-ust systemtap"
 
-- 
1.7.2



