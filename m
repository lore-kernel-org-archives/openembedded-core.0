Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Rvhah-0005lC-JA
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 04:56:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Feb 2012 19:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105938338"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2012 19:47:59 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 11:47:39 +0800
Message-Id: <0edd928e521c2b04fde4d28de4bac2d53bd39dd9.1328845545.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1328845545.git.lianhao.lu@intel.com>
References: <cover.1328845545.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] gcc: Ensure same sstate hashes for shared soruce directory
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
X-List-Received-Date: Fri, 10 Feb 2012 03:56:08 -0000

Ensure do_patch have the same sstate hashes for nativesdk variants of
gcc family recipes, since they share the same source directory.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index e89a7c0..57668f9 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -109,3 +109,4 @@ do_headerfix[vardepvalue] = "PATH"
 # We need to ensure that for the shared work directory, the do_patch singatures match
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] = "WORKDIR"
+should_apply[vardepsexclude] = "PN"
-- 
1.7.0.4



