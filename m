Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RgdXc-0001so-RN
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:34:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Dec 2011 06:27:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90859193"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 30 Dec 2011 06:27:23 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:14 +0800
Message-Id: <bade790e15458c9346b9adee49b9179a299261a7.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 13/14] puzzles: upgrade to r9375.
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
X-List-Received-Date: Fri, 30 Dec 2011 14:34:41 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../puzzles/{puzzles_r9306.bb => puzzles_r9375.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/puzzles/{puzzles_r9306.bb => puzzles_r9375.bb} (91%)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9306.bb b/meta/recipes-sato/puzzles/puzzles_r9375.bb
similarity index 91%
rename from meta/recipes-sato/puzzles/puzzles_r9306.bb
rename to meta/recipes-sato/puzzles/puzzles_r9375.bb
index 14b0461..aec6399 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9306.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9375.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 
 DEPENDS = "gtk+ libxt"
-PR = "r1"
+PR = "r0"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
 
 LICENSE = "MIT"
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=9928b60f3b78be315b7ab699c1b03ff5"
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
 SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-SRC_URI[md5sum] = "fd1b05c0e0cfb752c6136ce2e4562416"
-SRC_URI[sha256sum] = "512aa26a0d11867a815030449bb903861f75512725886a70eece387bd8240ddd"
+SRC_URI[md5sum] = "35e85cefb59d39cd22bf232673857727"
+SRC_URI[sha256sum] = "ae94dc8a654582c0cab61ce4699e25027ed720c06b411e5202144a5114fd338b"
 
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.6



