Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVU-0003fA-3N
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:52:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940414"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:44:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:44:06 +0000
Message-Id: <4830a14f4b22de0ad7aedcb51877f58d5e5e9c80.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/8] libsync: move to git.yoctoproject.org
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
X-List-Received-Date: Mon, 19 Dec 2011 15:52:04 -0000

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
1.7.5.4



