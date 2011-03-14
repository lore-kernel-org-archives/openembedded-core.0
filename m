Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Pz6Vw-00054D-T0
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 13:04:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2011 05:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,315,1297065600"; d="scan'208";a="402241505"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2011 05:01:41 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Pz6MI-0005G6-Be; Mon, 14 Mar 2011 19:54:46 +0800
Message-Id: <23db1b5c70588abf7a966a02bb02d1687fa65952.1300103431.git.qing.he@intel.com>
In-Reply-To: <cover.1300103431.git.qing.he@intel.com>
References: <cover.1300103431.git.qing.he@intel.com>
Old-Date: Fri, 11 Mar 2011 18:36:22 +0800
Date: Mon, 14 Mar 2011 19:54:46 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 4/4] qemux86-64: set qemux86_64 as package arch name
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
X-List-Received-Date: Mon, 14 Mar 2011 12:04:46 -0000

From: Qing He <qing.he@intel.com>

thus allows rpmbuild to generated RPMs with the right architecture.

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cf99a81..42b9825 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -93,7 +93,8 @@ SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('BASE_PACKAGE_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))]}"
-PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
+MACHINE_ARCH_qemux86-64 = "qemux86_64"
+PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE shouldn't be included here as a variable dependency since machine specific 
 # packages are handled using multimachine
 PACKAGE_ARCHS[vardepsexclude] = "MACHINE"
-- 
1.7.0



