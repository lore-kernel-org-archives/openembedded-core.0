Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHX-00032W-Q3
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397473"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:21 -0700
Message-Id: <dc4a0b905b7e35c1a04b1ca44fa31d7eb3cda208.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
Subject: [PATCH 09/11] texi2html: fix packages warning
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:16 -0000

Add documentation to the -docs package

WARNING: For recipe texi2html, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/texinfo
WARNING:   /usr/share/texinfo/html
WARNING:   /usr/share/texinfo/init
WARNING:   /usr/share/texinfo/html/texi2html.html
WARNING:   /usr/share/texinfo/init/html32.init
WARNING:   /usr/share/texinfo/init/tex4ht.init
WARNING:   /usr/share/texinfo/init/mediawiki.init
WARNING:   /usr/share/texinfo/init/book.init
WARNING:   /usr/share/texinfo/init/chm.init
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/texi2html/texi2html_5.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index 02f3fe1..ac83671 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -4,7 +4,7 @@ SECTION     = "console/utils"
 LICENSE     = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.tar.bz2 \
                file://fix_gettext_version.patch"
@@ -23,3 +23,5 @@ do_configure_append() {
 	# Clean up the phony po directory
 	rm -rf ${S}/po
 }
+
+FILE_${PN}-doc += "${datadir}/texinfo"
-- 
1.7.7.6



