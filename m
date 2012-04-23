Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SMGVM-00061f-JQ
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 12:28:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Apr 2012 03:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144792269"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2012 03:18:50 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2012 18:10:43 +0800
Message-Id: <6800a5197769ac48bdcb8678d51382924ce7ded2.1335175751.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1335175751.git.lianhao.lu@intel.com>
References: <cover.1335175751.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] pseudo: PR bump.
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
X-List-Received-Date: Mon, 23 Apr 2012 10:28:25 -0000

Bump PR value due to the commit
c6c701f424aeb502d20ff02d02712e56f4e259a5.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.3.bb |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
index b16b2d9..187b46d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5771295..1852fab 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,7 @@ require pseudo.inc
 
 SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
 PV = "1.3+git${SRCPV}"
-PR = "r24"
+PR = "r25"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



