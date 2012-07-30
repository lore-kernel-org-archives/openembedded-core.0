Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Svq4w-0003nK-7w
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 15:32:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2012 06:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173147090"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 06:20:11 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 16:22:24 +0300
Message-Id: <1343654544-30443-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] subversion build fix
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
X-List-Received-Date: Mon, 30 Jul 2012 13:32:10 -0000

subversion needs an explicit dependency on sqlite3, otherwise it
does not build. Tested by building core-image-minimal.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../subversion/subversion_1.7.2.bb                 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
index ced1b0c..4f71de5 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "The Subversion (svn) client"
 SECTION = "console/network"
-DEPENDS = "apr-util neon"
+DEPENDS = "apr-util neon sqlite3"
 RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
-- 
1.7.9.5



