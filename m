Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rV-0005ws-Ki
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250249"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:27:02 -0700
Message-Id: <9d70a72f5ab24bc0424f11311c8eb6b19f3d2987.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/27] texi2html: Added recipe from OE
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:34 -0000

Needed to build oe-core with oe-core

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/texi2html/texi2html_1.82.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/texi2html/texi2html_1.82.bb

diff --git a/meta/recipes-extended/texi2html/texi2html_1.82.bb b/meta/recipes-extended/texi2html/texi2html_1.82.bb
new file mode 100644
index 0000000..f19b576
--- /dev/null
+++ b/meta/recipes-extended/texi2html/texi2html_1.82.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Perl script that converts Texinfo to HTML"
+HOMEPAGE    = "http://www.nongnu.org/texi2html/"
+SECTION     = "console/utils"
+LICENSE     = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PR = "r0"
+
+SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2"
+
+SRC_URI[md5sum] = "a8a9193c0ac1bec2f3ca7be40a5a82eb"
+SRC_URI[sha256sum] = "d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a0a3bef9b588b4f1"
+
+inherit autotools
-- 
1.7.6.4



