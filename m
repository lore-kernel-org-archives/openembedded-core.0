Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtE-0001A9-3a
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269338"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:22 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:16 +0300
Message-Id: <c97d38258e13f028d152f349fd3db377c360ddfa.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 1/9] automake: upgrade to 1.12.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 16:52:44 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{automake_1.12.1.bb => automake_1.12.3.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.1.bb => automake_1.12.3.bb} (92%)

diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/recipes-devtools/automake/automake_1.12.3.bb
similarity index 92%
rename from meta/recipes-devtools/automake/automake_1.12.1.bb
rename to meta/recipes-devtools/automake/automake_1.12.3.bb
index 700592c..25069d7 100644
--- a/meta/recipes-devtools/automake/automake_1.12.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
@@ -39,10 +39,10 @@ SRC_URI += "${PATHFIXPATCH} \
 	    file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
-SRC_URI[md5sum] = "ec25c1855cacf47e4bdee76a776b96ba"
-SRC_URI[sha256sum] = "24bf1640679ba4a9cbe2d36422f39a81eced7f556b576a7a2ccfc70ca85a1e2f"
+SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
+SRC_URI[sha256sum] = "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae05c93730cdda9a5a0"
 
-PR = "r1"
+PR = "r0"
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
-- 
1.7.9.5



