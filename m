Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1SCHSp-00075B-BU
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 23:28:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2012 14:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125347765"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 14:19:14 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 14:31:12 -0700
Message-Id: <9869c8a2ce084da47f0e24a38c086ba006aca9ba.1332796964.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332796964.git.jessica.zhang@intel.com>
References: <cover.1332796964.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1332796964.git.jessica.zhang@intel.com>
References: <cover.1332796964.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] Fix empty file case that caused build error at do_rootfs
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
X-List-Received-Date: Mon, 26 Mar 2012 21:28:31 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e83fc55..8c8d967 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -446,7 +446,7 @@ package_install_internal_rpm () {
 	outfile=${target_rootfs}/install/total_solution.manifest
 	cat $infile | grep /base-passwd-[0-9] > $outfile || true
 	cat $infile | grep /shadow-[0-9] >> $outfile || true
-	cat $infile | grep -v /shadow-[0-9] | grep -v /base-passwd-[0-9] >> $outfile
+	cat $infile | grep -v /shadow-[0-9] | grep -v /base-passwd-[0-9] >> $outfile || true
 	cat ${target_rootfs}/install/install_multilib_solution.manifest >> ${target_rootfs}/install/total_solution.manifest
 
 	# Construct install scriptlet wrapper
-- 
1.7.0.4



