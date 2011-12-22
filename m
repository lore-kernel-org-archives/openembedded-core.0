Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc0-0005NF-Ai
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233752"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:15 -0800
Message-Id: <9917aca0a559453dee6fd7c544e3cf54333215cb.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/26] libsync: move to git.yoctoproject.org
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:48 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

* Repositories on svn.o-hand.com have been converted to Git and are now
  hosted on git.yoctoproject.org.
* Set LICENSE to LGPLv2 as there is an LGPLv2 COPYING file but no notice
  with "or later" in the source code

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../opensync/{libsync_svn.bb => libsync_git.bb}    |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-demoapps/recipes-connectivity/opensync/{libsync_svn.bb => libsync_git.bb} (72%)

diff --git a/meta-demoapps/recipes-connectivity/opensync/libsync_svn.bb b/meta-demoapps/recipes-connectivity/opensync/libsync_git.bb
similarity index 72%
rename from meta-demoapps/recipes-connectivity/opensync/libsync_svn.bb
rename to meta-demoapps/recipes-connectivity/opensync/libsync_git.bb
index 34115ff..4986206 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libsync_svn.bb
+++ b/meta-demoapps/recipes-connectivity/opensync/libsync_git.bb
@@ -1,16 +1,17 @@
 SUMMARY = "GObject-based sync library"
 DESCRIPTION = "LibSync is a GObject-based framework for more convenient use of \
 OpenSync in GLib applications."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2"
 SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ libglade libopensync avahi"
 RRECOMMENDS_${PN} = "\
 	libopensync-plugin-file \
 	"
-PV = "0.0+svnr${SRCPV}"
-PR = "r1"
+SRCREV = "3f375969d56028505db97cd25ef1679a167cfc59"
+PV = "0.0+gitr${SRCPV}"
+PR = "r2"
 
-SRC_URI = "svn://svn.o-hand.com/repos/sync/trunk;module=sync;proto=http"
+SRC_URI = "git://git.yoctoproject.org/sync;protocol=git"
 
 inherit autotools pkgconfig
 
-- 
1.7.6.4



