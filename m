Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1ru-0002ZG-N6
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:10:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2012 10:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99362153"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2012 10:02:36 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:21 +0800
Message-Id: <afe31057ec245232918623b57194a06563d5a2a1.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 16/18] strace: upgrade to 4.6
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
X-List-Received-Date: Sun, 22 Jan 2012 18:10:19 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{strace-4.5.20 => strace-4.6}/sigmask.patch    |    0
 .../strace/{strace_4.5.20.bb => strace_4.6.bb}     |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/strace/{strace-4.5.20 => strace-4.6}/sigmask.patch (100%)
 rename meta/recipes-devtools/strace/{strace_4.5.20.bb => strace_4.6.bb} (67%)

diff --git a/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch b/meta/recipes-devtools/strace/strace-4.6/sigmask.patch
similarity index 100%
rename from meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
rename to meta/recipes-devtools/strace/strace-4.6/sigmask.patch
diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.6.bb
similarity index 67%
rename from meta/recipes-devtools/strace/strace_4.5.20.bb
rename to meta/recipes-devtools/strace/strace_4.6.bb
index 53df067..05f6d95 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.6.bb
@@ -3,18 +3,18 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
-PR = "r2"
+PR = "r0"
 
 PACKAGES =+ "${PN}-graph "
 FILES_${PN}-graph = "${bindir}/strace-graph"
 RDEPENDS_${PN}-graph = "perl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://sigmask.patch \
           "
 
-SRC_URI[md5sum] = "64dfe10d9db0c1e34030891695ffca4b"
-SRC_URI[sha256sum] = "ea8c059369eaa5ad90b246f34eab247d0ee48bfdee2670c7196320a4669ccabd"
+SRC_URI[md5sum] = "e537b2b1afeec70c0e6e27a0d0fd671e"
+SRC_URI[sha256sum] = "9ef9aa41b6118578e33ef4833b8a04209d6cc062546c28efd715f283b172c28a"
 inherit autotools
 
 export INCLUDES = "-I. -I./linux"
-- 
1.7.6



