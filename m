Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmh-0004Xg-78
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551607"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:15 -0700
Message-Id: <abbad3e5e799c7cda5543a48d68fdd0a7a642b96.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 04/14] autoconf: remove emacs mode files to fix warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:15 -0000

WARNING: For recipe autoconf, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/emacs
WARNING:   /usr/share/emacs/site-lisp
WARNING:   /usr/share/emacs/site-lisp/autotest-mode.elc
WARNING:   /usr/share/emacs/site-lisp/autotest-mode.el
WARNING:   /usr/share/emacs/site-lisp/autoconf-mode.el
WARNING:   /usr/share/emacs/site-lisp/autoconf-mode.elc
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |    4 ++++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index e7ae339..80a5d92 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -16,3 +16,7 @@ SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
 	   file://program_prefix.patch"
 
 inherit autotools
+
+do_install_append() {
+	rm -rf ${D}${datadir}/emacs
+} 
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 63db7d1..f1b506a 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r5"
+PR = "r6"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.7.6



